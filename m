Return-Path: <linux-arm-msm+bounces-17323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEC8A2D92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 13:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4C01C2357A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 11:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA585577C;
	Fri, 12 Apr 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tv4H3LWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7B54FA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712921762; cv=none; b=EeuuXi9klHbth7KlApH4/bKLvHBOcVYMM+axQ8+dlKxqMQfxx6Us7yXnNljyIk3eUDNB/20cAEduQQGEjvSA1d7CbRFKpkYJXBv39AREhWnE5ThUimHlAfp/oRERhJY+dFz10DCADTheg0VW0UoufALd19znie1eU8jG5eNV5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712921762; c=relaxed/simple;
	bh=NJF9N4arR9462Jsp+bJZ0yQrDcj61RvYHjkyBCMqT78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmN2PSfapC3f31a5QsqLQ/vWyiwst7szbsQ3ecWox5/4YYWW50RT54V4Qm09qZSYmvpVsddJQTmd6CnS/9C8p2agLbYztJMXpfXyD6aPj6IPcPXEGjQcNcrcRjrX//h3ADWRNmBcwVWJlBlZDtFhEqSDBK9BgtG4xIAbo20qL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tv4H3LWh; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso812719276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712921759; x=1713526559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoi9o7ixA5Pm/ONJhdvvFOJW2mpeRIaiK/Xo8GdOqnQ=;
        b=tv4H3LWh0jHveE2ydL/qdQID4WjWxl5ghR4owyfZSPnGjK9S0UYjRWLOwVsJ+DO+fJ
         2+pdGZmB8GGBnNj8cvdO2ShWUiCMnHQaf8tyOG0ZEqEEuv8zuqH3TvkyrOkMZYhCMHlx
         fDJnNdmUWZYPgoI8iQCmaitkTBRnUdgVPe9UhoTvUxr7T8suaGQJHGCpkAiygWAtg//N
         r1mDurWYV/xi2hjU4GqnRr/3YvumLyUrNInRyZyRdyPxPvI4j+S4zPwwA+/Qq0uM7AAG
         f5BgXsao3pUCIFL42ZicTCU2iVs/1kX3uhhkqWiNG4yBBO2Rc23Tx6ekb6Ix2S6JJR1m
         wphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712921759; x=1713526559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoi9o7ixA5Pm/ONJhdvvFOJW2mpeRIaiK/Xo8GdOqnQ=;
        b=f2osgZwHvlvv6crCsbjFu6ZpY6XSUzq0Faeo3bOdBbEnLbHImTjkFuDdg6UsZrSp4q
         rBwSP+li+bFCZGWfy6CmhpmesgzMESWJ/dVDXdcCZVf4u5Akmo5pfIlj+OSbeNzGvVc5
         TVPGATMOpFXGrzVR61pYm+RGLr1tvkXI+h1yZGfA/eZvFF2gZ9J4gswtfMq0vkXEx3Y1
         ln6Wqd0z6qZHI+jNVMMCUM7F1ef/hNTwRabY5pV6zDpZuECU43ED/lzeJVOwMeKQumDf
         ShUOxfsoQ7I2Tqmr4ZNVR/7sB1yUGkOI7Ky7xNZzY1EwQTXBjJV4CLtJeyl8HisML2yK
         zCXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSTQVJIzKTEMJ4C7JQ0upo0+ZFGwNKIb4nfIo+c3KqY2f1jz1FWIItiM2JbDG/hL13GXX5qTCKjf0JVtHnPdaKdPBk7S30ng3ilGb3jw==
X-Gm-Message-State: AOJu0YxakRbbJ5rWMPUo+sOr4uNvzna3xviO1XvyNB3FWzPLnuAv+VQV
	pNALxO1vQdw/7mQTG06f2Xt42CluK5Wre1kEqSf8X3Ajti/yv5H1Wvj+ppU82o2IfpPtgp1ViDo
	c+H9G8TwhqsnRNeVb82XPXEhgOlI/0UkHwiS2jQ==
