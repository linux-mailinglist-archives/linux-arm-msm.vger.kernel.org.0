Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CDA423016
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 20:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhJEShY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 14:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJEShX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 14:37:23 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9FAC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 11:35:32 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id s24so497507oij.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ORTclUchsvS7k6/jAdlyfi7grvQ4yAocOHDoxDuoPHQ=;
        b=kJNiV+3Tm2p1qsshIHPk5Hyg4vm0I9SCZUipt1EXh+sEEDul11VuwlgekzqSXZevT+
         /m59ZB1S8Bo7gcsgDpj+bZpunJwveRMaoDrPgOdxMZubf/r/Yc30Y0qhu0Obt3UX2pHa
         XEirXS1Eub7IvMzpmtbBbQZJoCLaes+vkwKMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ORTclUchsvS7k6/jAdlyfi7grvQ4yAocOHDoxDuoPHQ=;
        b=PcjTGiyZWhlWVHE6h3CT4A5tmMFMUlj0YDcfW0S6CR+r1JLit+zjbPgCv85jNAwEiQ
         4FLpJtRmy2En/yrm0eGT985b4CDuIBpRkete2+AOXDeZa1xVOFPfKaZzxRG0gWlylcBs
         qytNpxZIfVmWODTN6SVI97stvREEEmt+3AKoqr7cUV85WzMmKbkO0a9nwvEgMrf4Z7yM
         SA17leZyjTkgA/RFGv7Wq0u/hIumZMmwoxP+xPJJCzFeXZY/z6UV4IUTG2JpnSEZHqt+
         hlL2QUW/XMqXJb7/EGGzW5Crsy3pE5/wxUEGyMfv2ahg4aKt+6qawTrrB7QnLtmmoTQq
         Bz6w==
X-Gm-Message-State: AOAM533qsJJHQozIzp8Laq5UyftYLO6ex1w9VUtsipZw4fPgs0qmT8w7
        fjPCy5v7WjSyUkyCOhxiIfgY7z8/MAo4wg+obecUAg==
X-Google-Smtp-Source: ABdhPJynlHW7Lbi4CzIY58fgSMUW6Hv67WLrspb3F68l1hD2SsTTUzpdpRQNnarX3siIBlEbGbEooigtKop4oem/dUc=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr3798607oia.32.1633458931950;
 Tue, 05 Oct 2021 11:35:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:35:31 -0700
MIME-Version: 1.0
In-Reply-To: <1633060859-22969-4-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org> <1633060859-22969-4-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 11:35:31 -0700
Message-ID: <CAE-0n50HiFin8+ZmrbCoK=CCq4JM5JKGN=fTDrS9wGdTb8uzAQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] regulator: Add a regulator driver for the PM8008 PMIC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org,
        kgunda@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-09-30 21:00:58)
> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
> new file mode 100644
> index 0000000..5dacaa4
> --- /dev/null
> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
> +
> +#include <linux/delay.h>

Is this include used?

> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>

Is this include used?

> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>

Is this include used?

> +#include <linux/pm.h>

Is this include used?

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>

Is this include used? Probably should just be kernel.h?

> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>

Is this include used?

> +
> +#define STARTUP_DELAY_USEC             20
> +#define VSET_STEP_MV                   8
> +#define VSET_STEP_UV                   (VSET_STEP_MV * 1000)
> +
> +#define LDO_ENABLE_REG(base)           (base + 0x46)
> +#define ENABLE_BIT                     BIT(7)
> +
> +#define LDO_STATUS1_REG(base)          (base + 0x08)
> +#define VREG_READY_BIT                 BIT(7)
> +
> +#define LDO_VSET_LB_REG(base)          (base + 0x40)
> +
> +#define LDO_STEPPER_CTL_REG(base)      (base + 0x3b)
> +#define STEP_RATE_MASK                 GENMASK(1, 0)
> +
> +#define PM8008_MAX_LDO                 7

Drop define.

