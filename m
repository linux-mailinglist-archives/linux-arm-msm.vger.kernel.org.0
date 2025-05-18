Return-Path: <linux-arm-msm+bounces-58335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE6ABAFDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0DD1893298
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A148217723;
	Sun, 18 May 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCrG3qaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B7215198
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567302; cv=none; b=fZ0yoUhK65ZJCQ3drtCvM+jD2yO1Oh4BbFHGoSVP11sZtW4U8vItvTv6LMEYXFGpojLGqG+8z3BgYmNo3SI9XGLjD4USdZvNObRQXlDmZNWTJbU5oNOyFeFHihjn1RC40iZ4uIUpg4GxWGhvGg8iV5pw1pbDFUZcmV5LL6FIRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567302; c=relaxed/simple;
	bh=9J4rqW2pXqEVwcZ4RKNBv+n/cNEsrz1nBVyzy6c5Bhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmMQ0Dp8BuJAD2lCB5Hv2EROQHJo6mnYAt1R57Afvn7KifgTm839xW30NJm4zIBA1B0SRwxrqOq/93d7XzPR4QFsPg8hohZXNcg7rtXyWWsYJlTc6+czUQ5jOVVHTRD6RK2EOofU/vRfS/OvW3iyOBVmVPed56QZbqwBKEu9HWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCrG3qaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9u2v7030139
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DtMbpHsYyq8IxkCCqitMrf
	IcdqaVbs7kiHyoXi5G2h0=; b=iCrG3qaCWp5lTftu1QYwcQuzyKhSWdPWLS9Glr
	Zy2XGM8kjCHxuog23ACDH7WItUs2N4cRNZcn+t/Nl0dL+KReYXce22iBJ5JdBtxh
	uEtbGzO2PpRKbyVwQO7RuudhaItxk6oHtt8D977A6m7R96xUgdGSPHEjE2fYmcI/
	0tJJ60CY61jfBhlj+PbjRoNKFRyd3KZCOjhjed1Np2GM/vJX8rNk+2263PGK0Gjo
	TA/7bbOsp4BSs9jFDh194HME8PMjWw912AU0KhzL7dWtLAx9jnFVIE5+B9DQdjjF
	w4SUUTk1TwQH7K27zuiyZhYNe/pOqK8K2Db/MDPUNqm0cVuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1uuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2b0a75decso98270566d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 04:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567298; x=1748172098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtMbpHsYyq8IxkCCqitMrfIcdqaVbs7kiHyoXi5G2h0=;
        b=kDZhE32K/im24tU131r0PI0WQESky2KQKS6LX8CMjURKrPeCyBmDJHviETFn+Nrnrx
         3GmjEOdhasFyW+hQ4eEtb4YIN/MZE0R4tITiykX73Pb/p81zqWApYQSTosTsG3bF/k3D
         LHN21/3pXsY6CBFqK+q+dplRFVQ6RneOw8Ur+mFgtNjsQi6PFj+wxm6kSHqligLlZHy0
         85ungftxJlmTH+Mf4jGinXxOVsFMBDIIZxvjZDtiKAF4gw38nTYagBdLvCo3kTHP8ywv
         9gPUjAFe+0ZLthVx3d6Y9xw5ImFJGjICE7TLxG++mEk6ozJmGW1V8m9sAFkG+ZBquSXw
         nJiw==
X-Forwarded-Encrypted: i=1; AJvYcCXz0yLC0ktsVVu72g3LI02ME6wCQuPc8rZ39MFinzpN+z9geaTHYqfnI6OtsyVTBxZ7u2STDFBPT693ZDzK@vger.kernel.org
X-Gm-Message-State: AOJu0YxpecC+hdjpZh2LEeUQH2nXpI5qlvWcZTCoXo8bnNrKYCBJm2f5
	HPNXOsVWwqCgkRlXxNUkYVh+vPeIsRJvp2Gah2PgTbW9x729YLHjVRSXayLK7mexJZk02nMxTDx
	WMVEWWkm+5VvG6CuszaB6PaL2XcU3GQOTmDQSs1pb4G8RWiljPMxJJ34RDsWMQM69dnEg
X-Gm-Gg: ASbGncuByXG8l1TKe4pNX7tq6W+3QA46rUXIoInDsv5Tf4MGRgvU8CJr/ZpNzuKHPXk
	+RVoMHBWYRqkb3+ji4Lj8bZujRrxy1j8DHCrgU1jsKIEoSCCjKpJ/uRvlc+sYoHNiYlunjQCC8f
	f2yJjnHaxPSAe62wy7H5EmqZ3WAoladFS8FEPM+ETdZJ4upQFhdyC03bRaUuIaQiPkHb2nvgj3a
	aOMiw+zv/kUuZm4TaRx0eD/L4xWvQNX7Mu/sQckbfIc4NVsbF80KahBHBgwYzarTRby6z5lEMt7
	O3Hw8TuU/iLaQZPiZ3bBZBVWXshFwk0qHDvMxtwf0XrZ9XFBLn0tbl5EE5gkwUer7KIMVVd8ouh
	+IdZcQ0ZKKYi3nuZjkXUcB8pw
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id 6a1803df08f44-6f8b2c65bd5mr150316156d6.15.1747567298525;
        Sun, 18 May 2025 04:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqLiWIyECuX8rlBPulhzi6aemt00MCcnN0evfEEcuiCXQFgv8XdaQqt/ZFHIXho5+QSjC9UQ==
