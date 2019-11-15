Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 638B7FDD55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfKOMUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:20:55 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34525 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbfKOMUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:20:55 -0500
Received: by mail-lj1-f193.google.com with SMTP id 139so10500854ljf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 04:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9cJxCZW0lwok1TFb4p00c7WTj1OruvC633mSgsiBKKo=;
        b=R/8N0eLqb8Q+UA9xaiJWTInU7lxcAQ8uIlBzUYtoR7yMnsKSlVAJPOpb0v+dIuZ3Po
         JplKh4nLOjrnSTiEepiXHGfZtz+u3ytYxebPdIpYB7M3lWqIOunRDTlwzHn4DbE8xiq8
         fu2GGWPwcAFzKksEVkhv6imU4jWfAMU29aZ6p91Ddo+EuNafBHTFG5u9ttJwUfGC+PxH
         0IzLjZBukfHw18bEIn3LT32LCZ2abrFIWDILLTdxtuKMTQaHBFRZvVGrQYzvP7hShBJP
         CKiyxT2Y4keaMu78KC64NU46SiKDcZSZoa3M2/PqkGnBQ4uedatcfrc6yrmKgzPiCQX8
         ZY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9cJxCZW0lwok1TFb4p00c7WTj1OruvC633mSgsiBKKo=;
        b=nU9aisVXpRXAK2Ckzu8AAMVrcdrb/1C0rcXkYE04gRODEwvjQswL+lz9qLJGMZs/O9
         A2tyPychrcn9aFprCUQo0r7AdR553Dz0PL35ld6PtE7hT+EbUJYOJMbyedQEBvvIpDZo
         NqmLL0slRVgJAAv4HmBDNWbuFqa3JLHEqiuJ5OQ+SUVnQrFd2ypSYX0s+rOIYxYqcJnV
         VJotnhnv9soegzFZIP6F+rTS9RHeHvk3c6BJBlMIBhuKwqCKKtJaaajj6zlH5Od8iSZp
         8mFlowy5p7JDnlEs5DwiM6utQmBitm6EKDtJ76JBhWnMlsHApXycZMc6xaqWUscZoYdk
         pypA==
X-Gm-Message-State: APjAAAXp3ubXlw5ll3s85qp1K9TyF/r2p/AP7rHJXkU017UkblEVshMB
        UpCXe0+6Za+BR72OWjoQ9uWyAw==
X-Google-Smtp-Source: APXvYqxRsNs2+10hveBP5EHbJQ57hSHDUuoQEYGNT8+0y1uNc7mlpzgrZhfHvlbAIujU3VKncelCWg==
X-Received: by 2002:a2e:994f:: with SMTP id r15mr11129492ljj.18.1573820448788;
        Fri, 15 Nov 2019 04:20:48 -0800 (PST)
Received: from centauri (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id k186sm4575436lfd.64.2019.11.15.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 04:20:48 -0800 (PST)
Date:   Fri, 15 Nov 2019 13:20:46 +0100
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@kernel.org>,
        Nishanth Menon <nm@ti.com>, linux-arm-msm@vger.kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, amit.kucheria@linaro.org
Subject: Re: [PATCH v2 11/14] power: avs: Add support for CPR (Core Power
 Reduction)
Message-ID: <20191115122046.GA244045@centauri>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
 <20190725104144.22924-12-niklas.cassel@linaro.org>
 <20190818010415.A100F21019@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818010415.A100F21019@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Again, thank you for your review Stephen, much appreciated.
Sorry that I haven't been able to reply to your comments sooner.

I've taken your review comments into consideration, and have
implemented almost all of your suggestions, and have sent out
new version of this patch series here:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=203641

To easier find review comments, bounce on [REVIEW-THX] and [REVIEW-ETC].

On Sat, Aug 17, 2019 at 06:04:14PM -0700, Stephen Boyd wrote:
> Quoting Niklas Cassel (2019-07-25 03:41:39)
> > diff --git a/drivers/power/avs/Kconfig b/drivers/power/avs/Kconfig
> > index b5a217b828dc..4d4d742b3c6f 100644
> > --- a/drivers/power/avs/Kconfig
> > +++ b/drivers/power/avs/Kconfig
> > @@ -12,6 +12,21 @@ menuconfig POWER_AVS
> >  
> >           Say Y here to enable Adaptive Voltage Scaling class support.
> >  
> > +config QCOM_CPR
> > +       tristate "QCOM Core Power Reduction (CPR) support"
> > +       depends on POWER_AVS
> > +       select PM_OPP
> > +       help
> > +         Say Y here to enable support for the CPR hardware found on Qualcomm
> > +         SoCs like MSM8916.
> 
> Maybe mention qcs404 too, because it looks like 8916 isn't actually here
> :)

[REVIEW-THX]
MSM8916 will require slightly more changes, e.g. a power-domain driver,
before we can enable CPR support. Will only mention QCS404 for now.

> 
> > +
> > +         This driver populates CPU OPPs tables and makes adjustments to the
> > +         tables based on feedback from the CPR hardware. If you want to do
> > +         CPUfrequency scaling say Y here.
> > +
> > +         To compile this driver as a module, choose M here: the module will
> > +         be called qcom-cpr
> > +
> >  config ROCKCHIP_IODOMAIN
> >          tristate "Rockchip IO domain support"
> >          depends on POWER_AVS && ARCH_ROCKCHIP && OF
> > diff --git a/drivers/power/avs/Makefile b/drivers/power/avs/Makefile
> > index a1b8cd453f19..8cd17e6660ee 100644
> > --- a/drivers/power/avs/Makefile
> > +++ b/drivers/power/avs/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_POWER_AVS_OMAP)           += smartreflex.o
> >  obj-$(CONFIG_ROCKCHIP_IODOMAIN)                += rockchip-io-domain.o
> > +obj-$(CONFIG_QCOM_CPR)                 += qcom-cpr.o
> 
> Try to make this alphabetical on config name?

[REVIEW-THX]
Fixed, thanks.

