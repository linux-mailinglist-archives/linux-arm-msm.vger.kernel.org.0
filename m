Return-Path: <linux-arm-msm+bounces-38150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6137C9D075B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 02:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265B3281D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 01:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45817D517;
	Mon, 18 Nov 2024 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EXd+wdK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532B79CF;
	Mon, 18 Nov 2024 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731891744; cv=none; b=A3h3dkybeE6OSLVjAzxBwLRGq5KGG34gdz/CXCe1v32u4HGTsvTCIq0myHQSsu/N4hBf30VnDk9HjqoRfTGLNv8P+b5zGaDKh73PCXpATTkWIZSL/b2/hVnnMyHVX+m+HpOje4kUvu13GV6oKJabx9EC8uGR26XcFwCCt3cLPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731891744; c=relaxed/simple;
	bh=IGNouuMdJ5XOR/9dlU6EcY6EPlihRfta8uOShRul4vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qba81UimtPyD5R2m+2TntA4dVQ1DhF3a8pC7awn2Fv5F9rMOpA1sr0aNqyifu0PtyI0X3Gp4UJJDuwOKK8KO1sN+LkgQYcoHrPqhVcQ/pNH3iMMay9y7kXDIjK1jjyBBj5V+rwf6qUFKa7hzwDXBlh8kuyP0WKXDfW+KyituQgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EXd+wdK8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHDuAdB003341;
	Mon, 18 Nov 2024 01:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBDM9G0SVfojD6pu0UvAgUdsM+YYMATzysm281v9ueU=; b=EXd+wdK8HIC/Nvtl
	NGive39yhottlqLNbn5bNKrZHq2qv3PmlWfmKAknt0ijOq57vCafjBkVNFzfcOVg
	UUQFUI3V9tGNDqyIEMhXh7oJrL1f+fosSQLxAtIu1VEcBTVTnqDcXzDa+Xz2VnfV
	GmYTN71ftizHRxbIbdEe5sbxIB+MyV+JuFRuqY9Ur8Tv/LDWJ3sV0PwIwON2hAlF
	9mI4Spzjf4ck2BWQRz6yVpqU1sCVstDuMCmUKXKCueGsGUehrZ/ENSpwv20P4aqO
	smplmIU/rqTiq3qiKww/0shEDh/hhu/CYsRLNQ8o1vq7koGlGNkgVQ420q62hcXp
	86TIMw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9u01w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 01:02:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI124rC019347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 01:02:04 GMT
Received: from [10.253.15.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 17:02:00 -0800
Message-ID: <6fd79a88-bab4-477c-aaf0-0dffb80e103c@quicinc.com>
Date: Mon, 18 Nov 2024 09:01:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: add ethernet node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com>
 <20241010-dts_qcs615-v1-1-05f27f6ac4d3@quicinc.com>
 <1e902d79-5dad-4d12-a80e-464dbcf851c3@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <1e902d79-5dad-4d12-a80e-464dbcf851c3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IAhippoAc_vikBIui2nQ2bnbb1RPaiPx
X-Proofpoint-GUID: IAhippoAc_vikBIui2nQ2bnbb1RPaiPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=908 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180008



On 2024-11-16 03:11, Konrad Dybcio wrote:
> On 10.10.2024 5:05 AM, Yijie Yang wrote:
>> Add ethqos ethernet controller node for QCS615 SoC.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 0d8fb557cf48..ba737cd89679 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -420,6 +420,33 @@ soc: soc@0 {
>>   		#address-cells = <2>;
>>   		#size-cells = <2>;
>>   
>> +		ethernet: ethernet@20000 {
>> +			compatible = "qcom,qcs615-ethqos", "qcom,sm8150-ethqos";
>> +			reg = <0x0 0x20000 0x0 0x10000>,
>> +			      <0x0 0x36000 0x0 0x100>;
> 
> Please pad the address part to 8 hex digits with leading zeroes
> 
>> +			reg-names = "stmmaceth", "rgmii";
>> +
>> +			clocks = <&gcc GCC_EMAC_AXI_CLK>,
>> +			         <&gcc GCC_EMAC_SLV_AHB_CLK>,
>> +			         <&gcc GCC_EMAC_PTP_CLK>,
>> +			         <&gcc GCC_EMAC_RGMII_CLK>;
>> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
> 
> Please make this a vertical list, just like clocks

Sure, I will revise.

> 
> Konrad

-- 
Best Regards,
Yijie


