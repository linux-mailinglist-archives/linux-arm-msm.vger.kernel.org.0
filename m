Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00087665880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjAKKEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239046AbjAKKDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:03:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856FC1275D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:00:05 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id co23so14482526wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHFLpuEbHn5O/eRn/OHeYJ4wcQ6vZVy0RjUqoAeIQr8=;
        b=p4kZIWBXjKnNEnQbZ0fpZSn4fTbrYIHqbX/kba7kE+hl7DL2oMPpqpXyisxaNOzB9S
         iTpJe6o17GzjELiFYdcpMEFqj5i+jigPGTkTAXroQhld3daFhd6ILRyZc9MLEIiZgMq/
         cb9UQrKn1LzZtyrMhnS4neJjxQTmy7HR2UtGnFkdkpKb16nwqULZgj5/YuHihcRu/tgs
         J4r5aFRx/fIYAzqc/n+Uz0onlcxeTh4+76hFKwdWs0l2JYaq5vOc7C/4NORmmW6/0e9l
         refaukInGEqv6aIH3TbADC2zRaS8kOBm9Z/tQzEJj65uRB/V0o/v/TLi3huvHCZuG9z2
         vXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHFLpuEbHn5O/eRn/OHeYJ4wcQ6vZVy0RjUqoAeIQr8=;
        b=AjGdF9Ctbfn1/VpQy9OyqgFhypjtFARitdiljId1fb5KB3KHafwad67XNHy/BtZJ1t
         EAmjE/2R3mVwjowbuGc+NVJ6thWQpXwbNoIImpu5Vb9hlAVQ4cv4nTJFjdM1R7RMk9i7
         RtIW4W5Ek/Mg0AXeG2+fit+I4bc5VDBBADg+5zIRWjzhUFpa+FRpkoNZaXO87tqMIdxo
         hMnGmAYzjpPBB2fN1XHizY80Rg8z7JpC6FTo+ne0Lj05w3+nYZ/cb5LlAh9C0DoRF6bY
         Q+Q2be6Ts4tpqflCzYV22zzrcjxEcuVzciT3sb8gQ6SU5FOoyHVjq4mHuDwhZATfmac2
         WY0Q==
X-Gm-Message-State: AFqh2kq+3oWzpO3sxDdvqtbXT3yyZ0cgFXjiVdrHyPFVtYEkViN9q1F6
        i9kqWtmKNPxnmSa+iA610uFhPA==
X-Google-Smtp-Source: AMrXdXt4YiGzZXxuSghw/ccEsIy4IXNNLKGOLSs7v/Gy0EX8MF8/kq2YYslS9dw/FxEYUncF3xdmqg==
X-Received: by 2002:a5d:54ce:0:b0:242:7048:51c6 with SMTP id x14-20020a5d54ce000000b00242704851c6mr43746788wrv.20.1673431204108;
        Wed, 11 Jan 2023 02:00:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d44d2000000b002368f6b56desm16041249wrr.18.2023.01.11.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 02:00:03 -0800 (PST)
Message-ID: <c5dc8042-717b-22eb-79f6-d18ab10d6685@linaro.org>
Date:   Wed, 11 Jan 2023 11:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add TCSR halt register space
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1673428818-26112-1-git-send-email-quic_mojha@quicinc.com>
 <ab6a99da-e91b-20de-3126-3f1f94ce277b@linaro.org>
In-Reply-To: <ab6a99da-e91b-20de-3126-3f1f94ce277b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/01/2023 10:59, Krzysztof Kozlowski wrote:
> On 11/01/2023 10:20, Mukesh Ojha wrote:
>> Add TCSR register space and refer it from scm node, so that
>> it can be used by SCM driver.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 5704750..e0fa733 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -270,6 +270,7 @@
>>  	firmware {
>>  		scm: scm {
>>  			compatible = "qcom,scm-sm8450", "qcom,scm";
>> +			qcom,dload-mode = <&tcsr 0x13000>;
>>  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
>>  			#reset-cells = <1>;
>>  		};
>> @@ -1986,6 +1987,11 @@
>>  			#hwlock-cells = <1>;
>>  		};
>>  
>> +		tcsr: syscon@1fc0000 {
>> +			compatible = "syscon";
> 
> This is not allowed by itself. 

Eh, that was not proper English... I wanted to say: This is not allowed
on its own. You need specific compatible. ALWAYS.

> You should have warnings when running
> dtbs_check.
> 
> Best regards,
> Krzysztof
> 

Best regards,
Krzysztof

