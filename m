Return-Path: <linux-arm-msm+bounces-7503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB7830D13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 387171C21E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 19:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108CE249E6;
	Wed, 17 Jan 2024 19:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0hHezzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C7249E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705518248; cv=none; b=EL0NiP1ony0qkWzdRiDiRPwbR2zviDwl3IYr81eGcF9LUzfV2q63+Nw1rg1YP13sDOZAd9lCLPy95DxGr/V+JwG3pIxW9yBPgr9HkZq50T+j3eF2JG3ankwuoTli1kX/8jXPuADoJl92PGfnDLN2QE4fgRG7Q/MgspLHpwzXK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705518248; c=relaxed/simple;
	bh=RQvqK65XmEy65P0dfI9CIYOge5Hcia9/yjKvmgOX/jI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=ZoqLcezB61oCF0rI6DLVxUPgsZrpYj34vDQYJuJ9cIaMys6ntnuv8SyRjB7pAXZ5kf9D3Zn0DnEvBjzKylNIALSy+5WFW7J6mMJXHbIJAkbfI7rksuzGXTaZj86Iq5shqzULCm/eE2yG8H5LIFFLYRWj7VqA41UeumzOW3lvHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0hHezzd; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso13441045e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705518244; x=1706123044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CUHue8YDMG9xSAnuptwRdO5WTGsS6ORiybCl/14VAbA=;
        b=X0hHezzdQQtl/NS9a9iFocqY5bz7sdh4D+czebQfWVQwlZDMn3vixp4m/CROGUIWo1
         abbgrpuPEeYZjiqLsBqXohFkaDmk03i1DA/IKxEnekW4FoVQZPNqNboKKSUjb8gqwGRl
         4QdmRPCA36t7ws3LoyuPrJLw9u0Z06gx7Lq7ccPfVbzQ+q0rRKsSzmbKHP4PxF6qg/rh
         SN2BDjSHsCvZmM4sBUdFMnG15tQhcthuO+eJhW0xlCGtsU7bsfhbr2+/xQnuiAjDR+Lo
         VHXwP6n0M2mCR0rXTH/roTOxyxDD9N2xJx1ggSLRMxGI7m9nnL5lRFckt2YnYQSesIee
         3i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705518244; x=1706123044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUHue8YDMG9xSAnuptwRdO5WTGsS6ORiybCl/14VAbA=;
        b=Cbp005VZ1afIcCzrYUkf7R+g2yhsdB/eep/sWH2u6bxCavWKvGpro4b7M7CfUTRQ3h
         jSiMjfgFvScALvMIvCj+4UagSyaa7fS6siGmRB5awJ+YcejA8O3R3l4a48IgT3BJ6oyD
         EsynLu2BNAk/uA1B0OiaztcroMXZC9ncmFZqKpv9L6bTGeon9p9Sn3dFVBU1CN/YOPnV
         GgRKqulHodjuey2u/ahRpUTTaHam/UR1J7VXA93HC8a6fvSum+cjnFhvk4FsR/1+r9Ho
         MzbMyVHcnMbkOKiNFYpip7CRB4lVz8f2+em/pKZoObOa8AWk27aF/9Op0bRpO3VAd3dQ
         Mqkw==
X-Gm-Message-State: AOJu0YwhCCejrdZ6eEZL4puhn9XrqI7mQ6QICEWRWos0tiRz+YCw2wtg
	ScUqfmsdsLHjRykcXDX+bp5XDSZifjGs7W+ZvMXGwinAhAoGunXffzEpbX6js9L+hg==
X-Google-Smtp-Source: AGHT+IFWNJ13bY+/wKLgO1GNB26jbHRVzb5uCWsxzGb3BEiSaEpjRas6eR3Ms+VqG1mDMUweVmjhWQSPnBnJI5K2w38=
X-Received: by 2002:a05:6512:23aa:b0:50e:ca19:c89c with SMTP id
 c42-20020a05651223aa00b0050eca19c89cmr2614828lfv.263.1705518243995; Wed, 17
 Jan 2024 11:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117173458.2312669-1-quic_sibis@quicinc.com> <20240117173458.2312669-3-quic_sibis@quicinc.com>
