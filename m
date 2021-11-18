Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC1C455D19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 14:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhKROA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 09:00:27 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43749 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhKROA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 09:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637243847; x=1668779847;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+NdzldTMSSkGRdemJD7AyB6YIMOdbFEXWjyG7Gn5xIE=;
  b=MFHtnWcyL8inB1tHkjN8ryHwhu6qB4Bh8vQWWoL0gtsdK5gidHT3mLur
   Mcaf6MjtFvxLPLljByPNeXtvw4wAqbJ5FOdPnEu/xWKAMmVmybB44VBEy
   vuiwj5ZTwWyiygwP8wFSCUZWoLsm2zYaOONXiXzY4PkB79sPMdkunSfBE
   k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 05:57:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 05:57:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 05:57:26 -0800
Received: from [10.216.52.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 18 Nov
 2021 05:57:22 -0800
Subject: Re: [PATCH V3 3/4] regulator: Add a regulator driver for the PM8008
 PMIC
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635434072-32055-4-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n51yD6GG9eTn0tivqg0GUme5ONOabQrM0KBDjs5n8WKMYQ@mail.gmail.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <a7b155ab-a8cf-2bec-83a7-a91f79385ee2@quicinc.com>
Date:   Thu, 18 Nov 2021 19:27:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51yD6GG9eTn0tivqg0GUme5ONOabQrM0KBDjs5n8WKMYQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/29/2021 1:49 AM, Stephen Boyd wrote:
> Quoting Satya Priya (2021-10-28 08:14:31)
>> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
>> new file mode 100644
>> index 0000000..74ba682
>> --- /dev/null
>> +++ b/drivers/regulator/qcom-pm8008-regulator.c
>> @@ -0,0 +1,269 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
>> +
>> +#include <linux/device.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
>> +#include <linux/regulator/of_regulator.h>
>> +
>> +#define STARTUP_DELAY_USEC             20
>> +#define VSET_STEP_MV                   8
>> +#define VSET_STEP_UV                   (VSET_STEP_MV * 1000)
>> +
>> +#define LDO_ENABLE_REG(base)           (base + 0x46)
> Add parenthesis around base as well ((base) + 0x46)
Okay
>> +#define ENABLE_BIT                     BIT(7)
>> +
>> +#define LDO_STATUS1_REG(base)          (base + 0x08)
>> +#define VREG_READY_BIT                 BIT(7)
>> +
>> +#define LDO_VSET_LB_REG(base)          (base + 0x40)
>> +
>> +#define LDO_STEPPER_CTL_REG(base)      (base + 0x3b)
>> +#define DEFAULT_VOLTAGE_STEPPER_RATE   38400
>> +#define STEP_RATE_MASK                 GENMASK(1, 0)
>> +
>> +struct regulator_data {
>> +       const char      *name;
>> +       const char      *supply_name;
>> +       int             min_uv;
>> +       int             max_uv;
>> +       int             min_dropout_uv;
>> +};
>> +
>> +struct pm8008_regulator {
>> +       struct device           *dev;
>> +       struct regmap           *regmap;
>> +       struct regulator_desc   rdesc;
>> +       struct regulator_dev    *rdev;
>> +       struct device_node      *of_node;
> This isn't used outside of probe so please drop it. Same goes for any
> other struct member that we don't need to keep around beyond probe. Drop
> them. rdev?
Okay, I'll remove.
>> +       u16                     base;
>> +       int                     step_rate;
>> +};
>> +
>> +static const struct regulator_data reg_data[] = {
>> +       /* name  parent      min_uv  max_uv  headroom_uv */
>> +       { "l1", "vdd_l1_l2",  528000, 1504000, 225000 },
>> +       { "l2", "vdd_l1_l2",  528000, 1504000, 225000 },
>> +       { "l3", "vdd_l3_l4", 1504000, 3400000, 200000 },
>> +       { "l4", "vdd_l3_l4", 1504000, 3400000, 200000 },
>> +       { "l5", "vdd_l5",    1504000, 3400000, 300000 },
>> +       { "l6", "vdd_l6",    1504000, 3400000, 300000 },
>> +       { "l7", "vdd_l7",    1504000, 3400000, 300000 },
>> +       { }
>> +};
>> +
>> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +       __le16 mV;
>> +       int rc;
>> +
>> +       rc = regmap_bulk_read(pm8008_reg->regmap,
>> +                       LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
>> +       if (rc < 0) {
>> +               dev_err(pm8008_reg->dev,
>> +                                       "failed to read regulator voltage rc=%d\n", rc);
> Put it all on one line?
Okay.
>> +               return rc;
>> +       }
>> +
>> +       return le16_to_cpu(mV) * 1000;
>> +}
>> +
>> +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
>> +                                       int min_uv, int max_uv)
>> +{
>> +       int rc, mv;
>> +       u16 vset_raw;
>> +
>> +       mv = DIV_ROUND_UP(min_uv, 1000);
>> +
>> +       /*
>> +        * Each LSB of regulator is 1mV and the voltage setpoint
>> +        * should be multiple of 8mV(step).
>> +        */
>> +       mv = DIV_ROUND_UP(mv, VSET_STEP_MV) * VSET_STEP_MV;
>> +       if (mv * 1000 > max_uv) {
>> +               dev_err(pm8008_reg->dev,
>> +                       "requested voltage (%d uV) above maximum limit (%d uV)\n",
>> +                               mv*1000, max_uv);
>> +               return -EINVAL;
>> +       }
>> +
>> +       vset_raw = cpu_to_le16(mv);
>> +
>> +       rc = regmap_bulk_write(pm8008_reg->regmap,
>> +                       LDO_VSET_LB_REG(pm8008_reg->base),
>> +                       (const void *)&vset_raw, sizeof(vset_raw));
>> +       if (rc < 0) {
>> +               dev_err(pm8008_reg->dev, "failed to write voltage rc=%d\n", rc);
> If this uses the regulator_dev::dev then we'll know which regulator is
> failing, instead of just that some regulator failed inside the PMIC.
OK, but in this API we do not have the rdev, in other APIs wherever 
possible I'll use rdev->dev.
>> +               return rc;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int pm8008_regulator_set_voltage_time(struct regulator_dev *rdev,
>> +                               int old_uV, int new_uv)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +
>> +       return DIV_ROUND_UP(abs(new_uv - old_uV), pm8008_reg->step_rate);
>> +}
>> +
>> +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
>> +                               int min_uv, int max_uv, unsigned int *selector)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +       int rc;
>> +
>> +       rc = pm8008_write_voltage(pm8008_reg, min_uv, max_uv);
>> +       if (rc < 0)
>> +               return rc;
>> +
>> +       *selector = DIV_ROUND_UP(min_uv - pm8008_reg->rdesc.min_uV,
>> +                               VSET_STEP_UV);
>> +
>> +       dev_dbg(pm8008_reg->dev, "voltage set to %d\n", min_uv);
>> +       return 0;
>> +}
>> +
>> +static const struct regulator_ops pm8008_regulator_ops = {
>> +       .enable                 = regulator_enable_regmap,
>> +       .disable                = regulator_disable_regmap,
>> +       .is_enabled             = regulator_is_enabled_regmap,
>> +       .set_voltage            = pm8008_regulator_set_voltage,
> Can we use set_voltage_sel instead?
Yes
>> +       .get_voltage            = pm8008_regulator_get_voltage,
>> +       .list_voltage           = regulator_list_voltage_linear,
>> +       .set_voltage_time       = pm8008_regulator_set_voltage_time,
>> +};
>> +
>> +static int pm8008_regulator_of_parse(struct device_node *node,
>> +                       const struct regulator_desc *desc,
>> +                       struct regulator_config *config)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = config->driver_data;
>> +       struct device *dev = config->dev;
>> +       int rc;
>> +       u8 reg;
>> +
>> +       rc = of_property_read_u32(node, "regulator-min-dropout-voltage-microvolt",
>> +                       &pm8008_reg->rdesc.min_dropout_uV);
>> +       if (rc) {
>> +               dev_err(dev, "failed to read min-dropout voltage rc=%d\n", rc);
>> +               return rc;
>> +       }
>> +
>> +       /* get slew rate */
>> +       rc = regmap_bulk_read(pm8008_reg->regmap,
>> +                       LDO_STEPPER_CTL_REG(pm8008_reg->base), (void *)&reg, 1);
> Just make reg unsigned int to avoid the cast.

