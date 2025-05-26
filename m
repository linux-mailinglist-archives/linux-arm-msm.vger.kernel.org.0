Return-Path: <linux-arm-msm+bounces-59364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D761DAC37B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 03:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 496747A5107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 01:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB45E84D02;
	Mon, 26 May 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YRmcAcHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAA249EB;
	Mon, 26 May 2025 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748223234; cv=none; b=csgYtHcpFiV57K6T6ct4j5MurRUfQ0sJSOFEcqhd2j3BKp85EyktiwyO1wzcZNaloo5D/F+fZfkwU6JSIkxH1HKdpSwfMQdrdPt21CvH0Z/b75DC2cGzJj+qVmp37I2RWImWmcoDaK+BY585h6bH+bSGJFElA2OvHXNh3Q/SCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748223234; c=relaxed/simple;
	bh=xI5wWqolBBPJjIxwarESeFvyLDH764/wkbXqF2/Fg7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nRSJNWqk6pD9YuOSjJKbmB1z2+pq1pNXY02EOVk1BmiZ3L+Z5S6b/cHxpM4E39YIr+QkWBtjILY+XG/PSPwuXoihPPzMjB4hUo6XDztDTxl/rDwiTFKCeGPjylT6aFNzPkOwGwjUYLbTX0iRa05RYeOs3AoJuVvivfN2m9c+I2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YRmcAcHv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNGqOg015333;
	Mon, 26 May 2025 01:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTk/NQryYg2OVf7f4eFSDHO5bH4mHv6zmpQLDXdPTfc=; b=YRmcAcHvU9Ujtw0z
	MzuTF8WKDilZ8uSSqzQCQHXzQbs/XLOtYukLntX1ryZ0hr9/8cDsFvXso0YwTNaX
	TlD3j++WY5NvEiQaslh6Gcmx4tWamUgG839ATnj5KHiA4AHmvaKK0g2Ve2ZJwGCA
	sbLgmGMohKSWeKUCe7fB1C5hriUtnQZd9KRaxsVd5pyXsJNOF/NlbJGsrh/5KSca
	Irqu7gSzdheuTLqyca5jRBkaBuM20afSMpUhdp7tq0vUQei06PsWq8gQ76vwzlpU
	+ZmqepKKsMHWY6fBG3YLhQ/yh57clBXot+DJdzL3+9r50z1NGWP2hyT1HJXk3HNi
	LRKv+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5jng7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 01:33:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q1XW4O002748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 01:33:32 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 May
 2025 18:33:26 -0700
Message-ID: <0bd3ec71-f970-47e7-9bbf-60b4f31aac24@quicinc.com>
Date: Mon, 26 May 2025 09:33:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
 <0097b07c-3a58-4b28-abca-3e6de70ecf25@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <0097b07c-3a58-4b28-abca-3e6de70ecf25@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6833c4fb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Jt3jiQzTt7KskdmfSOAA:9 a=QDbf2mNsuGxi_wzU:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDAxMSBTYWx0ZWRfX7SXGvP5fR9hI
 /WmreQaJsr5S7rxRHao66JJpsLsSxHK21zotoF2WzGPhITZUjoAp6w//Ve2cZDlrdZpwc+jbRZq
 MWG04UI9xRaWp8ejgJjS/g3VvRxXhiUGwJoxkPP21z4k5n5q5VDGvKnbvSwO87Jb8rB1wWejJHq
 9ZTdkVxLL5zMhuCFqeOeLk7wxDV0+Abw0zyHRWexj/BHMmbKGap7rZRRvmqFBnw4m5MsRyVAQh+
 XoIYttDFqBuqet7U4zhRVe168AFrVbVSjY6DS3gq3GU0xP3dKeL2ACFo37hBd0tJ9B6H3Yl5+dm
 ayn4SKs2tsBRz/uiRNdXrdc4chNYpxaoWhym9QJRQ990cpgbbOXG3XaDF5+OAdRwNgZT91GbAya
 MOuRd2M9dYS/9lVn4Yw4eCT+94ygkHMrZowMwhHGwDjjt0WIXja6dvrerF4qQI9WqeUnMfbv
X-Proofpoint-GUID: mG8v7wyVlnR1dHQYdMuN_iXk6oPG_ElN
X-Proofpoint-ORIG-GUID: mG8v7wyVlnR1dHQYdMuN_iXk6oPG_ElN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_01,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=800 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260011



在 5/16/2025 5:45 PM, Konrad Dybcio 写道:
> On 5/16/25 5:27 AM, Lijuan Gao wrote:
>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>> relocation info region as its child. The PIL region in IMEM is used to
>> communicate load addresses of remoteproc to post mortem debug tools, so
>> that these tools can collect ramdumps.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index f922349758d11ec7fda1c43736a4bf290916e67f..dd54cfe7b7a6f03c1aa658ce3014d50478df5931 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3290,6 +3290,20 @@ sram@c3f0000 {
>>   			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>   		};
>>   
>> +		sram@146aa000 {
> 
> Please also update this unit address
sure, I will update it in next patch.
> 
> with that
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
>> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>> +			reg = <0x0 0x14680000 0x0 0x2c000>;
>> +			ranges = <0 0 0x14680000 0x2c000>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			pil-reloc@2a94c {
>> +				compatible = "qcom,pil-reloc-info";
>> +				reg = <0x2a94c 0xc8>;
>> +			};
>> +		};
>> +
>>   		apps_smmu: iommu@15000000 {
>>   			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>   			reg = <0x0 0x15000000 0x0 0x80000>;
>>

-- 
Thx and BRs
Lijuan Gao