X-Received: by 2002:a05:6214:5096:b0:6f4:f123:a97a with SMTP id 6a1803df08f44-6f8b2c65bd5mr150315886d6.15.1747567298220;
        Sun, 18 May 2025 04:21:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Sun, 18 May 2025 14:21:33 +0300
Message-Id: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3CKWgC/23Oy27DIBAF0F+JWJdqhpchq/5H1QXmkSBVJsKN1
 Sryv3fiTV2ZDeLOiMN9sDm1kmZ2Pj1YS0uZS50omJcTC1c/XRIvkTITIBQY1DxHHm/c32OpPJf
 vO92dsFYm75ICRu9uLdFiM98/KF/L/FXbz/bFgs/ppiGC7WgLcuAKgk1pNBCyfvssk2/1tbYLe
 3KL+CPo6BGCiOjQDlTKRB8PhNwR2CUkETBiMDoNcfTyQKg9YXqEIiLbiM5gyELkA6F3hOi20ET
 IATI45UTI5h+xrusvACBS3b8BAAA=
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9J4rqW2pXqEVwcZ4RKNBv+n/cNEsrz1nBVyzy6c5Bhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/oSgN7yXgFO4+3bkCl2DkBasInwY4hcrZO
 CnT1iV4MDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1SB3B/wKXaCQqwfxs9wTPNniKTi3kHMBEEVeEZgZ38YEdK/Zx9TOyfHago/j5ok1ahPZG6zNFX9
 d44wHDAUXXquUgNagCXa9mqrIZkgOMss4XMHI/b2QpKIHtVZJ7/omvpk9DTkZrCjBQtx4MjEeoc
 9F19SfDKKcnySqvY2hi1PNnFrdMmnR07QexY7YCwCs96kIGdu2vET/4bgolwb4I8f3gE3DiTOac
 s0+P4yU4OFqEdi8Du9PvY5XzdwP/lDP6OeJSJeUryV/zXjCbUzP9UFMkgjqZkuqYwbkChkJVUhl
 ii5ynWcFLdWaIw3H+zBGNWY3Y914LbQhMc1uWtkKxvXUJAvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RcxsjKwpYuTJiygbSp3SiqzVGfT28nC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX24pgP+Sl8HAX
 rKFXpGBBrTpCY72WuYRuL2Me+V2WfyyRZ2WzeraHezQWSn1qin4vZBuXeli7ELjCjdrDWY4BvEZ
 17ubEUfVvxL9RFtvnPyGOan8bZ4wDxOE187JpZrMr7158oMtnIb30EnCVK3IkDtdEV1Sb72zK9n
 3FUHkdpFWlmEVqQndHRamnMiaVYYLZKMfzCJcqvBNfglYzCgSmtxJMR464xguzMfPm2aIDGJhSA
 eZUXZuXw0tgX3Mt3da8aXUMySuyUeuqXzGABAJVTxll4UjeBpkhTKA8bfTpMK9vK0GYE47L9aSi
 kQBC/ipXoGMPRQ9UOLxnWy1iqgYEoxGSS5X3n9X/xla7+/O5QMg3mloPomyZEI/qxRFdxhLYIGi
 k8XhPMUFD6xO/kFs281jU4GPfZmWhQrT1MC7zX4pKdaI3VQqLB++/AgeUfU0SHh1uZusqGX4
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829c2c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=625LCR9qH_oaHj1pw7oA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RcxsjKwpYuTJiygbSp3SiqzVGfT28nC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=678 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108

Rework most of the register programming functions to be local to the
calling module rather than accessing everything through huge dp_catalog
monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Rebased on top of the linux-next
- Link to v5: https://lore.kernel.org/r/20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org

Changes in v5:
- Dropped applied patches.
- Removed MMSS_DP_DSC_DTO programming from msm_dp_catalog_ctrl_config_msa() (Abhinav)
- Pulled the hw_revision patch closer to the top of the series (Abhinav)
- Link to v4: https://lore.kernel.org/r/20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org

Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (11):
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  130 +++-
 drivers/gpu/drm/msm/dp/dp_audio.h   |    7 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1298 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  113 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  150 +++-
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  256 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1244 insertions(+), 1602 deletions(-)
---
base-commit: 087b2daf4fffc7cf4eb754e1f0b07464ee376851
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


