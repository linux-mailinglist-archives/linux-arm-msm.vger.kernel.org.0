Return-Path: <linux-arm-msm+bounces-47330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D44A2E0E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 22:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652721886257
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 21:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271541EEA56;
	Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426D1E5706
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137385; cv=none; b=NI0GCSYsyG8ZNT+XjZaJuhPDHVlvp6rhY7wr4izTSm5rsOkORprppwQQbho2A35qq6iCehatET7PIue+9PP7jLPufw6zATQ9VzAOWMuHdGDrcQ04G9tWfhKqbIFJopiMa8zQwEyPYKkE4IJkZYt+IQwTeidoIrXjgnJP7Ezdq/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137385; c=relaxed/simple;
	bh=VTdlerQNNpTUPZqatGVO2EiSPGoOtfou395t+Amfm6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePmkuOyn6ibqil5nO33bHL1OzifgvdI32q/L3Jm2G+bTjcDRH5l51oT7/Ui0RENjZ2YLM0URl8bO6YwnmdYWUmW6hB6bwjT1nptR+E1GVPhIOHK2TlSsIeF4LbZsHNGdDLD3JPqLVUZsjNGLMvuc8C3swvbY65PInM7YSF/Bu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B31F22018B;
	Sun,  9 Feb 2025 22:42:59 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 09 Feb 2025 22:42:52 +0100
Subject: [PATCH v2 1/3] drm/msm/dsi: Use existing per-interface slice count
 in DSC timing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4089;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=VTdlerQNNpTUPZqatGVO2EiSPGoOtfou395t+Amfm6I=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqSFirjkmyMVkeLXZR2FsC8zxQlShfIeyj03b5
 gwOfvsoSNeJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6khYgAKCRDxYtIxx+SG
 dkLHEAC0RQTGeY7iXQI1Y4Fw1YYmWHrM/TlO2OrUyRh5Zk7f6ruxTjkg2dxk159lHTjf30J+Eqq
 KYNGnQPX+ScWSs1vYOrY1NGAD1TuahxyiOsvhZtAPmCx7onHnpT16QYK8OqJv/cPs4Ksu8aqGYt
 8ravYv8r2rW2dYwIrNZt7r81oKNyc4VMb3jNGcR0ops6v17pxL1WXE1VV962noTltS9uCCQOUMj
 0ts8+1DshNDFrET5ZKNdnRS6+sza0hzM3H94Kgv/+/709QM2RtDNJ3EotGSCtB3w3tF1wFzU0n5
 k2dR5TA6Bz4xFnsYt7jVEKHKAwO7weZ8Bs4pAoWuOA7TfXPJTfrYR4q+OcwV3NG6R0s2vOIw5OO
 1XF0+fzq5UrQngQfMoAn9zPFfVW3odGlr5H5CHBMo8/UpV8v9nEUptseuyzKo/MUNKiwAZulw5p
 YodKAyFpmNt86zmqdwPqOtPDI51LqY5kexm0bOero0M6P03OTK90awksWiaK/tI0tw/P4oubyWr
 9Hn0zIdaLNRvUM9H5tGVoVSppMtH3DuFM0vqoCIUCc9S8rIE9TOhIcMqn+0Jx5wEkOefPndz2ei
 hDRk9r4bTgqngLhYQAg8HW3TUkr6pwV5+qcD+o37+2n7EWV8U6DAQrx78TOvCTSeo0X2eDFnMmz
 m0NV0TiBiY0Nw8w==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

When configuring the timing of DSI hosts (interfaces) in
dsi_timing_setup() all values written to registers are taking
bonded-mode into account by dividing the original mode width by 2
(half the data is sent over each of the two DSI hosts), but the full
width instead of the interface width is passed as hdisplay parameter to
dsi_update_dsc_timing().

Currently only msm_dsc_get_slices_per_intf() is called within
dsi_update_dsc_timing() with the `hdisplay` argument which clearly
documents that it wants the width of a single interface (which, again,
in bonded DSI mode is half the total width of the mode) resulting in all
subsequent values to be completely off.

However, as soon as we start to pass the halved hdisplay
into dsi_update_dsc_timing() we might as well discard
msm_dsc_get_slices_per_intf() since the value it calculates is already
available in dsc->slice_count which is per-interface by the current
design of MSM DPU/DSI implementations and their use of the DRM DSC
helpers.

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c   |  8 ++++----
 drivers/gpu/drm/msm/msm_dsc_helper.h | 11 -----------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fdaa0462b05d53cd8a2aad0269b1727..42e100a8adca09d7b55afce0e2553e76d898744f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -846,7 +846,7 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
 }
 
-static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
+static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode)
 {
 	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 reg, reg_ctrl, reg_ctrl2;
@@ -858,7 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
 	 */
-	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
+	slice_per_intf = dsc->slice_count;
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
 	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
@@ -991,7 +991,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
+			dsi_update_dsc_timing(msm_host, false);
 
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
@@ -1012,7 +1012,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
 		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
+			dsi_update_dsc_timing(msm_host, true);
 
 		/* image data and 1 byte write_memory_start cmd */
 		if (!msm_host->dsc)
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
index b9049fe1e2790703a6f42dd7e6cd3fa5eea29389..63f95523b2cbb48f822210ac47cdd3526f231a89 100644
--- a/drivers/gpu/drm/msm/msm_dsc_helper.h
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -12,17 +12,6 @@
 #include <linux/math.h>
 #include <drm/display/drm_dsc_helper.h>
 
-/**
- * msm_dsc_get_slices_per_intf() - calculate number of slices per interface
- * @dsc: Pointer to drm dsc config struct
- * @intf_width: interface width in pixels
- * Returns: Integer representing the number of slices for the given interface
- */
-static inline u32 msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, u32 intf_width)
-{
-	return DIV_ROUND_UP(intf_width, dsc->slice_width);
-}
-
 /**
  * msm_dsc_get_bytes_per_line() - calculate bytes per line
  * @dsc: Pointer to drm dsc config struct

-- 
2.48.1


