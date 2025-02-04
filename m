Return-Path: <linux-arm-msm+bounces-46888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD5A2787B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 18:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE65F18869AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31782165E6;
	Tue,  4 Feb 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZIgIEta1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70721639D;
	Tue,  4 Feb 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690433; cv=none; b=tZriBwdiGKxe5R21Bt0N9OKu8PaymM+GqIMC5+kcXa6lRFCzBlz2V9Jy4Qv+3Dhq12bqKSq8GvhGzA8N7qKFFB5Z5RYcvirnI2ZReNnhLTrFUKGmHiBVK/ZseSx2jSFx8s8e6GpBQ40XN8IqVIMktwc7rgb3QXPaTVPC9A8bylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690433; c=relaxed/simple;
	bh=Sjru/Y7F5aBZSj6PwM/+IWSv6HOM44HRrHG3/kZqfS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ODXxxtGZQUaHUUPEV5gcFk+SscWIvPwJZiLIEkf15B+NlLnh0hKjuVGzdWDKzu+tA3mL2MHUUpbn03XjYPKIseMT4Mqmp1ND9glvj7pCw48LqL0+g87BOIgM52X8xseC7MAr+IKo9dhzsC/mvMNrsjgyQVHP0Yh6+SclZtH8scQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZIgIEta1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148WTsC010185;
	Tue, 4 Feb 2025 17:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+UpcNhUWMnNNbsqJMX4+97AYxTxTfP8PufS942T7P0=; b=ZIgIEta1Ignza4bS
	ToPwVX6VAZTS6aIL1woemob5/rv7W3rl2hRSTiBKPOCEM/8ZpOlGCVZAuI2eLcDO
	/P/rYe/a+Sl/W2ANqwDupfcjg2uG4M72iERXkBRyxCT3QUxF4u7xyhmc+K/5m4Qn
	SFHdHnuKB6PMRb14sfW1/Zu6WExj/b9gbNd7sU89Mbcxn7mEmjrdGT0T6ejbGPls
	7Hlzi4XvMpVnYPbunuC2M9mKS0FwjtVg35WoRWvnI6hHMt7U2ZsXMTuUcDoS3PZr
	ch2aWzyGm7dJEUnNFRMqd+30RL2CIxCifoCNVLnyqISQH3hc/p2wQgvL1/+XwwCP
	qOTreg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kffnhb5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:33:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514HXmKl001124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 17:33:48 GMT
Received: from [10.216.62.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 09:33:44 -0800
Message-ID: <da980161-087b-4fd7-a1a9-56576b6dfff9@quicinc.com>
Date: Tue, 4 Feb 2025 23:03:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
 <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c4JAX9SwW01lt6SO9zeJVRQ6s4YQFfdn
X-Proofpoint-ORIG-GUID: c4JAX9SwW01lt6SO9zeJVRQ6s4YQFfdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040135



On 2/3/2025 7:44 PM, Konrad Dybcio wrote:
> On 19.01.2025 1:00 PM, Taniya Das wrote:
>> Add support for video, camera, display and gpu clock controller nodes
>> for QCS615 platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3,7 +3,11 @@
>>    * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>>   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>> @@ -1418,6 +1422,18 @@ data-pins {
>>   			};
>>   		};
>>   
>> +		gpucc: clock-controller@5090000 {
>> +			compatible = "qcom,qcs615-gpucc";
>> +			reg = <0 0x05090000 0 0x9000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GPLL0>;
> 
> This would normally be GCC_GPU_GPLL0_(DIV_)CLK_SRC, is this intentional?
> 

Yes, Konard, but on QCS615 GPLL0 is connected and not the GCC_GPU_GPLL0 
sources.

> Konrad

-- 
Thanks & Regards,
Taniya Das.


