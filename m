Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBFE4F2324
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 08:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiDEGcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 02:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiDEGcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 02:32:22 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386798E193;
        Mon,  4 Apr 2022 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649140219; x=1680676219;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=KEL2Yv3B6oTBc+P8ACLTVyamtRKvNdJMIqI262BfDMQ=;
  b=SwTdz5sLr3N1edsor62/LZbtBvMeHNKaD9AhQUyEHPKn8nz7COcgbtZL
   LmpdlkCoFSC/YCytYvYmuuwBo/7AxIzl0W12joJWePmrn0q8b534anyCb
   lmHWBKwIrO1O4lVprAlfDl/IL3oBVkrnzqZhShrRAxlFSqipLHJssIe8S
   A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 04 Apr 2022 23:30:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 23:30:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 23:30:18 -0700
Received: from [10.50.5.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 4 Apr 2022
 23:30:15 -0700
Message-ID: <12f69c15-8cff-6e15-45a6-06fc3bc9112b@quicinc.com>
Date:   Tue, 5 Apr 2022 12:00:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Content-Language: en-US
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     Matthias Kaehlcke <mka@chromium.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20220328071057.2454-1-quic_mpubbise@quicinc.com>
 <YktHHOww7VkbIxfE@google.com>
 <abd0c3eb-38d3-6673-9e1a-6bf04755e5f2@quicinc.com>
In-Reply-To: <abd0c3eb-38d3-6673-9e1a-6bf04755e5f2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/5/2022 11:56 AM, Manikanta Pubbisetty wrote:
> 
> 
> On 4/5/2022 12:59 AM, Matthias Kaehlcke wrote:
>> On Mon, Mar 28, 2022 at 12:40:57PM +0530, Manikanta Pubbisetty wrote:
>>> Add DTS node for WCN6750 WiFi chipset.
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> ---
>>> Depends on:
>>> - 
>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20220328070701.28551-1-quic_mpubbise@quicinc.com/ 
>>>
>>> - 
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20220328060937.16738-2-quic_mpubbise@quicinc.com/ 
>>>
>>>
>>> Changes from V2:
>>> - Changes based on DT binding concerns
>>> - Rebased on ToT
>>>
>>> Changes from V1:
>>> - Corrected the case for hex values
>>>
>>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 ++++
>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi     | 46 ++++++++++++++++++++++++
>>>   2 files changed, 53 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>>> index 069ffbc37bc4..a82e9aa7bdc5 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>>> @@ -551,3 +551,10 @@ &remoteproc_wpss {
>>>       status = "okay";
>>>   };
>>> +&wifi {
>>> +    status = "okay";
>>> +    wifi-firmware {
>>> +        iommus = <&apps_smmu 0x1c02 0x1>;
>>> +    };
>>> +};
>>> +
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> index b757e8ad1199..dfd9fa077903 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> @@ -85,6 +85,11 @@ reserved-memory {
>>>           #size-cells = <2>;
>>>           ranges;
>>> +        wlan_ce_mem: memory@4cd000 {
>>> +            no-map;
>>> +            reg = <0x0 0x4cd000 0x0 0x1000>;
>>
>> Pad the address to 8 digits here (not in the node name).
> 
> Sure
> 
>>
>>> +        };
>>> +
>>>           hyp_mem: memory@80000000 {
>>>               reg = <0x0 0x80000000 0x0 0x600000>;
>>>               no-map;
>>> @@ -1808,6 +1813,47 @@ mmss_noc: interconnect@1740000 {
>>>               qcom,bcm-voters = <&apps_bcm_voter>;
>>>           };
>>> +        wifi: wifi@17a10040 {
>>> +            compatible = "qcom,wcn6750-wifi";
>>> +            reg = <0 0x17a10040 0 0x0>;
>>> +            iommus = <&apps_smmu 0x1c00 0x1>;
>>> +            interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
>>> +            qcom,rproc = <&remoteproc_wpss>;
>>> +            memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
>>
>> Where is 'wlan_fw_mem' added?
> 
> Sorry, did not understand your concern here.
> 

Well, I got your point. wlan_fw_mem is already present in SC7280.dtsi.


Thanks,
Manikanta
