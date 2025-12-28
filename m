Return-Path: <linux-arm-msm+bounces-86706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79443CE4902
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 05:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF1630124C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786E22309B2;
	Sun, 28 Dec 2025 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uni5/zho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPV43Wda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0422DFB8
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894565; cv=none; b=WudSugvwqE2FoAQKKqkVrIHtOlaERKo/71icW3urYyPcvXnk1Dt5lyW/1OeKphNTtG5yvV8SOOx9xfJhwQ5zuyCd4YSncq4JTQLSwpb6tv8xNSFY+iP4OCPFNqBsc2YYACBpLx5z1iDU+qi16NSKVFMSoB5zWxsw8tgZwJgkNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894565; c=relaxed/simple;
	bh=8F0/aAwRBj858vZ8ct+6ltrWoHhyWEPgLsSprjV+b54=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HP1EF0udbkA4WOJKIB/2dn9Lahww+BX8TL5JddJ4/gwQdb+ZFpsvtzgvyZK9C48Y5U0WrcIdMzgIRD0eYzipTEb5Dejrsj53Z9yOQAVm++8XlSURpVdlLeK51RD4qi7C9B6yNDGh5OwQFlgxqiNSR/hMVKQnXYz7wUl7P88kYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uni5/zho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPV43Wda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS0tEL91685690
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yjyk35jIf9nu7s4uHxWxaY
	Z7kPYBr0xMnxEiqxa1se8=; b=Uni5/zhokroNeQkSls4taIDgp1cOar5rrxxwJy
	WiE4CFm3U1dMvN+MWj0InHaaBkI7TiIMjhF6KyFX8YzHMANA5o/UNF4on9bMYPnW
	i7QKoY6rV+R92OOI+LU1g46W7K8DAQ8Lui4ZdkltFxU4DDfbQcUxefww+lIVrgdI
	6vcRsnPTiLc1+h2pxQe5ngalIRRNtLeZWDVMdFrP15Vf980+i5nDevouTEMyQq2P
	m05yMAQUnP1Vxew08HDYbbNxZFd24llnuO1+dNArG52V4qRywGDXZtQs9qbXlUOL
	ZoeB6DSSvqIh/Ec6iPBW1yH/E40aOa1qtHpWHqqhCdfiU2Mg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wsn5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4ab58098eso194909961cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 20:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766894560; x=1767499360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjyk35jIf9nu7s4uHxWxaYZ7kPYBr0xMnxEiqxa1se8=;
        b=DPV43WdagIaFcwih34rlxup26VamRPqKP26jbacFC5CKakQVLycaKvXkpkfhnDaHyg
         BFQZJq0KoXb1BygaYHEKmoE0gz9uK66khuGWtKT3OZKx4SlF20a3AjlVUwXqkoyvpy00
         w06Cm9Oxry7LowZjFq/6QXNj680o1GIxLvXPhVlpxe6fcT3XG1H7PKK4SZgCLxXgZUbh
         PWTL0yMuAw9kphMLF75EN073LzDvRFSkoyYcfK/3xTRDsO/Hww8vYJmVunUdmzKLMKY0
         ZcorZAHk5n5UEq8lH3dM0E4bEXjGkarSG14UCMkzl6ObEJaI43uckcAjgOmVzSIzg+Mu
         PlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766894560; x=1767499360;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjyk35jIf9nu7s4uHxWxaYZ7kPYBr0xMnxEiqxa1se8=;
        b=nwM8gEsDtrzIYgELpFwR2DKQDt3KnFMfHC6tfaO8jNH1j+N4R+ntNdxrlbSwLiXWJ5
         yMTsvscL5dBuC1DdAqF8Z3q+wp8lL/Ya6WjeRqBW5pebGfaJqlIeJUiDNKkOVBsvwRTj
         jd3Jo118zLbCXmvdrMy2WNs15tCevZ0HD1WkKW4V0pjvGVQkCZmELzko90ws9k0H2ihv
         ZrukW5uC22SvI9aomct63/xcuaCpH4Cw6qesiP6hXq+RQOVe4o1tu2Atw1PW3sA6/6zj
         YLGMTa9hAm92rJb/4V5v/zV5OcYvvDTLu6yfP4uqli27obI0KnZdv4hIBHT1DuhZXbkJ
         FepA==
X-Gm-Message-State: AOJu0Yz3vMUUQvtT6PmAtb1eZ6BV6cl+qESYFnmkKF3/BTWaMKK6hIdT
	4PyX6XxG7Ulw/+0JH/m69GxhrHeIbUU+PvKU6jq7zVYhZJwCfE2gYNPT9Nedro5T3mBQqNY7xhk
	ded0eZlYgq+WojLi2+3mR5P4je0qsZk+KGPyL1dgLOs3tGmMad75tQ9dmXhY3TowdyoO7
