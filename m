Return-Path: <linux-arm-msm+bounces-51191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D67A5E375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C603B2C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E9253359;
	Wed, 12 Mar 2025 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="et0TWNly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1117083C;
	Wed, 12 Mar 2025 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802883; cv=none; b=CMv9LYP3ef5tzK95oMA+TIliaXf/lIXa9pI3teLeVVE4ya3RUmLOv1PapyWkK3Q4hNb30Zy6UjovegE45b8boHq2zfpsooMQVlbcJucGNShCEDZ8yPZKIbnLRDyL8j2Jry7hte1OLbWzCOS+UIskZV2SUjbRy6bNpPYvgqTHaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802883; c=relaxed/simple;
	bh=1J3dGIVuwN2Q4GzB1YtKw2OhBdBknY1PfhxElEGPZLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kjyD3Y5/sqqu2zPXRGsh7iWMJi4EktF2g1D/CW7riR0gng3Lyv0RVc1vZY2ReZi+ik6vKmH06cgQZ7K7mOnFXwSWthWXOY5eZBhUcBr38JLQJA0GEwqeT5hjFARYZhxHgknnSH6QpJwcRfuMZa5EVm+Pvvkkdqqmtfb+NNZhHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=et0TWNly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C9mt8P012316;
	Wed, 12 Mar 2025 18:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwavtkABT0yQLhLk9M8rK9ZRBewtztjzejcXyEamxdk=; b=et0TWNlyvMWMj6uV
	BLDzT4RskB0kJnVSAggeQUzGtVHDQH/v7ehSzCDz26mYrEX2vQw815K1+gX7jnk3
	tf4Jd1SxNa24M2WFuBK7l0vlCEBP74Q2fEbQOhWPFvLBJu8Z+0P3o4MMhOBLIFKy
	XvIrHhbSgedelo1dhMSSRQdeMmGoJ6EASa21dj4tYmbt9qiZc2MRZDrcrLPn8oOX
	dhZn2cz7EbKXsoz2PLcdG7FYiyKm0ozz1rcyab5NSVkc4DSN3sOSTpo81+hiaY1P
	OP4tU0XnhkDvRJK8hV/LDXxco+gzZK10cowRJYjpeU7mtg5ztoCdo5KqoGa+E3gG
	Yk0a2Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nkab0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 18:07:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CI7v5K028428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 18:07:57 GMT
Received: from [10.110.14.126] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 11:07:57 -0700
Message-ID: <f3e9bcd6-80b1-481c-802d-49af08200153@quicinc.com>
Date: Wed, 12 Mar 2025 11:07:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8750: Add LLCC node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
 <20250304-sm8750_llcc_master-v2-4-ae4e1949546e@quicinc.com>
 <69680418-5a34-4b6b-966f-bb22f0ca53aa@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <69680418-5a34-4b6b-966f-bb22f0ca53aa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=67d1cd7e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=wdECpnfLHcSi_Egb9acA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TcKVyQtBdpLeXjNpjRm7MDlN9TZz0Wm0
X-Proofpoint-GUID: TcKVyQtBdpLeXjNpjRm7MDlN9TZz0Wm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=854 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120126



On 3/11/2025 3:20 AM, Konrad Dybcio wrote:
> On 3/4/25 11:24 PM, Melody Olvera wrote:
>> Add LLCC node for SM8750 SoC.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..a3f9595c496f6f6fcdf430d44fdd465dda4bd39e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2888,6 +2888,24 @@ gem_noc: interconnect@24100000 {
>>   			#interconnect-cells = <2>;
>>   		};
>>   
>> +		system-cache-controller@24800000 {
>> +			compatible = "qcom,sm8750-llcc";
>> +			reg = <0x0 0x24800000 0x0 0x200000>,
>> +				  <0x0 0x25800000 0x0 0x200000>,
>> +				  <0x0 0x24c00000 0x0 0x200000>,
>> +				  <0x0 0x25c00000 0x0 0x200000>,
>> +				  <0x0 0x26800000 0x0 0x200000>,
>> +				  <0x0 0x26c00000 0x0 0x200000>;
> Please align the <-s and "s, the data looks good

Ack.

Thanks,
Melody

