Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802CD79C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 00:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfG2Wqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 18:46:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbfG2Wqx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 18:46:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17291206E0;
        Mon, 29 Jul 2019 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564440412;
        bh=GY1EN1STOR7H1ZBVfrAMZXmsjP1EwB9Atq7uO2OeVlA=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=f7OKjL/io6Y/ggE8sL7CVsY3b/PzM44zRDYckx4oFO0dOeDiC+Sk3H1nrcHVw0SdX
         R6b5QmzavXGLtjH3JTIzZALJBsiZ/18A4blXKrNF6tgzcg9C8uE2cfJyGAHc6c1oKM
         ut/tNM8e+hAyc9HLskUNrV5j0/qCbCnXBpcuh28A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190723051446.20013-1-bjorn.andersson@linaro.org>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
User-Agent: alot/0.8.1
Date:   Mon, 29 Jul 2019 15:46:51 -0700
Message-Id: <20190729224652.17291206E0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-07-22 22:14:46)
> As clocks are registered their parents are resolved and the parent_map
> is updated to cache the clk_core objects of each existing parent.
> But in the event of a clock being unregistered this cache will carry
> dangling pointers if not invalidated, so do this for all children of the
> clock being unregistered.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> This resolves the issue seen where the DSI PLL (and it's provided clocks)=
 is
> being registered and unregistered multiple times due to probe deferral.
>=20
> Marking it RFC because I don't fully understand the life of the clock yet.

The concept sounds sane but the implementation is going to be not much
fun. The problem is that a clk can be in many different parent caches,
even ones for clks that aren't currently parented to it. We would need
to walk the entire tree(s) and find anywhere that we've cached the
clk_core pointer and invalidate it. Maybe we can speed that up a little
bit by keeping a reference to the entry of each parent cache that is for
the parent we're removing, essentially holding an inverse cache, but I'm
not sure it will provide any benefit besides wasting space for this one
operation that we shouldn't be doing very often if at all.

It certainly sounds easier to iterate through the whole tree and just
invalidate entries in all the caches under the prepare lock. We can
optimize it later.

>=20
>  drivers/clk/clk.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..8cd1ad977c50 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2517,7 +2528,8 @@ int clk_set_parent(struct clk *clk, struct clk *par=
ent)
>                 clk_core_rate_unprotect(clk->core);
> =20
>         ret =3D clk_core_set_parent_nolock(clk->core,
> -                                        parent ? parent->core : NULL);
> +                                        parent ? parent->core : NULL,
> +                                        false);

Nitpick. I'd prefer another function to invalidate the cache of a clk
given another clk_core pointer.

> =20
>         if (clk->exclusive_count)
>                 clk_core_rate_protect(clk->core);
