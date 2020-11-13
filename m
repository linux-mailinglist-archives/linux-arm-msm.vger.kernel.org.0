Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E692B1775
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 09:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKMIqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 03:46:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgKMIqi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 03:46:38 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7477206CA;
        Fri, 13 Nov 2020 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605257194;
        bh=15NwWoqJUIqmyzKH8vi/pY8GqKxQ2+3ITV7Em2YZOqI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VuOkceplF/jGdyvQiCDkVRO/5Zak1uOKVyy2kA3E5LoQ8cQd7nPKBmAjs1hiam4DT
         FLBIpq+wvYOT5aFWi6LKXUFxD4BK8CDio/AJ1jWps0Q+UtkeHAZaW6BFjD9bOr/Pqk
         ygK+nuFsBVh2aadKR/qHndrN1g1LNsMi6sD5hPBM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602766748-25490-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1602766748-25490-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 2/2] spmi: mediatek: Add support for MT6873/8192
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Nov 2020 00:46:32 -0800
Message-ID: <160525719233.3428466.5058676735160747533@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Hsin-Hsiung Wang (2020-10-15 05:59:08)
> add spmi support for MT6873/8192.

Capitalize Add please.

>=20
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/spmi/Kconfig         |   9 +
>  drivers/spmi/Makefile        |   1 +
>  drivers/spmi/spmi-mtk-pmif.c | 474 +++++++++++++++++++++++++++++++++++
>  3 files changed, 484 insertions(+)
>  create mode 100644 drivers/spmi/spmi-mtk-pmif.c
>=20
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> new file mode 100644
> index 000000000000..ac71e64a2bda
> --- /dev/null
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -0,0 +1,474 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>

Is this include used?

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
> +       raw_spinlock_t  lock;
> +       struct clk      *pmif_sys_ck;
> +       struct clk      *pmif_tmr_ck;

These two are acquired but never used?

