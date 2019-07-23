Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A91F71EFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 20:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388669AbfGWSWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 14:22:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34622 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfGWSWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 14:22:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so13600928pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=2+Ndnfws7qHcc71bLCI/ev7m12lCCt8vDHBjewoDtbM=;
        b=Pwa5kuThPVeb2jtNoPgRTCQP4MzLkXXrAD2BI/6pg75FZ0CsvJsMXhOK+Q/BvQZcG1
         IcXF/uP7YXlG9QS+W+7jmWM6gdlyoDdrPSqiSr/er4If+RPJWx8+rc88HzUL8wzDMho2
         /hiw/4IphFKCXSzS5I+p8uIPL9bWcx+fBmOmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=2+Ndnfws7qHcc71bLCI/ev7m12lCCt8vDHBjewoDtbM=;
        b=ilTcURjkyPwvFMfdyTaoBEMXPTcPpF5Psu4uTKBLfJnM+A/2wkL33BADqg5gIFSLY/
         V9In2vdZf269+kQ5YspU4On7D0baboe4D/IzUdQ0ukY4U6ZOq2LDflPMycs2S1p02dwi
         qtkdCeeODHHbrV1bA+rBWw3HdYr4jJXtZ3zQSd4S9NoNi2RpX1I7rYXnR4qu/UEW792k
         G9wsVtaz7QCrhWThGHoAQTovCt9APdrQT7Tx/3UeK/baOLFnYidQv4E0qyCMOA1vxvrf
         K0Q3uY6F+be2Hq6QZjt4Dvll/TtLlxDoZ5VwPIXpd4HHL4wAC666Q8V3XbbyVYvUBSsf
         s+cQ==
X-Gm-Message-State: APjAAAV9rOCYLshpnGOzB9K6St92M3qX67i3jrgwx7rfejsiEU9K6pov
        XrgJtGXRSNFJsBa2z9lJq+zixA==
X-Google-Smtp-Source: APXvYqy3PVvvtRET9X7O0VbzJbOA90/EzjGTUnC9mVm/VS9fbE2Lcatnc+DHG3xR0Yjic9RMUdhrNw==
X-Received: by 2002:a17:90a:380d:: with SMTP id w13mr82067459pjb.138.1563906133225;
        Tue, 23 Jul 2019 11:22:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v185sm50352294pfb.14.2019.07.23.11.22.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 11:22:12 -0700 (PDT)
Message-ID: <5d375054.1c69fb81.7ce3f.3591@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722215340.3071-1-ilina@codeaurora.org>
References: <20190722215340.3071-1-ilina@codeaurora.org>
Subject: Re: [PATCH V2 1/4] drivers: qcom: rpmh-rsc: simplify TCS locking
To:     Lina Iyer <ilina@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        mkshah@codeaurora.org, "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 23 Jul 2019 11:22:11 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-07-22 14:53:37)
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
>=20
> The tcs->lock was introduced to serialize access with in TCS group. But,
> drv->lock is still needed to synchronize core aspects of the
> communication. This puts the drv->lock in the critical and high latency
> path of sending a request. drv->lock provides the all necessary
> synchronization. So remove locking around TCS group and simply use the
> drv->lock instead.

This doesn't talk about removing the irq saving and restoring though.
Can you keep irq saving and restoring in this patch and then remove that
in the next patch with reasoning? It probably isn't safe if the lock is
taken in interrupt context anyway.

>=20
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> [ilina: split patch into multiple files, update commit text]
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-int=
ernal.h
> index a7bbbb67991c..969d5030860e 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e278fc11fe5c..5ede8d6de3ad 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -106,26 +106,26 @@ static int tcs_invalidate(struct rsc_drv *drv, int =
type)
>  {
>         int m;
>         struct tcs_group *tcs;
> +       int ret =3D 0;
> =20
>         tcs =3D get_tcs_of_type(drv, type);
> =20
> -       spin_lock(&tcs->lock);
> -       if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
> -               spin_unlock(&tcs->lock);
> -               return 0;
> -       }
> +       spin_lock(&drv->lock);
> +       if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS))
> +               goto done_invalidate;
> =20
>         for (m =3D tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
>                 if (!tcs_is_free(drv, m)) {
> -                       spin_unlock(&tcs->lock);
> -                       return -EAGAIN;
> +                       ret =3D -EAGAIN;
> +                       goto done_invalidate;
>                 }
>                 write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, m, 0);
>                 write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
>         }
>         bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
> -       spin_unlock(&tcs->lock);
> =20
> +done_invalidate:
> +       spin_unlock(&drv->lock);
>         return 0;

return ret now?

>  }
> =20
> @@ -349,41 +349,35 @@ static int tcs_write(struct rsc_drv *drv, const str=
uct tcs_request *msg)
>  {
>         struct tcs_group *tcs;
>         int tcs_id;
> -       unsigned long flags;
>         int ret;
> =20
>         tcs =3D get_tcs_for_msg(drv, msg);
>         if (IS_ERR(tcs))
>                 return PTR_ERR(tcs);
> =20
> -       spin_lock_irqsave(&tcs->lock, flags);
>         spin_lock(&drv->lock);
>         /*
>          * The h/w does not like if we send a request to the same address,
>          * when one is already in-flight or being processed.
>          */
>         ret =3D check_for_req_inflight(drv, tcs, msg);
> -       if (ret) {
> -               spin_unlock(&drv->lock);
> +       if (ret)
>                 goto done_write;
> -       }
> =20
>         tcs_id =3D find_free_tcs(tcs);
>         if (tcs_id < 0) {
>                 ret =3D tcs_id;
> -               spin_unlock(&drv->lock);
>                 goto done_write;
>         }
> =20
>         tcs->req[tcs_id - tcs->offset] =3D msg;
>         set_bit(tcs_id, drv->tcs_in_use);
> -       spin_unlock(&drv->lock);
> =20
>         __tcs_buffer_write(drv, tcs_id, 0, msg);
>         __tcs_trigger(drv, tcs_id);
> =20
>  done_write:
> -       spin_unlock_irqrestore(&tcs->lock, flags);
> +       spin_unlock(&drv->lock);
>         return ret;
>  }
> =20
> @@ -481,19 +475,18 @@ static int tcs_ctrl_write(struct rsc_drv *drv, cons=
t struct tcs_request *msg)
>  {
>         struct tcs_group *tcs;
>         int tcs_id =3D 0, cmd_id =3D 0;
> -       unsigned long flags;
>         int ret;
> =20
>         tcs =3D get_tcs_for_msg(drv, msg);
>         if (IS_ERR(tcs))
>                 return PTR_ERR(tcs);
> =20
> -       spin_lock_irqsave(&tcs->lock, flags);
> +       spin_lock(&drv->lock);
>         /* find the TCS id and the command in the TCS to write to */
>         ret =3D find_slots(tcs, msg, &tcs_id, &cmd_id);
>         if (!ret)
>                 __tcs_buffer_write(drv, tcs_id, cmd_id, msg);
> -       spin_unlock_irqrestore(&tcs->lock, flags);
> +       spin_unlock(&drv->lock);
> =20

These ones, just leave them doing the irq save restore for now?

