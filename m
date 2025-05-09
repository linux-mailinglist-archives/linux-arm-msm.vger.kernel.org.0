Return-Path: <linux-arm-msm+bounces-57362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F6AB0B64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10ED11BC01FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CD021C9FD;
	Fri,  9 May 2025 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WWQ5oGKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B82209F5A;
	Fri,  9 May 2025 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775071; cv=none; b=TrDsIhpIh9GzXCFZbhP4rvg4mvMKQNpionL7pRQS+Dmw8q3f08H+X0H1IpKOsvUkL3rG3rLhizoyy8fqCDZZu8CQAYz6KNjy9V5zcm29PUVfdOOIfB5bnOZBfJJ032XrZL4UJ/0/FBIErI9JNYri643EfoSS6wJpowl/Cg4PxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775071; c=relaxed/simple;
	bh=zJ72h4TX3E2IaJXw3cwS+ga1j5ZKidQHcHHLXSUb8oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XoycIb9u4WSDVm2EQTKD1af26V8PN6Bwj6Wv+ZxZ2rFvypbJqYzjijLsEYf97U5xN4W4dJJoRzB5jXkuVSaZLwMX8bsRiTmUj5umkpVRxfExg65gASyyNJkF8MEP1bU+XmeTXRmFQDJHSFNmp8/iltcxHkxpgEkENNnl2iwI14w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WWQ5oGKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492GkdU008543;
	Fri, 9 May 2025 07:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP6YFArRY1BgGGR83r1+KUWUzL4QlWSi/eIRd48gOBw=; b=WWQ5oGKkIzNVSCXd
	Z2XOmJ9SrSXu/lYO7ma6vXDWFA7BcWLt0Ap50HgVJOg6gLOoNWNq8m9QwHcF7NvS
	ehQyiD1ElSBhzA8vw+ziXRS3MdpO2nzM1MAhdeR6rXjgZm2gxLvC5In1OpQV6WZw
	RyEfUT+E2thZzCdkcEXMp/fhu8MXoaFlzRP4Osd7Tr9yGjJ+/YzvNKXbhzJlKPTy
	8ccOcWHOXCIWDel/P+tZYrfSTTA9fBsPXsSj4RW4zZySpaEEIpk0CeRZEetlvV3i
	PbJoUxVhdLtz93IIzICj2uFw4oqeLwY0V4nkJhS4UC5sJywfFAwnS/bVOnLWpMhE
	tcO6YA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bra6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:17:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497HXmx021592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 07:17:33 GMT
Received: from [10.216.57.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:17:27 -0700
Message-ID: <047e2d5c-89fd-4638-ba8c-6ed2b759fa20@quicinc.com>
Date: Fri, 9 May 2025 12:47:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display/msm/gmu: Add Adreno 623 GMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
 <20250508-a623-gpu-support-v3-1-3cb31799d44e@quicinc.com>
 <7b36aa5d-8c81-42c6-a69f-38f9b157a361@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <7b36aa5d-8c81-42c6-a69f-38f9b157a361@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681dac0f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ZaX90SiD_hMLhUq7ehMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lT4GjizFhQpQiE_A3fmILspzYCLOS_dO
X-Proofpoint-ORIG-GUID: lT4GjizFhQpQiE_A3fmILspzYCLOS_dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2OSBTYWx0ZWRfX7WaBzHDy21Xp
 3xdKJmvDz1yFWRAoUfSfcKOxJA57/UAprvmzmfx9miFkQMekq0IcmjpZ54xBYb3RJhrEdKGXS1y
 dc3b4d9uySHOlsM8XbjXMxnlhMJMEt0N0TAolEOQs2H20XdN4c59rYG8WAYo/rFMawmWrxwfoF8
 O56NnCoLezguA/5xVKdUzklB4in6Npx1J35hskuwTXmvI/PX1DZVAePm9AqM86NEq3qOgde/wrQ
 m5Gp6YGcMiNmAgbgVfiv0Q9N6NW7DbBa282Xok0oylzOT88vn94Nic/BcA0slk5pp6lxVl/uNV6
 2troP9SDioQO1gqM9drB8foPPSrDH1B6NR0rTpl/pTYm1Wa6xfjwZjxGVvTIQ86BvMWGAiUoCe2
 /qhN/c3VN4aNIVOSwLds8z31f49W4wKmkYmE5iuR9ThXGhLvWiLb4c80Z+cQGdnRyJrwh4jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090069

On 5/9/2025 11:12 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 18:19, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Document Adreno 623 GMU in the dt-binding specification.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop. You changed patch significantly, like 90%!

Aah! my bad. This is actually a new patch which I mentioned in the cover
letter: "Update dt-bindings yaml with a new patch#1"

I will update the subject and drop the R-b tag.

> 
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -124,6 +124,40 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,adreno-gmu-623.0
> 
> I don't understand. 623 is already here, you document nothing new. This
> makes no sense, I never, absolutely never reviewed code like this.

The clock list is different for 623. We are removing smmu_clk for 623.

-Akhil

> 
> NAK
> 
> 
> Best regards,
> Krzysztof