X-Google-Smtp-Source: AGHT+IGQA5NucnqxXQywOYE6z8CWOtmRY95fpQ3qkM3KXKr1Pc2aGN+8hWc+fqmN/ggp9dUCxqTQvK3kQVxgatjzfgk=
X-Received: by 2002:a05:6902:307:b0:dc7:5a73:184e with SMTP id
 b7-20020a056902030700b00dc75a73184emr2229795ybs.14.1712921757947; Fri, 12 Apr
 2024 04:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411-pm8xxx-vibrator-new-design-v9-0-7bf56cb92b28@quicinc.com>
 <20240411-pm8xxx-vibrator-new-design-v9-4-7bf56cb92b28@quicinc.com>
 <CAA8EJprJ4s-o1uPiPjRpq4nwG4cdV7K8XMhVLOQn2D=kJLiVzQ@mail.gmail.com>
 <c2ee9ab0-ecb2-aba2-2cc9-653f74d27396@quicinc.com> <CAA8EJppJOQ+-XtgJZa01uqYdqXJdfNznR1OUbWua_myzUqNBUA@mail.gmail.com>
 <633c4f8c-c22c-4128-b478-0627da8660bd@quicinc.com>
In-Reply-To: <633c4f8c-c22c-4128-b478-0627da8660bd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 14:35:50 +0300
Message-ID: <CAA8EJpp=K11+U=FeMhscaRAG1k_Zo39faw8JGerdgGj67MhJmw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] input: pm8xxx-vibrator: add new SPMI vibrator support
To: Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 07:05, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>
>
>
> On 4/11/2024 10:21 PM, Dmitry Baryshkov wrote:
> > On Thu, 11 Apr 2024 at 16:51, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2024/4/11 19:02, Dmitry Baryshkov wrote:
> >>> On Thu, 11 Apr 2024 at 11:32, Fenglin Wu via B4 Relay
> >>> <devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
> >>>>
> >>>> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>>>
> >>>> Add support for a new SPMI vibrator module which is very similar
> >>>> to the vibrator module inside PM8916 but has a finer drive voltage
> >>>> step and different output voltage range, its drive level control
> >>>> is expanded across 2 registers. The vibrator module can be found
> >>>> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
> >>>>
> >>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>>> ---
> >>>>    drivers/input/misc/pm8xxx-vibrator.c | 51 +++++++++++++++++++++++++++++-------
> >>>>    1 file changed, 42 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> >>>> index 2959edca8eb9..35bb6f450fd2 100644
> >>>> --- a/drivers/input/misc/pm8xxx-vibrator.c
> >>>> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> >>>> @@ -12,10 +12,10 @@
> >>>>    #include <linux/regmap.h>
> >>>>    #include <linux/slab.h>
> >>>>
> >>>> -#define VIB_MAX_LEVEL_mV       (3100)
> >>>> -#define VIB_MIN_LEVEL_mV       (1200)
> >>>> -#define VIB_PER_STEP_mV        (100)
> >>>> -#define VIB_MAX_LEVELS         (VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV + VIB_PER_STEP_mV)
> >>>> +#define VIB_MAX_LEVEL_mV(vib)  (vib->drv2_addr ? 3544 : 3100)
> >>>> +#define VIB_MIN_LEVEL_mV(vib)  (vib->drv2_addr ? 1504 : 1200)
> >>>> +#define VIB_PER_STEP_mV(vib)   (vib->drv2_addr ? 8 : 100)
> >>>> +#define VIB_MAX_LEVELS(vib)    (VIB_MAX_LEVEL_mV(vib) - VIB_MIN_LEVEL_mV(vib) + VIB_PER_STEP_mV(vib))
> >>>>
> >>>>    #define MAX_FF_SPEED           0xff
> >>>>
> >>>> @@ -26,6 +26,9 @@ struct pm8xxx_regs {
> >>>>           unsigned int drv_offset;
> >>>>           unsigned int drv_mask;
> >>>>           unsigned int drv_shift;
> >>>> +       unsigned int drv2_offset;
> >>>> +       unsigned int drv2_mask;
> >>>> +       unsigned int drv2_shift;
> >>>>           unsigned int drv_en_manual_mask;
> >>>>    };
> >>>>
> >>>> @@ -45,6 +48,18 @@ static struct pm8xxx_regs pm8916_regs = {
> >>>>           .drv_en_manual_mask = 0,
> >>>>    };
> >>>>
> >>>> +static struct pm8xxx_regs pmi632_regs = {
> >>>> +       .enable_offset = 0x46,
> >>>> +       .enable_mask = BIT(7),
> >>>> +       .drv_offset = 0x40,
> >>>> +       .drv_mask = GENMASK(7, 0),
> >>>> +       .drv_shift = 0,
> >>>> +       .drv2_offset = 0x41,
> >>>> +       .drv2_mask = GENMASK(3, 0),
> >>>> +       .drv2_shift = 8,
> >>>> +       .drv_en_manual_mask = 0,
> >>>> +};
> >>>> +
> >>>>    /**
> >>>>     * struct pm8xxx_vib - structure to hold vibrator data
> >>>>     * @vib_input_dev: input device supporting force feedback
> >>>> @@ -53,6 +68,7 @@ static struct pm8xxx_regs pm8916_regs = {
> >>>>     * @regs: registers' info
> >>>>     * @enable_addr: vibrator enable register
> >>>>     * @drv_addr: vibrator drive strength register
> >>>> + * @drv2_addr: vibrator drive strength upper byte register
> >>>>     * @speed: speed of vibration set from userland
> >>>>     * @active: state of vibrator
> >>>>     * @level: level of vibration to set in the chip
> >>>> @@ -65,6 +81,7 @@ struct pm8xxx_vib {
> >>>>           const struct pm8xxx_regs *regs;
> >>>>           unsigned int enable_addr;
> >>>>           unsigned int drv_addr;
> >>>> +       unsigned int drv2_addr;
> >>>>           int speed;
> >>>>           int level;
> >>>>           bool active;
> >>>> @@ -82,6 +99,10 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
> >>>>           unsigned int val = vib->reg_vib_drv;
> >>>>           const struct pm8xxx_regs *regs = vib->regs;
> >>>>
> >>>> +       /* vibrator without drv2_addr needs be programmed in step increments */
> >>>
> >>> How are these two items related? Are you using vib->drv2_addr as a
> >>> marker for 'particular generation'? In such a case please use a flag
> >>> instead.
> >>>
> >>> The rest looks good to me.
> >>>
> >> Are you suggesting to add a flag in pm8xxx_vib as a discriminator for
> >> the new generation? I actually tried to avoid that because of this comment:
> >> https://lore.kernel.org/linux-arm-msm/ZgXSBiQcBEbwF060@google.com/#t
> >
> > Add a flag for level being programmed in steps or in mV. Using
> > drv2_addr instead of such flag is a hack.
> >
> Thanks Dmitry.
> Does this flag look good to you?

