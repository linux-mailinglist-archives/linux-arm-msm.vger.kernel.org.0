Return-Path: <linux-arm-msm+bounces-88025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FED03F6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32FF834FACF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD2C357A2E;
	Thu,  8 Jan 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYskxefg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBDeYLjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8038354AFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862655; cv=none; b=eHiz/Dn95OAJy5ZcG4SBiBaF+ea5sg44uyKqF6vkEG5rwKoOsBCLcjb5SpMPHaAoVtpRPDKMhWsn/QLxKSGHwqPq6+DxFfqiFitB21uuTLaqkmljUpWiPCjrzDyNgrz+bXxxgo2ukdlVYSxUS1boQt3cJ8DoqXbJMLDXauBg7q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862655; c=relaxed/simple;
	bh=CndXCG5a8wBRnV+dH+D95I+BF+zuEB9hnxZSFdu0LhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mVykifoZUDOpbsEkUHfdh4+CZfSpPBMe75EUrzGPFqOSGNA8//v/3VdIsms8pq1JggSy+vr3FNYH1hozJCx18Pl5B/EFMupDdc5p2BPoQDj8EKdPUNLa19MqN5dVGoRPRFAmM7Sj81/kmYG0okQ/N5rQHfL5IS04f6BZXKyKIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYskxefg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBDeYLjH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VUL91838286
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJY
	dzLZlEnk=; b=IYskxefgt3QRAw3h5dijBTuGfQU6xrIVrgScfONlibyz30vOdJT
	TRlKwyNbA0VyR59BNjHD6yuh3hjKz/2Sj7XVCnw95EGgW0ZIeUqn1h9HbtA4A8ko
	ZBGLdijus7sGxVtiZ5LaaKmb+pSH71mCyIAU4IOmQ8WKM1SALWm3j93nM/gat6Zm
	wwSxifHphvqDc90pMmsNmqOhpw2nQzxGrTrzzrB0e/YTz40su8gMNlUyHPzGJNbP
	qpjFWLcJdmxnyA/nanIAoBaGgYS6xU0Mskh9AyptxX6mWexdC0suxNONoyT2jgf0
	hDDxZ+msI6BGJ14awRdvOlCKlG7KSilLZNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89207w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:57:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso46106461cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862646; x=1768467446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJYdzLZlEnk=;
        b=fBDeYLjHIZZdw2+rf+j6Q4ASPqjy75aORHsuuuLW7yT2sglSP+rjPg36Q6SLjmMNt+
         S+VSfHLPf+o9Ooe/Amlv8QB6pv8UYIT48GVxGguJmkTOli+rts0s0AugtrgYeNP5nzZQ
         sWHLsIGv6sJC0VWH7xx14SbgahuyTYHefpeZ4sZFsezvNsA3vfjiUZlQ5rQFuzRabCvw
         5RhkNnPMiljz5TyhkoMkookwVYkysEeIKvHjrw2Jetzcni7loYrjHAOEJry0s1+HL8r9
         itZUsG6eC9s2JAIA7TDrbW5CED9sZeqZ6hiRoUR5Ulrjbc3KVaDWwHztcyuLzdnW3v1N
         YR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862646; x=1768467446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJYdzLZlEnk=;
        b=Knk3b2ZZ83ck/pIgMLg4tEGg1MDbqm895fASIad+UEA14QJvmKlJrE+GrhdVJCBjbK
         +smCy5waQvZjVr+kFQG9OKwxunDWGyCiJMWpqC6EAX2IgricVXX75gqEOcAYq5qpoo4F
         fRtvXMV/Pt1c1FC1vwNZnx4DatRVr1MpjdoMPo9THun7UAJJmhRAGVP+qtw61Gbme48r
         Msj71r9nsWhjRff3Abl7m6YSoHlyBNxXcKFaSmlJxoX/O90hb5Cwd0n7yq15QQJxxKv/
         b8DXvK7IKmd3e4b5dZmaFaw7OTCesWAO0om1BwsF4kvGehMrl8C+XFFsP6Yn80F2gvTN
         Rn6A==
