Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6CD24FEBAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiDMABL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 20:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiDMABK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 20:01:10 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC09A13F49
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:58:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c7so365924wrd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FL3dQ5oq8uwKlQGOuD2PIcyWr8wH6ZhoQGF6m+YuFGk=;
        b=bKsQuGJSyZpNV2iwcTDoDX/oUuDryKo+A6OKIFj4Sm2NQI35/VXWQlYDFAMeY9b9Px
         xkcKGwXLjYPKZFfORSpc1rWz6ot3gG4koVlxsgjAxFrcCbBPg6/c+pr8oN8qxfZviTTo
         BpLqHIvX5tOT9a4rc+C9TvEazIoBDSAxZuBN2VDMT8bT+jR9gGwj2fGdUWlhIcQUpn78
         +qRTZNq8GE68NicrAyXuKkgPwkdij4Yi4oSbxb/gAcehi7k4MQfnPYDFZ8TZ8Z7hpADV
         DdF8XubM/+1wj53ptuxwzXDUmGxL6O78Q2ihxSOD6S+8kRENM1Irqv/cX2tnx/zRZ6OB
         vJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FL3dQ5oq8uwKlQGOuD2PIcyWr8wH6ZhoQGF6m+YuFGk=;
        b=EOQC2ycgQPJBJ1pqBELI6AKLTsX6rqE2i2cprF26x6hV7GlI/T2cnIhjaoYdEafFIx
         HXpVSOphpxPe+Oa83oKoBScVeKSYXwyci2UScASmcJoIwE8VJ+qMdob7jLoft07oeDiv
         BqOzh+xtwYeECTHc1fk5AsSEko+sbCWS9OemcOiJOm1RXn2+Z7z5L7qPTciSUA0/Dlqa
         AnUao7ayzy4ZudulDvlIzSVZwiqOHVWQ1EB8YkYFyyoPTH/WHY9v6SO4ZkIVNi/dbmaB
         A8PXUev2tWfZO5kffPidHc8zEbEvtzIODma3IkO1Z1N/YEc1VhE9PzFcgDB9fkD99KyW
         yCoQ==
X-Gm-Message-State: AOAM530S0oSXorvRDxgyUcAdh5+w7/0LMMEC0IvbVErG2d+8c40X95Kj
        tPYNVb5czKBDLs6ZkcU73E/Z7A==
X-Google-Smtp-Source: ABdhPJxvJceWes8rQxej61V9yXxR0CfMae+EkznDKTLXl3NN52tsdR1osiiCXHAvoqqAxjTl0uIHJg==
X-Received: by 2002:adf:ed81:0:b0:207:a82a:bcf1 with SMTP id c1-20020adfed81000000b00207a82abcf1mr8662784wro.194.1649807928430;
        Tue, 12 Apr 2022 16:58:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a1ca301000000b0038ea15d5f75sm780387wme.38.2022.04.12.16.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 16:58:48 -0700 (PDT)
Message-ID: <46d73e5f-3d8c-e260-5fae-f976660432b6@linaro.org>
Date:   Wed, 13 Apr 2022 00:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: camss: Add CCI definitions
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
 <20220409164556.2832782-5-bryan.odonoghue@linaro.org>
 <YlTeng8OcnvUnILZ@builder.lan>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YlTeng8OcnvUnILZ@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 03:06, Bjorn Andersson wrote:
> On Sat 09 Apr 11:45 CDT 2022, Bryan O'Donoghue wrote:
> 
>> sm8250 has two CCI busses with two I2C busses apiece.
>>
>> Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
>> Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 91ed079edbf7..98e96527702b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -3150,6 +3150,88 @@ videocc: clock-controller@abf0000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		cci0: cci@ac4f000 {
>> +			compatible = "qcom,sm8250-cci";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			reg = <0 0x0ac4f000 0 0x1000>;
>> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>> +			power-domains = <&camcc TITAN_TOP_GDSC>;
>> +
>> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +				 <&camcc CAM_CC_CCI_0_CLK>,
>> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
>> +			clock-names = "camnoc_axi",
>> +				      "slow_ahb_src",
>> +				      "cpas_ahb",
>> +				      "cci",
>> +				      "cci_src";
>> +
>> +			pinctrl-names = "default", "sleep";
>> +			pinctrl-0 = <&cci0_default &cci1_default>;
>> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> 
> I would prefer that you include these in the same patch.

You mean CAMSS and CCI in the one patch ?
Sure.

> 
>> +
>> +			status = "disabled";
>> +
>> +			cci_i2c0: i2c-bus@0 {
>> +				reg = <0>;
>> +				clock-frequency = <1000000>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>> +
>> +			cci_i2c1: i2c-bus@1 {
>> +				reg = <1>;
>> +				clock-frequency = <1000000>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>> +		};
>> +
>> +		cci1: cci@ac50000 {
>> +			compatible = "qcom,sm8250-cci";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			reg = <0 0x0ac50000 0 0x1000>;
>> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
>> +			power-domains = <&camcc TITAN_TOP_GDSC>;
>> +
>> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +				 <&camcc CAM_CC_CCI_1_CLK>,
>> +				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
>> +			clock-names = "camnoc_axi",
>> +				      "slow_ahb_src",
>> +				      "cpas_ahb",
>> +				      "cci",
>> +				      "cci_src";
>> +
>> +			pinctrl-names = "default", "sleep";
>> +			pinctrl-0 = <&cci2_default &cci3_default>;
>> +			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
>> +
>> +			status = "disabled";
>> +
>> +			cci_i2c2: i2c-bus@0 {
> 
> Are these names (the label) used somewhere in the schematics? How about
> cci0_i2c0 and cci1_i2c0 instead (unless these names are defined by some
> documentation)?

Schematic just says cci_i2c_sda0, cci_i2c_sda3 and so on.

I'll rename.

---
bod
