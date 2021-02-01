Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D45230AD56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 18:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhBARD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 12:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhBARDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 12:03:54 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6072AC061756;
        Mon,  1 Feb 2021 09:03:14 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q7so17367220wre.13;
        Mon, 01 Feb 2021 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XpIqMTxiPl1u/vZSNC4Lfvq35vHO2o8tdpi31fPPS4=;
        b=NQENQ3sKSfnCCWZNZads57GT/TPjyGI8+M73fUH7lR1Ot/kInwJ2Avm+Di51ZV6w9l
         X1OFgQazGwEfQJ/zmSWuoz5nh2lsvU5zFcLkumBQ2Iya9E/vT8KxnFuBm0MYboBYIV8g
         vSCr+dmaqPTlLyfAkYZOFvyPGqkZg1b0vW1UEIUvZXDULuxWnBNdjYpWXuZnwvFIv6JQ
         a5e/HdshQ5wUGzs/dZ3sGIxxntXFNIcX0kIs3RHGs5uKkXgzg112VVk8vm8gM2aGFzO+
         ManIClm+0NTERQfypLyNFfvTrai8exXRVhtUcYBgCOPLIjmanXnHVijkeG+NSFMt0re8
         VD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XpIqMTxiPl1u/vZSNC4Lfvq35vHO2o8tdpi31fPPS4=;
        b=djCxmkIY8DlWX/n1hY2uBrTjeSg1ZnitzbMvEW5MDNLInBJEPSmOEudVYzc2LL6LXz
         8m+/fNuYtDpQVMMUGai5E9rAAVZxPU+czdWkYOeRScQuijctpR3SCxCpIfDpfwNciHoy
         L9NRH0+VuzHDb4xtLTMdeKrUkh6rYn//5t+vcl91J1nCXq9J3v6OZv+GqwujkDxjripI
         fwmfAqtW6wseXcZ0TEPYdYduNID45QCkK952FQxR4xOWPc7uSESDc7CvgBR1YZNnK82j
         t5WF2iTBqOVGkNwxcNfaZls88FXc5WEx4vbtf5uvRJNrTZsUmZfhUEHA4rSmeUIdpx2Y
         CxvQ==
X-Gm-Message-State: AOAM532DMr0luBAR5eTcGVIEvPat4G0NJ3dxgA0hxo5UemG3gV1pMvqD
        Pplk8enEWbnuiKRFy/c5cBeXNG1HlmzcHifxG/8=
X-Google-Smtp-Source: ABdhPJyh9DlgUiUfElTEXzXXdzq0tFW7ZJGEVYqpzz9oWLuIAJjdLuqueejEYKVQV3W8DWNCKZvelMKWo09CPxJKjwo=
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr19452006wrq.132.1612198992884;
 Mon, 01 Feb 2021 09:03:12 -0800 (PST)
MIME-Version: 1.0
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
 <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
 <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
 <8f8c7c37-f7b2-f763-19e1-d89e5c454ab4@somainline.org> <CAF6AEGsQp4xHpH2brUdHmAX1ic2k88EFJRVVWDRxWXUqF9njfw@mail.gmail.com>
In-Reply-To: <CAF6AEGsQp4xHpH2brUdHmAX1ic2k88EFJRVVWDRxWXUqF9njfw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Feb 2021 09:05:46 -0800
Message-ID: <CAF6AEGueo71HVBcLW2Mtu5GQ=9HgwL43WczUGLuTk2JWLoH=ew@mail.gmail.com>
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

