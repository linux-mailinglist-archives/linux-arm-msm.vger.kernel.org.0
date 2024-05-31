Return-Path: <linux-arm-msm+bounces-21359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B08D6A51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E732865B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE98817D376;
	Fri, 31 May 2024 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3hjcWYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF21946F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186053; cv=none; b=KoaSCudGgPPUCR63yH5HMx7X42exiT6gN9tZ29s88jKGKiQwIqIfsTHFW/Sx6UoMdNk5UrgTis5+hEMpyBpljCn0+hodyl0qkPQYGUytltkhQ1DwgCwL4hag4D0j8q0W5Z8aSUFCywS0Dk74EuUejX3eRbr+j0o+ZMJiFBSMrHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186053; c=relaxed/simple;
	bh=36zFVcTmlsZC5jCJ+t9fJ702goiQM4w/FVsM7AmEFY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nam/Tx0WHHiEroRIuCdGkXSWSLqrPHUGzuQW42ZD384D1F9F2qFrzs74McS0/G/mDSSa+/Vy/21G7sDpAgHp4SmH7lKWB32f8K7Y6yMiePG14kOC296cqaGHEV9pKB/9EpQZmb9DBcGxPsl3aZP+aM+DiqtxdQtd+ZxKX32NI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3hjcWYg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e95abc7259so26997741fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186050; x=1717790850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcofRFte0GyR0msF9Wv8UBxmndCayJNvBiLxyEUuupA=;
        b=f3hjcWYgd5TtUmTSpvRAv0j+k0P3nSXos08jcmL6UcDq2LlR+2BputaXZqycUF4Dv1
         ZSEKYs14QKtBwL7CPTuBlBi5/lZiR0MxKMr5rg+qpUxpqhdgcnLm3Vr6SHc9cKDNMfUT
         8F3PjqR+QvEdkgwcpisyWyQBx2fJjG+QzBZkX4NgYNCO4hmQJA5N7ZdPzAkXy+FoP3n5
         4q00k0eIpSQgRQJ49etTUEIvP9QdjldJZAOAZDyRZpsT7VDmwdrPHsEf2VK0j2BaNqYb
         uVtW1yJRKMEi90xxcxCF4e245saEYyDoBqhgkQ6aXS3NbYPMIxjUimwW8u9diYLz6jf0
         1MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186050; x=1717790850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcofRFte0GyR0msF9Wv8UBxmndCayJNvBiLxyEUuupA=;
        b=k4xttGb1Lqk9I5xNWKttkNh2iWblOOckdK6CSnp48oyQIKozsbBKG8yVuPJGuXNZJL
         1ev61J3LQcCaSVpVexcF698yyvMR1VPQuaCTdIsx09IbmYdZorktXldPlRwwwwFMBs9H
         HTwADmCLks4/srQOoU5k1FrYz6wd5GqhjILOsm+dT1CCch8QJXHFQQUu7AMJn1FmI0wE
         kCmBO3VLk/r3kVMtVskrGFRM3G5tcOT1xfZtvV9tPZMXZCOMnIJ4CZeh2wyJMHIh8YH/
         x4XeWdHBjH93+YinG6v7aNKym2DIOA+sbcvsaqCMSpivBLaoDLvuNP8uvkxeAIRrJXLt
         TTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvhNsD5t8li2hFlXIq7ckOL/THdCfHMgTcUEuDAOxne875CuWHndoSLhZMRWULwro/cEDWYppeRX+k2WVb19cblx90jusCbtGNavDkmw==
X-Gm-Message-State: AOJu0YwPrRaJU9gFcYQF0LzCw5Z1JOBRpF6HjpjWz6ZAW8MUvoGDWzF8
	3j2R/Lav9Zy8vxP1BEmT+xVrkvCQb/uRVU5zP5D1lAeJhUXOAiDQWiOw1VguESA=
X-Google-Smtp-Source: AGHT+IEq0rqMyJRWqu330Hbon3ZStUGPoUuf3R9JcX9UQvJLtbu+ng3qi1SZEjwPtukkYhXWvxq/NQ==
X-Received: by 2002:a2e:a99b:0:b0:2e9:714d:6d1 with SMTP id 38308e7fff4ca-2ea951b6206mr26740331fa.39.1717186050193;
        Fri, 31 May 2024 13:07:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/9] drm/msm: make use of the HDMI connector
 infrastructure
