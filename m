Return-Path: <linux-arm-msm+bounces-3776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34280925E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 21:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3449928207B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B625B51C27;
	Thu,  7 Dec 2023 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iiosz+gu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD571715
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 12:33:43 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d8a772157fso11217657b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701981223; x=1702586023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIRxzhzVtsqgMI+43p2f/sqzz1hjajMZ1d/5iYX1fFU=;
        b=iiosz+guOn/78mg/qHKx1/diwChtLgUAgmxsYzeBCxh5Em1xrOEWve/g/EGjUxmh48
         QJCCQlpqc6v9Nymfi+ZQMP0qj+uNHlMtVkZtgBcUfoJo3i9ej8nbZZc0zzVOR7hqsXCT
         HkrbSs1uZYyyAJGSQPKGmvPzLN2kGJV4Wj4V8DaOHdSEyFqEzUaZDkAnBvFmY+RGSk8F
         DN1hi/D5tYzp26kwJVXbrQaXG+I2zLao0BFiCUTUp8FY7l6yMj265/A4NhF5wx2gGcBJ
         3WrtsA/ICoH2XeyjPGIoEVicGpWM0GDd4b7Dd06fivqK257bI8FVMo27LI2q1iQ0vUYv
         RvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701981223; x=1702586023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIRxzhzVtsqgMI+43p2f/sqzz1hjajMZ1d/5iYX1fFU=;
        b=Q5ufG+JARvcXqcZncwYU9wcS5hcEDQMY1txnIhgcvx6427F53k7Y6lLrhv7HWkTmXI
         I96iQSTVhnP5LKrTk/VfKSITsLIIxxAkZFBk6jEdU7p7r69IE6B0iY3rjFM6zzGh0VNR
         5kdy+hb6zDrocWS8+6YloIkCau3URHxm2WyS2HIaOGbalRDt8e1CXYuuF53LjOEkYAbH
         acguH0CLcX1EmVnjwrcwO7sbTN40ecOh+/QZD6RR0QDaTfuoUjYWBPNi/qfkdVCGakCG
         mO02gwIWy5+CL433hI7i9h80aJmYgbl5RrUpkvQC07ToBZlNBFJWoPrGN55DSPpTBK/r
         QWkQ==
X-Gm-Message-State: AOJu0Yzb5NNd5V033Zw7WCsWpiFIVHv6R1EocJElePsZ9FbyR2Vb0Gkq
	9Hixrr8VlMjm83zSIny21gyJCGLfOnhBtVU/hZaO1g==
X-Google-Smtp-Source: AGHT+IG6cwY7RTmlNimHt2rpHbE2/N4hid0deuq+MHvegPu66yWZP0WS1Fl5pRjLIpZjDAEs3ZXT+sD0C2EXWIFQZJU=
X-Received: by 2002:a81:4f84:0:b0:5d7:1941:aa2 with SMTP id
 d126-20020a814f84000000b005d719410aa2mr3153255ywb.61.1701981222767; Thu, 07
 Dec 2023 12:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
 <20231207130703.3322321-4-dmitry.baryshkov@linaro.org> <ZXH88_nwT_3g6MS9@gerhold.net>
In-Reply-To: <ZXH88_nwT_3g6MS9@gerhold.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 22:33:31 +0200
Message-ID: <CAA8EJpoV0yEu_tQ9Xep643osXB21Z17yGrJQzwwfV32_voUS0w@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] soc: qcom: spm: add support for voltage regulator
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 19:12, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Thu, Dec 07, 2023 at 04:06:56PM +0300, Dmitry Baryshkov wrote:
> > The SPM / SAW2 device also provides a voltage regulator functionality
> > with optional AVS (Adaptive Voltage Scaling) support. The exact register
> > sequence and voltage ranges differs from device to device.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> There is some overlap here with the spmi_saw_set_vdd() functionality in
> qcom_spmi-regulator.c, at least for the SoCs with SPMI PMICs (e.g.
> MSM8974 etc). You don't add support for these in this patch series yet
> but I think it would be good to clarify how we would expect to handle
> those. In other words:
>
>  - Would we handle them in qcom_spmi-regulator.c and keep the code in
>    the spm.c driver only for the non-SPMI platforms?
>
>  - Should we add this in a SSBI regulator driver instead for consistency?
>
>  - Or should we move the existing functionality in qcom_spmi-regulator.c
>    to here?

The spmi_saw_set_vdd() is a definite hack and ideally it should be
dropped. It is not possible, though, existing msm8996 DT uses that
spmi/saw regulator to power on the CPU cores. We have to remain
compatible with that hack.
But my intent is to have all other platforms use the spm.c (and
migrate msm8996 at some point too).

