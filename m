Return-Path: <linux-arm-msm+bounces-43807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4DA000CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 22:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA9C3A36E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 21:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61131BC061;
	Thu,  2 Jan 2025 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NiRIkj2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD0D1B6D0F;
	Thu,  2 Jan 2025 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853917; cv=none; b=hbkkMDmf+eQd0I7T2fAVPovEsi/1FEwPWqb/PP4RXciTcG47cvW9Nw1BPPvnEDCihV5HWgJ4LZkefKY21aYhWcedWUJoqHBbxoQKKLtHOxAlGATZxXIqXol/BDjpOuPORbPPmHnRf7E/h4AbbrL5mQRN1qfFnHykr3R9BBGGu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853917; c=relaxed/simple;
	bh=3aHeA093gyruu9Xbe2FZNqSzT/+NTaZIeV0ZYWzj9dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TjK/khqS6MG2DnYL8mUgLnQlMZavk1we9Famia8x1EJpCisctsRihs0BI1ZtqKae4I35JuP1aZv0UzhO+YJqGDZyhwfJ/8zCzoDl0HMt0VRRrqWfyn4rqGPNEn8jKvePegPRvSrv7fxc0fnGZpiZE34OXoQ60Rm9Z1uRnoAjgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NiRIkj2s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1I20031417;
	Thu, 2 Jan 2025 21:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcNXXlmq28sMi+EkISutJPhPzNEIpdQw4E0g0jREQdo=; b=NiRIkj2s7koYMufD
	alx39Cd16KJYqOzJzZkimAxch1kkPzknq705hjrq/0VxQ9dgru1kR4dQmIMOvWGp
	Es623xZJirqDHqy4UQb75HOg7QNVn0eIROQ4tFBO8sChnAfdxoShrg/4iadjgasr
	jvr5WMYGpzgrZEO5Rn/mR6wv6ztGy0yL71yvZXATBf1Dc8xFYn9VlpQ3iGm0MDIz
	P3D5w54v7ROIq8xKL9cf35Y26jI3NvcYa7OnopcaDz1sNU/xsJLlssuaoaAsPlNy
	UClgy3LUe/0knx+dY8CHNvgSIdMoBvLjEXseyNTqk3niVehV5QFp7A/1Rk0ysgIS
	ZSIwjw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ws7a98ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 21:38:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502LcDXh002847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 21:38:13 GMT
Received: from [10.71.115.115] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 13:38:12 -0800
Message-ID: <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>
Date: Thu, 2 Jan 2025 13:38:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
To: Daniel Gomez <d@kruces.com>, Marcus Glocker <marcus@nazgul.ch>,
        Konrad
 Dybcio <konradybcio@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan@kernel.org>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
 <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
 <l5vwputpefdkweti56em37i5asrd3vb7pxhwlzir7webfuk3fl@afcqm3faq2gt>
 <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VJBzCZ6Xi5BPCZNXsCuhO7p-B0jUC-Gi
X-Proofpoint-GUID: VJBzCZ6Xi5BPCZNXsCuhO7p-B0jUC-Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020189


On 11/9/2024 3:31 PM, Daniel Gomez wrote:
> On Fri Aug 30, 2024 at 7:25 PM CEST, Marcus Glocker wrote:
>> On Fri, Aug 30, 2024 at 02:05:48AM +0200, Konrad Dybcio wrote:
>>
>>> On 17.08.2024 10:38 PM, Marcus Glocker wrote:
>>>> Add the UFS Host Controller node.  This was basically copied from the
>>>> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
>>>>
>>>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
>>>>  1 file changed, 72 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> index 7bca5fcd7d52..9f01b3ff3737 100644
>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
>>>>  			#interconnect-cells = <2>;
>>>>  		};
>>>>
>>>> +		ufs_mem_hc: ufs@1d84000 {
>>>> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
>>>> +				     "jedec,ufs-2.0";
>>>> +			reg = <0 0x01d84000 0 0x3000>;
>>>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			phys = <&ufs_mem_phy>;
>>>> +			phy-names = "ufsphy";
>>>> +			lanes-per-direction = <1>;
>>>> +			#reset-cells = <1>;
>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>>>> +			reset-names = "rst";
>>>> +
>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>> +
>>>> +			iommus = <&apps_smmu 0xa0 0x0>;
>>> Looks like this should be 0x1a0 maybe
>>>> +
>>>> +			clock-names = "core_clk",
>>>> +				      "bus_aggr_clk",
>>>> +				      "iface_clk",
>>>> +				      "core_clk_unipro",
>>>> +				      "ref_clk",
>>>> +				      "tx_lane0_sync_clk",
>>>> +				      "rx_lane0_sync_clk";
>>>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
>>> You also want
>>>
>>> <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>
>>>
>>>> +			freq-table-hz = <50000000 200000000>,
>>> 25000000 300000000
>>>
>>>> +					<0 0>,
>>>> +					<0 0>,
>>>> +					<37500000 150000000>,
>>> 75000000 300000000
>>>
>>>> +					<0 0>,
>>>> +					<0 0>,
>>>> +					<0 0>;
>>>> +
>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>>> +			interconnect-names = "ufs-ddr", "cpu-ufs";
>>>> +
>>>> +			qcom,ice = <&ice>;
>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		ufs_mem_phy: phy@1d87000 {
>>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
>>>> +			reg = <0 0x01d87000 0 0x1000>;
>>> most definitely should be 0x01d80000 with a size of 0x2000
>>>
>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
>>>> +			clock-names = "ref",
>>>> +				      "ref_aux",
>>>> +				      "qref";
>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>> +			resets = <&ufs_mem_hc 0>;
>>>> +			reset-names = "ufsphy";
>>>> +			#phy-cells = <0>;
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		ice: crypto@1d90000 {
>>>> +			compatible = "qcom,x1e80100-inline-crypto-engine",
>>>> +				     "qcom,inline-crypto-engine";
>>>> +			reg = <0 0x01d90000 0 0x8000>;
>>> 0x1d88000
>>>
>>>
>>> All this combined means you probably wrote your init sequence into some
>>> free(?) register space and the one left over from the bootloader was
>>> good enough :P
>>>
>>> Konrad
>> I have not done anything special in our sub-system to boot this DTB.
>> Changing the values as suggested by you also doesn't make any difference
>> to me.
>>
>> Anyway, I think I'll give up at this point, since this process is
>> getting too time consuming for me.  We'll go ahead with out downstream
>> patches, which works for us so far.


Hi Marcus,


Do you mind if I take over this series?  I started working on getting at least the UFS and USB portions of the DT file to work on my Samsung Galaxy book4 with your patches, along with some required modifications.  If you're OK, I'll keep you as the author for the main DT file, and submit my changes on top.


Thanks

Wesley Cheng


