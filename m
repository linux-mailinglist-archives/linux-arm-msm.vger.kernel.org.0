Return-Path: <linux-arm-msm+bounces-16233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54515896A2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16291F2102B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930187317B;
	Wed,  3 Apr 2024 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HIlU6+2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFE16F08A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135513; cv=none; b=c/ylqYNoJCg2u5LDWlbY0fllnJ++xg6xdYEjIxDBHFzKP4Kb3BJGv3IWvOGlCVhNVJR7/vP1VOgFdox0zSN4c7BgvNlVt/CtyiejxUgNaWsC3M2SIMFtt1Iu/Qr8010X6hzTn/Ssxp0F0tbwynuSo8F9HzJ77vSJKQU3lMeyKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135513; c=relaxed/simple;
	bh=1XtJXIGk14lZrEJ9Tlq+RINoht3cGrh52Xe3iqyl35I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBZsPQwXZCw422zwtZPlJMadVHyjhkowMOB41fD0Bhn7tRMyDRVL16nGQzvXnB+CgRvmkTWHzoTPFlYDn7XoKfzZWkETFlnoBHGRPehojV8sDLbnugd0tLizW4xZNejtpkbbHC6/DdO0X5hqgQirbxU4RItY1Y+Ypj4Kr1dgRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HIlU6+2w; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0d82d441bso55087535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712135511; x=1712740311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nFa+DoX75Gh3LGa/SLXrbw1YnZbOgzc+2X5SVpsYKU=;
        b=HIlU6+2wyFc4KSxDcw+VKgRUdgvSOHiJDkzPu0KlrnJxO9mYxk/U3Sv+lvEeSJ2BxI
         Qt5etAYsGXS/Oj+B0M+TsU89kdS1KyfOd8qh68TK/EKAsNPR5IC1u8ZaHBjdd/R5vf1a
         /AalUHkxzBVLRDsE+l4GaESGJ51pPvCbRg+Zrn+jZYQTREpSbBK2dGL60Ybgy6S5JlTi
         uflmDpGDbXyT+bqYL4OQMoWw9tYZ6JWXE85UmA4sdP+isXpP2m+w1JxQ3iuvDhkZpADe
         fh4tZBCgDmkqsYZpVXhD0nJnnh7ed34YYGObDUOtrWzMJcKuxsF+62/f+WrkfZUf7X6e
         uX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135511; x=1712740311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nFa+DoX75Gh3LGa/SLXrbw1YnZbOgzc+2X5SVpsYKU=;
        b=AcVU66C1xz0YX2455Bzwr3M7YD0soXfLffgoxIjB5Huh6XFXC4M9fqSw8X+7b4R0IA
         enKz136P+tGm6udNRaWpDt1gSNBPusGW+MJc77I6WHncNlTLiX3rZ2VuoGteDIGGiU9X
         WZJXf3xrpFvCq/vQmuLgddSFfFe4XcUWzpygru1Zo+WjW2IBMF0y+a9N/DaEe8s7Plx5
         C27CBWXW5Un7xBXX7AovpjHMKp567zBaNpb8dnZzdN6ndSxxlvzGb58iEbZ4+XSup9W/
         Ed60YZm3KE/d7CslvK2bCAOvVEVceDQ4R5Eswx+nSHLgDaFasyMel/XoUPdBYQ6XonWz
         OPiQ==
X-Gm-Message-State: AOJu0YzS8f+CST9BoG0LCmKEoFF/+EN/xEdOJXo8z6HSFZloCY7HRiZ1
	xBLRox7/7gEyjVfRiATd6Cn+564SEl3pObcdfIX0eST1XwXuZ8KUoIM8io0fFsyJA1WHFzOJKeY
	UMyg79Q==
X-Google-Smtp-Source: AGHT+IGDKZpi6IzWPwxcA3gkwURqgiirh03g+6YOT47tXCPNep36CItbq3BtloN4WYOSIhk1Xi88sQ==
X-Received: by 2002:a17:903:18f:b0:1e2:920a:4add with SMTP id z15-20020a170903018f00b001e2920a4addmr1179553plg.16.1712135511328;
        Wed, 03 Apr 2024 02:11:51 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:11:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:02 +0800
Subject: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=4300;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KdBFnUu2Qm6ZZ65hBcXTk+Bm1tsC1DSuVU4sJTWGxzk=;
 b=0c+GOay4d8sYuEfmKXCY3qnC69M5LNKT/bdL1VuwVHTTHSJMUP6DvEIlrEPtXbRf7brwZBC9G
 THfCXQuOr93AkNUmqicPhAO7A7LuE1Xr9W6EM3TZrI+KgKHpwS6Ti1a
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Support slice_per_pkt in msm driver.

Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
comment is incorrect.

Also trim the code to simplify the dsc reference.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b0507a42ee6a..0c6f40dbd25c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
-
+	bytes_per_pkt = dsc->slice_chunk_size * dsc->slice_per_pkt;
 	eol_byte_num = total_bytes_per_intf % 3;
 
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -916,6 +909,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
+	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
 	u32 h_total = mode->htotal;
 	u32 v_total = mode->vtotal;
@@ -947,8 +941,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
-	if (msm_host->dsc) {
-		struct drm_dsc_config *dsc = msm_host->dsc;
+	if (dsc) {
 		u32 bytes_per_pclk;
 
 		/* update dsc params with timing params */
@@ -988,14 +981,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			bytes_per_pclk = 3;
 
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), bytes_per_pclk);
 
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
+		if (dsc)
 			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
 
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
@@ -1016,21 +1009,17 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
+		if (dsc)
 			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
 
 		/* image data and 1 byte write_memory_start cmd */
-		if (!msm_host->dsc)
+		if (!dsc)
 			wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = dsc->slice_chunk_size * dsc->slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1657,8 +1646,12 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!dsi->dsc->slice_per_pkt)
+			dsi->dsc->slice_per_pkt = 1;
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);

-- 
2.34.1


