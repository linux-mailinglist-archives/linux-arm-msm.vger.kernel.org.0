Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3900962C25D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 16:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236176AbiKPPWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 10:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiKPPV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 10:21:59 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61B0532F0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:21:56 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id c25so22227669ljr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hyX3SOmdhZkf4G5iVnyyDhT1r2OXQYrZj5d/iATSVs=;
        b=soelfGRwwyZEyt+ov+wYiQU4I/2pIW1PXpqo77jn/XCKLaXW+e0aKxMNUegxuZBRpx
         wbgZsOWiO1LyDn3UUzAA74lCnWLkqaaGYre1CP07CERjnZUdlILnl4MMCvfGcYxWYbZL
         merR+yr+5T7bWK7gbsJxGuQna1Rb5oMbgru8ObPHC2ESFqE0MYb2Qish7SMaJhRu2Mpf
         ERWLixTO+f4+YlHt1qnkkaX8QrxCYoe8PpdObt5mqWrsmDSPBu4P2y5iUbPyqEEndoBC
         VuuvPC9DvXNVNIAto+ki+O/YNsVdSeak7xxYzYKjn20TWNh0X9FB1YcOTAhANkrJGw2H
         2oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hyX3SOmdhZkf4G5iVnyyDhT1r2OXQYrZj5d/iATSVs=;
        b=IgooiSDv6tjUJK/EFanZW9dxsYvffOqBzPjVtrd9pNlRcbXAZvDtXiBmu4CwD0S0Br
         WACjJxQXQzKdJ3Jm8ww7IElxbLcneAY46ClGYBLfl311EqS4YYT5OWG5w90BB2t3xEW/
         ZdvtlaYqtuY+DVcutRtA/8MfpqtnIj16/wcwCO7QrZ2Zg2+g/lMxwPOS9J9be8z6wMxe
         edIrmxVyt3hcl7qqevzx2ABuJjk0+8wHeo3pUQ+0qopXlaoQ2vSi9LNSZ9NP5PPADcdC
         4H+2dEDJE4RKm2hrBOf7MtjxRUnXx6g8Dk3+X9mG/wU0kwwzQRuBddxUGymbM5oF7aJb
         hiKg==
X-Gm-Message-State: ANoB5pktSgrG01Cj0Oie5AYoJ2SLCIFmZA8pVqCO8xPGhKoaHR3lT+ms
        EHn9I82G8NlT20fZj47at4cqyzuR5jvJj12U
X-Google-Smtp-Source: AA0mqf7eBPZsx75iWgNI31G3IMkd8p9EZfm72Rcb0mEbFlHRRLNmGoT1rQD7Cips6s1u1sAjJjOIrg==
X-Received: by 2002:a05:651c:98c:b0:277:81ff:b8c4 with SMTP id b12-20020a05651c098c00b0027781ffb8c4mr7428478ljq.260.1668612115113;
        Wed, 16 Nov 2022 07:21:55 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651210cb00b004a1e592837esm2649900lfg.140.2022.11.16.07.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:21:54 -0800 (PST)
Message-ID: <a839e03c-33d5-59ba-8623-cbafccc8b0b8@linaro.org>
Date:   Wed, 16 Nov 2022 18:21:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 2/4] phy: qcom-qmp-ufs: provide symbol clocks
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
 <20221110151748.795767-3-dmitry.baryshkov@linaro.org>
 <Y3T+rj1hACqSBrC4@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y3T+rj1hACqSBrC4@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 18:15, Johan Hovold wrote:
> On Thu, Nov 10, 2022 at 06:17:46PM +0300, Dmitry Baryshkov wrote:
>> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
>> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
>> provider to let other devices link these clocks through the DT.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> I was not CCed on this revision of this series either.
> 
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 64 +++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 189103d1bd18..78d7daf34667 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1023,6 +1023,66 @@ static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
>>   	return devm_clk_bulk_get(dev, num, qmp->clks);
>>   }
>>   
>> +static void phy_clk_release_provider(void *res)
>> +{
>> +	of_clk_del_provider(res);
>> +}
>> +
>> +#define UFS_SYMBOL_CLOCKS 3
>> +
>> +static int phy_symbols_clk_register(struct qmp_ufs *qmp, struct device_node *np)
> 
> Since you're adding a new function, please use the common prefix and
> reordering the terms and dropping the redundant "symbols" should make it
> more readable:
> 
> 	qmp_ufs_register_clocks()
> 
>> +{
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct clk_hw *hw;
>> +	char name[64];
>> +	int ret;
>> +
>> +	clk_data = devm_kzalloc(qmp->dev,
>> +				struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS),
>> +				GFP_KERNEL);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	clk_data->num = UFS_SYMBOL_CLOCKS;
>> +
>> +	snprintf(name, sizeof(name), "%s::rx_symbol_0", dev_name(qmp->dev));
>> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
>> +
>> +	clk_data->hws[0] = hw;
>> +
>> +	snprintf(name, sizeof(name), "%s::rx_symbol_1", dev_name(qmp->dev));
>> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
>> +
>> +	clk_data->hws[1] = hw;
>> +
>> +	snprintf(name, sizeof(name), "%s::tx_symbol_0", dev_name(qmp->dev));
>> +	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
>> +
>> +	clk_data->hws[2] = hw;
>> +
>> +	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Roll a devm action because the clock provider is the child node, but
>> +	 * the child node is not actually a device.
>> +	 */
> 
> I know you just copied this from one of the other drivers, but perhaps
> rephrase as "can be a child node". You can just drop the second clause
> (no node *is* a device).

Ack, thanks for the suggestion.

> 
>> +	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>> +}
>> +
>> +static const struct phy_ops qcom_qmp_ufs_ops = {
>> +	.power_on	= qmp_ufs_enable,
>> +	.power_off	= qmp_ufs_disable,
>> +	.owner		= THIS_MODULE,
>> +};
> 
> As I've already pointed out once, the above phy_ops struct hunk does not
> belong in this patch and is just some left over after you rebased on
> phy-next that must be removed.

Oops. I'll fix this during the next respin.

> 
>>   static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
>>   {
>>   	struct platform_device *pdev = to_platform_device(qmp->dev);
>> @@ -1135,6 +1195,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> +	ret = phy_symbols_clk_register(qmp, np);
>> +	if (ret)
>> +		goto err_node_put;
>> +
>>   	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
>>   	if (IS_ERR(qmp->phy)) {
>>   		ret = PTR_ERR(qmp->phy);
> 
> Johan

-- 
With best wishes
Dmitry

