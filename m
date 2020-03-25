Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA1A19260C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 11:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgCYKqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 06:46:01 -0400
Received: from nbd.name ([46.4.11.11]:42416 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgCYKqB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 06:46:01 -0400
Received: from [2a04:4540:1403:6800:d147:da0f:4153:c02b]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1jH3Xp-0003UB-4E; Wed, 25 Mar 2020 11:45:57 +0100
Subject: Re: [PATCH v3 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
 <CA+HBbNHDNHvA1xZDhzuzBDW9ZDATjVHOYQkLpBxdwt7F6rj=4w@mail.gmail.com>
From:   John Crispin <john@phrozen.org>
Message-ID: <d6f46bff-1977-a0e6-2fd9-a4e9359fe666@phrozen.org>
Date:   Wed, 25 Mar 2020 11:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CA+HBbNHDNHvA1xZDhzuzBDW9ZDATjVHOYQkLpBxdwt7F6rj=4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 25.03.20 11:24, Robert Marko wrote:
> On Mon, Jan 27, 2020 at 10:23 PM Robert Marko <robert.marko@sartura.hr> wrote:
>> From: John Crispin <john@phrozen.org>
>>
>> Add a driver to setup the USB phy on Qualcom Dakota SoCs.
>> The driver sets up HS and SS phys.
> John, any blockers?
>
> Thanks

not from my side, no idea why it is not getting merged

     John




>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>> Cc: Luka Perkov <luka.perkov@sartura.hr>
>> ---
>> Changes from v2 to v3:
>> * Remove magic writes as they are not needed
>> * Correct commit message
>>
>>   drivers/phy/qualcomm/Kconfig                |   7 +
>>   drivers/phy/qualcomm/Makefile               |   1 +
>>   drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 152 ++++++++++++++++++++
>>   3 files changed, 160 insertions(+)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
>>
>> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
>> index e46824da29f6..964bd5d784d2 100644
>> --- a/drivers/phy/qualcomm/Kconfig
>> +++ b/drivers/phy/qualcomm/Kconfig
>> @@ -18,6 +18,13 @@ config PHY_QCOM_APQ8064_SATA
>>          depends on OF
>>          select GENERIC_PHY
>>
>> +config PHY_QCOM_IPQ4019_USB
>> +       tristate "Qualcomm IPQ4019 USB PHY module"
>> +       depends on OF && ARCH_QCOM
>> +       select GENERIC_PHY
>> +       help
>> +         Support for the USB PHY on QCOM IPQ4019/Dakota chipsets.
>> +
>>   config PHY_QCOM_IPQ806X_SATA
>>          tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
>>          depends on ARCH_QCOM
>> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
>> index 283251d6a5d9..8afe6c4f5178 100644
>> --- a/drivers/phy/qualcomm/Makefile
>> +++ b/drivers/phy/qualcomm/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_PHY_ATH79_USB)            += phy-ath79-usb.o
>>   obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)    += phy-qcom-apq8064-sata.o
>> +obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)     += phy-qcom-ipq4019-usb.o
>>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    += phy-qcom-ipq806x-sata.o
>>   obj-$(CONFIG_PHY_QCOM_PCIE2)           += phy-qcom-pcie2.o
>>   obj-$(CONFIG_PHY_QCOM_QMP)             += phy-qcom-qmp.o
>> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
>> new file mode 100644
>> index 000000000000..7efebae6b6fd
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
>> @@ -0,0 +1,152 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2018 John Crispin <john@phrozen.org>
>> + *
>> + * Based on code from
>> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
>> + *
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +
>> +struct ipq4019_usb_phy {
>> +       struct device           *dev;
>> +       struct phy              *phy;
>> +       void __iomem            *base;
>> +       struct reset_control    *por_rst;
>> +       struct reset_control    *srif_rst;
>> +};
>> +
>> +static int ipq4019_ss_phy_power_off(struct phy *_phy)
>> +{
>> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>> +
>> +       reset_control_assert(phy->por_rst);
>> +       msleep(10);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ipq4019_ss_phy_power_on(struct phy *_phy)
>> +{
>> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>> +
>> +       ipq4019_ss_phy_power_off(_phy);
>> +
>> +       reset_control_deassert(phy->por_rst);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct phy_ops ipq4019_usb_ss_phy_ops = {
>> +       .power_on       = ipq4019_ss_phy_power_on,
>> +       .power_off      = ipq4019_ss_phy_power_off,
>> +};
>> +
>> +static int ipq4019_hs_phy_power_off(struct phy *_phy)
>> +{
>> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>> +
>> +       reset_control_assert(phy->por_rst);
>> +       msleep(10);
>> +
>> +       reset_control_assert(phy->srif_rst);
>> +       msleep(10);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ipq4019_hs_phy_power_on(struct phy *_phy)
>> +{
>> +       struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
>> +
>> +       ipq4019_hs_phy_power_off(_phy);
>> +
>> +       reset_control_deassert(phy->srif_rst);
>> +       msleep(10);
>> +
>> +       reset_control_deassert(phy->por_rst);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct phy_ops ipq4019_usb_hs_phy_ops = {
>> +       .power_on       = ipq4019_hs_phy_power_on,
>> +       .power_off      = ipq4019_hs_phy_power_off,
>> +};
>> +
>> +static const struct of_device_id ipq4019_usb_phy_of_match[] = {
>> +       { .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hs_phy_ops},
>> +       { .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ss_phy_ops},
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, ipq4019_usb_phy_of_match);
>> +
>> +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct resource *res;
>> +       struct phy_provider *phy_provider;
>> +       struct ipq4019_usb_phy *phy;
>> +       const struct of_device_id *match;
>> +
>> +       match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
>> +       if (!match)
>> +               return -ENODEV;
>> +
>> +       phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>> +       if (!phy)
>> +               return -ENOMEM;
>> +
>> +       phy->dev = &pdev->dev;
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       phy->base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(phy->base)) {
>> +               dev_err(dev, "failed to remap register memory\n");
>> +               return PTR_ERR(phy->base);
>> +       }
>> +
>> +       phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
>> +       if (IS_ERR(phy->por_rst)) {
>> +               if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
>> +                       dev_err(dev, "POR reset is missing\n");
>> +               return PTR_ERR(phy->por_rst);
>> +       }
>> +
>> +       phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
>> +       if (IS_ERR(phy->srif_rst))
>> +               return PTR_ERR(phy->srif_rst);
>> +
>> +       phy->phy = devm_phy_create(dev, NULL, match->data);
>> +       if (IS_ERR(phy->phy)) {
>> +               dev_err(dev, "failed to create PHY\n");
>> +               return PTR_ERR(phy->phy);
>> +       }
>> +       phy_set_drvdata(phy->phy, phy);
>> +
>> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +
>> +       return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static struct platform_driver ipq4019_usb_phy_driver = {
>> +       .probe  = ipq4019_usb_phy_probe,
>> +       .driver = {
>> +               .of_match_table = ipq4019_usb_phy_of_match,
>> +               .name  = "ipq4019-usb-phy",
>> +       }
>> +};
>> +module_platform_driver(ipq4019_usb_phy_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM/IPQ4019 USB phy driver");
>> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 2.24.1
>>
