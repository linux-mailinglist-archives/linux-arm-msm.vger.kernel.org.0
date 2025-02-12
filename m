Return-Path: <linux-arm-msm+bounces-47747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A275A3248A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B9D9169B57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A98D20A5CC;
	Wed, 12 Feb 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o334xeJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B40208995;
	Wed, 12 Feb 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358841; cv=none; b=Gh6JvHXrAZuu4NKVObLeJqILkYAPyHFcoJOn8wILE56Q5thCWBlbevuB2xpnwGSnZ45DqfCY5qxSbmbP4lCTCkaS5vMq3SkwX/731dkNOjlVQyXu5ZnOJytAHgODN4Qa7GE0in++2aKgMQyHeQEgbnecIPxSuu0sz3a8gmr1UFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358841; c=relaxed/simple;
	bh=WmbAQv9JLBkhcPpM0uWm2slx3bOlr/mF+VdyExblCCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RHdbVy8kaA9E7K1uzpFnqVVx2HSm/VPdLyjHxzYuS6YZo9AN6Ri8n7ZK60kno0rlrNvJfRH/K085pLE0MODn94iHXaRmlz218HEdsX95sVDaQl2QV7EyVMgBhIKzLO72Hsy9HQUS/O5Zxvf6NbVy/s8mPwGnwp72C8utGue6FkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o334xeJX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8K99w008940;
	Wed, 12 Feb 2025 11:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2sr6s2gCKtIpekK0r6SRYeaTUYoBWp2FBYiavwLigHM=; b=o334xeJXRA5HTmlB
	UVVzP1QZpkjnHNJiRAPRrAk1GEHqHW/hpmet++Obi3ryniiqI4m1bIlPASMLoWWZ
	xQlUI5SWjTtDjY0LeaOUFDe4107vgiu0CUs5tZPxxoaF00d3te4SAXfMhjeCFvc7
	nGEPE59ClPpfiH16/wLeu0xg8E4nJFVYaVeHDv7a3tuWqJY612CWIWuZOCGFCpOv
	QHVLI5y/hhnH2+mMGmNYAjPSoci6Dx7lQrjom/VBMAP+RK5NPAZomHha5vhYhL+s
	4DXq9KuAajfb2Lo0hwZiCt9/PuxjsL+SEnqRTJZxtj1run9rAj85FX42wB5qZLUy
	TCxBKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qreqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:13:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CBDeq2005789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:13:40 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 03:13:34 -0800
Message-ID: <10d83c88-9f72-4577-95ba-bb1fd1ef36d1@quicinc.com>
Date: Wed, 12 Feb 2025 19:13:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <531a23fe-940a-4e9a-b023-5f1789ac65a5@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <531a23fe-940a-4e9a-b023-5f1789ac65a5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yLSc_7G9DepFoiHNsNhDh7E7OMP31fEd
X-Proofpoint-ORIG-GUID: yLSc_7G9DepFoiHNsNhDh7E7OMP31fEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_03,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120086



On 2025/2/12 16:35, Krzysztof Kozlowski wrote:
> On 12/02/2025 08:12, Yongxing Mou wrote:
>> We need to enable mst for qcs8300, dp0 controller will support 2 streams
>> output. So not reuse sm8650 dp controller driver and will add a new driver
>> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
>> to compatible with the qcs8300-dp.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> NAK. You just said qcs8300 is compatible with sm8650. I did not ask
> about drivers, I asked about hardware.
> 
> This is messy approach. Describe properly the hardware first, instead of
> sending two conflicting patchsets.
> 
> Best regards,
> Krzysztof

Hi, Krzysztof, thanks for reviewing, i want to explain why i submitted 
this patch. Patch 
https://lore.kernel.org/all/20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com/ 
and 
https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-2-1687e7842125@quicinc.com/ 
is the qcs8300 display enablement changes. It base on current linux base 
code and it only support SST mode, so in the SST mode, qcs8300 dp 
controller driver is quite same with sm8650, struct msm_dp_desc only 
have 3 members(io_start, id and wide_bus_supported) and they are same 
both in qcs8300 and sm8650, so we reuse it. BTW, for dp phy hardware 
version, qcs8300 and sm8650 is different.
For this patch series, 
https://lore.kernel.org/all/20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com/ 
, it is made on top of 
https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/ 
which is a new feature for msm platform and not fully reviewed all the 
code. Currently patch series enable the MST feature for qcs8300, so the 
dp controller need to support stream 1, and we need add max_streams and 
intf_map in the struct msm_dp_desc to support MST. So we don't reuse the 
sm8650 drivers in this patch series.
For my understanding, qcs8300 SST changes should merge 
first(https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/ 
and 
https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/), 
and next is the MST base commits 
(https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/), 
and this patch series should merge at last. why i post qcs8300 
enablement changes first and then post the MST changes instead of post 
them together? Because our dependency, i mean this patch series 
(https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/), 
it has about 45 changes, so it might take lots of time to merge. we just 
want to make sure that display can work on DP SST mode first.
So I am just understand that the previous commit was not an incorrect 
commit, but rather two functionalities were changed in the same place.
Thanks,
Yongxing

