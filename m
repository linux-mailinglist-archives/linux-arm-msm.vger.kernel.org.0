Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B682456A51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 07:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhKSGjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 01:39:54 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:40097 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhKSGjy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 01:39:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637303813; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ixwhfp9T0vaQlNYEIAG5gcw2ca2tRPTRKqoBDmGf6pw=; b=e/5XF4lv3oi9aTl66dtmuWnO/fa6rpyNnLkPrl5zXfqCm1QnvsuYaSS5cmfhJ9Rk3SjOjDE/
 pH3oy21yZ7+oEiOvvVt5Bwt1SXUZfLcOWPg7gDVVGwEQmboKs7h7wFoCI1WcbYf3yOz+hI+g
 4bPv+J5ynPVaFuJ4fK+oUbKKqYE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619746040a5410021bd50d7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 06:36:52
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5274C43617; Fri, 19 Nov 2021 06:36:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED379C4338F;
        Fri, 19 Nov 2021 06:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ED379C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
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
 <1635342097-2726-2-git-send-email-srivasam@codeaurora.org>
 <01c32c7f-9639-b3c8-045b-35469a3e54aa@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <19df295b-a3f1-9c31-27a3-7ebb59254694@codeaurora.org>
Date:   Fri, 19 Nov 2021 12:06:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <01c32c7f-9639-b3c8-045b-35469a3e54aa@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/3/2021 4:52 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
> Hi Srinivasa,
> Thanks for the patches, I think you forgot to add correct mailing list 
> for this drivers.
>
> Please consider using scripts/get_maintainer.pl to help you with this 
> list.
>
> On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
>> Update pin control variable names to make common for all lpass varients.
>> Update bulk clock voting to optional voting as ADSP bypass platform 
>> doesn't
>> need macro and decodec clocks, these are maintained as power domains and
>> operated from lpass audio core cc.
>
> How are you going to ensure that the powerdomains are switched on when 
> setting up the pinctrl configuration.
>
> Should we not take a reference to the power-domain in this driver?

The required power domains are getting enabled in core-boot level. So no 
need of reference in this driver.

And still if power domain need to referenced, we can do it from device 
tree itself.

>
>
> --srini
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 2f19ab4..0bd0c16 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -107,7 +107,7 @@ struct lpi_pinctrl {
>>   };
>>     /* sm8250 variant specific data */
>> -static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>> +static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
>>       PINCTRL_PIN(0, "gpio0"),
>>       PINCTRL_PIN(1, "gpio1"),
>>       PINCTRL_PIN(2, "gpio2"),
>> @@ -124,7 +124,7 @@ static const struct pinctrl_pin_desc 
>> sm8250_lpi_pins[] = {
>>       PINCTRL_PIN(13, "gpio13"),
>>   };
>>   -enum sm8250_lpi_functions {
>> +enum lpass_lpi_functions {
>>       LPI_MUX_dmic1_clk,
>>       LPI_MUX_dmic1_data,
>>       LPI_MUX_dmic2_clk,
>> @@ -203,7 +203,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>>       LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>   -static const struct lpi_function sm8250_functions[] = {
>> +static const struct lpi_function lpass_functions[] = {
>>       LPI_FUNCTION(dmic1_clk),
>>       LPI_FUNCTION(dmic1_data),
>>       LPI_FUNCTION(dmic2_clk),
>> @@ -228,12 +228,12 @@ static const struct lpi_function 
>> sm8250_functions[] = {
>>   };
>>     static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>> -    .pins = sm8250_lpi_pins,
>> -    .npins = ARRAY_SIZE(sm8250_lpi_pins),
>> +    .pins = lpass_lpi_pins,
>> +    .npins = ARRAY_SIZE(lpass_lpi_pins),
>>       .groups = sm8250_groups,
>>       .ngroups = ARRAY_SIZE(sm8250_groups),
>> -    .functions = sm8250_functions,
>> -    .nfunctions = ARRAY_SIZE(sm8250_functions),
>> +    .functions = lpass_functions,
>> +    .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>     static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int 
>> pin,
>> @@ -615,7 +615,7 @@ static int lpi_pinctrl_probe(struct 
>> platform_device *pdev)
>>           return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>                        "Slew resource not provided\n");
>>   -    ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +    ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, 
>> pctrl->clks);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "Can't get clocks\n");
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

