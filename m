Return-Path: <linux-arm-msm+bounces-58319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C8ABAF70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3073A2760
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D97E21771F;
	Sun, 18 May 2025 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBnZjxmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6837260A
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565728; cv=none; b=BfNT9q467eJgAW2ZA5wa+L3Fj1XCFvd7ViqWHE8bN7MFYphkX1qeFlr9v2Leqg76HkIlYqY3QNpiAw+WN0WvMH1m57N7NjMoOvu98kLft+Z4CWIIvDd3/geHooXnf8FgOQ5JKpJ9AUrMBPXyk7d70sOCsJRz6XI6t4n932JSZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565728; c=relaxed/simple;
	bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U2dwtEnSLVZq2C1nWqjWJd7rGno1mvferDpnHxMSWZRd/tvQEWOKPAX2yws06jDL7FTa8KjgSkBTifBZRdorUe3o3TomZy9v6+jVUvVO/6mw2uoycX1dQjlpL0JfF4Hm0GwmfxMGFyCveJdxz6Wbqz1Gyyf1ywUl3BCzVImIa7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBnZjxmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9g6fU013947
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dygG9Oa2sBG+0KNu8dtwTW
	0rUBxsgf/WDp4kxnn2PEc=; b=iBnZjxmWb33dujTpgQWz2pa4msBoR+5Q5sz+VY
	LWL7CuN176Dd2I3kPi547zC8OoEoztQqojRLfS4FAEk2L4as6MK5g73fXnwCaZof
	EFhzA1PDaJ9cAIFtVbJsszpzx1du6L39T8EBY/9E+sUapMKelKwxDGo8/gATSf2E
	RzsSGUuLjRIiefScvFdMzX0VBptzQBBFF6qwyRdTRthSm7/WuH7on+wtIW9HgKJN
	uuwyPnJqzahb45W0M3EeqAnOJ2udftZ6zHxDTu/dDDpHiu7bv1giE0z2BglxyRKO
	L5+wRb6gxsCk+Ul8EFV4h0rPXtzkO6vYOhKsYnhyjQ07CyeA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4hv59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c461eea3so20597676d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565724; x=1748170524;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dygG9Oa2sBG+0KNu8dtwTW0rUBxsgf/WDp4kxnn2PEc=;
        b=HIfBFX8VxJ1cGKFF7+MVmaL1S1yR0LgEA9rst35vlYinMSPRbx5vJN/HzCjsrriPtI
         xGahfX2x3ctk1dqruOcCsZQjRLvcHry7bYxUWSh2/42tS/o5mJqMNWlyZdw5TUgXzOer
         xuRWcVHTpLjI/M54rOnXYJFQBElMAdxnOBs1yYrwcJadeQgpqX50wP2JoJk+lLyFqM/u
         fpTW1iX1mQ+0MesK56PqIvaFckkNC8iJ7NsxuxyN1jsFmf51oezBkBXS5xsG0bJaqdG4
         iewgB0ZUS8h2xFHRuW2elL93EzN1QOoN6QNBaLibwBS1esb8AxbLusc1qEgqaISrKWiy
         KFJw==
X-Gm-Message-State: AOJu0YxcWykqaNNjDyDeff4b4qk0XLfSty3bcFcgCW8PI1XLBXp93AL2
	3KY+6npogfLZUC77dJUl7vfanaJNH2BZwf7An+qLlXdyxoonRrJUhZjRkQJIeHb85iLExKDVD8R
	YELmHDPO50yfUdhBquNuxAXj9F2ZuNBxFGj44gEx6juIR7Qk+2nxB7HXijPZytGkdQ6yx
X-Gm-Gg: ASbGncuE2F26lnSHq7//kO5Adbb6UVxI2yofDo37SCWA9LHTHvwprV+qnfrtqLY27PJ
	AuK2VenPfQUpxgihAaDIlBUL+2adqX2nnWyOUufYOTq5byEL3RxRo6OqALvBUQ/BIpbMg2REDxZ
	W+YehJSQjeo8r1mrKCLHjhpZKxHgsAyLAV8Oz/jeZAJITCz1qpvnEALWbOVVJ3AWaOVnUp5JZVZ
	YxTawaTYR4ckqHp35YDGLYY1+eSxLZ0N+iSCs36sTQNN70jTlnao4ZjIcHxY1iqp8dwKLzi9i+E
	yrJLU6klo/jfkafV9W4bkNJbN1ucuoumJN3zUTvXBkMvFTjNjX/4J/lwoPLxOX2yB9KMPjqRkQB
	XJ7PqJuvYSXFAGvZWXx9+wgJp
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr150111536d6.22.1747565724602;
        Sun, 18 May 2025 03:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1waGEaJBOHUK/hXbXkrMHI3pyZOv6MMf2NSoKVTkW0bnd18eZ3+aO951TZ4oxQfBZX6BEjQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr150111226d6.22.1747565724202;
        Sun, 18 May 2025 03:55:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sun, 18 May 2025 13:55:18 +0300
