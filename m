Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488F5395A35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 14:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhEaMPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 08:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhEaMPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 08:15:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E60DC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 05:14:03 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so1870322pjq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUjLMACbrkt7r2ZVyJm/99uZmjF5AZdRTDuMPhj47Lg=;
        b=zaWrh7rYiS/hn8hSHEZ8k0yIu1A+jzwnoj2lYTdvw0v1BqzDHpCz7WDwhTiHElsBnX
         MoZGDfdkRlISVy/UjfJgdajb1kSCL5ls9UGxXqhlUA3Hc3J6HnUYzc9gRn38/Mx0WHOP
         WnVUfovHacnYQt+HEisDAJ+0v92qsSzfckFUv6WyvBzP4vK1W9zyhdlHgHPLWt+a0xuJ
         X8zEkP0WFPmOup8qYJyUA3Iqgla6jqHsLXPDITPcRbxHkWgJRMepZocIjXI6vDNKA7RN
         dxbK/1AUQZzD5mTUux92bKoh7BPM96HW3z550JJS3CyeWgCoijEcKvyv4Odz+0IHkolJ
         1wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUjLMACbrkt7r2ZVyJm/99uZmjF5AZdRTDuMPhj47Lg=;
        b=MzWsi51x4LQ8/ksnwdCHoK/GImY19dmrFQ7gREhjBEVeg9PYXYH+Rppea06Et/kaBc
         Dce8ncqeTYpZuLQq7JkgJqFI5182YlXWT9tXHFyQl91esRCr3WwHCRunbhYRXhPlOF9Z
         o3/vfuatRa4u3aX0mVwFS+3MmOlGkKkWRS0FzL1VchM4h1TBtlalyabZizFgASmMihoQ
         0eWHg/eRM7KtUoZmpelbTfAqtJAbebrmKWgDj+xdvujeKRh0X9Mer0QGJdLnGh1NH/A1
         493QTcxtR1Xl+b/bkZeX+0UNRcBNiF+MxO/xpO9ncigrXFGm0ft64McLHatPYqyW7ff6
         ATAw==
X-Gm-Message-State: AOAM5328w6audnKaGquxx3ymXK3bc9ElsWiGlYceqiCtdLECqY6fegZR
        jmCAAwaf2TK4i4t31WZxF2R3s+xt8nmc2hLzgzXYcg==
X-Google-Smtp-Source: ABdhPJwjUrovdGpK8MZHeCz7WgDzugwnZnx0+q4C71jkgG6y4NUlwAnnRXTeI5chUccUzttW0XM1pyZVh8sGaE1pLyY=
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id
 d15-20020a170902b70fb02900f45445cd9fmr20816754pls.32.1622463242942; Mon, 31
 May 2021 05:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-15-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-15-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 May 2021 14:13:51 +0200
Message-ID: <CAG3jFytV1cchKPZP0_1qN+D9JUnhNDo6fJzEqz7e8LM7p4fysQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] media: camss: Add initial support for VFE hardware
 version Titan 480
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jonathan,

Thanks for sending this out.

