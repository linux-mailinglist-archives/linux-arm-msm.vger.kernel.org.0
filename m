Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C4712F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243223AbjEZVld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242782AbjEZVlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:41:32 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4948F7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:41:30 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af1e290921so11786401fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137289; x=1687729289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7MnQuq2xCXKkoneCObkD2MWK2OHusd2oVYCX6UiHsY=;
        b=YQ7IS7u4PWDDBj/3b0hHOSzNCsVszGMpEAWMJbg7tT9u3g4cAr6dxbNfK7v27VTCQp
         TMkevzAo9L8TkYgqYd2HNHiih87lwrslIw5YyX74cxn4NMZE98ljCaMybpMteXXI0fv+
         N2Z0RRhcYa6hQS7IQ8+r8LeObeBK0G+ED+jGLr1DahvaUkv5AFZMAG0SZazYFqRyIg2j
         FJTH8zVqjVfP+SEetsP+wGWFZr75jC8b6PfsuYaG9drkyMP9cGxxFtwPPc2lYV6UK0sq
         U/Nks984csXiwVhuSnoX8QdDSIX2eQhY/nlIbyExquZAyjq0tOef9XTIxeMxoXqntqwI
         pIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137289; x=1687729289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7MnQuq2xCXKkoneCObkD2MWK2OHusd2oVYCX6UiHsY=;
        b=AVuRivUpz0h0hOtci7C1fNy0zJ25Wl5TkSnA5Zkko6lG+wRmCOssZ3/r9BuJo/vS/i
         RSLe8GEny6ZYct0EsOz7NO9G/cO5DuS1GY0IwPhHZ+8HrOhpY+Ru71s/X4CU2+rKT4LK
         tUfUpQsD9cENLVhCXrKLw9leJrBb893W5lA3Sy6WO6UPe9rq5Qo2H3wjih6D7/JdUJ+8
         vmJ8Av+6iKvIHN+ETlbvkV0yxlejtYP44ony/5Far9aMkuyMW835LC/Wwdub4/PNjWs8
         uO+YtFjOkkGXMnJgImWSARcd4b2N75AmoCxiCbFJxQIKLbIq52+BCk2QaCa2k8gLtAPY
         tz8A==
X-Gm-Message-State: AC+VfDy9ZAU7DtgHb0tGQV725qJuEFhHKaajVmf4XZYQbq3rXP10dP5/
        rFwHxQwP/lgzTyrvyOwD2PNmPFUeaKQ8u5tsgR0=
X-Google-Smtp-Source: ACHHUZ6/Dd8FAn51ISZ07qfPMZZahniDuofUK36eY9uRl+9Fe+Fa8ndWLuDKbX+WswG8sxx/k8qgRg==
X-Received: by 2002:a2e:a30d:0:b0:2b0:2bf6:1448 with SMTP id l13-20020a2ea30d000000b002b02bf61448mr1073333lje.47.1685137289070;
        Fri, 26 May 2023 14:41:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id y7-20020a2e7d07000000b002ad8174d025sm942783ljc.122.2023.05.26.14.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 14:41:28 -0700 (PDT)
Message-ID: <cfb7057f-5a18-d777-8acf-f99ce2cbf7c4@linaro.org>
Date:   Fri, 26 May 2023 23:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
 <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
 <869ed07a-1f9c-75dc-8250-e9533f3d5b88@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <869ed07a-1f9c-75dc-8250-e9533f3d5b88@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 26.05.2023 23:39, Caleb Connolly wrote:
> 
> 
> On 26/05/2023 20:46, Konrad Dybcio wrote:
>>
>>
>> On 24.05.2023 19:38, Caleb Connolly wrote:
>>> Add a node for the smb2 charger hardware found on the pmi8998 pmic
>>> following the DT bindings.
>>>
>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>>> index be6f60bfc26c..73f51451d21d 100644
>>> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>>> @@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
>>>  		#address-cells = <1>;
>>>  		#size-cells = <0>;
>>>  
>>> +		pmi8998_charger: charger@1000 {
>>> +			compatible = "qcom,pmi8998-charger";
>>> +			reg = <0x1000>;
>>> +
>>> +			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
>>> +				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
>>> +				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
>>> +				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
>>> +			interrupt-names = "usb-plugin",
>>> +					  "bat-ov",
>>> +					  "wdog-bark",
>>> +					  "usbin-icl-change";
>>> +
>>> +			io-channels = <&pmi8998_rradc 3>,
>>> +				      <&pmi8998_rradc 4>;
>>> +			io-channel-names = "usbin_i", "usbin_v";
>> Are these hard-wired internally?
> 
> Yes, features like AICL (automatic input current limiting - where the
> device pulls more and more current until the input voltage drops) are
> run autonomously and dont rely on the driver to tell the charger block
> what the readings are.
> 
> This is only used to expose the voltage/current values to userspace via
> the standard psy interface.
OK cool 

Konrad
>>
>> Konrad
>>> +
>>> +			status = "disabled";
>>> +		};
>>> +
>>>  		pmi8998_gpios: gpio@c000 {
>>>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>>>  			reg = <0xc000>;
>>>
> 
