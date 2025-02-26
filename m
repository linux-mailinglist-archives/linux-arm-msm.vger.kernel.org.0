Return-Path: <linux-arm-msm+bounces-49452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFBA4592A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602A93AAF31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8D7224227;
	Wed, 26 Feb 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTBj5i/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF81A2642
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560372; cv=none; b=S/qhlkWv/NQs/rkuqy5DpZu4shai98mxwVs79xm/cYoSefDcK+q5h9pTQTDK1RXeXEv2YS+JZ5py8kHvU4+ImwBCQLFmgQZlUZxnoip7CtpHIuZu5J62kGlrjFSbUCrjtBa7wHqxsjxeTlKizecZ3Mf3P6ofhjaIfovo14aTYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560372; c=relaxed/simple;
	bh=/w2kOfipJ9Jc5VDcHX6euYSe3PGqS6+WUFc+C1xXiC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HmR6TjAIe1/par/TiOS/aD/jt9TteanZpNr15hghd6UuN6FTRJ+ntHxQvcQ85fSokpoqfUFlmIm2KAnfrX2HMHM6qH1HA0YLKYavCs8NdbArdXrNJokR4HoNNwkKpSif/Bn4u0sgrLE8rTHlKgWusM1FDN8R6SEAvEn9FLXpW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTBj5i/I; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30918c29da2so70060531fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560368; x=1741165168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRUcGOxXQ12ALryAIXInoCPbMlhVlPhDAIjkEPYiGPY=;
        b=GTBj5i/ILJrbEJph/08c6Vx0656fPeY9iDKNQF3JaSQr+k0Wph3gB+J6Q3NVI8nXo/
         U8im+9uj3M9RysAZDosGou+Gyq3si0z36PyS9YKDqu9/w9UFW8i8yLTmjlsW/Vq+QkcI
         enwWx2GjYmtrJSBFvUCRAjxbmFX8XOb/u4fHI1/MngisJt2S11TFuI7lA+IaHYK+2EWP
         4I5VcCPvnvd7w5qir2Ac10ruVw3lj4W90n+1V652GdIoYEmiRI04WoB/fnkkFFfmFPNW
         VAVx0zuJueaekvH2qoirHvDtHPAMQVQ+OTCOYZ0sFFV5ek5tDoLrQ0cSXcoNMVZvQBYD
         lHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560368; x=1741165168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRUcGOxXQ12ALryAIXInoCPbMlhVlPhDAIjkEPYiGPY=;
        b=b6A1X0y8acdE+GMSYmVWYAxSXGw/7Eg5udslc4Y/j57Sdeg8Wx/bfQPZBR0bpju9Qa
         URiLnndd0ZURVMK78Utv/Gr5Mv2+Lvl2AlznSb6aZloVMKd0OjxnlP/ScV+2Qaeov4Pf
         aD4xHsH5x6rBOvPnK6oSeS0khK/XIH3YgIGnAb5MIm0kXTTQti2r9Gvgz7H06jvZRKjn
         VPSuqAhgy7soIi/5862ndjjPM07a3RBEZ+TlJJorS2BGSGy/gVuIskX1ge3NGBy2vtxU
         P+ZOv7CoCxXxdoerC+lA+riDZZ16Mkmk+p5AYhGwZ4rOrCZsZ9plxnD8922X1kBV2IGc
         YPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdwKZ4P1lG1fV77z44ZBloghZwfPR72+mcuINzf/WmD2QA/EzCn+KlLcw7aCrG036r7+4SKuhqeeiZFN4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Cr2lFBL2GNpyh17Uo9N2xxlPSODO0+dAfgHtilOGfJTMcKMU
	pNsSHc3tZxmAnwA6bw+sJn//dOqllWDWCMaHT0Nd6g3K4w1yDFcPJ+fCz4JgL0Y=
