Return-Path: <linux-arm-msm+bounces-17219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA88A1271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 13:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E824C1C20BD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A321474BC;
	Thu, 11 Apr 2024 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+ieevYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E141474BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712833362; cv=none; b=npo73HQWhf8MbT+9SsUzvdUkkVVmoE/vMoliC7FCSQbP0lNgiJYxAKonunhfv7gEBoP6ZGW533rSOszAP7T6mAVawEVcha5eSj1IuGqe3EUP72duj/cVYaVFQdbWYzeKdWHkiSMxacXwn+sjuy7Pd0x5kjSDhDoO+kDr8q0Os54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712833362; c=relaxed/simple;
	bh=koAJ18xijCKpgh9Hxgs6EZ/agSJ7rjMVowQIHOKcihM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh4yjlF7sFtxTXf6FVhbLC1ULOcckVhVSAW9+ZdFOB53DuY9ed6L7bpamhxoPU5c13gidrUqZLK3TT9Wu1TIDxag8Riz22ZMwgVuAhLLXQgAiArilUrxFm4pjEE5dkpINPt+Y8by0eCW82KKmC043dkbrt/NNC31B1LWUTzaezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+ieevYi; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61149e50602so5218407b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712833359; x=1713438159; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2mHoLWByMG5hFDATGezwiAdEXftWUdi3XEvIaRp+Grs=;
        b=J+ieevYidQPN/OMZMFD+/oVAUd2FRm41CrCahvabNUOqk60ERdCEUAQX5nsi7W/ppt
         oxGhTQXMzvrBngTR5Age3zAectO1RQy2dE4XwMO6rcbRuppugtqHW0VOUntjrcDpS5bD
         byHS2hI8ymnMhOvmC/GEsQ1EfQnRaB8nqBuOghA5o3BBzCu6NdswwKQFhO9YYoTDYZBd
         xQxnEm7yRd1Qx9HWRS1yuzH2s38bcrMNTZ5HwEApJATkO08ODmSVgXYod11SdSSRwfs1
         w5+Z5RspcvDYqXC07wzbvn65n+ylmRRZGduJT278EQ/qhsFvmOC0zdmO8pJ+H/8tw4PP
         rM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833359; x=1713438159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mHoLWByMG5hFDATGezwiAdEXftWUdi3XEvIaRp+Grs=;
        b=AwAz+hVwbBIhoirqACENiyOfORwd5IjnofoNiKnHJNemnVQiP3o5HBjUaRpjN60ExA
         /X5Qt5iATe5yo6JrkRGQ57ng3F9ZOuuoOKJjAaQhx1fyrdHqhfruqcVDmu9AJ15MnG5h
         gZAlR1hLbzzaUyi3gYKRuIOvNFOV2x0AgBrx1fjvl8CPNl1z0tYjbdkYrnpyDR+BXrJB
         PdBHdEDnSVdjZjGC2cvmechyof9VE1MsrXE6IEymNio9h+93wcl/jF5QkaYi8sW/D0zX
         cA5wnODWM0eaoFrXQ3WWA0CWx9t393mYPJBsdJnSy08oNZKmR51Dm91mgzgj1Z10A6pA
         nglA==
X-Forwarded-Encrypted: i=1; AJvYcCUYXAPvK2aRi4T1bv7U0mBLN7nfRCFcTulnFaQMtyWmkwNYQFEBmxhbvK1wPYwyz0XhDEkrI7R9KwvVJycx9zYGBWDJA5i2qHW8Qpw49A==
X-Gm-Message-State: AOJu0Yxg7W045qoR+AS6ELC7KhPQ1e/zAyQxShiRsenNjW9VmTCaupM0
	CHkNkKUC9cPq8kD8C4Hfo988zpFeZS2Q8IVrGi4yvzTakbRpaOJ4CCJIJSgVVA8VGp3YqIw/RHW
	AknZ8GFw7vP4R8jNweXVr3T5bi2rlxPXpphSmzg==
X-Google-Smtp-Source: AGHT+IHh3bUULY9MUYjKN8n1JEV1+Ozve/17NFF9n0p/vOM0uIES+twT0cn21u0mGgHaaPc0bylLuIv5XjeucA3l8cg=
X-Received: by 2002:a05:690c:6a0e:b0:618:1eff:24e4 with SMTP id
 ih14-20020a05690c6a0e00b006181eff24e4mr1775777ywb.15.1712833358989; Thu, 11
 Apr 2024 04:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411-pm8xxx-vibrator-new-design-v9-0-7bf56cb92b28@quicinc.com>
 <20240411-pm8xxx-vibrator-new-design-v9-4-7bf56cb92b28@quicinc.com>
