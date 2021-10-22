Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCB843771C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhJVMbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 08:31:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48773 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhJVMbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 08:31:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634905739; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DJVq4ruFXtAHUrwE71ZquBTVW6aPhhHEbGaeaWw4eyA=;
 b=RsotSw26ZW+K+c49EdRmPlWlw3OSyQGk7DK+rx/YanoU8KSRwS2/vsWEJzvUf00O9cN9DZEr
 mp/rkR5d9RqhtGEJpYAn+AsqflNOT106ehFrwBR70V6vpqB/GpXJ9dI9y+P14MeiuVgG80pp
 JuK1Ev14lg6MpDXyqdTpGeij2lQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6172ae74fd91319f0f552bac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 12:28:36
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1A8FC43617; Fri, 22 Oct 2021 12:28:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9FCCC4338F;
        Fri, 22 Oct 2021 12:28:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 Oct 2021 17:58:34 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V2 3/4] regulator: Add a regulator driver for the PM8008
 PMIC
In-Reply-To: <CAE-0n50HiFin8+ZmrbCoK=CCq4JM5JKGN=fTDrS9wGdTb8uzAQ@mail.gmail.com>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
 <1633060859-22969-4-git-send-email-skakit@codeaurora.org>
 <CAE-0n50HiFin8+ZmrbCoK=CCq4JM5JKGN=fTDrS9wGdTb8uzAQ@mail.gmail.com>
Message-ID: <168101fa5937d841d7073e94db246df9@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-06 00:05, Stephen Boyd wrote:
> Quoting Satya Priya (2021-09-30 21:00:58)
>> diff --git a/drivers/regulator/qcom-pm8008-regulator.c 
>> b/drivers/regulator/qcom-pm8008-regulator.c
>> new file mode 100644
>> index 0000000..5dacaa4
>> --- /dev/null
>> +++ b/drivers/regulator/qcom-pm8008-regulator.c
>> @@ -0,0 +1,320 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
>> +
>> +#include <linux/delay.h>
> 
> Is this include used?
> 

No will remove.

>> +#include <linux/device.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
> 
> Is this include used?
> 

No

>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_irq.h>
> 
> Is this include used?
> 

No

>> +#include <linux/pm.h>
> 
> Is this include used?
> 

No

>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/string.h>
> 
> Is this include used? Probably should just be kernel.h?
> 

string.h is not used , will change it as kernel.h

>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
>> +#include <linux/regulator/of_regulator.h>
> 
> Is this include used?
> 

Yes it is used. For of_get_regulator_init_data().

>> +
>> +#define STARTUP_DELAY_USEC             20
>> +#define VSET_STEP_MV                   8
>> +#define VSET_STEP_UV                   (VSET_STEP_MV * 1000)
>> +
>> +#define LDO_ENABLE_REG(base)           (base + 0x46)
>> +#define ENABLE_BIT                     BIT(7)
>> +
>> +#define LDO_STATUS1_REG(base)          (base + 0x08)
>> +#define VREG_READY_BIT                 BIT(7)
>> +
>> +#define LDO_VSET_LB_REG(base)          (base + 0x40)
>> +
>> +#define LDO_STEPPER_CTL_REG(base)      (base + 0x3b)
>> +#define STEP_RATE_MASK                 GENMASK(1, 0)
>> +
>> +#define PM8008_MAX_LDO                 7
> 
> Drop define.
> 
ok.

