Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49A14148D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 14:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235869AbhIVMdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 08:33:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17160 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhIVMdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 08:33:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632313898; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=pt2yrnA6+3Wc8pd1t+1+J+v0xdubP3SmbXw+nblGZwI=; b=Bp2zf7F37TJ9VkHqykEzXOeweY61ne4KgXBGfGNegC5MrWj5Y9pkeJO1jqGPaXTWJeBbd9kg
 XlUb2FSFmCGP0e8x07WLdpqhvl+AB/pWMnSQbbEPK1YwzMlnyv0P+hQ3SSRhBuorR9h7ROjK
 Ab5SBimy3p1ahGXLXtgCKjXkl1E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614b2213bd6681d8ed03c3fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:31:15
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1FA14C4360D; Wed, 22 Sep 2021 12:31:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74B28C4338F;
        Wed, 22 Sep 2021 12:31:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Sep 2021 18:01:13 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V9 4/8] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <21d14dd0bfa945ee617ed4b86b4495ee@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 23:47, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-09-21 03:39:02)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 2fbcb0a..b65c5da 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -536,24 +555,425 @@
>>                 qupv3_id_0: geniqup@9c0000 {
>>                         compatible = "qcom,geni-se-qup";
>>                         reg = <0 0x009c0000 0 0x2000>;
>> -                       clock-names = "m-ahb", "s-ahb";
>>                         clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>>                                  <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +                       clock-names = "m-ahb", "s-ahb";
>>                         #address-cells = <2>;
>>                         #size-cells = <2>;
>>                         ranges;
>> +                       iommus = <&apps_smmu 0x123 0x0>;
>>                         status = "disabled";
>> 
>> +                       i2c0: i2c@980000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00980000 0 0x4000>;
>> +                               clocks = <&gcc 
>> GCC_QUPV3_WRAP0_S0_CLK>;
>> +                               clock-names = "se";
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_i2c0_data_clk>;
>> +                               interrupts = <GIC_SPI 601 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               interconnects = <&clk_virt 
>> MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
>> +                                               <&gem_noc 
>> MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
>> +                                               <&aggre1_noc 
>> MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
>> +                               interconnect-names = "qup-core", 
>> "qup-config",
>> +                                                       "qup-memory";
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       spi0: spi@980000 {
>> +                               compatible = "qcom,geni-spi";
>> +                               reg = <0 0x00980000 0 0x4000>;
>> +                               clocks = <&gcc 
>> GCC_QUPV3_WRAP0_S0_CLK>;
>> +                               clock-names = "se";
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_spi0_data_clk>, 
>> <&qup_spi0_cs>, <&qup_spi0_cs_gpio>;
> 
> This should only have qup_spi0_data_clk and qup_spi0_cs, not
> qup_spi0_cs_gpio. Both qup controlled and gpio controlled options are
> provided in case a board wants to use the qup version of chipselect, 
> but
> having them both used by default leads to conflicts and confusion. This
> same comment applies to all spi pinctrl properties in this file. Please
> keep the cs_gpio variants though so that boards can use them if they
> want. They will be unused, but that's OK.

Okay. Shall we remove only "<&qup_spiN_cs_gpio>" in each SPI node?

> 
>> +                               interrupts = <GIC_SPI 601 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               power-domains = <&rpmhpd SC7280_CX>;
>> +                               operating-points-v2 = 
>> <&qup_opp_table>;
>> +                               interconnects = <&clk_virt 
>> MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
>> +                                               <&gem_noc 
>> MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
>> +                               interconnect-names = "qup-core", 
>> "qup-config";
>> +                               status = "disabled";
>> +                       };
>> +