Yes, this is much better from my POV

>
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c
> b/drivers/input/misc/pm8xxx-vibrator.c
> index 35bb6f450fd2..4708f441e5ac 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -30,6 +30,7 @@ struct pm8xxx_regs {
>          unsigned int drv2_mask;
>          unsigned int drv2_shift;
>          unsigned int drv_en_manual_mask;
> +       bool         drv_in_step;
>   };
>
>   static const struct pm8xxx_regs pm8058_regs = {
> @@ -37,6 +38,7 @@ static const struct pm8xxx_regs pm8058_regs = {
>          .drv_mask = 0xf8,
>          .drv_shift = 3,
>          .drv_en_manual_mask = 0xfc,
> +       .drv_in_step = true;
>   };
>
>   static struct pm8xxx_regs pm8916_regs = {
> @@ -46,6 +48,7 @@ static struct pm8xxx_regs pm8916_regs = {
>          .drv_mask = 0x1F,
>          .drv_shift = 0,
>          .drv_en_manual_mask = 0,
> +       .drv_in_step = true;
>   };
>
>   static struct pm8xxx_regs pmi632_regs = {
> @@ -58,6 +61,7 @@ static struct pm8xxx_regs pmi632_regs = {
>          .drv2_mask = GENMASK(3, 0),
>          .drv2_shift = 8,
>          .drv_en_manual_mask = 0,
> +       .drv_in_step = false,
>   };
>
>   /**
> @@ -100,7 +104,7 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib,
> bool on)
>          const struct pm8xxx_regs *regs = vib->regs;
>
>          /* vibrator without drv2_addr needs be programmed in step
> increments */
> -       if (!vib->drv2_addr)
> +       if (regs->drv_in_step)
>                  vib->level /= VIB_PER_STEP_mV(vib);
>
>          if (on)
>
>
> >>
> >>>> +       if (!vib->drv2_addr)
> >>>> +               vib->level /= VIB_PER_STEP_mV(vib);
> >>>> +
> >>>>           if (on)
> >>>>                   val |= (vib->level << regs->drv_shift) & regs->drv_mask;
> >>>>           else
> >>>> @@ -93,6 +114,17 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
> >>>>
> >>>>           vib->reg_vib_drv = val;
> >>>>
> >>>> +       if (regs->drv2_mask) {
> >>>> +               if (on)
> >>>> +                       val = (vib->level << regs->drv2_shift) & regs->drv2_mask;
> >>>> +               else
> >>>> +                       val = 0;
> >>>> +
> >>>> +               rc = regmap_write_bits(vib->regmap, vib->drv2_addr, regs->drv2_mask, val);
> >>>> +               if (rc < 0)
> >>>> +                       return rc;
> >>>> +       }
> >>>> +
> >>>>           if (regs->enable_mask)
> >>>>                   rc = regmap_update_bits(vib->regmap, vib->enable_addr,
> >>>>                                           regs->enable_mask, on ? regs->enable_mask : 0);
> >>>> @@ -115,17 +147,16 @@ static void pm8xxx_work_handler(struct work_struct *work)
> >>>>                   return;
> >>>>
> >>>>           /*
> >>>> -        * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
> >>>> +        * pmic vibrator supports voltage ranges from MIN_LEVEL to MAX_LEVEL, so
> >>>>            * scale the level to fit into these ranges.
> >>>>            */
> >>>>           if (vib->speed) {
> >>>>                   vib->active = true;
> >>>> -               vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
> >>>> -                                               VIB_MIN_LEVEL_mV;
> >>>> -               vib->level /= VIB_PER_STEP_mV;
> >>>> +               vib->level = VIB_MIN_LEVEL_mV(vib);
> >>>> +               vib->level += mult_frac(VIB_MAX_LEVELS(vib), vib->speed, MAX_FF_SPEED);
> >>>>           } else {
> >>>>                   vib->active = false;
> >>>> -               vib->level = VIB_MIN_LEVEL_mV / VIB_PER_STEP_mV;
> >>>> +               vib->level = VIB_MIN_LEVEL_mV(vib);
> >>>>           }
> >>>>
> >>>>           pm8xxx_vib_set(vib, vib->active);
> >>>> @@ -203,6 +234,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
> >>>>
> >>>>           vib->enable_addr = reg_base + regs->enable_offset;
> >>>>           vib->drv_addr = reg_base + regs->drv_offset;
> >>>> +       vib->drv2_addr = reg_base + regs->drv2_offset;
> >>>>
> >>>>           /* operate in manual mode */
> >>>>           error = regmap_read(vib->regmap, vib->drv_addr, &val);
> >>>> @@ -257,6 +289,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
> >>>>           { .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
> >>>>           { .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
> >>>>           { .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
> >>>> +       { .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
> >>>>           { }
> >>>>    };
> >>>>    MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

