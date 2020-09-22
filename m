Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26D1274B59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 23:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIVVpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 17:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIVVpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 17:45:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A73BC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 14:45:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so18741286wrm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w4Sr3PY5vsv9Crdbf5k5DOz31reA+305B7dkZ8nMiGE=;
        b=HK8hKMneHf+mU9w7jeszAsV8T0xOUCYx0LE8Eh+nEmEHpN10lcFSa8/QjiavuNtoe8
         CL7JYhCGkszVRUclBZ9/aDVP/7/iSstEE9Nll2A1uqmFTXByh9O7MMoZS1C0S6W4S9GJ
         iath+ngQFTdiCpYU5mYPxTfgpfT3TM+0gT8//EAMs57VuLcnmFA4CQyCS0pyWUHOX6Yl
         /xjQTYFYMqRK0kUbU5ab84cxCq6KS6vTnB7DMyiGVV3LLYtaxDWvb/Z0JU3uDZ80lNM1
         Zg9fbkAVQrVH8PvYMegSKed46At+ubsGy+HUF7Yg5g1SPGINH14Ik2W94kFBvDkKsUB1
         0MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w4Sr3PY5vsv9Crdbf5k5DOz31reA+305B7dkZ8nMiGE=;
        b=qifFi++ws4sEnI7/uYLRivp8xi0tDtGUzExnbxYDbc8Dzu4XoVmMz7W8i4uBYWDXwU
         szCUrb5l19ElG88HXL43G43RI2eSC3zW8V8y63o0i34HpASidE3OaiTNWKKJjq7J5cs4
         MJDvWs6iSeSG+iwyvzDIflDl/KokajA3KCEnDpbBV4RQsyyGdxulwRt2ge5sfoZhQiTr
         rNAeSBPdHn8Gp/TKz1chRx3EktP2S9Qv+dOpLtBDXqqD83fQA6ZAvXaRBzBdnAHfj8ZW
         KWrijlOc3XPWmFfnYumSJ+WW+6l+sRfQ9WxC/QYVGiC4fKwtOFDeZx3iyV1HTqvigPSS
         79Wg==
X-Gm-Message-State: AOAM531/KMsSafdH+PeSQzyHjcZ4tr1sWQG1uxi2QZWGjKjOWeJGcgRa
        NzrHbpOEcBOWN6xu/7F+Nje4nA==
X-Google-Smtp-Source: ABdhPJxt5E3Wtt6wVHjC7mW21UW8kyk9EDeLzo/ZDWev4V+ta9a/FIhp6YB3Xcf6TtXu4TxjUzFRxA==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr7764439wrv.185.1600811109572;
        Tue, 22 Sep 2020 14:45:09 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v128sm6014927wme.2.2020.09.22.14.45.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 14:45:08 -0700 (PDT)
Subject: Re: [PATCH 3/4] clk: qcom: Add support to LPASS AUDIO_CC Glitch Free
 Mux clocks
To:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
 <20200917132850.7730-4-srinivas.kandagatla@linaro.org>
 <160080010215.310579.4526434246523292987@swboyd.mtv.corp.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a8713637-d240-d22d-02a7-f15080620467@linaro.org>
Date:   Tue, 22 Sep 2020 22:45:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <160080010215.310579.4526434246523292987@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for review,

On 22/09/2020 19:41, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2020-09-17 06:28:49)
>> GFM Muxes in AUDIO_CC control clocks to LPASS WSA and RX Codec Macros.
>> This patch adds support to these muxes.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/clk/qcom/Kconfig            |   7 +
>>   drivers/clk/qcom/Makefile           |   1 +
>>   drivers/clk/qcom/lpass-gfm-sm8250.c | 235 ++++++++++++++++++++++++++++
>>   3 files changed, 243 insertions(+)
>>   create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 2eda63b7c46c..4e46fd339e62 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -494,4 +494,11 @@ config KRAITCC
>>            Support for the Krait CPU clocks on Qualcomm devices.
>>            Say Y if you want to support CPU frequency scaling.
>>   
>> +config CLK_GFM_LPASS_SM8250
>> +       tristate "GFM LPASS Clocks"
>> +       depends on SND_SOC_QDSP6_COMMON
> 
> What is the depends for?
I think I forgot to remove this!