In-Reply-To: <20240117173458.2312669-3-quic_sibis@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 21:03:52 +0200
Message-ID: <CAA8EJpp86U=yXQJh6V6zFuFgYA-2qMvOgw_BTZ8CJOpNssoUVQ@mail.gmail.com>
Subject: Re: [RFC 2/7] mailbox: Add support for QTI CPUCP mailbox controller
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 19:36, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
> this driver enables communication between AP and CPUCP by acting as
> a doorbell between them.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/mailbox/Kconfig           |   8 +
>  drivers/mailbox/Makefile          |   2 +
>  drivers/mailbox/qcom-cpucp-mbox.c | 265 ++++++++++++++++++++++++++++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 42940108a187..23741a6f054e 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -273,6 +273,14 @@ config SPRD_MBOX
>           to send message between application processors and MCU. Say Y here if
>           you want to build the Spreatrum mailbox controller driver.
>
> +config QCOM_CPUCP_MBOX
> +       tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       help
> +         Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
> +         controller driver enables communication between AP and CPUCP. Say
> +         Y here if you want to build this driver.
> +
>  config QCOM_IPCC
>         tristate "Qualcomm Technologies, Inc. IPCC driver"
>         depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 18793e6caa2f..53b512800bde 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -59,4 +59,6 @@ obj-$(CONFIG_SUN6I_MSGBOX)    += sun6i-msgbox.o
>
>  obj-$(CONFIG_SPRD_MBOX)                += sprd-mailbox.o
>
> +obj-$(CONFIG_QCOM_CPUCP_MBOX)  += qcom-cpucp-mbox.o
> +
>  obj-$(CONFIG_QCOM_IPCC)                += qcom-ipcc.o
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> new file mode 100644
> index 000000000000..22ea6c802286
> --- /dev/null
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +
> +#define APSS_CPUCP_IPC_CHAN_SUPPORTED          3
> +#define APSS_CPUCP_MBOX_CMD_OFF                        0x4
> +
> +/* Tx Registers */
> +#define APSS_CPUCP_TX_MBOX_IDR                 0
> +#define APSS_CPUCP_TX_MBOX_CMD                 0x100
> +
> +/* Rx Registers */
> +#define APSS_CPUCP_RX_MBOX_IDR                 0
> +#define APSS_CPUCP_RX_MBOX_CMD                 0x100
> +#define APSS_CPUCP_RX_MBOX_MAP                 0x4000
> +#define APSS_CPUCP_RX_MBOX_STAT                        0x4400
> +#define APSS_CPUCP_RX_MBOX_CLEAR               0x4800
> +#define APSS_CPUCP_RX_MBOX_EN                  0x4C00
> +#define APSS_CPUCP_RX_MBOX_CMD_MASK            0xFFFFFFFFFFFFFFFF
> +
> +/**
> + * struct qcom_cpucp_mbox - Holder for the mailbox driver
> + * @chans:                     The mailbox channel
> + * @mbox:                      The mailbox controller
> + * @tx_base:                   Base address of the CPUCP tx registers
> + * @rx_base:                   Base address of the CPUCP rx registers
> + * @dev:                       Device associated with this instance
> + * @irq:                       CPUCP to AP irq
> + */
> +struct qcom_cpucp_mbox {
> +       struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
> +       struct mbox_controller mbox;
> +       void __iomem *tx_base;
> +       void __iomem *rx_base;
> +       struct device *dev;
> +       int irq;
> +       int num_chan;
> +};
> +
> +static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> +{
> +       struct qcom_cpucp_mbox *cpucp = data;
> +       u64 status;
> +       u32 val;
> +       int i;
> +
> +       status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> +
> +       for (i = 0; i < cpucp->num_chan; i++) {
> +               val = 0;
> +               if (status & ((u64)1 << i)) {
> +                       val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD + (i * 8) + APSS_CPUCP_MBOX_CMD_OFF);
> +                       if (!IS_ERR(cpucp->chans[i].con_priv))
> +                               mbox_chan_received_data(&cpucp->chans[i], &val);

Why do you need a check? Can mailbox cope with unallocated channel instead?

> +                       writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = (unsigned long)chan->con_priv;
> +       u64 val;
> +
> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       val |= ((u64)1 << chan_id);

BIT()

> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +
> +       return 0;
> +}
> +
> +static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = (unsigned long)chan->con_priv;
> +       u64 val;
> +
> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       val &= ~((u64)1 << chan_id);

BIT()

> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +
> +       chan->con_priv = ERR_PTR(-EINVAL);
> +}
> +
> +static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = (unsigned long)chan->con_priv;
> +       u32 val = (unsigned long)data;

Please don't pass an integer as a pointer value.