There are a few checkpatch --strict warnings/etc. in this patch. I
won't cover them individually below.

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add support for VFE found on SM8250 (Titan 480). This implementation is
> based on the titan 170 implementation. It supports the normal and lite VFE,
> and only supports the RDI0 capture path.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../media/platform/qcom/camss/camss-vfe-480.c | 554 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  3 files changed, 556 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
>
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 0752c46ea37b..81dd56aff0f2 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -15,6 +15,7 @@ qcom-camss-objs += \
>                 camss-vfe-4-7.o \
>                 camss-vfe-4-8.o \
>                 camss-vfe-170.o \
> +               camss-vfe-480.o \
>                 camss-vfe-gen1.o \
>                 camss-vfe.o \
>                 camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> new file mode 100644
> index 000000000000..79210fabbc2a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -0,0 +1,554 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-480.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v480 (SM8250)
> + *
> + * Copyright (C) 2020-2021 Linaro Ltd.
> + * Copyright (C) 2021 Jonathan Marek
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE 2/3 are lite and have a different register layout */
> +#define IS_LITE                (vfe->id >= 2 ? 1 : 0)
> +
> +#define VFE_HW_VERSION                 (0x00)
> +
> +#define VFE_GLOBAL_RESET_CMD           (IS_LITE ? 0x0c : 0x1c)
> +#define            GLOBAL_RESET_HW_AND_REG     (IS_LITE ? BIT(1) : BIT(0))
> +
> +#define VFE_REG_UPDATE_CMD             (IS_LITE ? 0x20 : 0x34)
> +#define            REG_UPDATE_RDI(n)           (IS_LITE ? BIT(n) : BIT(1 + (n)))
> +#define VFE_IRQ_CMD                    (IS_LITE ? 0x24 : 0x38)
> +#define     IRQ_CMD_GLOBAL_CLEAR       BIT(0)
> +
> +#define VFE_IRQ_MASK(n)                        ((IS_LITE ? 0x28 : 0x3c) + (n) * 4)
> +#define            IRQ_MASK_0_RESET_ACK        (IS_LITE ? BIT(17) : BIT(0))
> +#define            IRQ_MASK_0_BUS_TOP_IRQ      (IS_LITE ? BIT(4) : BIT(7))
> +#define VFE_IRQ_CLEAR(n)               ((IS_LITE ? 0x34 : 0x48) + (n) * 4)
> +#define VFE_IRQ_STATUS(n)              ((IS_LITE ? 0x40 : 0x54) + (n) * 4)
> +
> +#define BUS_REG_BASE                   (IS_LITE ? 0x1a00 : 0xaa00)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE                (BUS_REG_BASE + 0x08)
> +#define                WM_CGC_OVERRIDE_ALL     (0x3FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL       (BUS_REG_BASE + 0xdc)
> +
> +#define VFE_BUS_IRQ_MASK(n)            (BUS_REG_BASE + 0x18 + (n) * 4)
> +#define     BUS_IRQ_MASK_0_RDI_RUP(n)  (IS_LITE ? BIT(n) : BIT(3 + (n)))
> +#define     BUS_IRQ_MASK_0_COMP_DONE(n)        (IS_LITE ? BIT(4 + (n)) : BIT(6 + (n)))
> +#define VFE_BUS_IRQ_CLEAR(n)           (BUS_REG_BASE + 0x20 + (n) * 4)
> +#define VFE_BUS_IRQ_STATUS(n)          (BUS_REG_BASE + 0x28 + (n) * 4)
> +#define VFE_BUS_IRQ_CLEAR_GLOBAL       (BUS_REG_BASE + 0x30)
> +
> +#define VFE_BUS_WM_CFG(n)              (BUS_REG_BASE + 0x200 + (n) * 0x100)
> +#define                WM_CFG_EN                       (0)
> +#define                WM_CFG_MODE                     (16)
> +#define                        MODE_QCOM_PLAIN (0)
> +#define                        MODE_MIPI_RAW   (1)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)       (BUS_REG_BASE + 0x204 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)       (BUS_REG_BASE + 0x208 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)      (BUS_REG_BASE + 0x20c + (n) * 0x100)
> +#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH    (0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_1(n)      (BUS_REG_BASE + 0x210 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)      (BUS_REG_BASE + 0x214 + (n) * 0x100)
> +#define VFE_BUS_WM_PACKER_CFG(n)       (BUS_REG_BASE + 0x218 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_ADDR(n)      (BUS_REG_BASE + 0x220 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_INCR(n)      (BUS_REG_BASE + 0x224 + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_CFG(n)       (BUS_REG_BASE + 0x228 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)     (BUS_REG_BASE + 0x230 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x234 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)         (BUS_REG_BASE + 0x238 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)                (BUS_REG_BASE + 0x23c + (n) * 0x100)
> +
> +#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n) (BUS_REG_BASE + 0x260 + (n) * 0x100)
> +#define VFE_BUS_WM_BURST_LIMIT(n)      (BUS_REG_BASE + 0x264 + (n) * 0x100)
> +
> +/* for titan 480, each bus client is hardcoded to a specific path
> + * and each bus client is part of a hardcoded "comp group"
> + */
> +#define RDI_WM(n)                      ((IS_LITE ? 0 : 23) + n)
> +#define RDI_COMP_GROUP(n)              ((IS_LITE ? 0 : 11) + n)

The indentation of the different types of defines above differ from
vfe170, but I kind of prefer this style. Feel free to change either.

