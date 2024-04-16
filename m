Return-Path: <linux-arm-msm+bounces-17605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA88A713F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 18:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07459281C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBBE131BC9;
	Tue, 16 Apr 2024 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gu6YTQ10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E21131BB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713284489; cv=none; b=su1Jsnacw2VzwkG5K4+IO0gtadt2dw12UR2XLtPsEFfkfqSK8JEiBPYSwFOuAFhA3+tAa3Ap3qZRRGcgapNRxCSW7+c7AJ5bISWamvvSS1KIgIue3yuGo09oGH83fETpd1P0HO9lI0OJSrM+bESnKoraQyFheYlfS+FaIAYS458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713284489; c=relaxed/simple;
	bh=LBaNh8aKL4DV54OtrVYLE36TZWBtU1SUkkDnzVmMTpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7TadedKRn30sx0B1K9PDV1X8HsjAns3kzb7bD5rg1ybfwVem+xzAXU9mCPP4XtuPscLYTfAYO319uZ4rHmCwmKRp5bqWnJ6djvk76veHszgUkXVFKw3tKQNtPdl5j6DpymsPFvgsazRidZ0um9v1fmNKTazsXfuEW+TGXWmlW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gu6YTQ10; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so4381241276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 09:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713284486; x=1713889286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEvZfaEmxwcI8wMe4jWsSrr189JgI0uoTVpextxqfmc=;
        b=gu6YTQ10wC3IKO/wkwOmxqyP5fa6azT3PtdjQo/AhYS4zNICgFW20Vm36Me0KBYZD6
         4wiAEWjnXZYTm1YEcK7srVWKu3hW97FZSxlxid0bFhIg4rVSFVd2O7dadAvZDtNwKa2G
         9N8mJ3Picr4EbHf0QTQPrrSgy4lInN6QtXasD4umtmi6/Jf9XvAL0L+mlfefXSvAt3Ws
         CpGT2qNyYWv9Jh+zcLbU98asqKr+php0ZKzCvS/yXpP3AxbnU2eLWByLXxNCHDa1648I
         DNxE+uaDD0sPv5Cz6wmTq04fQBVCep246QhKGC/XtfzbnPawp/KnCUZAUL5DPu6j2mNp
         MINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713284486; x=1713889286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEvZfaEmxwcI8wMe4jWsSrr189JgI0uoTVpextxqfmc=;
        b=LoFtwP7DTAu/zXKdSLd3Ky1dRAazJOnsrk2mmgjgzX0VMR4/orQML1rMKyQmt224PS
         +2NaA/89SqGdxT3806aqnbhlgjpc3G+il7pkwIi2/tYOzcz1Rjsmi4Sc0G54JfSHQ5aM
         TvFOqaDPL9mktWfnbjdtQLGArLRZmbv9BgtkfVpbnzX45bWJ/IUNrsrItI6ffXeQFg9F
         daVh8VVHPS2bs1lz3cPyeUQTwQuqCIJMhCecMdkjHmpkYvs0Wt0JYzenbCV7qDKE+yEF
         IdEm1NJyBVOTP/nAx76LJR1yY0kGWy9mVWHUd8ndTnnc2K9haeJU0rVuoqxf3BAR7XBE
         7j5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM0pmdUmTcp2YfzDS2e/Ro7ELha7Q37sLv3o7JGqqzVOKNVNho95T9mXzhzPdpnUpTVcxilQw4xWNjFr+gpy08WCzIqeTYXF4NQtzZRg==
X-Gm-Message-State: AOJu0YxRs0snIWk0o6u5qvEbqJyavWDk9rkqRyNUH5s2A62lhwz2p7tg
	HMPINBSz/H/v9a4xJ3hKfPUXwMLMMX619L3beE0ltrYcfXRJEDwljJkt/2nPP4/i3QNf52Xcbtc
	GoV526aWD09UwK8erbCfaDHgwhpAP/CVT8uzqcA==
X-Google-Smtp-Source: AGHT+IHs2A/yxNesuXs8eVGZJt+nh2Nt5NC9lR/fK5Z5dVdIiyD9iu9XKitJNNp++pQSha9xQQFEQ59qAR3QbKEq6JI=
X-Received: by 2002:a25:b0b:0:b0:dc7:4c92:16a3 with SMTP id
 11-20020a250b0b000000b00dc74c9216a3mr12452857ybl.27.1713284486417; Tue, 16
 Apr 2024 09:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328095044.2926125-1-quic_sibis@quicinc.com> <20240328095044.2926125-3-quic_sibis@quicinc.com>