> 
> > diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> > new file mode 100644
> > index 000000000000..d6bce2832589
> > --- /dev/null
> > +++ b/drivers/power/avs/qcom-cpr.c
> > @@ -0,0 +1,1885 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2019, Linaro Limited
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/string.h>
> > +#include <linux/kernel.h>
> > +#include <linux/list.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/bitops.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_opp.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/clk.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/bitops.h>
> > +
> > +/* Register Offsets for RB-CPR and Bit Definitions */
> > +
> > +/* RBCPR Version Register */
> > +#define REG_RBCPR_VERSION              0
> > +#define RBCPR_VER_2                    0x02
> > +#define FLAGS_IGNORE_1ST_IRQ_STATUS    BIT(0)
> > +
> > +/* RBCPR Gate Count and Target Registers */
> > +#define REG_RBCPR_GCNT_TARGET(n)       (0x60 + 4 * (n))
> > +
> > +#define RBCPR_GCNT_TARGET_TARGET_SHIFT 0
> > +#define RBCPR_GCNT_TARGET_TARGET_MASK  GENMASK(11, 0)
> > +#define RBCPR_GCNT_TARGET_GCNT_SHIFT   12
> > +#define RBCPR_GCNT_TARGET_GCNT_MASK    GENMASK(9, 0)
> > +
> > +/* RBCPR Timer Control */
> > +#define REG_RBCPR_TIMER_INTERVAL       0x44
> > +#define REG_RBIF_TIMER_ADJUST          0x4c
> > +
> > +#define RBIF_TIMER_ADJ_CONS_UP_MASK    GENMASK(3, 0)
> > +#define RBIF_TIMER_ADJ_CONS_UP_SHIFT   0
> > +#define RBIF_TIMER_ADJ_CONS_DOWN_MASK  GENMASK(3, 0)
> > +#define RBIF_TIMER_ADJ_CONS_DOWN_SHIFT 4
> > +#define RBIF_TIMER_ADJ_CLAMP_INT_MASK  GENMASK(7, 0)
> > +#define RBIF_TIMER_ADJ_CLAMP_INT_SHIFT 8
> > +
> > +/* RBCPR Config Register */
> > +#define REG_RBIF_LIMIT                 0x48
> > +#define RBIF_LIMIT_CEILING_MASK                GENMASK(5, 0)
> > +#define RBIF_LIMIT_CEILING_SHIFT       6
> > +#define RBIF_LIMIT_FLOOR_BITS          6
> > +#define RBIF_LIMIT_FLOOR_MASK          GENMASK(5, 0)
> > +
> > +#define RBIF_LIMIT_CEILING_DEFAULT     RBIF_LIMIT_CEILING_MASK
> > +#define RBIF_LIMIT_FLOOR_DEFAULT       0
> > +
> > +#define REG_RBIF_SW_VLEVEL             0x94
> > +#define RBIF_SW_VLEVEL_DEFAULT         0x20
> > +
> > +#define REG_RBCPR_STEP_QUOT            0x80
> > +#define RBCPR_STEP_QUOT_STEPQUOT_MASK  GENMASK(7, 0)
> > +#define RBCPR_STEP_QUOT_IDLE_CLK_MASK  GENMASK(3, 0)
> > +#define RBCPR_STEP_QUOT_IDLE_CLK_SHIFT 8
> > +
> > +/* RBCPR Control Register */
> > +#define REG_RBCPR_CTL                  0x90
> > +
> > +#define RBCPR_CTL_LOOP_EN                      BIT(0)
> > +#define RBCPR_CTL_TIMER_EN                     BIT(3)
> > +#define RBCPR_CTL_SW_AUTO_CONT_ACK_EN          BIT(5)
> > +#define RBCPR_CTL_SW_AUTO_CONT_NACK_DN_EN      BIT(6)
> > +#define RBCPR_CTL_COUNT_MODE                   BIT(10)
> > +#define RBCPR_CTL_UP_THRESHOLD_MASK    GENMASK(3, 0)
> > +#define RBCPR_CTL_UP_THRESHOLD_SHIFT   24
> > +#define RBCPR_CTL_DN_THRESHOLD_MASK    GENMASK(3, 0)
> > +#define RBCPR_CTL_DN_THRESHOLD_SHIFT   28
> > +
> > +/* RBCPR Ack/Nack Response */
> > +#define REG_RBIF_CONT_ACK_CMD          0x98
> > +#define REG_RBIF_CONT_NACK_CMD         0x9c
> > +
> > +/* RBCPR Result status Register */
> > +#define REG_RBCPR_RESULT_0             0xa0
> > +
> > +#define RBCPR_RESULT0_BUSY_SHIFT       19
> > +#define RBCPR_RESULT0_BUSY_MASK                BIT(RBCPR_RESULT0_BUSY_SHIFT)
> > +#define RBCPR_RESULT0_ERROR_LT0_SHIFT  18
> > +#define RBCPR_RESULT0_ERROR_SHIFT      6
> > +#define RBCPR_RESULT0_ERROR_MASK       GENMASK(11, 0)
> > +#define RBCPR_RESULT0_ERROR_STEPS_SHIFT        2
> > +#define RBCPR_RESULT0_ERROR_STEPS_MASK GENMASK(3, 0)
> > +#define RBCPR_RESULT0_STEP_UP_SHIFT    1
> > +
> > +/* RBCPR Interrupt Control Register */
> > +#define REG_RBIF_IRQ_EN(n)             (0x100 + 4 * (n))
> > +#define REG_RBIF_IRQ_CLEAR             0x110
> > +#define REG_RBIF_IRQ_STATUS            0x114
> > +
> > +#define CPR_INT_DONE           BIT(0)
> > +#define CPR_INT_MIN            BIT(1)
> > +#define CPR_INT_DOWN           BIT(2)
> > +#define CPR_INT_MID            BIT(3)
> > +#define CPR_INT_UP             BIT(4)
> > +#define CPR_INT_MAX            BIT(5)
> > +#define CPR_INT_CLAMP          BIT(6)
> > +#define CPR_INT_ALL    (CPR_INT_DONE | CPR_INT_MIN | CPR_INT_DOWN | \
> > +                       CPR_INT_MID | CPR_INT_UP | CPR_INT_MAX | CPR_INT_CLAMP)
> > +#define CPR_INT_DEFAULT        (CPR_INT_UP | CPR_INT_DOWN)
> > +
> > +#define CPR_NUM_RING_OSC       8
> > +
> > +/* CPR eFuse parameters */
> > +#define CPR_FUSE_TARGET_QUOT_BITS_MASK GENMASK(11, 0)
> > +
> > +#define CPR_FUSE_MIN_QUOT_DIFF         50
> > +
> > +#define FUSE_REVISION_UNKNOWN          (-1)
> > +
> > +enum voltage_change_dir {
> > +       NO_CHANGE,
> > +       DOWN,
> > +       UP,
> > +};
> > +
> > +struct cpr_fuse {
> > +       char *ring_osc;
> > +       char *init_voltage;
> > +       char *quotient;
> > +       char *quotient_offset;
> > +};
> > +
> > +struct fuse_corner_data {
> > +       int ref_uV;
> > +       int max_uV;
> > +       int min_uV;
> > +       int max_volt_scale;
> > +       int max_quot_scale;
> > +       /* fuse quot */
> > +       int quot_offset;
> > +       int quot_scale;
> > +       int quot_adjust;
> > +       /* fuse quot_offset */
> > +       int quot_offset_scale;
> > +       int quot_offset_adjust;
> > +};
> > +
> > +struct cpr_fuses {
> > +       int init_voltage_step;
> > +       int init_voltage_width;
> > +       struct fuse_corner_data *fuse_corner_data;
> > +};
> > +
> > +struct pvs_bin {
> 
> Why does this struct exist?

[REVIEW-THX]
This struct is a remnant from a previous patch series version,
and is now unused, will remove it, thanks.

> 
> > +       int *uV;
> > +};
> > +
> > +struct pvs_fuses {
> > +       char **pvs_fuse;
> > +       struct pvs_bin *pvs_bins;
> 
> This can be int **pvs_bins?

[REVIEW-THX]
This struct is a remnant from a previous patch series version,
and is now unused, will remove it, thanks.

> 
> > +};
> > +
> > +struct corner_data {
> > +       unsigned int fuse_corner;
> > +       unsigned long freq;
> > +};
> > +
> > +struct cpr_desc {
> > +       unsigned int num_fuse_corners;
> > +       int min_diff_quot;
> > +       int *step_quot;
> > +       struct cpr_fuses cpr_fuses;
> > +       struct pvs_fuses *pvs_fuses;
> > +       bool reduce_to_fuse_uV;
> > +       bool reduce_to_corner_uV;
> > +};
> > +
> > +struct acc_desc {
> > +       unsigned int    enable_reg;
> > +       u32             enable_mask;
> > +
> > +       struct reg_sequence     *config;
> > +       struct reg_sequence     *settings;
> > +       int                     num_regs_per_fuse;
> > +};
> > +
> > +struct cpr_acc_desc {
> > +       const struct cpr_desc *cpr_desc;
> > +       const struct acc_desc *acc_desc;
> > +};
> > +
> > +struct fuse_corner {
> > +       int min_uV;
> > +       int max_uV;
> > +       int uV;
> > +       int quot;
> > +       int step_quot;
> > +       const struct reg_sequence *accs;
> > +       int num_accs;
> > +       unsigned long max_freq;
> > +       u32 ring_osc_idx;
> 
> Can this be a u8?

[REVIEW-THX]
Fixed, thanks.

> 
> > +};
> > +
> > +struct corner {
> > +       int min_uV;
> > +       int max_uV;
> > +       int uV;
> > +       int last_uV;
> > +       int quot_adjust;
> > +       u32 save_ctl;
> > +       u32 save_irq;
> > +       unsigned long freq;
> > +       struct fuse_corner *fuse_corner;
> > +};
> > +
> > +struct cpr_drv {
> > +       unsigned int            num_corners;
> > +
> > +       unsigned int            ref_clk_khz;
> > +       unsigned int            timer_delay_us;
> > +       unsigned int            timer_cons_up;
> > +       unsigned int            timer_cons_down;
> > +       unsigned int            up_threshold;
> > +       unsigned int            down_threshold;
> > +       unsigned int            idle_clocks;
> > +       unsigned int            gcnt_us;
> > +       unsigned int            vdd_apc_step_up_limit;
> > +       unsigned int            vdd_apc_step_down_limit;
> > +       unsigned int            clamp_timer_interval;
> > +       unsigned int            performance_state;
> > +
> > +       struct generic_pm_domain pd;
> > +       struct device           *dev;
> > +       struct mutex            lock;
> > +       void __iomem            *base;
> > +       struct corner           *corner;
> > +       struct regulator        *vdd_apc;
> > +       struct clk              *cpu_clk;
> > +       struct regmap           *tcsr;
> > +       bool                    loop_disabled;
> > +       bool                    suspended;
> > +       u32                     gcnt;
> > +       unsigned long           flags;
> > +
> > +       struct fuse_corner      *fuse_corners;
> > +       struct corner           *corners;
> > +
> > +       const struct cpr_desc *desc;
> > +       const struct acc_desc *acc_desc;
> > +       const struct cpr_fuse *cpr_fuses;
> > +
> > +       struct dentry *debugfs;
> > +};
> > +
> > +static bool cpr_is_allowed(struct cpr_drv *drv)
> > +{
> > +       if (drv->loop_disabled)
> > +               return false;
> > +       else
> > +               return true;
> 
> Simplify to return !drv->loop_disabled

[REVIEW-THX]
Fixed, thanks.

> 
> > +}
> > +
> > +static void cpr_write(struct cpr_drv *drv, u32 offset, u32 value)
> > +{
> > +       writel_relaxed(value, drv->base + offset);
> > +}
> > +
> [...]
> > +
> > +static void cpr_corner_restore(struct cpr_drv *drv, struct corner *corner)
> > +{
> > +       u32 gcnt, ctl, irq, ro_sel, step_quot;
> > +       struct fuse_corner *fuse = corner->fuse_corner;
> > +       int i;
> > +
> > +       ro_sel = fuse->ring_osc_idx;
> > +       gcnt = drv->gcnt;
> > +       gcnt |= fuse->quot - corner->quot_adjust;
> > +
> > +       /* Program the step quotient and idle clocks */
> > +       step_quot = drv->idle_clocks << RBCPR_STEP_QUOT_IDLE_CLK_SHIFT;
> > +       step_quot |= fuse->step_quot & RBCPR_STEP_QUOT_STEPQUOT_MASK;
> > +       cpr_write(drv, REG_RBCPR_STEP_QUOT, step_quot);
> > +
> > +       /* Clear the target quotient value and gate count of all ROs */
> > +       for (i = 0; i < CPR_NUM_RING_OSC; i++)
> > +               cpr_write(drv, REG_RBCPR_GCNT_TARGET(i), 0);
> > +
> > +       cpr_write(drv, REG_RBCPR_GCNT_TARGET(ro_sel), gcnt);
> > +       ctl = corner->save_ctl;
> > +       cpr_write(drv, REG_RBCPR_CTL, ctl);
> > +       irq = corner->save_irq;
> > +       cpr_irq_set(drv, irq);
> > +       dev_dbg(drv->dev, "gcnt = 0x%08x, ctl = 0x%08x, irq = 0x%08x\n", gcnt,
> 
> Use %#08x to get the 0x part?

[REVIEW-THX]
Fixed here and elsewhere, thanks.

> 
> > +               ctl, irq);
> > +}
> > +
> > +static void cpr_set_acc(struct regmap *tcsr, struct fuse_corner *f,
> > +                       struct fuse_corner *end)
> > +{
> > +       if (f < end) {
> > +               for (f += 1; f <= end; f++)
> > +                       regmap_multi_reg_write(tcsr, f->accs, f->num_accs);
> > +       } else {
> > +               for (f -= 1; f >= end; f--)
> > +                       regmap_multi_reg_write(tcsr, f->accs, f->num_accs);
> > +       }
> > +}
> > +
> > +static int cpr_pre_voltage(struct cpr_drv *drv,
> > +                          struct fuse_corner *fuse_corner,
> > +                          enum voltage_change_dir dir)
> > +{
> > +       int ret = 0;
> > +       struct fuse_corner *prev_fuse_corner = drv->corner->fuse_corner;
> > +
> > +       if (drv->tcsr && dir == DOWN)
> > +               cpr_set_acc(drv->tcsr, prev_fuse_corner, fuse_corner);
> > +
> > +       return ret;
> > +}
> > +
> > +static int cpr_post_voltage(struct cpr_drv *drv,
> > +                           struct fuse_corner *fuse_corner,
> > +                           enum voltage_change_dir dir)
> > +{
> > +       int ret = 0;
> 
> ret never changes in the above two functions. Remove it?

[REVIEW-THX]
Fixed, thanks.

> 
> > +       struct fuse_corner *prev_fuse_corner = drv->corner->fuse_corner;
> > +
> > +       if (drv->tcsr && dir == UP)
> > +               cpr_set_acc(drv->tcsr, prev_fuse_corner, fuse_corner);
> > +
> > +       return ret;
> > +}
> > +
> > +static int cpr_scale_voltage(struct cpr_drv *drv, struct corner *corner,
> > +                            int new_uV, enum voltage_change_dir dir)
> > +{
> > +       int ret = 0;
> 
> Drop initial assignment to 0 because it's overwritten immediately below.

[REVIEW-THX]
Fixed, thanks.

> 
> > +       struct fuse_corner *fuse_corner = corner->fuse_corner;
> > +
> > +       ret = cpr_pre_voltage(drv, fuse_corner, dir);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = regulator_set_voltage(drv->vdd_apc, new_uV, new_uV);
> > +       if (ret) {
> > +               dev_err_ratelimited(drv->dev, "failed to set apc voltage %d\n",
> > +                                   new_uV);
> > +               return ret;
> > +       }
> > +
> > +       ret = cpr_post_voltage(drv, fuse_corner, dir);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> [...]
> > +
> > +static irqreturn_t cpr_irq_handler(int irq, void *dev)
> > +{
> > +       struct cpr_drv *drv = dev;
> > +       u32 val;
> > +
> > +       mutex_lock(&drv->lock);
> > +
> > +       val = cpr_read(drv, REG_RBIF_IRQ_STATUS);
> > +       if (drv->flags & FLAGS_IGNORE_1ST_IRQ_STATUS)
> > +               val = cpr_read(drv, REG_RBIF_IRQ_STATUS);
> > +
> > +       dev_dbg(drv->dev, "IRQ_STATUS = %#02x\n", val);
> > +
> > +       if (!cpr_ctl_is_enabled(drv)) {
> > +               dev_dbg(drv->dev, "CPR is disabled\n");
> 
> Shouldn't this return IRQ_NONE because it's spurious?

[REVIEW-THX]
Fixed, thanks.

> 
> > +               goto unlock;
> > +       } else if (cpr_ctl_is_busy(drv) && !drv->clamp_timer_interval) {
> > +               dev_dbg(drv->dev, "CPR measurement is not ready\n");
> > +               goto unlock;
> > +       } else if (!cpr_is_allowed(drv)) {
> > +               val = cpr_read(drv, REG_RBCPR_CTL);
> > +               dev_err_ratelimited(drv->dev,
> > +                                   "Interrupt broken? RBCPR_CTL = %#02x\n",
> > +                                   val);
> 
> Same case, return IRQ_NONE?

[REVIEW-THX]
Fixed, thanks.

> 
> > +               goto unlock;
> 
> Maybe the goto can be dropped and you can use an else here to fall into
> the 'normal' processing modes. Everything would have to be indented
> again, but it will probably look alright.

[REVIEW-THX]
Fixed, thanks.

> 
> > +       }
> > +
> > +       /* Following sequence of handling is as per each IRQ's priority */
> > +       if (val & CPR_INT_UP) {
> > +               cpr_scale(drv, UP);
> > +       } else if (val & CPR_INT_DOWN) {
> > +               cpr_scale(drv, DOWN);
> > +       } else if (val & CPR_INT_MIN) {
> > +               cpr_irq_clr_nack(drv);
> > +       } else if (val & CPR_INT_MAX) {
> > +               cpr_irq_clr_nack(drv);
> > +       } else if (val & CPR_INT_MID) {
> > +               /* RBCPR_CTL_SW_AUTO_CONT_ACK_EN is enabled */
> > +               dev_dbg(drv->dev, "IRQ occurred for Mid Flag\n");
> > +       } else {
> > +               dev_dbg(drv->dev, "IRQ occurred for unknown flag (%#08x)\n",
> > +                       val);
> > +       }
> > +
> > +       /* Save register values for the corner */
> > +       cpr_corner_save(drv, drv->corner);
> > +
> > +unlock:
> > +       mutex_unlock(&drv->lock);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int cpr_enable(struct cpr_drv *drv)
> > +{
> > +       int ret;
> > +
> > +       ret = regulator_enable(drv->vdd_apc);
> > +       if (ret)
> > +               return ret;
> > +
> > +       mutex_lock(&drv->lock);
> > +
> > +       if (cpr_is_allowed(drv) && drv->corner) {
> > +               cpr_irq_clr(drv);
> > +               cpr_corner_restore(drv, drv->corner);
> > +               cpr_ctl_enable(drv, drv->corner);
> > +       }
> > +       mutex_unlock(&drv->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static int cpr_disable(struct cpr_drv *drv)
> > +{
> > +       int ret;
> > +
> > +       ret = regulator_disable(drv->vdd_apc);
> > +       if (ret)
> > +               return ret;
> > +
> > +       mutex_lock(&drv->lock);
> > +
> > +       if (cpr_is_allowed(drv))
> > +               cpr_ctl_disable(drv);
> > +       mutex_unlock(&drv->lock);
> 
> Seems weird to disable cpr in reverse order. Is that OK? Or should the
> cpr monitoring be disabled first and then regulator is disabled? When is
> the CPU's regulator disabled in relation to when it is hotplugged or
> idle? I haven't followed the power domain stuff too closely.

[REVIEW-ETC]
In downstream they do it like this.
https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/regulator/cpr-regulator.c?h=msm-4.14#n1334
cpr_regulator_enable() first enables the regulator, then enables the loop.
cpr_regulator_disable() first disables the regulator, then disables the loop.

However, I agree with you, disable should to the same as enable,
but in reversed order, so that is what I will do. Thank you.


The CPU's regulator for QCS404 is defined as always-on, and all the CPUs
in the (one and only) CPU cluster shares a single regulator.

Even though the regulator is always-on, it is not possible to hotplug all
the CPUs (not sure if this is a Linux limitation or a PSCI firmware limitation).

QCS404 has standalone power collapse, but not yet cluster power collapse.

When talking to Qualcomm hardware engineers, they explained that when a core
is offline/power-collapsed, the control logic loop in CPR hardware ignores
that offline/power-collapsed CPU.

Currently CPR works fine, even though all CPUs are able to enter standalone
power collapse. This is probably because the rail still has power.

Regardless, I think that we should merge this code, it is an improvement for
QCS404 that works today.
Even with cluster power collapse, I would assume that the firmware would
enable power for the rail before exiting the cluster sleep state.
If we ever decide to enable cluster power collapse for QCS404, and it actually
turns out to cause a problem, let's deal with it then.

> 
> > +
> > +       return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int cpr_suspend(struct device *dev)
> > +{
> > +       struct cpr_drv *drv = platform_get_drvdata(to_platform_device(dev));
> > +
> > +       if (cpr_is_allowed(drv)) {
> 
> Sometimes cpr_is_allowed() is tested inside the mutex and other times
> not. Please be consistent.

[REVIEW-THX]
Fixed, thanks.
However, after talking with Ulf Hansson, this has been removed,
since the operations performed in resume()/suspend()
were the same as in ->power_on()/->power_off().

> 
> > +               mutex_lock(&drv->lock);
> > +               cpr_ctl_disable(drv);
> > +               cpr_irq_clr(drv);
> > +               drv->suspended = true;
> > +               mutex_unlock(&drv->lock);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cpr_resume(struct device *dev)
> > +{
> > +       struct cpr_drv *drv = platform_get_drvdata(to_platform_device(dev));
> > +
> > +       if (cpr_is_allowed(drv)) {
> > +               mutex_lock(&drv->lock);
> > +               drv->suspended = false;
> > +               cpr_irq_clr(drv);
> > +               cpr_ctl_enable(drv, drv->corner);
> > +               mutex_unlock(&drv->lock);
> > +       }
> > +
> > +       return 0;
> > +}
> > +#endif
> > +
> > +static SIMPLE_DEV_PM_OPS(cpr_pm_ops, cpr_suspend, cpr_resume);
> > +
> > +static int cpr_config(struct cpr_drv *drv)
> > +{
> > +       int i;
> > +       u32 val, gcnt;
> > +       struct corner *corner;
> > +
> > +       /* Disable interrupt and CPR */
> > +       cpr_write(drv, REG_RBIF_IRQ_EN(0), 0);
> > +       cpr_write(drv, REG_RBCPR_CTL, 0);
> > +
> > +       /* Program the default HW Ceiling, Floor and vlevel */
> 
> Why capitalize ceiling and floor?

[REVIEW-THX]
Fixed, thanks.

> 
> > +       val = (RBIF_LIMIT_CEILING_DEFAULT & RBIF_LIMIT_CEILING_MASK)
> > +               << RBIF_LIMIT_CEILING_SHIFT;
> > +       val |= RBIF_LIMIT_FLOOR_DEFAULT & RBIF_LIMIT_FLOOR_MASK;
> > +       cpr_write(drv, REG_RBIF_LIMIT, val);
> > +       cpr_write(drv, REG_RBIF_SW_VLEVEL, RBIF_SW_VLEVEL_DEFAULT);
> > +
> > +       /* Clear the target quotient value and gate count of all ROs */
> 
> RO == ring oscillator? Maybe just write ring oscillator.

[REVIEW-THX]
Fixed, thanks.

> 
> > +       for (i = 0; i < CPR_NUM_RING_OSC; i++)
> > +               cpr_write(drv, REG_RBCPR_GCNT_TARGET(i), 0);
> > +
> > +       /* Init and save gcnt */
> > +       gcnt = (drv->ref_clk_khz * drv->gcnt_us) / 1000;
> > +       gcnt = gcnt & RBCPR_GCNT_TARGET_GCNT_MASK;
> > +       gcnt <<= RBCPR_GCNT_TARGET_GCNT_SHIFT;
> > +       drv->gcnt = gcnt;
> > +
> > +       /* Program the delay count for the timer */
> > +       val = (drv->ref_clk_khz * drv->timer_delay_us) / 1000;
> > +       cpr_write(drv, REG_RBCPR_TIMER_INTERVAL, val);
> > +       dev_dbg(drv->dev, "Timer count: 0x%0x (for %d us)\n", val,
> > +               drv->timer_delay_us);
> > +
> [...]
> > +
> > +static int cpr_read_efuse(struct device *dev, const char *cname, u32 *data)
> > +{
> > +       struct nvmem_cell *cell;
> > +       ssize_t len;
> > +       char *ret;
> > +       int i;
> > +
> > +       if (!data) {
> 
> Looks like debug stuff, drop it?

[REVIEW-THX]
Fixed, thanks.

> 
> > +               dev_err(dev, "invalid storage to read cell %s\n", cname);
> > +               return -EINVAL;
> > +       }
> > +
> > +       /* Optional cells will use their initialition values */
> 
> initialization?

[REVIEW-THX]
Dropped this comment since the code accompanied code has now been dropped.

> 
> > +       if (!cname)
> 
> Same?

[REVIEW-THX]
Fixed, thanks.

> 
> > +               return 0;
> > +
> > +       *data = 0;
> > +
> > +       cell = nvmem_cell_get(dev, cname);
> > +       if (IS_ERR(cell)) {
> > +               if (PTR_ERR(cell) != -EPROBE_DEFER)
> > +                       dev_info(dev, "undefined cell %s\n", cname);
> 
> dev_err()?

[REVIEW-THX]
Fixed, thanks.

> 
> > +               return PTR_ERR(cell);
> > +       }
> > +
> > +       ret = nvmem_cell_read(cell, &len);
> > +       nvmem_cell_put(cell);
> > +       if (IS_ERR(ret)) {
> > +               dev_err(dev, "can't read cell %s\n", cname);
> > +               return PTR_ERR(ret);
> > +       }
> > +
> > +       for (i = 0; i < len; i++)
> > +               *data |= ret[i] << (8 * i);
> 
> Amazing we don't have some sort of char array to u32 function.

[REVIEW-ETC]
I don't know of any. If there is any, please let me know.

> 
> > +
> > +       kfree(ret);
> > +       dev_dbg(dev, "efuse read(%s) = %x, bytes %ld\n", cname, *data, len);
> > +
> > +       return 0;
> > +}
> > +
> [...]
> > +
> > +static int cpr_calculate_scaling(const char *quot_offset,
> > +                                struct cpr_drv *drv,
> > +                                const struct fuse_corner_data *fdata,
> > +                                const struct corner *corner)
> > +{
> > +       u32 quot_diff = 0;
> > +       unsigned long freq_diff;
> > +       int scaling;
> > +       const struct fuse_corner *fuse, *prev_fuse;
> > +       int ret;
> > +
> > +       fuse = corner->fuse_corner;
> > +       prev_fuse = fuse - 1;
> > +
> > +       if (quot_offset) {
> > +               ret = cpr_read_efuse(drv->dev, quot_offset, &quot_diff);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               quot_diff *= fdata->quot_offset_scale;
> > +               quot_diff += fdata->quot_offset_adjust;
> > +       } else {
> > +               quot_diff = fuse->quot - prev_fuse->quot;
> > +       }
> > +
> > +       freq_diff = fuse->max_freq - prev_fuse->max_freq;
> > +       freq_diff /= 1000000; /* Convert to MHz */
> > +       scaling = 1000 * quot_diff / freq_diff;
> > +       return min(scaling, fdata->max_quot_scale);
> > +}
> > +
> > +static int cpr_interpolate(const struct corner *corner, int step_volt,
> > +                          const struct fuse_corner_data *fdata)
> > +{
> > +       unsigned long f_high, f_low, f_diff;
> > +       int uV_high, uV_low, uV;
> > +       u64 temp, temp_limit;
> > +       const struct fuse_corner *fuse, *prev_fuse;
> > +
> > +       fuse = corner->fuse_corner;
> > +       prev_fuse = fuse - 1;
> > +
> > +       f_high = fuse->max_freq;
> > +       f_low = prev_fuse->max_freq;
> > +       uV_high = fuse->uV;
> > +       uV_low = prev_fuse->uV;
> > +       f_diff = fuse->max_freq - corner->freq;
> > +
> > +       /*
> > +        * Don't interpolate in the wrong direction. This could happen
> > +        * if the adjusted fuse voltage overlaps with the previous fuse's
> > +        * adjusted voltage.
> > +        */
> > +       if (f_high <= f_low || uV_high <= uV_low || f_high <= corner->freq)
> > +               return corner->uV;
> > +
> > +       temp = f_diff * (uV_high - uV_low);
> > +       do_div(temp, f_high - f_low);
> > +
> > +       /*
> > +        * max_volt_scale has units of uV/MHz while freq values
> > +        * have units of Hz.  Divide by 1000000 to convert to.
> > +        */
> > +       temp_limit = f_diff * fdata->max_volt_scale;
> > +       do_div(temp_limit, 1000000);
> > +
> > +       uV = uV_high - min(temp, temp_limit);
> > +       return roundup(uV, step_volt);
> > +}
> > +
> > +static unsigned int cpr_get_fuse_corner(struct dev_pm_opp *opp)
> > +{
> > +       struct device_node *np;
> > +       unsigned int fuse_corner = 0;
> > +
> > +       np = dev_pm_opp_get_of_node(opp);
> > +       if (of_property_read_u32(np, "qcom,opp-fuse-level", &fuse_corner)) {
> > +               pr_err("%s: missing 'qcom,opp-fuse-level' property\n",
> > +                      __func__);
> > +               return 0;
> > +       }
> > +
> > +       of_node_put(np);
> 
> Do you need to of_node_put() on error above?

[REVIEW-THX]
Fixed, thanks.

> 
> > +
> > +       return fuse_corner;
> > +}
> > +
> > +unsigned long cpr_get_opp_hz_for_req(struct dev_pm_opp *ref)
> > +{
> > +       u64 rate = 0;
> > +       struct device *cpu_dev;
> > +       struct device_node *ref_np;
> > +       struct device_node *desc_np;
> > +       struct device_node *child_np = NULL;
> > +       struct device_node *child_req_np = NULL;
> > +
> > +       cpu_dev = get_cpu_device(0);
> > +       if (!cpu_dev)
> > +               return 0;
> > +
> > +       desc_np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> > +       if (!desc_np)
> > +               return 0;
> > +
> > +       ref_np = dev_pm_opp_get_of_node(ref);
> > +       if (!ref_np)
> > +               goto out_ref;
> > +
> > +       do {
> > +               of_node_put(child_req_np);
> > +               child_np = of_get_next_available_child(desc_np, child_np);
> > +               child_req_np = of_parse_phandle(child_np, "required-opps", 0);
> > +       } while (child_np && child_req_np != ref_np);
> > +
> > +       if (child_np && child_req_np == ref_np)
> > +               of_property_read_u64(child_np, "opp-hz", &rate);
> > +
> > +       of_node_put(child_req_np);
> > +       of_node_put(child_np);
> > +       of_node_put(ref_np);
> > +out_ref:
> > +       of_node_put(desc_np);
> > +
> > +       return (unsigned long) rate;
> > +}
> > +
> > +static int cpr_corner_init(struct cpr_drv *drv)
> > +{
> > +       const struct cpr_desc *desc = drv->desc;
> > +       const struct cpr_fuse *fuses = drv->cpr_fuses;
> > +       int i, level, count, scaling = 0;
> > +       unsigned int fnum, fc;
> > +       const char *quot_offset;
> > +       struct fuse_corner *fuse, *prev_fuse;
> > +       struct corner *corner, *end;
> > +       struct corner_data *cdata;
> > +       const struct fuse_corner_data *fdata;
> > +       bool apply_scaling;
> > +       unsigned long freq_diff, freq_diff_mhz;
> > +       unsigned long freq;
> > +       int step_volt = regulator_get_linear_step(drv->vdd_apc);
> > +       struct dev_pm_opp *opp;
> > +       struct device *pd_dev;
> > +
> > +       if (!step_volt)
> > +               return -EINVAL;
> > +
> > +       corner = drv->corners;
> > +       end = &corner[drv->num_corners - 1];
> > +
> > +       pd_dev = &drv->pd.dev;
> > +       cdata = devm_kzalloc(drv->dev,
> > +                            sizeof(struct corner_data) * drv->num_corners,
> > +                            GFP_KERNEL);
> > +       if (!cdata)
> > +               return -ENOMEM;
> > +
> > +       /*
> > +        * Store maximum frequency for each fuse corner based on the frequency
> > +        * plan
> > +        */
> > +       count = dev_pm_opp_get_opp_count(pd_dev);
> > +       for (level = 1; level <= count; level++) {
> > +               opp = dev_pm_opp_find_level_exact(pd_dev, level);
> > +               if (IS_ERR(opp))
> > +                       return -EINVAL;
> > +               fc = cpr_get_fuse_corner(opp);
> > +               if (!fc) {
> > +                       dev_pm_opp_put(opp);
> > +                       return -EINVAL;
> > +               }
> > +               fnum = fc - 1;
> > +               freq = cpr_get_opp_hz_for_req(opp);
> > +               if (!freq) {
> > +                       dev_pm_opp_put(opp);
> > +                       return -EINVAL;
> > +               }
> > +               cdata[level - 1].fuse_corner = fnum;
> > +               cdata[level - 1].freq = freq;
> > +
> > +               fuse = &drv->fuse_corners[fnum];
> > +               dev_dbg(drv->dev, "freq: %lu level: %u fuse level: %u\n",
> > +                       freq, dev_pm_opp_get_level(opp) - 1, fnum);
> > +               if (freq > fuse->max_freq)
> > +                       fuse->max_freq = freq;
> > +               dev_pm_opp_put(opp);
> > +       }
> > +
> > +       /*
> > +        * Get the quotient adjustment scaling factor, according to:
> > +        *
> > +        * scaling = min(1000 * (QUOT(corner_N) - QUOT(corner_N-1))
> > +        *              / (freq(corner_N) - freq(corner_N-1)), max_factor)
> > +        *
> > +        * QUOT(corner_N):      quotient read from fuse for fuse corner N
> > +        * QUOT(corner_N-1):    quotient read from fuse for fuse corner (N - 1)
> > +        * freq(corner_N):      max frequency in MHz supported by fuse corner N
> > +        * freq(corner_N-1):    max frequency in MHz supported by fuse corner
> > +        *                       (N - 1)
> > +        *
> > +        * Then walk through the corners mapped to each fuse corner
> > +        * and calculate the quotient adjustment for each one using the
> > +        * following formula:
> > +        *
> > +        * quot_adjust = (freq_max - freq_corner) * scaling / 1000
> > +        *
> > +        * freq_max: max frequency in MHz supported by the fuse corner
> > +        * freq_corner: frequency in MHz corresponding to the corner
> > +        * scaling: calculated from above equation
> > +        *
> > +        *
> > +        *     +                           +
> > +        *     |                         v |
> > +        *   q |           f c           o |           f c
> > +        *   u |         c               l |         c
> > +        *   o |       f                 t |       f
> > +        *   t |     c                   a |     c
> > +        *     | c f                     g | c f
> > +        *     |                         e |
> > +        *     +---------------            +----------------
> > +        *       0 1 2 3 4 5 6               0 1 2 3 4 5 6
> > +        *          corner                      corner
> > +        *
> > +        *    c = corner
> > +        *    f = fuse corner
> > +        *
> > +        */
> > +       for (apply_scaling = false, i = 0; corner <= end; corner++, i++) {
> > +               fnum = cdata[i].fuse_corner;
> > +               fdata = &desc->cpr_fuses.fuse_corner_data[fnum];
> > +               quot_offset = fuses[fnum].quotient_offset;
> > +               fuse = &drv->fuse_corners[fnum];
> > +               if (fnum)
> > +                       prev_fuse = &drv->fuse_corners[fnum - 1];
> > +               else
> > +                       prev_fuse = NULL;
> > +
> > +               corner->fuse_corner = fuse;
> > +               corner->freq = cdata[i].freq;
> > +               corner->uV = fuse->uV;
> > +
> > +               if (prev_fuse && cdata[i - 1].freq == prev_fuse->max_freq) {
> > +                       scaling = cpr_calculate_scaling(quot_offset, drv,
> > +                                                       fdata, corner);
> > +                       if (scaling < 0)
> > +                               return scaling;
> > +
> > +                       apply_scaling = true;
> > +               } else if (corner->freq == fuse->max_freq) {
> > +                       /* This is a fuse corner; don't scale anything */
> > +                       apply_scaling = false;
> > +               }
> > +
> > +               if (apply_scaling) {
> > +                       freq_diff = fuse->max_freq - corner->freq;
> > +                       freq_diff_mhz = freq_diff / 1000000;
> > +                       corner->quot_adjust = scaling * freq_diff_mhz / 1000;
> > +
> > +                       corner->uV = cpr_interpolate(corner, step_volt, fdata);
> > +               }
> > +
> > +               corner->max_uV = fuse->max_uV;
> > +               corner->min_uV = fuse->min_uV;
> > +               corner->uV = clamp(corner->uV, corner->min_uV, corner->max_uV);
> > +               corner->last_uV = corner->uV;
> > +
> > +               /* Reduce the ceiling voltage if needed */
> > +               if (desc->reduce_to_corner_uV && corner->uV < corner->max_uV)
> > +                       corner->max_uV = corner->uV;
> > +               else if (desc->reduce_to_fuse_uV && fuse->uV < corner->max_uV)
> > +                       corner->max_uV = max(corner->min_uV, fuse->uV);
> > +
> > +               dev_dbg(drv->dev, "corner %d: [%d %d %d] quot %d\n", i,
> > +                       corner->min_uV, corner->uV, corner->max_uV,
> > +                       fuse->quot - corner->quot_adjust);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct cpr_fuse *cpr_get_fuses(struct cpr_drv *drv)
> > +{
> > +       const struct cpr_desc *desc = drv->desc;
> > +       struct cpr_fuse *fuses;
> > +       int i;
> > +
> > +       fuses = devm_kzalloc(drv->dev,
> > +                            sizeof(struct cpr_fuse) * desc->num_fuse_corners,
> > +                            GFP_KERNEL);
> > +       if (!fuses)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       for (i = 0; i < desc->num_fuse_corners; i++) {
> > +               char tbuf[32];
> > +
> > +               snprintf(tbuf, 32, "cpr_ring_osc%d", i + 1);
> > +               fuses[i].ring_osc = devm_kstrdup(drv->dev, tbuf, GFP_KERNEL);
> > +               if (!fuses[i].ring_osc)
> > +                       return ERR_PTR(-ENOMEM);
> > +
> > +               snprintf(tbuf, 32, "cpr_init_voltage%d", i + 1);
> > +               fuses[i].init_voltage = devm_kstrdup(drv->dev, tbuf,
> > +                                                    GFP_KERNEL);
> > +               if (!fuses[i].init_voltage)
> > +                       return ERR_PTR(-ENOMEM);
> > +
> > +               snprintf(tbuf, 32, "cpr_quotient%d", i + 1);
> > +               fuses[i].quotient = devm_kstrdup(drv->dev, tbuf, GFP_KERNEL);
> > +               if (!fuses[i].quotient)
> > +                       return ERR_PTR(-ENOMEM);
> > +
> > +               snprintf(tbuf, 32, "cpr_quotient_offset%d", i + 1);
> > +               fuses[i].quotient_offset = devm_kstrdup(drv->dev, tbuf,
> > +                                                       GFP_KERNEL);
> > +               if (!fuses[i].quotient_offset)
> > +                       return ERR_PTR(-ENOMEM);
> > +       }
> > +
> > +       return fuses;
> > +}
> > +
> > +static int cpr_set_loop_allowed(struct cpr_drv *drv)
> > +{
> > +       drv->loop_disabled = false;
> > +
> > +       return 0;
> 
> Drop the return code?

[REVIEW-THX]
Fixed, thanks.

> 
> > +}
> > +
> > +static int cpr_init_parameters(struct cpr_drv *drv)
> > +{
> > +       struct device_node *of_node = drv->dev->of_node;
> > +       int ret;
> > +       struct clk *clk;
> > +
> > +       clk = clk_get(drv->dev, "ref");
> > +       if (IS_ERR(clk))
> > +               return PTR_ERR(clk);
> > +
> > +       drv->ref_clk_khz = clk_get_rate(clk) / 1000;
> > +       clk_put(clk);
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-timer-delay-us",
> > +                                  &drv->timer_delay_us);
> > +       if (ret)
> > +               return ret;
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-timer-cons-up",
> > +                                  &drv->timer_cons_up);
> > +       if (ret)
> > +               return ret;
> > +       drv->timer_cons_up &= RBIF_TIMER_ADJ_CONS_UP_MASK;
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-timer-cons-down",
> > +                                  &drv->timer_cons_down);
> > +       if (ret)
> > +               return ret;
> > +       drv->timer_cons_down &= RBIF_TIMER_ADJ_CONS_DOWN_MASK;
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-up-threshold",
> > +                                  &drv->up_threshold);
> > +       drv->up_threshold &= RBCPR_CTL_UP_THRESHOLD_MASK;
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-down-threshold",
> > +                                  &drv->down_threshold);
> > +       drv->down_threshold &= RBCPR_CTL_DN_THRESHOLD_MASK;
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-idle-clocks",
> > +                                  &drv->idle_clocks);
> > +       drv->idle_clocks &= RBCPR_STEP_QUOT_IDLE_CLK_MASK;
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-gcnt-us", &drv->gcnt_us);
> > +       if (ret)
> > +               return ret;
> > +       ret = of_property_read_u32(of_node, "qcom,vdd-apc-step-up-limit",
> > +                                  &drv->vdd_apc_step_up_limit);
> > +       if (ret)
> > +               return ret;
> > +       ret = of_property_read_u32(of_node, "qcom,vdd-apc-step-down-limit",
> > +                                  &drv->vdd_apc_step_down_limit);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = of_property_read_u32(of_node, "qcom,cpr-clamp-timer-interval",
> > +                                  &drv->clamp_timer_interval);
> > +       if (ret && ret != -EINVAL)
> > +               return ret;
> > +
> > +       drv->clamp_timer_interval = min_t(unsigned int,
> > +                                         drv->clamp_timer_interval,
> > +                                         RBIF_TIMER_ADJ_CLAMP_INT_MASK);
> > +
> > +       dev_dbg(drv->dev, "up threshold = %u, down threshold = %u\n",
> > +               drv->up_threshold, drv->down_threshold);
> > +
> > +       return 0;
> > +}
> > +
> > +static int cpr_find_initial_corner(struct cpr_drv *drv)
> > +{
> > +       unsigned long rate;
> > +       const struct corner *end;
> > +       struct corner *iter;
> > +       int i = 0;
> > +
> > +       if (IS_ERR_OR_NULL(drv->cpu_clk)) {
> 
> Will this ever happen?

[REVIEW-ETC]
Since incorporating your other review comment in cpr_pd_attach_dev(),
this function could still get a NULL clk.
Changed the check so that we only return -EINVAL if (!drv->cpu_clk).

> 
> > +               dev_err(drv->dev, "cpu clk is not set\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       end = &drv->corners[drv->num_corners - 1];
> > +       rate = clk_get_rate(drv->cpu_clk);
> > +
> > +       for (iter = drv->corners; iter <= end; iter++) {
> > +               if (iter->freq > rate)
> > +                       break;
> > +               i++;
> > +               if (iter->freq == rate) {
> > +                       drv->corner = iter;
> > +                       drv->performance_state = i;
> > +                       break;
> > +               }
> > +               if (iter->freq < rate) {
> > +                       drv->corner = iter;
> > +                       drv->performance_state = i;
> > +               }
> > +       }
> > +
> > +       if (!drv->corner) {
> > +               dev_err(drv->dev, "boot up corner not found\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       dev_dbg(drv->dev, "boot up perf state: %d\n", i);
> > +
> > +       return 0;
> > +}
> [...]
> > +
> > +static unsigned int cpr_get_performance(struct generic_pm_domain *genpd,
> > +                                       struct dev_pm_opp *opp)
> > +{
> > +       return dev_pm_opp_get_level(opp);
> > +}
> > +
> > +static int cpr_power_off(struct generic_pm_domain *domain)
> > +{
> > +       struct cpr_drv *drv = container_of(domain, struct cpr_drv, pd);
> > +
> > +       return cpr_disable(drv);
> > +}
> > +
> > +static int cpr_power_on(struct generic_pm_domain *domain)
> > +{
> > +       struct cpr_drv *drv = container_of(domain, struct cpr_drv, pd);
> > +
> > +       return cpr_enable(drv);
> > +}
> > +
> > +static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
> > +                            struct device *dev)
> > +{
> > +       struct cpr_drv *drv = container_of(domain, struct cpr_drv, pd);
> > +       const struct acc_desc *acc_desc = drv->acc_desc;
> > +       size_t len;
> > +       int ret;
> > +
> > +       dev_dbg(drv->dev, "attach callback for: %s\n", dev_name(dev));
> > +
> > +       if (!drv->cpu_clk) {
> 
> Maybe this could be if (drv->cpu_clk) return 0, and then deindent
> everything else.

[REVIEW-THX]
Fixed, thanks.

> 
> > +               drv->cpu_clk = devm_clk_get(dev, NULL);
> > +               if (IS_ERR_OR_NULL(drv->cpu_clk)) {
> 
> NULL is a valid clk. Probably just want to check for IS_ERR() and also
> not do anything with the return value besides PTR_ERR() on it?
> Eventually EPROBE_DEFER will arrive.

[REVIEW-THX]
Fixed, thanks.

> 
> > +                       dev_err(drv->dev, "could not get cpu clk\n");
> > +                       return -EINVAL;
> > +               }
> > +
> > +               dev_dbg(drv->dev, "using cpu clk from: %s\n", dev_name(dev));
> > +
> > +               /* Everything related to (virtual) corners has to be initialized
> > +                * here, when attaching to the power domain, since it depends on
> > +                * the power domain's OPP table, which isn't available earlier.
> > +                */
> > +               drv->num_corners = dev_pm_opp_get_opp_count(&drv->pd.dev);
> > +               if (drv->num_corners < 0)
> > +                       return drv->num_corners;
> > +               if (drv->num_corners < 2) {
> > +                       dev_err(drv->dev, "need at least 2 OPPs to use CPR\n");
> > +                       return -EINVAL;
> > +               }
> > +
> > +               dev_dbg(drv->dev, "number of OPPs: %d\n", drv->num_corners);
> > +
> > +               len = sizeof(*drv->corners) * drv->num_corners;
> > +               drv->corners = devm_kzalloc(dev, len, GFP_KERNEL);
> > +               if (!drv->corners)
> > +                       return -ENOMEM;
> > +
> > +               ret = cpr_corner_init(drv);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = cpr_set_loop_allowed(drv);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = cpr_init_parameters(drv);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               /* Configure CPR HW but keep it disabled */
> > +               ret = cpr_config(drv);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = cpr_find_initial_corner(drv);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               if (acc_desc->config)
> > +                       regmap_multi_reg_write(drv->tcsr, acc_desc->config,
> > +                                              acc_desc->num_regs_per_fuse);
> > +
> > +               /* Enable ACC if required */
> > +               if (acc_desc->enable_mask)
> > +                       regmap_update_bits(drv->tcsr, acc_desc->enable_reg,
> > +                                          acc_desc->enable_mask,
> > +                                          acc_desc->enable_mask);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cpr_debug_info_open(struct inode *inode, struct file *file)
> > +{
> > +       file->private_data = inode->i_private;
> > +
> > +       return 0;
> > +}
> > +
> > +static ssize_t cpr_debug_info_read(struct file *file, char __user *buff,
> > +                                  size_t count, loff_t *ppos)
> > +{
> > +       u32 gcnt, ro_sel, ctl, irq_status, reg, error_steps;
> > +       u32 step_dn, step_up, error, error_lt0, busy;
> > +       struct cpr_drv *drv = file->private_data;
> > +       struct fuse_corner *fuse_corner;
> > +       struct corner *corner;
> > +       ssize_t len, ret = 0;
> > +       char *debugfs_buf;
> > +
> > +       debugfs_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> > +       if (!debugfs_buf)
> > +               return -ENOMEM;
> > +
> > +       mutex_lock(&drv->lock);
> > +
> > +       corner = drv->corner;
> > +       fuse_corner = corner->fuse_corner;
> > +
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "corner, current_volt = %d uV\n",
> > +                      corner->last_uV);
> > +       ret += len;
> > +
> > +       ro_sel = fuse_corner->ring_osc_idx;
> > +       gcnt = cpr_read(drv, REG_RBCPR_GCNT_TARGET(ro_sel));
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "rbcpr_gcnt_target (%u) = 0x%02X\n", ro_sel, gcnt);
> > +       ret += len;
> > +
> > +       ctl = cpr_read(drv, REG_RBCPR_CTL);
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "rbcpr_ctl = 0x%02X\n", ctl);
> > +       ret += len;
> > +
> > +       irq_status = cpr_read(drv, REG_RBIF_IRQ_STATUS);
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "rbcpr_irq_status = 0x%02X\n", irq_status);
> > +       ret += len;
> > +
> > +       reg = cpr_read(drv, REG_RBCPR_RESULT_0);
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "rbcpr_result_0 = 0x%02X\n", reg);
> > +       ret += len;
> > +
> > +       step_dn = reg & 0x01;
> > +       step_up = (reg >> RBCPR_RESULT0_STEP_UP_SHIFT) & 0x01;
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      "  [step_dn = %u", step_dn);
> > +       ret += len;
> > +
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      ", step_up = %u", step_up);
> > +       ret += len;
> > +
> > +       error_steps = (reg >> RBCPR_RESULT0_ERROR_STEPS_SHIFT)
> > +                               & RBCPR_RESULT0_ERROR_STEPS_MASK;
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> 
> > +                      ", error_steps = %u", error_steps);
> > +       ret += len;
> > +
> > +       error = (reg >> RBCPR_RESULT0_ERROR_SHIFT) & RBCPR_RESULT0_ERROR_MASK;
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      ", error = %u", error);
> > +       ret += len;
> > +
> > +       error_lt0 = (reg >> RBCPR_RESULT0_ERROR_LT0_SHIFT) & 0x01;
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      ", error_lt_0 = %u", error_lt0);
> > +       ret += len;
> > +
> > +       busy = (reg >> RBCPR_RESULT0_BUSY_SHIFT) & 0x01;
> > +       len = snprintf(debugfs_buf + ret, PAGE_SIZE - ret,
> > +                      ", busy = %u]\n", busy);
> > +       ret += len;
> > +       mutex_unlock(&drv->lock);
> 
> What is the mutex for? Doesn't seem like a good idea for the debugfs API
> to be able to DDOS the threaded irq.

