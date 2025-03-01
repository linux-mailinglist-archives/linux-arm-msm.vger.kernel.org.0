Return-Path: <linux-arm-msm+bounces-49912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F5A4AD00
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 18:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F412816DB5E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 17:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13671E51F1;
	Sat,  1 Mar 2025 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRmqjisa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DD1E2614
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740849064; cv=none; b=Q4mCzZ6LH08kgJjqT5O8+KzRGvpx1f0/po00XtsgCxosG5Tb63f4fhugiS0WHdV3YZz/TkWA38DU4nTlnhrZH1vc9a0L57KrlNYvI6Br+CohlOvo7c2OZ3UjA1p6obOjM+88//1HwkIMCW5KRFhN054N2kqS8k8jIvSh5r170xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740849064; c=relaxed/simple;
	bh=S5OuChTXe8RHWTOOd2rYoBZZVbvzR+cAiAR/WVy1ROk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kpjjwn3Ty1BnM3UUNNUtOwlmkMf2qVdF0RqrkZVIkX7m1IAyECrDXUsZQtXSibgGyz0zJFmv/SE+KZmsn3nNZ3QEbNhzOgEiIiZA2HTFc40nNs8m6peC6s2ilzDH6ad+WpHFFHwXEswNP6uRCHnVMQ1WeiizzNmHzOMRsFxWeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRmqjisa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461a485a72so3261474e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 09:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740849061; x=1741453861; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTSOh+6vc0fDAR7E7U91UFAeOUujh+ZpJVLlLuHs1jA=;
        b=CRmqjisa3KoXaJcq+cMXhGHgwjqsZcIEbsL0k7z8lntsBvOQu5xV/0M0oBKje3PQeM
         ZEsdh43e6BdAgsFV78LmSi/INTC1Tj2Pd8Z9xHLRYwsKhLfJ5h9AnpsVPPQ7T34elewB
         1BftGrvjFsVTHbGT8nb3joNnDq/IsqobGwPLsNoyp4s7BRSzDXQTnqMrUy1FyneCfJ+n
         fdp0Jw6hqTckbdHjoZ+VdA2D5+zx7gp5bZnIiCTSwWuiaQeG40jHz2TOMczXfHEdCHfn
         vEuIwDqd2ncFxMr7K4UUfmqbiBjaece+iSeSFtY5FYUn2/FRy7nuG+4MjB6oXh/wv2Oo
         bQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740849061; x=1741453861;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTSOh+6vc0fDAR7E7U91UFAeOUujh+ZpJVLlLuHs1jA=;
        b=L2L3mvz0Uec2iGMgWbjpJnCL/MBTv3ttThhLjgTEIk2oxZwqOceDnBZRXxREvehXFB
         zHB8qF/B95tCAl9krS+Ug2Gvob/ankLNRxdhA6aUt5IsSBYELc3Pjc8/mMSzC80hVkfT
         LmVaH97WLKvstnAt2d5R5R1Cg1E/99pSRlmFLZMkcAT6ysjoKGFxJ/LG5pqlAXvoIcuy
         mw3AQ5QBd5lL2ib+J1FzUo4fRN+Ng5nRPwDnrTQV0GMqMl4SlmitW6cT1q1MAbc36sp/
         7xDNPzGgHRAWIdpLX5i4/6fzs3rCMqi8AnGIMVBzs4U7/7Oz5MPTSfuoSS7urBkUZ4xP
         9C/w==
X-Forwarded-Encrypted: i=1; AJvYcCUgpWU1SSUfQV9v4GujYRXEPsIwUlarxT0PG9gMUGZfUgR7UkbZRseTQvBFX6r+YHWpRQQGJkpSzOOduEDm@vger.kernel.org
X-Gm-Message-State: AOJu0YwymSGEctmRGnpoengrQHKfhEo1r9OS4C/fEus2iszNtzjDiCQ8
	apLNW3oEUCufGQqdnWqngIEEDNhU9NTKW0r3osaTLevJr5Qoe+eCnete0CrDTeVGJyYy3Z19xB5
	2/Wk=
X-Gm-Gg: ASbGnctQThcuQS9twYLJF3Sw5R0UBrZE8q/sHWC4T6MB6B2My86S3OlfEJPngt8z7vN
	iAJsli/ti5ky4k/e1mPc5//+OT14Cuhet3HAnpRoOsfBOPDAjlAk42ZAA2sFdI/fsjKpDyiudyM
	pU1ifZlShluY3I6NXVOruuzTMT71cFrKykLH54iaC/WAk3gvw/OFVZWDwWrL2roLY9PONeaq2IA
	/OX9lP4ZI5p1qmL8DYRg4ZuuX77CY7IeZI/SyM41DuNlmBDnVuGsbw5iM/3mAjslkAOazjuz9Pd
	KKgI5RkXJdRxEEyEGRzWagGyU3SR6bqGitIhXf9zYwhzjScS3Sfm
X-Google-Smtp-Source: AGHT+IGjfTP3M1nC+JbXSe2IaduGP60EMXDnTNEYi01oiNBZO4gw8RM8QJ/UJEMcz87+6uNQsTJatw==
X-Received: by 2002:a05:6512:3f19:b0:545:c08:e17b with SMTP id 2adb3069b0e04-5494c328c3dmr2817722e87.23.1740849060798;
        Sat, 01 Mar 2025 09:11:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e52a47asm585313e87.152.2025.03.01.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 09:10:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Sat, 01 Mar 2025 19:10:54 +0200
Message-Id: <20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4/w2cC/3XMQQ6CMBCF4auQrq2ZlkLAlfcwLlqmhUmUklaJh
 nB3CyuUuHwv+f6JRRvIRnbKJhbsSJF8n4Y6ZKzpdN9aTpg2kyALkFByHHiHd+L6ieS5KLB2aKw
 xtWPJDME6eq29yzXtjuLDh/eaH8Xy/iuNggOvtBZKVw2gwvONeh380YeWLalRbnn9y2XiokRTW
 uOkdG7H8w0XO54nrmQN4CBXRsEXn+f5AzSqXcopAQAA
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S5OuChTXe8RHWTOOd2rYoBZZVbvzR+cAiAR/WVy1ROk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwz+hDFEtA8PzYi0XDQQscdSYGMSloFEiiE+wO
 wBuAM+tGneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8M/oQAKCRCLPIo+Aiko
 1RKbB/9yAM+aFQr7rcGvek4nWGz6fp6p7m+5TGAd3H10HnDGv9SrKPgyABE60xmFii+QLYK4YSz
 Y/CSGbOpBjMRJCSSmFnNa0Wm1hKX8luykI0PUe2DIbScy0lN4sV8fFWglwrYwqp1xyaD0yVR3F/
 foFeKAR8IFx9NmHQ6eK0AnFtzp0Wik6lp3vOAM0QoWdvp+F7k6I27b9MZCg3jTfe9sDj4eLfhuX
 JSkKgtxP5AkELE2kZ34NaMYvtgRE87EiifLrhbK6yTHml3V7NP916I6KAMrKVDUn87vylJiDPaP
 jIP3/ELrIcEaI3CpxIebsfg1aLyxcRXEW71TE7mBCPPoHL1+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
  HDMI driver.
- Drop outdated comment regarding subconnector from the commit message.
- Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org

Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c |  59 +++++++----
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  23 ++++-
 10 files changed, 91 insertions(+), 195 deletions(-)
---
base-commit: 5299e75907dcd85c906bd58fb6226e72c36742fe
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


