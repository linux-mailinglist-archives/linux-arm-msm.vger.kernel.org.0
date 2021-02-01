Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A5130ABDC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 16:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhBAPsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 10:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhBAPsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 10:48:04 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD04C06174A;
        Mon,  1 Feb 2021 07:47:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id 7so17112673wrz.0;
        Mon, 01 Feb 2021 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhNjzzlTL/WMF/Awbgykfs5fMnKhEterzOUsRC4P6Lo=;
        b=JCtAzlQ8VLvGgXcm1j4WzkEieHX1in33tpKI5XnjgSad9985vx9xduDayc9ah5SVRZ
         6Iu2r9yA/0Rz66iE0tvy3VmYZBf0qiNnOKXKtaZuXlPAzjnmbh3lzbx8FjHcIPfVgYf/
         j7vnRGj18cQmTvQ2zkkFney/m5pKOgtsmj/3UQ8Wbr0jT2JlO2ggwrSTUnFmgfw5zkW0
         puSvpnRaflWOW3S+fNuKuJFeQgpkYN0P9UeI18e8Q1ch+xnIr7vPHuICD1ZKXO6kNo/s
         gTBPP9XYFRO861K/ku8w/CMSHsMkhSdUWGxrOT9RVG8ri4uO+oCiAJ3J+Xl2iM89Flwn
         3qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhNjzzlTL/WMF/Awbgykfs5fMnKhEterzOUsRC4P6Lo=;
        b=l1y3nsH8CDD8iwLy3IQPVqDhC/O85zFsWKuY8IB7degBmNJ5ow+3N7sYEomq3lSn9U
         4x77ENwivJZK6CKD8gDgq+gYiJyENwIcVHR36xRg4w4HGYmzL91HFvWKNYXDdsxB1vmU
         Q7Rl9fDu6Um4Nau/6llmB49fXdHuTMbnbxye8dtKUDEHpfLbocBrFOyL/UOOlGGmQFMu
         mjmsuRe+O5IHYMOBoul7Rz8TAaOKnKviA79VdBLMwcNxtBmKG3YSRYrZNlC8aHu/R/Tx
         dnk40sfZ2szB4PAKoKfW31BTrCgj4myn5Qf3dIwz9oA0Pf8NnQQcMpNJ2D7FYChqT1qn
         fUig==
X-Gm-Message-State: AOAM533c4CkOCS9vxfKYSuT/tU5SSj0z8ZtB/wawY9PYLCYgNx+o0sJU
        PY0Ybq11ssTt3w8jMP4u+8ITvAJSOmQd4jMSyJw=
X-Google-Smtp-Source: ABdhPJzLRliODEOTcSyLXiBjzOBTS/F3f9BiD2CohKi/gCiAPLdhzyUUGq9LNTLbWVv01kT6k3CgnHt62pL1k6Sumoc=
X-Received: by 2002:adf:902a:: with SMTP id h39mr18790983wrh.147.1612194440569;
 Mon, 01 Feb 2021 07:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
 <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
 <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com> <8f8c7c37-f7b2-f763-19e1-d89e5c454ab4@somainline.org>
In-Reply-To: <8f8c7c37-f7b2-f763-19e1-d89e5c454ab4@somainline.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Feb 2021 07:47:08 -0800
Message-ID: <CAF6AEGsQp4xHpH2brUdHmAX1ic2k88EFJRVVWDRxWXUqF9njfw@mail.gmail.com>
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

On Mon, Feb 1, 2021 at 2:11 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 31/01/21 20:50, Rob Clark ha scritto:
> > On Sat, Jan 9, 2021 at 5:51 AM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> >>
> >> The VCO rate was being miscalculated due to a big overlook during
> >> the process of porting this driver from downstream to upstream:
> >> here we are really recalculating the rate of the VCO by reading
> >> the appropriate registers and returning a real frequency, while
> >> downstream the driver was doing something entirely different.
> >>
> >> In our case here, the recalculated rate was wrong, as it was then
> >> given back to the set_rate function, which was erroneously doing
> >> a division on the fractional value, based on the prescaler being
> >> either enabled or disabled: this was actually producing a bug for
> >> which the final VCO rate was being doubled, causing very obvious
> >> issues when trying to drive a DSI panel because the actual divider
> >> value was multiplied by two!
> >>
> >> To make things work properly, remove the multiplication of the
> >> reference clock by two from function dsi_pll_calc_dec_frac and
> >> account for the prescaler enablement in the vco_recalc_rate (if
> >> the prescaler is enabled, then the hardware will divide the rate
> >> by two).
> >>
> >> This will make the vco_recalc_rate function to pass the right
> >> frequency to the (clock framework) set_rate function when called,
> >> which will - in turn - program the right values in both the
> >> DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
> >> registers, finally making the PLL to output the right clock.
> >>
> >> Also, while at it, remove the prescaler TODO by also adding the
> >> possibility of disabling the prescaler on the PLL (it is in the
> >> PLL_ANALOG_CONTROLS_ONE register).
> >> Of course, both prescaler-ON and OFF cases were tested.
> >
> > This somehow breaks things on sc7180 (display gets stuck at first
> > frame of splash screen).  (This is a setup w/ an ti-sn65dsi86 dsi->eDP
> > bridge)
> >
>
> First frame of the splash means that something is "a bit" wrong...
> ...like the DSI clock is a little off.
>
> I don't have such hardware, otherwise I would've tried... but what you
> describe is a bit strange.
> Is there any other older qcom platform using this chip? Any other
> non-qcom platform? Is the driver for the SN65DSI86 surely fine?
> Anyway, as you know, I would never propose untested patches nor
> partially working ones for any reason: I'm sorry that this happened.

I don't think there is anything publicly avail w/ sc7180 (yet.. but very soon)

The ti-sn65dsi86 bridge is used on a bunch of 845/850 devices (like
the snapdragon windows laptops).. and I think also the older 835
laptops.. ofc that doesn't mean that there isn't some bug, but I'd
guess maybe more likely that there is some small difference in DSI vs
older devices, or some cmd vs video mode difference.

Anyways, seems like the screen did eventually recover so that gives me
a bit of confidence to bisect this series, which I'll do a bit later
today.

> In any case, just to be perfectly transparent, while being here waiting
> for review, this patch series got tested on more smartphones, even ones
> that I don't personally own, with different displays.
>
> For your reference, here's a list (all MSM8998..):
> - OnePlus 5               (1920x1080)
> - F(x)Tec Pro 1           (2160x1080)
> - Sony Xperia XZ1 Compact (1280x720)
> - Sony Xperia XZ1         (1920x1080)
> - Sony Xperia XZ Premium  (3840x2160)
>

Yeah, no worries, I wasn't trying to imply that the patch was untested.

Out of curiosity, are any of those video mode panels?

>
> > Also, something (I assume DSI related) that I was testing on
> > msm-next-staging seems to have effected the colors on the panel (ie.
> > they are more muted).. which seems to persist across reboots (ie. when
>
> So much "fun". This makes me think something about the PCC block doing
> the wrong thing (getting misconfigured).
>
> > switching back to a good kernel), and interestingly if I reboot from a
> > good kernel I see part of the login prompt (or whatever was previously
> > on-screen) in the firmware ui screen !?!  (so maybe somehow triggered
> > the display to think it is in PSR mode??)
> >
>
>  From a fast read, the SN65DSI86 is on I2C.. giving it a wrong dsi clock
> cannot produce (logically, at least) this, so I say that it is very
> unlikely for this to be a consequence of the 10nm pll fixes...
>

Note that the bridge can also be programmed via dsi cmd mode packets,
which I believe is the case on the 835 laptops (or at least one of
them).. but all the things I have are using i2c as the control path.

> ...unless the bootloader is not configuring the DSI rates, but that's
> also veeeeery unlikely (it always does, or it always does not).

I haven't looked at the bootloader display code, but booting back to
an old/good kernel didn't change anything..  even powering off didn't.
But the ghost image seemed to fade after some time, and by the next
morning it was fine.  Which is strange. (But tbf, I'm more a gpu guy
who works on display only when necessary.. ie. a gpu without a display
isn't so much fun ;-))

> > Not sure if that is caused by these patches, but if I can figure out
> > how to get the panel back to normal I can bisect.  I think for now
> > I'll drop this series.  Possibly it could be a
> > two-wrongs-makes-a-right situation that had things working before, but
> > I think someone from qcom who knows the DSI IP should take a look.
> >
>
> I would be happy if someone from Qualcomm takes a look: after all, there
> is no documentation and they're the only ones that can verify this kind
> of stuff. Please, Qualcomm.

Hopefully someone can take a look.

> Besides that, if there's anything I can help with to solve this riddle,
> I'm here for you.

Thanks, like I said I'll try applying the patches one by one and see
if I can narrow down what made the panel go funny, and we can go from
there

BR,
-R

> Yours,
> -- Angelo
>
> > BR,
> > -R
> >
> >
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
> >>   1 file changed, 9 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> >> index 8b66e852eb36..5be562dfbf06 100644
> >> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> >> @@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
> >>
> >>          pll_freq = pll->vco_current_rate;
> >>
> >> -       if (config->disable_prescaler)
> >> -               divider = fref;
> >> -       else
> >> -               divider = fref * 2;
> >> -
> >> +       divider = fref;
> >>          multiplier = 1 << config->frac_bits;
> >>          dec_multiple = div_u64(pll_freq * multiplier, divider);
> >>          dec = div_u64_rem(dec_multiple, multiplier, &frac);
> >> @@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
> >>
> >>   static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
> >>   {
> >> +       struct dsi_pll_config *config = &pll->pll_configuration;
> >>          void __iomem *base = pll->mmio;
> >> +       u32 val = config->disable_prescaler ? 0x0 : 0x80;
> >>
> >> -       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
> >> +       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
> >>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
> >>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
> >>          pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
> >> @@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
> >>          frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
> >>                    0x3) << 16);
> >>
> >> -       /*
> >> -        * TODO:
> >> -        *      1. Assumes prescaler is disabled
> >> -        */
> >>          multiplier = 1 << config->frac_bits;
> >> -       pll_freq = dec * (ref_clk * 2);
> >> -       tmp64 = (ref_clk * 2 * frac);
> >> +       pll_freq = dec * ref_clk;
> >> +       tmp64 = ref_clk * frac;
> >>          pll_freq += div_u64(tmp64, multiplier);
> >> -
> >>          vco_rate = pll_freq;
> >>
> >> +       if (config->disable_prescaler)
> >> +               vco_rate = div_u64(vco_rate, 2);
> >> +
> >>          DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> >>              pll_10nm->id, (unsigned long)vco_rate, dec, frac);
> >>
> >> --
> >> 2.29.2
> >>
>
