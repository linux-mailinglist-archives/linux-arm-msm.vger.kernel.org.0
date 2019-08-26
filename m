Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C2B9D822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfHZVYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 17:24:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727646AbfHZVYR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 17:24:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABD3521848;
        Mon, 26 Aug 2019 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566854655;
        bh=7ag3qSHELurKC8BHo1sm6KhvINW0pll6GeIjp2vLyF8=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=eYE0M8qOOOKuinBRZV4EgaFRj0w68M6WpbjBgPhh2I4Dj6cqAkYvxTYesFItIt73p
         eFqm+xf56HrKDtXkOFwniWgS/5uQ5r8NAwW+hQiUri9BzfdlCA2yXRhpC6iAFJ4Xz8
         YW1RQqhbw/mf4nLMfQvEQGSAS30mg5hBldKNrAh8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190821181009.00D6322D6D@mail.kernel.org>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org> <20190729224652.17291206E0@mail.kernel.org> <20190821181009.00D6322D6D@mail.kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 26 Aug 2019 14:24:14 -0700
Message-Id: <20190826212415.ABD3521848@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2019-08-21 11:10:08)
> Quoting Stephen Boyd (2019-07-29 15:46:51)
> > Quoting Bjorn Andersson (2019-07-22 22:14:46)
> > > As clocks are registered their parents are resolved and the parent_map
> > > is updated to cache the clk_core objects of each existing parent.
> > > But in the event of a clock being unregistered this cache will carry
> > > dangling pointers if not invalidated, so do this for all children of =
the
> > > clock being unregistered.
> > >=20
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >=20
> > > This resolves the issue seen where the DSI PLL (and it's provided clo=
cks) is
> > > being registered and unregistered multiple times due to probe deferra=
l.
> > >=20
> > > Marking it RFC because I don't fully understand the life of the clock=
 yet.
> >=20
> > The concept sounds sane but the implementation is going to be not much
> > fun. The problem is that a clk can be in many different parent caches,
> > even ones for clks that aren't currently parented to it. We would need
> > to walk the entire tree(s) and find anywhere that we've cached the
> > clk_core pointer and invalidate it. Maybe we can speed that up a little
> > bit by keeping a reference to the entry of each parent cache that is for
> > the parent we're removing, essentially holding an inverse cache, but I'm
> > not sure it will provide any benefit besides wasting space for this one
> > operation that we shouldn't be doing very often if at all.
> >=20
> > It certainly sounds easier to iterate through the whole tree and just
> > invalidate entries in all the caches under the prepare lock. We can
> > optimize it later.
>=20
> Here's an attempt at the simple approach. There's another problem where
> the cached 'hw' member of the parent data is held around when we don't
> know when the caller has destroyed it. Not much else we can do for that
> though.
>=20
> ---8<---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..f42a803fb11a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3737,6 +3737,37 @@ static const struct clk_ops clk_nodrv_ops =3D {
>         .set_parent     =3D clk_nodrv_set_parent,
>  };
> =20
> +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
> +                                               struct clk_core *target)
> +{
> +       int i;
> +       struct clk_core *child;
> +
> +       if (!root)
> +               return;

I don't think we need this part. Child is always a valid pointer.

