Return-Path: <linux-arm-msm+bounces-3783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC8809731
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCAF8B20DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD7A29;
	Fri,  8 Dec 2023 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DnExjmS5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE6A19A6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:25:26 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-db54611b920so1568721276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701995126; x=1702599926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rDSMGTgiHf2SkuY0Aa9R+zvd7FhhJvzB1Jcc2y777kw=;
        b=DnExjmS5M00J4qBO7u1WZZsGa0L3mAe9iP8JTmaCWcHxZopjZ3X3g6vTecssUL8wiV
         uWZDH/ptCs5TEsdSVacBTM1whfVk0UiYYICKNvtS9quw2hbV2wqtP9KZv84MtePP+GFo
         kPVbIe2WqzCTP2upuP4DItDHUkijWxn6u412NArF0k6coH6Af0mgt4exDGX8OymWIUaE
         5w0KIg0zYnBX0Zp2o4zN9SpHyaqSoepFKlBSxnoEZ+hpeIiFXE6oE1NS7FdXCurYSxCh
         d5pSm5okOcgmjJLghAHFllnc36QIpTe0fu4Sxl2NLBtCBZZ6LzoW/mI0ew074ZGGR0Av
         hOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701995126; x=1702599926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDSMGTgiHf2SkuY0Aa9R+zvd7FhhJvzB1Jcc2y777kw=;
        b=fVfLdHOdT+kaxUhZr46YldrFH5afOiR/VWkEleG7f+0ufTwke2Stn5Ak2YIlJnBY1G
         QHLmri0ekhyXJrVqAJRVTLGSbiFIlIkTsVx1iXGVsrMkfMdWqd/qrdX+nAmy7CvaYJ/S
         KI6sgvkoaSmLMmKYHJ3eCDf+imIEkjet2KkE36oj9MvrDhzDkIdHLdkPqsYHjF4+S3OT
         ZTVnhoIRyu6/9vSBNZyEcydtLYXeFwMVlFPqIa9GIHqf/slac/Jg2nkuIhrBWNhOtfHS
         qP75p7zOMZmpYM5JGasnhye1WJ8569PnFkVhVmkEi5bztbILzztbVBifVvfykLs7YdS/
         DSkA==
X-Gm-Message-State: AOJu0Yw+ZVgFwGBP1bA5sbKVQSCsba2o537TSjwNif2xHkxVJTcliXzd
	+9feOOp397/o115YaxBseA3pH6AKO46tQXC1CiM6vA==
X-Google-Smtp-Source: AGHT+IGPaZ43RtYA9P7WIT2S4G+0qJ4OeP1i+/+GYqmlAYCKb0x2ue8SWuwQy0ca3m4scUZ8MleyolFrH/HYXEIlaNk=
X-Received: by 2002:a5b:dc3:0:b0:db7:dacf:2f14 with SMTP id
 t3-20020a5b0dc3000000b00db7dacf2f14mr3015631ybr.91.1701995125904; Thu, 07 Dec
 2023 16:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
 <20231207130703.3322321-4-dmitry.baryshkov@linaro.org> <ZXH88_nwT_3g6MS9@gerhold.net>
 <CAA8EJpoV0yEu_tQ9Xep643osXB21Z17yGrJQzwwfV32_voUS0w@mail.gmail.com> <ZXI6aNleedfd7XjT@gerhold.net>
