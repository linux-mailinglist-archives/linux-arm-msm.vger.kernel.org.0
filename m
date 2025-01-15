Return-Path: <linux-arm-msm+bounces-45170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92611A12E85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B77331617E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC0D1DC9AB;
	Wed, 15 Jan 2025 22:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CilVeJai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72515D5C5;
	Wed, 15 Jan 2025 22:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981295; cv=none; b=bDAK71yQKrwQ8meTjTa4QaCjpG7GvJm4OPgRhbrBhp4p+agGxDfmoRk0wBkJ91S7rlI/FMo7IuWP01zdbt9NDNDwdv/C+vdRfOVGSwlBfxiZAH4yw+B3fmtd4xpOE3ZS0/QlbPyx29mfk471XOafIidlPYRKseq1cUljkiYusss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981295; c=relaxed/simple;
	bh=Q15U2MNjP3SNKD+EmlNYUumFD8zJjUy20MmW+1L0FvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ntMRe4mBzrfWjYsh5CIt4vqzOlWPRm/ufRFWhtZccJfnBIUFUKpWjJVqRkvZ1++4u7kcH5zmz9Pztmh5Ta8BCzGppd+j6Wq/2Y9mJRj+YM9AwLynFzIACOGdTRTydrDw1hu42qn1T6F+MufZxGcgzmfYTBnHg9CBMPQfAt1JzLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CilVeJai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGqjPY019418;
	Wed, 15 Jan 2025 22:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sge5gV1m8ZVq7FMogZstsFA+6YuBxDZu07fiSAwHqOk=; b=CilVeJai0lzcKWPW
	vxX5lxvT7QrBtdPS5xDFBUOZKrtPF8sT3gnZN07sAHMamEH2/yuj3kQz0Lrt9TxD
	CE56O8vCqmAi5MfPIblDaA5BrRmFrGJ5+UXNUkQFgK2jKcW/4T46x+oKaY5aARj2
	x3/Xs78B9Koh6lw8qzwqP82riF91kgBQzig8eMkVetsWmFCFaAcQCI4go/f+2xiP
	sen9ySODDk7tPW0omSp5SFSgFCMa81kDlWtBN62BqPWsOpmnmHSa52l5rqIJuQbf
	3o4UIQg9s4h2mk3j/6uKIBD44rvQhf5ekMQW+8FABmF5/AtGiqgjutkNmXYTQhxV
	TwYFfw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gx38qv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:48:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FMm7LJ030991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:48:07 GMT
Received: from [10.110.66.9] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 14:48:07 -0800
Message-ID: <a81ca6f2-2f09-4836-b614-b169d5c65bfb@quicinc.com>
Date: Wed, 15 Jan 2025 14:47:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750: Add LLCC node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-4-5389b92e2d7a@quicinc.com>
 <7jo242e674fsqbia7udid4abq4euofishstmix6m7xqzdgcqiy@3zukruizim4n>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <7jo242e674fsqbia7udid4abq4euofishstmix6m7xqzdgcqiy@3zukruizim4n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZGf16znHDdHh8JZ4QUnNvv9juI3-AfX-
X-Proofpoint-ORIG-GUID: ZGf16znHDdHh8JZ4QUnNvv9juI3-AfX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=813
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150162



On 1/14/2025 2:59 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:26:43PM -0800, Melody Olvera wrote:
>> Add LLCC node for SM8750 SoC.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..3cd7b40bdde68ac00c3dbe7fb3f20ebb2ba27045 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2888,6 +2888,17 @@ gem_noc: interconnect@24100000 {
>>   			#interconnect-cells = <2>;
>>   		};
>>   
>> +		cache-controller@24800000 {
>> +			compatible = "qcom,sm8750-llcc";
>> +			reg = <0x0 0x24800000 0x0 0x200000>, <0x0 0x25800000 0x0 0x200000>,
>> +				<0x0 0x24C00000 0x0 0x200000>, <0x0 0x25C00000 0x0 0x200000>,
>> +				<0x0 0x26800000 0x0 0x200000>, <0x0 0x26C00000 0x0 0x200000>;
>> +			reg-names = "llcc0_base", "llcc1_base",
>> +				"llcc2_base", "llcc3_base",
>> +				"llcc_broadcast_base", "llcc_broadcast_and_base";
>> +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
> PLease take a look at sm8650 and change your patch accordingly.
>
> NAK

Apologies; the contents of this patch are very similar to sm8650, just 
different offsets.
Only major diffs I see here are the node namde (cache-controller vs 
system-cache-controller)
and the formatting (two regs/line vs one reg/line). Is there anything 
else you mean by
this comment that I'm missing?

Thanks,
Melody

>
>> +
>>   		nsp_noc: interconnect@320c0000 {
>>   			compatible = "qcom,sm8750-nsp-noc";
>>   			reg = <0x0 0x320c0000 0x0 0x13080>;
>>
>> -- 
>> 2.46.1
>>