> +
> +struct regulator_data {
> +       char            *name;

const?

> +       char            *supply_name;

const?

> +       int             min_uv;
> +       int             max_uv;
> +       int             min_dropout_uv;
> +};
> +
> +struct pm8008_regulator {
> +       struct device           *dev;
> +       struct regmap           *regmap;
> +       struct regulator_desc   rdesc;
> +       struct regulator_dev    *rdev;
> +       struct device_node      *of_node;
> +       u16                     base;
> +       int                     step_rate;
> +};
> +
> +static const struct regulator_data reg_data[PM8008_MAX_LDO] = {

Use [] instead of PM8008_MAX_LDO.

> +       /* name  parent      min_uv  max_uv  headroom_uv */
> +       {"l1", "vdd_l1_l2",  528000, 1504000, 225000},
> +       {"l2", "vdd_l1_l2",  528000, 1504000, 225000},
> +       {"l3", "vdd_l3_l4", 1504000, 3400000, 200000},
> +       {"l4", "vdd_l3_l4", 1504000, 3400000, 200000},
> +       {"l5", "vdd_l5",    1504000, 3400000, 300000},
> +       {"l6", "vdd_l6",    1504000, 3400000, 300000},
> +       {"l7", "vdd_l7",    1504000, 3400000, 300000},

Nitpick: Put a space after { and before } to match kernel style.

> +};
> +
> +static int pm8008_read(struct regmap *regmap,  u16 reg, u8 *val, int count)
> +{
> +       int rc;
> +
> +       rc = regmap_bulk_read(regmap, reg, val, count);
> +       if (rc < 0)
> +               pr_err("failed to read %#x, rc=%d\n", reg, rc);
> +
> +       return rc;
> +}
> +
> +static int pm8008_write(struct regmap *regmap, u16 reg, u8 *val, int count)
> +{
> +       int rc;
> +
> +       pr_debug("Writing [%*ph] from address %#x\n", count, val, reg);

Don't we already have regmap debugging facilities for this? Why
duplicate it in this driver?

> +       rc = regmap_bulk_write(regmap, reg, val, count);
> +       if (rc < 0)
> +               pr_err("failed to write %#x rc=%d\n", reg, rc);
> +
> +       return rc;
> +}

The above two functions should just be inlined.

> +
> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +       u8 vset_raw[2];
> +       int rc;
> +
> +       rc = pm8008_read(pm8008_reg->regmap,
> +                       LDO_VSET_LB_REG(pm8008_reg->base),
> +                       vset_raw, 2);

Can this be an __le16 mV?

> +       if (rc < 0) {
> +               dev_err(pm8008_reg->dev, "failed to read regulator voltage rc=%d\n", rc);
> +               return rc;
> +       }
> +
> +       return (vset_raw[1] << 8 | vset_raw[0]) * 1000;

And then return le16_to_cpu(mV) * 1000;


