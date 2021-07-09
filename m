Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EDE3C2742
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 18:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhGIQGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 12:06:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39470 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231976AbhGIQGV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 12:06:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625846618; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IK9Kd76pLQ3Ln42D8e+6CnQbd+P/M6MyiIInApuyPDs=;
 b=ORj2OtiOthwFf3tzEyDorW3ZNgIJQze10WXXYjQNnWIN7JnzzP2GPUqw6HCwWAK0nFoZnw0X
 QCihQv08mrDTShe3L36Yo+gCE/8ELNVSiVWtMOYpYMgx4UNkeEyiDB2VHjNtkF81zSHVR2RK
 At5biTV99745aKxL7TF/PHO3WZ8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60e8731e3a8b6d0a45700dfb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 16:02:38
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 287C2C4323A; Fri,  9 Jul 2021 16:02:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 331E4C433D3;
        Fri,  9 Jul 2021 16:02:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Jul 2021 21:32:37 +0530
From:   sbhanu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V5] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <CAE-0n51KMizwJNTGJrD_HVVi2viZ8vh8OxE+N06Uv6p-MUd72w@mail.gmail.com>
References: <1624804950-3668-1-git-send-email-sbhanu@codeaurora.org>
 <CAE-0n51KMizwJNTGJrD_HVVi2viZ8vh8OxE+N06Uv6p-MUd72w@mail.gmail.com>
Message-ID: <5a5f7dc7b7312f25b6c37f95aceb0803@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-09 05:40, Stephen Boyd wrote:
> Quoting Shaik Sajida Bhanu (2021-06-27 07:42:30)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a8c274a..c3e8740e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -436,6 +441,60 @@
>>                         #mbox-cells = <2>;
>>                 };
>> 
>> +               sdhc_1: sdhci@7c4000 {
>> +                       compatible = "qcom,sc7280-sdhci", 
>> "qcom,sdhci-msm-v5";
> 
> Is qcom,sc7280-sdhci compatible documented somewhere?
Yes, please find the link below:
https://patchwork.kernel.org/project/linux-arm-msm/patch/1623835207-29462-1-git-send-email-sbhanu@codeaurora.org/
> 
>> +                       status = "disabled";
>> +
>> +                       reg = <0 0x007c4000 0 0x1000>,
>> +                             <0 0x007c5000 0 0x1000>;
>> +                       reg-names = "hc", "cqhci";
>> +
>> +                       iommus = <&apps_smmu 0xc0 0x0>;
>> +                       interrupts = <GIC_SPI 652 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 656 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +                       clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>> +                                <&gcc GCC_SDCC1_AHB_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "core", "iface", "xo";
>> +                       interconnects = <&aggre1_noc MASTER_SDCC_1 0 
>> &mc_virt SLAVE_EBI1 0>,
>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>> &cnoc2 SLAVE_SDCC_1 0>;
>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>> +                       power-domains = <&rpmhpd SC7280_CX>;
>> +                       operating-points-v2 = <&sdhc1_opp_table>;
>> +
>> +                       bus-width = <8>;
>> +                       supports-cqe;
>> +
>> +                       qcom,dll-config = <0x0007642c>;
>> +                       qcom,ddr-config = <0x80040868>;
>> +
>> +                       mmc-ddr-1_8v;
>> +                       mmc-hs200-1_8v;
>> +                       mmc-hs400-1_8v;
>> +                       mmc-hs400-enhanced-strobe;
>> +
>> +                       sdhc1_opp_table: sdhc1-opp-table {
> 
> Please make it
> 
> 	sdhc1_opp_table: opp-table {
Sure
> 
> 
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-100000000 {
>> +                                       opp-hz = /bits/ 64 
>> <100000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                       opp-peak-kBps = <1800000 
>> 400000>;
>> +                                       opp-avg-kBps = <100000 0>;
>> +                               };
>> +
>> +                               opp-384000000 {
>> +                                       opp-hz = /bits/ 64 
>> <384000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       opp-peak-kBps = <5400000 
>> 1600000>;
>> +                                       opp-avg-kBps = <390000 0>;
>> +                               };
>> +                       };
>> +
>> +               };
>> +
>>                 qupv3_id_0: geniqup@9c0000 {
>>                         compatible = "qcom,geni-se-qup";
>>                         reg = <0 0x009c0000 0 0x2000>;
>> @@ -1035,6 +1094,51 @@
>>                         };
>>                 };
>> 
>> +               sdhc_2: sdhci@8804000 {
>> +                       compatible = "qcom,sc7280-sdhci", 
>> "qcom,sdhci-msm-v5";
>> +                       status = "disabled";
>> +
>> +                       reg = <0 0x08804000 0 0x1000>;
>> +
>> +                       iommus = <&apps_smmu 0x100 0x0>;
>> +                       interrupts = <GIC_SPI 207 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 223 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +                       clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>> +                                <&gcc GCC_SDCC2_AHB_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "core", "iface", "xo";
>> +                       interconnects = <&aggre1_noc MASTER_SDCC_2 0 
>> &mc_virt SLAVE_EBI1 0>,
>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>> &cnoc2 SLAVE_SDCC_2 0>;
>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>> +                       power-domains = <&rpmhpd SC7280_CX>;
>> +                       operating-points-v2 = <&sdhc2_opp_table>;
>> +
>> +                       bus-width = <4>;
>> +
>> +                       qcom,dll-config = <0x0007642c>;
>> +
>> +                       sdhc2_opp_table: sdhc2-opp-table {
> 
> Please make it
> 
> 	sdhc2_opp_table: opp-table {
Sure
> 
> 
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-100000000 {
>> +                                       opp-hz = /bits/ 64 
>> <100000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                       opp-peak-kBps = <1800000 
>> 400000>;
>> +                                       opp-avg-kBps = <100000 0>;
>> +                               };
>> +
>> +                               opp-202000000 {
>> +                                       opp-hz = /bits/ 64 
>> <202000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       opp-peak-kBps = <5400000 
>> 1600000>;
>> +                                       opp-avg-kBps = <200000 0>;
>> +                               };
>> +                       };
>> +
>> +               };
>> +
>>                 dc_noc: interconnect@90e0000 {
>>                         reg = <0 0x090e0000 0 0x5080>;
>>                         compatible = "qcom,sc7280-dc-noc";
