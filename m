Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF0710A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 12:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240951AbjEYKby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 06:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240892AbjEYKbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 06:31:51 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A3819D
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 03:31:50 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so1057085e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685010708; x=1687602708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZdgPEgDAoSmA/7SXhnwPx/sNtYd4qe0zdzgh7q8GVQ=;
        b=RPaw11UGtfXADUXUfw2DDLPIgvC68J74KrQRPWKR+hyYRcmAT5tBWE5Z4I4zfOkzuF
         ISHguIAzubWqsAa82mfX01T351JOjnE8n4Hg/+vNBGfP3PjIzciO+zwDxFqiufu/ufdd
         j3mW8nlUk6RVK8t4PqmHvJJbJY6krCiVBMZ2KehWrYaIkoRsvxQ4Tggcpd4+6V9uKLD7
         8mMqbsRwnGjdJ5NcYgDFwcVwghsonEMP+fp4jg0Zrg/43MEyIkVRZuV0rxQX9HggMOYg
         LUgx5UqcdLVxPeYhKZ3+xfgGEYYdtExIBytQuk9jd/FFVoBOluohjxZ7QMp/D3j5OYk6
         ZTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685010708; x=1687602708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZdgPEgDAoSmA/7SXhnwPx/sNtYd4qe0zdzgh7q8GVQ=;
        b=iM1V/DGnLp26ie755Z8+EAT+V1PFgY9ovzelRNEDfn+SMfbZPeovLdWlkvsMZ8HecN
         xcPlwGfbCJofhfJLgOkO8punChvgZjRlwmV97pf6YAh5wMgcxDc/OKCR6hcb7jOpj/Ej
         fEzAcnliyBkD1zScwGWkMA85SwRIfHKj5N7ukEZS1jB4LQMSyuSdf9DkN2Y6nKMl8THE
         tRpuN+vx55ZppustvRtiVnIgadqjemynYtiSl0RrhbmNhiG2HXkqXInARymSAYgGNB1O
         WuGhhvi0qOyA/spUD19Lt7QaoRS3urx65LMAFVfWfqY1DN7SKlnnMbCrd7nUxQOEDpr9
         MH/w==
X-Gm-Message-State: AC+VfDyw3ovy1+qnkUlxOnL9lPQODUgXFqKpiEvatWp8vLmL386UP7O6
        /bx5FVjZqGrqTKxUhioKnyEBcQ==
X-Google-Smtp-Source: ACHHUZ7UwxI8JOpqpaFtEvnkFO+1r7zo82NNT05WijoC2pcObFhz7kY3Z3YRG1f8HIHMRuJxFFemSA==
X-Received: by 2002:a7b:cd8e:0:b0:3f6:a66:a372 with SMTP id y14-20020a7bcd8e000000b003f60a66a372mr1968045wmj.1.1685010708356;
        Thu, 25 May 2023 03:31:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id l18-20020a5d5272000000b002fefe2edb72sm1335523wrc.17.2023.05.25.03.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:31:47 -0700 (PDT)
Message-ID: <497f6543-4d6d-256d-2fa0-be47a594a55c@linaro.org>
Date:   Thu, 25 May 2023 11:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] clk: qcom: Add lpass audio clock controller driver
 for SC8280XP
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
 <20230518113800.339158-5-srinivas.kandagatla@linaro.org>
 <ZGso3u6e0L5jXBLf@hovoldconsulting.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZGso3u6e0L5jXBLf@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/05/2023 09:33, Johan Hovold wrote:
> On Thu, May 18, 2023 at 12:37:59PM +0100, Srinivas Kandagatla wrote:
>> Add support for the lpass audio clock controller found on SC8280XP based
>> devices. This would allow lpass peripheral loader drivers to control the
>> clocks and bring the subsystems out of reset.
>>
>> Currently this patch only supports resets as the Q6DSP is in control of
>> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
>> channel.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/clk/qcom/lpasscc-sc8280xp.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
>> index 118320f8ee40..e221ae2d40ae 100644
>> --- a/drivers/clk/qcom/lpasscc-sc8280xp.c
>> +++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
>> @@ -13,6 +13,26 @@
>>   #include "common.h"
>>   #include "reset.h"
>>   
>> +static const struct qcom_reset_map lpass_audio_csr_sc8280xp_resets[] = {
>> +	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
>> +	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>> +	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
>> +};
>> +
>> +static struct regmap_config lpass_audio_csr_sc8280xp_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.name = "lpass-audio-csr",
> 
> Should you update this name to match the new compatible
> ("lpassaudiocc")?

This name reflects the name from data sheet, keeping it that way would 
be useful.

--srini
> 
>> +	.max_register = 0x1000,
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_audio_csr_reset_sc8280xp_desc = {
> 
> Same here (and for the reset struct as well as previous patch).
> 
>> +	.config = &lpass_audio_csr_sc8280xp_regmap_config,
>> +	.resets = lpass_audio_csr_sc8280xp_resets,
>> +	.num_resets = ARRAY_SIZE(lpass_audio_csr_sc8280xp_resets),
>> +};
>> +
>>   static const struct qcom_reset_map lpass_tcsr_sc8280xp_resets[] = {
>>   	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
>>   };
>> @@ -33,6 +53,9 @@ static const struct qcom_cc_desc lpass_tcsr_reset_sc8280xp_desc = {
>>   
>>   static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
>>   	{
>> +		.compatible = "qcom,sc8280xp-lpassaudiocc",
>> +		.data = &lpass_audio_csr_reset_sc8280xp_desc,
>> +	}, {
>>   		.compatible = "qcom,sc8280xp-lpasscc",
>>   		.data = &lpass_tcsr_reset_sc8280xp_desc,
>>   	},
> 
> Johan
