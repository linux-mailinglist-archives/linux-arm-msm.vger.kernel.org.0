Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1611E41D944
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 13:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350663AbhI3L64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 07:58:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59892 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350656AbhI3L6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 07:58:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633003029; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MgsTdvHC32CVeXQvpvDOvg9iOpH6jzoyvVH+Vm7ZG44=;
 b=gyqmYa8nuFuRTaVZHRx3AcJrgMk/CmgjLfj+TAhU0YKvGeceBcwtlQ3PSOjdkzlA5HvHjHCO
 6ccNl9RAiBUQoTbuQzriRdvBFjGsn5C0xxfSYa5TQrg0x+JXuL7fqrqEy6ODZjbJvmhWhd9/
 LCb2/GJL9CR4lkOIEbWczS/a0fA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6155a60ca5a9bab6e879f250 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 11:57:00
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06212C4360D; Thu, 30 Sep 2021 11:57:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44068C4338F;
        Thu, 30 Sep 2021 11:56:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 30 Sep 2021 17:26:59 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        sbillaka@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        khsieh@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
In-Reply-To: <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
Message-ID: <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-19 01:27, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-08-18 03:27:02)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 53a21d0..fd7ff1c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -5,6 +5,7 @@
>>   * Copyright (c) 2020-2021, The Linux Foundation. All rights 
>> reserved.
>>   */
>> 
>> +#include <dt-bindings/clock/qcom,dispcc-sc7280.h>
>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/interconnect/qcom,sc7280.h>
>> @@ -1424,6 +1425,90 @@
>>                         #power-domain-cells = <1>;
>>                 };
>> 
>> +               mdss: mdss@ae00000 {
> 
> subsystem@ae00000
> 
>> +                       compatible = "qcom,sc7280-mdss";
>> +                       reg = <0 0x0ae00000 0 0x1000>;
>> +                       reg-names = "mdss";
>> +
>> +                       power-domains = <&dispcc 
>> DISP_CC_MDSS_CORE_GDSC>;
>> +
>> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                               <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +                       clock-names = "iface", "ahb", "core";
>> +
>> +                       assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_MDP_CLK>;
>> +                       assigned-clock-rates = <300000000>;
>> +
>> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +
>> +                       interconnects = <&mmss_noc MASTER_MDP0 0 
>> &mc_virt SLAVE_EBI1 0>;
>> +                       interconnect-names = "mdp0-mem";
>> +
>> +                       iommus = <&apps_smmu 0x900 0x402>;
>> +
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +
>> +                       status = "disabled";
>> +
>> +                       mdp: mdp@ae01000 {
> 
> display-controller@ae01000

Stephen,
    In the current driver code, there is a substring comparison for "mdp" 
in device node name as part of probe sequence. If "mdp" is not present 
in the node name, it will
    return an error resulting in probe failure. Can we continue using mdp 
as nodename instead of display controller?

Thanks,
Krishna


> 
>> +                               compatible = "qcom,sc7280-dpu";
>> +                               reg = <0 0x0ae01000 0 0x8f030>,
>> +                                       <0 0x0aeb0000 0 0x2008>;
>> +                               reg-names = "mdp", "vbif";
>> +
>> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                                       <&gcc GCC_DISP_SF_AXI_CLK>,
>> +                                       <&dispcc 
>> DISP_CC_MDSS_AHB_CLK>,
>> +                                       <&dispcc 
>> DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                                       <&dispcc 
>> DISP_CC_MDSS_MDP_CLK>,
>> +                                       <&dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>;
>> +                               clock-names = "bus", "nrt_bus", 
>> "iface", "lut", "core",
>> +                                             "vsync";
> 
> One line per string please.
> 
>> +                               assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_MDP_CLK>,
>> +                                               <&dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>,
>> +                                               <&dispcc 
>> DISP_CC_MDSS_AHB_CLK>;
>> +                               assigned-clock-rates = <300000000>,
>> +                                                       <19200000>,
>> +                                                       <19200000>;
>> +                               operating-points-v2 = 
>> <&mdp_opp_table>;
>> +                               power-domains = <&rpmhpd SC7280_CX>;
>> +
>> +                               interrupt-parent = <&mdss>;
>> +                               interrupts = <0>;
>> +
>> +                               status = "disabled";
>> +
>> +                               mdp_opp_table: mdp-opp-table {
> 
> mdp_opp_table: opp-table {
> 
>> +                                       compatible = 
>> "operating-points-v2";
>> +
>> +                                       opp-200000000 {
>> +                                               opp-hz = /bits/ 64 
>> <200000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                       };
>> +
>> +                                       opp-300000000 {
>> +                                               opp-hz = /bits/ 64 
>> <300000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_svs>;
>> +                                       };
>> +
>> +                                       opp-380000000 {
>> +                                               opp-hz = /bits/ 64 
>> <380000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_svs_l1>;
>> +                                       };
>> +
>> +                                       opp-506666667 {
>> +                                               opp-hz = /bits/ 64 
>> <506666667>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +
