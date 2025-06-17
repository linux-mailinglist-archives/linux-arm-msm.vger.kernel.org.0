Return-Path: <linux-arm-msm+bounces-61549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D81ADC52D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063F4188DA15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3F228FA93;
	Tue, 17 Jun 2025 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2gTkfN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805512AD0D;
	Tue, 17 Jun 2025 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149586; cv=none; b=DWQB6JInp26p6UrL9EdrFesumOXWyP0UtH88DXjF8gWvMRcQcVwFFqo9i9vdmC6fqZvemjfdYtRFqERxnNIiEu4Ah69wtBaj8iIDP0uHMqno/dQ5kSmxKbLMigDHIf9aqQOyyX3vbgY3S86tvDuHVdrWX2KTOyuotfsXVnecUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149586; c=relaxed/simple;
	bh=XGXRMTfNlV6CCVAQgve/Ud1ZevP/AQnQGCZB83sb/5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hsTmX+tVbO7Tv2VnWXJIjrfg1BuowIFMIj9h//oeDn3PWjziPDObxFVh3JGilCCDv1pyvCI99ui7XZ11cX/FbVLxVB3pTZX1gfvzvKCZuxxu/I1nPzeMI0tNvRFtG3GnPWZjHz51UwDSe8AbPAou3k0UByq4nvI59vXXFCljyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2gTkfN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7UG9s008199;
	Tue, 17 Jun 2025 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdc/HFR6X0YbPtDwIHtjnSL/aKOIkHKOaE2DR7FutX0=; b=Q2gTkfN98r8PN/SE
	KUM0JkKhYc8TrtaH+LBuTocV4SqSFUYnz5GJO47PGfAtMv9pTlUaN2naqKlIQnA9
	at4/3k+611tONQDbVedcGFI29z3mHCHaJnojKwaLyHKHC0JJA4Pr2rSWMk3fCuc/
	YuRGrw9kvgRl/Hw17MCepg+OFM3LA11jcCumxW0F5lcaV9nNGCSlOgyY0RrkRsNW
	zAh1bauzQFSvO1154dS6vb2kozI9o3rbhvvWtGUwNtH7ZyBhT+HexEQtt/sMHa3U
	Z4MzJaRg/LfOOw6eYAL4juJksYAaAmyceXeJ2CKPW5vj2HdP2kK5CayFLuoAXjsP
	4zOFqQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crqesr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 08:39:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H8ddKM016577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 08:39:39 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 01:39:35 -0700
Message-ID: <928b8f33-b3bb-4831-b71c-756971ff7cca@quicinc.com>
Date: Tue, 17 Jun 2025 14:09:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das
	<taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
 <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
 <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
 <8bceae03-33fe-4ec0-b1da-785af793dd86@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <8bceae03-33fe-4ec0-b1da-785af793dd86@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kO-1YmlxD0y6JIcnhxu5pAkULtUazMKf
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685129cc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=RqnyG8YqrYQEIJefFsgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kO-1YmlxD0y6JIcnhxu5pAkULtUazMKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA2OSBTYWx0ZWRfXzmxlIX9Kt4UD
 sz+BvvSNiq07opN6BqmouxnFgg5CfwiiEcwLmP063Fnc9NzlvECZFcYAix0vBcwQJmwFcU4j59V
 iF3WA1vSPep0QP1ssCTb4QGzbiTFdf2L1G+Dc+kchAIW+jreqJOirX+V7hLR58mCHlwfLQwBUr2
 +WlKDQoQVTYN3pujPU0MjeBZFCCxzEmg3KHSXTzjNXJzUzH6UB5FnIn8oM6vbTs97tFO2EY9Hd8
 QFsoElgsAiExn2I0hdlxqhFxV9ubLlXl2jeXJPj0w6ci4HSvL34NiiE0CH6JKs1mwI+C/4dJmJ6
 wzaWpiyrBCD6VwdqV/opErq8JuhTbDcUCRRlAIZ/l/1t8SbosZ0Upos0tbhJbTUgMwcsRY7pOav
 wq5xBYPwb68/60IB6JHFalMrLriNQT3sGGCsR3PDN0HvUwTTrAqn1YjVRiwjgJg6QBXfBxGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170069



On 6/17/2025 12:59 PM, Imran Shaik wrote:
> 
> 
> On 6/17/2025 12:27 PM, Taniya Das wrote:
>>
>>
>> On 6/13/2025 6:40 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
>>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>>
>>>> +
>>>> +		cpufreq_hw: cpufreq@18323000 {
>>>> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
>>>
>>> This wasn't build-tested (or was edited after being compile-tested).
>>
>> This is already tested on the QCS615.
>>>
> 
> Seems there is a syntax issue, could you please check?
>  
> - compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> + compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";

Yeah, it was edited. Thanks, will fix it in the next patch.
> 
>>>> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
>>>> +			reg-names = "freq-domain0", "freq-domain1";
>>>> +
>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>>> +			clock-names = "xo", "alternate";
>>>> +
>>>> +			#freq-domain-cells = <1>;
>>>> +			#clock-cells = <1>;
>>>> +		};
>>>> +
>>>>  	};
>>>>  
>>>>  	arch_timer: timer {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