> +       struct clk      *spmimst_clk_mux;
> +       struct ch_reg chan;
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
> +static const u32 mt6873_regs[] =3D {
> +       [PMIF_INIT_DONE] =3D      0x0000,
> +       [PMIF_INF_EN] =3D         0x0024,
> +       [PMIF_ARB_EN] =3D         0x0150,
> +       [PMIF_CMDISSUE_EN] =3D    0x03B4,
> +       [PMIF_TIMER_CTRL] =3D     0x03E0,
> +       [PMIF_SPI_MODE_CTRL] =3D  0x0400,
> +       [PMIF_IRQ_EVENT_EN_0] =3D 0x0418,
> +       [PMIF_IRQ_FLAG_0] =3D     0x0420,
> +       [PMIF_IRQ_CLR_0] =3D      0x0424,
> +       [PMIF_IRQ_EVENT_EN_1] =3D 0x0428,
> +       [PMIF_IRQ_FLAG_1] =3D     0x0430,
> +       [PMIF_IRQ_CLR_1] =3D      0x0434,
> +       [PMIF_IRQ_EVENT_EN_2] =3D 0x0438,
> +       [PMIF_IRQ_FLAG_2] =3D     0x0440,
> +       [PMIF_IRQ_CLR_2] =3D      0x0444,
> +       [PMIF_IRQ_EVENT_EN_3] =3D 0x0448,
> +       [PMIF_IRQ_FLAG_3] =3D     0x0450,
> +       [PMIF_IRQ_CLR_3] =3D      0x0454,
> +       [PMIF_IRQ_EVENT_EN_4] =3D 0x0458,
> +       [PMIF_IRQ_FLAG_4] =3D     0x0460,
> +       [PMIF_IRQ_CLR_4] =3D      0x0464,
> +       [PMIF_WDT_EVENT_EN_0] =3D 0x046C,
> +       [PMIF_WDT_FLAG_0] =3D     0x0470,
> +       [PMIF_WDT_EVENT_EN_1] =3D 0x0474,
> +       [PMIF_WDT_FLAG_1] =3D     0x0478,
> +       [PMIF_SWINF_0_ACC] =3D    0x0C00,
> +       [PMIF_SWINF_0_WDATA_31_0] =3D     0x0C04,
> +       [PMIF_SWINF_0_RDATA_31_0] =3D     0x0C14,
> +       [PMIF_SWINF_0_VLD_CLR] =3D        0x0C24,
> +       [PMIF_SWINF_0_STA] =3D    0x0C28,
> +       [PMIF_SWINF_1_ACC] =3D    0x0C40,
> +       [PMIF_SWINF_1_WDATA_31_0] =3D     0x0C44,
> +       [PMIF_SWINF_1_RDATA_31_0] =3D     0x0C54,
> +       [PMIF_SWINF_1_VLD_CLR] =3D        0x0C64,
> +       [PMIF_SWINF_1_STA] =3D    0x0C68,
> +       [PMIF_SWINF_2_ACC] =3D    0x0C80,
> +       [PMIF_SWINF_2_WDATA_31_0] =3D     0x0C84,
> +       [PMIF_SWINF_2_RDATA_31_0] =3D     0x0C94,
> +       [PMIF_SWINF_2_VLD_CLR] =3D        0x0CA4,
> +       [PMIF_SWINF_2_STA] =3D    0x0CA8,
> +       [PMIF_SWINF_3_ACC] =3D    0x0CC0,
> +       [PMIF_SWINF_3_WDATA_31_0] =3D     0x0CC4,
> +       [PMIF_SWINF_3_RDATA_31_0] =3D     0x0CD4,
> +       [PMIF_SWINF_3_VLD_CLR] =3D        0x0CE4,
> +       [PMIF_SWINF_3_STA] =3D    0x0CE8,
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
> +static const u32 mt6873_spmi_regs[] =3D {
> +       [SPMI_OP_ST_CTRL] =3D     0x0000,
> +       [SPMI_GRP_ID_EN] =3D      0x0004,
> +       [SPMI_OP_ST_STA] =3D      0x0008,
> +       [SPMI_MST_SAMPL] =3D      0x000c,
> +       [SPMI_MST_REQ_EN] =3D     0x0010,
> +       [SPMI_REC_CTRL] =3D       0x0040,
> +       [SPMI_REC0] =3D           0x0044,
> +       [SPMI_REC1] =3D           0x0048,
> +       [SPMI_REC2] =3D           0x004c,
> +       [SPMI_REC3] =3D           0x0050,
> +       [SPMI_REC4] =3D           0x0054,
> +       [SPMI_MST_DBG] =3D        0x00fc,
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
> +static void mtk_spmi_writel(struct pmif *arb, u32 val, enum spmi_regs re=
g)
> +{
> +       writel(val, arb->spmimst_base + arb->spmimst_regs[reg]);
> +}
> +
> +static bool pmif_is_fsm_vldclr(struct pmif *arb)
> +{
> +       u32 reg_rdata;
> +
> +       reg_rdata =3D pmif_readl(arb, arb->chan.ch_sta);
> +       return GET_SWINF(reg_rdata) =3D=3D SWINF_WFVLDCLR;
> +}
> +
> +static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> +{
> +       struct pmif *arb =3D spmi_controller_get_drvdata(ctrl);
> +       u32 rdata;
> +       u8 cmd;

Any reason to not just use a u32?

> +       int ret;
> +
> +       /* Check the opcode */
> +       if (opc =3D=3D SPMI_CMD_RESET)
> +               cmd =3D 0;
> +       else if (opc =3D=3D SPMI_CMD_SLEEP)
> +               cmd =3D 1;
> +       else if (opc =3D=3D SPMI_CMD_SHUTDOWN)
> +               cmd =3D 2;
> +       else if (opc =3D=3D SPMI_CMD_WAKEUP)
> +               cmd =3D 3;
> +       else
> +               return -EINVAL;
> +
> +       mtk_spmi_writel(arb, (cmd << 0x4) | sid, SPMI_OP_ST_CTRL);

Then this shift isn't concerning with regards to overflow.

> +       ret =3D readl_poll_timeout_atomic(arb->spmimst_base + arb->spmims=
t_regs[SPMI_OP_ST_STA],
> +                                       rdata, (rdata & SPMI_OP_ST_BUSY) =
=3D=3D SPMI_OP_ST_BUSY,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0)
> +               dev_err(&ctrl->dev, "timeout, err =3D %d\r\n", ret);

Remove the \r.

> +
> +       return ret;
> +}
> +
> +static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 s=
id,
> +                             u16 addr, u8 *buf, size_t len)
> +{
> +       struct pmif *arb =3D spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg =3D NULL;

Please drop assignment.

> +       int ret;
> +       u32 data =3D 0;

Please drop assignment.

> +       u8 bc =3D len - 1;

Can this overflow?

> +       unsigned long flags;
> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf))
> +               return -EINVAL;
> +
> +       if (!arb)

