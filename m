Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A66680B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 11:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbjA3K7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 05:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbjA3K7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 05:59:01 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D866585
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:58:59 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso7837762wmq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=crdBLJjZ8xjVRAu8KJba7OYDgK3CPZF1IA5JdFdJbwU=;
        b=g2Q0Ff4zAeNuvtFeFpbpYdAQd9H0Mxx3aXygc7KzaUDNoB4tQ172cm6fGO0Tqt1/X6
         sy+eKO/mN68xD640n0qiJOcnuXssb7xiFcuR7NDaCpKD17SG7KmkB1svAgtlMMztdJaX
         qlM3WANBedE4GZDUfQQlz3tMFDMsBAdyb17CtOLwQ/I+VRlaWPcg9f3j+D5W62+7MoAz
         LEdnoLyZ3OZlWG/7IKjwnarJQV5MeCxxyIUDhHLOfwCmAPHns/t2K8xo/5XiveorLaY6
         G5er5ZPvwmuka6MUoNMY/6+Xg6p8UDU84J3odI60gsyQ9b3n+k7YcKVJX/XV1HcaPfH9
         0fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crdBLJjZ8xjVRAu8KJba7OYDgK3CPZF1IA5JdFdJbwU=;
        b=oZ3aGIG6kzaANbjagxwh5wsCKUj97xmsd8fkR2px2PFKYXIPAAtnIwjNujROkRYagP
         39NJWIdZbN+nSJkDQrZEW5igT2D3ldsYKXFOzyxiPsvfqgVSZ3NMDjBcFEEeaqD9qACL
         zJ8s2qc2ycCV6B8p8kwunRxs4FaIld0z/W2bpEPgsVTRAE9D+MgKf4bcE6ufcmV3x3gC
         Xk0SGFV5tQR31TjIxhU3rID9EAfNJ0H7MDudRtPdyKiql3eRRdaKfQIxy+2r/ZgpK9x9
         LHO/OU1WLe0hU9K7dd7cqB3MojGDYHY7POWd3YaD/U6A2MlaE3LSl2OkTtgoHReZMKLR
         /qkw==
X-Gm-Message-State: AO0yUKV6SnJJv/tb4DBYGm/26hicxrmyA3Fna4IJmWC0ObHhtC9YoIJ7
        25oqQ4vmanl6O0fK3JbP6P9vjQ==
X-Google-Smtp-Source: AK7set+TP4uDjfgYi/r+gKabtLWtFYwZugrC1KUC0d8m1femfHdRjJcqAi/edEDKkxvgOQFk10c9qQ==
X-Received: by 2002:a7b:c4d6:0:b0:3dc:5674:66e6 with SMTP id g22-20020a7bc4d6000000b003dc567466e6mr4107666wmk.25.1675076338341;
        Mon, 30 Jan 2023 02:58:58 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c349300b003cfa622a18asm16544888wmq.3.2023.01.30.02.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:58:57 -0800 (PST)
Message-ID: <6cde6bce-ce28-2dd0-1f16-4868ae93fb3f@linaro.org>
Date:   Mon, 30 Jan 2023 11:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: add pmic glink node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v1-5-0b0acfad301e@linaro.org>
 <1c3fa66b-651f-c3c1-1751-af3f43c86c49@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <1c3fa66b-651f-c3c1-1751-af3f43c86c49@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 11:40, Konrad Dybcio wrote:
> 
> 
> On 30.01.2023 10:54, Neil Armstrong wrote:
>> Add the pmic glink node linked with the DWC3 USB controller
>> switched to OTG mode and tagged with usb-role-switch.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Missing commit message

??

> 
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 34 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index 5bdc2c1159ae..5ab12c911bfe 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -87,6 +87,31 @@ lt9611_3v3: lt9611-3v3-regulator {
>>   		enable-active-high;
>>   	};
>>   
>> +	pmic-glink {
>> +		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
>> +
> You could remove this newline
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
> And add one here
> 
>> +				port@0 {
>> +					reg = <0>;
> And here
> 

Ack

>> +					pmic_glink_dwc3_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>   	vph_pwr: vph-pwr-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vph_pwr";
>> @@ -724,7 +749,14 @@ &usb_1 {
>>   };
>>   
>>   &usb_1_dwc3 {
>> -	dr_mode = "peripheral";
>> +	dr_mode = "otg";
>> +	usb-role-switch;
>> +
>> +	port {
> Hm, maybe this could be moved to 8450 dtsi?

Nop because it depends on the board layout, I think dr_mode
and eventual connector description should really stay in
the board dts.

Thanks,
Neil

> 
> Konrad
>> +		usb_1_dwc3_out: endpoint {
>> +		      remote-endpoint = <&pmic_glink_dwc3_in>;
>> +	      };
>> +	};
>>   };
>>   
>>   &usb_1_hsphy {
>>

