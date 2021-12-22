Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8DE47D019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 11:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244210AbhLVKhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 05:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244208AbhLVKhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 05:37:01 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73BEC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 02:37:00 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so5415608pjj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 02:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBwaXNnQSWivoIpUpqJ2THr2W4AaaOSx8nauhWoHDzE=;
        b=FYpuN3haxvSOkvrbvlUzLTKvbLcwu2Lzk8RLyLVOahduPY+VV4fHXvzjcxE8ahsHNf
         Y4qy7BfKnLphLxcJbtkPrRL/3BRx8GRLVT60Bp4xyI1GIFkh87hQqKdhfAdAEIADBijH
         nIOoCBEAQIvzMCWuhWcz0Y3WOXfyxX86WDr6uBxNEXK5HKnLkNprfDr3HgeBRcl7P7ro
         dTr98/HpOpqGd9GrfgakSZbVLryZV9vsq24uitdB4b2BG9DUuLpF3qZeIVsbHy+H0491
         riw14nE7WKXp+Ei3zBsF+7+aFXGbWjgykolRYW47Z3Svu6uJqdaty2q38++YcLgVq05u
         TL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBwaXNnQSWivoIpUpqJ2THr2W4AaaOSx8nauhWoHDzE=;
        b=MWyrtyu3xSE7s1RUOUUly7yjkcKPhLB1uP3WVZ5j9Ypt5xaQYuh1B/mYufqdYHzvkf
         bs5zCXCP4ix6aUbkBmOhkm4DogFU/jOQAibHBwi7EawU6X0kpzWTJErLVX3rcyHjfNdY
         uoKtLAa8sjzB6XbXx3jORJWK/yYo1ruU+UPVRe9u0YqMVLXwWezi+Pa2xU0GsnfWnx9K
         UVUl/ftOXSzbli0d5lxQcRfUmpk7jxzcHvJtqDlIbZE4yiDfH2E3s0Cb2x3cDsNI6WSJ
         P1CKSehV9utd164M0oEU9uj3h74PfmKJlLElcyel7/7bBzgXiu4xJvEtt5M2NtzYFsN+
         u09g==
X-Gm-Message-State: AOAM530poRVCQZOpRzlvg6mu9JJy+z5YcV3vOsSdJj0U+MUaC37t7lS9
        ye9y3ZMmTcqcoqyNzhx0fy10BvX0C32P9mare49FUA==
X-Google-Smtp-Source: ABdhPJy62MHWbQBAsnjb0KzXd8rE0HxrIy3+ZZoH5Uaws33M2M9boyX9AppkwmV9rc2gMq4yh84H0COlnUKONBUuH4M=
X-Received: by 2002:a17:90a:740e:: with SMTP id a14mr635337pjg.40.1640169420035;
 Wed, 22 Dec 2021 02:37:00 -0800 (PST)
MIME-Version: 1.0
References: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org>
 <YcEUrtQuJ5CGF2RW@ripper> <CAMZdPi9g9x0Rn4YUwcLrZ5M23i3EzJOuUfh3MXFVM7pscQx5Tw@mail.gmail.com>
 <YcJvsEFXPPVI+GZi@ripper>
In-Reply-To: <YcJvsEFXPPVI+GZi@ripper>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 22 Dec 2021 11:48:27 +0100
Message-ID: <CAMZdPi_5ygZiWo53R2V=s3MHiYs=+ddAdvyzc1X7GtMcwmriYw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: CLK_OPS_PARENT_ENABLE flag for
 rcg2 clocks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mike Tipton <quic_mdtipton@quicinc.com>, agross@kernel.org,
        sboyd@kernel.org, shawn.guo@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, 22 Dec 2021 at 01:20, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> > > > When a rcg2 clock migrates to a new parent, both the old and new
> > > > parent clocks must be enabled to complete the transition. This can
> > > > be automatically performed by the clock core when a clock is flagged
> > > > with CLK_OPS_PARENT_ENABLE.
> > > >
> > > > Without this, we may hit rate update failures:
> > > > gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
> > > > WARNING: CPU: 1 PID: 82 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xe0/0xf0
> > > >
> > > > Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> > > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > > ---
> > > >  drivers/clk/qcom/gcc-qcm2290.c | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
> > > > index b6fa7b8..9e1d88e 100644
> > > > --- a/drivers/clk/qcom/gcc-qcm2290.c
> > > > +++ b/drivers/clk/qcom/gcc-qcm2290.c
> > > > @@ -674,6 +674,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
> > > >               .name = "gcc_usb30_prim_mock_utmi_clk_src",
> > > >               .parent_data = gcc_parents_0,
> > > >               .num_parents = ARRAY_SIZE(gcc_parents_0),
> > > > +             .flags = CLK_OPS_PARENT_ENABLE,
> > >
> > > This seems like a correct fix for the obvious problem that we might end
> > > up invoking clk_set_rate() and clk_set_parent() for these clocks while
> > > their (and thereby themselves - in a software sense) are disabled.
> > >
> > >
> > > However, clocks that downstream are marked "enable_safe_config", may in
> > > addition be enabled by the hardware, behind out back. As such we must
> > > ensure that they always have a valid configuration, we do this by
> > > "parking" them on CXO whenever we're going to disable their parent
> > > clocks.
> > >
> > > Upstream we handle this by using the clk_rcg2_shared_ops, which will do
> > > exactly this.
> >
> > Ok, thanks for the explanation, so we actually need both
> > clk_rcg2_shared_ops and CLK_OPS_PARENT_ENABLE, the former parking the
> > clock under always-on CXO (safe source), allowing hardware to toggle it
> > on its own. The latter allows safe parent switching by enabling the
> > new parent clock before update (and old parent, but we don't care
> > since we are actually parked on CXO) . Is that correct?
> >
>
> If a clock is parked and we get a request to change its rate, then the
> old parent doesn't matter (as you say). But as we are done with the
> set_rate the new parent will be turned off, as such as soon as we've
> changed the parent we must park the RCG again.
>
> So for parked shared_ops RCGs we simply remember the new configuration
> of the set_rate until it's time to enable the RCG again.
>
> As such I don't think that CLK_OPS_PARENT_ENABLE adds any value (for the
> shared_ops RCGs), only a bit of overhead.
>
>
> That said, if I read the code correctly don't think we properly handles
> a clk_set_parent() of a parked shared RCGs today...

Indeed, but most of the time, clk_rcg2_set_rate_and_parent is used,
and seems correctly implemented for shared case. But in case of e.g.
assigned-parent from dts, the clk_set_parent may indeed fail. So we
need a dedicated clk_rcg2_shared_set_parent function, maybe something
like:

+static int clk_rcg2_shared_set_parent(struct clk_hw *hw, u8 index)
+{
+       struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+       int ret;
+       u32 cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+
+       /*
+        * In case clock is disabled, update the CFG and don't hit the
+        * update bit of CMD register, which will be done in next enable().
+        */
+       ret = regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
+                                CFG_SRC_SEL_MASK, cfg);
+       if (ret || !__clk_is_enabled(hw->clk))
+               return ret;
+
+       return update_config(rcg);
+}

Regards,
Loic
