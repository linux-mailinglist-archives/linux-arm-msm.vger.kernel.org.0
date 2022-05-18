Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF8152C32B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 21:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbiERTTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 15:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbiERTTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 15:19:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7521B5FA8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 12:19:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w14so5262846lfl.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 12:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wvaWzADdM7DSnsBh4ZAoxyMLzUUhSncSX5FP71iYjVw=;
        b=Z8gML/o1hRUDPMKBQF3J+hxlHRQjbgRezUGsNFhzYshnHrDtnN5CKiMLS3+AeoK8MQ
         6+ZAMO62DkxqCgpCwMm/HfF+1CqhAYnlze04dZwLj1HaD7ezxwUhKxkr9op9bv/wyBrG
         HkfamvtTe1GpixzfiT6KDMUlbnyZoaFw4rUb3iCYXgIpLxAX62+sfwLflSN9OEN+EWQM
         FgAMLvzvVyj5dAFmlLkFBE3SQSxAfMlZ8Bxn3a1ie8/ocBbBxXc+0EfHpB6+mLKdiQub
         uDeFTk8EBNqqtosaqpIQ0su8Ey2wFyf3uIOgn7kc0FhX+ULZDRKKXU66bcRAWQMc/x41
         TRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wvaWzADdM7DSnsBh4ZAoxyMLzUUhSncSX5FP71iYjVw=;
        b=D/CucTcAokyDrnAVutuPSCtrNFe+WmcGDoEF4PeyD8jAaDkH313yusGIs4+vP1/bwv
         GhX1rgpdX8Bog5TNpGJ0oaPO9RishirpebiyxUlNFtFFKUkJbVGz/viVPS9fMI4JUmaa
         upX92Yn0e/x53WwriYXBCGoroB9T5Dtm7gw5xggQy8Kko1ujCf0B4f9JweJqzd23Sjp2
         9MHG77uuRDq7vtM8WOYa/eyShyKwhLkrZ0xUjh3Gn3ejKYLMTuGlVkamx1HT0PfgJp5y
         r72ZjFD3M4xYsmr+ZlN8vHXDtndr2SmK+/Zpr9cbpERmDEscSgJthBVhJYv6pohd5e4t
         0Cxg==
X-Gm-Message-State: AOAM5332nRgCrjKdWo3X8r+b8GEHfUIk7CkZAxMUpn0AcHnaM4Oau5Wa
        YEsoiBXZ2Irxr0r2v6K7mttsQQ==
X-Google-Smtp-Source: ABdhPJzJSLZnoa2/JlL2grPwpJnM3CN6awJYDRZFGpqtIdAaPJYFgMmAcWEBTZQPDbHr+XCSzjji6g==
X-Received: by 2002:ac2:4ac9:0:b0:471:f6da:640d with SMTP id m9-20020ac24ac9000000b00471f6da640dmr665727lfp.286.1652901549250;
        Wed, 18 May 2022 12:19:09 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id d25-20020ac24c99000000b00477b624c0a8sm31111lfl.180.2022.05.18.12.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:19:08 -0700 (PDT)
Message-ID: <23cb9c6e-129f-df79-b734-aac1a92264a9@linaro.org>
Date:   Wed, 18 May 2022 22:19:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/5] clk: qcom: regmap: add PHY clock source
 implementation
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220513175339.2981959-1-dmitry.baryshkov@linaro.org>
 <20220513175339.2981959-3-dmitry.baryshkov@linaro.org>
 <20220518175808.EC29AC385A5@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220518175808.EC29AC385A5@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:58, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-13 10:53:36)
>> diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.c b/drivers/clk/qcom/clk-regmap-phy-mux.c
>> new file mode 100644
>> index 000000000000..d7a45f7fa1aa
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-regmap-phy-mux.c
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022, Linaro Ltd.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/bitops.h>
>> +#include <linux/regmap.h>
>> +#include <linux/export.h>
> 
> clk-provider.h for clk_hw/clk_ops usage. It helps with grep to identify
> clk providers.
> 
>> +
>> +#include "clk-regmap-phy-mux.h"
> 
> Same for clk-regmap.h, avoid include hell.
> 
>> +
>> +static inline struct clk_regmap_phy_mux *to_clk_regmap_phy_mux(struct clk_hw *hw)
>> +{
>> +       return container_of(to_clk_regmap(hw), struct clk_regmap_phy_mux, clkr);
>> +}
>> +
>> +static int phy_mux_is_enabled(struct clk_hw *hw)
>> +{
>> +       struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(hw);
>> +       struct clk_regmap *clkr = to_clk_regmap(hw);
>> +       unsigned int mask = GENMASK(phy_mux->width + phy_mux->shift - 1, phy_mux->shift);
>> +       unsigned int val;
>> +
>> +       regmap_read(clkr->regmap, phy_mux->reg, &val);
>> +       val = (val & mask) >> phy_mux->shift;
> 
> Can this use FIELD_GET?
> 
>> +
>> +       WARN_ON(val != phy_mux->phy_src_val && val != phy_mux->ref_src_val);
>> +
>> +       return val == phy_mux->phy_src_val;
>> +}
>> +
>> +static int phy_mux_enable(struct clk_hw *hw)
>> +{
>> +       struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(hw);
>> +       struct clk_regmap *clkr = to_clk_regmap(hw);
>> +       unsigned int mask = GENMASK(phy_mux->width + phy_mux->shift - 1, phy_mux->shift);
>> +       unsigned int val;
>> +
>> +       val = phy_mux->phy_src_val << phy_mux->shift;
> 
> Can this use FIELD_PREP?
> 
>> +
>> +       return regmap_update_bits(clkr->regmap, phy_mux->reg, mask, val);
>> +}
>> +
>> +static void phy_mux_disable(struct clk_hw *hw)
>> +{
>> +       struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(hw);
>> +       struct clk_regmap *clkr = to_clk_regmap(hw);
>> +       unsigned int mask = GENMASK(phy_mux->width + phy_mux->shift - 1, phy_mux->shift);
>> +       unsigned int val;
>> +
>> +       val = phy_mux->ref_src_val << phy_mux->shift;
>> +
>> +       regmap_update_bits(clkr->regmap, phy_mux->reg, mask, val);
>> +}
>> +
>> +const struct clk_ops clk_regmap_phy_mux_ops = {
>> +       .enable = phy_mux_enable,
>> +       .disable = phy_mux_disable,
>> +       .is_enabled = phy_mux_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(clk_regmap_phy_mux_ops);
>> diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.h b/drivers/clk/qcom/clk-regmap-phy-mux.h
>> new file mode 100644
>> index 000000000000..6260912191c5
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-regmap-phy-mux.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022, Linaro Ltd.
>> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> + */
>> +
>> +#ifndef __QCOM_CLK_REGMAP_PHY_MUX_H__
>> +#define __QCOM_CLK_REGMAP_PHY_MUX_H__
>> +
>> +#include <linux/clk-provider.h>
>> +#include "clk-regmap.h"
>> +
>> +/*
>> + * A special clock implementation for PHY pipe and symbols clock sources.
> 
> Remove "special" please. Everything is special :)

ack for the docs changes, will send shortly.

> 
>> + *
>> + * If the clock is running off the from-PHY source, report it as enabled.
> 
> from-PHY is @phy_src_val? Maybe add that information like "from-PHY
> source (@phy_src_val)"
> 
>> + * Report it as disabled otherwise (if it uses reference source).
> 
> Same for @ref_src_val
> 
>> + *
>> + * This way the PHY will disable the pipe clock before turning off the GDSC,
>> + * which in turn would lead to disabling corresponding pipe_clk_src (and thus
>> + * it being parked to a safe, reference clock source). And vice versa, after
>> + * enabling the GDSC the PHY will enable the pipe clock, which would cause
>> + * pipe_clk_src to be switched from a safe source to the working one.
> 
> Might as well make it into real kernel-doc at the same time.
> 
>> + */
>> +
>> +struct clk_regmap_phy_mux {
>> +       u32                     reg;
>> +       u32                     shift;
>> +       u32                     width;
> 
> Technically neither of these need to be u32 and could be u8 to save a
> byte or two. The other thing is that possibly the width and shift never
> changes? The RCG layout is pretty well fixed. Does hardcoding it work?

It seems, I can hardcode shift=0 and width=2.

> 
>> +       u32                     phy_src_val;
>> +       u32                     ref_src_val;
> 
> I feel like "_val" is redundant. Just "ref_src" and "phy_src"? Shorter
> is nice.

I had this since I wanted to point that these are 'values', not the 
enum-ed sources. But I can drop this now.

> 
>> +       struct clk_regmap       clkr;
>> +};
>> +
>> +extern const struct clk_ops clk_regmap_phy_mux_ops;


-- 
With best wishes
Dmitry