In-Reply-To: <20240328095044.2926125-3-quic_sibis@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 19:21:15 +0300
Message-ID: <CAA8EJpoQyzF1E2xFPHvzz5Nk=w3J2abd3Y13nc+4FK-jRQbnFw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mailbox: Add support for QTI CPUCP mailbox controller
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	quic_gkohli@quicinc.com, quic_nkela@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:52, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
> this driver enables communication between AP and CPUCP by acting as
> a doorbell between them.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>
> rfc:
> * Use chan->lock and chan->cl to detect if the channel is no longer
>   Available. [Dmitry]
> * Use BIT() instead of using manual shifts. [Dmitry]
> * Don't use integer as a pointer value. [Dmitry]
> * Allow it to default to of_mbox_index_xlate. [Dmitry]
> * Use devm_of_iomap. [Dmitry]
> * Use module_platform_driver instead of module init/exit. [Dmitry]
> * Get channel number using mailbox core (like other drivers) and
>   further simplify the driver by dropping setup_mbox func.
>
>  drivers/mailbox/Kconfig           |   8 ++
>  drivers/mailbox/Makefile          |   2 +
>  drivers/mailbox/qcom-cpucp-mbox.c | 205 ++++++++++++++++++++++++++++++
>  3 files changed, 215 insertions(+)
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
> index 000000000000..e27a258fe57a
> --- /dev/null
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -0,0 +1,205 @@
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
> +};
> +
> +static inline int channel_number(struct mbox_chan *chan)
> +{
> +       return chan - chan->mbox->chans;
> +}
> +
> +static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> +{
> +       struct qcom_cpucp_mbox *cpucp = data;
> +       struct mbox_chan *chan;
> +       unsigned long flags;
> +       u64 status;
> +       u32 val;
> +       int i;
> +
> +       status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> +
> +       for (i = 0; i < APSS_CPUCP_IPC_CHAN_SUPPORTED; i++) {
> +               val = 0;
> +               if (status & ((u64)1 << i)) {

BIT() or test_bit()

> +                       val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD + (i * 8) + APSS_CPUCP_MBOX_CMD_OFF);

#define APSS_CPUCP_MBOX_CMD_OFF(i)

> +                       chan = &cpucp->chans[i];
> +                       spin_lock_irqsave(&chan->lock, flags);
> +                       if (chan->cl)
> +                               mbox_chan_received_data(chan, &val);
> +                       spin_unlock_irqrestore(&chan->lock, flags);
> +                       writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);

Why is status written from inside the loop? If the bits are cleared by
writing 1, then you should be writing BIT(i) to that register. Also
make sure that it is written at the correct time, so that if there is
an event before notifying the driver, it doesn't get lost.

> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = channel_number(chan);
> +       u64 val;
> +
> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       val |= BIT(chan_id);
> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +
> +       return 0;
> +}
> +
> +static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = channel_number(chan);
> +       u64 val;
> +
> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       val &= ~BIT(chan_id);
> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +}
> +
> +static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> +       unsigned long chan_id = channel_number(chan);
> +       u32 *val = data;
> +
> +       writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD + (chan_id * 8) + APSS_CPUCP_MBOX_CMD_OFF);
> +
> +       return 0;
> +}
> +
> +static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
> +       .startup = qcom_cpucp_mbox_startup,
> +       .send_data = qcom_cpucp_mbox_send_data,
> +       .shutdown = qcom_cpucp_mbox_shutdown
> +};
> +
> +static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
> +{
> +       struct qcom_cpucp_mbox *cpucp;
> +       struct mbox_controller *mbox;
> +       int ret;
> +
> +       cpucp = devm_kzalloc(&pdev->dev, sizeof(*cpucp), GFP_KERNEL);
> +       if (!cpucp)
> +               return -ENOMEM;
> +
> +       cpucp->dev = &pdev->dev;
> +
> +       cpucp->rx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 0, NULL);
> +       if (IS_ERR(cpucp->rx_base))
> +               return PTR_ERR(cpucp->rx_base);
> +
> +       cpucp->tx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 1, NULL);
> +       if (IS_ERR(cpucp->tx_base))
> +               return PTR_ERR(cpucp->tx_base);
> +
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +       cpucp->irq = platform_get_irq(pdev, 0);
> +       if (cpucp->irq < 0) {
> +               dev_err(&pdev->dev, "Failed to get the IRQ\n");
> +               return cpucp->irq;

It already prints the error message.

> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, cpucp->irq, qcom_cpucp_mbox_irq_fn,
> +                              IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> +               return ret;

return dev_err_probe();

> +       }
> +
> +       writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> +
> +       mbox = &cpucp->mbox;
> +       mbox->dev = cpucp->dev;
> +       mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +       mbox->chans = cpucp->chans;
> +       mbox->ops = &qcom_cpucp_mbox_chan_ops;
> +       mbox->txdone_irq = false;
> +       mbox->txdone_poll = false;
> +
> +       ret = mbox_controller_register(mbox);

Use devm_mbox_controller_register()

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to create mailbox\n");
> +               return ret;

return dev_err_probe();

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

This will be replaced by devm_mbox_controller_register().

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
> +       { .compatible = "qcom,x1e80100-cpucp-mbox"},
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

No need to. Please drop.

> +       },
> +};
> +module_platform_driver(qcom_cpucp_mbox_driver);
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

