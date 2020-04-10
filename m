Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A702A1A41A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 06:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgDJEPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 00:15:35 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44876 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgDJEPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 00:15:35 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so277880plr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 21:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gEB6hREJEktFWL2i0vdfy1ZM0oVuZ9cuA3ZTnPrry/E=;
        b=L9/zOm1wXSp82yeBUotLf+3/A3y3RCe/ABJ6hUH3SwrMI1ei5iUZitd37//69XQaIj
         NzZdD/D0HY7c76STlcGkUv3UR4MIMDsRMh4gVqV6H5ImXGTwcV6pfUR3CDDN4VOUCLeZ
         MOvG6sfx0WsHxrwgE5blbxmxLUscfXN/Sc2/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gEB6hREJEktFWL2i0vdfy1ZM0oVuZ9cuA3ZTnPrry/E=;
        b=o0E1k5dOYcec7PuXv70rkI1kmWn/bfcdGoqfo8k1l30jmzTFBNYo4+Ps5WWxNGeKGJ
         /3gWybbdmJN6hh10Ya81biCuErQqNZQI5tDmoKqSysWxOYgc7TKOrjgdC6RprhJuo0Fb
         hBN3SfGileK47dQ2ee1z5JYR+B9alqK/cf1AMoWLBTX87aA48D/KUViodB9vQEy9ML91
         OPe8OK4KuZ84X5dfWc51qFQAmrFYJta8b6KQZJNVO6JjjiIXPUZwB3Zf5ImBR+crXS4I
         opSUNLqr5qaBlcAn3L32s0VNZla6pwqxeyMe9dIHlWjT1YoGyFQs1NcNun7cVMdcqX+q
         fEYg==
X-Gm-Message-State: AGi0PuZfLvfhHoxl1xbjXqGQmiYjRSr3uVzEUQBVUZV8O/XTDx+bdaMV
        JDDjAVroXEyKq36bP727sHBMjw==
X-Google-Smtp-Source: APiQypJTGbdX1SoxYcJculWqCkc6CQzCANNnPZpVTKgxdIg0kn6SGQWqA/xfj8NFLQXbGMtxs7cAkA==
X-Received: by 2002:a17:902:8ec8:: with SMTP id x8mr2914059plo.204.1586492133589;
        Thu, 09 Apr 2020 21:15:33 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d22sm555698pgh.11.2020.04.09.21.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 21:15:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org> <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Thu, 09 Apr 2020 21:15:31 -0700
Message-ID: <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-05 23:32:19)
> Add changes to invoke rpmh flush() from CPU PM notification.
> This is done when the last the cpu is entering power collapse and

'power collapse' is a qcom-ism. Maybe say something like "deep CPU idle
states"?

> controller is not busy.
>=20
> Controllers that do have 'HW solver' mode do not need to register
> for CPU PM notification. They may be in autonomous mode executing
> low power mode and do not require rpmh_flush() to happen from CPU
> PM notification.

Can you provide an example of a HW solver mode controller? Presumably
the display RSC is one of these?

>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index b718221..fbe1f3e 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -521,8 +527,86 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, co=
nst struct tcs_request *msg)
>         return tcs_ctrl_write(drv, msg);
>  }
> =20
> +/**
> + * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy.
> + *
> + * @drv: The controller
> + *
> + * Checks if any of the AMCs are busy in handling ACTIVE sets.
> + * This is called from the last cpu powering down before flushing
> + * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
> + * power collapse, so deny from the last cpu's pm notification.
> + *
> + * Return:
> + * * False             - AMCs are idle
> + * * True              - AMCs are busy
> + */
> +static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)

Can drv be const? Would be nice to make it const in some places in this
driver.

> +{
> +       int m;
> +       struct tcs_group *tcs =3D get_tcs_of_type(drv, ACTIVE_TCS);
> +
> +       /*
> +        * If we made an active request on a RSC that does not have a
> +        * dedicated TCS for active state use, then re-purposed wake TCSes
> +        * should be checked for not busy.

not busy, because we use wake TCSes for active requests in this case.

> +        *
> +        * Since this is called from the last cpu, need not take drv or t=
cs
> +        * lock before checking tcs_is_free().
> +        */
> +       if (!tcs->num_tcs)
> +               tcs =3D get_tcs_of_type(drv, WAKE_TCS);
> +
> +       for (m =3D tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
> +               if (!tcs_is_free(drv, m))
> +                       return true;
> +       }
> +
> +       return false;
> +}
[...]
> +
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index a75f3df..88f8801 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -433,16 +430,17 @@ static int send_single(struct rpmh_ctrlr *ctrlr, en=
um rpmh_state state,
>  }
> =20
>  /**
> - * rpmh_flush: Flushes the buffered active and sleep sets to TCS
> + * rpmh_flush() - Flushes the buffered sleep and wake sets to TCSes
>   *
> - * @ctrlr: controller making request to flush cached data
> + * @ctrlr: Controller making request to flush cached data
>   *
> - * Return: -EBUSY if the controller is busy, probably waiting on a respo=
nse
> - * to a RPMH request sent earlier.
> + * This function is called from sleep code on the last CPU
> + * (thus no spinlock needed).

Might be good to stick a lockdep_assert_irqs_disabled() in this function
then. That would document that this function should only be called when
irqs are disabled.

>   *
> - * This function is always called from the sleep code from the last CPU
> - * that is powering down the entire system. Since no other RPMH API woul=
d be
> - * executing at this time, it is safe to run lockless.
> + * Return:
> + * * 0          - Success
> + * * -EAGAIN    - Retry again
> + * * Error code - Otherwise
>   */
>  int rpmh_flush(struct rpmh_ctrlr *ctrlr)

This function name keeps throwing me off. Can we please call it
something like rpmh_configure_tcs_sleep_wake()? The word "flush" seems
to imply there's some sort of cache going on, but that's not really the
case. We're programming a couple TCS FIFOs so that they can be used
across deep CPU sleep states.

>  {
> @@ -455,9 +453,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>         }
> =20
>         /* Invalidate the TCSes first to avoid stale data */
> -       do {
> -               ret =3D rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
> -       } while (ret =3D=3D -EAGAIN);
> +       ret =3D rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>         if (ret)
>                 return ret;
>