Date: Fri, 31 May 2024 23:07:23 +0300
Message-Id: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPstWmYC/3XNQQ6CMBAF0KuQrq2ZdqCAK+9hXAAdYBJtTTFEQ
 7i7hcSoMSz/z/w3kxgoMA3ikEwi0MgDexdDuktE01euI8k2ZqFBp4CQyzqwjW1vrywb7xw1dx9
 kTphnKRmjLIi4vQVq+bG6p3PMPQ/x7Lm+GdXSvsViQxyVBFlCbUrMMtAGjhd2VfB7HzqxkKP+Z
 sotRkdGYQE1VUiU/zP4YTKELQYjUymritSaoiX8YeZ5fgG44zdzSQEAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=36zFVcTmlsZC5jCJ+t9fJ702goiQM4w/FVsM7AmEFY0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi3/3K7+5ZMvVMAb3zLYeRysohwEcabaQF9Xs
 ovhcEFZaISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlot/wAKCRCLPIo+Aiko
 1WrmB/48O8bX4lGayq8oD3NfGpi6hk9SyyeZP2nZnh4CdCHH215baV0j9LxTHghDjvleUbiXSSX
 umPwH5d491BS6tAztUEvsxca6o6ZUGHxS833GqbmkC97J4N/siAtqUWU1gthvdcG+Lw/yKt8IVi
 6lzKrmoZKccfAOfM6DGrtvAzMw/DqWynirCMpHzhxzUi5QZ7PpV1K1QPT+2kI27RkM+1qzQy0QG
 /XfddlXrESBsReDVUxQn093G0Pq3fR1IIonqFdfawNm/LKG/K4dVEWYifYUoH3+Z8l6mryvaLSM
 9gIiL2uCrGjvfNYvxBTLaajOMxdbao/vWGYHlttI+b+QYSqH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Reworked drm_bridge_connector functions to remove ternary operators
  and to reduce indentation level (Maxime)
- Added hdmi_ prefix to all HDMI-related drm_bridge_funcs calls (Maxime)
- Made vendor and product mandatory to the HDMI bridges (Maxime)
- Documented that max_bpc can be 8, 10 or 12 (Maxime)
- Changed hdmi->pixclock to be set using tmds_char_rate instead of
  calculating that manually (Maxime)
- Changed mode_valid to use helper function instead of manually
  doing mode->clock * 1000
- Removed hdmi_mode in favour of connector->display_info.is_hdmi
- Link to v3: https://lore.kernel.org/r/20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org

Changes in v3:
- Rebased on top of the merged HDMI connector patchset.
- Changed drm_bridge_connector to use drmm_connector_init() (Maxime)
- Added a check that write_infoframe callback is present if
  BRIDGE_OP_HDMI is set.
- Moved drm_atomic_helper_connector_hdmi_check() call from
  drm_bridge_connector to the HDMI bridge driver to remove dependency
  from drm_kms_helpers on the optional HDMI state helpers.
- Converted Audio InfoFrame handling code.
- Added support for HDMI Vendor Specific and SPD InfoFrames.
- Link to v2: https://lore.kernel.org/r/20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org

Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (9):
      drm/connector: hdmi: accept NULL for Audio Infoframe
      drm/bridge-connector: switch to using drmm allocations
      drm/bridge-connector: implement glue code for HDMI connector
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: turn mode_set into atomic_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames

 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  14 +-
 drivers/gpu/drm/drm_bridge_connector.c          | 109 +++++++--
 drivers/gpu/drm/drm_debugfs.c                   |   2 +
 drivers/gpu/drm/msm/Kconfig                     |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                 |  46 +---
 drivers/gpu/drm/msm/hdmi/hdmi.h                 |  18 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c           |  74 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 310 +++++++++++++++++++-----
 drivers/gpu/drm/msm/registers/display/hdmi.xml  |   2 +-
 include/drm/drm_bridge.h                        |  83 +++++++
 10 files changed, 472 insertions(+), 188 deletions(-)
---
base-commit: 80100af925a09ff99fcd6604a5fd8101dd0d17fd
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