On Mon, Feb 1, 2021 at 7:47 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Feb 1, 2021 at 2:11 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> >
> > Il 31/01/21 20:50, Rob Clark ha scritto:
> > > On Sat, Jan 9, 2021 at 5:51 AM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@somainline.org> wrote:
> > >>
> > >> The VCO rate was being miscalculated due to a big overlook during
> > >> the process of porting this driver from downstream to upstream:
> > >> here we are really recalculating the rate of the VCO by reading
> > >> the appropriate registers and returning a real frequency, while
> > >> downstream the driver was doing something entirely different.
> > >>
> > >> In our case here, the recalculated rate was wrong, as it was then
> > >> given back to the set_rate function, which was erroneously doing
> > >> a division on the fractional value, based on the prescaler being
> > >> either enabled or disabled: this was actually producing a bug for
> > >> which the final VCO rate was being doubled, causing very obvious
> > >> issues when trying to drive a DSI panel because the actual divider
> > >> value was multiplied by two!
> > >>
> > >> To make things work properly, remove the multiplication of the
> > >> reference clock by two from function dsi_pll_calc_dec_frac and
> > >> account for the prescaler enablement in the vco_recalc_rate (if
> > >> the prescaler is enabled, then the hardware will divide the rate
> > >> by two).
> > >>
> > >> This will make the vco_recalc_rate function to pass the right
> > >> frequency to the (clock framework) set_rate function when called,
> > >> which will - in turn - program the right values in both the
> > >> DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
> > >> registers, finally making the PLL to output the right clock.
> > >>
> > >> Also, while at it, remove the prescaler TODO by also adding the
> > >> possibility of disabling the prescaler on the PLL (it is in the
> > >> PLL_ANALOG_CONTROLS_ONE register).
> > >> Of course, both prescaler-ON and OFF cases were tested.
> > >
> > > This somehow breaks things on sc7180 (display gets stuck at first
> > > frame of splash screen).  (This is a setup w/ an ti-sn65dsi86 dsi->eDP
> > > bridge)
> > >
> >
> > First frame of the splash means that something is "a bit" wrong...
> > ...like the DSI clock is a little off.
> >
> > I don't have such hardware, otherwise I would've tried... but what you
> > describe is a bit strange.
> > Is there any other older qcom platform using this chip? Any other
> > non-qcom platform? Is the driver for the SN65DSI86 surely fine?
> > Anyway, as you know, I would never propose untested patches nor
> > partially working ones for any reason: I'm sorry that this happened.
>
> I don't think there is anything publicly avail w/ sc7180 (yet.. but very soon)
>
> The ti-sn65dsi86 bridge is used on a bunch of 845/850 devices (like
> the snapdragon windows laptops).. and I think also the older 835
> laptops.. ofc that doesn't mean that there isn't some bug, but I'd
> guess maybe more likely that there is some small difference in DSI vs
> older devices, or some cmd vs video mode difference.
>
> Anyways, seems like the screen did eventually recover so that gives me
> a bit of confidence to bisect this series, which I'll do a bit later
> today.

fwiw, this series minus this patch, and everything looks ok.. let me
take a closer look at what changes with this patch

BR,
-R