Is this possible?

> +               return -EINVAL;
> +
> +       inf_reg =3D &arb->chan;
> +       /* Check the opcode */

Please remove useless comment.

> +       if (opc >=3D 0x60 && opc <=3D 0x7f)
> +               opc =3D PMIF_CMD_REG;
> +       else if (opc >=3D 0x20 && opc <=3D 0x2f)
> +               opc =3D PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >=3D 0x38 && opc <=3D 0x3f)
> +               opc =3D PMIF_CMD_EXT_REG_LONG;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret =3D readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->=
ch_sta],
> +                                       data, GET_SWINF(data) =3D=3D SWIN=
F_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;

Please goto spin unlock and return ret instead of duplicating it.

> +       }
> +
> +       /* Send the command. */
> +       pmif_writel(arb,
> +                   (opc << 30) | (sid << 24) | (bc << 16) | addr,

Please pack the u32 into a local variable so this fits on one line.

> +                   inf_reg->ch_send);
> +
> +       /* Wait for Software Interface FSM state to be WFVLDCLR,

Please fix kernel comment style, /* is on its own line.

> +        *
> +        * read the data and clear the valid flag.
> +        */
> +       ret =3D readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->=
ch_sta],
> +                                       data, GET_SWINF(data) =3D=3D SWIN=
F_WFVLDCLR,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {

goto out;

> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;
> +       }
> +
> +       data =3D pmif_readl(arb, inf_reg->rdata);
> +       memcpy(buf, &data, (bc & 3) + 1);

Why is it aligned memcpy?

> +       pmif_writel(arb, 1, inf_reg->ch_rdy);

out:
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);
> +
> +       return 0;

return ret;

> +}
> +
> +static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 =
sid,
> +                              u16 addr, const u8 *buf, size_t len)
> +{
> +       struct pmif *arb =3D spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg =3D NULL;
> +       int ret;
> +       u32 data =3D 0;
> +       u8 bc =3D len - 1;
> +       unsigned long flags =3D 0;
> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf))
> +               return -EINVAL;
> +
> +       if (!arb)
> +               return -EINVAL;
> +
> +       inf_reg =3D &arb->chan;
> +
> +       /* Check the opcode */
> +       if (opc >=3D 0x40 && opc <=3D 0x5F)
> +               opc =3D PMIF_CMD_REG;
> +       else if (opc <=3D 0x0F)
> +               opc =3D PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >=3D 0x30 && opc <=3D 0x37)
> +               opc =3D PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >=3D 0x80)
> +               opc =3D PMIF_CMD_REG_0;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret =3D readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->=
ch_sta],
> +                                       data, GET_SWINF(data) =3D=3D SWIN=
F_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;
> +       }
> +
> +       /* Set the write data. */
> +       memcpy(&data, buf, (bc & 3) + 1);
> +       pmif_writel(arb, data, inf_reg->wdata);
> +
> +       /* Send the command. */
> +       pmif_writel(arb,
> +                   (opc << 30) | BIT(29) | (sid << 24) | (bc << 16) | ad=
dr,
> +                   inf_reg->ch_send);
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);

A lot of the same comments apply.

