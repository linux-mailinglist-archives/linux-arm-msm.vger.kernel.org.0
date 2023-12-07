Return-Path: <linux-arm-msm+bounces-3780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779728094BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 22:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A1A282489
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 21:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC94D563BA;
	Thu,  7 Dec 2023 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="QstmWl7W";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="EIqOGy6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D7D10EF;
	Thu,  7 Dec 2023 13:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984878; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BrI2jYzYG9CZ/gH0i8/LkY5IZna2Wu1E6eag0Nk/PG00mbogMzRQZ1pY0xGg2ZAHgb
    qVzP2JbNPIyEMx1dzQXjpLmx2Iyl2778qWbj7O7VRvvdqXbiXwewIsLqC/WEjU3ve/Tg
    POly9oXJZdFK4Wog72EC0eTgweh0Wlc2v4zWUNtJIPfLKrIV+oI7obajHuSrZ6CO/iol
    xF/4cv6eiZ6d2nmr8G0daxIALPq8eclZpilH3IB0+loTO4IidXdui8FkPhyeVGCN/Rd1
    RtnQ1RkxY1ly0aCKwjgfTXcr5QJmil+0GLNNk7G0frx24nc5ZbfMGDuAZDD+nh9wv+Mh
    3lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701984878;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0CEVQq9zJ0BAoK5R6gH3dqIkq6RlF15kMG1pRCoLuMc=;
    b=q/Ctgqvf0tl3UlH68gujnSsRW57lEbPZvsAEXCxAJ+xQPcVX0xVwNkwomDNciNTN1V
    4duO8T1OUtB/2ooOe4jL2MI4U8MZAtDfJ6+26BCfN/l5gSXj+KiKFAfJa80JIzDFWPwu
    XAt8pH4whmETSBPaqNKpkuA7Rm8V06UIYMW3Geu28qTFbn9cLZLfHCMj4Qpp8pdPuBfe
    rAZSEfjmsIE8J0pFYdUfnuMJKokwxnzr1sd+11r+yk7640f5kY3QHK/5zKQDNnWJ1fSt
    cM7Pee6PSlZMgygBDjFSEKBT310mqCtL/XWOP/NGOSzYbeprchTV9bo3MJTAmBF+Bdwl
    /PvA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701984878;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0CEVQq9zJ0BAoK5R6gH3dqIkq6RlF15kMG1pRCoLuMc=;
    b=QstmWl7WXCWadYj2NKCkkePHywApo4S/AhX9o9PiMKsZfbSNrqusE9ZfPataQ6+ofS
    Kq/VvAX9M4AY37iV79L152J8Ejij8PQnCrNwJtGJmZ7kfth6I6ovR2OFiF4KE3h4D250
    Z8UabuSvwl+NunkWEiqQLriMVFBbT8tqZWjJhZZWeLvuoHs3NPDwKL1Keou2URqsISvP
    IZf0IkQM02/5MH0fQMYONIEKJv8BqwU6kjgDK49tCIDnvUGhBXDrvgIuHVvaOuvE82Ej
    /r8DITiUgFrXsYPaO82AIjPMIKGIjV6MiJc43SI6aFTjmy5Xsds+ioTU7J1T6d1X6jIH
    p/HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701984878;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0CEVQq9zJ0BAoK5R6gH3dqIkq6RlF15kMG1pRCoLuMc=;
    b=EIqOGy6C9rhSSaFExCaTsf/aeYWjXBxdn1jcSISYpo8stYQlgk/t5Ep3Keb3J5kZQi
    90nem8shCrgLgmneC/Dg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8paF1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.10.0 SBL|AUTH)
    with ESMTPSA id 58bb61zB7LYcAWL
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 7 Dec 2023 22:34:38 +0100 (CET)
Date: Thu, 7 Dec 2023 22:34:32 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 03/10] soc: qcom: spm: add support for voltage
 regulator
Message-ID: <ZXI6aNleedfd7XjT@gerhold.net>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
 <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>
 <ZXH88_nwT_3g6MS9@gerhold.net>
 <CAA8EJpoV0yEu_tQ9Xep643osXB21Z17yGrJQzwwfV32_voUS0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoV0yEu_tQ9Xep643osXB21Z17yGrJQzwwfV32_voUS0w@mail.gmail.com>
Content-Transfer-Encoding: 7bit

On Thu, Dec 07, 2023 at 10:33:31PM +0200, Dmitry Baryshkov wrote:
> On Thu, 7 Dec 2023 at 19:12, Stephan Gerhold <stephan@gerhold.net> wrote:
> > On Thu, Dec 07, 2023 at 04:06:56PM +0300, Dmitry Baryshkov wrote:
> > > The SPM / SAW2 device also provides a voltage regulator functionality
> > > with optional AVS (Adaptive Voltage Scaling) support. The exact register
> > > sequence and voltage ranges differs from device to device.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > There is some overlap here with the spmi_saw_set_vdd() functionality in
> > qcom_spmi-regulator.c, at least for the SoCs with SPMI PMICs (e.g.
> > MSM8974 etc). You don't add support for these in this patch series yet
> > but I think it would be good to clarify how we would expect to handle
> > those. In other words:
> >
> >  - Would we handle them in qcom_spmi-regulator.c and keep the code in
> >    the spm.c driver only for the non-SPMI platforms?
> >
> >  - Should we add this in a SSBI regulator driver instead for consistency?
> >
> >  - Or should we move the existing functionality in qcom_spmi-regulator.c
> >    to here?
> 
> The spmi_saw_set_vdd() is a definite hack and ideally it should be
> dropped. It is not possible, though, existing msm8996 DT uses that
> spmi/saw regulator to power on the CPU cores. We have to remain
> compatible with that hack.
> But my intent is to have all other platforms use the spm.c (and
> migrate msm8996 at some point too).

Thanks, sounds reasonable.

> 
> >
> > > ---
> > >  drivers/soc/qcom/spm.c | 221 ++++++++++++++++++++++++++++++++++++++++-
> > >  include/soc/qcom/spm.h |   9 ++
> > >  2 files changed, 225 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> > > index 2f0b1bfe7658..595e2afb2141 100644
> > > --- a/drivers/soc/qcom/spm.c
> > > +++ b/drivers/soc/qcom/spm.c
> > > [...]
> > > @@ -238,6 +273,181 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
> > >       spm_register_write_sync(drv, SPM_REG_SPM_CTL, ctl_val);
> > >  }
> > >
> > > +static int spm_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> > > +{
> > > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > > +
> > > +     drv->volt_sel = selector;
> > > +
> > > +     /* Always do the SAW register writes on the corresponding CPU */
> > > +     return smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
> > > +}
> > > +
> > > +static int spm_get_voltage_sel(struct regulator_dev *rdev)
> > > +{
> > > +     struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> > > +
> > > +     return drv->volt_sel;
> > > +}
> > > +
> > > +static const struct regulator_ops spm_reg_ops = {
> > > +     .set_voltage_sel        = spm_set_voltage_sel,
> > > +     .get_voltage_sel        = spm_get_voltage_sel,
> > > +     .list_voltage           = regulator_list_voltage_linear_range,
> > > +     .set_voltage_time_sel   = regulator_set_voltage_time_sel,
> > > +};
> > > +
> > > +static void smp_set_vdd_v1_1(void *data)
> > > +{
> > > +     struct spm_driver_data *drv = data;
> > > +     unsigned int vctl, data0, data1, avs_ctl, sts;
> > > +     unsigned int vlevel, volt_sel;
> > > +     bool avs_enabled;
> > > +
> > > +     volt_sel = drv->volt_sel;
> > > +     vlevel = volt_sel | 0x80; /* band */
> > > +
> > > +     avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
> > > +     vctl = spm_register_read(drv, SPM_REG_VCTL);
> > > +     data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
> > > +     data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
> > > +
> > > +     avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > +
> > > +     /* If AVS is enabled, switch it off during the voltage change */
> > > +     if (avs_enabled) {
> > > +             avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > +     }
> > > +
> > > +     /* Kick the state machine back to idle */
> > > +     spm_register_write(drv, SPM_REG_RST, 1);
> > > +
> > > +     vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
> > > +     data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
> > > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
> > > +     data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
> > > +
> > > +     spm_register_write(drv, SPM_REG_VCTL, vctl);
> > > +     spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
> > > +     spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
> > > +
> > > +     if (read_poll_timeout_atomic(spm_register_read,
> > > +                                  sts, sts == vlevel,
> > > +                                  1, 200, false,
> > > +                                  drv, SPM_REG_STS1)) {
> > > +             dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
> > > +             goto enable_avs;
> > > +     }
> > > +
> > > +     if (avs_enabled) {
> > > +             unsigned int max_avs = volt_sel;
> > > +             unsigned int min_avs = max(max_avs, 4U) - 4;
> > > +
> > > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
> > > +             avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
> > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > +     }
> > > +
> > > +enable_avs:
> > > +     if (avs_enabled) {
> > > +             avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
> > > +             spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> > > +     }
> > > +}
> > > +
> > > +static int spm_get_cpu(struct device *dev)
> > > +{
> > > +     int cpu;
> > > +     bool found;
> > > +
> > > +     for_each_possible_cpu(cpu) {
> > > +             struct device_node *cpu_node, *saw_node;
> > > +
> > > +             cpu_node = of_cpu_device_node_get(cpu);
> > > +             if (!cpu_node)
> > > +                     continue;
> > > +
> > > +             saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
> > > +             found = (saw_node == dev->of_node);
> > > +             of_node_put(saw_node);
> > > +             of_node_put(cpu_node);
> > > +
> > > +             if (found)
> > > +                     return cpu;
> > > +     }
> > > +
> > > +     /* L2 SPM is not bound to any CPU, tie it to CPU0 */
> >
> > Is this necessary? I would kind of expect that it's only important that
> > this doesn't happen in parallel on multiple CPUs. The lock in the
> > regulator core should already ensure that, though. It's somewhat
> > expensive to schedule on other cores, especially if they are currently
> > idle and power collapsed.
> 
> If I understand correctly, it is the other way around. From the msm
> kernels I see that CPU SPM calls are scheduled to be executed only on
> the corresponding CPU/core. For L2 we didn't have the CPU, so to keep
> the same code path I selected for them to be executed on CPU0. At this
> point I'm not even sure if this cpu0 comes from the downstream tree or
> not.
> 

Hm, does 8064/8960 set any voltages through the L2 SPM at all? From a
quick look I see only the core SPMs being used as regulators, the L2 SPM
seems to be only used for idling.

I found a msm_spm_apcs_set_vdd() [1] but:

 - That one skips the smp_call stuff and calls msm_spm_drv_set_vdd()
   directly. In other words, there is no scheduling to CPU0.
 - It seems to be only used in krait-regulator which is I think
   8974-specific?

If you don't need the regulator on the L2 SPM you could just put an
error here rather than the CPU0 fallback. Or alternatively I'd try to
avoid the smp_call_function_single() for L2 since I don't see why those
should need to be called on a specific CPU.

Thanks,
Stephan

[1]: https://git.codelinaro.org/clo/la/kernel/msm/-/blob/LA.AF.1.2.1-08410-8064.0/arch/arm/mach-msm/spm_devices.c#L257


