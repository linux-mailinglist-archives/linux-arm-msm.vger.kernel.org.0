Return-Path: <linux-arm-msm+bounces-77806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5CBEB072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07AC85E4614
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6A12FDC56;
	Fri, 17 Oct 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHgOEreW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F702E9743
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720943; cv=none; b=S9J29sADiSbpIWWP+HbNjC/dnuw79FixFr4c8Z207W5bDzhofTvd8lWgVN3kIbzkBTR7yqYJcYOKnQw9YDuJspHNqRDzApEMCFEpz7ZzbHbZC2aE/FrhEQ5d1qNcJnrjMuR0ik9Z9rAdb7lrHFBejzPyroG3Uu4n1pFDkwOt7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720943; c=relaxed/simple;
	bh=TBtnh6miwgQv8qy4YxihSPZwnvBgSc+1qmJKsqgsLRw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hh2haveWRtyb5Xf4V8duU2R655keyTuiEr+L2zkIhHq8kifUibub62qOXEJgFiLWs+b57ZsAI/bZAx6IW/KH2MfeeZ4gx6kbt84GReNdh77axahmBp3JGokmeT0t2WVwfn72taExQWG7bePYr5H4TWnH+Nf/Hi7BQ5yYSxGRjCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHgOEreW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HG5cqP022338
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T/pxneW0GGPQT6fV2Oc8q6
	PoK83hK+J2n9XaZIObRAU=; b=oHgOEreWy24QFTZlUVBlwmW5OvR3dOWoGq6HKh
	293zIN+SJWqTOH2lWYOMklnmI6WCEXhlDc4cjn45WBhMx0woO6FPQfROKrNkbg+H
	HybTX3igTgms2DN/c3pXqKh/KG6TKjDevjYChtsF7fkI/rxgvcJWsDOMhL0Wk0iZ
	JZbENgUGB0W3YE1JgD4r1hGsqWm+q7PBMDfL5HdY/UjZTucmMsIwC27n8WeAmpwb
	vrtHMW4JMknXEsJSD0rMIBdUkllJp957fKMTan4oiBA3HHnzGW9KUbS4l88BmE0g
	DRI3Tlh9T5q141HcMgY+FyTUJ0Lk4m3EZyLNmTyRJUyFTXVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso53962345ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720939; x=1761325739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/pxneW0GGPQT6fV2Oc8q6PoK83hK+J2n9XaZIObRAU=;
        b=NhaVbnftvvGim/vD4dG5JjIb2qFIH1SyB+eNPZd5Bdpi0vnLCsG3EFy1wONmAoZxe6
         p7f2hyqmsYtGNV5GiGJv+AWgVjdOJhp6UFw5xCTkFDQeoRkRzi8KPM35iPgYSgnzL7h8
         jt/x2ccHIT69mr4BDj2LQnnnhPJTG4KzscsP0NpwsxAAGciraWiwkhsFRSA8naOg4vYE
         CApG8u6JMC6dHYcVPicYd0iqQMxHqFzxeoUl1wuYbrEON8vkb2Ip2HBJKZ3Ng7C56h7Q
         bUgjkRmyZNF5sjBVf4wil82MUWY7gJ/zZXS699KdWqLyEq2JfOC/XPvnVX5nouv2VwG+
         QzBw==
X-Gm-Message-State: AOJu0YwvKapmp//4u9UA/KSC8tTVtwyNdvE4NEVudrB19WKfARtDQ8mB
	7RYR0zpEGiiZ3kHZAwd9BQqMBLWtOrNsv59lUApFZoMr18LPXwcIS58357oyZOzK23WLxdTE1Ad
	3yb6Z3oXKUaJTi/WgVhTBYkfnmp9G4eIrA94+leCmCs2g52T0alzeyyLQRvY8saH0YEX8
