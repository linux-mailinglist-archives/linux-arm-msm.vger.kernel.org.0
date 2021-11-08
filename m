Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156DE447D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 11:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237211AbhKHKEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 05:04:10 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:56258 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbhKHKEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 05:04:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636365685; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0l+Axwex3km/18zRKU/2t97iNvhS734FDSfeO1OvkLA=; b=UXS0T5JItg1GVU6G3fvh+ECiDPTCJFACF8crD0pxM/YwrgSgcKx2+HnDH2XedWrM7K0V5gNj
 LU1i5HWYPB6EKDuA0PVTkQuVvZZFvMMOJygFsSRuTtVynoc9S6CeS+uBJEY5BqlnLxfnlpnJ
 zHaKcZlqy91xEBiM0REH7ctS7Jo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6188f572facd20d7953610c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 10:01:22
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28F97C4361B; Mon,  8 Nov 2021 10:01:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73DEEC4360D;
        Mon,  8 Nov 2021 10:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 73DEEC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
 <3a05fc62-a060-3257-ad54-53e376763fe3@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <54ab2532-a0d5-a04f-0f8c-2ce11fdf973e@codeaurora.org>
Date:   Mon, 8 Nov 2021 15:31:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3a05fc62-a060-3257-ad54-53e376763fe3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/3/2021 4:52 PM, Srinivas Kandagatla wrote:
Thanks Srini for your TIme!!!
> Thanks Srinivasa for the patches.
>
> On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
>> Update pin control support for SC7280 LPASS LPI.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 40 
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 0bd0c16..17a05a6 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -122,6 +122,7 @@ static const struct pinctrl_pin_desc 
>> lpass_lpi_pins[] = {
>>       PINCTRL_PIN(11, "gpio11"),
>>       PINCTRL_PIN(12, "gpio12"),
>>       PINCTRL_PIN(13, "gpio13"),
>> +    PINCTRL_PIN(14, "gpio14"),
>
> I see your point in first patch making these names more generic, but 
> this is not really going to work, as the above line just added new pin 
> for sm8250 even though it really only has 0-13 pins.
>
> I think it would be more clear if you could just make a dedicated 
> structures for sc7280. Simillar comments apply for other changes too.
>
> Other than that the patch looks good to me.
>
> --srini

Okay. agree to your point. As lpass_lpi_pins array is just declaration, 
and it will be used in functions, I thought it won't impact as functions 
are different for both architectures.

With your feedback understood that it may not work existing archs. Will 
change accordingly and re-post it.

>
>>   };
>>     enum lpass_lpi_functions {
>> @@ -136,6 +137,7 @@ enum lpass_lpi_functions {
>>       LPI_MUX_i2s1_ws,
>>       LPI_MUX_i2s2_clk,
>>       LPI_MUX_i2s2_data,
>> +    LPI_MUX_sc7280_i2s2_data,
>>       LPI_MUX_i2s2_ws,
>>       LPI_MUX_qua_mi2s_data,
>>       LPI_MUX_qua_mi2s_sclk,
>> @@ -144,6 +146,7 @@ enum lpass_lpi_functions {
>>       LPI_MUX_swr_rx_data,
>>       LPI_MUX_swr_tx_clk,
>>       LPI_MUX_swr_tx_data,
>> +    LPI_MUX_sc7280_swr_tx_data,
>>       LPI_MUX_wsa_swr_clk,
>>       LPI_MUX_wsa_swr_data,
>>       LPI_MUX_gpio,
>> @@ -164,8 +167,11 @@ static const unsigned int gpio10_pins[] = { 10 };
>>   static const unsigned int gpio11_pins[] = { 11 };
>>   static const unsigned int gpio12_pins[] = { 12 };
>>   static const unsigned int gpio13_pins[] = { 13 };
>> +static const unsigned int gpio14_pins[] = { 14 };
>> +
>>   static const char * const swr_tx_clk_groups[] = { "gpio0" };
>>   static const char * const swr_tx_data_groups[] = { "gpio1", 
>> "gpio2", "gpio5" };
>> +static const char * const sc7280_swr_tx_data_groups[] = { "gpio1", 
>> "gpio2", "gpio14" };
>>   static const char * const swr_rx_clk_groups[] = { "gpio3" };
>>   static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>>   static const char * const dmic1_clk_groups[] = { "gpio6" };
>> @@ -185,6 +191,7 @@ static const char * const i2s1_data_groups[] = { 
>> "gpio8", "gpio9" };
>>   static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>>   static const char * const wsa_swr_data_groups[] = { "gpio11" };
>>   static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
>> +static const char * const sc7280_i2s2_data_groups[] = { "gpio12", 
>> "gpio13" };
>>     static const struct lpi_pingroup sm8250_groups[] = {
>>       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> @@ -203,6 +210,24 @@ static const struct lpi_pingroup sm8250_groups[] 
>> = {
>>       LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>   +static const struct lpi_pingroup sc7280_groups[] = {
>> +    LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> +    LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>> +    LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>> +    LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
>> +    LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
>> +    LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
>> +    LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
>> +    LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>> +    LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>> +    LPI_PINGROUP(12, NO_SLEW, dmic3_clk, sc7280_i2s2_data, _, _),
>> +    LPI_PINGROUP(13, NO_SLEW, dmic3_data, sc7280_i2s2_data, _, _),
>> +    LPI_PINGROUP(14, 6, sc7280_swr_tx_data, _, _, _),
>> +};
>> +
>>   static const struct lpi_function lpass_functions[] = {
>>       LPI_FUNCTION(dmic1_clk),
>>       LPI_FUNCTION(dmic1_data),
>> @@ -215,6 +240,7 @@ static const struct lpi_function 
>> lpass_functions[] = {
>>       LPI_FUNCTION(i2s1_ws),
>>       LPI_FUNCTION(i2s2_clk),
>>       LPI_FUNCTION(i2s2_data),
>> +    LPI_FUNCTION(sc7280_i2s2_data),
>>       LPI_FUNCTION(i2s2_ws),
>>       LPI_FUNCTION(qua_mi2s_data),
>>       LPI_FUNCTION(qua_mi2s_sclk),
>> @@ -223,6 +249,7 @@ static const struct lpi_function 
>> lpass_functions[] = {
>>       LPI_FUNCTION(swr_rx_data),
>>       LPI_FUNCTION(swr_tx_clk),
>>       LPI_FUNCTION(swr_tx_data),
>> +    LPI_FUNCTION(sc7280_swr_tx_data),
>>       LPI_FUNCTION(wsa_swr_clk),
>>       LPI_FUNCTION(wsa_swr_data),
>>   };
>> @@ -236,6 +263,15 @@ static struct lpi_pinctrl_variant_data 
>> sm8250_lpi_data = {
>>       .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>   +static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>> +    .pins = lpass_lpi_pins,
>> +    .npins = ARRAY_SIZE(lpass_lpi_pins),
>> +    .groups = sc7280_groups,
>> +    .ngroups = ARRAY_SIZE(sc7280_groups),
>> +    .functions = lpass_functions,
>> +    .nfunctions = ARRAY_SIZE(lpass_functions),
>> +};
>> +
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>                unsigned int addr)
>>   {
>> @@ -677,6 +713,10 @@ static const struct of_device_id 
>> lpi_pinctrl_of_match[] = {
>>              .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
>>              .data = &sm8250_lpi_data,
>>       },
>> +    {
>> +           .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>> +           .data = &sc7280_lpi_data,
>> +    },
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

