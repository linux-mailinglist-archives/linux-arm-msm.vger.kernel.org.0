Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12F3201F2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 02:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730854AbgFTAX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 20:23:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730293AbgFTAX7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 20:23:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2212F229C6;
        Sat, 20 Jun 2020 00:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592612637;
        bh=zCBtV0CDd5iVL5I7CJS37Ewl/4jio/XzaQ8nubG8yW4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RGDOPFwnZU/UgC/LwJO0ibbuU/7/3LDphkE8+xQ5TLMBOAhBHKW0Rkakp3zdEeEV9
         WXdJDJ0CLoO8a5OY915vQVbRIqBrtuQa71gf6W8o6+N0d4rtKrw91F1DvsvzonU7o2
         7GnniOUr7i3EE7x6wELSQqqsVfdIpTgYlmkkS474=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591266927-24976-2-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org> <1591266927-24976-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 1/4] soc: qcom: Separate kryo l2 accessors from PMU driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Date:   Fri, 19 Jun 2020 17:23:56 -0700
Message-ID: <159261263640.62212.5877307994739570385@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-06-04 03:35:24)
> From: Ilia Lin <ilialin@codeaurora.org>
>=20
> The driver provides kernel level API for other drivers
> to access the MSM8996 L2 cache registers.
> Separating the L2 access code from the PMU driver and
> making it public to allow other drivers use it.
> The accesses must be separated with a single spinlock,
> maintained in this driver.
>=20
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

This needs an ack from perf maintainers. Leaving the rest of the patch
intact to help provide context.

-Stephen

>  drivers/perf/Kconfig                 |  1 +
>  drivers/perf/qcom_l2_pmu.c           | 90 ++++++++++--------------------=
------
>  drivers/soc/qcom/Kconfig             |  3 ++
>  drivers/soc/qcom/Makefile            |  1 +
>  drivers/soc/qcom/kryo-l2-accessors.c | 57 +++++++++++++++++++++++
>  include/soc/qcom/kryo-l2-accessors.h | 12 +++++
>  6 files changed, 98 insertions(+), 66 deletions(-)
>  create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
>  create mode 100644 include/soc/qcom/kryo-l2-accessors.h
>=20
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 09ae8a9..8e6510c1 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -89,6 +89,7 @@ config HISI_PMU
>  config QCOM_L2_PMU
>         bool "Qualcomm Technologies L2-cache PMU"
>         depends on ARCH_QCOM && ARM64 && ACPI
> +       select QCOM_KRYO_L2_ACCESSORS
>           help
>           Provides support for the L2 cache performance monitor unit (PMU)
>           in Qualcomm Technologies processors.
> diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
> index 21d6991..02ca1fa 100644
> --- a/drivers/perf/qcom_l2_pmu.c
> +++ b/drivers/perf/qcom_l2_pmu.c
> @@ -23,6 +23,7 @@
>  #include <asm/barrier.h>
>  #include <asm/local64.h>
>  #include <asm/sysreg.h>
> +#include <soc/qcom/kryo-l2-accessors.h>
> =20
>  #define MAX_L2_CTRS             9
> =20
> @@ -79,8 +80,6 @@
>  #define L2_COUNTER_RELOAD       BIT_ULL(31)
>  #define L2_CYCLE_COUNTER_RELOAD BIT_ULL(63)
> =20
> -#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
> -#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
> =20
>  #define reg_idx(reg, i)         (((i) * IA_L2_REG_OFFSET) + reg##_BASE)
> =20
> @@ -99,48 +98,7 @@
>  #define L2_EVENT_STREX                     0x421
>  #define L2_EVENT_CLREX                     0x422
> =20
> -static DEFINE_RAW_SPINLOCK(l2_access_lock);
> =20
> -/**
> - * set_l2_indirect_reg: write value to an L2 register
> - * @reg: Address of L2 register.
> - * @value: Value to be written to register.
> - *
> - * Use architecturally required barriers for ordering between system reg=
ister
> - * accesses
> - */
> -static void set_l2_indirect_reg(u64 reg, u64 val)
> -{
> -       unsigned long flags;
> -
> -       raw_spin_lock_irqsave(&l2_access_lock, flags);
> -       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> -       isb();
> -       write_sysreg_s(val, L2CPUSRDR_EL1);
> -       isb();
> -       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> -}
> -
> -/**
> - * get_l2_indirect_reg: read an L2 register value
> - * @reg: Address of L2 register.
> - *
> - * Use architecturally required barriers for ordering between system reg=
ister
> - * accesses
> - */
> -static u64 get_l2_indirect_reg(u64 reg)
> -{
> -       u64 val;
> -       unsigned long flags;
> -
> -       raw_spin_lock_irqsave(&l2_access_lock, flags);
> -       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> -       isb();
> -       val =3D read_sysreg_s(L2CPUSRDR_EL1);
> -       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> -
> -       return val;
> -}
> =20
>  struct cluster_pmu;
> =20
> @@ -211,28 +169,28 @@ static inline struct cluster_pmu *get_cluster_pmu(
>  static void cluster_pmu_reset(void)
>  {
>         /* Reset all counters */
> -       set_l2_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
> -       set_l2_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
> -       set_l2_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
> -       set_l2_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
> +       kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
> +       kryo_l2_set_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
> +       kryo_l2_set_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
> +       kryo_l2_set_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
>  }
> =20
>  static inline void cluster_pmu_enable(void)
>  {
> -       set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
> +       kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
>  }
> =20
>  static inline void cluster_pmu_disable(void)
>  {
> -       set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
> +       kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
>  }
> =20
>  static inline void cluster_pmu_counter_set_value(u32 idx, u64 value)
>  {
>         if (idx =3D=3D l2_cycle_ctr_idx)
> -               set_l2_indirect_reg(L2PMCCNTR, value);
> +               kryo_l2_set_indirect_reg(L2PMCCNTR, value);
>         else
> -               set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), value);
> +               kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), va=
lue);
>  }
> =20
>  static inline u64 cluster_pmu_counter_get_value(u32 idx)
> @@ -240,46 +198,46 @@ static inline u64 cluster_pmu_counter_get_value(u32=
 idx)
