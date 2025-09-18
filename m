Return-Path: <linux-arm-msm+bounces-74016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05938B82CDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF9E485AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B43213236;
	Thu, 18 Sep 2025 03:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3y7Y/dJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5123C4E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167478; cv=none; b=GiuKJEbzE0LY09Q5nJgsbTMs0tgqRCKXsTMtoGIzElKhoqFlnUAMBScwPIoSdC1A4/m4bBDGVCImsHd0HnX7LYXfyWsh25YZQ4drEZ+FV6tamkasdWkQnFuLvr4z4YlFXLKnqODZpN/7KmEKC8NTkAQKcKxZh1Bm2c2uEI0HKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167478; c=relaxed/simple;
	bh=N12mAH4AEAt7MmcqShE1P3CEHF675u7xLlRmXgGx5Xo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nuMkdJ6UE3vdtbQLbnnBrh2lrglkJCb2eraKtkXqnzDsmEoO8XAWdjz6mH4ElHa9d9NpLKa1r+ebRCFmzp7INlbMKgNtVJEzRGvaOEpSQz0W7uRNRIg91cxqUbYmXu3jqbRaqOQ3H5EfN9DoL1dGPSecfaALOVQB9dTFYUrbP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3y7Y/dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3P7mp018228
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=le3hcgVXjn8geHN7AQBsWT
	xvYkhBX1Lcw++MHyY4VEk=; b=X3y7Y/dJmEZaNlp4uMoE94qP3P2nxCu4BepXJf
	jfFi5ZXwIn+PxTpvLMGPRR8ChVjwwRK89iHg7gk/nbqo2V7DyZnzzfxDIaMIwrR8
	Fi75ZKd/Wr3c6y18aHk68+dlqxa1dG8Ms/Jzw/sSHpmIFDC8Smeu+RCsZMAp+Edi
	9zsbGXrXjpqkU/33HRcuQh0CUpGVihxATJXdYuWGdTMQN8KQK3S3yt38VPXExaSL
	+GCg3M4QeBnT6/I+a19Yq/6AY8ajkWoKk4EScTshkYivX2pn2u8Dr9LOxQlR+Ug1
	aOFmf6/cFd9hW802oVa+Rol2o3x9L+1p7U6eTVCUhkpmH9Vg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwcsjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b62de0167aso12886661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167474; x=1758772274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le3hcgVXjn8geHN7AQBsWTxvYkhBX1Lcw++MHyY4VEk=;
        b=nRG1XW+JbC4IuiUvWsDWIvex6iR7ekRL/YpU1QzR7kr7QioiTnSKmj/nVyAMcxyN7Z
         wKeH68dolfgwq4HGl0mL7Ry/dR26O4hes6IXr/waR4zqSDCNUIWhh8rgvof9ULXqhkK4
         zCRfYeQa8PVB/odI7WUnhF/E0TUToZokr7wzlzCVJy02w4rlQwEMbivtfJTMvtwOumh1
         akmIvWTJVdIDwu+iVMaCMWRxWoDGhwy5VqoMYT3fReZk6oofGIPLY5NHxnJwLyKKikEp
         Jf+vjPvwobsSoVPn3YaQITNWrBim02IdUjWzUhy792rlZDz9YL0BTf2jINgTMWp3mDsb
         y1vg==
X-Gm-Message-State: AOJu0YytZ9UYh0KYhwOjW+zz3iBHAa6S8giWPtjH4tQH46Zv8bVagB/Z
	ncersEV0UanUnzYjqSNV2bPq+F6BcvLi8/3mtOAvRKhtJLnQ5yltflORrCT1RL+BvlnswIkOW9O
	+wQqN10atLedvW9vfFnF5FEM+uUHPBLW+ZY8fWLbbz5c2ay7nCSVK283oRrUXH4RONoaa
X-Gm-Gg: ASbGncvHRpByEfBvFsusc1IpJSinbsQNNDxrUk8gC+En8jk0XZVermxJU5kEuEeI11V
	LFqdItN5qThjJddMXlDQCMfjI3D1BBRhhokTHSUafiD1l7+e72z49NAsNeuiZoUIWSq6iJsZF1I
	8kWcbNSO4isaCJnyKK2kckY6nJ7ynbk2M4CO/KMr0IL9cGJvdc9g9TpBf9NUpHxoesodPpNuCB3
	hPiwoUdis9jBag8vXroaeq/r0tOjWexljGENSC1hWHqEdosjfKHbXCKD94Sz9b02x7YbhbXW8zU
	TE+99lyKCnHsyiDXUFXFhP3IX+t3OVOIrY6kf5eRJ9JjhZ3aJfjUg6AFzdysqH/X9ngNvkJ1B1t
	98EXIyRxLHNhnogGIbhi7YjVfyx8I3S2N6Y0u9GO3wfbTa/JtLPBp
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id d75a77b69052e-4ba6d819d77mr56422911cf.55.1758167474473;
        Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk+JT0nmGXpYlGzcsiZnvebGGF+RyXL6mJsOObPCr7jEILfS/0AWa9sVdxR5sxI5O0qDmEZQ==
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id d75a77b69052e-4ba6d819d77mr56422661cf.55.1758167474005;
        Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:51:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: rework the ties between KMS and GPU parts
 of the driver
