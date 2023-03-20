Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22CA36C1D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 18:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbjCTRRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 13:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjCTRRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 13:17:08 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C9536693
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:13:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t15so11093392wrz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679332288;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=706WFCInGYoTO+FPwORemuFUi5ASSP3+w8lBv2dgJY0=;
        b=Gcri07HXDQZnMlez6E78X9YlaJbZ+LAdcQDJ42m6tVl0NQD7xi3zN7UTqa34epNHM7
         edK2CREx8HTMuySsavDwZdjg3+RWKxsvPOCYhKiTI+i6MSbMr4wXRc5oc4Mr0O44T1lM
         fFLWgDs4tMdeWmSkOgm97LKz7LO9KpgMedGeCUixNt68PzLSz39coD1Q5jxGw7XcWzoI
         hLaJ5JyTuweTRkQuklSe8TV4c96OKYWn8SdXb/EphxgvuX+pbCWVMCnREkXaeHi8AaMQ
         sOC30YgviU2O64ydvqLDHAcA6gVR6NF3VWv416H1UQhI+Y6fdxsdZFI/8XHnoR1GtDW4
         8iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332288;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=706WFCInGYoTO+FPwORemuFUi5ASSP3+w8lBv2dgJY0=;
        b=gCPn+77wWqyF/s/v4j2kZna3qmoIfWQHbgPZ1dSUADrz4UhzlZtH5oraLfClWzaZVr
         5DzxQL9pepiZQoLEEL2bEPe87tmkALSGIPhsc4Gc53RE/0DG9KezKd8Q72uQ2wMxm5x+
         rNiUAAr4iMNGEEgITzsN8QPWr3xuik/7gEpK6aAD3POK7I2SCJZ45lOGN/MGv31BeVT8
         Zc0ot4vZXqORm1PUgmpVB9tR/o/itqIbLbatd2XadTcn/TBfY7bFJKgFvJn9GKjyQVOS
         3hS5driMLd42jIgUvg4kLVp5D2JDZm+1AaNN7OyUOdl8rHeM5C0oJuX1Eh5aIRTE0Nz2
         lrvA==
X-Gm-Message-State: AO0yUKXkCbP8pIyPAb39dmh81T6QR1oU/mDe/Xpf2xCFshcZD26khHAN
        N3Ybbx0LfOIweAat8O48sZSr2g==
X-Google-Smtp-Source: AK7set+qBbsK8y3erVftw+UbVluDwKIM+MnwxIS2tnzu7s1GG+PMcB/ALTg8wu5jShtIOlAB4oRLlQ==
X-Received: by 2002:a5d:538b:0:b0:2cf:ea5f:6de with SMTP id d11-20020a5d538b000000b002cfea5f06demr83356wrv.14.1679332288535;
        Mon, 20 Mar 2023 10:11:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4f6f:868d:9c7b:5ab1? ([2a01:e0a:982:cbb0:4f6f:868d:9c7b:5ab1])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d4dcb000000b002cfe3f842c8sm9281174wru.56.2023.03.20.10.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:11:28 -0700 (PDT)
Message-ID: <0f878db9-a0da-f5f9-fe78-37551b85b268@linaro.org>
Date:   Mon, 20 Mar 2023 18:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink
 node
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
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v4-9-38bf0f5d07bd@linaro.org>
 <af8cd242-2a78-cac3-d307-ce6ab0810308@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <af8cd242-2a78-cac3-d307-ce6ab0810308@linaro.org>
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

On 18/03/2023 15:00, Konrad Dybcio wrote:
> 
> 
> On 17.03.2023 16:04, Neil Armstrong wrote:
>> Add the pmic glink node linked with the DWC3 USB controller
>> switched to OTG mode and tagged with usb-role-switch.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>>   &usb_1_dwc3 {
>> -	/* TODO: Define USB-C connector properly */
>> -	dr_mode = "peripheral";
>> +	dr_mode = "otg";
>> +	usb-role-switch;
>> +
>> +	ports {
> You created these in patch [6/12]!

Damn!

Thx!

Neil

> 
> Konrad
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			usb_1_dwc3_hs: endpoint {
>> +				remote-endpoint = <&pmic_glink_hs_in>;
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg = <1>;
>> +
>> +			usb_1_dwc3_ss: endpoint {
>> +				remote-endpoint = <&pmic_glink_ss_in>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&usb_1_dwc3_ss {
>> +	remote-endpoint = <&pmic_glink_ss_in>;
>>   };
>>   
>>   &usb_1_hsphy {
>>