>         u64 value;
> =20
>         if (idx =3D=3D l2_cycle_ctr_idx)
> -               value =3D get_l2_indirect_reg(L2PMCCNTR);
> +               value =3D kryo_l2_get_indirect_reg(L2PMCCNTR);
>         else
> -               value =3D get_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx=
));
> +               value =3D kryo_l2_get_indirect_reg(reg_idx(IA_L2PMXEVCNTR=
, idx));
> =20
>         return value;
>  }
> =20
>  static inline void cluster_pmu_counter_enable(u32 idx)
>  {
> -       set_l2_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
> +       kryo_l2_set_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
>  }
> =20
>  static inline void cluster_pmu_counter_disable(u32 idx)
>  {
> -       set_l2_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
> +       kryo_l2_set_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
>  }
> =20
>  static inline void cluster_pmu_counter_enable_interrupt(u32 idx)
>  {
> -       set_l2_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
> +       kryo_l2_set_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
>  }
> =20
>  static inline void cluster_pmu_counter_disable_interrupt(u32 idx)
>  {
> -       set_l2_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
> +       kryo_l2_set_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
>  }
> =20
>  static inline void cluster_pmu_set_evccntcr(u32 val)
>  {
> -       set_l2_indirect_reg(L2PMCCNTCR, val);
> +       kryo_l2_set_indirect_reg(L2PMCCNTCR, val);
>  }
> =20
>  static inline void cluster_pmu_set_evcntcr(u32 ctr, u32 val)
>  {
> -       set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
> +       kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
>  }
> =20
>  static inline void cluster_pmu_set_evtyper(u32 ctr, u32 val)
>  {
> -       set_l2_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
> +       kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
>  }
> =20
>  static void cluster_pmu_set_resr(struct cluster_pmu *cluster,
> @@ -295,11 +253,11 @@ static void cluster_pmu_set_resr(struct cluster_pmu=
 *cluster,
> =20
>         spin_lock_irqsave(&cluster->pmu_lock, flags);
> =20
> -       resr_val =3D get_l2_indirect_reg(L2PMRESR);
> +       resr_val =3D kryo_l2_get_indirect_reg(L2PMRESR);
>         resr_val &=3D ~(L2PMRESR_GROUP_MASK << shift);
>         resr_val |=3D field;
>         resr_val |=3D L2PMRESR_EN;
> -       set_l2_indirect_reg(L2PMRESR, resr_val);
> +       kryo_l2_set_indirect_reg(L2PMRESR, resr_val);
> =20
>         spin_unlock_irqrestore(&cluster->pmu_lock, flags);
>  }
> @@ -315,14 +273,14 @@ static inline void cluster_pmu_set_evfilter_sys_mod=
e(u32 ctr)
>                    L2PMXEVFILTER_ORGFILTER_IDINDEP |
>                    L2PMXEVFILTER_ORGFILTER_ALL;
> =20
> -       set_l2_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
> +       kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
>  }
> =20
>  static inline u32 cluster_pmu_getreset_ovsr(void)
>  {
> -       u32 result =3D get_l2_indirect_reg(L2PMOVSSET);
> +       u32 result =3D kryo_l2_get_indirect_reg(L2PMOVSSET);
> =20
> -       set_l2_indirect_reg(L2PMOVSCLR, result);
> +       kryo_l2_set_indirect_reg(L2PMOVSCLR, result);
>         return result;
>  }
> =20
> @@ -767,7 +725,7 @@ static int get_num_counters(void)
>  {
>         int val;
> =20
> -       val =3D get_l2_indirect_reg(L2PMCR);
> +       val =3D kryo_l2_get_indirect_reg(L2PMCR);
> =20
>         /*
>          * Read number of counters from L2PMCR and add 1
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index bf42a17..1782186 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -62,6 +62,9 @@ config QCOM_LLCC
>           SDM845. This provides interfaces to clients that use the LLCC.
>           Say yes here to enable LLCC slice driver.
> =20
> +config QCOM_KRYO_L2_ACCESSORS
> +       bool
> +
>  config QCOM_MDT_LOADER
>         tristate
>         select QCOM_SCM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 5d6b83d..fcf6ef7 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D        kryo-l2-accessors.o
> diff --git a/drivers/soc/qcom/kryo-l2-accessors.c b/drivers/soc/qcom/kryo=
-l2-accessors.c
> new file mode 100644
> index 0000000..c20cb92
> --- /dev/null
> +++ b/drivers/soc/qcom/kryo-l2-accessors.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/spinlock.h>
> +#include <asm/barrier.h>
> +#include <asm/sysreg.h>
> +#include <soc/qcom/kryo-l2-accessors.h>
> +
> +#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
> +#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
> +
> +static DEFINE_RAW_SPINLOCK(l2_access_lock);
> +
> +/**
> + * kryo_l2_set_indirect_reg() - write value to an L2 register
> + * @reg: Address of L2 register.
> + * @value: Value to be written to register.
> + *
> + * Use architecturally required barriers for ordering between system reg=
ister
> + * accesses, and system registers with respect to device memory
> + */
> +void kryo_l2_set_indirect_reg(u64 reg, u64 val)
> +{
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&l2_access_lock, flags);
> +       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> +       isb();
> +       write_sysreg_s(val, L2CPUSRDR_EL1);
> +       isb();
> +       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> +}
> +EXPORT_SYMBOL(kryo_l2_set_indirect_reg);
> +
> +/**
> + * kryo_l2_get_indirect_reg() - read an L2 register value
> + * @reg: Address of L2 register.
> + *
> + * Use architecturally required barriers for ordering between system reg=
ister
> + * accesses, and system registers with respect to device memory
> + */
> +u64 kryo_l2_get_indirect_reg(u64 reg)
> +{
> +       u64 val;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&l2_access_lock, flags);
> +       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> +       isb();
> +       val =3D read_sysreg_s(L2CPUSRDR_EL1);
> +       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> +
> +       return val;
> +}
> +EXPORT_SYMBOL(kryo_l2_get_indirect_reg);
> diff --git a/include/soc/qcom/kryo-l2-accessors.h b/include/soc/qcom/kryo=
-l2-accessors.h
> new file mode 100644
> index 0000000..673c534
> --- /dev/null
> +++ b/include/soc/qcom/kryo-l2-accessors.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
> +#define __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
> +
> +void kryo_l2_set_indirect_reg(u64 reg, u64 val);
> +u64 kryo_l2_get_indirect_reg(u64 reg);
> +
> +#endif
