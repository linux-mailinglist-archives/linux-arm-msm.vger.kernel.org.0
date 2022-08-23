Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB2F59E57F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 16:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242814AbiHWO6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 10:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242797AbiHWO6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 10:58:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6A130B258
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 05:23:39 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v10so13323994ljh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Mm23Cr8HEl/f8z2NbnP5gPlcQ1SGidUDgbaw6TnSuEI=;
        b=eO0kSUcdxnDpfsAXqXZwAQBlEnuSR9L9XkVtId/DXwHajDRA4C8uAfLxXeFNy70v5G
         BMLKm/t8SoPecGZCSWVBe+gpi7mZSslNjvtC5CxMJY9wXhrZUe3lYaKtaA82Y0Fo9SOZ
         EP6LcZ8jMTjBwpX+J2vFT5d0/6rCZoR0qagjnPiIQ9uGDXyA15l3X4aqIQini/3JP7ca
         vR1/ZTF55QL5gurVAd6FkFUZwnez+tj1AZsT08FjZcxy0OMJUqD3OITFPmjfVrdKSIs+
         DyGHbIEe75EKiCT8Lo/emvtLWJdxcfyiZbVMALnAg1pldyPyk9qKAF4dYUBRMCPAJWCu
         lrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Mm23Cr8HEl/f8z2NbnP5gPlcQ1SGidUDgbaw6TnSuEI=;
        b=CQDrApq0cK50vsRnzvY4Dtb1PZDw7WEPAo7nj5S2yUbh7l4DDxZE7EBrBPazrbiTou
         F741GSE/5SnzbvLAx3pQi0VDHuCXvVP1B77XleeIKMuTib/uHcrkZ8YRzHZ/X8c567eo
         uNhb93nUmvPeOZfssr32zQxGeUM9QZmXAvEgXftNCmMS2MRaeEsAdn4uub2X9V7eKuaZ
         qgTH6IRM6FS98QcrPoTuAMq/bQvbHaVXPC0ScKBwSR4t6doVoEgwhyyHscIBrG36rmEv
         vvRbNQs4kipBv6No9d9UZZknj1hNJ+v0Njgav64P3J+1k+91XYfqvyAZbXzFVp8OPUmi
         Nfyw==
X-Gm-Message-State: ACgBeo0XSGow219rdIsd+fZiyvYarFJPIQyS+lHabCf/qPO9Q95TftmH
        xdfl3P3KqL2e+gDPKroM3qtBIA==
X-Google-Smtp-Source: AA6agR6k3TdqJwhazU9fP3CHCzEFM6GA99ZIYW7mizzkXvOuvww6jvVC+1dKSu+UMH2SXfjgbVeliA==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr7243597ljh.78.1661257400528;
        Tue, 23 Aug 2022 05:23:20 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t17-20020a19dc11000000b0048b06f34566sm2474630lfg.76.2022.08.23.05.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 05:23:19 -0700 (PDT)
Message-ID: <11e20195-1383-d1e3-4715-8a1f110ed344@linaro.org>
Date:   Tue, 23 Aug 2022 15:23:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
 <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
In-Reply-To: <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 15:12, Krzysztof Kozlowski wrote:
> On 22/08/2022 15:03, Bryan O'Donoghue wrote:
>> We need to define pwm@bc000 to stop dtbs_check from making the following
>> complaint, text pruned.
>>
>> pmic@1: 'pwm' does not match any of the regexes:  'pwm@[0-9a-f]+$'
>>
>> Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>> index 606c2a6d1f0fc..d6922379729cb 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>> @@ -124,7 +124,7 @@ pm8916_1: pmic@1 {
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>>  
>> -		pm8916_pwm: pwm {
>> +		pm8916_pwm: pwm@bc00 {
>>  			compatible = "qcom,pm8916-pwm";
> 
> This does not look like proper fix.
> 1. It requires a reg.
> 2. reg is not allowed by pwm bindings.
> 
> See also other wrong commit:
> https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/
> 

and this:
https://lore.kernel.org/all/20220721195502.1525214-1-bhupesh.sharma@linaro.org/


Best regards,
Krzysztof
