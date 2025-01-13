Return-Path: <linux-arm-msm+bounces-44870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9BA0B37D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 793E57A2496
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE40C1B87E5;
	Mon, 13 Jan 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bzzxJ+9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50794235C15;
	Mon, 13 Jan 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761588; cv=none; b=b22ESz1f22DiNYO1yW8hHodEYc9NysKU1LRh/zD4qn5cXwqGWiZpXJp6zH1myDtJMGaSEPk/8h3K7ZCOBPlELbegV6HQMs3os/VqLgj9jiQVQVtpq+YyNtCmcKr3A/LQJHWz3gOmqWzzEfz5K3AX56YECKdvt9zkwEhFskwASSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761588; c=relaxed/simple;
	bh=RPzrzMvGrCHMEfzcLtHOcIpaokI6b72Zt/k3EIZg7IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ob7K8OD77ZfXDE7jZMoG/6kggFQcBWTuJuAxqb9WuGHaMaX7GTvt3bHhQ06fcVYCkbPG41eOMru5rM75K01K0XDI489p/r9M5Q1rPxgnqaM7RLbjG4s2eZxEwpi33yz5pSjjJHYuCTjv20VUizai9sQooNBeXPsAkpzUF6QR6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bzzxJ+9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D05ah2005245;
	Mon, 13 Jan 2025 09:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ys7C1ng1Qh50wTxY9Q3dBdvQRCmH8QP3Xs0QyYBehUo=; b=bzzxJ+9rNNhE53En
	T65tyMtZ2RMIuIvDoGmHKZbrUPkmn8qLuZiSlBtz83yUMZpOw21miT4qTFmfh05Y
	fszDmK5BeaJLkbV/V4XoUITiI/rz3simAVsPBHNUq4wHJucMl9gwTV81XwjVlOZs
	ehgDiaSGgITlWzCtBvrfdLVqqZxT/tEGNffRoJ4qakqVLeluAKuw4ZZrJsd7nG7T
	hjQ2aT3PaLsdNLG6FFk0kGQp+eimprY52tji0Nj7qYPXcfYcsKJoPkky5BkYy9Hn
	eRvY6PL7ttY9oOe7L8HFFL5i/wjm1xRzj4m/OTq3vaBLaBEuNFRvnmneeZTfZleu
	8eBcVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444r01s5e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:46:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D9jxqR002907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:45:59 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 01:45:53 -0800
Message-ID: <07d33f82-aa6a-46ef-8e16-ce58e506c0a7@quicinc.com>
Date: Mon, 13 Jan 2025 17:45:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
 <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>
 <5exaup4mceoq3a3wk44csybigcg3yc2drvv7nwdndbig7edzya@5d543uzrnoxx>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <5exaup4mceoq3a3wk44csybigcg3yc2drvv7nwdndbig7edzya@5d543uzrnoxx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vAlKdqco10aigTQe0yRpfJGfvJtxmn2k
X-Proofpoint-ORIG-GUID: vAlKdqco10aigTQe0yRpfJGfvJtxmn2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130083



On 2025/1/13 17:36, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 05:26:56PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/1/13 17:02, Dmitry Baryshkov wrote:
>>> On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
>>>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>>>> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
>>>> QCS8300 target. It includes the addition of the hardware catalog, compatible
>>>> string, and their YAML bindings.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
>>>> - Fix the missing space issue in commit message.[Krzysztof]
>>>> - Separate the patch for the phy from this series.[Dmitry]
>>>> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
>>>> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
>>>>
>>>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>>>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>>>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>>>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>>>> - Correct formatting errors and remove unnecessary status in MDSS
>>>>     bindings.[Krzysztof]
>>>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>>>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>>>     20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>>>> - Package the DisplayPort controller and eDP PHY bindings document to
>>>>     this patch series.
>>>> - Collecting MDSS changes reviewd-by Dmitry.
>>>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>>>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>>>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>>>> ~
>>>>
>>>> ---
>>>> Yongxing Mou (4):
>>>>         dt-bindings: display/msm: Document the DPU for QCS8300
>>>>         dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>>>>         dt-bindings: display/msm: Document MDSS on QCS8300
>>>
>>> Is there any reason for not using a common style for these three
>>> commits?
>>>
>> Hi，actually, for the dp-controller.yamel file, I just noticed that the
>> previous platforms added the dt-binding files using this format. So, I
>> followed their format to write the commit message. Such as dt-bindings for
>> sm8650/sm8150/sm8250...
> 
> I don't care about either of the formats, but please be self-consistent.
> If one patch out of three has a different subject prefix, that looks
> strange.
> 
Got it, it does seem that way. I will revise the commit message format 
in the next version along with the MDSS binding review comments. Thanks.
>>>>         drm/msm: mdss: Add QCS8300 support
>>>>
>>>>    .../bindings/display/msm/dp-controller.yaml        |   4 +
>>>>    .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>>>>    .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>>>>    drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>>>>    4 files changed, 268 insertions(+), 4 deletions(-)
>>>> ---
>>>> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
>>>> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
>>>>
>>>> Best regards,
>>>> -- 
>>>> Yongxing Mou <quic_yongmou@quicinc.com>
>>>>
>>>
>>
> 


