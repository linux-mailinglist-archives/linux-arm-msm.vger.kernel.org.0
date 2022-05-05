Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020C051C99A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 21:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385416AbiEETu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 15:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385385AbiEETuh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 15:50:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6065E75A
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 12:46:55 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so10656822ejb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76zX1jgwsT0zasKmYBV09/BTCdCZuPCGb857583dfNA=;
        b=SmHj+rwtIFR4QeyrR8yYTA8Fhs6CJFKqo+ftX7Osrnz35VRHPloLk8g+bvl5qcJWLe
         QOeZk4QXHqs03B12KbbhztbLSNTfpdG3UgGiIYvKI5RxdFPE1OeB1/Brg8CmGwvnsRY7
         JCyVgGU9P2LO+D0gCmzVu3OkT7f+wQXFYa3Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76zX1jgwsT0zasKmYBV09/BTCdCZuPCGb857583dfNA=;
        b=Hq1q255MWwAU6ngM2R+JvRk9flYeaXHyQbGKSJR7RTGgG/ZlhYmPa3erYhMg5bPbuE
         N5eMk/3eclDW/BIZT4PoLEiJoAa/AwZkngaezIC2AIkEptzRs8R0FH3W4g3NIynsHGZm
         nn7idaZ6w3HlJhIvLcLWsaodc9IkAPxb08XoX89djXtkMeX+Eg0243dmMKqRyvJRgHNc
         XmhToNYn1Km4XQzV4k0B0IbgHPxo3IB2QC0M/BdJPg2N/7pXFTMkED7q+RArhZoZA9j3
         7iqm5yAABWHecxxTVgw6cTA5IbahUI01rINaMNDkVUOHbuFIAGipkAnHkX9MFJugPgqs
         4sMg==
X-Gm-Message-State: AOAM5305iZG48GVtEqm6sdiXuPbKNLeI4tAod744UgsCLEybOCGTZk6s
        qEoZON71JVNpvRxpWmUxToAkCDM86lP13ehD1bw=
X-Google-Smtp-Source: ABdhPJwfhptSWQ5FlxFtJrQlm9zq35bKsEL7ZrAPKenIL+89fq+LDuZyhOPdoQlCBzrJl73F8E9WFg==
X-Received: by 2002:a17:907:a06f:b0:6f4:d336:6baa with SMTP id ia15-20020a170907a06f00b006f4d3366baamr9043017ejc.638.1651780013947;
        Thu, 05 May 2022 12:46:53 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709064cd300b006f3ef214daesm1120568ejt.20.2022.05.05.12.46.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 12:46:52 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id e24so7397670wrc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 12:46:52 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr22070355wro.679.1651780012333;
 Thu, 05 May 2022 12:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <a0342c52-6d39-cf16-632a-f45ff051210c@suse.de>
In-Reply-To: <a0342c52-6d39-cf16-632a-f45ff051210c@suse.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 May 2022 12:46:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XG1L_cVLQXuxNbOfgFuxYg6jAFW=7To01Eo_0JSA9yqg@mail.gmail.com>
Message-ID: <CAD=FV=XG1L_cVLQXuxNbOfgFuxYg6jAFW=7To01Eo_0JSA9yqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/probe-helper: Add helper for drm_helper_probe_single_connector_modes()
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 5, 2022 at 11:34 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 26.04.22 um 20:46 schrieb Douglas Anderson:
> > The drm_helper_probe_single_connector_modes() is a bit long. Let's
> > break a chunk off to update and validate modes. This helps avoid one
> > goto and also will allow us to more easily call the helper a second
> > time in a future patch without adding looping or another goto.
> >
> > This change is intended to be a no-op change--just code movement.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>
> > ---
> >
> >   drivers/gpu/drm/drm_probe_helper.c | 105 ++++++++++++++++-------------
> >   1 file changed, 59 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index 682359512996..819225629010 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -354,6 +354,61 @@ drm_helper_probe_detect(struct drm_connector *connector,
> >   }
> >   EXPORT_SYMBOL(drm_helper_probe_detect);
> >
> > +static bool _drm_helper_update_and_validate(struct drm_connector *connector,
>
> AFAIK convention is to use two underscores for internal names.

Sure! I'll spin with this.


> > +                                         uint32_t maxX, uint32_t maxY,
> > +                                         struct drm_modeset_acquire_ctx *ctx)
> > +{
> > +     struct drm_device *dev = connector->dev;
> > +     struct drm_display_mode *mode;
> > +     int mode_flags = 0;
> > +     int ret;
> > +
> > +     drm_connector_list_update(connector);
> > +
> > +     if (connector->interlace_allowed)
> > +             mode_flags |= DRM_MODE_FLAG_INTERLACE;
> > +     if (connector->doublescan_allowed)
> > +             mode_flags |= DRM_MODE_FLAG_DBLSCAN;
> > +     if (connector->stereo_allowed)
> > +             mode_flags |= DRM_MODE_FLAG_3D_MASK;
> > +
> > +     list_for_each_entry(mode, &connector->modes, head) {
> > +             if (mode->status != MODE_OK)
> > +                     continue;
> > +
> > +             mode->status = drm_mode_validate_driver(dev, mode);
> > +             if (mode->status != MODE_OK)
> > +                     continue;
> > +
> > +             mode->status = drm_mode_validate_size(mode, maxX, maxY);
> > +             if (mode->status != MODE_OK)
> > +                     continue;
> > +
> > +             mode->status = drm_mode_validate_flag(mode, mode_flags);
> > +             if (mode->status != MODE_OK)
> > +                     continue;
> > +
> > +             ret = drm_mode_validate_pipeline(mode, connector, ctx,
> > +                                              &mode->status);
> > +             if (ret) {
> > +                     drm_dbg_kms(dev,
> > +                                 "drm_mode_validate_pipeline failed: %d\n",
> > +                                 ret);
> > +
> > +                     if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK))
> > +                             mode->status = MODE_ERROR;
> > +                     else
> > +                             return true;
>
> Returning true is non-intuitive. It looks as if we report success when
> it actually signals a retry.
>
> I suggest to return 'ret' here and let the caller decide. On success at
> the end of the function, it would return 0 as usual.

There's a madness to my method. I originally had it returning "ret"
but then I felt like the callers now needed to handle three cases:

a) ret = -EDEADLK
b) ret = 0
c) ret = some other error

In reality _drm_helper_update_and_validate() never returned anything
other than a) or b), so adding the extra error handling for c) seemed
like a waste. ...but it also felt like if it violated the abstraction
of _drm_helper_update_and_validate() returning an error code if I
didn't handle c).

In any case, I'll change it back to an error code. Maybe a compromise would be:

ret = _drm_helper_update_and_validate(...)
if (ret == -EDEADLK) {
  drm_modeset_backoff(...)
  goto retry;
}
WARN_ON(ret);

...so we at least document that ret can only be one of the two values
and we'll get a warning splat if it ever happens, but we don't need to
add complex error handling for a case that the code can't hit. Ah,
looking above I guess that matches what the function does earlier too.

OK, I'll give a few more days for feedback on this series and I'll
spin with the two changes you've requested.

-Doug

-Doug
