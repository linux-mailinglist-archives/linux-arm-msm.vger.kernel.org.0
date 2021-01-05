Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484DE2EA61B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 08:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbhAEHlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 02:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbhAEHlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 02:41:47 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1142BC061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 23:41:07 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id h6so15883565vsr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 23:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZDHnUZMeak92fWW+Zw5mzkpkAWgyhYZcC/JZl7EtmM=;
        b=lnYV1nZXnxZwG7cDXMuTnER04ChbiRiMgzWJpATVMjZCsgted5mrvPolB+ecrGiYb1
         HrV42+HW9bPpqxwFTxHpDTlTEVy2Z4jEKEVJLBK8wOTL76KcsOyPMDZHISUxjn5j3uE+
         4464X/JRkbYa2ERzIpJFVR9K5VpuTej95oXic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZDHnUZMeak92fWW+Zw5mzkpkAWgyhYZcC/JZl7EtmM=;
        b=VTpE/1tgBrmRCPzWpTLEE2Gu8kNt7bvOmeRNzWrVg49YeQjr4U7rrETOx3oElaKllH
         c8aaJ6qb2amVZWD1/pecxdT6+zYJ/m6mlL0xyIU32i1MLj7VLgrZ8kFP/rGaHDXXHgfY
         AsXyULC3lILq53Xz7VDehLIYUpv06S6kmmc59VkHSRZBV1YmXpD11O0RslTv9ppCE70l
         y6SL269GcKwulxkJZq1XILE+rJ8CPgMIs7EqrX3lUCH4veZpn3z9TIBYsLZmST/QQPZZ
         43+2OlX9weQuuE2pDLS1zeSV+KgX6uiERDYlCEkj4QlnzlbG5qvTDqELXtKerc3rmEgh
         55OQ==
X-Gm-Message-State: AOAM5336UU5w24mxyyk04sV6H3icmRcIkAfT1DHjSe3hGipam38xninD
        GvgNT+eVqgTzFD5ZZFMmWJBhK2QBSeGbiY4KQknLcQ==
X-Google-Smtp-Source: ABdhPJzvikiAKnN+Ncm0bYEjYh0q1lXfBkwBNWc+uQVZpKofjhBVqgeMT4BY5P0aK+HgBz+ZYjinmIYr86M/c9NYk+o=
X-Received: by 2002:a67:7993:: with SMTP id u141mr29504130vsc.21.1609832466146;
 Mon, 04 Jan 2021 23:41:06 -0800 (PST)
MIME-Version: 1.0
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1608691469-20919-4-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1608691469-20919-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 5 Jan 2021 15:40:55 +0800
Message-ID: <CANMq1KA9QHzjqUyMZfFOvBzwWQE3Sk_b8QCzchC+a+CqQnVWLA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] spmi: mediatek: Add support for MT6873/8192
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-arm-msm@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 23, 2020 at 10:45 AM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> Add spmi support for MT6873/8192.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/spmi/Kconfig         |   9 +
>  drivers/spmi/Makefile        |   1 +
>  drivers/spmi/spmi-mtk-pmif.c | 504 +++++++++++++++++++++++++++++++++++
>  3 files changed, 514 insertions(+)
>  create mode 100644 drivers/spmi/spmi-mtk-pmif.c
>
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a53bad541f1a..418848840999 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -25,4 +25,13 @@ config SPMI_MSM_PMIC_ARB
>           This is required for communicating with Qualcomm PMICs and
>           other devices that have the SPMI interface.
>
> +config SPMI_MTK_PMIF
> +       tristate "Mediatek SPMI Controller (PMIC Arbiter)"
> +       help
> +         If you say yes to this option, support will be included for the
> +         built-in SPMI PMIC Arbiter interface on Mediatek family
> +         processors.
> +
> +         This is required for communicating with Mediatek PMICs and
> +         other devices that have the SPMI interface.
>  endif
> diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
> index 55a94cadeffe..91f303b96925 100644
> --- a/drivers/spmi/Makefile
> +++ b/drivers/spmi/Makefile
> @@ -5,3 +5,4 @@
>  obj-$(CONFIG_SPMI)     += spmi.o
>
>  obj-$(CONFIG_SPMI_MSM_PMIC_ARB)        += spmi-pmic-arb.o
> +obj-$(CONFIG_SPMI_MTK_PMIF)    += spmi-mtk-pmif.o
> \ No newline at end of file