In-Reply-To: <20240411-pm8xxx-vibrator-new-design-v9-4-7bf56cb92b28@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 14:02:28 +0300
Message-ID: <CAA8EJprJ4s-o1uPiPjRpq4nwG4cdV7K8XMhVLOQn2D=kJLiVzQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] input: pm8xxx-vibrator: add new SPMI vibrator support
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 11:32, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 51 +++++++++++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index 2959edca8eb9..35bb6f450fd2 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -12,10 +12,10 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>
> -#define VIB_MAX_LEVEL_mV       (3100)
> -#define VIB_MIN_LEVEL_mV       (1200)
> -#define VIB_PER_STEP_mV        (100)
> -#define VIB_MAX_LEVELS         (VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV + VIB_PER_STEP_mV)
> +#define VIB_MAX_LEVEL_mV(vib)  (vib->drv2_addr ? 3544 : 3100)
> +#define VIB_MIN_LEVEL_mV(vib)  (vib->drv2_addr ? 1504 : 1200)
> +#define VIB_PER_STEP_mV(vib)   (vib->drv2_addr ? 8 : 100)
> +#define VIB_MAX_LEVELS(vib)    (VIB_MAX_LEVEL_mV(vib) - VIB_MIN_LEVEL_mV(vib) + VIB_PER_STEP_mV(vib))
>
>  #define MAX_FF_SPEED           0xff
>
> @@ -26,6 +26,9 @@ struct pm8xxx_regs {
>         unsigned int drv_offset;
>         unsigned int drv_mask;
>         unsigned int drv_shift;
> +       unsigned int drv2_offset;
> +       unsigned int drv2_mask;
> +       unsigned int drv2_shift;
>         unsigned int drv_en_manual_mask;
>  };
>
> @@ -45,6 +48,18 @@ static struct pm8xxx_regs pm8916_regs = {
>         .drv_en_manual_mask = 0,
>  };
>
> +static struct pm8xxx_regs pmi632_regs = {
> +       .enable_offset = 0x46,
> +       .enable_mask = BIT(7),
> +       .drv_offset = 0x40,
> +       .drv_mask = GENMASK(7, 0),
> +       .drv_shift = 0,
> +       .drv2_offset = 0x41,
> +       .drv2_mask = GENMASK(3, 0),
> +       .drv2_shift = 8,
> +       .drv_en_manual_mask = 0,
> +};
> +
>  /**
>   * struct pm8xxx_vib - structure to hold vibrator data
>   * @vib_input_dev: input device supporting force feedback
> @@ -53,6 +68,7 @@ static struct pm8xxx_regs pm8916_regs = {
>   * @regs: registers' info
>   * @enable_addr: vibrator enable register
>   * @drv_addr: vibrator drive strength register
> + * @drv2_addr: vibrator drive strength upper byte register
>   * @speed: speed of vibration set from userland
>   * @active: state of vibrator
>   * @level: level of vibration to set in the chip
> @@ -65,6 +81,7 @@ struct pm8xxx_vib {
>         const struct pm8xxx_regs *regs;
>         unsigned int enable_addr;
>         unsigned int drv_addr;
> +       unsigned int drv2_addr;
>         int speed;
>         int level;
>         bool active;
> @@ -82,6 +99,10 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>         unsigned int val = vib->reg_vib_drv;
>         const struct pm8xxx_regs *regs = vib->regs;
>
> +       /* vibrator without drv2_addr needs be programmed in step increments */

How are these two items related? Are you using vib->drv2_addr as a
marker for 'particular generation'? In such a case please use a flag
instead.

The rest looks good to me.

> +       if (!vib->drv2_addr)
> +               vib->level /= VIB_PER_STEP_mV(vib);
> +
>         if (on)
>                 val |= (vib->level << regs->drv_shift) & regs->drv_mask;
>         else
> @@ -93,6 +114,17 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>
>         vib->reg_vib_drv = val;
>
> +       if (regs->drv2_mask) {
> +               if (on)
> +                       val = (vib->level << regs->drv2_shift) & regs->drv2_mask;
> +               else
> +                       val = 0;
> +
> +               rc = regmap_write_bits(vib->regmap, vib->drv2_addr, regs->drv2_mask, val);
> +               if (rc < 0)
> +                       return rc;
> +       }
> +
>         if (regs->enable_mask)
>                 rc = regmap_update_bits(vib->regmap, vib->enable_addr,
>                                         regs->enable_mask, on ? regs->enable_mask : 0);
> @@ -115,17 +147,16 @@ static void pm8xxx_work_handler(struct work_struct *work)
>                 return;
>
>         /*
> -        * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
> +        * pmic vibrator supports voltage ranges from MIN_LEVEL to MAX_LEVEL, so
>          * scale the level to fit into these ranges.
>          */
>         if (vib->speed) {
>                 vib->active = true;
> -               vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
> -                                               VIB_MIN_LEVEL_mV;
> -               vib->level /= VIB_PER_STEP_mV;
> +               vib->level = VIB_MIN_LEVEL_mV(vib);
> +               vib->level += mult_frac(VIB_MAX_LEVELS(vib), vib->speed, MAX_FF_SPEED);
>         } else {
>                 vib->active = false;
> -               vib->level = VIB_MIN_LEVEL_mV / VIB_PER_STEP_mV;
> +               vib->level = VIB_MIN_LEVEL_mV(vib);
>         }
>
>         pm8xxx_vib_set(vib, vib->active);
> @@ -203,6 +234,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
>
>         vib->enable_addr = reg_base + regs->enable_offset;
>         vib->drv_addr = reg_base + regs->drv_offset;
> +       vib->drv2_addr = reg_base + regs->drv2_offset;
>
>         /* operate in manual mode */
>         error = regmap_read(vib->regmap, vib->drv_addr, &val);
> @@ -257,6 +289,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
>         { .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
>         { .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
>         { .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
> +       { .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

