Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5166B5703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 22:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfIQUds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 16:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:45956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbfIQUdr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 16:33:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04BE32054F;
        Tue, 17 Sep 2019 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568752427;
        bh=OCmjyJeaqRLek0C4FKcAxnbTQ4/wO6fYl5ArFt32PpI=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=MSmLNetlce/Df7YgxgYUktpoBZJ1RKBUfvCLfNmM3GpOMWde2dL5OqPJK066flD8V
         /TwYo+q9WPUIdymQvuNaP37AoI20J08j4lli+TQpWRt5iRSHAbIb1GuHBHEt31QynS
         h6CjDWHSyuALB1Wql/R+AtNRWUzaQMU2S9z+0xak=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190913024029.2640-1-bjorn.andersson@linaro.org>
References: <20190913024029.2640-1-bjorn.andersson@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Make clk_bulk_get_all() return a valid "id"
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 13:33:46 -0700
Message-Id: <20190917203347.04BE32054F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-09-12 19:40:29)
> The adreno driver expects the "id" field of the returned clk_bulk_data
> to be filled in with strings from the clock-names property.
>=20
> But due to the use of kmalloc_array() in of_clk_bulk_get_all() it
> receives a list of bogus pointers instead.
>=20
> Zero-initialize the "id" field and attempt to populate with strings from
> the clock-names property to resolve both these issues.
>=20
> Fixes: 616e45df7c4a ("clk: add new APIs to operate on all available clock=
s")
> Fixes: 8e3e791d20d2 ("drm/msm: Use generic bulk clock function")
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

And now I see that this whole thing needs to be inlined to the one call
site and should use the struct device instead of calling of_clk_get()...
I'll have to fix it later.