>> +
>> +struct regulator_data {
>> +       char            *name;
> 
> const?
> 

ok

>> +       char            *supply_name;
> 
> const?
> 

ok

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
>> +       u16                     base;
>> +       int                     step_rate;
>> +};
>> +
>> +static const struct regulator_data reg_data[PM8008_MAX_LDO] = {
> 
> Use [] instead of PM8008_MAX_LDO.
> 

Ok.

>> +       /* name  parent      min_uv  max_uv  headroom_uv */
>> +       {"l1", "vdd_l1_l2",  528000, 1504000, 225000},
>> +       {"l2", "vdd_l1_l2",  528000, 1504000, 225000},
>> +       {"l3", "vdd_l3_l4", 1504000, 3400000, 200000},
>> +       {"l4", "vdd_l3_l4", 1504000, 3400000, 200000},
>> +       {"l5", "vdd_l5",    1504000, 3400000, 300000},
>> +       {"l6", "vdd_l6",    1504000, 3400000, 300000},
>> +       {"l7", "vdd_l7",    1504000, 3400000, 300000},
> 
> Nitpick: Put a space after { and before } to match kernel style.
> 

Okay.

>> +};
>> +
>> +static int pm8008_read(struct regmap *regmap,  u16 reg, u8 *val, int 
>> count)
>> +{
>> +       int rc;
>> +
>> +       rc = regmap_bulk_read(regmap, reg, val, count);
>> +       if (rc < 0)
>> +               pr_err("failed to read %#x, rc=%d\n", reg, rc);
>> +
>> +       return rc;
>> +}
>> +
>> +static int pm8008_write(struct regmap *regmap, u16 reg, u8 *val, int 
>> count)
>> +{
>> +       int rc;
>> +
>> +       pr_debug("Writing [%*ph] from address %#x\n", count, val, 
>> reg);
> 
> Don't we already have regmap debugging facilities for this? Why
> duplicate it in this driver?
> 
>> +       rc = regmap_bulk_write(regmap, reg, val, count);
>> +       if (rc < 0)
>> +               pr_err("failed to write %#x rc=%d\n", reg, rc);
>> +
>> +       return rc;
>> +}
> 
> The above two functions should just be inlined.
> 

I am planning to remove these 2 APIs and use regmap_bulk_read/write 
directly.

>> +
>> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +       u8 vset_raw[2];
>> +       int rc;
>> +
>> +       rc = pm8008_read(pm8008_reg->regmap,
>> +                       LDO_VSET_LB_REG(pm8008_reg->base),
>> +                       vset_raw, 2);
> 
> Can this be an __le16 mV?
> 

Below is the diff after changing as per your suggestion, Please correct 
me if wrong.

-       u8 vset_raw[2];
+       __le16 mV;
         int rc;

-       rc = pm8008_read(pm8008_reg->regmap,
-                       LDO_VSET_LB_REG(pm8008_reg->base),
-                       vset_raw, 2);
+       rc = regmap_bulk_read(pm8008_reg->regmap,
+                       LDO_VSET_LB_REG(pm8008_reg->base), &mV, 2);
         if (rc < 0) {
                 dev_err(pm8008_reg->dev, "failed to read regulator 
voltage rc=%d\n", rc);
                 return rc;
         }

-       return (vset_raw[1] << 8 | vset_raw[0]) * 1000;
+       return le16_to_cpu(mV) * 1000;

>> +       if (rc < 0) {
>> +               dev_err(pm8008_reg->dev, "failed to read regulator 
>> voltage rc=%d\n", rc);
>> +               return rc;
>> +       }
>> +
>> +       return (vset_raw[1] << 8 | vset_raw[0]) * 1000;
> 
> And then return le16_to_cpu(mV) * 1000;
> 
> 
>> +}
>> +
>> +static inline int pm8008_write_voltage(struct pm8008_regulator 
>> *pm8008_reg, int min_uv,
>> +                               int max_uv)
>> +{
>> +       int rc = 0, mv;
>> +       u8 vset_raw[2];
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
>> +                       "requested voltage (%d uV) above maximum limit 
>> (%d uV)\n",
>> +                               mv*1000, max_uv);
>> +               return -EINVAL;
>> +       }
>> +
>> +       vset_raw[0] = mv & 0xff;
>> +       vset_raw[1] = (mv & 0xff00) >> 8;
> 
> Make vset_raw a u16?
> 
> 	vset = mv;
> 
> And then use cpu_to_le16() below?
> 

Below is the diff:

-       int rc = 0, mv;
-       u8 vset_raw[2];
+       int rc, mv;
+       u16 vset_raw;
         [...]
-       vset_raw[0] = mv & 0xff;
-       vset_raw[1] = (mv & 0xff00) >> 8;
-       rc = pm8008_write(pm8008_reg->regmap, 
LDO_VSET_LB_REG(pm8008_reg->base),
-                       vset_raw, 2);
+       vset_raw = cpu_to_le16(mv);
+
+       rc = regmap_bulk_write(pm8008_reg->regmap,
+                       LDO_VSET_LB_REG(pm8008_reg->base), &vset_raw,
+                       sizeof(vset_raw));


>> +       rc = pm8008_write(pm8008_reg->regmap, 
>> LDO_VSET_LB_REG(pm8008_reg->base),
>> +                       vset_raw, 2);
> 
> 	regmap_bulk_write(pm8008_reg->regmap, 
> LDO_VSET_LB_REG(pm8008_reg->base),
> 			  cpu_to_le16(vset), sizeof(vset));
> 
> does it work?
> 

