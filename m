Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788DB501ED0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 01:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347417AbiDNXGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 19:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347410AbiDNXG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 19:06:29 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07987C162
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 16:04:02 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e21so8763202wrc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XTgCI++vUxDVOQZVzYb7thu0UPCWfw1XM85vzSbEL0w=;
        b=RAV2E6AQZM3njcsdP4eubB+VlQNShaqbU0cVdnQCzw/7o/Kv75QLOjXfc2/cO+E1jV
         cF2pNVJwZWOhE4TzgDllWTF701LRb2UiprsRvTQtd8yKAQvHuL015KvnZ8Bzhik/eoQ4
         2+oD2ruf9AvN22L4Njq0W7ketDCSqqa84YGMFRpILEd5aUuQInXuAtR9JDEJ7nuVlgOX
         8zFXntRw42PHXf/DuWhEBzjaO/SHxvZUzDq0hPw0EMgaRgJsQlTV/7qhb3DqSFYEkaOx
         jLqthDoFr3PR/YBnsRVk8slv1egFX2mVHSuorgPp+V6a5zu8aLW8/0HhWD7ProFCbjvj
         4XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XTgCI++vUxDVOQZVzYb7thu0UPCWfw1XM85vzSbEL0w=;
        b=b9jkUFQoAmjBTYolIIq2mwxKM9Ca2cpWcTpGXPV9ddtBwC3avaU7U3b8jDqfApkH5I
         LILJ2H24vFVqy2DaLNxnXuu5vjgIl1LMi+s4z46P8SLiNw29qZTBGA7Eo4MeWwUgJSFe
         0TFeuaEqfO3LmFHugzWN6t3pylDEvpH4d2Ay9wEhfxmjgSlMKrhu/NssUrHOqMr0GGmx
         5FvisKB1hzG3LzQLy9ZHjbqlSxI6Q9mrglySydUwCRLKBKc1Wh8XlsWYj/3Lk+1/3PhS
         7VxsXrxyScjK4jnbPRfT0QLtWmcVd1n/+4qoK4CuHNoIFui4fdmY4HjXHpmZn/HVUXtK
         1xCA==
X-Gm-Message-State: AOAM532r6Neya86L3nZ4WJ8zS2xfJtxODnfhSnHLaTfV8W2nFPMdDWDu
        Og9cz6wVgEH0l0gqd7XnGgFPsQ==
X-Google-Smtp-Source: ABdhPJwVeGzulm8BcXwmMExNcUIyPcqvLQ0Zk4b8H6HQkdhPB8oGqypPxXQ8B8B34MoELSLKfn7jbw==
X-Received: by 2002:adf:d083:0:b0:208:c159:5d33 with SMTP id y3-20020adfd083000000b00208c1595d33mr3466188wrh.692.1649977441486;
        Thu, 14 Apr 2022 16:04:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcc0b000000b0037e0c362b6dsm3315795wmh.31.2022.04.14.16.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 16:04:00 -0700 (PDT)
Message-ID: <3da19aeb-a79e-3d64-7c64-891af2cbb392@linaro.org>
Date:   Fri, 15 Apr 2022 00:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250: camss: Add CAMSS block
 definition
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
 <20220413231736.991368-3-bryan.odonoghue@linaro.org>
 <13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2022 08:45, Vladimir Zapolskiy wrote:
> Hi Bryan,
> 
> On 4/14/22 02:17, Bryan O'Donoghue wrote:
>> Adds a CAMSS definition block.
>>
>> Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
>> Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 153 +++++++++++++++++++++++++++
>>   1 file changed, 153 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 906bc8ed25b7..c69a8a88657a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -3150,6 +3150,159 @@ videocc: clock-controller@abf0000 {
>>               #power-domain-cells = <1>;
>>           };
>> +        camss: camss@ac6a000 {
>> +            compatible = "qcom,sm8250-camss";
>> +            status = "disabled";
>> +
>> +            reg = <0 0xac6a000 0 0x2000>,
>> +                  <0 0xac6c000 0 0x2000>,
>> +                  <0 0xac6e000 0 0x1000>,
>> +                  <0 0xac70000 0 0x1000>,
>> +                  <0 0xac72000 0 0x1000>,
>> +                  <0 0xac74000 0 0x1000>,
>> +                  <0 0xacb4000 0 0xd000>,
>> +                  <0 0xacc3000 0 0xd000>,
>> +                  <0 0xacd9000 0 0x2200>,
>> +                  <0 0xacdb200 0 0x2200>;
>> +            reg-names = "csiphy0",
>> +                    "csiphy1",
>> +                    "csiphy2",
>> +                    "csiphy3",
>> +                    "csiphy4",
>> +                    "csiphy5",
>> +                    "vfe0",
>> +                    "vfe1",
>> +                    "vfe_lite0",
>> +                    "vfe_lite1";
>> +
>> +            interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "csiphy0",
>> +                      "csiphy1",
>> +                      "csiphy2",
>> +                      "csiphy3",
>> +                      "csiphy4",
>> +                      "csiphy5",
>> +                      "csid0",
>> +                      "csid1",
>> +                      "csid2",
>> +                      "csid3",
>> +                      "vfe0",
>> +                      "vfe1",
>> +                      "vfe_lite0",
>> +                      "vfe_lite1";
>> +
>> +            power-domains = <&camcc IFE_0_GDSC>,
>> +                    <&camcc IFE_1_GDSC>,
>> +                    <&camcc TITAN_TOP_GDSC>;
>> +
> 
> do you need to add 'power-domain-names' property here as well?

I looked at this, I don't believe camss depends on it, sdm845 since it 
does dev_pm_domain_attach_by_id() instead of dev_pm_domain_attach_by_name()
> 
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc 
>> SLAVE_CAMERA_CFG>,
>> +                    <&mmss_noc MASTER_CAMNOC_HF &mc_virt SLAVE_EBI_CH0>,
>> +                    <&mmss_noc MASTER_CAMNOC_SF &mc_virt SLAVE_EBI_CH0>,
>> +                    <&mmss_noc MASTER_CAMNOC_ICP &mc_virt 
>> SLAVE_EBI_CH0>;
> 
> Recently there was a discussion on the list that interconnects are 2-cells,
> if so, the array above should be updated accordingly.

Hmm. The above NOC nodes are declared <1> for me, I'll look into this 
some more though.
