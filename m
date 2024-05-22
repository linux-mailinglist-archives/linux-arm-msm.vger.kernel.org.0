Return-Path: <linux-arm-msm+bounces-20172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3218CBB2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 08:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B22761C20BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 06:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6585979B9D;
	Wed, 22 May 2024 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZNGAIM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C6578C90
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359160; cv=none; b=nR7FZzMkcEX3lbW3gOt1Ygi36FCfIm8gKxQMNmoa0Bu3U+j52nObRq9Y6g+zmxSTT+cNyy7ZSoqIVjlVqeI4n7BRv2rV+/VjABU0rIU8Biq5bp6YehZGApx63Qropa40g0SP0HZdBDN8w2U0k2Xtc1DqyiNlnmJqo7t2kRZI8V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359160; c=relaxed/simple;
	bh=oRcVW2b7RmaHCnZgU9s+liJiuQhOof/Wv7h+/P64vIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lU8ezo4cRlFNqZBteSHU71y/YYi5uC9P33DfRgRtM2/zcxot4wmzxyYki50eTGMMr7glMswjb9oUQDkGMKIcxO7Q/0aruw9+I7oci4mq4bGn3a79o0keJ4FoFWVIsz+cdO7xBAEYCjHbO0F2ph+npCknRef8omIph2ohwHfLMtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZNGAIM/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5238b5c080cso7619813e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 23:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716359155; x=1716963955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXLCoFAT4Nr83TUnXDuvZrugwAWtGHeO95Weg/poUGU=;
        b=LZNGAIM/06KGLLzkJN+1qyEVEDoM1v/xzOw+BB09Gixof/y1hZajmsSM7Ob12s5qu5
         ucJQH2DpTOEiBExQEZFUiSblPCvQzo4UVkPvmL+DCdy8aJQUu6rsJeXtlPrwxxQglBM3
         meAmGUHYadkDEqxmOTwNKqVIsuY4BEWHPMCArMnXgpKCAPa8VnDedlxa/hjQ89luLJk8
         liGcriPC0/H2mX1Geu7PWHxxxAsYfQWBr5pbT+ccUx9rIVgVeFJjzlVNxgVtxlTBVCog
         BzH+oJ4E0V/u9S9//s57CKyb4PBNGB522sbPgwn9KZARyvMVWBlIJfsmya4LkwkNWXVq
         /DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716359155; x=1716963955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXLCoFAT4Nr83TUnXDuvZrugwAWtGHeO95Weg/poUGU=;
        b=Pg3cQrGLhPfVAFt8xXxPDL4YwGBJQodnA3Tl1bLsAWfTDWcSEWLQtrPnV7EvI1G11s
         rBw2QRhyevp3/kl4OrKs2rivG2gkl33c+0TJWccSjXf6txiy8PC+3Rtv5wpmVPe+lt1W
         TMQ519ItlC1LFzPTSCz9YWLfLEZu1fNOQ+vYSubNCeUQJRrOv6bhYbli4DPcvJfZZNQQ
         KdavK70OS6FK6soPEgyALIMMDlFJTIUDtE7dGZyLsLgHm5Ie6pgS8c2VtlkJNVmyqtpY
         C1NcQ8qtect4PrKWo6YOcnq/Nr0yhHNzL+AsgdQcik5A2FxTt0lDfrBDcSQCYO1TVkMb
         d3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUb75DBoi1S1D+mSxJW8zHZZ6wdmQxcLbXj0TO3TIrS1lKVW2xoujExCBu84j4KlRslYTneQCC2/5eSv3thW8tnISjxd1mQglbj1bwcpA==
X-Gm-Message-State: AOJu0YwG4A0Au4xgEww2ALPyi1QXEBrAM7pO4w8zLPldDR7Kv+fwZENx
	6mycqV+BWDk3y0CAvUhT808OWXOM08UuuBlyyV3YiqsPPNLLqZKWFnqukSWkeEU=
X-Google-Smtp-Source: AGHT+IGX+HGpof31CbGG3ey+krSYpZvkL10bQ1Csjx7rDsXyKZf7WF8br6dYBsvJYIvPPjp//uYZNQ==
X-Received: by 2002:a05:6512:358f:b0:521:f000:5d1a with SMTP id 2adb3069b0e04-526bfc02c3emr486204e87.59.1716359155168;
        Tue, 21 May 2024 23:25:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 23:25:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/panel: two fixes for lg-sw43408
Date: Wed, 22 May 2024 09:25:52 +0300
Message-Id: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPCPTWYC/33NTQrCMBCG4auUrB3JTFPbuvIe4qI/kzZQkpJIV
 ErvbtqNCOLy/WCeWURgbziIc7YIz9EE42yK/JCJbmzswGD61IIkKalIwtxYniA8VK5kBdo8Qet
 ToeoOCVsW6W72nObdvN5SjybcnX/tLyJu6z8tIkhoqSKtSypI0WUytvHu6PwgNi7ShyjwJ0GJ6
 JF1jczYlv0Xsa7rG2ClSEP2AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oRcVW2b7RmaHCnZgU9s+liJiuQhOof/Wv7h+/P64vIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/xD9ITufJQSk92eKn4zrpAjtoqX7DTPDRhO
 pcE8CPeuxqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8QAKCRCLPIo+Aiko
 1fxLB/4q18LHEJ28oA5ep3OXXNTUN19o1mCkDD3brnUoQ8pC9gwRIaQriJw5p1tNseccfBTK3wR
 tuBJAdnZjzi6rlANM+JVasAlooV9fVtWi/HLaF5QDb+r4rb4nUbFBGr2WLD5DnkTjEcaeuQ4ucj
 Z3tXVxKBh+f5fq74jtPYIglVBdFt1r5x6RD0DTXAKL3BF0HsI6esPyiAGQCyreQjQd9Fhf8RSUG
 BU+ZQyuzoWyUmwp/yyJfyTGxFnRkxZ3kVyoEQRfys7hR2+4BhCTCMENhyMK+0LERl0qKLDV6UCr
 BXjjWSgi8V4Gsw1gHHoFqSodE+W5HRDBlrZEpS712YzAICCm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix two issues with the panel-lg-sw43408 driver reported by the kernel
test robot.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Pan, Xinhui <Xinhui.Pan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v3:
- Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
- Added missing Fixes tags
- Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org

Changes in v2:
- use SELECT instead of DEPEND to follow the reverted Kconfig changes
- Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: split DSC helpers from DP helpers
      drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static

 drivers/gpu/drm/amd/amdgpu/Kconfig       | 1 +
 drivers/gpu/drm/display/Kconfig          | 6 ++++++
 drivers/gpu/drm/display/Makefile         | 3 ++-
 drivers/gpu/drm/i915/Kconfig             | 1 +
 drivers/gpu/drm/msm/Kconfig              | 1 +
 drivers/gpu/drm/panel/Kconfig            | 6 ++++--
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 7 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


