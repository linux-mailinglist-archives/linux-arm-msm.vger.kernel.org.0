Return-Path: <linux-arm-msm+bounces-45503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D180A16141
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11083A6A69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 10:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB60E1AAA1F;
	Sun, 19 Jan 2025 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jjaHWbI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481B13C80E;
	Sun, 19 Jan 2025 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737283175; cv=none; b=UhDvGFqRRe+oQxOvG2C5Y7Fl/A7KQOnbXtGDLx9GQUu64y6vsXQn6LfCE6SWzrBh8SqcM70+Rfb2Imx9JDW/IrMkSEAfBQVZun4+hkyRl/1NuqI/pdNMAcg1EQaFKFYHAOEe0O4B8gACrS40+ouZF4L/JUlsF12PfHZfWoG8bK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737283175; c=relaxed/simple;
	bh=mzrDlSpOX7hBmu9H8RGmn3nPSohypFGJtPAM7XP3U3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MBdk4TLLpQsHsU3Ls9mwdX/GKlHCDGMEFMhdRjYq0t69ugpyQrizQhMILl5qZyX7NygJrmkboptVy0kfs6alEJYgftuocGb/RUBD9r+YmIwXjTbWeZSlRj6jTYvaJA93nFRqiBzdgSbqoApwpBY8p9YFApWOYp+l2vGs/bry9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jjaHWbI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JAOKQf021957;
	Sun, 19 Jan 2025 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX2QuJss18L9a1KpjLAH6oqE2ShPUt8sv7JjepkTB6A=; b=jjaHWbI5q4nrLYO9
	MSlVbM168Z3+zv730S59I8L2JmqteJ5/H65u0WVTBNjqWzufFxh5u1CMTtHKwudr
	cEkBMh+T6GQ/+TwTLdP7hIsFWc0+dxriR8V1fkCG8Dle4QgMixwPpiaf7emviQfZ
	hZnYK5HwTLM4jke26k9ZsjY8Lwet/0FOT0tnI5UNzaNeEitiv+xokU1o/ROrxAiM
	SWF6mBlswSnQw7Ed2WqIYndS8a9THEX4pgL4E/C3lS1Yvb1VT/Rwe9DjCUHzVhsA
	LjyD1pcj9RxTR82dWA7NMbGPTHHvFePZMf358AMw+CfQeneI0fUa2ZH/Ri1rM1ge
	DTDu/g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4484h19vy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:39:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JAdURA027162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:39:30 GMT
Received: from [10.216.35.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 02:39:26 -0800
Message-ID: <ee277e4d-04ce-4bcc-942a-4fbb8bf1e092@quicinc.com>
Date: Sun, 19 Jan 2025 16:09:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <e3dfa3a7-feb1-45d1-8dc3-c403cb92c7c0@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <e3dfa3a7-feb1-45d1-8dc3-c403cb92c7c0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bOapJbJNe6Dwljr5F0wGAGxwVkWsUdHq
X-Proofpoint-GUID: bOapJbJNe6Dwljr5F0wGAGxwVkWsUdHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=784
 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501190086



On 12/30/2024 10:12 PM, Konrad Dybcio wrote:
> On 9.11.2024 1:00 AM, Dmitry Baryshkov wrote:
>> On Fri, Nov 08, 2024 at 11:54:05AM +0530, Taniya Das wrote:
>>> Add cpufreq-hw node to support cpu frequency scaling.
>>
>> CPU, not cpu.
>> Also the prefix is incorrect for both patches.
>>
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
> 
> [...]
> 
>>
>> This doesn't follow the bindings, does it?
>>
>>> +		reg = <0 0x18323000 0 0x1400>,
>>> +		      <0 0x18325800 0 0x1400>;
>>> +		reg-names = "freq-domain0", "freq-domain1";
>>> +
>>> +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>> +		clock-names = "xo", "alternate";
>>
>> Are the DCVSH interrupts?
> 
> 32/33 for silver/gold respectively
> 

This target does not have interrupts connected to CPUFREQ-HW.

> Konrad

-- 
Thanks & Regards,
Taniya Das.