> +
> +       writel(val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD + (chan_id * 8) + APSS_CPUCP_MBOX_CMD_OFF);
> +
> +       return 0;
> +}
> +
> +static struct mbox_chan *qcom_cpucp_mbox_xlate(struct mbox_controller *mbox,
> +                                              const struct of_phandle_args *sp)
> +{
> +       unsigned long ind = sp->args[0];
> +
> +       if (sp->args_count != 1)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (ind >= mbox->num_chans)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (!IS_ERR(mbox->chans[ind].con_priv))
> +               return ERR_PTR(-EBUSY);
> +
> +       mbox->chans[ind].con_priv = (void *)ind;

This seems to be static enough. Can you set it in
qcom_cpucp_setup_mbox() instead?

Then you can use of_mbox_index_xlate() here.

> +
> +       return &mbox->chans[ind];
> +}
> +
> +static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
> +       .startup = qcom_cpucp_mbox_startup,
> +       .send_data = qcom_cpucp_mbox_send_data,
> +       .shutdown = qcom_cpucp_mbox_shutdown
> +};
> +
> +static int qcom_cpucp_setup_mbox(struct qcom_cpucp_mbox *cpucp)
> +{
> +       struct device *dev = cpucp->dev;
> +       struct mbox_controller *mbox;
> +       unsigned long i;
> +
> +       /* Initialize channel identifiers */
> +       for (i = 0; i < ARRAY_SIZE(cpucp->chans); i++)
> +               cpucp->chans[i].con_priv = ERR_PTR(-EINVAL);
> +
> +       mbox = &cpucp->mbox;
> +       mbox->dev = dev;
> +       mbox->num_chans = cpucp->num_chan;
> +       mbox->chans = cpucp->chans;
> +       mbox->ops = &qcom_cpucp_mbox_chan_ops;
> +       mbox->of_xlate = qcom_cpucp_mbox_xlate;
> +       mbox->txdone_irq = false;
> +       mbox->txdone_poll = false;
> +
> +       return mbox_controller_register(mbox);
> +}
> +
> +static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
> +{
> +       struct qcom_cpucp_mbox *cpucp;
> +       struct resource *res;
> +       int ret;
> +
> +       cpucp = devm_kzalloc(&pdev->dev, sizeof(*cpucp), GFP_KERNEL);
> +       if (!cpucp)
> +               return -ENOMEM;
> +
> +       cpucp->dev = &pdev->dev;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "Failed to get the cpucp rx base address\n");
> +               return -ENODEV;
> +       }
> +
> +       cpucp->rx_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));

devm_of_iomap() here and below.

> +       if (!cpucp->rx_base) {
> +               dev_err(&pdev->dev, "Failed to ioremap cpucp tx base\n");
> +               return -ENOMEM;
> +       }
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       if (!res) {
> +               dev_err(&pdev->dev, "Failed to get the cpucp tx base address\n");
> +               return -ENODEV;
> +       }
> +
> +       cpucp->tx_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +       if (!cpucp->tx_base) {
> +               dev_err(&pdev->dev, "Failed to ioremap cpucp tx base\n");
> +               return -ENOMEM;
> +       }
> +
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +       cpucp->irq = platform_get_irq(pdev, 0);
> +       if (cpucp->irq < 0) {
> +               dev_err(&pdev->dev, "Failed to get the IRQ\n");
> +               return cpucp->irq;
> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, cpucp->irq, qcom_cpucp_mbox_irq_fn,
> +                              IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> +               return ret;
> +       }
> +
> +       writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +       cpucp->num_chan = APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +       ret = qcom_cpucp_setup_mbox(cpucp);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to create mailbox\n");
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, cpucp);
> +
> +       return 0;
> +}
> +
> +static int qcom_cpucp_mbox_remove(struct platform_device *pdev)
> +{
> +       struct qcom_cpucp_mbox *cpucp = platform_get_drvdata(pdev);
> +
> +       mbox_controller_unregister(&cpucp->mbox);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
> +       { .compatible = "qcom,cpucp-mbox"},

Is there a guarantee that there will be no SoC-specifcs in this driver
in future?

> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> +
> +static struct platform_driver qcom_cpucp_mbox_driver = {
> +       .probe = qcom_cpucp_mbox_probe,
> +       .remove = qcom_cpucp_mbox_remove,
> +       .driver = {
> +               .name = "qcom_cpucp_mbox",
> +               .of_match_table = qcom_cpucp_mbox_of_match,
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +
> +static int __init qcom_cpucp_mbox_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_driver_register(&qcom_cpucp_mbox_driver);
> +       if (ret)
> +               pr_err("%s: qcom_cpucp_mbox register failed %d\n", __func__, ret);
> +
> +       return ret;
> +}
> +module_init(qcom_cpucp_mbox_init);

module_platform_init()

> +
> +static __exit void qcom_cpucp_mbox_exit(void)
> +{
> +       platform_driver_unregister(&qcom_cpucp_mbox_driver);
> +}
> +module_exit(qcom_cpucp_mbox_exit);
> +
> +MODULE_DESCRIPTION("QTI CPUCP MBOX Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