Date: Thu, 18 Sep 2025 06:50:21 +0300
Message-Id: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2By2gC/3XPwQrCMAyA4VeRnq0kaWs3T76HeNhqqgXn5jqHI
 nt3O0GUqZfAH8gHuYvIbeAoVrO7aLkPMdSnFGY+E+5QnPYswy61ICADGlFWsZL75iJjcwydJAv
 IOmcNHkS6aVr24fr0NtvUhxC7ur09+R7H7UtSE6lHCRJRkdflEpfOrusYF+dLcXR1VS3SECPY0
 xsx8IXQiFBOrizAm2L3B1EfCGZTRCUEOEfO2Fog9QfRb8SCmSI6Ib7UFpzO0lv4AxmG4QEbzZH
 1gAEAAA==
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3268;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N12mAH4AEAt7MmcqShE1P3CEHF675u7xLlRmXgGx5Xo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GtJ5eB/xL4gUiMVxXXYJu5iL4TDfPX2/WvQ
 AE2GvhevTqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1bGaCACrcfl54E/NPTAiqJJvaiIh87+3wEmrZe5uAs+zCxfSkb/1/O3vl7fIMGOxtOchxgYTAqi
 cNlwfhGmodkeo+b5qM/8DyUuYNje1wRgr4VF1LosjPB1sV4b4V6Hju7/mTqEWi6sImMBFvw9BlD
 ce7JM8BemdWIzrE5XQj/DSR4vFIyxU3nCTq54eOx5bz/uUgnm2jA9TxaSS8hBYyevK1Afifm3tO
 MdYoYTOUQ+HZdQ5hNk0qGui7mAGxKRDkdvddYmBm8AgYLvWSwDL/0nUg2iJWiXAM6SRI8NCZQV0
 J2WFGYHxG6s4TooNwqEc5jy2TQwwR2x4k/mFvVXYy/TEtp+h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cb81b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX93N3UbvhXqOp
 BefaJ5PU7vHCtvpYmPdK8u2ItuFdvR5Jkw0VatyEIfKdtorzTBfT7tl4RBpxhUEFLwpkgQgSvFy
 Q7GfhsMMoLIGlV2/5a7m4T354oXE0SduDtUJRy0RMfEu/DjMpOOaX7028mA5klkYcJPR73nZxE2
 86amIV4ngOdQ5Pt75jPkimYpW3Wb1ABb957plVkR7AOF0XZX463TRWEvaOl4VCsLQJvWe0iEEI2
 SA5t/c/qddkSCFpAwxB9jV4Z3pl66Lu4Xi52tazaLun99oksxFvlkIrKK1YV9SJvLq17BiVrv5b
 h+UX3NcV8SM1qVC8F8W3p3JUnRaUZFnk5p6mQvSXZc8XW2h2OSx12KWd2KoayEtd0RJxihz5HSn
 7lqIvGNK
X-Proofpoint-GUID: V-0ZwwaP7AKg2xD46kKO56ewlaCzTNhK
X-Proofpoint-ORIG-GUID: V-0ZwwaP7AKg2xD46kKO56ewlaCzTNhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

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
Changes in v5:
- Rebased on msm-next, dropped applied patches, re-picked up no-GPU
  patch
- Rewored debugfs, GEM VM_BIND and ioctls code to reduce number of
  #ifdef's
- Link to v4: https://lore.kernel.org/r/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com

Changes in v4:
- Rebased on msm-next(-robclark)
- Temporarily dropped the "no-GPU" patch, it will be reposted later
  (Rob)
- Link to v3: https://lore.kernel.org/r/20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com

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
Dmitry Baryshkov (5):
      drm/msm: correct separate_gpu_kms description
      drm/msm: split VM_BIND from the rest of GEM VMA code
      drm/msm: split away IOCTLs implementation
      drm/msm: split debugfs implementation
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig           |   27 +-
 drivers/gpu/drm/msm/Makefile          |   21 +-
 drivers/gpu/drm/msm/msm_debugfs.c     |  420 ------------
 drivers/gpu/drm/msm/msm_debugfs.h     |   14 -
 drivers/gpu/drm/msm/msm_drv.c         |  645 +++---------------
 drivers/gpu/drm/msm/msm_drv.h         |   16 -
 drivers/gpu/drm/msm/msm_gem.h         |   10 +
 drivers/gpu/drm/msm/msm_gem_debugfs.c |   96 +++
 drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------------
 drivers/gpu/drm/msm/msm_gem_vma.h     |  119 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |   45 ++
 drivers/gpu/drm/msm/msm_gpu.h         |  111 +++-
 drivers/gpu/drm/msm/msm_gpu_debugfs.c |  213 ++++++
 drivers/gpu/drm/msm/msm_ioctl.c       |  484 ++++++++++++++
 drivers/gpu/drm/msm/msm_ioctl.h       |   37 ++
 drivers/gpu/drm/msm/msm_kms.h         |    8 +
 drivers/gpu/drm/msm/msm_kms_debugfs.c |  129 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |   12 +-
 19 files changed, 2463 insertions(+), 2237 deletions(-)
---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
With best wishes
Dmitry


