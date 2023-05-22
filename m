Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C0370C549
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 20:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbjEVSiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 14:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjEVSiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 14:38:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD74B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 11:38:15 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so5233083e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684780694; x=1687372694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7g+eBWdXPpClWzwgE+9KC8dMIxNBnrOJ+PBoFojXwDU=;
        b=iMrFsTnQvHs2azUIRBShLKj+1/m+uYiDEh3lFC7fKyfiQ2Si0y6/yONmK9yEX2mKfY
         PESZWrg2BSbmqL2t5n/TUPv/nHj1BV/mhGm03cOU3GLrkTYQoGKYmgHpm8er2Oh+LISe
         ra9jNmrH4JEu0D2KDhgDq0f1ajkSYlyjmyD9sxeEm9wvsr8/WTiGMW7ilouBHDTWG8J1
         77D1uNOA8kls3K/LttvhXoSRJeFzbq50w+mQuVW+9GGCe5cLmhJ15uyGWCXQDM4LIvNn
         ADc1qUzb24fy7LAWvPF9shMtZHy6QUfekjwcdfcn6lNXxwOsOFtWoBDbhQOF6WdoaMl4
         Fjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684780694; x=1687372694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g+eBWdXPpClWzwgE+9KC8dMIxNBnrOJ+PBoFojXwDU=;
        b=fINkWS2eAa+COrSntwsbTGg1rQuFRfkXQg0juILjUAUsyDke8qU4l5ZAhY9s+Z5hEz
         2hjGmhIAmq02clV7T8/o72XpEtN1I12t84VzwkYTyG1A3/26u3m2dJKoXpBBkROruG4M
         uUodqBskU9DVaUbK0dqij9NTQQ13taVjlqEwZhmdYK+ah//FZJIL2ZH3lp0l3SmGMSB+
         CHc2gEdkmXSRuRZz7oCkFjhkPa3wtPRrbN/NzlLLTTWuUxqNujuzWI1CkmaHHNA1O3q9
         ryu9oEJ+E2TEQZy2bRLQSbjgkPvkN6eDecA6lr0V8D5kF/tr61ii/ZZZ6MZLOcP3O0xv
         xyIQ==
X-Gm-Message-State: AC+VfDw1HL+jdz+eIlfM3cl6ePS82HDBmy65W3NfP7vH0gFrO/Mx1mkf
        jnRcyUZ87u/NR/GieHsdzmVbjQ==
X-Google-Smtp-Source: ACHHUZ6I1qjJZwN+hTVMveXFNPlk35jCWxEx22+V+5Br2s5Gi2M7p+E667aAD+xd2QTCwVeIvuXyng==
X-Received: by 2002:a05:6512:49e:b0:4f1:4d66:ac96 with SMTP id v30-20020a056512049e00b004f14d66ac96mr3283290lfq.19.1684780693706;
        Mon, 22 May 2023 11:38:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b004f252f48e5fsm1079378lfc.40.2023.05.22.11.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 11:38:13 -0700 (PDT)
Message-ID: <844191d4-9a6b-605a-5d1a-cd4ad5dc98c9@linaro.org>
Date:   Mon, 22 May 2023 21:38:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/11] arm64: dts: qcom: msm8998: switch UFS QMP PHY to
 new style of bindings
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
 <20230521203834.22566-5-dmitry.baryshkov@linaro.org>
 <37f97ffc-01c1-797c-f50c-1680f666d79d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37f97ffc-01c1-797c-f50c-1680f666d79d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 19:59, Konrad Dybcio wrote:
> 
> 
> On 21.05.2023 22:38, Dmitry Baryshkov wrote:
>> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
>> resource region, no per-PHY subnodes).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 16 +++-------------
>>   1 file changed, 3 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index b150437a8355..848fbd2cb3f8 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -980,7 +980,7 @@ ufshc: ufshc@1da4000 {
>>   			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>   			reg = <0x01da4000 0x2500>;
>>   			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>> -			phys = <&ufsphy_lanes>;
>> +			phys = <&ufsphy>;
>>   			phy-names = "ufsphy";
>>   			lanes-per-direction = <2>;
>>   			power-domains = <&gcc UFS_GDSC>;
>> @@ -1021,11 +1021,8 @@ ufshc: ufshc@1da4000 {
>>   
>>   		ufsphy: phy@1da7000 {
>>   			compatible = "qcom,msm8998-qmp-ufs-phy";
>> -			reg = <0x01da7000 0x18c>;
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> +			reg = <0x01da7000 0x1000>;
>>   			status = "disabled";
>> -			ranges;
>>   
>>   			clock-names =
>>   				"ref",
>> @@ -1037,14 +1034,7 @@ ufsphy: phy@1da7000 {
>>   			reset-names = "ufsphy";
>>   			resets = <&ufshc 0>;
>>   
>> -			ufsphy_lanes: phy@1da7400 {
>> -				reg = <0x01da7400 0x128>,
>> -				      <0x01da7600 0x1fc>,
>> -				      <0x01da7c00 0x1dc>,
>> -				      <0x01da7800 0x128>,
>> -				      <0x01da7a00 0x1fc>;
>> -				#phy-cells = <0>;
>> -			};
>> +			#phy-cells = <0>;
> Looks like that will make status not-last?

It was not the last one beforehand, so I hesitated to move it. Let's fix it.

> 
> Konrad
>>   		};
>>   
>>   		tcsr_mutex: hwlock@1f40000 {

-- 
With best wishes
Dmitry

