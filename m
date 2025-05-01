Return-Path: <linux-arm-msm+bounces-56362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F98AA5C20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 10:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C74D9C1981
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C80221F09;
	Thu,  1 May 2025 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f3n6399/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3DA212B0C;
	Thu,  1 May 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087874; cv=none; b=AFdkslGgpWSAD+983hui0aZcdHkyrEb7BWg3SUiS0UMIMt0MF9VVAeL+8UHlvqxxBvixeKzNuvvAokeVCVwzrzS6TXAtd4e3/j7rq755BWO/KqxJ41dyI5jFYwzRumMLKej1dH5EXrwYt1ArmmluoB5waP6X1Zwdbe5FtWeSWQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087874; c=relaxed/simple;
	bh=3ABLzi/lLQ26rQL8HDrPKItTlwAYim7PvtzNE2gnkZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W/hD9ts4o/wo72qmxIN6NWbt80osmoXeOcW9SV5022ytEjcmYr88qJpwUZ5SfL775gUbDVwpcYSyTzJ7/dHXQf8WXdgkXpckdJej88nzWPlcL0HUP5XTubVJxFXF4ln2rSCxhUAzsrETwwNkWR1e2mz8A4wbBEENg5RPPQi1kWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f3n6399/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH0g0f032419;
	Thu, 1 May 2025 08:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sH+t6MzbalCm27yOzAfAIpTNjVM7JE7AXjL8HMtWmpQ=; b=f3n6399/NtavcLt/
	y1IrBYKijc4k9srOTL+NCSPZubEMVxiQcIifJr2LcxzzS8w026xS/sfPdg9BDQC0
	0dBe2N+CpOlY81sRGPtDqMNpOY/1e/TXFaVdG1aJ6Er6ViJNcjiliDc8C7ytwPHd
	Gb4mFb5leceeZ4tCgYnUGixJQ4utqETD6UnVJ3c0q6VM2vxoGAGqrRqDH5UIJ4Mq
	N4Eo+WZN48dd37BTiGLRFzUF2CNwfB515NirARxxkmYjX4ZF3z3yRRRFGn6xNKoN
	Ptpk/YKjakLNxK0x9PQ0ap8Y7zZoiyx76Crmi/zmEEXCvb1gUtfU30vIL9BJIrqh
	zqK9ug==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2csew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 08:24:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5418OFiZ011215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 08:24:15 GMT
Received: from [10.216.32.231] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 01:24:05 -0700
Message-ID: <b56384b8-952a-4831-a004-527739240266@quicinc.com>
Date: Thu, 1 May 2025 13:54:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul
	<sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang
	<quic_jiezh@quicinc.com>,
        Rob Clark <robdclark@chromium.org>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
 <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
 <CAF6AEGvGEshZbSmmLZMXGiCjRdDJLa7EKN-gviw4oxcapMKN+Q@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGvGEshZbSmmLZMXGiCjRdDJLa7EKN-gviw4oxcapMKN+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XTGYoI7GyN-kac9E-BB3tqq3wu2kIjxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfXxp6+ELivpQnm jQmQh4TKW6E+tfhyJQoAOMJ6MwGJw7zvEGS7iysUNFnJf9b10JRn+rs72hXRDmSTGNYeQro8iZi mZZu6qu65uIV3YiMwG78hN8xCYr+alQe9RVB5/fpqoczcKi/l3JYXjqX74pAbm+aW1Yma2raJIT
 FH94A/NNOy7Iot5rbUkfv6UftlmJ8rRQey42cpNWSLtzBzhjDxdEUrI6440W2gr8WNFPH28+12a NbqnRJ5RBvri2AJajrUrYk3v3kf8oR36GgOYZTuKg95wnjGX0k6RArqukbYoNyCD5CQKRwFMJYF huLKuj0Wqx0Oh33voLc/hv8DYCRNSTkCckezA1sPIHVIURrThnBzZn6yKbCPbTGIsNyyf6T6G6k
 WcsEYF3cL89A9jidcwsXgBVQy1jgo799PXXpjcwjjuSyJtwinrQV/R+IwzVTSVfkCq7cC04U
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=68132fb0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=FmNOPqEYIOC0Gsmc1zEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XTGYoI7GyN-kac9E-BB3tqq3wu2kIjxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=986 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/2025 12:10 AM, Rob Clark wrote:
> On Wed, Apr 30, 2025 at 3:39 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
>>>> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
>>>>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>>>>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>
>>>>>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>>>>>
>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +         gmu: gmu@3d6a000 {
>>>>>>> +                 compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>>>>>> +                 reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>>
>>>>>> size = 0x26000 so that it doesn't leak into GPU_CC
>>>>>
>>>>> We dump GPUCC regs into snapshot!
>>>>
>>>> Right, that's bad.. the dt heuristics are such that each region
>>>> is mapped by a single device that it belongs to, with some rare
>>>> exceptions..
>>>
>>> It has been like this for most (all?) GMU / GPUCC generations.
>>
>> Eeeeh fine, let's keep it here and fix it the next time (tm)
> 
> Maybe it would be reasonable to add a comment about this _somewhere_?
> (Bindings doc?)  I feel like this confusion has come up before.  Maybe
> it is a bit "ugly" but since gmu is directly banging on gpucc, it
> doesn't seem completely inappropriate.

That's right. This is a shared region between Linux clk driver and GMU
firmware's clock driver.

-Akhil.

> 
> BR,
> -R