> > In any case, just to be perfectly transparent, while being here waiting
> > for review, this patch series got tested on more smartphones, even ones
> > that I don't personally own, with different displays.
> >
> > For your reference, here's a list (all MSM8998..):
> > - OnePlus 5               (1920x1080)
> > - F(x)Tec Pro 1           (2160x1080)
> > - Sony Xperia XZ1 Compact (1280x720)
> > - Sony Xperia XZ1         (1920x1080)
> > - Sony Xperia XZ Premium  (3840x2160)
> >
>
> Yeah, no worries, I wasn't trying to imply that the patch was untested.
>
> Out of curiosity, are any of those video mode panels?
>
> >
> > > Also, something (I assume DSI related) that I was testing on
> > > msm-next-staging seems to have effected the colors on the panel (ie.
> > > they are more muted).. which seems to persist across reboots (ie. when
> >
> > So much "fun". This makes me think something about the PCC block doing
> > the wrong thing (getting misconfigured).
> >
> > > switching back to a good kernel), and interestingly if I reboot from a
> > > good kernel I see part of the login prompt (or whatever was previously
> > > on-screen) in the firmware ui screen !?!  (so maybe somehow triggered
> > > the display to think it is in PSR mode??)
> > >
> >
> >  From a fast read, the SN65DSI86 is on I2C.. giving it a wrong dsi clock
> > cannot produce (logically, at least) this, so I say that it is very
> > unlikely for this to be a consequence of the 10nm pll fixes...
> >
>
> Note that the bridge can also be programmed via dsi cmd mode packets,
> which I believe is the case on the 835 laptops (or at least one of
> them).. but all the things I have are using i2c as the control path.
>
> > ...unless the bootloader is not configuring the DSI rates, but that's
> > also veeeeery unlikely (it always does, or it always does not).
>
> I haven't looked at the bootloader display code, but booting back to
> an old/good kernel didn't change anything..  even powering off didn't.
> But the ghost image seemed to fade after some time, and by the next
> morning it was fine.  Which is strange. (But tbf, I'm more a gpu guy
> who works on display only when necessary.. ie. a gpu without a display
> isn't so much fun ;-))
>
> > > Not sure if that is caused by these patches, but if I can figure out
> > > how to get the panel back to normal I can bisect.  I think for now
> > > I'll drop this series.  Possibly it could be a
> > > two-wrongs-makes-a-right situation that had things working before, but
> > > I think someone from qcom who knows the DSI IP should take a look.
> > >
> >
> > I would be happy if someone from Qualcomm takes a look: after all, there
> > is no documentation and they're the only ones that can verify this kind
> > of stuff. Please, Qualcomm.
>
> Hopefully someone can take a look.
>
> > Besides that, if there's anything I can help with to solve this riddle,
> > I'm here for you.
>
> Thanks, like I said I'll try applying the patches one by one and see
> if I can narrow down what made the panel go funny, and we can go from
> there
>
> BR,
> -R
>
> > Yours,
> > -- Angelo
> >
> > > BR,
> > > -R
> > >
> > >
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
> > >>   1 file changed, 9 insertions(+), 13 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> > >> index 8b66e852eb36..5be562dfbf06 100644
> > >> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> > >> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> > >> @@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
> > >>
> > >>          pll_freq = pll->vco_current_rate;
> > >>
> > >> -       if (config->disable_prescaler)
> > >> -               divider = fref;
> > >> -       else
> > >> -               divider = fref * 2;
> > >> -
> > >> +       divider = fref;
> > >>          multiplier = 1 << config->frac_bits;
> > >>          dec_multiple = div_u64(pll_freq * multiplier, divider);
> > >>          dec = div_u64_rem(dec_multiple, multiplier, &frac);
> > >> @@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
> > >>
> > >>   static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
> > >>   {
> > >> +       struct dsi_pll_config *config = &pll->pll_configuration;
> > >>          void __iomem *base = pll->mmio;
> > >> +       u32 val = config->disable_prescaler ? 0x0 : 0x80;
> > >>
> > >> -       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
> > >> +       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
> > >>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
> > >>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
> > >>          pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
> > >> @@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
> > >>          frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
> > >>                    0x3) << 16);
> > >>
> > >> -       /*
> > >> -        * TODO:
> > >> -        *      1. Assumes prescaler is disabled
> > >> -        */
> > >>          multiplier = 1 << config->frac_bits;
> > >> -       pll_freq = dec * (ref_clk * 2);
> > >> -       tmp64 = (ref_clk * 2 * frac);
> > >> +       pll_freq = dec * ref_clk;
> > >> +       tmp64 = ref_clk * frac;
> > >>          pll_freq += div_u64(tmp64, multiplier);
> > >> -
> > >>          vco_rate = pll_freq;
> > >>
> > >> +       if (config->disable_prescaler)
> > >> +               vco_rate = div_u64(vco_rate, 2);
> > >> +
> > >>          DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> > >>              pll_10nm->id, (unsigned long)vco_rate, dec, frac);
> > >>
> > >> --
> > >> 2.29.2
> > >>
> >
