Return-Path: <linux-arm-msm+bounces-50733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63635A5817B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E2A1890110
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 08:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1696B188A3B;
	Sun,  9 Mar 2025 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFHjYm2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9328DD0;
	Sun,  9 Mar 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508044; cv=none; b=dukCT4Ya0CQnXTiTJbMptSEJpDMrHhmWGZ3tRN4crGpx2RVSJoHvtbEX9xrvYTgMCQoI26k/Ua69DIpZNEL0drdsgP1MM7aDUeXcNjWOnEWPPxUhc0BX4lbNXObK5mT61sTkM8pV9gl2Qep0xyFD2AB6S6ImTlQQuRUDBfhHQXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508044; c=relaxed/simple;
	bh=9BlOFXAcL52pqaOXhKgnjzByr6uM1wVuOwRZXNaUb5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rePfjrKjMUGXhm0hkUOBkK4ZhTiOpS14n0BkKE3txVLE3dxYs6Dehj+ivjiVYHM2u+f0g5gaNEzi3ttMhycP5ywyzK33qZ8Ur2y13uJ24mopKbyCxOYTUXrtwSlg38M0RMXK6O48Op2ynn4rEWKl/33VRbiheApdbInFIHqIk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFHjYm2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42974C4CEE5;
	Sun,  9 Mar 2025 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741508043;
	bh=9BlOFXAcL52pqaOXhKgnjzByr6uM1wVuOwRZXNaUb5U=;
	h=From:Subject:Date:To:Cc:From;
	b=mFHjYm2yvmooa7VfxOxgsAscGInvMY323dYDX60lY26eCBThxwGaL0HW2fKbanbpc
	 ELX3fBT2vf/s56edwOmnZs0z9/MTlrwW1A5Q/r/MSs9eVdojUpjjd4+YhBoLlck3aV
	 L7Ix0QXLrTSo4NoEIbepg6xcXaPrxcBaXo39f0wNjT3cXy1s22LEAP8Nqr937qrrgf
	 Nw39hEHX8ZinCGx75RxxirHedc6Gm54rstKIgVbRSCO3mnC6He9HO6cXt9xlbPao8w
	 LZg4kvVmsXD+hhFbRTQZXOBZ4VHADAk4Bj7SbEjKzt/oYf64N6VOGqhNlJXASBKBds
	 5baqpIPnQhTxQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/4] drm/display: hdmi: provide common code to get Audio
 Clock Recovery params
Date: Sun, 09 Mar 2025 10:13:55 +0200
Message-Id: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNNzWcC/x3MMQqAMAxA0atIZgNpRRSvIg6lSTWDVVIQQby7x
 fEN/z9QxFQKTM0DJpcWPXKFaxuIW8iroHI1ePI9dTQi244b74ohGg6BXSIm5zlBTU6TpPe/m5f
 3/QAV9Dc7XgAAAA==
X-Change-ID: 20250308-drm-hdmi-acr-7ad1f0d012df
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9BlOFXAcL52pqaOXhKgnjzByr6uM1wVuOwRZXNaUb5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3Gy7L1n0F+9PZnSM8l3ElHgqHAXY9nQIo/u
 R01KQwreQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1aKeB/95KJqQpYAAWap+VHmraWFLscqQJ7F7hm5jYkVoocd3/6Yk08Xc56MZByxJYoH748BXYxk
 WrPZDf/487GWfes9Iib7OVFPjn2lCecJtXZCoqqMHxQMjmFyx66Lg4kdW4IvEBeYl/QRWEQyXaj
 vveEHUUTNJAU/BGSwoVUhU5PrcF4w9QQbNrBya+6RgXnmJqLlHZsoVnOPt7IV/mmtuEZX6OY6qN
 GM0JZrUNZ7QgYnRL24Xv8HS9QG1mJlSty1hHH1GV2rE9I8Bsya6QtAyQNUvqR7GTjSrE+zuTa5/
 5HUneJNp8V74RgjTPA00gtFKGb1tCZ9qK6ZHMkfm72vNSLUJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

HDMI standards define a recommended set of values to be used for Audio
Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
implements its own way to determine those values. Implement a common
helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
only) drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/display: hdmi: provide central data authority for ACR params
      drm/msm/hdmi: use new helper for ACR tables
      drm/vc4: use new helper to get ACR values
      drm: bridge: dw-hdmi: use new helper to get ACR values

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  90 ++--------------
 drivers/gpu/drm/display/drm_hdmi_helper.c | 164 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c     | 107 ++-----------------
 drivers/gpu/drm/vc4/vc4_hdmi.c            |  10 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h            |   7 ++
 include/drm/display/drm_hdmi_helper.h     |   6 ++
 6 files changed, 197 insertions(+), 187 deletions(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-drm-hdmi-acr-7ad1f0d012df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