X-Gm-Gg: ASbGncuYwkHGjwFQ8al8WkL64hy4jq0Yru40+G/KbyTVMx7BuiEhJbmaFUYl+K1XFAJ
	KltulJuMgQ4SYszH/UPhzw9u1+nqgSAm7RzMQRs0KAOve3S1/KojsOLPDRFDmaDxx24Ef8cWiaF
	PUN/dFWqJbR7rtQVbOx+ZWxqvLHGfIWX/oOBC4Mi9JNfw1AymIdDRY5wJvvauYm/3RV2QL1RhhC
	xLzsZpiBIvHCM2brFw5p+KJ/TTRHQdZoHb+kMkwuLUDJyjjkv5cciKd+vb6em6nzI0yNoIVALtv
	m/kfAr0NwXXWYUgZVtT8eLZrnDPjGxmdsA==
X-Google-Smtp-Source: AGHT+IG7/n0AV/V2RMHPzi/zS0d+YUqtLQL6R8+IjrUM8km2gwMqWNddixtxUhjj6bhMbT9aPGp7MQ==
X-Received: by 2002:a2e:bccf:0:b0:309:1d34:1089 with SMTP id 38308e7fff4ca-30a809e76e0mr52563371fa.0.1740560368297;
        Wed, 26 Feb 2025 00:59:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 0/7] drm/msm: make use of the HDMI connector
 infrastructure
Date: Wed, 26 Feb 2025 10:59:23 +0200
Message-Id: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvXvmcC/3XRTWrEMAwF4KsMXtdFlvyXrnqP0kUSKzOGNilOC
 S1D7l5lYMiU4OUT8mfzfFUzl8yzejldVeElz3kaJcSnk+ov7XhmnZNkhYAWCILuSk4yvaTPrPt
 pHLn/nooOTMFZ9t4kUHL2q/CQf27u27vkS55l7fd2zWK26V2MFXExGnQDnW/IOUAPrx95bMv0P
 JWz2sgFH5mmxqAwhiJ03BJzODK0M46gxpAwrUkm2uTjwHRg7CNjaowVxhkDQ2gsecQD43bGV9t
 e3PaajqI0Dmja4cD4O+PAoK0xfuvGNegJCcMQDkzYGaz/VBAGeooUBpDV+I9Z1/UPni/wJGUCA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/w2kOfipJ9Jc5VDcHX6euYSe3PGqS6+WUFc+C1xXiC0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsQMLiK7yGmgmvETgtsyPuE+G2KBpp3ryIS
 obU2rjn7gWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1bXZCACsWg4vOdZqQvbRkIORkv5n8sXoDo6Q/RgV7NNK0wo3SmjsUBICl5hF1eKUzu/8CKbv246
 lQVPQS6xVoHrgv5T6TKUnffP6PVapgIHj0OMgSVKDZQ/m+vHiX1KJ6oe4OHOuHbU1bUYdesO2uw
 KcXHkhWhhKMABQNQ6fiLHCGLjRSxmIuNXbud1B9Y7xl95WHykkn901UU5Ooayy6LmcSe3G4NOpp
 5yDBTWKgOoVbw7r8DQjCqDCI7By/Hj9zILT+dwJwWg4XIBL3/yA36NaJzd9rxBNH44O36RUA+nM
 EIDfzrzlyyD3OwkEQm8UWc1vu2WTY7+QdR8HyKjzbTm5U+FJ
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
Changes in v8:
- Fixed commit message for set_timings patch (Abhinav)
- Link to v7: https://lore.kernel.org/r/20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org

Changes in v7:
- Updated Audio commit message to mention InfoFrame vs audio packet
  difference (Abhinav)
- Brought back msm_audio_update() calls to atomic_pre_enable() and
  atomic_post_disable() callbacks (Abhinav)
- Moved the call to msm_hdmi_set_timings() to the beginning of the
  atomic_pre_enable() (Abhinav)
- Link to v6: https://lore.kernel.org/r/20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org

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
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  31 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c          | 124 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 325 +++++++++++++++++++------
 drivers/gpu/drm/msm/registers/display/hdmi.xml |   2 +-
 6 files changed, 336 insertions(+), 268 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


