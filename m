Return-Path: <linux-arm-msm+bounces-71725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3BB41634
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF82D5483E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1749E2D9EEC;
	Wed,  3 Sep 2025 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+J36IrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E942D9497
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884019; cv=none; b=Hw/nJ8yR5ndcU1/TrKf8e1DVZvbH14knCtbZtRgxKnLv5xUzHDZebTTh0l9WlkkMubeuFt4MQu97y2Qe4t6kkOGnTOL7M4QIf3nL6+hH7BBFMCXX4HDAApzS2vEhgQuhzU54QPxRuK4NVZKvQ/7u/DUL86wmyrjxNAjm8s70dN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884019; c=relaxed/simple;
	bh=iEHHNOUp5Zf9Seli7wZfoQELliaGPiDXzU/94llyCSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b6aax4kh3m4FHLYSCy8qDcHIYbOQ21BP7KoqdbIUf4QtIY9LvXeyExDyJvv52Tvx+X24Oj6GRNwf1l1itQbOjjY8EuEul3IKUx11FSgCAtVYZJaOEc4QjKAMoEyz6lMYlwnmVXmuQJT4dB6cfDk6VEcxDzk6gbgkQJmaKcQ1olA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+J36IrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58324FBK012188
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2JoLFn5sP4ZLLO5SjGpvmt
	sl7bGVvId7x0Y1lR5LUNY=; b=N+J36IrVFKzU/FNiGjYeNS4nZgyrAAgd6Ru6RR
	CxtKRKWGOk898kEB/GFhgzx1NssteKCliuUJ3kWWekQ2DbjUu3RJ+Q4WAIZRjmVk
	dRTEmh8VpC+4/8kH1Da1beCI0ZVs4jiJ9ok1GznVeaJi969pLBDgNnyYkrT8Db54
	5pel4QkC8d93b6ZWFRLDxMWA09788tGUwmvSg5wL9RK8ExBv32xZAk4Oz6D5/wZI
	QOOpf3a1hwnL0qspsPRxnE40G5GPxX7m8FU4al339t6QzVhRnncYJPegIJIK2eHU
	/qslFTt+qaAsFQFH0iWcARhBYNFD7aQpYOwg6zGBYAzrz77A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjfwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:20:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7725a76dcb4so531381b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884010; x=1757488810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JoLFn5sP4ZLLO5SjGpvmtsl7bGVvId7x0Y1lR5LUNY=;
        b=YgTIF33gOUAAgtD06qJesAWw5AD6oPgCHGuQIgBD2jbEr9uKTGCvJar+Ee+3O7hy4l
         6MLvvi2AWTlHjNvjqz1uQ14iW3Ze7lBGbMepyQEhG8DKBE7gRMG0CtU08/Xl29Vnm2Rz
         NLQDAKcPJS4QtuEXB+BI4+DS6M6HSKWhR7+JsVL93HXZ20IivxOLO6Rp3mZE64kkvrJd
         GNWErIQXeX4EiYBkfM3lLLH+pjncou1mr9DD+dqBllKb3prAR8w6BUg5k5TISGDgYhFQ
         b8DV4BcpYur/0LHRWmx8zLgm+raMBtJq8g0p2XcTH2QuxDRlsa9XntnCUWAQ0e7koqaA
         dNpw==
X-Gm-Message-State: AOJu0YxFyeC+H7R7ZhYeaKfvxbXypvXLU23Dc3Ko8bysp6iizVzUfqoy
	eUlLiLCq5EcRQa3zLpVdfxviH/tEv1fbMLxYw/JTDJ3KIoknqGnkPXDjsglfuo21IlJ3DlkRQW+
	T7AnnMJklmvQ3XjPDwFmwgsbg2ISDfuF3UsR+pcjteOWbh0/eFBAvmE/cxt35+IzjKuLk
X-Gm-Gg: ASbGncv0rXCjGEGNGu2Fmbg+aL8XngOZ/TMk6JMAllf4w/IVGI5dI/bvXHlf++F9P1a
	W2DFi38iJ1f5uMdMEoo4/nZ+DmEVTARfy/PAqGlsee+tbX1Y+PEgpVd/GhF9bMYfKthGptQ9B6p
	ziwTR/cjIzHoKfQS//l6YCXolCMFjqpadH/mKkBW82mHTPTbmgTP4/545LoOlKoOzQxiROTRqJS
	8pG6Ek84RILKSXO9NWIUeNT5ZI4xam1VbXjTfJnQBkOJvRbor//yIuKOzm68EuDVx8q+i7nLMdO
	CpAvX1GzEziz6RGK+UW6XkGRS6peZsUxEmNxJS836NyGKw5K4OUayBdIBhsl9ilX
X-Received: by 2002:a05:6a20:938c:b0:246:5be:ca90 with SMTP id adf61e73a8af0-24605becdb2mr3661991637.10.1756884010467;
        Wed, 03 Sep 2025 00:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1UGA8r0cWsBWyAEbAPAOFFKu4QhQwB/Mj3xz8LLJJb2d9gBhwrpWd+rEMCxpJXlx3TTV7UQ==
