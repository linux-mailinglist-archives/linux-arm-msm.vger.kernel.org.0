Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD0E3BC787
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 09:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhGFH5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 03:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhGFH5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 03:57:20 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8272EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 00:54:41 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id y20so4377483uap.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3qVePH9JFi87gONiyEqEdKz88cGEkgKWEUb6Ms2bBU8=;
        b=XRM9E87jhVyUlS0XtwfZ5x2PTgH5hDP6NQ5u66cYG0oPKzkuDFYWgxKpqOjeVUemWX
         yp6ze/h8jcInvAKuFuqrN3gw5nEMqK/0z/nd/DkxJigc71FkzP14YJ90oivp2vncKvSB
         RHQBawnAg5S5EpHEmcmHrKIfBPseJL3z/qsAJnSQAAqiBR+Zgo77DmKobTCIeoEuzvRC
         jQwBkEc5cfDE/mlOz0JcE763rwsudr3CKHcNntk9D5SLRsbpWgiNsZ/9V3x4X8VzTQqx
         88GQMa535qU15/xdVecvblRxVXJ6xWoVc6MKKYsEtmUTBc3tV/M+a8iqoLK9N8c8KgoO
         HS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3qVePH9JFi87gONiyEqEdKz88cGEkgKWEUb6Ms2bBU8=;
        b=YHGrhIkQ91hOXB7GmMtn/rgNBgn/itjvou2KMhp6Bow5z6ZbR6tmxLuucDLffILf1p
         TH7Pfpbs7LooleMju8tijVsaTMOql+HHBlO9I342MOjHbogrKRsAKv8ilpNeZI7y51p8
         8J+lN0fE95ErTRvcPP1WNR9kqyzjQPmH+nPtkMHPTN74iNRfbTFQbt/7nFQG5XbQ9yDD
         LvskdzRAHZ9gZP80siVhOcMwy+i+22DQOLqlY6a27WMOjZdjd3JCX8L7Y9bIJNF2l5b6
         vUB01ITmvlie6ftZP3wJeJ9eUxp1ZY7+QYk0xPp2op3yn61w6Pn3BmXAImOBfnXGhmAn
         OBIQ==
X-Gm-Message-State: AOAM531fFW3J31GkcmRcgB1SBRAdHbkjtuksFz4R1srqn1wsoiztxlQQ
        LHMB/CnQLNpUNDPNU8yjIc+NjbNsNORg8b3lAQSs+w==
X-Google-Smtp-Source: ABdhPJxEZnuXd+n69XMyNsgZarr+p438MNk52aNKyWibfsJUb8OZKm+m9/Gkou1JtUbyJlcMGha3wNxb2AkejdiHRxU=
X-Received: by 2002:ab0:42a6:: with SMTP id j35mr11625376uaj.129.1625558080121;
 Tue, 06 Jul 2021 00:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org> <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 6 Jul 2021 09:54:03 +0200
Message-ID: <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Peter Chen <peter.chen@nxp.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Peter

On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> being controlled through the UART and WiFi being present on PCIe
> bus. Both blocks share common power sources. Add device driver handling
> power sequencing of QCA6390/1.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Power sequencing of discoverable buses have been discussed several
times before at LKML. The last attempt [1] I am aware of, was in 2017
from Peter Chen. I don't think there is a common solution, yet.

Note that, this isn't specific to the PCIe bus, but rather to all
buses that may have discoverable devices attached and which need some
kind of pre-power-sequence before they can be discovered/probed.  USB,
PCIe, SDIO, etc.

Long time ago, we fixed the problem for SDIO (that also can have WiFi,
UART, bluetooth chips attached), but unfortunately through an MMC
subsystem specific implementation, that can't be re-used in a generic
way.

In any case, I have looped in Peter Chen, maybe he can provide us with
a better update on how things have moved forward, if at all.

Kind regards
Uffe

[1]
https://www.spinics.net/lists/linux-usb/msg158451.html

