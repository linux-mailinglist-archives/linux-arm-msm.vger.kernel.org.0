Return-Path: <linux-arm-msm+bounces-46108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B900A1BE05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0412C3A45E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBC01DA10C;
	Fri, 24 Jan 2025 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwcpuoCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB383232
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755271; cv=none; b=RCRcBgApieOw2xIwsHsu/s+jUFwdrriTg3F/jBWJlooXAF2dITLIXkwlZk2TAMRGngGtdzimqAsz2Edv6Ft0jVXeMK2V6zXfJOo7A1kpdFr33maF1PrWhrOgQgrbveskSnHsOID+M4/QPxRpzAOSHhLv4XGafWXeVMzSg+Xd970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755271; c=relaxed/simple;
	bh=OC7ZEYNSL8rOgIaV64XmiBZ3RC1b6WLbPxyd6j9an9I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N2BGlb2TwZbGIgpYXpV2ww6Nrzt13lpzTzXMvyICeDeRp+lfziQPtp1TSbgxsW5/HpCO53bCeO17/fNjYaN7oRGTgYxFDks6CNRgS8TqZ6IQl6l1OmP+ecD4iGKFHr7S25Zq89NRIDB1B40kwvQrMCpw4uw62zB2HWsZJNjSIGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwcpuoCR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so2747923e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755268; x=1738360068; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5Tj33bfeSX/rTFkhgrXRtKcEMb6MiRIfWtM4lbRYlk=;
        b=CwcpuoCRh2h40yY6dJSPFX8sUIEgFh2ZdlOP+95xYRQW3giFDsIoWnL3DfCK+cf+mq
         edoQte61PltCZ2BcY3gto2/BwaNxsHtw+z4rWHdsFvyPADGsVOwNbtgBPE4qFf7v/bXg
         yOlweC749GttDRpjbMpJ5Yuq3dGSrCR9yafsaLVbyfIf6xyQ5DEzd+BrQvGDvRJmI0lh
         bVKcprzZRcG/emawID0JsTzQKTSxFOJMPELFveUhZZZGfPAZB8Foey2068dMCyoHd+/C
         yMeH+XPwCA0pjTiANOBXB67yiO1O4JdSYiFWGdnrKwxpAkWOC/KUS6OClg1bAdmte8wt
         PRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755268; x=1738360068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5Tj33bfeSX/rTFkhgrXRtKcEMb6MiRIfWtM4lbRYlk=;
        b=AqK/R0Jhm+mc8BD8V8QP70Sck9moqflj1N8TwTSMeeXheUB9SjfGGh3gEYovQt+vAR
         +14SHmwpI1v53ReCL2naDj5Xd68htc0CPHeim1SLA/wtQadgfUmraMmYvy9Rvsp1GkQa
         B0GZ8PpfuWIo6GbxMroVBFOIf6AjfdIk2OUDUdQ5att/3fviF9EVS5W++AN8NNry52xK
         4GcHHNX0NsfjG+uPwY6o13ythOBi74TZl2SRMzBiXaxvztASnrjjGRqm7RQMo30TRWpI
         CjnZfW0CapCR4XgH2Shn3rsNC2cB1TwgKNqqf7SzZnbcFoYjSx6HXURPUY/T7hlfV3RU
         tcWw==
X-Forwarded-Encrypted: i=1; AJvYcCX7KureuMsibSOd9/Gt4ExBUIJf2mjX6AoeHM3bOsjZRrZAJungLzz9lFEuW7RDzdUyR7daX3PXibpxb3HF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLN04LFeUNzJkCDKrRNXMwlAHatj+VlPiF/Ic0LM4hiHClxmA
	uHCMHezkib/GWDs4/Lo5Rlrp5Bj/szowwxuHSvN2nV+V7rZfQJi8pH4vero1Tv8=
X-Gm-Gg: ASbGncuEpOCmEa2P52wQvFoKQ0pvEYyWRelRkPONjTEH19Tq6On3zaBmz2+LGN3yT5c
	Qj1n1r6IGxn+g8fU/pApBFUED4TinnVqSOEE/a1PsWtqshpe0400O39XB0RrqJcKBgRg5Fk/I4H
	2JIddiFLPTwbL5jAvLBXUw9No93ozczI5B4FaFGmbXz1Qb2CWgA6V7HthC8/r7heU8XkdvtPtN7
	NKEiHPjgk8AzvC/klVG9OXGoEt1AdoKH4XUGIb1riJ2wNQXExPUuuTiPaf7FmRIPq6aQT8xjgNg
	XPKJc3xNXO2f
X-Google-Smtp-Source: AGHT+IH4WpHtN/+DZacffRvpjppuUDgdBR372cJZn6NgO/JVsuy/BYBN+QPCxXqdx7bZE3Ow7XgAJA==
X-Received: by 2002:ac2:5239:0:b0:542:91ac:3919 with SMTP id 2adb3069b0e04-5439c251224mr10290273e87.23.1737755267531;
        Fri, 24 Jan 2025 13:47:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/7] drm/msm: make use of the HDMI connector
 infrastructure
Date: Fri, 24 Jan 2025 23:47:40 +0200
Message-Id: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwKlGcC/3XQzWrDMAwH8FcpPs9DtvyVnfYeYwcnVhrDZhdnm
 I2Sd59TGO0IPv6F9JPQla1UIq3s5XRlhWpcY04tmKcTmxafzsRjaJlJkAoQLB9LDK26hM/Ip5w
 STV+5cEtotSJjRADWZi+F5vh9c9/eW17i2tp+bmuq2Kt/ouuIVXDgA4xmQK1BGnj9iMmX/JzLm
 e1klY/M0GNkYwQ6GMkjkT0yeGc0Qo/BxngRhFPBuJnwwKhHRvQY1RgtBMx2UGikPDD6zpjut6v
 erxnRtY+DFH7+x2zb9gvmorqw1wEAAA==
X-Change-ID: 20240307-bridge-hdmi-connector-7e3754e661d0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4253;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OC7ZEYNSL8rOgIaV64XmiBZ3RC1b6WLbPxyd6j9an9I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/7CaKNWmhSjBn79dG6Gmr8f30McLVpvImv
 0h4kXXLlrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1fLxCACneLGuBUQqh1eJjGii+KDfOA5YnjAzmQ34U+W5QNzI06HVDAtrOEIVEuOe799FLd2hITp
 MiVPdBAgb6XguUzs9OzYEhtya9wZZta51COuNn6OOcDjxzpCXX3mt+iqGIwvtGhd3ftYT4TtwcC
 NdDnoF/gdv4/wilF45AnwzBEa9+TxK9OeQcCRcLe6ILRTfI+rOluAMBwd/dcdxID4jNxnlY2hz+
 mMfQdnnR/0GfOOaIDmu36ZXylsOwbRoyCjUxxwG/xGJN9WRYmL14p2+SMTZYR6uIGx3D9CASdcf
 KcNPjbTyxQnINjx6C6knaQsEfGbh6GZTd/WU+jtoR3XCvKzw
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
Changes in v6:
- Moved HDMI timing engine programming to the end of the atomic_prepare
  (Abhinav)
- Rebased on top of drm-misc-next, incorporating changes to
  drm_bridge_connector
- Switched to the DRM HDMI Audio framework for the HDMI codec
  implementation
- Link to v5: https://lore.kernel.org/r/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org

Changes in v5:
- Made drm_bridge_funcs::hdmi_clear_infoframe() callback mandatory for
  DRM_BRIDGE_OP_HDMI bridges (Maxime)
- Added drm_atomic_helper_connector_hdmi_disable_audio_infoframe()
  instead of passing NULL frame to
  drm_atomic_helper_connector_hdmi_update_audio_infoframe() (Maxime)
- Disable Audio Infoframe in MSM HDMI driver on audio shutdown.
- Link to v4: https://lore.kernel.org/r/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org

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
Dmitry Baryshkov (7):
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework

 drivers/gpu/drm/msm/Kconfig                    |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                | 120 +--------
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  34 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c          | 131 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 325 +++++++++++++++++++------
 drivers/gpu/drm/msm/registers/display/hdmi.xml |   2 +-
 6 files changed, 337 insertions(+), 277 deletions(-)
---
base-commit: 04db8124620ddca01d2fdc48d15471dd77efeff0
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


