Return-Path: <linux-arm-msm+bounces-60178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4CACD7E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB88189282B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5111E501C;
	Wed,  4 Jun 2025 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwDbAAdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03F1DE884
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018968; cv=none; b=mKkDyE6iCwgwrzX3vQLmwPTk/WwJGC+riUZYqng4YA7sMfh0izdA4ypytKNTEgp9s7Q3u+nCRudwKm1irbOA2t1x/GOSga8YCvPvBNo0MRy47WbuEXifmJuZwfguXvFn0ida3TqhZuJhAq0zttaDSmN23HdwFm/kDvEyW73lq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018968; c=relaxed/simple;
	bh=sRbqQszFVTleAx2yTcV3Ny9IPMLYZEYMYcFeLar8vQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ppaw9/ooyzyccyl8Wfjt8NSmyec8jRfeNmTcQWGkHDf3oxwHjnx/R+6NK9Y84r1lkGLxW2BIhAilawwAYvVeUVBe5VlHj3+1CzpGGSQKQV1xwh1D/kBAdDoZLO9AtM2gPbwh91Zt1HelcVx1UrrCLPpNk5wunZUP7Ayco3+YZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwDbAAdP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553K2kKt006326
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nA1XVRfBS7e5BMoqc+7tse
	3XttDKcBTrmpygj5xAvdg=; b=PwDbAAdPSwJhBrL+HHTr9xuMI+VtMq4PRpDxXj
	hQamoktthsP4GJsBtiZ2uibnZO/lPhHeuU8x3U3Sux5NEcihHN9ny684nKt9dVT1
	tKS1ZxlDST7Ms+xVGPJwdstab6hbWjtmMSTjhOMux7Mx5Q+juo6nTVZP8CofJXYs
	9jJz5sXYMt4vDnW9njyTQsDQN09IZk89ogo+TdhwPPetEv2IbdvClV86jOrcz5v0
	MhsueavRiHZ6j8/0YDTvVTyMEMhRpYm6MENrUu+MaUYyCqmHiUnbycogLhZp4KTY
	neiYuONMsTwWhiokBn68isdG2gsHYdrEUFJ+zNCc/sjPrmRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sw32h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:36:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311fa374c2fso8626462a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018965; x=1749623765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA1XVRfBS7e5BMoqc+7tse3XttDKcBTrmpygj5xAvdg=;
        b=jrneBj3We3Pm8tDypfoVNppjxuet9PFnQkDGSqtjf7WI2y2Cw7rzEWJLMkl+AJTPqT
         AxridQXQx0Hlp4VMWfCQXl1SQLPlZbTSJ/KUoTdR2RAmOKQYdYG1xrhT9Llve+mAUzsq
         P+vJKm1nIjat8NNAFF0xmdzVqqxEHk+Z2IyFXx7ybXTxYhHIuSs/5qE1Zo+DWC7UWieA
         T+/ydb9nd1QyCZ5PLILAqHYuqzpU19YcbMB3J+Ml5nAbTRCveWVVnVDaUyKOpTCZmLsq
         SgQBKdN8/r50ZDRQO5q74JjhLbxwRTxf3L714jO5H2LCK1civrDa2A56DTAJUz5b2wNq
         3JaA==
X-Forwarded-Encrypted: i=1; AJvYcCUJn93xloTCKJqATM1TSdvMInm5pWaaUzYimi2oYU0NnaGAqGor2HMZ1vTswoUuCfHmRy30GEuhWJZ9yel1@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmtpNcYJV3nzj8IxcnjmkZgQ5jJPPSyYvsqYW6lAXwP6YBaH7
	ll1XRz0G1dLIykjXRFlmhvwmVg7MO/MYENOs1ef7WCkVhzWt9tULCYVUNUmnr9HAy4twHjqa/lx
	6kqWUkaG7GGMGpXfZAbeLSROyshM/nmFCjX494R9jtbRa1WA3kGDzKlFogBPVqCUvlVtF