X-Gm-Gg: ASbGncvirYT+Dsk06kPkqwWmA6RRazmChbBomsmWoe0UoobPBiypYr4Fgvuxh3003/6
	aqGTLBa08p3mhFr01Or7w1k2CAL/wiTQJtoTBLfqo9eTbQDQvoPw0AjnfLq7eoH36Y/FP2qY45u
	Eqj9e/pPICN8At0BnhRxHlL6QLnp7yfX7z1lJcTpvWVvLjgfqbgRbnOa06tnUrR8eMJuvf8tB7W
	Xb5OSO1b4sWBYxYpKaYQHTKlLkYCTZvwmvlKRNazRhXpt/yUmg58v3oIme1eRokSeflaMiNqOMC
	t6JMkI+ujh/v2DrCPpEj3YVsgyafaSZ9ZwLdKha/EursJq1qxQlEG6ITOZ3/MREK9vRAymGfNAs
	Ub2m8qt3mprwLGZuXtis0KAo=
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id d9443c01a7336-290ca121e99mr59640035ad.36.1760720938703;
        Fri, 17 Oct 2025 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+KFNhG5PcZbke3N7Al16y0Yp79mNDUlOZzFtifVQr0J9r+kCgoWT/WU7gFhlnqZFx5kLQEw==
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id d9443c01a7336-290ca121e99mr59639625ad.36.1760720938250;
        Fri, 17 Oct 2025 10:08:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:08:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] Support for Adreno 612 GPU - Respin
Date: Fri, 17 Oct 2025 22:38:28 +0530
Message-Id: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx48mgC/yWMQQqDMBBFrxJm3SlJaES9SnFhktHOwqgZlYJ49
 4a6+rwP750glJkEWnVCpoOF51TAPBSET59GQo6FwWrrjDYO1yBVGVk4oUWKL+d1JN80NRRnyTT
 w9997dzdnWveS3e4TfC+EYZ4m3lp1VE9TYw4Guuv6AffKjguMAAAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3877;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TBtnh6miwgQv8qy4YxihSPZwnvBgSc+1qmJKsqgsLRw=;
 b=4vlqn1FI+5GLuRp7hEPEMU6tpBGe/cYZpbh7e15CysO9nwiTDdXKs7XfOcCbNDUQ9lpt5zfyz
 vOTIQvH0kErDs3BQI8ITy1aMbf68szIQY7oWYSlrtjxsDwvqSv8bPxn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: tz6OANNOF9YMtkWbHRQonpSy7NMNI2b4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX2j2lFFI+X3ka
 3cOYq6P4cyqpTUHQZ6+hLhUTrPAscxlZBlYT26mTvLWpjbgtQwrCftCShv0khD4sVCrbrsHBefM
 NipYeJcGJexasJMQBIJKK+uLRQFiIH1fmSuQ41ZcuLwDKi8roQ5cMImNFY00Jsx7M2DvNCOnp8A
 l3/qtBASNlGkck0knUyCcFoxwVZL/25o7iyvD8dtTRn+FqXqKnaPDPYYpQcgsTgodcEDWVi+gdR
 7BWiMf9a9r850qFnD3m8EWdUVBaHsp9tipficfrdw78KqAP31NAmjzLMXWttHdYurvltHtexO5M
 i76fHekRLcIiEP4yRB650Rpl7ZE4A6cyhCyoyQl6eh/rDte5LfyCqG5WO3XLXztFA/MUbVnzab5
 fI7IMQfCrtIJ5XrBBy3AeeeHa1KwvA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f2782c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=vemyJuc05ARF21wryp8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: tz6OANNOF9YMtkWbHRQonpSy7NMNI2b4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (2):
      dt-bindings: display/msm: gpu: Document A612 GPU
      dt-bindings: display/msm/gmu: Document A612 RGMU

Jie Zhang (3):
      drm/msm/a6xx: Add support for Adreno 612
      arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: qcs615: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gmu.yaml       |  98 +++++++++++---
 .../devicetree/bindings/display/msm/gpu.yaml       |  31 ++++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 139 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  87 ++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
 11 files changed, 511 insertions(+), 32 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


