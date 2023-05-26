Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5235F712F00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243202AbjEZVjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237707AbjEZVjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:39:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A273FBC
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:39:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso8691875e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137184; x=1687729184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fr38gHrovEqvIDVjmJUcVz1yHKs2a68amocFg0XW5+I=;
        b=mz6LhGw+L2b0oy3zfwNffZyMgRGm9NTPoy9n3vmtvsi6I6X2OPbTFsn16Buj+rejy/
         Cl7n2yFtUdwBry6q/owM30XjthCsMRRiSQzo1b5UY67Uh1drhST2zZN+8mcOOa3OCMaY
         nHlLgHqYIafBxn6n/RAmvfOgoIu9B1QzXshPZA1Y1F4ag79LNriTaS8uspFNLio43U0b
         e0yuR1W123rZQ8hFiHdfMJuU2TbSSkr7nMAiC4NaDlYjmdhCxfU5yWMPJQ6RKOXGp8ue
         OddpvLlaCzmVC8dgFq3UPcFOG7fwZ5aNskTrsMrdyFJQ04f25Crstlgh+m3lZe3FNDhc
         laBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137184; x=1687729184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr38gHrovEqvIDVjmJUcVz1yHKs2a68amocFg0XW5+I=;
        b=b9Pr5CvdjnQgfBKdphu5ruS4K4vTg70p/0cpZpdXF1mx6qXQ3WGvWJtMcKuOhtn/FN
         2rObHXyP+rJDL1rrICms0xh1bMiuI1aEFYJqgzrsj26o4cv6tB3qcL5KEFY+ugYYMid9
         Z5RsNxeIXbNnNe85WLWNo56snLACL1sed5r4h/U7SXU0H63cfHCBJ/9Z0v6BWiIfET8B
         QLPCc4Our8mjj+gOodXciQjuxvZtaAtbDhjYl5wi2vUumFXySToDm0bPIwJCak6SJgwy
         /oDTmEaF1rvQ59FhpBUH7XJYRSsxA6IUTt08BkTHyvwlgPj8iXQcoILS9OiKQ8POjYVr
         0CGQ==
X-Gm-Message-State: AC+VfDyeeQHNGWBtzafNGOT6wckdSJYMwGMQr7KDav8Fexw+6KHw+H7G
        m3Uv4j/1ivrIyMJV9a4+rhXKlg==
X-Google-Smtp-Source: ACHHUZ6sb0RcvontvHGTFeeFVWpYWfP6XcpLXn2gIyOgReaEDFza2qOvrIhPKacGPWqidQpHseAAUg==
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id g25-20020a7bc4d9000000b003f6024455e3mr2177603wmk.35.1685137184171;
        Fri, 26 May 2023 14:39:44 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id n26-20020a7bcbda000000b003f60482024fsm6346053wmi.30.2023.05.26.14.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 14:39:43 -0700 (PDT)
Message-ID: <869ed07a-1f9c-75dc-8250-e9533f3d5b88@linaro.org>
Date:   Fri, 26 May 2023 22:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26/05/2023 20:46, Konrad Dybcio wrote:
> 
> 
> On 24.05.2023 19:38, Caleb Connolly wrote:
>> Add a node for the smb2 charger hardware found on the pmi8998 pmic
>> following the DT bindings.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> index be6f60bfc26c..73f51451d21d 100644
>> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> @@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>>  
>> +		pmi8998_charger: charger@1000 {
>> +			compatible = "qcom,pmi8998-charger";
>> +			reg = <0x1000>;
>> +
>> +			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
>> +				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
>> +				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "usb-plugin",
>> +					  "bat-ov",
>> +					  "wdog-bark",
>> +					  "usbin-icl-change";
>> +
>> +			io-channels = <&pmi8998_rradc 3>,
>> +				      <&pmi8998_rradc 4>;
>> +			io-channel-names = "usbin_i", "usbin_v";
> Are these hard-wired internally?

Yes, features like AICL (automatic input current limiting - where the
device pulls more and more current until the input voltage drops) are
run autonomously and dont rely on the driver to tell the charger block
what the readings are.

This is only used to expose the voltage/current values to userspace via
the standard psy interface.
> 
> Konrad
>> +
>> +			status = "disabled";
>> +		};
>> +
>>  		pmi8998_gpios: gpio@c000 {
>>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>>  			reg = <0xc000>;
>>

-- 
// Caleb (they/them)