> 
>> +       help
>> +         Support for the GFM Glitch Free Mux LPASS clock. Say Y
>> +         if you want to support GFM Clocks on LPASS for SM8250 SoC.
>> +
>>   endif
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 8eb395d02a32..c18e4ead6c9e 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -74,3 +74,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
>>   obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
>>   obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
>>   obj-$(CONFIG_KRAITCC) += krait-cc.o
>> +obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> 
> I don't know but probably this should be sorted by Kconfig instead of
> tacked onto the end here.
> 
>> diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
>> new file mode 100644
>> index 000000000000..2d5c41ae4969
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
>> @@ -0,0 +1,235 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/clk.h>
>> +#include <linux/slab.h>
>> +#include <linux/err.h>
>> +#include <linux/notifier.h>
>> +#include <linux/device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of_device.h>
>> +#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
>> +
>> +struct lpass_gfm {
>> +       struct device *dev;
>> +       void __iomem *base;
>> +       struct clk *core_vote;
>> +       struct clk *bus_clk;
>> +};
>> +
>> +struct clk_gfm {
>> +       unsigned int mux_reg;
>> +       unsigned int mux_mask;
>> +       struct clk_hw   hw;
>> +       struct lpass_gfm *priv;
>> +       void __iomem *gfm_mux;
>> +};
>> +
...
>> +static struct clk_gfm lpass_gfm_rx_npl = {
>> +       .mux_reg = 0x240d8,
>> +       .mux_mask = BIT(0),
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "RX_NPL",
>> +               .ops = &clk_gfm_ops,
>> +               .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>> +               .parent_names = (const char *[]){
>> +                       "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
>> +                       "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
>> +               },
>> +               .parent_data = (const struct clk_parent_data[]){
>> +                               { .index = 0 },
>> +                               { .index = 1 },
>> +               },
> 
> Please use parent_data instead of parent_names. The name can go in the
> parent_data struct.

Ah.. I missed that, will fix that in next version!

> 
>> +               .num_parents = 2,
>> +       },
>> +};
>> +
>> +static struct clk_gfm *audiocc_gfm_clks[] = {
>> +       [LPASS_CDC_WSA_NPL]             = &lpass_gfm_wsa_npl,
>> +       [LPASS_CDC_WSA_MCLK]            = &lpass_gfm_wsa_mclk,
>> +       [LPASS_CDC_RX_NPL]              = &lpass_gfm_rx_npl,
>> +       [LPASS_CDC_RX_MCLK_MCLK2]       = &lpass_gfm_rx_mclk_mclk2,
>> +};
>> +
>> +static struct clk_hw_onecell_data audiocc_hw_onecell_data = {
>> +       .hws = {
>> +               [LPASS_CDC_WSA_NPL]     = &lpass_gfm_wsa_npl.hw,
>> +               [LPASS_CDC_WSA_MCLK]    = &lpass_gfm_wsa_mclk.hw,
>> +               [LPASS_CDC_RX_NPL]      = &lpass_gfm_rx_npl.hw,
>> +               [LPASS_CDC_RX_MCLK_MCLK2] = &lpass_gfm_rx_mclk_mclk2.hw,
>> +       },
>> +       .num = ARRAY_SIZE(audiocc_gfm_clks),
>> +};
>> +
>> +struct lpass_gfm_data {
>> +       struct clk_hw_onecell_data *onecell_data;
>> +       struct clk_gfm **gfm_clks;
>> +};
>> +
>> +static struct lpass_gfm_data audiocc_data = {
>> +       .onecell_data = &audiocc_hw_onecell_data,
>> +       .gfm_clks = audiocc_gfm_clks,
>> +};
>> +
>> +static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
>> +{
>> +       const struct lpass_gfm_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct resource *res;
>> +       struct clk_gfm *gfm;
>> +       struct lpass_gfm *cc;
>> +       int err, i;
>> +
>> +       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>> +       if (!cc)
>> +               return -ENOMEM;
>> +
>> +       cc->core_vote = devm_clk_get(&pdev->dev, "core");
>> +       if (IS_ERR(cc->core_vote)) {
>> +               dev_dbg(dev, "Failed to get lpass core clk\n");
>> +               return PTR_ERR(cc->core_vote);
>> +       }
> 
> Can this use the pm_clk stuff?

you mean add runtime pm support or something else?

I can give it a go and see!


> 
>> +
>> +       data = of_device_get_match_data(dev);
> 
> What if data is NULL?
It should not be here if there is no match of compatible string, so data 
should not be NULL!

> 
>> +       cc->bus_clk = devm_clk_get(&pdev->dev, "bus");
>> +       if (IS_ERR(cc->bus_clk)) {
>> +               dev_dbg(dev, "Failed to get lpass bus clk\n");
>> +               return PTR_ERR(cc->bus_clk);
>> +       }
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       cc->base = devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(cc->base))
>> +               return PTR_ERR(cc->base);
>> +
>> +       clk_prepare_enable(cc->core_vote);
>> +       clk_prepare_enable(cc->bus_clk);
> 
> These will always be left enabled if the probe function bails out after here.
> 
I agree, Will add some error handling
>> +
>> +       for (i = 0; i < data->onecell_data->num; i++) {
>> +               if (!data->gfm_clks[i])
>> +                       continue;
>> +
>> +               gfm = data->gfm_clks[i];
>> +               gfm->priv = cc;
>> +               gfm->gfm_mux = cc->base;
>> +               gfm->gfm_mux = gfm->gfm_mux + data->gfm_clks[i]->mux_reg;
>> +
>> +               err = devm_clk_hw_register(dev, &data->gfm_clks[i]->hw);
>> +               if (err)
>> +                       return err;
>> +
>> +       }
>> +
>> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +                                          data->onecell_data);
>> +}
>> +
>> +static const struct of_device_id lpass_gfm_clk_match_table[] = {
>> +       {
>> +               .compatible = "qcom,sm8250-lpass-audiocc",
>> +               .data = &audiocc_data,
>> +       },
>> +       { }
>> +};
>> +
>> +static struct platform_driver lpass_gfm_clk_driver = {
>> +       .probe          = lpass_gfm_clk_driver_probe,
>> +       .driver         = {
>> +               .name   = "lpass-gfm-clk",
>> +               .of_match_table = lpass_gfm_clk_match_table,
>> +       },
>> +};
>> +builtin_platform_driver(lpass_gfm_clk_driver);
> 
> Should be module_platform_driver()?
sure, will do that!

> 