X-Received: by 2002:a05:6a20:938c:b0:246:5be:ca90 with SMTP id adf61e73a8af0-24605becdb2mr3661943637.10.1756884009888;
        Wed, 03 Sep 2025 00:20:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Support for Adreno 623 GPU
Date: Wed, 03 Sep 2025 12:49:51 +0530
Message-Id: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjst2gC/3XP207EIBAG4FdpuJYNMMCWxhjfwxhDgXaJ9iC0j
 WbTd5eyF9ZsvWPIzPfPXFF0wbuIquKKglt89EOfCvFQIHPRfeuwt6lGjDBBGAWsJQPcjjOO8zg
 OYcKNlKqUBJq6FCiNjcE1/iuTL6+3OrjPOcnT7RPVOjpshq7zU1Us8kTPOBjYZjsXo86ZVfGYI
 0vGCGdAty7JqABMccLMW/s+XD788/b2vTkl7gltcRcfpyF854MWmvP+332hmGClwEhhQDWW7b3
 MLWxHsPKAYInQTkvBnTHUwj0Bv0Q66ICARICpgZ6Vspy7e4LvCXVA8ERYbjXlkqQW+pdY1/UHI
 DzEf+oBAAA=
X-Change-ID: 20250213-a623-gpu-support-f6698603fb85
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=2608;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iEHHNOUp5Zf9Seli7wZfoQELliaGPiDXzU/94llyCSk=;
 b=D0JWR6w+bg4ZVSlHnoj/IzLyKrc0jTOe9GyPVcMLL8tw94rswzmMkSbALYa9b5Tj3z5ADZg6H
 TNU9SKJAV4CBarOQJNW0/WI0wUmCkHbNmH2JLNRpWTEmVIV3wwzu2yg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX67oTw2UxYF8Q
 bRLmcv/mrzRWDWMq7lD2Hpab/06/Po7OIkXYGVoWr1vWSnkDpoOSVH3Vxrw1kxm3Xe6X4JODuQy
 /WcjxGHeLS8zA0JP5QskT08FScm1RuV0kERi6ROuWBmPErdLTd+njUSh3LkPXbNBYr6ARGqpvOi
 JPXj0nHujcWGjab8PeZOXuG1/et04C3jFNSJ3QtmHTSB9B4bsCxpNrw4ZHtPU4K7f85gIpb9MPd
 VPad2rIfXDCvw3eL9srNkYdipNgcecyLp6NbElt7fHdIfEEO6ap2X+wphXUt3uxHx9fOwU858OG
 jzUQ8b3pQuQMwFFXOj76che7ttnERGdP4B+3x2Qv9u9811s/gn18sb6PqgQd+0ddnslL3O6ApjU
 X3vBpdAb
X-Proofpoint-ORIG-GUID: tNv3M7QTDo1W-YhMa65R4Lm68i95r4aJ
X-Proofpoint-GUID: tNv3M7QTDo1W-YhMa65R4Lm68i95r4aJ
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b7ec30 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xbU8ZoTWYswB9xRdz4sA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

This series adds support for A623 GPU found in QCS8300 (internal codename - Monaco)
chipsets. This GPU IP is very similar to A621 GPU, except for the UBWC configuration
and the GMU firmware.

Since the last revision, there is a new board support (monaco-evk) in the mailing
list. But I am skipping support for it in this series due to the heavy code churn
happening in that file at the moment. For Bjorn's convenience, I will share a
separate DT patch for gpu support for that board later.

First 2 patches are for Rob Clark and the rest are for Bjorn to pick up.

---
Changes in v5:
- Rebased on top of v6.17-rc3
- Added new patches for SKU detection and passive cooling support for GPU
- Link to v4: https://lore.kernel.org/r/20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com

Changes in v4:
- Correct the commit text for the new patch#1 added in v3 and drop the
incorrect R-b tag
- Link to v3: https://lore.kernel.org/r/20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com

Changes in v3:
- Rebased on top of v6.15-rc5
- Dropped drm-msm patches since they are merged in v6.15
- Correct GMU opp table in dt (Konrad)
- Remove smmu_clk from gmu clock list (Konrad)
- Update dt-bindings yaml with a new patch#1
- Link to v2: https://lore.kernel.org/r/20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com

Changes in v2:
- Fix hwcg config (Konrad)
- Split gpucc reg list patch (Rob)
- Rebase on msm-next tip
- Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com

---
Akhil P Oommen (1):
      drm/msm/adreno: Add speedbin data for A623 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: qcs8300: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/gmu: Update Adreno 623 bindings
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  34 ++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   8 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 132 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   5 +
 4 files changed, 178 insertions(+), 1 deletion(-)
---
base-commit: 89d926fa53d0a6c257c4e8ac1c00c3d9a194ef31
change-id: 20250213-a623-gpu-support-f6698603fb85
prerequisite-message-id: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
prerequisite-patch-id: d7777838f03a79704af190f43063f99334e58e53
prerequisite-patch-id: e3228ae5f83ed408ee59404be165498bc6a3e183

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


