Return-Path: <linux-arm-msm+bounces-21039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C407B8D4259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451FD285E51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB55848A;
	Thu, 30 May 2024 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fUIFXrAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76AD63C8;
	Thu, 30 May 2024 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028842; cv=none; b=XeTiKYuziSvslzlS5RTHF+zLHzQYx2yddIDok5Um8sjYd4c5LfdeiELpO5myIW/K2CvNWL5BMDAlg+RRlopWO/Lud0S5brXsaezc9PbldUEH/vr3DiPpJqncmEVtQdfEz/oaqNfAVSBxtthcDAQd4xJTNPUJyNN+GygZ7/36Nkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028842; c=relaxed/simple;
	bh=+6EPYmKGyoyRV8EiUgDxR4sedEsy1EMQvxzPIcuckBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OrkCLduP3LZBTxGuvytbATnOPPgI8wVoAJyKEmYPrkjatC9j8raKbsaXQZ8FOGZTgnLYe9iOQ9hoRLyO2nnTf30I0xQlF6vr5hMNtizBUPVpRl78C+7Mw6n6sy89Kg1GrvHsjS9G3bcS51/i6uWA4xtD42Hsn+5/qH+xeMzjg+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fUIFXrAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TJoZHH015403;
	Thu, 30 May 2024 00:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZUQMrFChqsVAkth/SSgOxyJdVJr7osn4a/rCGflFyU=; b=fUIFXrAF8kWCGhFp
	OFBPZQH8c2KRWhvSfp548ZOP81asVAZhoD301A9f08sHkR7M8iK9pw+10uKIxAb5
	3HDR2kGCOh1hOitBTdQcmgvMP5gPqDDdMWh4607l132UUZd21pbKQfPjSDi7gtbD
	ODZDgRDz2BLJByTgHlrKRrdACtqg6Ot2pvO4sE5gyz2ZLFGyG+bjiPJHreyAUUzB
	cf5d8jh1exg/IkLKSwhCEIMNQp/cP4FfLaYrxiZo9YWvqPuYXsY01OJIrS72mTKe
	ZQZ0lhQ+wk08YBdgERKtqkbCiYDUvV8l5ITdyMqT/M24lbxzvUXoweUud7zxGcb2
	+PF48w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0gatha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:27:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U0RFnq028416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:27:15 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 17:27:10 -0700
Message-ID: <4039d0b0-8f75-46b1-8430-fe2f38ee4e38@quicinc.com>
Date: Thu, 30 May 2024 08:27:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info
 region
To: Mukesh Ojha <quic_mojha@quicinc.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
 <20240529101929.3167610-3-quic_tengfan@quicinc.com>
 <8c317b50-c6c0-95e4-7d85-76516a387f85@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <8c317b50-c6c0-95e4-7d85-76516a387f85@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ahZW1ngzhHxmFTAZgaIFWnYVlfvh_GSz
X-Proofpoint-ORIG-GUID: ahZW1ngzhHxmFTAZgaIFWnYVlfvh_GSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=637 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300001



On 5/29/2024 8:36 PM, Mukesh Ojha wrote:
> 
> 
> On 5/29/2024 3:49 PM, Tengfei Fan wrote:
>> Add a simple-mfd representing IMEM on SA8775p and define the PIL
>> relocation info region, so that post mortem tools will be able
>> to locate the loaded remoteprocs.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi 
>> b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 5632fa896b93..eb33b1587802 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3025,6 +3025,21 @@ tlmm: pinctrl@f000000 {
>>               wakeup-parent = <&pdc>;
>>           };
>> +        sram: sram@146d8000 {
>> +            compatible = "qcom,sa8775p-imem", "syscon", "simple-mfd";
>> +            reg = <0x0 0x146d8000 0x0 0x1000>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            ranges = <0x0 0x0 0x146d8000 0x1000>;
> 
> This could be moved up along with reg region.
> 
> -Mukesh

Sure, I will move up along with reg region in the next version patch series.

> 
>> +
>> +            pil-reloc@94c {
>> +                compatible = "qcom,pil-reloc-info";
>> +                reg = <0x94c 0xc8>;
>> +            };
>> +        };
>> +
>>           apps_smmu: iommu@15000000 {
>>               compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", 
>> "arm,mmu-500";
>>               reg = <0x0 0x15000000 0x0 0x100000>;

-- 
Thx and BRs,
Tengfei Fan