> +
> +static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
> +{
> +       u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> +
> +       u32 gen = (hw_version >> 28) & 0xF;
> +       u32 rev = (hw_version >> 16) & 0xFFF;
> +       u32 step = hw_version & 0xFFFF;
> +
> +       dev_dbg(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +       writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
> +       writel_relaxed(GLOBAL_RESET_HW_AND_REG, vfe->base + VFE_GLOBAL_RESET_CMD);
> +}
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +       struct v4l2_pix_format_mplane *pix =
> +               &line->video_out.active_fmt.fmt.pix_mp;
> +
> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> +
> +       /* no clock gating at bus input */
> +       writel_relaxed(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +       writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +       writel_relaxed(pix->plane_fmt[0].bytesperline * pix->height,
> +                      vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +       writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
> +       writel_relaxed(WM_IMAGE_CFG_0_DEFAULT_WIDTH,
> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +       writel_relaxed(pix->plane_fmt[0].bytesperline,
> +                      vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));

^^^ using more of the 130char line length is probably better for legibility.

> +
> +       /* no dropped frames, one irq per frame */
> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +       writel_relaxed(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +       writel_relaxed(1 << WM_CFG_EN | MODE_MIPI_RAW << WM_CFG_MODE,
> +                      vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> +{
> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> +       writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +                         struct vfe_line *line)
> +{
> +       wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
> +       writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +       vfe->reg_update |= REG_UPDATE_RDI(line_id);
> +       writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +                                       enum vfe_line_id line_id)
> +{
> +       vfe->reg_update &= ~REG_UPDATE_RDI(line_id);
> +}
> +
> +static void vfe_enable_irq_common(struct vfe_device *vfe)
> +{
> +       /* enable only the IRQs used: rup and comp_done irqs for RDI0 */
> +       writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
> +                      vfe->base + VFE_IRQ_MASK(0));
> +       writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(0) |
> +                      BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)),
> +                      vfe->base + VFE_BUS_IRQ_MASK(0));
> +}
> +
> +/*
> + * vfe_isr - VFE module interrupt handler
> + * @irq: Interrupt line
> + * @dev: VFE device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +       struct vfe_device *vfe = dev;
> +       u32 status;
> +
> +       status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
> +       writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
> +       writel_relaxed(IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
> +
> +       if (status & IRQ_MASK_0_RESET_ACK)
> +               vfe->isr_ops.reset_ack(vfe);
> +
> +       if (status & IRQ_MASK_0_BUS_TOP_IRQ) {
> +               u32 status = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(0));
> +               writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
> +               writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
> +
> +               if (status & BUS_IRQ_MASK_0_RDI_RUP(0))
> +                       vfe->isr_ops.reg_update(vfe, 0);
> +
> +               if (status & BUS_IRQ_MASK_0_COMP_DONE(RDI_COMP_GROUP(0)))
> +                       vfe->isr_ops.wm_done(vfe, 0);

COMP_DONE is signalled in the status register, but wm_done() is
called. comp_done() seems to never be called.

> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/*
> + * vfe_halt - Trigger halt on VFE module and wait to complete
> + * @vfe: VFE device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +       /* rely on vfe_disable_output() to stop the VFE */
> +       return 0;
> +}
> +
> +static int vfe_get_output(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe = to_vfe(line);
> +       struct vfe_output *output;
> +       unsigned long flags;
> +       int wm_idx;
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +
> +       output = &line->output;
> +       if (output->state != VFE_OUTPUT_OFF) {
> +               dev_err(vfe->camss->dev, "Output is running\n");
> +               goto error;
> +       }
> +
> +       output->wm_num = 1;
> +
> +       wm_idx = vfe_reserve_wm(vfe, line->id);
> +       if (wm_idx < 0) {
> +               dev_err(vfe->camss->dev, "Can not reserve wm\n");
> +               goto error_get_wm;
> +       }
> +       output->wm_idx[0] = wm_idx;
> +
> +       output->drop_update_idx = 0;
> +
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       return 0;
> +
> +error_get_wm:
> +       vfe_release_wm(vfe, output->wm_idx[0]);
> +       output->state = VFE_OUTPUT_OFF;
> +error:
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       return -EINVAL;
> +}
> +
> +static int vfe_enable_output(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe = to_vfe(line);
> +       struct vfe_output *output = &line->output;
> +       const struct vfe_hw_ops *ops = vfe->ops;
> +       unsigned long flags;
> +       unsigned int i;
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +
> +       ops->reg_update_clear(vfe, line->id);
> +
> +       if (output->state != VFE_OUTPUT_OFF) {
> +               dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
> +                       output->state);
> +               spin_unlock_irqrestore(&vfe->output_lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       WARN_ON(output->gen2.active_num);
> +
> +       output->state = VFE_OUTPUT_ON;
> +
> +       output->sequence = 0;
> +       output->wait_reg_update = 0;
> +       reinit_completion(&output->reg_update);
> +
> +       vfe_wm_start(vfe, output->wm_idx[0], line);
> +
> +       for (i = 0; i < 2; i++) {
> +               output->buf[i] = vfe_buf_get_pending(output);
> +               if (!output->buf[i])
> +                       break;
> +               output->gen2.active_num++;
> +               vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
> +       }
> +
> +       ops->reg_update(vfe, line->id);
> +
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       return 0;
> +}
> +
> +static int vfe_disable_output(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe = to_vfe(line);
> +       struct vfe_output *output = &line->output;
> +       unsigned long flags;
> +       unsigned int i;
> +       bool done;
> +       int timeout = 0;
> +
> +       do {
> +               spin_lock_irqsave(&vfe->output_lock, flags);
> +               done = !output->gen2.active_num;
> +               spin_unlock_irqrestore(&vfe->output_lock, flags);
> +               usleep_range(10000, 20000);
> +
> +               if (timeout++ == 100) {
> +                       dev_err(vfe->camss->dev, "VFE idle timeout - resetting\n");
> +                       vfe_reset(vfe);
> +                       output->gen2.active_num = 0;
> +                       return 0;
> +               }
> +       } while (!done);
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +       for (i = 0; i < output->wm_num; i++)
> +               vfe_wm_stop(vfe, output->wm_idx[i]);
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       return 0;
> +}
> +
> +/*
> + * vfe_enable - Enable streaming on VFE line
> + * @line: VFE line
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_enable(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe = to_vfe(line);
> +       int ret;
> +
> +       mutex_lock(&vfe->stream_lock);
> +
> +       if (!vfe->stream_count)
> +               vfe_enable_irq_common(vfe);
> +
> +       vfe->stream_count++;
> +
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       ret = vfe_get_output(line);
> +       if (ret < 0)
> +               goto error_get_output;
> +
> +       ret = vfe_enable_output(line);
> +       if (ret < 0)
> +               goto error_enable_output;
> +
> +       vfe->was_streaming = 1;
> +
> +       return 0;
> +
> +error_enable_output:
> +       vfe_put_output(line);
> +
> +error_get_output:
> +       mutex_lock(&vfe->stream_lock);
> +
> +       vfe->stream_count--;
> +
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       return ret;
> +}
> +
> +/*
> + * vfe_disable - Disable streaming on VFE line
> + * @line: VFE line
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_disable(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe = to_vfe(line);
> +
> +       vfe_disable_output(line);
> +
> +       vfe_put_output(line);
> +
> +       mutex_lock(&vfe->stream_lock);
> +
> +       vfe->stream_count--;
> +
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       return 0;
> +}
> +
> +/*
> + * vfe_isr_reg_update - Process reg update interrupt
> + * @vfe: VFE Device
> + * @line_id: VFE line
> + */
> +static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +       struct vfe_output *output;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +       vfe->ops->reg_update_clear(vfe, line_id);
> +
> +       output = &vfe->line[line_id].output;
> +
> +       if (output->wait_reg_update) {
> +               output->wait_reg_update = 0;
> +               complete(&output->reg_update);
> +       }
> +
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +}
> +
> +/*
> + * vfe_isr_wm_done - Process write master done interrupt
> + * @vfe: VFE Device
> + * @wm: Write master id
> + */
> +static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
> +{
> +       struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
> +       struct camss_buffer *ready_buf;
> +       struct vfe_output *output;
> +       unsigned long flags;
> +       u32 index;
> +       u64 ts = ktime_get_ns();
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +
> +       if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
> +               dev_err_ratelimited(vfe->camss->dev,
> +                                   "Received wm done for unmapped index\n");
> +               goto out_unlock;
> +       }
> +       output = &vfe->line[vfe->wm_output_map[wm]].output;
> +
> +       ready_buf = output->buf[0];
> +       if (!ready_buf) {
> +               dev_err_ratelimited(vfe->camss->dev,
> +                                   "Missing ready buf %d!\n", output->state);
> +               goto out_unlock;
> +       }
> +
> +       ready_buf->vb.vb2_buf.timestamp = ts;
> +       ready_buf->vb.sequence = output->sequence++;
> +
> +       index = 0;
> +       output->buf[0] = output->buf[1];
> +       if (output->buf[0])
> +               index = 1;
> +
> +       output->buf[index] = vfe_buf_get_pending(output);
> +
> +       if (output->buf[index])
> +               vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
> +       else
> +               output->gen2.active_num--;
> +
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +       return;
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +}
> +
> +/*
> + * vfe_pm_domain_off - Disable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static void vfe_pm_domain_off(struct vfe_device *vfe)
> +{
> +       /* nop */
> +}
> +
> +/*
> + * vfe_pm_domain_on - Enable power domains specific to this VFE.
> + * @vfe: VFE Device
> + */
> +static int vfe_pm_domain_on(struct vfe_device *vfe)
> +{
> +       return 0;
> +}
> +
> +/*
> + * vfe_queue_buffer - Add empty buffer
> + * @vid: Video device structure
> + * @buf: Buffer to be enqueued
> + *
> + * Add an empty buffer - depending on the current number of buffers it will be
> + * put in pending buffer queue or directly given to the hardware to be filled.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_queue_buffer(struct camss_video *vid,
> +                           struct camss_buffer *buf)
> +{
> +       struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
> +       struct vfe_device *vfe = to_vfe(line);
> +       struct vfe_output *output;
> +       unsigned long flags;
> +
> +       output = &line->output;
> +
> +       spin_lock_irqsave(&vfe->output_lock, flags);
> +
> +       if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
> +               output->buf[output->gen2.active_num++] = buf;
> +               vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
> +       } else {
> +               vfe_buf_add_pending(output, buf);
> +       }
> +
> +       spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +       return 0;
> +}
> +
> +static const struct vfe_isr_ops vfe_isr_ops_480 = {
> +       .reset_ack = vfe_isr_reset_ack,
> +       .reg_update = vfe_isr_reg_update,
> +       .comp_done = vfe_isr_comp_done,
> +       .wm_done = vfe_isr_wm_done,
> +};
> +
> +static const struct camss_video_ops vfe_video_ops_480 = {
> +       .queue_buffer = vfe_queue_buffer,
> +       .flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +       vfe->isr_ops = vfe_isr_ops_480;
> +       vfe->video_ops = vfe_video_ops_480;
> +       vfe->line_num = 1;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_480 = {
> +       .global_reset = vfe_global_reset,
> +       .hw_version_read = vfe_hw_version_read,
> +       .isr = vfe_isr,
> +       .pm_domain_off = vfe_pm_domain_off,
> +       .pm_domain_on = vfe_pm_domain_on,
> +       .reg_update_clear = vfe_reg_update_clear,
> +       .reg_update = vfe_reg_update,
> +       .subdev_init = vfe_subdev_init,
> +       .vfe_disable = vfe_disable,
> +       .vfe_enable = vfe_enable,
> +       .vfe_halt = vfe_halt,
> +};

Again there are some functions that could be refactored out to a vfe
gen2 parent struct & object. This time I think it's worth refactoring
out the common code, especially since we know more platforms based on
this architecture are coming.

vfe_queue_buffer
vfe_pm_domain_on
vfe_pm_domain_off
vfe_isr_wm_done
vfe_isr_reg_update
vfe_get_output (although vfe170 contains a frame_skip chunk that
should be removed)
vfe_halt

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 844b9275031d..83b11ae1572d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -201,5 +201,6 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
>  extern const struct vfe_hw_ops vfe_ops_4_8;
>  extern const struct vfe_hw_ops vfe_ops_170;
> +extern const struct vfe_hw_ops vfe_ops_480;
>
>  #endif /* QC_MSM_CAMSS_VFE_H */
> --
> 2.26.1
>