>
> > ---
> >  drivers/soc/qcom/spm.c | 221 ++++++++++++++++++++++++++++++++++++++++-
> >  include/soc/qcom/spm.h |   9 ++
> >  2 files changed, 225 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> > index 2f0b1bfe7658..595e2afb2141 100644
> > --- a/drivers/soc/qcom/spm.c
> > +++ b/drivers/soc/qcom/spm.c
> > [...]
> > @@ -238,6 +273,181 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
> >       spm_register_write_sync(drv, SPM_REG_SPM_CTL, ctl_val);
> >  }
> >
> > +static int spm_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> > +{
> > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > +
> > +     drv->volt_sel = selector;
> > +
> > +     /* Always do the SAW register writes on the corresponding CPU */
> > +     return smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
> > +}
> > +
> > +static int spm_get_voltage_sel(struct regulator_dev *rdev)
> > +{
> > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > +
> > +     return drv->volt_sel;
> > +}
> > +
> > +static const struct regulator_ops spm_reg_ops = {
> > +     .set_voltage_sel        = spm_set_voltage_sel,
> > +     .get_voltage_sel        = spm_get_voltage_sel,
> > +     .list_voltage           = regulator_list_voltage_linear_range,
> > +     .set_voltage_time_sel   = regulator_set_voltage_time_sel,
> > +};
> > +
> > +static void smp_set_vdd_v1_1(void *data)
> > +{
> > +     struct spm_driver_data *drv = data;
> > +     unsigned int vctl, data0, data1, avs_ctl, sts;
> > +     unsigned int vlevel, volt_sel;
> > +     bool avs_enabled;
> > +
> > +     volt_sel = drv->volt_sel;
> > +     vlevel = volt_sel | 0x80; /* band */
> > +
> > +     avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
> > +     vctl = spm_register_read(drv, SPM_REG_VCTL);
> > +     data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
> > +     data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
> > +
> > +     avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
> > +
> > +     /* If AVS is enabled, switch it off during the voltage change */
> > +     if (avs_enabled) {
> > +             avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
> > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > +     }
> > +
> > +     /* Kick the state machine back to idle */
> > +     spm_register_write(drv, SPM_REG_RST, 1);
> > +
> > +     vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
> > +     data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
> > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
> > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
> > +
> > +     spm_register_write(drv, SPM_REG_VCTL, vctl);
> > +     spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
> > +     spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
> > +
> > +     if (read_poll_timeout_atomic(spm_register_read,
> > +                                  sts, sts == vlevel,
> > +                                  1, 200, false,
> > +                                  drv, SPM_REG_STS1)) {
> > +             dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
> > +             goto enable_avs;
> > +     }
> > +
> > +     if (avs_enabled) {
> > +             unsigned int max_avs = volt_sel;
> > +             unsigned int min_avs = max(max_avs, 4U) - 4;
> > +
> > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
> > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
> > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > +     }
> > +
> > +enable_avs:
> > +     if (avs_enabled) {
> > +             avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
> > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > +     }
> > +}
> > +
> > +static int spm_get_cpu(struct device *dev)
> > +{
> > +     int cpu;
> > +     bool found;
> > +
> > +     for_each_possible_cpu(cpu) {
> > +             struct device_node *cpu_node, *saw_node;
> > +
> > +             cpu_node = of_cpu_device_node_get(cpu);
> > +             if (!cpu_node)
> > +                     continue;
> > +
> > +             saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
> > +             found = (saw_node == dev->of_node);
> > +             of_node_put(saw_node);
> > +             of_node_put(cpu_node);
> > +
> > +             if (found)
> > +                     return cpu;
> > +     }
> > +
> > +     /* L2 SPM is not bound to any CPU, tie it to CPU0 */
>
> Is this necessary? I would kind of expect that it's only important that
> this doesn't happen in parallel on multiple CPUs. The lock in the
> regulator core should already ensure that, though. It's somewhat
> expensive to schedule on other cores, especially if they are currently
> idle and power collapsed.

If I understand correctly, it is the other way around. From the msm
kernels I see that CPU SPM calls are scheduled to be executed only on
the corresponding CPU/core. For L2 we didn't have the CPU, so to keep
the same code path I selected for them to be executed on CPU0. At this
point I'm not even sure if this cpu0 comes from the downstream tree or
not.

>
> I don't have too much experience with these really old platforms but at
> least on MSM8916 I can't think of any reason that would make the CPU0
> more special for the L2 cache than the others (MSM8916 has the regulator
> stuff only in the L2 SAW since there is just one CPU power rail).
>
> Thanks,
> Stephan



-- 
With best wishes
Dmitry

