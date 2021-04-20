Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AE33661D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Apr 2021 00:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhDTWBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 18:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233769AbhDTWBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 18:01:37 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35421C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 15:01:05 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n10so9300862plc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=v8dPsnj7LVPAJqreP5fUXlj6CsjITq45zlynre8tQwU=;
        b=LCxqTfbSUo+aGA+zS74bOqNZKleN1jR/KQ6Ydc9QI8CWZrJ7b8/jS5nRk+IwTvzAiH
         5L3S9FdMPWBdAo7bb2vUFaED/Nkw41491VBPTrcvR8cHYMjQWAJpIdAyAN6d5xVzIYIE
         90jbX4aAOFGiKGl4qH+nF1hv8rgFS4hGi8sQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=v8dPsnj7LVPAJqreP5fUXlj6CsjITq45zlynre8tQwU=;
        b=MVDrKlEQpwju9xITIXUKesuMlN5GsCJ0KQgHHv6DTZ7bmINp61F0NFpIO0KaAOx5gg
         uO/t5eU3pEeRhT6X6CN4oRAwhrWZtnEH0ZceroIGmDXwTaXP0jIGfD2fHaXAhfU+RDCm
         jgUvqwzSCFCL8PIb/DSmKRUHNSlERLEcuYF4TqECHWoV5sbw3k2xYKnVEvqE+XFCXxM6
         1rQSIB88cmoyM0AzPnf2N7IF+SFYFrowAo9PSL5Cl9qsT5pjG9wPFEyP5yeJI8EJ0+3b
         lv8vB1gRnNgUGfmt4DXUYX+HlfjgFT1Z1Da18bmYHnjcjT0XEMAfkHMAhnNFAjBsOsWV
         cJtA==
X-Gm-Message-State: AOAM530E0xz0oQgMVix9b1+/3NHUj2MQoplX5u+El3anyRmhpVHWshBH
        Del2cAT/3jmSbDZUP5meDve80g==
X-Google-Smtp-Source: ABdhPJw39iivqaEsGNyvaKDr7/Mbo/adR7cFLGbc1hXX8DChY41Jiy/BZY3aZAztF1khmi7IFjahHA==
X-Received: by 2002:a17:902:e5d1:b029:eb:7ec2:648e with SMTP id u17-20020a170902e5d1b02900eb7ec2648emr29213086plf.30.1618956064553;
        Tue, 20 Apr 2021 15:01:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:bf8b:4b8b:2315:3719])
        by smtp.gmail.com with ESMTPSA id b10sm45714pfb.27.2021.04.20.15.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 15:01:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: service only one irq_hpd if there are multiple irq_hpd pending
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 20 Apr 2021 15:01:02 -0700
Message-ID: <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-16 13:27:57)
> Some dongle may generate more than one irq_hpd events in a short period of
> time. This patch will treat those irq_hpd events as single one and service
> only one irq_hpd event.

Why is it bad to get multiple irq_hpd events in a short period of time?
Please tell us here in the commit text.

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 5a39da6..0a7d383 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -707,6 +707,9 @@ static int dp_irq_hpd_handle(struct dp_display_privat=
e *dp, u32 data)
>                 return 0;
>         }
> =20
> +       /* only handle first irq_hpd in case of multiple irs_hpd pending =
*/
> +       dp_del_event(dp, EV_IRQ_HPD_INT);
> +
>         ret =3D dp_display_usbpd_attention_cb(&dp->pdev->dev);
>         if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
>                 dp->core_initialized =3D false;
> @@ -1300,6 +1303,9 @@ static int dp_pm_suspend(struct device *dev)
>         /* host_init will be called at pm_resume */
>         dp->core_initialized =3D false;
> =20
> +       /* system suspended, delete pending irq_hdps */
> +       dp_del_event(dp, EV_IRQ_HPD_INT);

What happens if I suspend my device and when this function is running I
toggle my monitor to use the HDMI input that is connected instead of some
other input, maybe the second HDMI input? Wouldn't that generate an HPD
interrupt to grab the attention of this device?

> +
>         mutex_unlock(&dp->event_mutex);
> =20
>         return 0;
> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struc=
t drm_encoder *encoder)
>         /* stop sentinel checking */
>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> =20
> +       /* link is down, delete pending irq_hdps */
> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
> +

I'm becoming convinced that the whole kthread design and event queue is
broken. These sorts of patches are working around the larger problem
that the kthread is running independently of the driver and irqs can
come in at any time but the event queue is not checked from the irq
handler to debounce the irq event. Is the event queue necessary at all?
I wonder if it would be simpler to just use an irq thread and process
the hpd signal from there. Then we're guaranteed to not get an irq again
until the irq thread is done processing the event. This would naturally
debounce the irq hpd event that way.

>         dp_display_disable(dp_display, 0);
> =20
>         rc =3D dp_display_unprepare(dp);
