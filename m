Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA3143CAD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 15:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhJ0Nmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 09:42:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44392 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242156AbhJ0Nmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 09:42:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635342019; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=emfK6MCmU8mBdNVw+dRXfYWzqv456o8C2DzZkJfc+GQ=;
 b=JRn4KBik2kOFzzzcmWkCgStHNJtEyH/hSa4JlFFA4yLhgiKBzlh62YLT5AsecqC40NEM3Cc/
 WIB9T5YQa5J138OP1E+L9qOlMIhO1stoo5E51wq6m7PU8N1axlSGpHsodplMvj3pnkyCk3BQ
 5++lRaSOdpy32qIfsShWwaYSVQs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 617956b1648aeeca5c37a37b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 13:40:01
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31ECDC43618; Wed, 27 Oct 2021 13:40:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DA55C4360C;
        Wed, 27 Oct 2021 13:40:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Oct 2021 19:10:00 +0530
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
In-Reply-To: <CAE-0n53zhYcUJZQPkdGqeK4cb-vPqc-zHQboKQxMuO+fV4jVPQ@mail.gmail.com>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
 <1633060859-22969-4-git-send-email-skakit@codeaurora.org>
 <CAE-0n50HiFin8+ZmrbCoK=CCq4JM5JKGN=fTDrS9wGdTb8uzAQ@mail.gmail.com>
 <168101fa5937d841d7073e94db246df9@codeaurora.org>
 <CAE-0n53zhYcUJZQPkdGqeK4cb-vPqc-zHQboKQxMuO+fV4jVPQ@mail.gmail.com>
Message-ID: <0fc33d57fe929cef3681cafd78e40a6a@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-26 01:16, Stephen Boyd wrote:
> Quoting skakit@codeaurora.org (2021-10-22 05:28:34)
>> On 2021-10-06 00:05, Stephen Boyd wrote:
>> > Quoting Satya Priya (2021-09-30 21:00:58)
>> >> diff --git a/drivers/regulator/qcom-pm8008-regulator.c
>> >> b/drivers/regulator/qcom-pm8008-regulator.c
>> >> new file mode 100644
>> >> index 0000000..5dacaa4
>> >> --- /dev/null
>> >> +++ b/drivers/regulator/qcom-pm8008-regulator.c
>> >> @@ -0,0 +1,320 @@
>> >> +// SPDX-License-Identifier: GPL-2.0-only
>> >> +/* Copyright (c) 2021, The Linux Foundation. All rights reserved. */
>> >> +
>> >> +#include <linux/delay.h>
> [...]
>> >> +
>> >> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
>> >> +{
>> >> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> >> +       u8 vset_raw[2];
>> >> +       int rc;
>> >> +
>> >> +       rc = pm8008_read(pm8008_reg->regmap,
>> >> +                       LDO_VSET_LB_REG(pm8008_reg->base),
>> >> +                       vset_raw, 2);
>> >
>> > Can this be an __le16 mV?
>> >
>> 
>> Below is the diff after changing as per your suggestion, Please 
>> correct
>> me if wrong.
>> 
>> -       u8 vset_raw[2];
>> +       __le16 mV;
>>          int rc;
>> 
>> -       rc = pm8008_read(pm8008_reg->regmap,
>> -                       LDO_VSET_LB_REG(pm8008_reg->base),
>> -                       vset_raw, 2);
>> +       rc = regmap_bulk_read(pm8008_reg->regmap,
>> +                       LDO_VSET_LB_REG(pm8008_reg->base), &mV, 2);
>>          if (rc < 0) {
>>                  dev_err(pm8008_reg->dev, "failed to read regulator
>> voltage rc=%d\n", rc);
>>                  return rc;
>>          }
>> 
>> -       return (vset_raw[1] << 8 | vset_raw[0]) * 1000;
>> +       return le16_to_cpu(mV) * 1000;
> 
> Looks good. Does mV need to be casted when passed to 
> regmap_bulk_read()?
> 
>> 
>> Below is the diff:
>> 
>> -       int rc = 0, mv;
>> -       u8 vset_raw[2];
>> +       int rc, mv;
>> +       u16 vset_raw;
>>          [...]
>> -       vset_raw[0] = mv & 0xff;
>> -       vset_raw[1] = (mv & 0xff00) >> 8;
>> -       rc = pm8008_write(pm8008_reg->regmap,
>> LDO_VSET_LB_REG(pm8008_reg->base),
>> -                       vset_raw, 2);
>> +       vset_raw = cpu_to_le16(mv);
>> +
>> +       rc = regmap_bulk_write(pm8008_reg->regmap,
>> +                       LDO_VSET_LB_REG(pm8008_reg->base), &vset_raw,
>> +                       sizeof(vset_raw));
>> 
> 
> Ok, thanks
> 
>> >> +               dev_err(dev, "%s: failed to get regulator data\n",
>> >> name);
>> >> +               return -ENODATA;
>> >> +       }
>> >> +
>> >> +       init_data->constraints.input_uV =
>> >> init_data->constraints.max_uV;
>> >> +       reg_config.dev = dev;
>> >> +       reg_config.init_data = init_data;
>> >> +       reg_config.driver_data = pm8008_reg;
>> >> +       reg_config.of_node = reg_node;
>> >> +
>> >> +       pm8008_reg->rdesc.type = REGULATOR_VOLTAGE;
>> >> +       pm8008_reg->rdesc.ops = &pm8008_regulator_ops;
>> >> +       pm8008_reg->rdesc.name = init_data->constraints.name;
>> >> +       pm8008_reg->rdesc.supply_name = reg_data[i].supply_name;
>> >> +       pm8008_reg->rdesc.uV_step = VSET_STEP_UV;
>> >> +       pm8008_reg->rdesc.min_uV = reg_data[i].min_uv;
>> >> +       pm8008_reg->rdesc.n_voltages
>> >> +               = ((reg_data[i].max_uv - reg_data[i].min_uv)
>> >> +                       / pm8008_reg->rdesc.uV_step) + 1;
>> >> +
>> >> +       pm8008_reg->rdesc.enable_reg = LDO_ENABLE_REG(base);
>> >> +       pm8008_reg->rdesc.enable_mask = ENABLE_BIT;
>> >> +       pm8008_reg->rdesc.min_dropout_uV = reg_data[i].min_dropout_uv;
>> >> +       of_property_read_u32(reg_node, "qcom,min-dropout-voltage",
>> >> +                            &pm8008_reg->rdesc.min_dropout_uV);
>> >
>> > Why do we allow DT to override this? Isn't it a property of the
>> > hardware
>> > that doesn't change? So the driver can hardcode the knowledge about the
>> > dropout.
>> >
>> 
>> The headroom values change with targets. We are adding some default
>> headroom values in the driver and later overwriting them with the 
>> actual
>> values specified in the DT.
> 
> What do you mean by "targets"? Is that the SoC the PMIC is paired with?

Yes I meant the SoC/board on which the pmic is present.

> I'd prefer it be a standard regulator property instead of qcom specific
> if it actually needs to be different based on different devices.
> 

Ok, I'll drop the qcom prefix.

>> 
>> >> +
>> >> +       pm8008_reg->rdev = devm_regulator_register(dev,
>> >> &pm8008_reg->rdesc,
>> >
>> > Is this assignment ever used? Seems like it would be better to merely
>> >
>> >       return PTR_ERR_OR_ZERO(devm_regulator_register(dev, ...));
>> >
>> 
>> Okay.
>> 
>> >> +                                               &reg_config);
>> >> +       if (IS_ERR(pm8008_reg->rdev)) {
>> >> +               rc = PTR_ERR(pm8008_reg->rdev);
>> >> +               dev_err(dev, "%s: failed to register regulator
>> >> rc=%d\n",
>> >> +                               pm8008_reg->rdesc.name, rc);
>> >> +               return rc;
>> >> +       }
>> >> +
>> >> +       dev_dbg(dev, "%s regulator registered\n", name);
>> >> +
>> >> +       return 0;
>> >> +}
>> >> +
>> >> +static int pm8008_parse_regulator(struct regmap *regmap, struct
>> >> device *dev)
>> >> +{
>> >> +       int rc = 0;
>> >
>> > Drop initialization.
>> >
>> 
>> Okay.
>> 
>> >> +       const char *name;
>> >> +       struct device_node *child;
>> >> +       struct pm8008_regulator *pm8008_reg;
>> >> +
>> >> +       /* parse each subnode and register regulator for regulator
>> >> child */
>> >> +       for_each_available_child_of_node(dev->of_node, child) {
>> >> +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg),
>> >> GFP_KERNEL);
>> >> +
>> >> +               pm8008_reg->regmap = regmap;
>> >> +               pm8008_reg->of_node = child;
>> >> +               pm8008_reg->dev = dev;
>> >> +
>> >> +               rc = of_property_read_string(child, "regulator-name",
>> >> &name);
>> >> +               if (rc)
>> >> +                       continue;
>> >> +
>> >> +               rc = pm8008_register_ldo(pm8008_reg, name);
>> >
>> > Can we use the of_parse_cb similar to qcom_spmi-regulator.c?
>> >
>> 
>> Are you suggesting to remove the pm8008_register_ldo API and add its
>> contents in probe itself and then use of_parse_cb callback like in
>> qcom_spmi-regulator.c?
> 
> Yes
> 

Okay.

>> 
>> Do we have any advantage using that here? Also I am not exactly sure
>> what all contents to put in that. Seems like we can put the step rate
>> and min-dropout-voltage configurations in there.
> 
> Right. The regulator code is setup to do "DT parsing stuff" for each
> regulator node already, so you don't need to duplicate that logic in
> this driver. That's the main goal, consolidate regulator matching and
> iteration into the core. Maybe Mark has more info.

Okay.
