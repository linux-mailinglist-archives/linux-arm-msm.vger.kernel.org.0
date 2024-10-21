Return-Path: <linux-arm-msm+bounces-35287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873A9A923F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F61B20D2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E361E2600;
	Mon, 21 Oct 2024 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OjB649pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297719A28D;
	Mon, 21 Oct 2024 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729547215; cv=none; b=shf0erTdgYKnBAjWMAbThKr2FatLQjy0x2FWjRNFVqsHCVXfScFwedhWh3yt389z/h/z9Uz6hR9QOibfW4T5FMbl95KcVPbi4LKGxWN1h+FtsF5UFsJMwCRYWZJwTbBT3LD03ut/pBX5JB027vEXjw2fMUpglHLe4o2b3NG1bCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729547215; c=relaxed/simple;
	bh=Q+cvWcUVWy73ICGhozfk1+GJaKl0toxokv/FzKVseGQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SmoTcgslUb9Ywjy3kRiEs6XLYCC+jP40/LwUiAkOQiysjZPFMnDwUL7MCvRvabDv5WXpUfy+P6gwTTfYWzOYdfEQxwpxgBLDHsh/9bZeqU7lYRtl/o8glNt/SYSK227coaf1FNUa8FvWYqNNYkz7i5TorKLHaqyt8OxSc/PL8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OjB649pr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJo2vP003362;
	Mon, 21 Oct 2024 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b6UEaIhFUTz3pILviabJli
	0g9/hx0mMgyZvZpox86UM=; b=OjB649prRQUuk1fSarkPhpg0zap7F9ToejXxkM
	2IO0Km6Z3d9ekaBTVtJY/zgM9ybqRoy2LPCFYQfEfRYHyndvWTdH6F4uapWHtKqf
	UIkQUWhW14teKW0iEkd97ir7ihJ23yLYIT//oB67rCagiRAnSA1xcsumcGWAjf2U
	S72Af2JLUZ+bopXFLujlxwS2gVNJHdLSt4GVJ0g3og7vboKOzVXVF7SDo3rVPIVU
	wwlOOMBWjdvUv3fGQ9MOO7n4LDfNuevP1lG9VJU+PF9L09AVSRKYWt1DWq047OOs
	FBbaJKgNjrzjfHiMYlttSPl7VWVQNGNK2xTpNp2ekBZ5G4Lw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tux4p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:46:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLkbZB011890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:46:37 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:31 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 22 Oct 2024 03:16:02 +0530
Message-ID: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrLFmcC/2WNyw6CMBBFf4V0bU0ftAIr/8OwaIepzkLAFoiG8
 O9WjCt3c+7NnLuyhJEwsaZYWcSFEg19BnUoGNxcf0VOXWamhCpFLU/cWav5dZx5msdxiBP3sjw
 ZqFRlhWX5bYwY6LkrL23mG6VpiK99YZGf9Cer/mWL5IIrE9DpoDtbdufHTEA9HGG4s3b7+iPmN
 NH0HWHeJeS5v9PUFE4JV8vgpQ8OTCcMgvEQahdQQK2tDhaqfGTZ9gYHb4uo/gAAAA==
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
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Puranam V G Tejaswi
	<quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=2819;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=Q+cvWcUVWy73ICGhozfk1+GJaKl0toxokv/FzKVseGQ=;
 b=3j5NtmF7f6lB0oXWZr/+WLGh0MLIFzjMMot5BlXwYiptRFFm6LWydGyA+uApo0XTJg+CbLifL
 W9MYAclIlLDDaOnjuZaKqtJuNeh4UDK5mVM7giW8pWVYKj8TgWCp+ug
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vbf1FCH9qbFX9ZCXJO8ZAAnYeJwEpbAn
X-Proofpoint-GUID: Vbf1FCH9qbFX9ZCXJO8ZAAnYeJwEpbAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210155

This series adds support for Adreno 663 gpu found in SA8775P chipsets.
The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2 with the below Mesa change [1].
This series is rebased on top of msm-next.

Patch (1) & (2) for Rob Clark and Patch (3) & (4) for Bjorn

Devicetree changes have a runtime dependency on the Display DT change [2].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
[2] https://patchwork.freedesktop.org/patch/620500/?series=140216

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Puranam V G Tejaswi (4):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
      arm64: dts: qcom: sa8775p-ride: Enable Adreno 663 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 94 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 11 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 7 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>


