Return-Path: <linux-arm-msm+bounces-63156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D2AEF153
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A56C3BA721
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070822690CB;
	Tue,  1 Jul 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gi73WiyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D36209F2E;
	Tue,  1 Jul 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359079; cv=none; b=LaD1HsXUEmIz2cOfrk+tm5OxTwDosITW9sw/kSyCII255PZ59p60PpXCm4tzeOvwpqBoZlL6ZqJyJLbhf6VY2B82sV4pQUJH1sdq8sJysqX7tRAGEMIU6c4K81GM6xrL9zv9AtFj4OM7+siwcpsOK/RHumoKUd5x7asTOd4bMK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359079; c=relaxed/simple;
	bh=iW0aN7sE4xJ2Ts75g7iYkcOhxe7psu62/6fM23I0iQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JzOIsZBPEQwiS7IWKPs3bf6YpWZ9rIXR0KXLbryziSvvSPE6/3VmQMLZo3YdNBOL6OPzedOyQ7I/mUWyz0ZI8zidf8XdUMpYo7BaqZpS/jZsvNi9p4vt/953kbOhUrLb7HCnUetD5I2b9NAfl1+CHL07nz3l6VFuCjZirjH7gXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gi73WiyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613kXsC008527;
	Tue, 1 Jul 2025 08:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKJLwrBzTPNTZjWdONka2EiO9tmLnQUpgxxCdhD7uD4=; b=Gi73WiyAe0q71Fq4
	b+oGNOsMoN2BlyPk8xNxsKo2fG8RP6xj29Dz8KpIIQ4fZ4ULX/251E+PY6JRbgKw
	a0W+lksMCCt43zkVmUTD+xXx8NXJPmhb5NIaQz3c8zRtKvy9bH0Huk2ZCbvMqIYV
	2ey0JgSQ7LrMIZzi0QH53HzQXl6EcWnYDbdm2frldbm7j49N3NB+2GYIbfNYNtPx
	4bpPwrd+PHSW/ChLM6/hwVb9yP3QfdDiHuBMppcrt4oZfo1WLT3mwxPhcbYSH2lx
	TM1LchUiLvTB7nLNrp6RG0dlWVXdoqyOEeT+mMih1lQrslYok3ge51yyLI2gclTw
	zt6/DA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmvj2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:37:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618brnY003143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:37:53 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 01:37:49 -0700
Message-ID: <5b74eca8-db7f-4ace-be9c-468e0a260e1a@quicinc.com>
Date: Tue, 1 Jul 2025 14:07:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
 <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
 <263139f2-f149-4615-82ff-584fe44ead2f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <263139f2-f149-4615-82ff-584fe44ead2f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BsXpz6FkDgppC8ufUqARpjqvkyTHOD62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0OSBTYWx0ZWRfX0GG2+hKNb39J
 AjQtYwynFZ0IVq5c+dQjRGu6xQTBzr8zTzJRdiIeY2hWR5dS4qt7XbqTzoWpL/IHTiyYu1NKN52
 oJBoY+RjEYw3OKLsbIc9DVojN1MBGRQOoFDddtXg1QDj8uax7wyHkLo/JfNMTdi/jdWxjPof2Qi
 Cw7/RYUqRai8K8j90WQM3lgzHHsZhY0mu/65Xvs0mAdH4Qar4VBpiUDSxGm0AF9YNkBC+vn5RRA
 jIMh5qKsc/DG7z6BAj4cF5NTfNLdXV1Il1usle313xjXu6mafwZYkctXF+YrHrvxEa5GSxWdtd+
 Zq1dstaHsMc68Ce/FHbArG8G1q5IVLgUKD28j0zC/cNLznNAtnP9crXzZLJhDfV9tGZht/Znvzn
 jGLL0n5Zyb0Bx+gYkdMLbYrw9bayFfZRvYiJFbeod5RVC1cKPaP9yR+dqQSsll1pJ7vl75Pj
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=68639e62 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=y7rqz7zThRCYt2QJ9_IA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BsXpz6FkDgppC8ufUqARpjqvkyTHOD62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=795
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010049



On 6/27/2025 5:37 PM, Konrad Dybcio wrote:
> On 6/27/25 5:52 AM, Taniya Das wrote:
>>
>>
>> On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>>
>>>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>>>  				qcom,remote-pid = <2>;
>>>>  			};
>>>>  		};
>>>> +
>>>> +		cpufreq_hw: cpufreq@18323000 {
>>>> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
>>>
>>> Why? Other platforms use a true SoC as the first entry.
>>>
>> Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
>> and that was the reason to use the same.
> 
> The only compatible consumed by the driver is the last one in this case,
> meaning sc7180 is only there so that if we discover quirks very specific
> to sc7180 down the line, we can add some exceptions in code
> 
> Reusing sc7180 would remove the ability to address any quirks that would
> concern qcs615 specifically, which can happen due to hw design, fw
> quirks etc.
> 

There are no quirks for QCS615 as the block is a re-use in design. I
will add the new update to use the "qcom,qcs615-cpufreq-hw".

> Konrad


