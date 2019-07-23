Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BBD72089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 22:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbfGWULN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 16:11:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43863 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbfGWULN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 16:11:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so14041606pld.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=QbT9jGu1lmx3/9h3LW15ROrOwQXxSF86nPLyM5BLkII=;
        b=iTCMzgyFfG0OP9uRHM4PgqYmeTY0g0hC424bokI7JNfKuRDiJzS2wLzjLh0EP8I2L2
         +HYLetQYiXmSxCGmJMqTzMS30qc2pCkBxCE/upXFcENcoBdrMBIIBK89qB1STSVOC3C/
         MglHaKb+TPOMn6k5Rd/kcCj11LmsZAUzfaMm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=QbT9jGu1lmx3/9h3LW15ROrOwQXxSF86nPLyM5BLkII=;
        b=G6vIRD9LbFUAxCymQCf5d0/bGbk/t/jVr6dtUPhY71aVNIL8zSPTEdalioBQwHBSjy
         jczu2IsEn6Q2A5Ha+LRHaWG8wjtdSOt/HO8d5kTlADC5AVWIG6dBR5ZqXUD3XT10GXiu
         qgkpbMefmVe1HswFmjnyAZjl5bi7OLcdyJ9Bh8CFrXmAR10mn6OgDpfLdEREUOP3u01J
         i730ZxF9p6VdvLDY5hQL4gARGERKn3KhtWMnMk7riGfNru1cqfTA18C+BcvuHsx/zM6b
         Mai7EZrcbC5/MP91aJ+yZjXVpqk69zevmYmRQiOAqKiTFRPQ57+le2PGlcHB//c2lA5X
         y9lw==
X-Gm-Message-State: APjAAAVsYuXha7Ao55jeTNRS50qNxsc9k2lkDFakRYbjbQWEpVEAj9dx
        y60Iaz85fXnF/+dq985WPltTZg==
X-Google-Smtp-Source: APXvYqyUHxwi4zszpvLpkepttGZ93I6RHVvOvH/ZmJ63coG/n6yxOGvC7vHRakTYhBSKWoTO8G414w==
X-Received: by 2002:a17:902:e282:: with SMTP id cf2mr83244845plb.301.1563912672555;
        Tue, 23 Jul 2019 13:11:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b136sm51971272pfb.73.2019.07.23.13.11.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 13:11:11 -0700 (PDT)
Message-ID: <5d3769df.1c69fb81.55d03.aa33@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722215340.3071-2-ilina@codeaurora.org>
References: <20190722215340.3071-1-ilina@codeaurora.org> <20190722215340.3071-2-ilina@codeaurora.org>
Subject: Re: [PATCH V2 2/4] drivers: qcom: rpmh-rsc: avoid locking in the interrupt handler
To:     Lina Iyer <ilina@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        mkshah@codeaurora.org, Lina Iyer <ilina@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 23 Jul 2019 13:11:10 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-07-22 14:53:38)
> Avoid locking in the interrupt context to improve latency. Since we
> don't lock in the interrupt context, it is possible that we now could
> race with the DRV_CONTROL register that writes the enable register and
> cleared by the interrupt handler. For fire-n-forget requests, the
> interrupt may be raised as soon as the TCS is triggered and the IRQ
> handler may clear the enable bit before the DRV_CONTROL is read back.
>=20
> Use the non-sync variant when enabling the TCS register to avoid reading
> back a value that may been cleared because the interrupt handler ran
> immediately after triggering the TCS.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

I have to read this patch carefully. The commit text isn't convincing me
that it is actually safe to make this change. It mostly talks about the
performance improvements and how we need to fix __tcs_trigger(), which
is good, but I was hoping to be convinced that not grabbing the lock
here is safe.=20

How do we ensure that drv->tcs_in_use is cleared before we call
tcs_write() and try to look for a free bit? Isn't it possible that we'll
get into a situation where the bitmap is all used up but the hardware
has just received an interrupt and is going to clear out a bit and then
an rpmh write fails with -EBUSY?

>  drivers/soc/qcom/rpmh-rsc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 5ede8d6de3ad..694ba881624e 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -242,9 +242,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>                 write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
>                 write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
>                 write_tcs_reg(drv, RSC_DRV_IRQ_CLEAR, 0, BIT(i));
> -               spin_lock(&drv->lock);
>                 clear_bit(i, drv->tcs_in_use);
> -               spin_unlock(&drv->lock);
>                 if (req)
>                         rpmh_tx_done(req, err);
>         }
> @@ -304,7 +302,7 @@ static void __tcs_trigger(struct rsc_drv *drv, int tc=
s_id)
>         enable =3D TCS_AMC_MODE_ENABLE;
>         write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
>         enable |=3D TCS_AMC_MODE_TRIGGER;
> -       write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
> +       write_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, enable);
>  }
> =20
>  static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group =
*tcs,