Newline at end of file please.

> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> new file mode 100644
> index 000000000000..711d3973800b
> --- /dev/null
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -0,0 +1,504 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spmi.h>
> +
> +#define SWINF_IDLE     0x00
> +#define SWINF_WFVLDCLR 0x06
> +
> +#define GET_SWINF(x)   (((x) >> 1) & 0x7)
> +
> +#define PMIF_CMD_REG_0         0
> +#define PMIF_CMD_REG           1
> +#define PMIF_CMD_EXT_REG       2
> +#define PMIF_CMD_EXT_REG_LONG  3
> +
> +#define PMIF_DELAY_US   10
> +#define PMIF_TIMEOUT    (10 * 1000)

PMIF_TIMEOUT_US

> +
> +#define PMIF_CHAN_OFFSET 0x5
> +
> +#define SPMI_OP_ST_BUSY 1
> +
> +struct ch_reg {
> +       u32 ch_sta;
> +       u32 wdata;
> +       u32 rdata;
> +       u32 ch_send;
> +       u32 ch_rdy;
> +};
> +
> +struct pmif {
> +       void __iomem    *base;
> +       const u32       *regs;
> +       void __iomem    *spmimst_base;
> +       const u32       *spmimst_regs;
> +       u32             soc_chan;
> +       int             grpid;

Drop this, never used.

> +       raw_spinlock_t  lock;
> +       struct clk      *pmif_sys_ck;
> +       struct clk      *pmif_tmr_ck;
> +       struct clk      *spmimst_clk_mux;
> +       struct ch_reg   chan;
> +};
> +
> +enum pmif_regs {
> +       PMIF_INIT_DONE,
> +       PMIF_INF_EN,
> +       PMIF_ARB_EN,
> +       PMIF_CMDISSUE_EN,
> +       PMIF_TIMER_CTRL,
> +       PMIF_SPI_MODE_CTRL,
> +       PMIF_IRQ_EVENT_EN_0,
> +       PMIF_IRQ_FLAG_0,
> +       PMIF_IRQ_CLR_0,
> +       PMIF_IRQ_EVENT_EN_1,
> +       PMIF_IRQ_FLAG_1,
> +       PMIF_IRQ_CLR_1,
> +       PMIF_IRQ_EVENT_EN_2,
> +       PMIF_IRQ_FLAG_2,
> +       PMIF_IRQ_CLR_2,
> +       PMIF_IRQ_EVENT_EN_3,
> +       PMIF_IRQ_FLAG_3,
> +       PMIF_IRQ_CLR_3,
> +       PMIF_IRQ_EVENT_EN_4,
> +       PMIF_IRQ_FLAG_4,
> +       PMIF_IRQ_CLR_4,
> +       PMIF_WDT_EVENT_EN_0,
> +       PMIF_WDT_FLAG_0,
> +       PMIF_WDT_EVENT_EN_1,
> +       PMIF_WDT_FLAG_1,
> +       PMIF_SWINF_0_STA,
> +       PMIF_SWINF_0_WDATA_31_0,
> +       PMIF_SWINF_0_RDATA_31_0,
> +       PMIF_SWINF_0_ACC,
> +       PMIF_SWINF_0_VLD_CLR,
> +       PMIF_SWINF_1_STA,
> +       PMIF_SWINF_1_WDATA_31_0,
> +       PMIF_SWINF_1_RDATA_31_0,
> +       PMIF_SWINF_1_ACC,
> +       PMIF_SWINF_1_VLD_CLR,
> +       PMIF_SWINF_2_STA,
> +       PMIF_SWINF_2_WDATA_31_0,
> +       PMIF_SWINF_2_RDATA_31_0,
> +       PMIF_SWINF_2_ACC,
> +       PMIF_SWINF_2_VLD_CLR,
> +       PMIF_SWINF_3_STA,
> +       PMIF_SWINF_3_WDATA_31_0,
> +       PMIF_SWINF_3_RDATA_31_0,
> +       PMIF_SWINF_3_ACC,
> +       PMIF_SWINF_3_VLD_CLR,
> +};
> +
> +static const u32 mt6873_regs[] = {
> +       [PMIF_INIT_DONE] =      0x0000,
> +       [PMIF_INF_EN] =         0x0024,
> +       [PMIF_ARB_EN] =         0x0150,
> +       [PMIF_CMDISSUE_EN] =    0x03B4,
> +       [PMIF_TIMER_CTRL] =     0x03E0,
> +       [PMIF_SPI_MODE_CTRL] =  0x0400,
> +       [PMIF_IRQ_EVENT_EN_0] = 0x0418,
> +       [PMIF_IRQ_FLAG_0] =     0x0420,
> +       [PMIF_IRQ_CLR_0] =      0x0424,
> +       [PMIF_IRQ_EVENT_EN_1] = 0x0428,
> +       [PMIF_IRQ_FLAG_1] =     0x0430,
> +       [PMIF_IRQ_CLR_1] =      0x0434,
> +       [PMIF_IRQ_EVENT_EN_2] = 0x0438,
> +       [PMIF_IRQ_FLAG_2] =     0x0440,
> +       [PMIF_IRQ_CLR_2] =      0x0444,
> +       [PMIF_IRQ_EVENT_EN_3] = 0x0448,
> +       [PMIF_IRQ_FLAG_3] =     0x0450,
> +       [PMIF_IRQ_CLR_3] =      0x0454,
> +       [PMIF_IRQ_EVENT_EN_4] = 0x0458,
> +       [PMIF_IRQ_FLAG_4] =     0x0460,
> +       [PMIF_IRQ_CLR_4] =      0x0464,
> +       [PMIF_WDT_EVENT_EN_0] = 0x046C,
> +       [PMIF_WDT_FLAG_0] =     0x0470,
> +       [PMIF_WDT_EVENT_EN_1] = 0x0474,
> +       [PMIF_WDT_FLAG_1] =     0x0478,
> +       [PMIF_SWINF_0_ACC] =    0x0C00,
> +       [PMIF_SWINF_0_WDATA_31_0] =     0x0C04,
> +       [PMIF_SWINF_0_RDATA_31_0] =     0x0C14,
> +       [PMIF_SWINF_0_VLD_CLR] =        0x0C24,
> +       [PMIF_SWINF_0_STA] =    0x0C28,
> +       [PMIF_SWINF_1_ACC] =    0x0C40,
> +       [PMIF_SWINF_1_WDATA_31_0] =     0x0C44,
> +       [PMIF_SWINF_1_RDATA_31_0] =     0x0C54,
> +       [PMIF_SWINF_1_VLD_CLR] =        0x0C64,
> +       [PMIF_SWINF_1_STA] =    0x0C68,
> +       [PMIF_SWINF_2_ACC] =    0x0C80,
> +       [PMIF_SWINF_2_WDATA_31_0] =     0x0C84,
> +       [PMIF_SWINF_2_RDATA_31_0] =     0x0C94,
> +       [PMIF_SWINF_2_VLD_CLR] =        0x0CA4,
> +       [PMIF_SWINF_2_STA] =    0x0CA8,
> +       [PMIF_SWINF_3_ACC] =    0x0CC0,
> +       [PMIF_SWINF_3_WDATA_31_0] =     0x0CC4,
> +       [PMIF_SWINF_3_RDATA_31_0] =     0x0CD4,
> +       [PMIF_SWINF_3_VLD_CLR] =        0x0CE4,
> +       [PMIF_SWINF_3_STA] =    0x0CE8,
> +};
> +
> +enum spmi_regs {
> +       SPMI_OP_ST_CTRL,
> +       SPMI_GRP_ID_EN,
> +       SPMI_OP_ST_STA,
> +       SPMI_MST_SAMPL,
> +       SPMI_MST_REQ_EN,
> +       SPMI_REC_CTRL,
> +       SPMI_REC0,
> +       SPMI_REC1,
> +       SPMI_REC2,
> +       SPMI_REC3,
> +       SPMI_REC4,
> +       SPMI_MST_DBG,
> +};
> +
> +static const u32 mt6873_spmi_regs[] = {
> +       [SPMI_OP_ST_CTRL] =     0x0000,
> +       [SPMI_GRP_ID_EN] =      0x0004,
> +       [SPMI_OP_ST_STA] =      0x0008,
> +       [SPMI_MST_SAMPL] =      0x000c,
> +       [SPMI_MST_REQ_EN] =     0x0010,
> +       [SPMI_REC_CTRL] =       0x0040,
> +       [SPMI_REC0] =           0x0044,
> +       [SPMI_REC1] =           0x0048,
> +       [SPMI_REC2] =           0x004c,
> +       [SPMI_REC3] =           0x0050,
> +       [SPMI_REC4] =           0x0054,
> +       [SPMI_MST_DBG] =        0x00fc,
> +};
> +
> +static u32 pmif_readl(struct pmif *arb, enum pmif_regs reg)
> +{
> +       return readl(arb->base + arb->regs[reg]);
> +}
> +
> +static void pmif_writel(struct pmif *arb, u32 val, enum pmif_regs reg)
> +{
> +       writel(val, arb->base + arb->regs[reg]);
> +}
> +
> +static void mtk_spmi_writel(struct pmif *arb, u32 val, enum spmi_regs reg)
> +{
> +       writel(val, arb->spmimst_base + arb->spmimst_regs[reg]);
> +}
> +
> +static bool pmif_is_fsm_vldclr(struct pmif *arb)
> +{
> +       u32 reg_rdata;
> +
> +       reg_rdata = pmif_readl(arb, arb->chan.ch_sta);
> +       return GET_SWINF(reg_rdata) == SWINF_WFVLDCLR;
> +}
> +
> +static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> +{
> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       u32 rdata, cmd;
> +       int ret;
> +

As highlighted by Fei, do you want to validate sid here?

> +       /* Check the opcode */
> +       if (opc == SPMI_CMD_RESET)
> +               cmd = 0;
> +       else if (opc == SPMI_CMD_SLEEP)
> +               cmd = 1;
> +       else if (opc == SPMI_CMD_SHUTDOWN)
> +               cmd = 2;
> +       else if (opc == SPMI_CMD_WAKEUP)
> +               cmd = 3;

Since these SPMI_CMD_* values are all between 0x10 and 0x13, maybe
this is simpler?

if (opc < SPMI_CMD_RESET || opc > SPMI_CMD_WAKEUP)
   return -EINVAL;

cmd = opc - SPMI_CMD_RESET;

> +       else
> +               return -EINVAL;
> +
> +       mtk_spmi_writel(arb, (cmd << 0x4) | sid, SPMI_OP_ST_CTRL);
> +       ret = readl_poll_timeout_atomic(arb->spmimst_base + arb->spmimst_regs[SPMI_OP_ST_STA],
> +                                       rdata, (rdata & SPMI_OP_ST_BUSY) == SPMI_OP_ST_BUSY,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0)
> +               dev_err(&ctrl->dev, "timeout, err = %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                             u16 addr, u8 *buf, size_t len)
> +{
> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg;
> +       int ret;
> +       u32 data, cmd, bc = len - 1;
> +       unsigned long flags;
> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf)) {

nit: No need for parenthesis around 0xf.

> +               dev_err(&ctrl->dev, "exceed the max slv id\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!arb) {
> +               dev_err(&ctrl->dev, "Cannot get pmif control to send cmd\n");
> +               return -EINVAL;
> +       }

I actually don't think you need to validate arb, something is very
wrong if spmi_controller_get_drvdata returns NULL.

> +
> +       inf_reg = &arb->chan;
> +
> +       if (opc >= 0x60 && opc <= 0x7f)
> +               opc = PMIF_CMD_REG;
> +       else if (opc >= 0x20 && opc <= 0x2f)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >= 0x38 && opc <= 0x3f)

Merge these 2 if in one statement?

else if ((opc >= 0x20 && opc <= 0x2f) || (opc >= 0x38 && opc <= 0x3f))

> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               dev_err(&ctrl->dev, "failed to wait for SWINF_IDLE\n");
> +               goto out;
> +       }
> +
> +       /* Send the command. */
> +       cmd = (opc << 30) | (sid << 24) | (bc << 16) | addr;
> +       pmif_writel(arb, cmd, inf_reg->ch_send);
> +
> +       /*
> +        * Wait for Software Interface FSM state to be WFVLDCLR,
> +        * read the data and clear the valid flag.
> +        */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_WFVLDCLR,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
> +               goto out;
> +       }
> +
> +       data = pmif_readl(arb, inf_reg->rdata);
> +       memcpy(buf, &data, (bc & 3) + 1);