X-Gm-Gg: ASbGncsXX2CcMoLJ0WKsSy4j3LwNe48vEo847GuvPmGqwvXxXlJSj2mSsbtpIJLJf//
	/CapPDEnj0VC2TD2XYQ/IL136r5IPr/EyIMehRVIeIlbg6Pip5FgEvPj9IPkwFZYDqVGP4lsSod
	qESjywvjlcO346+Q43ucfzQI8H3DoqDw0jYzT0d9lyFrVPKz8VrMHW8AAuDcuKwyJSJ6+zkQMcI
	pUpB2N7E87yUf5YL/vrN6W15TSOITwA0oifMh8F8r+vh4C5gphtPB2M7lPnhgup1m7jC1x8x0rL
	dzI3/+OuD4I+/ifWYrZbQMcVFrpm/UwpP0ZzzOEZ/4AsaYo=
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr2374555a91.2.1749018965158;
        Tue, 03 Jun 2025 23:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQEAfHrLHrtYb6LlLcMTBfH7t+WF1iQ8aSfV2f5M0nadfCyr8QFPZtK5Iq3ccs9ZdWu/Y/NQ==
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr2374515a91.2.1749018964663;
        Tue, 03 Jun 2025 23:36:04 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c298esm8286693a91.15.2025.06.03.23.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:36:03 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v4 0/2] Update PCIe PHY settings for QCS8300 and SA8775P
Date: Wed, 04 Jun 2025 12:05:56 +0530
Message-Id: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzpP2gC/1XM0QqCMBTG8VeRXbfYzs6oddV7RIRtM89FapuOR
 Hz3phDo5ffB/zex6AP5yC7FxIJPFKlt8sBDwWxdNi/PyeXNQIAWWio+dK7s/aOrRw7WnQU6Byg
 ky0EXfEXfFbvd864p9m0YVzvB8v4Z3DIJuOAOKyUNgMQTXj8DWWrs0bZvtkBJbWLQu1jlWD+V1
 NYpY4zax/M8/wC/tlZ44wAAAA==
X-Change-ID: 20250513-update_phy-2cd804dd2401
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018959; l=1413;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=sRbqQszFVTleAx2yTcV3Ny9IPMLYZEYMYcFeLar8vQI=;
 b=GCWQwRukQIyWsZ+hGbyaUbjRLBtewyIZCGZdL0bwpMgMd4OnZhqmhZU2spYQsrRYSPxMKvtii
 2AT3SI4Zx58Dh/IcYAGhadvcxCZlxEMqThxxpTBkh41+Lpg6ShjDwpa
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: -pn097qLwWPfCEreFyyI1t6zUuvho6R3
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683fe956 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=vWfPPh_LAE0cc4QMUwIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -pn097qLwWPfCEreFyyI1t6zUuvho6R3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NSBTYWx0ZWRfXztiL39OA3m02
 4Rdvco816dW06IMWOxSQKG0G4gfXFS51sBffeowxaEcgn+QWUiGQZNIffqOQHHplPIHTEjwL1ED
 F2umwzVC2xKqiIOTdbWxPOCsbGaylKQX8eGy6xO2X4pdnCfxntr6ucKcntsscx86iWO1Fi5+QLj
 rfjDY6Qe7tOQgrlmIbFsWRAw3jFCXbufO5VPWgphlvaotFOGadJZmlNmjBx051CvXgHoeitmaIu
 l9dBSMPSKUbCYCKDuXw/J1Kvto9Tu/714VOLCFiPoiFDcrQwiUmb5hJz0vCwaXSqFH1IPAr+W4m
 4byEBtoXjyTkMxwY2XnXzo/Gu9Vb4ept2RqJiHcS6vAFAIlsi5Nzn6krRaDlYkF17c91WNsZf4i
 6r1QM27jxhjsiMJnBcv8hRGzrYzjUn9mlmpHr0lyUvUDTfTpc2XHcczT4sZZORJIHaNWWDr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=553 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040055

This Series is to update PCIe PHY settings as per latest
hardware programming guide and remove max link speed dt 
property for SA8775P PCIe EP.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
V3 -> V4:
- update commit message in patch 2 as per review comment.
- Link to v3: https://lore.kernel.org/r/20250525-update_phy-v3-0-5b315cd39993@quicinc.com

V2 -> V3:
- update subject in patch 1 as per review comment
Link to v2: https://lore.kernel.org/r/20250514-update_phy-v2-0-d4f319221474@quicinc.com

v1 -> v2:
- Update commit message as per the review comments.
- Remove max-link-speed DT property.

---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for QCS8300 & SA8775P
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  2 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 66 insertions(+), 43 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-update_phy-2cd804dd2401

Best regards,
-- 
Mrinmay Sarkar <quic_msarkar@quicinc.com>


