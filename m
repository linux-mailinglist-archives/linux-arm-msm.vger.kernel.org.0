Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAA8309E7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 21:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhAaUDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jan 2021 15:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbhAaTs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jan 2021 14:48:27 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55519C061788;
        Sun, 31 Jan 2021 11:47:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o5so1215992wmq.2;
        Sun, 31 Jan 2021 11:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6wXPb6paYLXQl2pKsLEiIISXfXS8Hhcf27+U5ECNao=;
        b=UL6u9v++SVqEzWWq9c2IkrsMhf/Y2G1hktNz+etSCKnNhwzy6ljwWfgBOp1Enf30Fw
         yuB5ny4xWdX+XQK0LD7OF1X9qMM6AxajVBvLpy72hTpzltOqnIFyrcZpgI7wkALlB5Jo
         Pg3jpoR6CURyXPXRJOP9H3hcTvDycn+tIqHBoDkY8fUN0JJMP2shi16aAOKzhZtbMcZ0
         t4d/g/DNCkGs8WuMgT11L30CfQ8e1Fu5Q2JAZrMC48/iXll3VjHG6he8m9x/+qpzZbfR
         FeSBo/0cx4e5IvLgjmlNHwif9UUMC/49OFgSieWzV67INAg6qp4Mgqt1PeVgdlnbaWU1
         vvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6wXPb6paYLXQl2pKsLEiIISXfXS8Hhcf27+U5ECNao=;
        b=VnchKmQjSgRbnbWpBY6ZedMWY8nx46lfWynVABIiGDhLXzEL0e1zyr9zt7Zws5lu8Y
         uu+Ytn2eac1YlhO4Fyg2PetxI5gR9LI3SnRtZTaavSXIUNlRESJzbBDGjO967VXNLxkz
         hDt2wMN++GJWiac9gtmStmOMmT9w4p1Sv0adcOeLpSgyWt//QD18RXA8WQFlpspAb4CN
         1aOMmHU29CFl0YPjHtfmytG6vESDbrfw8gq3oN+WyfyiydS/UXxNKhtGdlBgCo4Bl+kf
         ceeBFnbU7rNezFE3pJOChgkT6EmJc139I/OWz4UWwhVQBj/J11t8igtpFrRzVjdZjw7V
         6xDQ==
X-Gm-Message-State: AOAM533FgnWq9TX3PrHHpHAKUiNqaON2eW770aZXI27yLJSdgoeoUW9N
        Oz91HJZhlZfnBAisYQA/VzPlBIWGgv2VYfaB1WY=
X-Google-Smtp-Source: ABdhPJxd6a+y2rJ9k825JiSPM8mEOyTrNoapVicPm39kXx0f+YJCfL63uiL+RjJBa8SkSBvsse6ESUUDXkBY6B03OvY=
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr12019059wmi.164.1612122474995;
 Sun, 31 Jan 2021 11:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org> <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 31 Jan 2021 11:50:29 -0800
Message-ID: <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation
 and prescaler
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 9, 2021 at 5:51 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> The VCO rate was being miscalculated due to a big overlook during
> the process of porting this driver from downstream to upstream:
> here we are really recalculating the rate of the VCO by reading
> the appropriate registers and returning a real frequency, while
> downstream the driver was doing something entirely different.
>
> In our case here, the recalculated rate was wrong, as it was then
> given back to the set_rate function, which was erroneously doing
> a division on the fractional value, based on the prescaler being
> either enabled or disabled: this was actually producing a bug for
> which the final VCO rate was being doubled, causing very obvious
> issues when trying to drive a DSI panel because the actual divider
> value was multiplied by two!
>
> To make things work properly, remove the multiplication of the
> reference clock by two from function dsi_pll_calc_dec_frac and
> account for the prescaler enablement in the vco_recalc_rate (if
> the prescaler is enabled, then the hardware will divide the rate
> by two).
>
> This will make the vco_recalc_rate function to pass the right
> frequency to the (clock framework) set_rate function when called,
> which will - in turn - program the right values in both the
> DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
> registers, finally making the PLL to output the right clock.
>
> Also, while at it, remove the prescaler TODO by also adding the
> possibility of disabling the prescaler on the PLL (it is in the
> PLL_ANALOG_CONTROLS_ONE register).
> Of course, both prescaler-ON and OFF cases were tested.

This somehow breaks things on sc7180 (display gets stuck at first
frame of splash screen).  (This is a setup w/ an ti-sn65dsi86 dsi->eDP
bridge)

Also, something (I assume DSI related) that I was testing on
msm-next-staging seems to have effected the colors on the panel (ie.
they are more muted).. which seems to persist across reboots (ie. when
switching back to a good kernel), and interestingly if I reboot from a
good kernel I see part of the login prompt (or whatever was previously
on-screen) in the firmware ui screen !?!  (so maybe somehow triggered
the display to think it is in PSR mode??)

Not sure if that is caused by these patches, but if I can figure out
how to get the panel back to normal I can bisect.  I think for now
I'll drop this series.  Possibly it could be a
two-wrongs-makes-a-right situation that had things working before, but
I think someone from qcom who knows the DSI IP should take a look.

BR,
-R


> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> index 8b66e852eb36..5be562dfbf06 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> @@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
>
>         pll_freq = pll->vco_current_rate;
>
> -       if (config->disable_prescaler)
> -               divider = fref;
> -       else
> -               divider = fref * 2;
> -
> +       divider = fref;
>         multiplier = 1 << config->frac_bits;
>         dec_multiple = div_u64(pll_freq * multiplier, divider);
>         dec = div_u64_rem(dec_multiple, multiplier, &frac);
> @@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
>
>  static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
>  {
> +       struct dsi_pll_config *config = &pll->pll_configuration;
>         void __iomem *base = pll->mmio;
> +       u32 val = config->disable_prescaler ? 0x0 : 0x80;
>
> -       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
> +       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
> @@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>         frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
>                   0x3) << 16);
>
> -       /*
> -        * TODO:
> -        *      1. Assumes prescaler is disabled
> -        */
>         multiplier = 1 << config->frac_bits;
> -       pll_freq = dec * (ref_clk * 2);
> -       tmp64 = (ref_clk * 2 * frac);
> +       pll_freq = dec * ref_clk;
> +       tmp64 = ref_clk * frac;
>         pll_freq += div_u64(tmp64, multiplier);
> -
>         vco_rate = pll_freq;
>
> +       if (config->disable_prescaler)
> +               vco_rate = div_u64(vco_rate, 2);
> +
>         DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>             pll_10nm->id, (unsigned long)vco_rate, dec, frac);
>
> --
> 2.29.2
>