Ok

>> +       if (rc < 0) {
>> +               dev_err(dev, "%s: failed to read step rate configuration rc=%d\n",
>> +                               pm8008_reg->rdesc.name, rc);
>> +               return rc;
>> +       }
> 	reg &= STEP_RATE_MASK;
> 	pm8008_reg->step_rate = DEFAULT_VOLTAGE_STEPPER_RATE >> reg;
Ok
>> +       pm8008_reg->step_rate
>> +                       = DEFAULT_VOLTAGE_STEPPER_RATE >> (reg & STEP_RATE_MASK);
>> +
>> +       return 0;
>> +}
>> +
>> +static int pm8008_regulator_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *node = pdev->dev.of_node;
>> +       struct pm8008_regulator *pm8008_reg;
>> +       struct regmap *regmap;
>> +       struct regulator_config reg_config = {};
>> +       const struct regulator_data *reg;
>> +       struct regulator_init_data *init_data;
>> +       int rc;
>> +       u32 base;
>> +
>> +       regmap = dev_get_regmap(dev->parent, NULL);
>> +       if (!regmap) {
>> +               dev_err(dev, "parent regmap is missing\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       for (reg = &reg_data[0]; reg->name; reg++) {
>> +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
>> +
>> +               pm8008_reg->regmap = regmap;
>> +
>> +               pm8008_reg->of_node = of_get_child_by_name(node, reg->name);
> This of_node reference needs to be put somewhere.
>
>> +               if (!pm8008_reg->of_node) {
>> +                       dev_err(dev, "child node %s not found\n", reg->name);
>> +                       return -ENODEV;
>> +               }
>> +
>> +               pm8008_reg->dev = dev;
>> +
>> +               rc = of_property_read_u32(pm8008_reg->of_node, "reg", &base);
>> +               if (rc < 0) {
>> +                       dev_err(dev, "%s: failed to get regulator base rc=%d\n",
>> +                                               reg->name, rc);
>> +                       return rc;
>> +               }
>> +               pm8008_reg->base = base;
>> +
>> +               init_data = of_get_regulator_init_data(dev, pm8008_reg->of_node,
>> +                                                       &pm8008_reg->rdesc);
> Is this necessary?
I guess its not necessary, I'll remove and validate once.
>> +               if (!init_data) {
>> +                       dev_err(dev, "%s: failed to get regulator data\n", reg->name);
>> +                       return -ENODATA;
>> +               }
>> +
>> +               pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
>> +               pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
>> +               pm8008_reg->rdesc.name = init_data->constraints.name;
>> +               pm8008_reg->rdesc.supply_name = reg->supply_name;
>> +               pm8008_reg->rdesc.of_match = reg->name;
>> +               pm8008_reg->rdesc.of_parse_cb = pm8008_regulator_of_parse;
>> +               pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
>> +               pm8008_reg->rdesc.min_uV = reg->min_uv;
>> +               pm8008_reg->rdesc.n_voltages
>> +                       = ((reg->max_uv - reg->min_uv)
>> +                               / pm8008_reg->rdesc.uV_step) + 1;
>> +
>> +               pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
>> +               pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
>> +               pm8008_reg->rdesc.min_dropout_uV = reg->min_dropout_uv;
>> +
>> +               init_data->constraints.input_uV = init_data->constraints.max_uV;
>> +               reg_config.dev = dev;
>> +               reg_config.init_data = init_data;
>> +               reg_config.driver_data = pm8008_reg;
>> +               reg_config.of_node = pm8008_reg->of_node;
> I think we don't need to do this?
Right, I'll remove.
>> +
>> +               return PTR_ERR_OR_ZERO(devm_regulator_register(dev, &pm8008_reg->rdesc,
>> +                                                               &reg_config));
> Why are we returning here? Shouldn't we check return value and only
> return on failure and otherwise continue with registering the rest of
> the regulators?

My bad,  I'll correct this.

>> +       }
>> +
>> +       return 0;
>> +}
>> +