X-Gm-Message-State: AOJu0YwSv+MhKat564xcVr39B5z3albhGbQRIZfOdatpJJKKi6lD0Kt4
	7gI2rnXUKZmsFKyD6B7jJcBftG5FxGUCEtHL1uefe9asDO+oohkSppg3HgcsCYna/hcxbhvHEH/
	qunPDXBU1SrwSS7coYloDEFL3yRtQBsSwBwfPrzV+P2kKiU8c88ut/fTtCPXrTWGY3NUB
X-Gm-Gg: AY/fxX66o5lU9aOfTM6aDFI0jSXKlS6m9jN9a2cHHn0aGRtn+oKwT7fS7J36iLOjJWd
	wwG959MpC5/i+TuQeNcMuTuqvNSno3QlLD6HxqBAS0RgEvlJkyCcTT8ivT0307wCj+1koz68BPU
	CccqUKJP1f0MRm7LHmVQZnqThK32K9wDD59OtFNEPkE0zuoYfWm06bOpZZSoQpU4wUWf6Q3GtMj
	rNrqh0GNk267MMd3ykOkU5RHIsgusMdUsHgQ2ajBzzYXF6Y+gROgT1btCpztbKjRUC2UOYYPJhG
	5d++5o9VU65R2OZWu1WadIuZSucrnhlzSK7qNDjrgairuPPro1XzacjCJ18hp7P/dMEL+W2KdAQ
	EL7WM5PpnET/7o8WiAEu1wnOaAGqhLLdwNkK/FrFsqAFaHSazHc9YiHPfVBexxDNUL5E=
X-Received: by 2002:ac8:7f0a:0:b0:4ec:a568:7b2d with SMTP id d75a77b69052e-4ffb4900996mr79700441cf.34.1767862645634;
        Thu, 08 Jan 2026 00:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyRmRDDK3+l294Ljo8xxE2VOV3QjuBD6c9wXCfd+ibx7iZUs2A25kanf0Sz570Uidz1c0qdw==
X-Received: by 2002:ac8:7f0a:0:b0:4ec:a568:7b2d with SMTP id d75a77b69052e-4ffb4900996mr79700331cf.34.1767862645168;
        Thu, 08 Jan 2026 00:57:25 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:57:24 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 00/12] drm/msm: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:47 +0800
Message-Id: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7176 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Bo5jAF1uHjWhBEmHg44A:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: eAFL68JoIIGlfK8DjDI7nQcvg7BV_eQ3
X-Proofpoint-GUID: eAFL68JoIIGlfK8DjDI7nQcvg7BV_eQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX/SHl4KyUtsUE
 58ao7NOKBNVQN1g91LK4C6vNYzaLiNx81Bx5TY1V8xJEhVC0/Dx5MeggCaSjv8sB6ClTfPoCdGG
 3LNxRjIV30BSbHyf3YXOkALh70PYsoS1jVSaNHGn9kbZ8MVymqigj+Gm+OHe+eC800EJp2l0fkC
 y7w3EdP6SFR6dUQwucMPeCIfWBpeDZGKgqAHXjVot+23pJUljGH5ld59r1Wbc4g8fce3Z6/ylj3
 QZu96Ff56FxpdT21Z5sX89gC7S1jCURT5gt+EiETmbRawgZ5gjHUdu6hoX3LBjNsrdpR6TtR+cW
 q03aQ7Va1B97ZBtMPAL8N1DxiWMt0gFk3156nBsoqIn0r5zZguDjlSHMcJ7uYnnWgNmfR3611OI
 NLQ6RvPXwJP5VrOjS36iHA9vZakQMzfBfSF+Lrk3kFhm3L2RlfBG05OcTLEYoU/rmjjSJsuEocx
 htvibhbt8Pkb6m0zjpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

[PATCH v5 05/12] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v5:
- move sspp v13 related change from refactor patch to sspp v13 patch
- move sspp ubwc change to dpu_hw_sspp_setup_format
- split wb change into a patch
- Link to v4: https://lore.kernel.org/all/20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com/

Changes in v4:
- fix qcom,kaanapali-mdss.yaml compile error
- reorganize SSPP patch order
- fix Dmitry ohter comment
- rebase on top of msm-next
- Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/

Changes in v3:
- split SSPP refactor patch
- add devicetree email list
- fix Dmitry comment
- rebase on top of msm-next
- Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (12):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add Kaanapali WB support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 124 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
 22 files changed, 1475 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 538113b88e9809ffdf2fbcf1392c510181ac7967
-- 
2.34.1


