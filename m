Return-Path: <linux-arm-msm+bounces-29966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69676964191
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFADDB25739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C866C1922DE;
	Thu, 29 Aug 2024 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6bg9gTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E218EFEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926782; cv=none; b=biQKPiAGeL33A5l168g2mqQi12B46Oa8GrGhyP4Xjb72Y6HXX0c6ePpNA1gjbYuqk+F5Pbae0kbu3Asc1MHm43iIw8bfNewxJ81bU7IfY703O0d+KyqdSpHJBmsIOEch1MN4ZEutaXLUnsGwH8aczb3JLmbJWfDOZlCDPc5KddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926782; c=relaxed/simple;
	bh=3KazaGbXvjBN09Ux7IxbvfmwCLry/wnucqSSUOzn9II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prLCD3CZFMHychxMCE8CL/8saZ8GTeWrxkA4QmGmqsqhYN1AN1727ZgJFDce71FDsIv1mcn+lnoSCOOYNBv4ydFgvsT0HBDOAX1W2D2wyFGXz+Fdpsf49P0uYNj2w52oKGyDRHPdVrIk2ypx+pF1U+lquST0EM4G3fNuMegFgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6bg9gTw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-714287e4083so448936b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926780; x=1725531580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E55a1wcpHLjnTLosXy4HNdH7HmAgykI1Dzag/SnhcTk=;
        b=B6bg9gTwHoXRMZG2FSkUTMGtLWrbLwWDZ6gcvoZb+rDj6VvUxNJOE/nWV2y55ssQSH
         UuB2hNANbkPSRBLdnp8K3PryLbFGw0IDQd56WXGqzqmBvgxUtnHTDbNLriiCPFVGamPj
         SOWKn8QBMhVikjnVT3N2oY0bzedKEt3c/0g3cqoWyTK5HwpA+oxjXVN0+p3MjttMO8rC
         x1gQo3vvPxgO7f9AzUZ+GWZDEluK8dAgCzACTB5/roWg2ivVmwcw2+WJTUP9egLgMD/e
         hxrcM3Le+CbJEFB1ZGX/5EwR6wcvJxJeFJnrb4zkJ64iLUDIjq6A+kWAJ57SJyuJHstm
         I/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926780; x=1725531580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E55a1wcpHLjnTLosXy4HNdH7HmAgykI1Dzag/SnhcTk=;
        b=KNeSHrfnSXca+zhXzaNYOr40LRTYkb0lzcwR4diDhNee0DTjtIX6QyiVBTnTnbJD3v
         iTRVoqW6y7f1KzBHGvkBqmqFNVMsKX2141F2qHiDZ6G/aUcs8thJM3GlRZdW3qYWw3am
         q/5blztlHzJIncoeHY6RKeWSYZdWWxFbyxr7I+I5Z3AuIeQsKsK53IYlDeTnW58aUt2/
         OTEedvWdD/EdP/7Th6+P7czQDszl7R7zDBk97cS1IA5sIl+WkxAusX3RmO7Z5UjJ3swr
         GKE57DzwCPmBAOQucIRxRlHwBDLde0SwJklUGbs9Y5HF9PMneNz9+vujGQe0M88fsJ/3
         IwOg==
X-Gm-Message-State: AOJu0Ywpve8RNWWcgCeDugINbusZZpw6rk6UG09SFA6MqycCdJULh3sO
	L87z/pg9tz34VoxBopiGgpaYsDkUJ2lO+46mPh7YFvely3pnblmGzpS9ow8pBKA=
X-Google-Smtp-Source: AGHT+IEqQrSjReMBtL61vjPIYBgNN+UQ6L12JGUOOf0f2rla6UKGtA7MG5pXDEiIM1GTX8hCV5eYsw==
X-Received: by 2002:a05:6a20:aa89:b0:1cc:e487:ec12 with SMTP id adf61e73a8af0-1cce487ec8cmr1045714637.34.1724926780573;
        Thu, 29 Aug 2024 03:19:40 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:33 +0800
Subject: [PATCH 04/21] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=3705;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/3AbBR4A8QK4EPx9duFdiBsejuWCAd+c9GSHXKntqOw=;
 b=zfJJ6qS1x60/eMkNq5xKVUkAUMljY/7SXEzK0bP3wQZcxhGk+Y4RMZTE/ZoVI+ZzMYY4OaIYy
 QfldO5kWIQTBjjJjfx+lUMuVaZFIs9cTNJT92t2QZAH9/14hxo+jxLN
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

MSM display controller support multiple slice to be sent in a single DSC
packet. Add a dsc_slice_per_pkt field to mipi_dsi_device struct and
support this field in msm mdss driver.

Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
comment is incorrect.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5abade8f26b88..36f0470cdf588 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -157,6 +157,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -861,17 +862,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1019,12 +1013,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1629,8 +1619,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc_slice_per_pkt)
+			msm_host->dsc_slice_per_pkt = 1;
+	}
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 0f520eeeaa8e3..1c1b56077d44a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -196,6 +197,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**

-- 
2.34.1