> ---
>  drivers/regulator/Kconfig        |  13 +++
>  drivers/regulator/Makefile       |   1 +
>  drivers/regulator/qcom-qca639x.c | 157 +++++++++++++++++++++++++++++++
>  3 files changed, 171 insertions(+)
>  create mode 100644 drivers/regulator/qcom-qca639x.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 3e7a38525cb3..7a560cddea7a 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -909,6 +909,19 @@ config REGULATOR_PWM
>           This driver supports PWM controlled voltage regulators. PWM
>           duty cycle can increase or decrease the voltage.
>
> +config REGULATOR_QCOM_QCA639X
> +       tristate "Qualcomm QCA639x WiFi/Bluetooth module support"
> +       help
> +         If you say yes to this option, support will be included for Qualcomm
> +         QCA639x family of WiFi and Bluetooth SoCs. Note, this driver supports
> +         only power control for this SoC, you still have to enable individual
> +         Bluetooth and WiFi drivers. This driver is only necessary on ARM
> +         platforms with this chip. PCIe cards handle power sequencing on their
> +         own.
> +
> +         Say M here if you want to include support for QCA639x chips as a
> +         module. This will build a module called "qcom-qca639x".
> +
>  config REGULATOR_QCOM_RPM
>         tristate "Qualcomm RPM regulator driver"
>         depends on MFD_QCOM_RPM
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 580b015296ea..129c2110b78d 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_REGULATOR_MT6380)        += mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) += mt6397-regulator.o
>  obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
> +obj-$(CONFIG_REGULATOR_QCOM_QCA639X) += qcom-qca639x.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> diff --git a/drivers/regulator/qcom-qca639x.c b/drivers/regulator/qcom-qca639x.c
> new file mode 100644
> index 000000000000..a2c78c0f8baa
> --- /dev/null
> +++ b/drivers/regulator/qcom-qca639x.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/slab.h>
> +
> +#define MAX_NUM_REGULATORS     8
> +
> +static struct vreg {
> +       const char *name;
> +       unsigned int load_uA;
> +} vregs[MAX_NUM_REGULATORS] = {
> +       /* 2.0 V */
> +       { "vddpcie2", 15000 },
> +       { "vddrfa3", 400000 },
> +
> +       /* 0.95 V */
> +       { "vddaon", 100000 },
> +       { "vddpmu", 1250000 },
> +       { "vddrfa1", 200000 },
> +
> +       /* 1.35 V */
> +       { "vddrfa2", 400000 },
> +       { "vddpcie1", 35000 },
> +
> +       /* 1.8 V */
> +       { "vddio", 20000 },
> +};
> +
> +struct qca6390_data {
> +       struct device *dev;
> +       struct regulator_bulk_data regulators[MAX_NUM_REGULATORS];
> +       size_t num_vregs;
> +
> +       struct regulator_desc desc;
> +       struct regulator_dev *regulator_dev;
> +       unsigned int enable_counter;
> +};
> +
> +#define domain_to_data(domain) container_of(domain, struct qca6390_data, pd)
> +
> +static int qca6390_enable(struct regulator_dev *rdev)
> +{
> +       struct qca6390_data *data = rdev_get_drvdata(rdev);
> +       int ret;
> +
> +       ret = regulator_bulk_enable(data->num_vregs, data->regulators);
> +       if (ret) {
> +               dev_err(data->dev, "Failed to enable regulators");
> +               return ret;
> +       }
> +
> +       /* Wait for 1ms before toggling enable pins. */
> +       usleep_range(1000, 2000);
> +
> +       data->enable_counter++;
> +
> +       return 0;
> +}
> +
> +static int qca6390_disable(struct regulator_dev *rdev)
> +{
> +       struct qca6390_data *data = rdev_get_drvdata(rdev);
> +
> +       regulator_bulk_disable(data->num_vregs, data->regulators);
> +
> +       data->enable_counter--;
> +
> +       return 0;
> +}
> +
> +static int qca6390_is_enabled(struct regulator_dev *rdev)
> +{
> +       struct qca6390_data *data = rdev_get_drvdata(rdev);
> +
> +       return data->enable_counter > 0;
> +}
> +
> +static const struct regulator_ops qca6390_ops = {
> +       .enable = qca6390_enable,
> +       .disable = qca6390_disable,
> +       .is_enabled = qca6390_is_enabled,
> +};
> +
> +static int qca6390_probe(struct platform_device *pdev)
> +{
> +       struct qca6390_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct regulator_config cfg = { };
> +       int i, ret;
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->dev = dev;
> +       data->num_vregs = ARRAY_SIZE(vregs);
> +
> +       for (i = 0; i < data->num_vregs; i++)
> +               data->regulators[i].supply = vregs[i].name;
> +
> +       ret = devm_regulator_bulk_get(dev, data->num_vregs, data->regulators);
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i = 0; i < data->num_vregs; i++) {
> +               ret = regulator_set_load(data->regulators[i].consumer, vregs[i].load_uA);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       data->desc.name = devm_kstrdup(dev, dev_name(dev), GFP_KERNEL);
> +       if (!data->desc.name)
> +               return -ENOMEM;
> +
> +       data->desc.type = REGULATOR_VOLTAGE;
> +       data->desc.owner = THIS_MODULE;
> +       data->desc.ops = &qca6390_ops;
> +
> +       cfg.dev = dev;
> +       cfg.of_node = dev->of_node;
> +       cfg.driver_data = data;
> +       cfg.init_data = of_get_regulator_init_data(dev, dev->of_node, &data->desc);
> +
> +       data->regulator_dev = devm_regulator_register(dev, &data->desc, &cfg);
> +       if (IS_ERR(data->regulator_dev)) {
> +               ret = PTR_ERR(data->regulator_dev);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, data);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id qca6390_of_match[] = {
> +       { .compatible = "qcom,qca6390" },
> +};
> +
> +static struct platform_driver qca6390_driver = {
> +       .probe = qca6390_probe,
> +       .driver = {
> +               .name = "qca6390",
> +               .of_match_table = qca6390_of_match,
> +       },
> +};
> +
> +module_platform_driver(qca6390_driver);
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("Power control for Qualcomm QCA6390/1 BT/WiFi chip");
> +MODULE_LICENSE("GPL v2");
> --
> 2.30.2
>
