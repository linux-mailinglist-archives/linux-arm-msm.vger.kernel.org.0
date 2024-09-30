Return-Path: <linux-arm-msm+bounces-32800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FC98AC2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 20:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE84281B93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 18:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B70198E93;
	Mon, 30 Sep 2024 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NLnINYUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033E43AD2;
	Mon, 30 Sep 2024 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721369; cv=none; b=OrQ4EpEl+VJilYRNXpdfuv2n04ZsqNLDljYqUMiyZGofLHhqyqdScPNvDX/xY4338K2EZZc13bZyyAoBHkqYVRgVO7OGriq8KZvsuZQZH0RnywsvsD9ao29wBsHdpGg4CyfzqqarWS/isO4cfiOtR+sxSdPLRHnXSK019iVr15k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721369; c=relaxed/simple;
	bh=yA5cFMl8+ec5dJ+qtVHlQGI7o8LiFx+wlxEYVLtwrow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NOZAASTwerhgAMIti4Tojk1iC3boWVYeW5uVnzTjYXNxX2ImKEwnIU/GGq+q8Q5yt+e1gKdpPkgTS49LuGQ3IAaxPbFyNBgspUYAVWTKZXr3+oHcSZYMrOizS8HcqmpC0xQE/Yi9pmFrvR6+3qkHO6SQshVR0OtGAk3nKpdEDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NLnINYUF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (51B6DC6E.dsl.pool.telekom.hu [81.182.220.110])
	by mail.mainlining.org (Postfix) with ESMTPSA id 9A650E451D;
	Mon, 30 Sep 2024 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727721360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7f0TECQ0gRKG4FE+eX0Zs7r0JNAndVjKgypDK+kBGLo=;
	b=NLnINYUFWu4SRGGAUPcqF/TnhauwhPcmhMZKPAUvLwREMuK2znax1xcv9wklN9/MjrwIgm
	Ydr8Re9VdPuRMC/Y/2ydDF1tTH39JxiqGcilx5VwTR3ul7xkJHP948ZOA/5Ju0kC0r0ndQ
	qxYu37mpUZHq5lQP28oZbOCxZJkC+if/Fy2ddveKhzrE2IWLkHv/jZJKCfKK24sSlgh2H8
	uPbCmK7MPriQ/sTfHJGW5FIbKgH17+K9ReCndMUFyh8pZHKGMndTsILy0qdlEUNMFxBurM
	YS4zQiwhBW5VakwnTzVZAj1rVTkt6dmplLNACeYV8ZPpI2ph36Sk6A3u/sJDBg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/4] Add MSM8996/MSM8953/MSM8937/MSM8917 dpu catalog
Date: Mon, 30 Sep 2024 20:35:55 +0200
Message-Id: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIvv+mYC/3WNyw6DIBREf8XcdWkAH6Cr/kfjQgXxJgUMtKaN4
 d9Ldd3V5EwyZ3aIOqCO0BU7BL1hRO8y8EsB0zI4owmqzMApr2jNJVHri9hoZVuXZ7YNqRWdR6F
 LKUYJebkGPeP7sN77zAvGpw+f42Rjv/b0NX98GyOUDCWbhOCVVKO42QHdAx06c/XBQJ9S+gKrA
 b/+uwAAAA==
X-Change-ID: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727721359; l=2399;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=yA5cFMl8+ec5dJ+qtVHlQGI7o8LiFx+wlxEYVLtwrow=;
 b=4yFIpr04nUzMdDTT+LVLobgMzkxFp320Gxd6fO64UPMLTRhV66pgQQGrwDoX2ENSu9x5zI/nm
 +5DTiDMMUjDA/AeE+TdUCt4vyCpqsWi+L/gP3dSx6uaqwFG3lpC51o2
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add dpu support for MSM8996/MSM8953/MSM8937/MSM8917 SoCs.

This parch series was tested on many devices:

- Xiaomi Redmi 5A (msm8917, video panel)
- Xiaomi Redmi Note 5A (msm8917, video panel)
- Xiaomi Redmi Note 5A Prime (msm8940, video panel)
- Motorola G5S (msm8937, video panel)
- Xiaomi Redmi 3S (msm8937, video panel)
- Xiaomi Redmi 4x (msm8940, video panel)
- Samsung A6+ LTE (sdm450, cmd panel)
- Xiaomi Redmi 7 (sdm632, video panel)
- Xiaomi Redmi 5 (sdm450, video panel)
- Xiaomi Redmi 5 Plus (msm8953, video panel)
- Xiaomi Redmi Note 4 (msm8953, video panel)
- Xiaomi Mi A1 (msm8953, video panel)
- Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
- Xiaomi Redmi S2 (msm8953, video panel)
- Motorola G5 Plus (msm8953, video panel)
- Xiaomi Mi Note 2 (msm8996, video panel)
- Xiaomi Mi 5s (msm8996, cmd panel)

All LMs and SSPPs was checked and works, except cmd panel related configs
(SSPP_DMA0) on MSM8917 and MSM8937.

Note, by default these platforms are still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add MSM8917 and MSM8937 from previous attempts.
- Remove LM_3 and LM_4 from msm8996.
- Link to v1: https://lore.kernel.org/r/20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org

---
Dmitry Baryshkov (3):
      drm/msm/dpu: Add support for MSM8953
      drm/msm/dpu: Add support for MSM8937
      drm/msm/dpu: Add support for MSM8917

Konrad Dybcio (1):
      drm/msm/dpu: Add support for MSM8996

 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   | 210 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 108 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 8 files changed, 1073 insertions(+)
---
base-commit: cea5425829f77e476b03702426f6b3701299b925
change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