> +}
> +
> +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg, int min_uv,
> +                               int max_uv)
> +{
> +       int rc = 0, mv;
> +       u8 vset_raw[2];
> +
> +       mv = DIV_ROUND_UP(min_uv, 1000);
> +
> +       /*
> +        * Each LSB of regulator is 1mV and the voltage setpoint
> +        * should be multiple of 8mV(step).
> +        */
> +       mv = DIV_ROUND_UP(mv, VSET_STEP_MV) * VSET_STEP_MV;
> +       if (mv * 1000 > max_uv) {
> +               dev_err(pm8008_reg->dev,
> +                       "requested voltage (%d uV) above maximum limit (%d uV)\n",
> +                               mv*1000, max_uv);
> +               return -EINVAL;
> +       }
> +
> +       vset_raw[0] = mv & 0xff;
> +       vset_raw[1] = (mv & 0xff00) >> 8;

Make vset_raw a u16?

	vset = mv;

And then use cpu_to_le16() below?

> +       rc = pm8008_write(pm8008_reg->regmap, LDO_VSET_LB_REG(pm8008_reg->base),
> +                       vset_raw, 2);

	regmap_bulk_write(pm8008_reg->regmap, LDO_VSET_LB_REG(pm8008_reg->base),
			  cpu_to_le16(vset), sizeof(vset));

does it work?

> +       if (rc < 0) {
> +               dev_err(pm8008_reg->dev, "failed to write voltage rc=%d\n", rc);
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pm8008_regulator_set_voltage_time(struct regulator_dev *rdev,
> +                               int old_uV, int new_uv)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +
> +       return DIV_ROUND_UP(abs(new_uv - old_uV), pm8008_reg->step_rate);
> +}
> +
> +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
> +                               int min_uv, int max_uv, unsigned int *selector)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +       int rc;
> +
> +       rc = pm8008_write_voltage(pm8008_reg, min_uv, max_uv);
> +       if (rc < 0)
> +               return rc;
> +
> +       *selector = DIV_ROUND_UP(min_uv - pm8008_reg->rdesc.min_uV,
> +                               VSET_STEP_UV);
> +
> +       dev_dbg(pm8008_reg->dev, "voltage set to %d\n", min_uv);
> +       return 0;
> +}
> +
> +static const struct regulator_ops pm8008_regulator_ops = {
> +       .enable         = regulator_enable_regmap,

Weird tabbing.

> +       .disable                = regulator_disable_regmap,
> +       .is_enabled             = regulator_is_enabled_regmap,
> +       .set_voltage            = pm8008_regulator_set_voltage,
> +       .get_voltage            = pm8008_regulator_get_voltage,
> +       .list_voltage           = regulator_list_voltage_linear,
> +       .set_voltage_time       = pm8008_regulator_set_voltage_time,
> +};
> +
> +static int pm8008_register_ldo(struct pm8008_regulator *pm8008_reg,
> +                                               const char *name)
> +{
> +       struct regulator_config reg_config = {};
> +       struct regulator_init_data *init_data;
> +       struct device *dev = pm8008_reg->dev;
> +       struct device_node *reg_node = pm8008_reg->of_node;
> +       int rc, i;
> +       u32 base = 0;
> +       u8 reg;
> +
> +       /* get regulator data */
> +       for (i = 0; i < PM8008_MAX_LDO; i++)

Use ARRAY_SIZE()

> +               if (strstr(name, reg_data[i].name))
> +                       break;
> +
> +       if (i == PM8008_MAX_LDO) {
> +               dev_err(dev, "Invalid regulator name %s\n", name);
> +               return -EINVAL;
> +       }
> +
> +       rc = of_property_read_u32(reg_node, "reg", &base);
> +       if (rc < 0) {
> +               dev_err(dev, "%s: failed to get regulator base rc=%d\n", name, rc);
> +               return rc;
> +       }
> +       pm8008_reg->base = base;
> +
> +       /* get slew rate */
> +       rc = pm8008_read(pm8008_reg->regmap,
> +                       LDO_STEPPER_CTL_REG(pm8008_reg->base), &reg, 1);
> +       if (rc < 0) {
> +               dev_err(dev, "%s: failed to read step rate configuration rc=%d\n",
> +                               name, rc);
> +               return rc;
> +       }
> +       pm8008_reg->step_rate = 38400 >> (reg & STEP_RATE_MASK);

Where does 38400 come from? Is that a frequency?

> +
> +       init_data = of_get_regulator_init_data(dev, reg_node,
> +                                               &pm8008_reg->rdesc);
> +       if (init_data == NULL) {

	if (!init_data)

is more kernel style.

> +               dev_err(dev, "%s: failed to get regulator data\n", name);
> +               return -ENODATA;
> +       }
> +
> +       init_data->constraints.input_uV = init_data->constraints.max_uV;
> +       reg_config.dev = dev;
> +       reg_config.init_data = init_data;
> +       reg_config.driver_data = pm8008_reg;
> +       reg_config.of_node = reg_node;
> +
> +       pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
> +       pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
> +       pm8008_reg->rdesc.name = init_data->constraints.name;
> +       pm8008_reg->rdesc.supply_name = reg_data[i].supply_name;
> +       pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
> +       pm8008_reg->rdesc.min_uV = reg_data[i].min_uv;
> +       pm8008_reg->rdesc.n_voltages
> +               = ((reg_data[i].max_uv - reg_data[i].min_uv)
> +                       / pm8008_reg->rdesc.uV_step) + 1;
> +
> +       pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
> +       pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
> +       pm8008_reg->rdesc.min_dropout_uV = reg_data[i].min_dropout_uv;
> +       of_property_read_u32(reg_node, "qcom,min-dropout-voltage",
> +                            &pm8008_reg->rdesc.min_dropout_uV);

Why do we allow DT to override this? Isn't it a property of the hardware
that doesn't change? So the driver can hardcode the knowledge about the
dropout.

> +
> +       pm8008_reg->rdev = devm_regulator_register(dev, &pm8008_reg->rdesc,

Is this assignment ever used? Seems like it would be better to merely

	return PTR_ERR_OR_ZERO(devm_regulator_register(dev, ...));

> +                                               &reg_config);
> +       if (IS_ERR(pm8008_reg->rdev)) {
> +               rc = PTR_ERR(pm8008_reg->rdev);
> +               dev_err(dev, "%s: failed to register regulator rc=%d\n",
> +                               pm8008_reg->rdesc.name, rc);
> +               return rc;
> +       }
> +
> +       dev_dbg(dev, "%s regulator registered\n", name);
> +
> +       return 0;
> +}
> +
> +static int pm8008_parse_regulator(struct regmap *regmap, struct device *dev)
> +{
> +       int rc = 0;

Drop initialization.

> +       const char *name;
> +       struct device_node *child;
> +       struct pm8008_regulator *pm8008_reg;
> +
> +       /* parse each subnode and register regulator for regulator child */
> +       for_each_available_child_of_node(dev->of_node, child) {
> +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> +
> +               pm8008_reg->regmap = regmap;
> +               pm8008_reg->of_node = child;
> +               pm8008_reg->dev = dev;
> +
> +               rc = of_property_read_string(child, "regulator-name", &name);
> +               if (rc)
> +                       continue;
> +
> +               rc = pm8008_register_ldo(pm8008_reg, name);

Can we use the of_parse_cb similar to qcom_spmi-regulator.c?

> +               if (rc < 0) {
> +                       dev_err(dev, "failed to register regulator %s rc=%d\n",
> +                                       name, rc);
> +                       return rc;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int pm8008_regulator_probe(struct platform_device *pdev)
> +{
> +       int rc = 0;

Please don't initialize locals and then overwrite them before testing
them.

> +       struct regmap *regmap;
> +
> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap) {
> +               dev_err(&pdev->dev, "parent regmap is missing\n");
> +               return -EINVAL;
> +       }
> +
> +       rc = pm8008_parse_regulator(regmap, &pdev->dev);

Just inline this code. It's basically the entire probe function so
splitting it away to yet another function just makes it harder to read.

> +       if (rc < 0) {
> +               dev_err(&pdev->dev, "failed to parse device tree rc=%d\n", rc);
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id pm8008_regulator_match_table[] = {
> +       { .compatible = "qcom,pm8008-regulator", },
> +       { },

Nitpick: Drop comma on sentinel so nothing can come after without
causing a compilation error.

> +};

Add a MODULE_DEVICE_TABLE please. Same comment applies to the mfd
driver.

> +
> +static struct platform_driver pm8008_regulator_driver = {
> +       .driver = {
> +               .name           = "qcom,pm8008-regulator",
> +               .of_match_table = pm8008_regulator_match_table,
> +       },
> +       .probe          = pm8008_regulator_probe,

I have no idea what's going on with this tabbing.

> +};
> +
> +module_platform_driver(pm8008_regulator_driver);
> +