> +
> +       return 0;
> +}
> +
> +static struct pmif mt6873_pmif_arb[] =3D {

Is this a singleton?

> +       {
> +               .regs =3D mt6873_regs,
> +               .spmimst_regs =3D mt6873_spmi_regs,
> +               .soc_chan =3D 2,
> +       },
> +};
> +
> +static int mtk_spmi_probe(struct platform_device *pdev)
> +{
> +       struct pmif *arb;
> +       struct resource *res;
> +       struct spmi_controller *ctrl;
> +       int err =3D 0;

Is this assignment necessary?

> +
> +       ctrl =3D spmi_controller_alloc(&pdev->dev, sizeof(*arb));
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->cmd =3D pmif_arb_cmd;
> +       ctrl->read_cmd =3D pmif_spmi_read_cmd;
> +       ctrl->write_cmd =3D pmif_spmi_write_cmd;
> +
> +       /* re-assign of_id->data */
> +       spmi_controller_set_drvdata(ctrl, (void *)of_device_get_match_dat=
a(&pdev->dev));

Please drop cast to void *.

> +       arb =3D spmi_controller_get_drvdata(ctrl);
> +
> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pmif"=
);
> +       arb->base =3D devm_ioremap_resource(&pdev->dev, res);

Preferably use devm_platform_ioremap_resource(pdev, index).

> +       if (IS_ERR(arb->base)) {
> +               err =3D PTR_ERR(arb->base);
> +               goto err_put_ctrl;
> +       }
> +
> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "spmim=
st");
> +       arb->spmimst_base =3D devm_ioremap_resource(&pdev->dev, res);

Same.

> +       if (IS_ERR(arb->spmimst_base)) {
> +               err =3D PTR_ERR(arb->spmimst_base);
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->pmif_sys_ck =3D devm_clk_get(&pdev->dev, "pmif_sys_ck");
> +       if (IS_ERR(arb->pmif_sys_ck)) {
> +               dev_err(&pdev->dev, "[PMIF]:failed to get ap clock: %ld\n=
",

Move [PMIF] to pr_fmt?

> +                       PTR_ERR(arb->pmif_sys_ck));
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->pmif_tmr_ck =3D devm_clk_get(&pdev->dev, "pmif_tmr_ck");
> +       if (IS_ERR(arb->pmif_tmr_ck)) {
> +               dev_err(&pdev->dev, "[PMIF]:failed to get tmr clock: %ld\=
n",
> +                       PTR_ERR(arb->pmif_tmr_ck));
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->spmimst_clk_mux =3D devm_clk_get(&pdev->dev, "spmimst_clk_mu=
x");
> +       if (IS_ERR(arb->spmimst_clk_mux)) {
> +               dev_err(&pdev->dev, "[SPMIMST]:failed to get clock: %ld\n=
",
> +                       PTR_ERR(arb->spmimst_clk_mux));
> +               goto err_put_ctrl;
> +       }
> +
> +       err =3D clk_prepare_enable(arb->spmimst_clk_mux);
> +       if (err) {
> +               dev_err(&pdev->dev, "[PMIF]:failed to enable spmi master =
clk.\n");
> +               goto err_put_ctrl;
> +       }
> +
> +       arb->chan.ch_sta =3D PMIF_SWINF_0_STA + (PMIF_CHAN_OFFSET * arb->=
soc_chan);
> +       arb->chan.wdata =3D PMIF_SWINF_0_WDATA_31_0 + (PMIF_CHAN_OFFSET *=
 arb->soc_chan);
> +       arb->chan.rdata =3D PMIF_SWINF_0_RDATA_31_0 + (PMIF_CHAN_OFFSET *=
 arb->soc_chan);
> +       arb->chan.ch_send =3D PMIF_SWINF_0_ACC + (PMIF_CHAN_OFFSET * arb-=
>soc_chan);
> +       arb->chan.ch_rdy =3D PMIF_SWINF_0_VLD_CLR + (PMIF_CHAN_OFFSET * a=
rb->soc_chan);
> +
> +       raw_spin_lock_init(&arb->lock);
> +

Why raw?

> +       platform_set_drvdata(pdev, ctrl);
> +
> +       err =3D spmi_controller_add(ctrl);