Message-Id: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa8KWgC/23MQQqDMBCF4atI1o1MYlTsqvcoXcQYNWCMzWhoE
 e/eKJRC283AP/C+laD2RiM5JyvxOhg0boyRnRKiejl2mpomNuHAcxCMUYuWdtNCcRrMTHkJTIt
 KC2iBxM3kdWseh3e9xe4Nzs4/Dz6w/fuWsi8pMAqUsYy3oi5YocqLQ0zvixyUszaNh+xg4B8kh
 x+E7wivuKoltLls/iDbtr0A1rWx0fYAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZIHkrqMMH0USJE6kCasx6u1cWMm0W79nDq
 jl6dI9t7rKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1ZomB/9y036miSvgEAw9vHR7r7LrHb9fxll6SJ3eLtFTnNiffFNDOi2NN/AWOJHGVd8jeEZMWa+
 4OTSYknrf6+bWW4fLwXSLuiJa627h/P5K41g/PStC+sn+J3FsD/W2HEsj9/5dvPSwZPZmVEejwp
 2fhW+gphC3CTVNrr4jBYxAUxmLX6GmNQIXBbkJTRQYndpjoO0q+kEFHvdSjBEDKzVTd/xauPkGv
 eqSrsVv39o/fXKGVdQaxEHj27uyc1JSnXgAinziyHiEj081TYokrx58H2Z9nu3dK8yH7dPFX7cD
 hpgPbParfyHz2O45FcY6iUSjxq7ChCJhAMaRKtkVGWhy7jg6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SjxqsZPGSni5UYVzQFo9vJgOh3Np7Lp0
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=6829bc9d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: SjxqsZPGSni5UYVzQFo9vJgOh3Np7Lp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX0a5sKDK7NOxP
 Oa3lkKkVAKAMtdjp+MMi4yySLg4/hZFl2eR1QV50KeM4oHjhWmBAD+eMFeUHBrqNY8DRHOesOGy
 bCN3dC6gZhWapqc50KNAQHNgwVj4Blhbmlq7w9xlASa9vlVyl40X476WjgYWphLSVT42YNul5zI
 vqwhd/OjrxZf3TXwYXdPlWxdMuxwNITsU78ViKe/RQcnpt3JlKjaH9zUCekEnXAA1ig1PBzorQ/
 tZzcx+jceNZVLJiixLiCLisQ4FsAyVdBO/aI8XPYUH7+m8lF2B4oXktm5IPpbDQCQa/pZG2qnGU
 +LirfVQyBjalSvm1aT9xQyXbPztGHRm1FwMFlCSQHtdSX2iVngSiAUrsom6dKxFedWlVRTI7Q0U
 YcwDCJEuQmgpwYGBgmR5UHNYGtG/t7jr6mgxuN+0wfBtMDE8bB1jnGKDd+VZjOAus/4XUuxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Disabled SYNCOBJ / SYNCOBJ_TIMELINE for KMS-only driver (Rob Clark)
- Further refine Kconfig dependencies
- Link to v2: https://lore.kernel.org/r/20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com

Changes in v2:
- Got rid of mdp4_crtc.id and msm_drm_private.num_crtcs
- Moved msm_drm_private.wq and msm_drm_private.event_thread to struct
  msm_kms (Rob Clark)
- Moved HDMI / DSI / DP pointers to msm_kms (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig                       |  59 ++++--
 drivers/gpu/drm/msm/Makefile                      |  31 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c        |  39 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  35 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  17 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                 |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c               |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  13 +-
 drivers/gpu/drm/msm/msm_debugfs.c                 | 222 ++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.c                     | 203 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 550 insertions(+), 342 deletions(-)
---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


