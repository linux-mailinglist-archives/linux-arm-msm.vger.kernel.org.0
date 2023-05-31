Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8BE71739F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbjEaCTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjEaCTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:19:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5161EEC
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:19:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so5819208e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685499578; x=1688091578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fN9aqmrxQ0R29i8ZMSEVgAodlzY7fIN8k4E+hWiYua4=;
        b=Yu0k7DfaF+CjbbjAsgIoAWRJUsJDn3fYOqPHRomQc5bGpNbledbio/ovuAEo4JVbTa
         GR9mIwZ2qP6cpoQeqCxLm5yhb8Yt4HgycM8v19w1DcpqLdGeyPVz+F0D7V6TomgwHGsB
         v+h4ppVOFnnsvonChJvBlypZpany7u3EUxxZxRGtKgeep6u6wt2uhp253OW9sibVL5+3
         pb6xwelvD30CEDf6XPmBPAlhaBN8h4LkOQXACPoTr1Nz5/Q5hUxIyZiBv+8D1Tbf0Ng3
         GitWgm+DkbAsbfUCqg0S+5+8TOF+PSGLwPZV8Piw15G0r7D7ZK5OS7YemTGJqz5PCbnL
         6VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685499578; x=1688091578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN9aqmrxQ0R29i8ZMSEVgAodlzY7fIN8k4E+hWiYua4=;
        b=jhaTLyQ0mueni7DiAYiLYYE6ki1rsK14+BvQu2aF6EgLj6TIJvnxuK/7NboA2/HYBp
         YDJBfXVnwG0DYgsPsHAKiIxg7CYYLlP6xyak6Vjk/H2X+Aply7rbhyJltsmZP+yqit/m
         MHEpFhkBF+9RKgQneDD5MXRc2fkl8Hkvd21CRlCBenA8oqXKxbjh4LdajFO+/EeHsFIz
         XFuK/F0fcVvMVCjH8LjKpxI5X8JArYGvr6K7J0/miUv+xCzZJqAOeUQRiT85d514IXxB
         /GdP5LBR3MXsofHjroMyfuvqtCvkAtwK6EkHeAA0Fz5PjLBdv45+yHNmfJiKfYm2amzR
         I1Zg==
X-Gm-Message-State: AC+VfDxohVfevHdgLM0z28MmUz8aKAFyQbTxDlW1RBGL4I3yBpjXaZFl
        zTBmV6QS6z9ZvXprQXbgavYv1G6b/rOZxiJSiao=
X-Google-Smtp-Source: ACHHUZ6qT/NkJ1Uux+udyXNWeciXyj/LGACl8oPC99tdXdFvmrqUM2rf6r66WUWjYOiG3bgKOrM5Kg==
X-Received: by 2002:a05:6512:509:b0:4ea:e60a:2f5d with SMTP id o9-20020a056512050900b004eae60a2f5dmr1606834lfb.40.1685499578593;
        Tue, 30 May 2023 19:19:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d13-20020ac25ecd000000b004ecad67a925sm524437lfq.66.2023.05.30.19.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 19:19:38 -0700 (PDT)
Message-ID: <6c3e150e-5d61-a73c-03a7-a53f1c12ec22@linaro.org>
Date:   Wed, 31 May 2023 05:19:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-GB
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
 <20230521193635.3078983-4-dmitry.baryshkov@linaro.org>
 <448257f2-1b7d-5ec1-5847-94024dac6208@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <448257f2-1b7d-5ec1-5847-94024dac6208@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 30/05/2023 17:09, Caleb Connolly wrote:
> 
> 
> On 21/05/2023 20:36, Dmitry Baryshkov wrote:
>> The first USB PHY on the sm8150 platform is really the USB+DP combo
>> PHY. Add the DP part of the PHY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index 2273fa571988..1f442e1be63a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3399,20 +3399,19 @@ usb_2_hsphy: phy@88e3000 {
>>   		};
>>   
>>   		usb_1_qmpphy: phy@88e9000 {
>> -			compatible = "qcom,sm8150-qmp-usb3-phy";
>> +			compatible = "qcom,sm8150-qmp-usb3-dp-phy";
> 
> Subnodes need to be renamed to usb3-phy and dp-phy respectively,
> otherwise this fails to probe for me.

Thanks for the test! I'll fix it in v3.

> 
> With that, for the series:
> 
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
>>   			reg = <0 0x088e9000 0 0x18c>,
>> -			      <0 0x088e8000 0 0x10>;
>> +			      <0 0x088e8000 0 0x38>,
>> +			      <0 0x088ea000 0 0x40>;
>>   			status = "disabled";
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   			ranges;
>> -
>>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>   				 <&rpmhcc RPMH_CXO_CLK>,
>>   				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>   				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>>   			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
>> -
>>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>   			reset-names = "phy", "common";
>> @@ -3430,6 +3429,16 @@ usb_1_ssphy: phy@88e9200 {
>>   				clock-names = "pipe0";
>>   				clock-output-names = "usb3_phy_pipe_clk_src";
>>   			};
>> +
>> +			usb_1_dpphy: phy@88ea200 {
>> +				reg = <0 0x088ea200 0 0x200>,
>> +				      <0 0x088ea400 0 0x200>,
>> +				      <0 0x088eaa00 0 0x200>,
>> +				      <0 0x088ea600 0 0x200>,
>> +				      <0 0x088ea800 0 0x200>;
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +			};
>>   		};
>>   
>>   		usb_2_qmpphy: phy@88eb000 {
> 

-- 
With best wishes
Dmitry