What's the "bc & 3" about? Do we also need to validate that len can't be >4?

> +       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +
> +out:
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                              u16 addr, const u8 *buf, size_t len)
> +{
> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg = NULL;

No need to set to NULL.

> +       int ret;
> +       u32 data, cmd, bc = len - 1;
> +       unsigned long flags = 0;

No need to set to 0.

> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf)) {
> +               dev_err(&ctrl->dev, "exceed the max slv id\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!arb) {
> +               dev_err(&ctrl->dev, "Cannot get pmif control to send cmd\n");
> +               return -EINVAL;
> +       }

ditto: no need to validate arb IMHO.

> +
> +       inf_reg = &arb->chan;
> +
> +       /* Check the opcode */
> +       if (opc >= 0x40 && opc <= 0x5F)
> +               opc = PMIF_CMD_REG;
> +       else if (opc <= 0x0F)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >= 0x30 && opc <= 0x37)
> +               opc = PMIF_CMD_EXT_REG_LONG;

Ditto about merging these 2.

> +       else if (opc >= 0x80)
> +               opc = PMIF_CMD_REG_0;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               dev_err(&ctrl->dev, "failed to wait for SWINF_IDLE\n");
> +               goto out;
> +       }
> +
> +       /* Set the write data. */
> +       memcpy(&data, buf, (bc & 3) + 1);
> +       pmif_writel(arb, data, inf_reg->wdata);
> +
> +       /* Send the command. */
> +       cmd = (opc << 30) | BIT(29) | (sid << 24) | (bc << 16) | addr;
> +       pmif_writel(arb, cmd, inf_reg->ch_send);
> +out:
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static struct pmif mt6873_pmif_arb[] = {
> +       {
> +               .regs = mt6873_regs,
> +               .spmimst_regs = mt6873_spmi_regs,
> +               .soc_chan = 2,
> +       },
> +};