In-Reply-To: <ZXI6aNleedfd7XjT@gerhold.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 02:25:14 +0200
Message-ID: <CAA8EJppCnBs1PGA5ON=Wzn4-9pW-mL6tf1gy6JfoYVmL16yg9Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] soc: qcom: spm: add support for voltage regulator
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 23:34, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Thu, Dec 07, 2023 at 10:33:31PM +0200, Dmitry Baryshkov wrote:
> > On Thu, 7 Dec 2023 at 19:12, Stephan Gerhold <stephan@gerhold.net> wrote:
> > > On Thu, Dec 07, 2023 at 04:06:56PM +0300, Dmitry Baryshkov wrote:
> > > > The SPM / SAW2 device also provides a voltage regulator functionality
> > > > with optional AVS (Adaptive Voltage Scaling) support. The exact register
> > > > sequence and voltage ranges differs from device to device.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > There is some overlap here with the spmi_saw_set_vdd() functionality in
> > > qcom_spmi-regulator.c, at least for the SoCs with SPMI PMICs (e.g.
> > > MSM8974 etc). You don't add support for these in this patch series yet
> > > but I think it would be good to clarify how we would expect to handle
> > > those. In other words:
> > >
> > >  - Would we handle them in qcom_spmi-regulator.c and keep the code in
> > >    the spm.c driver only for the non-SPMI platforms?
> > >
> > >  - Should we add this in a SSBI regulator driver instead for consistency?
> > >
> > >  - Or should we move the existing functionality in qcom_spmi-regulator.c
> > >    to here?
> >
> > The spmi_saw_set_vdd() is a definite hack and ideally it should be
> > dropped. It is not possible, though, existing msm8996 DT uses that
> > spmi/saw regulator to power on the CPU cores. We have to remain
> > compatible with that hack.
> > But my intent is to have all other platforms use the spm.c (and
> > migrate msm8996 at some point too).
>
> Thanks, sounds reasonable.
>
> >
> > >
> > > > ---
> > > >  drivers/soc/qcom/spm.c | 221 ++++++++++++++++++++++++++++++++++++++++-
> > > >  include/soc/qcom/spm.h |   9 ++
> > > >  2 files changed, 225 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> > > > index 2f0b1bfe7658..595e2afb2141 100644
> > > > --- a/drivers/soc/qcom/spm.c
> > > > +++ b/drivers/soc/qcom/spm.c
> > > > [...]
> > > > @@ -238,6 +273,181 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
> > > >       spm_register_write_sync(drv, SPM_REG_SPM_CTL, ctl_val);
> > > >  }
> > > >
> > > > +static int spm_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> > > > +{
> > > > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > > > +
> > > > +     drv->volt_sel = selector;
> > > > +
> > > > +     /* Always do the SAW register writes on the corresponding CPU */
> > > > +     return smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
> > > > +}
> > > > +
> > > > +static int spm_get_voltage_sel(struct regulator_dev *rdev)
> > > > +{
> > > > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > > > +
> > > > +     return drv->volt_sel;
> > > > +}
> > > > +
> > > > +static const struct regulator_ops spm_reg_ops = {
> > > > +     .set_voltage_sel        = spm_set_voltage_sel,
> > > > +     .get_voltage_sel        = spm_get_voltage_sel,
> > > > +     .list_voltage           = regulator_list_voltage_linear_range,
> > > > +     .set_voltage_time_sel   = regulator_set_voltage_time_sel,
> > > > +};
> > > > +
> > > > +static void smp_set_vdd_v1_1(void *data)
> > > > +{
> > > > +     struct spm_driver_data *drv = data;
> > > > +     unsigned int vctl, data0, data1, avs_ctl, sts;
> > > > +     unsigned int vlevel, volt_sel;
> > > > +     bool avs_enabled;
> > > > +
> > > > +     volt_sel = drv->volt_sel;
> > > > +     vlevel = volt_sel | 0x80; /* band */
> > > > +
> > > > +     avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
> > > > +     vctl = spm_register_read(drv, SPM_REG_VCTL);
> > > > +     data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
> > > > +     data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
> > > > +
> > > > +     avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > > +
> > > > +     /* If AVS is enabled, switch it off during the voltage change */
> > > > +     if (avs_enabled) {
> > > > +             avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > > +     }
> > > > +
> > > > +     /* Kick the state machine back to idle */
> > > > +     spm_register_write(drv, SPM_REG_RST, 1);
> > > > +
> > > > +     vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
> > > > +     data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
> > > > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
> > > > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
> > > > +
> > > > +     spm_register_write(drv, SPM_REG_VCTL, vctl);
> > > > +     spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
> > > > +     spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
> > > > +
> > > > +     if (read_poll_timeout_atomic(spm_register_read,
> > > > +                                  sts, sts == vlevel,
> > > > +                                  1, 200, false,
> > > > +                                  drv, SPM_REG_STS1)) {
> > > > +             dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
> > > > +             goto enable_avs;
> > > > +     }
> > > > +
> > > > +     if (avs_enabled) {
> > > > +             unsigned int max_avs = volt_sel;
> > > > +             unsigned int min_avs = max(max_avs, 4U) - 4;
> > > > +
> > > > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
> > > > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
> > > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > > +     }
> > > > +
> > > > +enable_avs:
> > > > +     if (avs_enabled) {
> > > > +             avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int spm_get_cpu(struct device *dev)
> > > > +{
> > > > +     int cpu;
> > > > +     bool found;
> > > > +
> > > > +     for_each_possible_cpu(cpu) {
> > > > +             struct device_node *cpu_node, *saw_node;
> > > > +
> > > > +             cpu_node = of_cpu_device_node_get(cpu);
> > > > +             if (!cpu_node)
> > > > +                     continue;
> > > > +
> > > > +             saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
> > > > +             found = (saw_node == dev->of_node);
> > > > +             of_node_put(saw_node);
> > > > +             of_node_put(cpu_node);
> > > > +
> > > > +             if (found)
> > > > +                     return cpu;
> > > > +     }
> > > > +
> > > > +     /* L2 SPM is not bound to any CPU, tie it to CPU0 */
> > >
> > > Is this necessary? I would kind of expect that it's only important that
> > > this doesn't happen in parallel on multiple CPUs. The lock in the
> > > regulator core should already ensure that, though. It's somewhat
> > > expensive to schedule on other cores, especially if they are currently
> > > idle and power collapsed.
> >
> > If I understand correctly, it is the other way around. From the msm
> > kernels I see that CPU SPM calls are scheduled to be executed only on
> > the corresponding CPU/core. For L2 we didn't have the CPU, so to keep
> > the same code path I selected for them to be executed on CPU0. At this
> > point I'm not even sure if this cpu0 comes from the downstream tree or
> > not.
> >
>
> Hm, does 8064/8960 set any voltages through the L2 SPM at all? From a
> quick look I see only the core SPMs being used as regulators, the L2 SPM
> seems to be only used for idling.
>
> I found a msm_spm_apcs_set_vdd() [1] but:
>
>  - That one skips the smp_call stuff and calls msm_spm_drv_set_vdd()
>    directly. In other words, there is no scheduling to CPU0.
>  - It seems to be only used in krait-regulator which is I think
>    8974-specific?

Indeed, L2 SAW doesn't seem to be used for voltage setting on 8064.
Let's drop its regulator completely and add it back if it gets
required one day.

>
> If you don't need the regulator on the L2 SPM you could just put an
> error here rather than the CPU0 fallback. Or alternatively I'd try to
> avoid the smp_call_function_single() for L2 since I don't see why those
> should need to be called on a specific CPU.
>
> Thanks,
> Stephan
>
> [1]: https://git.codelinaro.org/clo/la/kernel/msm/-/blob/LA.AF.1.2.1-08410-8064.0/arch/arm/mach-msm/spm_devices.c#L257
>

--
With best wishes
Dmitry

