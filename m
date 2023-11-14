Return-Path: <linux-arm-msm+bounces-654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C657EBA13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883DB1C20B14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603102FC42;
	Tue, 14 Nov 2023 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="UPLkPeCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A02FC21
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:43 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36E710C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:41 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7dd65052aso72678277b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002841; x=1700607641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnYJwckhVUb/hQ+VqWd+HwwnYfkR02viqwW11QKBHpA=;
        b=UPLkPeCLKjdHSxSONMgOALl44MCDYR2/xtta79y9c8MHsYov2B+4wcGxY7ibBfHBpa
         fXxeFAUTz38x93wIil+fU81nn4Z9Vh4cQJJP3yM0O/MxG+w5SbIMKdFkXz4lu6L6kcrn
         LattTY1ozD6jZ8Q1l58qO0kDsumdz1LmK+KiwLy0K/DTCic8hFgGunKtpqIAXwyu6v9o
         5K5J6fSA2329RlST2/CzaJM5DBqSol3bfRp85AM4fN6U7rLfV4NjmuJ8PPSyfjoJK/+T
         Jv853r1jaloyLlnRQClQvbHFZbpL9l6/ifKNOt5gBe85V/9KY5VPQY/I+6dcaUbRVpo7
         /6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002841; x=1700607641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnYJwckhVUb/hQ+VqWd+HwwnYfkR02viqwW11QKBHpA=;
        b=JnIErrkmRv1GVQQQxoz9wZmcHeZZGu3KAMuJJhPbTEZSVZgoi0J05PCSqX0kTSuj9B
         T9aoSlyDIeSe8ZIapjYUVWxPz6O1OKh6XWm/sZt5le1FsUs1Uqn2deMOUa4bkCMmr24d
         8zfXe0eUOkHUbB+Nacg1i7QZEgqrws9LH9uPyCLXn+h1BJZi0UYo8xlM64Pby56WCFsU
         xZa7qnUtA2i9loEEg0INutfm4DA3lfbZasHFYPeG/I7jwxFWYDyLBy3iLo2FENLhYtRI
         XS79U53BG488wLU6+91g7brYb6HrzxlQ/HfNfJM97Nbo1pGdYGvVhOqNQB/Ix6fx/A0g
         rluA==
X-Gm-Message-State: AOJu0Yyc4IPqTu+ycIfBXW+H2+MJTE6qdhknb3y4wVo7ZSlBL3fAb8xt
	1sO0ISp5rf/9yb8zt71k0eJBOQ==
X-Google-Smtp-Source: AGHT+IF5YfJuojzCU5ZWpyNCZKZW27YiSBpBSE/rs8E1m68mg6G6/rODESlNkQJ5KMcm5C8qahqevA==
X-Received: by 2002:a81:5241:0:b0:5be:94a6:d919 with SMTP id g62-20020a815241000000b005be94a6d919mr12307437ywb.25.1700002840841;
        Tue, 14 Nov 2023 15:00:40 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:40 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/6] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Date: Tue, 14 Nov 2023 17:58:33 -0500
Message-Id: <20231114225857.19702-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dsc_slice_per_pkt field to mipi_dsi_device struct and the necessary
changes to msm driver to support this field.

Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
comment is incorrect.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  1 +
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 842765063b1b..892a463a7e03 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -161,6 +161,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -857,17 +858,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
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
@@ -1004,12 +998,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
@@ -1636,8 +1626,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
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
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..3e32fa52d94b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -193,6 +193,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.26.1


