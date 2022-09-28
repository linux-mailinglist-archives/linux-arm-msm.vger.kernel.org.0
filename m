Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675085ED633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbiI1Hf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiI1HfQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:35:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9CD1A81D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:35:02 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s14so18462583wro.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=T+twYSzMPRleSE9OznXaEMFrJJUZFkK7lBSk4Vw77aA=;
        b=D1432DOl/gFwxeJt0n2GOHt0Rhdmv87VJv4a7RA4E8I2u4j//Big6m/qFkNf6lTBpm
         W0ksnSWkRf8ETFnZqBTyFmTQqHTLcP25jTVvmyiqLiEUcnOk1v6+pfRYrVIaVj35bdq0
         2jIlq8lnnOtEFlfxYAOyUlLsQvHkCrDnlsv7lXjf7W1xwdN+Rbm/cBsIMogB9442XXxF
         N3hLfFm8EtXWV+O3wC31QeV1XeN7X+oXgIzoxdirW8+WdNWVHIXhUyAuPbaAZyam9mMB
         APAQjRpEsRTkDGMRDOjGcZF6yOmSwbUI4syZsk7yb9slQNY9s/oHiv8YYy746pT98mxP
         NbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=T+twYSzMPRleSE9OznXaEMFrJJUZFkK7lBSk4Vw77aA=;
        b=PDLhayoWKBLAfM1UEZ5OhAQAUtHOpufXvr5YbxAcTG/qcvnBpFncgLYExLKGrk3gnk
         tb5J30OAchAplwvKKP+xQqB3W8Y7oOO+33BbvhQHmjQ3d6W2DBu/A6edp7osSb0XUdM+
         c4CNHxhmoAnIIiQviAexJAc/kHqJiH1pDV6XKsd/5CHvtDtw8eRwQtQ3vnbtX+x84eTj
         Oj5esGgx+KStJn5S8TfgGH5Byn+VZMpaYTX7VR8+RviNmk+r3s6D0cPCfhnA9MWOclZ3
         K8Cepu41zvJ4tcERNUx+O9YM8r33NutCGkt0sD2c2eBpCiutYZzcxrAgllW9yoX3otwf
         KFBA==
X-Gm-Message-State: ACrzQf25j/spbg8c/wfz8VkNhHQBMD3GUJIaGiLzV+l8raotuTtr7DmJ
        IoPVTnJIWqJybcf3kAsk4UVQGdXJtxrLVg==
X-Google-Smtp-Source: AMsMyM79y1rM6aAQ3/1f3BKXwVvkldEwZiTCyJOd1oqYgmngq62XIbI78g6wHdKw7+NT5rAOIKRK4w==
X-Received: by 2002:a05:6512:4005:b0:49e:6f0a:b09e with SMTP id br5-20020a056512400500b0049e6f0ab09emr12354347lfb.330.1664349972648;
        Wed, 28 Sep 2022 00:26:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u21-20020ac258d5000000b00494a27500c1sm393237lfo.163.2022.09.28.00.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:26:12 -0700 (PDT)
Message-ID: <c36a8f26-b187-9870-ebfb-caaa893f3d86@linaro.org>
Date:   Wed, 28 Sep 2022 09:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: pm8941: fix iadc node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161821.78030-1-luca@z3ntu.xyz>
 <20220925161821.78030-2-luca@z3ntu.xyz>
 <74ef3de8-5be0-70ec-e34b-717ba93d3d77@linaro.org> <1828122.tdWV9SEqCh@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1828122.tdWV9SEqCh@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 17:05, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Montag, 26. September 2022 10:54:23 CEST Krzysztof Kozlowski wrote:
>> On 25/09/2022 18:18, Luca Weiss wrote:
>>> The iadc node name is supposed to be just 'adc' and the compatible is
>>> only supposed to be qcom,spmi-iadc according to the bindings.
>>>
>>> Adjust the node to match that.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>>
>>>  arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi
>>> b/arch/arm/boot/dts/qcom-pm8941.dtsi index 3c15eecf2f21..33517cccee01
>>> 100644
>>> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
>>> @@ -131,8 +131,8 @@ adc-chan@48 {
>>>
>>>  			};
>>>  		
>>>  		};
>>>
>>> -		pm8941_iadc: iadc@3600 {
>>> -			compatible = "qcom,pm8941-iadc", 
> "qcom,spmi-iadc";
>>> +		pm8941_iadc: adc@3600 {
>>> +			compatible = "qcom,spmi-iadc";
>>
>> I am not sure this is correct. Usually specific compatibles are encouraged.
> 
> I'm happy to change it the other way also.
> 
> But the sibling of this compatible, qcom,spmi-vadc also only has that single 
> compatible so it'd align it with that.

Ugh, there is a mess around them. Some other ADCs have specific
compatibles, some not, so there is no consistency.

I propose to have device specific compatible with qcom,spmi-iadc
fallback, so basically document the DTS in bindings. Maybe other IADC
will need some quirks, so specific compatible helps here.


Best regards,
Krzysztof

