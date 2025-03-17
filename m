Return-Path: <linux-arm-msm+bounces-51583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066FA640D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 07:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CA7E1884C9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE30421505B;
	Mon, 17 Mar 2025 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NPCIXPAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAEA41C71;
	Mon, 17 Mar 2025 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191772; cv=none; b=i4h1lUjgFglZ1D+rYKeNTaDZP7LQHk2vmLeGXITodjNk2/vxqaF/utCzuPG0Nh4h8e9jHARhNHoo/J0I28uNq8xLUxCtvBGbT3pXxeMEtnnOA9sN6VAXyUI03uGVtOiaWYWBhXqZhpgwY/lHCS0XmdaGAXZMbUufO8rWiODfRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191772; c=relaxed/simple;
	bh=Rozd0ay08zhUYHX0hU8dZz+gTk/HJACtr3S44HG8+cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LDmx1XFVA84dWyL/c91tnM+ytbrFzXsnG+wRR/UM3g+4gmWPTW4CggAKVs645RxTIkhVs8gYEJWp0bC1Zug1IOkYUNk2slZSzq1sgQn1O3WLyaPVmvf4nvWh5RIpoH5zoXtDQyy/UTKui+JFA+jlzggC1g83u1k9DQGmdQdmI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NPCIXPAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GMbtIR026060;
	Mon, 17 Mar 2025 06:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cs252hSKQ8r3PqXg/ZWLSpu++8tfs3RG1zspmH9vM4c=; b=NPCIXPAESuAWi4Rz
	eteoXut6ZvguedzyQE/Bpj+OMq80SdLVsauzHMInbbtICDDvOdDLgQozXl4KrQ9d
	0BxWnuph0C6gcgHyWdDLRrtpiXzzuH8ynsj0ndR2dNm6qmswepH8mrcoIC9TM0aq
	WLAtDcq5nVrnr9yJDW9RwkxJp3yIojXVG/lzy6EhGxozMqC5FLF+Qr3LpVdrEYbL
	3DrcoQveITCFCGFRQNUqwU837ZhD8GH8+YZS8zJhKFi6VdnY5DK/bia2CkuGTiFn
	zY3XleKTgGMBxM2J/1toL0RMYg6FZUCqvC5vQJdRwH9SAGu5N5/yye31xs2NSdhV
	LyDNsA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxuj5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:09:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H69BVW011181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:09:11 GMT
Received: from [10.216.43.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Mar
 2025 23:09:05 -0700
Message-ID: <e2168ae0-2eef-4f48-91ee-daec5bfc0fc8@quicinc.com>
Date: Mon, 17 Mar 2025 11:39:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 623 GPU
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SM1T1GtEYDSow5VpaqeRCWGPHv7Q-4SH
X-Proofpoint-ORIG-GUID: SM1T1GtEYDSow5VpaqeRCWGPHv7Q-4SH
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d7bc89 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CB1IMkvWpqPTZiQhnbEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170043

On 2/28/2025 1:37 AM, Akhil P Oommen wrote:
> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Changes in v2:
> - Fix hwcg config (Konrad)
> - Split gpucc reg list patch (Rob)
> - Rebase on msm-next tip
> - Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com
> 
> ---
> Jie Zhang (6):
>       drm/msm/a6xx: Split out gpucc register block
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 89839e69f6154feecd79bd01171375225b0296e9
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,

Bjorn,

Now that the adreno smmu changes have merged, can we pick up the GPU DT
patches into your tree?

https://lore.kernel.org/linux-arm-kernel/174198247897.1604753.3634981110002933426.b4-ty@kernel.org/

-Akhil.