It is working fine after modifying as above.

>> +       if (rc < 0) {
>> +               dev_err(pm8008_reg->dev, "failed to write voltage 
>> rc=%d\n", rc);
>> +               return rc;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int pm8008_regulator_set_voltage_time(struct regulator_dev 
>> *rdev,
>> +                               int old_uV, int new_uv)
>> +{
>> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +
>> +       return DIV_ROUND_UP(abs(new_uv - old_uV), 
>> pm8008_reg->step_rate);
>> +}
>> +
>> +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
>> +                               int min_uv, int max_uv, unsigned int 
>> *selector)
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
>> +       .enable         = regulator_enable_regmap,
> 
> Weird tabbing.
> 

Will correct it.

>> +       .disable                = regulator_disable_regmap,
>> +       .is_enabled             = regulator_is_enabled_regmap,
>> +       .set_voltage            = pm8008_regulator_set_voltage,
>> +       .get_voltage            = pm8008_regulator_get_voltage,
>> +       .list_voltage           = regulator_list_voltage_linear,
>> +       .set_voltage_time       = pm8008_regulator_set_voltage_time,
>> +};
>> +
>> +static int pm8008_register_ldo(struct pm8008_regulator *pm8008_reg,
>> +                                               const char *name)
>> +{
>> +       struct regulator_config reg_config = {};
>> +       struct regulator_init_data *init_data;
>> +       struct device *dev = pm8008_reg->dev;
>> +       struct device_node *reg_node = pm8008_reg->of_node;
>> +       int rc, i;
>> +       u32 base = 0;
>> +       u8 reg;
>> +
>> +       /* get regulator data */
>> +       for (i = 0; i < PM8008_MAX_LDO; i++)
> 
> Use ARRAY_SIZE()

Ok.

> 
>> +               if (strstr(name, reg_data[i].name))
>> +                       break;
>> +
>> +       if (i == PM8008_MAX_LDO) {
>> +               dev_err(dev, "Invalid regulator name %s\n", name);
>> +               return -EINVAL;
>> +       }
>> +
>> +       rc = of_property_read_u32(reg_node, "reg", &base);
>> +       if (rc < 0) {
>> +               dev_err(dev, "%s: failed to get regulator base 
>> rc=%d\n", name, rc);
>> +               return rc;
>> +       }
>> +       pm8008_reg->base = base;
>> +
>> +       /* get slew rate */
>> +       rc = pm8008_read(pm8008_reg->regmap,
>> +                       LDO_STEPPER_CTL_REG(pm8008_reg->base), &reg, 
>> 1);
>> +       if (rc < 0) {
>> +               dev_err(dev, "%s: failed to read step rate 
>> configuration rc=%d\n",
>> +                               name, rc);
>> +               return rc;
>> +       }
>> +       pm8008_reg->step_rate = 38400 >> (reg & STEP_RATE_MASK);
> 
> Where does 38400 come from? Is that a frequency?
> 

It is the default voltage step rate. I'll add a macro 
DEFAULT_VOLTAGE_STEP_RATE for this to be clear.

>> +
>> +       init_data = of_get_regulator_init_data(dev, reg_node,
>> +                                               &pm8008_reg->rdesc);
>> +       if (init_data == NULL) {
> 
> 	if (!init_data)
> 
> is more kernel style.

Okay.

> 
>> +               dev_err(dev, "%s: failed to get regulator data\n", 
>> name);
>> +               return -ENODATA;
>> +       }
>> +
>> +       init_data->constraints.input_uV = 
>> init_data->constraints.max_uV;
>> +       reg_config.dev = dev;
>> +       reg_config.init_data = init_data;
>> +       reg_config.driver_data = pm8008_reg;
>> +       reg_config.of_node = reg_node;
>> +
>> +       pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
>> +       pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
>> +       pm8008_reg->rdesc.name = init_data->constraints.name;
>> +       pm8008_reg->rdesc.supply_name = reg_data[i].supply_name;
>> +       pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
>> +       pm8008_reg->rdesc.min_uV = reg_data[i].min_uv;
>> +       pm8008_reg->rdesc.n_voltages
>> +               = ((reg_data[i].max_uv - reg_data[i].min_uv)
>> +                       / pm8008_reg->rdesc.uV_step) + 1;
>> +
>> +       pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
>> +       pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
>> +       pm8008_reg->rdesc.min_dropout_uV = reg_data[i].min_dropout_uv;
>> +       of_property_read_u32(reg_node, "qcom,min-dropout-voltage",
>> +                            &pm8008_reg->rdesc.min_dropout_uV);
> 
> Why do we allow DT to override this? Isn't it a property of the 
> hardware
> that doesn't change? So the driver can hardcode the knowledge about the
> dropout.
> 

The headroom values change with targets. We are adding some default 
headroom values in the driver and later overwriting them with the actual 
values specified in the DT.

>> +
>> +       pm8008_reg->rdev = devm_regulator_register(dev, 
>> &pm8008_reg->rdesc,
> 
> Is this assignment ever used? Seems like it would be better to merely
> 
> 	return PTR_ERR_OR_ZERO(devm_regulator_register(dev, ...));
> 

Okay.

>> +                                               &reg_config);
>> +       if (IS_ERR(pm8008_reg->rdev)) {
>> +               rc = PTR_ERR(pm8008_reg->rdev);
>> +               dev_err(dev, "%s: failed to register regulator 
>> rc=%d\n",
>> +                               pm8008_reg->rdesc.name, rc);
>> +               return rc;
>> +       }
>> +
>> +       dev_dbg(dev, "%s regulator registered\n", name);
>> +
>> +       return 0;
>> +}
>> +
>> +static int pm8008_parse_regulator(struct regmap *regmap, struct 
>> device *dev)
>> +{
>> +       int rc = 0;
> 
> Drop initialization.
> 

Okay.

>> +       const char *name;
>> +       struct device_node *child;
>> +       struct pm8008_regulator *pm8008_reg;
>> +
>> +       /* parse each subnode and register regulator for regulator 
>> child */
>> +       for_each_available_child_of_node(dev->of_node, child) {
>> +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), 
>> GFP_KERNEL);
>> +
>> +               pm8008_reg->regmap = regmap;
>> +               pm8008_reg->of_node = child;
>> +               pm8008_reg->dev = dev;
>> +
>> +               rc = of_property_read_string(child, "regulator-name", 
>> &name);
>> +               if (rc)
>> +                       continue;
>> +
>> +               rc = pm8008_register_ldo(pm8008_reg, name);
> 
> Can we use the of_parse_cb similar to qcom_spmi-regulator.c?
> 

Are you suggesting to remove the pm8008_register_ldo API and add its 
contents in probe itself and then use of_parse_cb callback like in 
qcom_spmi-regulator.c?

Do we have any advantage using that here? Also I am not exactly sure 
what all contents to put in that. Seems like we can put the step rate 
and min-dropout-voltage configurations in there.

>> +               if (rc < 0) {
>> +                       dev_err(dev, "failed to register regulator %s 
>> rc=%d\n",
>> +                                       name, rc);
>> +                       return rc;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int pm8008_regulator_probe(struct platform_device *pdev)
>> +{
>> +       int rc = 0;
> 
> Please don't initialize locals and then overwrite them before testing
> them.
> 
>> +       struct regmap *regmap;
>> +
>> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +       if (!regmap) {
>> +               dev_err(&pdev->dev, "parent regmap is missing\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       rc = pm8008_parse_regulator(regmap, &pdev->dev);
> 
> Just inline this code. It's basically the entire probe function so
> splitting it away to yet another function just makes it harder to read.
> 

Okay.

>> +       if (rc < 0) {
>> +               dev_err(&pdev->dev, "failed to parse device tree 
>> rc=%d\n", rc);
>> +               return rc;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id pm8008_regulator_match_table[] = {
>> +       { .compatible = "qcom,pm8008-regulator", },
>> +       { },
> 
> Nitpick: Drop comma on sentinel so nothing can come after without
> causing a compilation error.
> 

Okay

>> +};
> 
> Add a MODULE_DEVICE_TABLE please. Same comment applies to the mfd
> driver.
> 

Okay

>> +
>> +static struct platform_driver pm8008_regulator_driver = {
>> +       .driver = {
>> +               .name           = "qcom,pm8008-regulator",
>> +               .of_match_table = pm8008_regulator_match_table,
>> +       },
>> +       .probe          = pm8008_regulator_probe,
> 
> I have no idea what's going on with this tabbing.
> 
>> +};
>> +
>> +module_platform_driver(pm8008_regulator_driver);
>> +
