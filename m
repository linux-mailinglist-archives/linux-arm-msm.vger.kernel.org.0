Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B344F2317
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 08:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiDEG3D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 02:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiDEG3B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 02:29:01 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449854BFC3;
        Mon,  4 Apr 2022 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649140024; x=1680676024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OZTYOhECTl6YZ1BctKm7e/sQa3mMU584mNSJQRfyeo8=;
  b=lnyhGtlN4WSxX8vC4qDEpolB3ZAlFfy4F4KlEVl5c6DfyoyVaYQd+7uc
   Uo5GsjchD2rNbzM3SGd57D1fDi9drqQ2avFeYuMjm2sGTe/SCVKwHiPNx
   hu+NhsTOKu3GbgrUnbrDPC3U9DnOi0M8U6Uh/z+XTV8IszlEwi4oKopN2
   M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 04 Apr 2022 23:27:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 23:27:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 23:27:03 -0700
Received: from [10.50.5.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 4 Apr 2022
 23:27:00 -0700
Message-ID: <abd0c3eb-38d3-6673-9e1a-6bf04755e5f2@quicinc.com>
Date:   Tue, 5 Apr 2022 11:56:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20220328071057.2454-1-quic_mpubbise@quicinc.com>
 <YktHHOww7VkbIxfE@google.com>
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <YktHHOww7VkbIxfE@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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



On 4/5/2022 12:59 AM, Matthias Kaehlcke wrote:
> On Mon, Mar 28, 2022 at 12:40:57PM +0530, Manikanta Pubbisetty wrote:
>> Add DTS node for WCN6750 WiFi chipset.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> ---
>> Depends on:
>> - https://patchwork.kernel.org/project/linux-arm-msm/patch/20220328070701.28551-1-quic_mpubbise@quicinc.com/
>> - https://patchwork.kernel.org/project/linux-wireless/patch/20220328060937.16738-2-quic_mpubbise@quicinc.com/
>>
>> Changes from V2:
>> - Changes based on DT binding concerns
>> - Rebased on ToT
>>
>> Changes from V1:
>> - Corrected the case for hex values
>>
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 ++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi     | 46 ++++++++++++++++++++++++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 069ffbc37bc4..a82e9aa7bdc5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -551,3 +551,10 @@ &remoteproc_wpss {
>>   	status = "okay";
>>   };
>>   
>> +&wifi {
>> +	status = "okay";
>> +	wifi-firmware {
>> +		iommus = <&apps_smmu 0x1c02 0x1>;
>> +	};
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index b757e8ad1199..dfd9fa077903 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -85,6 +85,11 @@ reserved-memory {
>>   		#size-cells = <2>;
>>   		ranges;
>>   
>> +		wlan_ce_mem: memory@4cd000 {
>> +			no-map;
>> +			reg = <0x0 0x4cd000 0x0 0x1000>;
> 
> Pad the address to 8 digits here (not in the node name).

Sure

> 
>> +		};
>> +
>>   		hyp_mem: memory@80000000 {
>>   			reg = <0x0 0x80000000 0x0 0x600000>;
>>   			no-map;
>> @@ -1808,6 +1813,47 @@ mmss_noc: interconnect@1740000 {
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>   
>> +		wifi: wifi@17a10040 {
>> +			compatible = "qcom,wcn6750-wifi";
>> +			reg = <0 0x17a10040 0 0x0>;
>> +			iommus = <&apps_smmu 0x1c00 0x1>;
>> +			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
>> +			qcom,rproc = <&remoteproc_wpss>;
>> +			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
> 
> Where is 'wlan_fw_mem' added?

Sorry, did not understand your concern here.

Thanks,
Manikanta