X-Gm-Gg: AY/fxX6EgwoWefMRaeW1VXx129Kqveiv1DYJwSBY2EqhyyunZzxlQp5xAwb92lt0vWJ
	zX5xDEK14Ulx1lrVu2VDvkevGabWQaenkO+2802HLmTGOE9aJ3pUSuR9isYad4XPyCLsYVNemST
	ryvu8W6q8xqs0qpj3BR83YmYTHOOUz9LczEm4WmGpG0a17vUOEi7q+4m12dld3oj2nZ+bnTiLFD
	li7aeHQHkMjWOGge0t/wIu7yo81Z/5CUWc6DCJpgTN9LJTXwmkOXOjz2n39xD/CDxDui44zF00I
	bzDe4suXMCW7a1GZqQn2GI52dMhs1fCKHNO7FkRwyBIzz0WVWcdLshZCiuCdG8WOdYJSAOX9xJ2
	ILhYmA4Sw3r0oRq/4aKMfTfQO+vLI6A+d/h93nqIFV/vpRCQgCxNUq4TkOhmgL0gXkGhVNxPWiR
	AGyMaYKioUzKt+1IMEcvzmSfQ=
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f4abd75109mr435966341cf.48.1766894560234;
        Sat, 27 Dec 2025 20:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlIWPeKQp2TTh9o13CbNammyTEmgMkAQ6zhpjyqaSCJj8cT3OGg0tcgjDdtOL0q1vypMIKkw==
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f4abd75109mr435966081cf.48.1766894559805;
        Sat, 27 Dec 2025 20:02:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 20:02:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Sun, 28 Dec 2025 06:02:26 +0200
Message-Id: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKrUGkC/3XMTQ6CMBCG4auYrh3SmZafuvIexgXQIk2EYqtEY
 7i7hRUR3UzyTvI9bxaMtyaww+7NvBltsK6PIfc7VrdlfzFgdWxGnFKuKINODylo7wbQw0OAKKq
 aSy0lcsHiaPCmsc8FPJ1jtzbcnX8t/ojzd6GQEL+pEQGBlxyLTCvK0/zoQkhuj/Jau65L4mGzO
 NJaKTYKAQdEUqpBpZSmP4pYKSQ3iohKo/OqKlKZ1YL/UKZp+gAZTW8HPwEAAA==
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8F0/aAwRBj858vZ8ct+6ltrWoHhyWEPgLsSprjV+b54=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvbrVT5D6fwbauZ4LESnuJVsMYI28B2gdTqe
 O0yb+g5K4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr2wAKCRCLPIo+Aiko
 1ZyRB/4uiiQnBr5u3EFLFbgnFAsfZtK+NRBJuJYZaWG+Zdgvo9jYzCjl54QMR3XumfDMeCAZNJe
 AAikANRM2/hQ4fRt2LpbY6g9jW3mvAH6hs0A199/m7i/MkLjZ+RGUsPKOUoo7DbAFCGhiFxiXyl
 l2j43A8MT52Cv+9ERuMjFSxHzsMmQfw//YsouSQTH76GoGjTg15DguNR2iYBuJvm0Es4UDX+TIa
 DUGOrI8ZSQ8e3M2NiEhPg/EV8FiDWbK+jsMJ5hub2yQjqKK+pYhIx30tc6TCk4hHMrmvG84ZMXu
 Z98BDCmueD/jirWSBk85kL6QRO8LS1gsQGf2jhIPPJrDkIrp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX5GVtRyQ4mMfo
 /fKgF6D5x1/iLPNjAj5fKa5r6uX044i56eyCigt6S4QW4f3lSLCQBfOE/Q4WH4dQkMeY/CCJ/+U
 LK0X+/iyTMoNEW2XqYt78BUFLTbaSZhdYrWA/moCuATt+cVJe6Ffro0876N9xeBDKsfjhG4AnQV
 EdBOpqmSZxfLl/TIX8rkozUDyfJ5n99Al7o51eZFETJ1MYxN8wqHD16P2RbZVyCFaRJJjL3lArW
 XrwXfP20TkzZkcXrgCg3g8IXuIa4wJo80SLJSn/++JfFBwCxTEnT+vA5CrpuUoVk8OAk9rSDYJK
 nutkzTuyv2/DB2QGlwAqz2QgdgReW4WAfSWJcgsJg6FCaD2oB892GaBZKVMdEh13F4UASqx3YrS
 w+mKZZM2vBSNhYMeQ6Ts1KPbFLodfS7c9M2fat5a5Pcbj9h18Zhtnx68PsLpbc7Uo78pA80//m/
 MYeQv3sfndLBUgLU33Q==
X-Proofpoint-ORIG-GUID: FAtjf37f7bckcY0BnxMHO2UWWldYHxjo
X-Proofpoint-GUID: FAtjf37f7bckcY0BnxMHO2UWWldYHxjo
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6950abe1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4sc70ZTd7FF4WO1t3xwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280035

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
  for the feature rather than the lack of it.
- Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com

Changes in v3:
- Fixed commit message (Marijn)
- Reordered CTL_START checks to be more logical (Marijn)
- Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com

Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 17 insertions(+), 335 deletions(-)
---
base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry


