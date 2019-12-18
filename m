Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A72123BF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfLRAvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:51:55 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34957 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLRAvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:51:54 -0500
Received: by mail-il1-f194.google.com with SMTP id g12so200110ild.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FqIFbxNZ4ErowQaQntfHCdnij1EjI9liJnlLkiqWQc=;
        b=mTE1+RmVS47pn7wwx1YUwxOkfF6sMrc/6gDreEAiPH52c208VuOmECL0FxLsJiOeSj
         xd6GbfHO5uLaojmq7ftwHPw2eJ7dBFFX2kd4qTD4vF6V9bgGaznbDPFQJ6EcBm3DRuBu
         Sf9wkS0+HVSXl95nXlUBbglpe3Om87S4go9Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FqIFbxNZ4ErowQaQntfHCdnij1EjI9liJnlLkiqWQc=;
        b=PkV7gtn3B+klib7nxCd72Y0QkEPYmY91n1hMjM2B1nnt/9AygeS3IZ0UXvdPPRlkJg
         LxKdBZXM0D9hgd/Q6PVYLkkA0q4oM+911Ts6sOUoJP/MYbb4aIcxliAc+u3DmMOosCEK
         StMinG+TE5MVPsWoi0IiHL8X5LF/bNaiwNZBhmQ5YON2Nkmf4/l7sgzCva2zya4Q/UG1
         KYkiIkZC4vAh0d+Nxkf6sULSnvzNqIq2r9pBdT/Gx2fQkYamhvpCtlm/oV9056ig7b+w
         Yu48KuxQv0RPkJ4RrClNL87oUpFmYATCbhLdL1hxJ3H7XF2hUHV40jvVkzAkrsjGIQ/Q
         46yw==
X-Gm-Message-State: APjAAAU+1smHUgLl2RulEUwgfaOzS08cCxUCRRfWAlT+ZPYdroFlG7HE
        bPknDHZCdV0xcUbplbw7DARxUS20tlI=
X-Google-Smtp-Source: APXvYqw6T6Z5DmoR4mg8V/6+clVuCsLKln/YBDxYIEqNAxLNJHoIbl0l9FExggXWVW3uyV/UZ/E3rg==
X-Received: by 2002:a92:a1cb:: with SMTP id b72mr224161ill.101.1576630313335;
        Tue, 17 Dec 2019 16:51:53 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id v10sm92145iol.85.2019.12.17.16.51.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 16:51:52 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id b10so128793iof.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:51:51 -0800 (PST)
X-Received: by 2002:a02:ba93:: with SMTP id g19mr919432jao.90.1576630311502;
 Tue, 17 Dec 2019 16:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20191022190120.25772-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20191022190120.25772-1-jeffrey.l.hugo@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 16:51:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7HvXPkdjq_WeX+gN3s_Lc2zvX2rapcXNNBeKq2W_rtQ@mail.gmail.com>
Message-ID: <CAD=FV=V7HvXPkdjq_WeX+gN3s_Lc2zvX2rapcXNNBeKq2W_rtQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Decouple DP output lanes
 from DSI input lanes
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 22, 2019 at 12:01 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The bridge can be configured to use 1, 2, or 4 DP lanes.  This
> configuration is independent of the input DSI lanes.  Right now, the
> driver assumes that there is 1:1 mapping of input lanes to output lanes
> which is not correct and does not work for manu devices such as the
> Lenovo Miix 630 and Lenovo Yoga C630 laptops.
>
> The bridge can also be configured to use one of a number of data rates on
> the DP lanes.  Currently any of the supported rates is considered valid,
> however the configured rate must also be supported by the connected panel,
> and not all rates are supported or even valid for any particular panel.
>
> Luckily, we can determine what we need at runtime by reading the DPCD from
> the attached panel.  DPCD will tell us the maximum number of supported
> lanes, and the supported data rates.
>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>
> Bjorn, I think this should address the issue you pointed out concerning
> the data rate glitch I missed in your origional work.  Would you kindly
> give this a test and let me know if it appears to address all of the
> issues you were working around?
>
> v2:
> -Use DPCD instead of DT to address the issue of some panels not
> supporting all the rates
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 97 ++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 3 deletions(-)

Overall I'm suggesting moving over to my series and I've taken the
best stuff from your patch and put it atop my series.  Please yell if
you disagree.  You can find the cover letter for my v2 at:

https://lore.kernel.org/r/20191218004741.102067-1-dianders@chromium.org

A few misc comments below in any case.


> @@ -444,10 +447,91 @@ static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
>         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>
>         /* set DP data rate */
> -       dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> +       dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
>                                                         DP_CLK_FUDGE_DEN;

One note is that "bit_rate_mhz" is still calculated using the MIPI
pixel format, which is wrong.  It happens that (at the moment) we have
24 bits per pixel for both cases, though.


> +       /* read the panel capabilities to determine valid supported rates */
> +       val = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
> +       if (!val) {
> +               DRM_ERROR("Reading max link rate from DPCD failed\n");
> +               return;
> +       }
> +
> +       if (dpcd_val) {

I think your patch is assuming that the only case you want to use the
table is if dpcd_val is 0.  This doesn't appear to be the case.  In
Table 4-24 of the spec it states that you can have a non-zero value
here and still provide a table.  That might be useful if you want to
be backward compatible with an eDP 1.3 source but also provide an
optimized rate for a eDP 1.4 source.

We should be checking the eDP revision first and always using the
table if it's eDP 1.4.


> +               /* cap to the max rate supported by the bridge */
> +               if (dpcd_val > 0x14)
> +                       dpcd_val = 0x14;
> +
> +               switch (dpcd_val) {
> +               case 0x14:

There are constants.  Like DP_LINK_BW_5_4


> @@ -505,7 +589,14 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>                            CHA_DSI_LANES_MASK, val);
>
>         /* DP lane config */
> -       val = DP_NUM_LANES(pdata->dsi->lanes - 1);
> +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, (u8 *)&val);

This is an iffy cast.  The function is only guaranteed to set the
first byte of val which could be the most or least significant byte.
Other bytes will remain as-is.
