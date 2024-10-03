Return-Path: <linux-arm-msm+bounces-33007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48D98ECEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 12:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BFFB281F81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D013D8AC;
	Thu,  3 Oct 2024 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+b/J9us"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A51B969;
	Thu,  3 Oct 2024 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951246; cv=none; b=iMhI8xnSpBjuHZ5p63jslifzwj0q55i1MoC+9AomS85WcZqe5bbEbebZ+oEIW0RgDT7B7iCoA5zglHV0bdaI2N8gMUDcetBfniPB5Is7CutLZCNjmG+EhtK3hud/jPowWwkauI2zzrUsXFDtWVOdaFzekShxh4i8O72M19SDNoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951246; c=relaxed/simple;
	bh=IrAV/tngU5F6nam5p8o9J+LJ+d1svkzN50ScGCUP+oM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A5f6XllSwHetPg+EdrnjrVMQbzKovgbpWskPLaUzkTnlLZkPRQzap5aAkAh8sV077C9Zql359upo8NqlCk8kaPindRX+zrs3Q18hfUwMCR5JUifb32JogApkie5uwMGp/i8l/NOqLkmfEdStUhTMYsfWpsdX8V/CYWIAb+3Doow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+b/J9us; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4939OkMb022731;
	Thu, 3 Oct 2024 10:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9KsxS/qYowNgibV04DUGNjLgSrZd9hEFkGswX0kddI=; b=d+b/J9usqsNNpoag
	hX/QUJDiWGXwdw81FiL6YZqUSaH/7g4nUxzABxS9la7mIuLKVsOsAb0XWjndbhr8
	jEmZ24gE/Fk4c2onPDDe7/RYIv603UEzv4VVUE16MofIlSpTtHQ2gMVe/QFCLV17
	bvg2+3dLJlQ9D1df32x2yUvpXApw6jugzd+5eyzUQj8bZ8Jn7Qf6IBFZfHtiKp12
	aLRT1moWNIcDwBNj5sYbtxufyoUboPLVJO2EPDDDO8JHasYdJNlSQfowEGtoMmSo
	TiKpNTfTLXTP7JB6Lyl0l4Wlf1SrHBWscMVY0veaWcEB8mDANfRB9YdiXkSwTLJ0
	p2YRQQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x8t6x6a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 10:27:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 493ARIxv028879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 10:27:18 GMT
Received: from [10.217.218.111] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Oct 2024
 03:27:15 -0700
Message-ID: <52d6f8d1-a624-4b91-8c75-9bc7e9c76b32@quicinc.com>
Date: Thu, 3 Oct 2024 15:57:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Update iommu-map entry
To: Bjorn Andersson <andersson@kernel.org>
CC: <krzk+dt@kernel.org>, <quic_krichai@quicinc.com>,
        <quic_vbadigan@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "open
 list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20241001114601.1097618-1-quic_skananth@quicinc.com>
 <zd6hff2oun3dgte75sl4jbtqvkgaohxfdkaei7wgmxbqljzx5u@htzwhxectc6i>
Content-Language: en-US
From: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
In-Reply-To: <zd6hff2oun3dgte75sl4jbtqvkgaohxfdkaei7wgmxbqljzx5u@htzwhxectc6i>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gbgzbMKpCjWuo526LuT3TPzOclvBc9Gz
X-Proofpoint-ORIG-GUID: gbgzbMKpCjWuo526LuT3TPzOclvBc9Gz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030075


On 10/2/2024 7:48 AM, Bjorn Andersson wrote:
> On Tue, Oct 01, 2024 at 05:16:01PM GMT, Subramanian Ananthanarayanan wrote:
>> SA8775P has only support for SMMU v2, due to this PCIe has limited
>> SID entries to enable dynamic IOMMU mapping in the driver, hence
>> we are updating static entries.
>>
>> iommu-map entries are added to support more PCIe device like switch
>> attach, SRIOV capable devices.
>>
> Is there a reason for this to be specific to sa8775p-ride? Will other
> boards have different iommu-maps?
>
> Regards,
> Bjorn

These settings are specific to ride board which has SRIOV usecase, in 
all other
cases we expect only direct attach where the main DT is sufficent.

- Subramanian

>
>> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 0c1b21def4b6..05c9f572ae42 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -675,6 +675,37 @@ &pcie0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie0_default_state>;
>>   
>> +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
>> +		    <0x100 &pcie_smmu 0x0001 0x1>,
>> +		    <0x101 &pcie_smmu 0x0002 0x1>,
>> +		    <0x208 &pcie_smmu 0x0003 0x1>,
>> +		    <0x210 &pcie_smmu 0x0004 0x1>,
>> +		    <0x218 &pcie_smmu 0x0005 0x1>,
>> +		    <0x280 &pcie_smmu 0x0006 0x1>,
>> +		    <0x281 &pcie_smmu 0x0007 0x1>,
>> +		    <0x282 &pcie_smmu 0x0008 0x1>,
>> +		    <0x283 &pcie_smmu 0x0009 0x1>,
>> +		    <0x284 &pcie_smmu 0x000a 0x1>,
>> +		    <0x285 &pcie_smmu 0x000b 0x1>,
>> +		    <0x286 &pcie_smmu 0x000c 0x1>,
>> +		    <0x287 &pcie_smmu 0x000d 0x1>,
>> +		    <0x288 &pcie_smmu 0x000e 0x1>,
>> +		    <0x289 &pcie_smmu 0x000f 0x1>,
>> +		    <0x28a &pcie_smmu 0x0010 0x1>,
>> +		    <0x28b &pcie_smmu 0x0011 0x1>,
>> +		    <0x28c &pcie_smmu 0x0012 0x1>,
>> +		    <0x28d &pcie_smmu 0x0013 0x1>,
>> +		    <0x28e &pcie_smmu 0x0014 0x1>,
>> +		    <0x28f &pcie_smmu 0x0015 0x1>,
>> +		    <0x290 &pcie_smmu 0x0016 0x1>,
>> +		    <0x291 &pcie_smmu 0x0017 0x1>,
>> +		    <0x292 &pcie_smmu 0x0018 0x1>,
>> +		    <0x293 &pcie_smmu 0x0019 0x1>,
>> +		    <0x300 &pcie_smmu 0x001a 0x1>,
>> +		    <0x400 &pcie_smmu 0x001b 0x1>,
>> +		    <0x500 &pcie_smmu 0x001c 0x1>,
>> +		    <0x501 &pcie_smmu 0x001d 0x1>;
>> +
>>   	status = "okay";
>>   };
>>   
>> @@ -685,6 +716,37 @@ &pcie1 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie1_default_state>;
>>   
>> +	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
>> +		    <0x100 &pcie_smmu 0x0081 0x1>,
>> +		    <0x101 &pcie_smmu 0x0082 0x1>,
>> +		    <0x208 &pcie_smmu 0x0083 0x1>,
>> +		    <0x210 &pcie_smmu 0x0084 0x1>,
>> +		    <0x218 &pcie_smmu 0x0085 0x1>,
>> +		    <0x280 &pcie_smmu 0x0086 0x1>,
>> +		    <0x281 &pcie_smmu 0x0087 0x1>,
>> +		    <0x282 &pcie_smmu 0x0088 0x1>,
>> +		    <0x283 &pcie_smmu 0x0089 0x1>,
>> +		    <0x284 &pcie_smmu 0x008a 0x1>,
>> +		    <0x285 &pcie_smmu 0x008b 0x1>,
>> +		    <0x286 &pcie_smmu 0x008c 0x1>,
>> +		    <0x287 &pcie_smmu 0x008d 0x1>,
>> +		    <0x288 &pcie_smmu 0x008e 0x1>,
>> +		    <0x289 &pcie_smmu 0x008f 0x1>,
>> +		    <0x28a &pcie_smmu 0x0090 0x1>,
>> +		    <0x28b &pcie_smmu 0x0091 0x1>,
>> +		    <0x28c &pcie_smmu 0x0092 0x1>,
>> +		    <0x28d &pcie_smmu 0x0093 0x1>,
>> +		    <0x28e &pcie_smmu 0x0094 0x1>,
>> +		    <0x28f &pcie_smmu 0x0095 0x1>,
>> +		    <0x290 &pcie_smmu 0x0096 0x1>,
>> +		    <0x291 &pcie_smmu 0x0097 0x1>,
>> +		    <0x292 &pcie_smmu 0x0098 0x1>,
>> +		    <0x29d &pcie_smmu 0x0099 0x1>,
>> +		    <0x300 &pcie_smmu 0x009a 0x1>,
>> +		    <0x400 &pcie_smmu 0x009b 0x1>,
>> +		    <0x500 &pcie_smmu 0x009c 0x1>,
>> +		    <0x501 &pcie_smmu 0x009d 0x1>;
>> +
>>   	status = "okay";
>>   };
>>   
>> -- 
>> 2.34.1
>>