[REVIEW-THX]
Since we are only reading debug registers, it should be ok if this function
executes at the same time as cpr_set_performance() or cpr_irq_handler().
The user will need to monitor this data continuously when debugging anyway.
Dropped the mutex.

> 
> > +
> > +       ret = simple_read_from_buffer(buff, count, ppos, debugfs_buf, ret);
> 
> Can this use a seq_file instead of simple_read_from_buffer()?

[REVIEW-THX]
Fixed, thanks.

> 
> > +       kfree(debugfs_buf);
> > +       return ret;
> > +}
> > +
> > +static const struct file_operations cpr_debug_info_fops = {
> > +       .open = cpr_debug_info_open,
> > +       .read = cpr_debug_info_read,
> > +};
> > +
> > +static void cpr_debugfs_init(struct cpr_drv *drv)
> > +{
> > +       drv->debugfs = debugfs_create_dir("qcom_cpr", NULL);
> > +
> > +       debugfs_create_file("debug_info", 0444, drv->debugfs,
> > +                           drv, &cpr_debug_info_fops);
> > +}
> > +
> > +static int cpr_probe(struct platform_device *pdev)
> > +{
> > +       struct resource *res;
> > +       struct device *dev = &pdev->dev;
> > +       struct cpr_drv *drv;
> > +       size_t len;
> > +       int irq, ret;
> > +       const struct cpr_acc_desc *data;
> > +       struct device_node *np;
> > +       u32 cpr_rev = FUSE_REVISION_UNKNOWN;
> > +
> > +       data = of_device_get_match_data(dev);
> > +       if (!data || !data->cpr_desc || !data->acc_desc)
> > +               return -EINVAL;
> > +
> > +       drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> > +       if (!drv)
> > +               return -ENOMEM;
> > +       drv->dev = dev;
> > +       drv->desc = data->cpr_desc;
> > +       drv->acc_desc = data->acc_desc;
> > +
> > +       len = sizeof(*drv->fuse_corners) * drv->desc->num_fuse_corners;
> > +       drv->fuse_corners = devm_kzalloc(dev, len, GFP_KERNEL);
> 
> Use devm_kcalloc() to allocate arrays

[REVIEW-THX]
Fixed here and elsewhere, thanks.

> 
> > +       if (!drv->fuse_corners)
> > +               return -ENOMEM;
> > +
> > +       np = of_parse_phandle(dev->of_node, "acc-syscon", 0);
> > +       if (!np)
> > +               return -ENODEV;
> > +
> > +       drv->tcsr = syscon_node_to_regmap(np);
> > +       of_node_put(np);
> > +       if (IS_ERR(drv->tcsr))
> > +               return PTR_ERR(drv->tcsr);
> > +
> > +       mutex_init(&drv->lock);
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       drv->base = devm_ioremap_resource(dev, res);
> > +       if (IS_ERR(drv->base))
> > +               return PTR_ERR(drv->base);
> > +
> > +       irq = platform_get_irq(pdev, 0);
> > +       if (irq < 0)
> > +               return -EINVAL;
> > +
> > +       drv->vdd_apc = devm_regulator_get(dev, "vdd-apc");
> > +       if (IS_ERR(drv->vdd_apc))
> > +               return PTR_ERR(drv->vdd_apc);
> > +
> > +       /* Initialize fuse corners, since it simply depends
> 
> Please fix multi line comment style to have a single /* at the
> beginning.

[REVIEW-THX]
Fixed here and elsewhere, thanks.

> 
> > +        * on data in efuses.
> > +        * Everything related to (virtual) corners has to be
> > +        * initialized after attaching to the power domain,
> > +        * since is depends on the OPP table.
> > +        */
> > +       ret = cpr_read_efuse(dev, "cpr_fuse_revision", &cpr_rev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       drv->cpr_fuses = cpr_get_fuses(drv);
> > +       if (IS_ERR(drv->cpr_fuses))
> > +               return PTR_ERR(drv->cpr_fuses);
> > +
> > +       ret = cpr_populate_ring_osc_idx(drv);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = cpr_fuse_corner_init(drv);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = devm_request_threaded_irq(dev, irq, NULL,
> > +                                       cpr_irq_handler,
> > +                                       IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> > +                                       "cpr", drv);
> > +       if (ret)
> > +               return ret;
> > +
> > +       drv->pd.name = devm_kstrdup_const(dev, dev->of_node->full_name,
> > +                                         GFP_KERNEL);
> > +       if (!drv->pd.name)
> > +               return -EINVAL;
> > +
> > +       drv->pd.power_off = cpr_power_off;
> > +       drv->pd.power_on = cpr_power_on;
> > +       drv->pd.set_performance_state = cpr_set_performance;
> > +       drv->pd.opp_to_performance_state = cpr_get_performance;
> > +       drv->pd.attach_dev = cpr_pd_attach_dev;
> > +
> > +       ret = pm_genpd_init(&drv->pd, NULL, true);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = of_genpd_add_provider_simple(dev->of_node, &drv->pd);
> > +       if (ret)
> > +               return ret;
> > +
> > +       platform_set_drvdata(pdev, drv);
> > +       cpr_debugfs_init(drv);
> > +
> > +       return 0;
> > +}
> > +
> > +static int cpr_remove(struct platform_device *pdev)
> > +{
> > +       struct cpr_drv *drv = platform_get_drvdata(pdev);
> > +
> > +       if (cpr_is_allowed(drv)) {
> > +               cpr_ctl_disable(drv);
> > +               cpr_irq_set(drv, 0);
> > +       }
> > +
> > +       of_genpd_del_provider(pdev->dev.of_node);
> > +       pm_genpd_remove(&drv->pd);
> > +
> > +       debugfs_remove_recursive(drv->debugfs);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id cpr_match_table[] = {
> > +       { .compatible = "qcom,qcs404-cpr", .data = &qcs404_cpr_acc_desc },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, cpr_match_table);
> > +
> > +static struct platform_driver cpr_driver = {
> > +       .probe          = cpr_probe,
> > +       .remove         = cpr_remove,
> > +       .driver         = {
> > +               .name   = "qcom-cpr",
> > +               .of_match_table = cpr_match_table,
> > +               .pm = &cpr_pm_ops,
> > +       },
> > +};
> > +module_platform_driver(cpr_driver);
> > +
> > +MODULE_DESCRIPTION("Core Power Reduction (CPR) driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:qcom-cpr");
> 
> Is the alias needed?

[REVIEW-THX]
No, it is not. Dropped it, thanks.
