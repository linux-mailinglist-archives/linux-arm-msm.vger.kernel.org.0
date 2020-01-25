Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34326149766
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 20:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgAYTPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 14:15:44 -0500
Received: from nbd.name ([46.4.11.11]:44124 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAYTPo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 14:15:44 -0500
Received: from [2a04:4540:1401:ec00:8171:9660:c570:2de9]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1ivQuE-0004Ug-37; Sat, 25 Jan 2020 20:15:42 +0100
Subject: Re: [PATCH v2 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20200106153711.1282414-1-robert.marko@sartura.hr>
 <CA+HBbNF8c1i2nqM+0aqABCQv0KotAHKrQu5+RJoCy1RCnzac6w@mail.gmail.com>
From:   John Crispin <john@phrozen.org>
Message-ID: <7eddd24e-543e-f07d-d831-4fa463c17b77@phrozen.org>
Date:   Sat, 25 Jan 2020 20:15:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CA+HBbNF8c1i2nqM+0aqABCQv0KotAHKrQu5+RJoCy1RCnzac6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2020 19:47, Robert Marko wrote:
> Any issues that are preventing merging of this patch?
> 
> Cheers
> 
Hi,
the ones I told you about last time. The original patch got NAK'ed due 
to the magic values written to the registers. However I have been 
engaging with the dakota team of QCA and they provided me with the 
relevant info. I'll be doing the tests they suggested next week and will 
then resend the fixed version of the patch. I have also been told that 
satura asked about a defunct secondary USB port. Could you shed some 
light on this issue please so that can also resolve that one ?
	John

> On Mon, Jan 6, 2020 at 4:38 PM Robert Marko <robert.marko@sartura.hr> wrote:
>>
>> From: John Crispin <john@phrozen.org>
>>
>> Add a driver to setup the USB phy on Qualcom Dakota SoCs.
>> The driver sets up HS and SS phys. In case of HS some magic values need to
>> be written to magic offsets. These were taken from the SDK driver.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Tested-by: Robert Marko <robert.marko@sartura.hr>
>> Cc: Luka Perkov <luka.perkov@sartura.hr>
>> ---
>> Changes since v1:
>> - Preserve original author
>>
>>   drivers/phy/qualcomm/Kconfig                |   7 +
>>   drivers/phy/qualcomm/Makefile               |   1 +
>>   drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 180 ++++++++++++++++++++
>>   3 files changed, 188 insertions(+)
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
>> index 000000000000..eddea2901062
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
>> @@ -0,0 +1,180 @@
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
>> +/*
>> + * Magic registers copied from the SDK driver code
>> + */
>> +#define PHY_CTRL0_ADDR 0x000
>> +#define PHY_CTRL1_ADDR 0x004
>> +#define PHY_CTRL2_ADDR 0x008
>> +#define PHY_CTRL3_ADDR 0x00C
>> +#define PHY_CTRL4_ADDR 0x010
>> +#define PHY_MISC_ADDR  0x024
>> +#define PHY_IPG_ADDR   0x030
>> +
>> +#define PHY_CTRL0_VAL  0xA4600015
>> +#define PHY_CTRL1_VAL  0x09500000
>> +#define PHY_CTRL2_VAL  0x00058180
>> +#define PHY_CTRL3_VAL  0x6DB6DCD6
>> +#define PHY_CTRL4_VAL  0x836DB6DB
>> +#define PHY_MISC_VAL   0x3803FB0C
>> +#define PHY_IPG_VAL    0x47323232
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
>> +       writel(PHY_CTRL0_VAL, phy->base + PHY_CTRL0_ADDR);
>> +       writel(PHY_CTRL1_VAL, phy->base + PHY_CTRL1_ADDR);
>> +       writel(PHY_CTRL2_VAL, phy->base + PHY_CTRL2_ADDR);
>> +       writel(PHY_CTRL3_VAL, phy->base + PHY_CTRL3_ADDR);
>> +       writel(PHY_CTRL4_VAL, phy->base + PHY_CTRL4_ADDR);
>> +       writel(PHY_MISC_VAL, phy->base + PHY_MISC_ADDR);
>> +       writel(PHY_IPG_VAL, phy->base + PHY_IPG_ADDR);
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