Why is this an array with one element?

Also, of compatible matches are _usually_ constant, so I think you
should create a structure (e.g. struct pmif_data) with only the
read-only fields.

> +
> +static int mtk_spmi_probe(struct platform_device *pdev)
> +{
> +       struct pmif *arb;
> +       struct spmi_controller *ctrl;
> +       int err;
> +
> +       ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*arb));
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->cmd = pmif_arb_cmd;
> +       ctrl->read_cmd = pmif_spmi_read_cmd;
> +       ctrl->write_cmd = pmif_spmi_write_cmd;
> +
> +       /* re-assign of_id->data */
> +       spmi_controller_set_drvdata(ctrl, of_device_get_match_data(&pdev->dev));
> +       arb = spmi_controller_get_drvdata(ctrl);
> +       if (!arb) {

This looks wrong. spmi_controller_alloc is already allocating the
private data for you.

So I think you're going to need to change according to my comment
above, and it should look like this:

arb = spmi_controller_get_drvdata(ctrl);
arb->data = of_device_get_match_data(&pdev->dev);

if (!arb->data)

> +               err = -EINVAL;
> +               dev_err(&pdev->dev, "Cannot get pmif control\n");
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->base = devm_platform_ioremap_resource_byname(pdev, "pmif");
> +       if (IS_ERR(arb->base)) {
> +               err = PTR_ERR(arb->base);
> +               dev_err(&pdev->dev, "pmif failed to get the remappped memory\n");
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->spmimst_base = devm_platform_ioremap_resource_byname(pdev, "spmimst");
> +       if (IS_ERR(arb->spmimst_base)) {
> +               err = PTR_ERR(arb->spmimst_base);
> +               dev_err(&pdev->dev, "spmimst failed to get the remappped memory\n");
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->pmif_sys_ck = devm_clk_get(&pdev->dev, "pmif_sys_ck");
> +       if (IS_ERR(arb->pmif_sys_ck)) {
> +               err = PTR_ERR(arb->pmif_sys_ck);
> +               dev_err(&pdev->dev, "failed to get ap clock: %d\n", err);
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->pmif_tmr_ck = devm_clk_get(&pdev->dev, "pmif_tmr_ck");
> +       if (IS_ERR(arb->pmif_tmr_ck)) {
> +               err = PTR_ERR(arb->pmif_tmr_ck);
> +               dev_err(&pdev->dev, "failed to get tmr clock: %d\n", err);
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->spmimst_clk_mux = devm_clk_get(&pdev->dev, "spmimst_clk_mux");
> +       if (IS_ERR(arb->spmimst_clk_mux)) {
> +               err = PTR_ERR(arb->spmimst_clk_mux);
> +               dev_err(&pdev->dev, "failed to get mux: %d\n", err);
> +               goto err_put_ctrl;
> +       }

Since you don't really ever address the clocks individually, can you
consider using devm_clk_bulk_get?

> +
> +       err = clk_prepare_enable(arb->pmif_sys_ck);
> +       if (err) {
> +               dev_err(&pdev->dev, "fail to enable ap clk\n");
> +               goto err_put_ctrl;
> +       }
> +
> +       err = clk_prepare_enable(arb->pmif_tmr_ck);
> +       if (err) {
> +               dev_err(&pdev->dev, "fail to enable tmr clk.\n");
> +               goto err_clk_1;
> +       }
> +
> +       err = clk_prepare_enable(arb->spmimst_clk_mux);
> +       if (err) {
> +               dev_err(&pdev->dev, "fail to enable spmi master clk.\n");
> +               goto err_clk_2;
> +       }

clk_bulk_prepare_enable

> +
> +       arb->chan.ch_sta = PMIF_SWINF_0_STA + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.wdata = PMIF_SWINF_0_WDATA_31_0 + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.rdata = PMIF_SWINF_0_RDATA_31_0 + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.ch_send = PMIF_SWINF_0_ACC + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.ch_rdy = PMIF_SWINF_0_VLD_CLR + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +
> +       raw_spin_lock_init(&arb->lock);
> +
> +       platform_set_drvdata(pdev, ctrl);
> +
> +       err = spmi_controller_add(ctrl);
> +       if (err)
> +               goto err_domain_remove;
> +
> +       return 0;
> +
> +err_domain_remove:
> +       clk_disable_unprepare(arb->spmimst_clk_mux);
> +err_clk_2:
> +       clk_disable_unprepare(arb->pmif_tmr_ck);
> +err_clk_1:
> +       clk_disable_unprepare(arb->pmif_sys_ck);
> +err_put_ctrl:
> +       spmi_controller_put(ctrl);
> +       return err;
> +}
> +
> +static int mtk_spmi_remove(struct platform_device *pdev)
> +{
> +       struct spmi_controller *ctrl = platform_get_drvdata(pdev);
> +

You probably want to disable the 3 clocks here.


> +       spmi_controller_remove(ctrl);
> +       spmi_controller_put(ctrl);
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_spmi_match_table[] = {
> +       {
> +               .compatible = "mediatek,mt6873-spmi",
> +               .data = &mt6873_pmif_arb,
> +       }, {
> +               /* sentinel */
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_spmi_match_table);
> +
> +static struct platform_driver mtk_spmi_driver = {
> +       .driver         = {
> +               .name   = "spmi-mtk",
> +               .of_match_table = of_match_ptr(mtk_spmi_match_table),
> +       },
> +       .probe          = mtk_spmi_probe,
> +       .remove         = mtk_spmi_remove,
> +};
> +module_platform_driver(mtk_spmi_driver);
> +
> +MODULE_AUTHOR("Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek SPMI Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
