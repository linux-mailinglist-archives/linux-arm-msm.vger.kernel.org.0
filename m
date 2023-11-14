Return-Path: <linux-arm-msm+bounces-644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1497EB5BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 18:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A56531C20A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 17:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFBA2C1A1;
	Tue, 14 Nov 2023 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="NNOlHeT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1AB2C194
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 17:44:09 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3141CD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:08 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-778a92c06d6so358316785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1699983847; x=1700588647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOopcK9K4HsHFD0FhRzafDXESddDDjm1WV41GtBAoVg=;
        b=NNOlHeT6V2tk7tkOEN1XsYXa+HDykthr64IZi2AdUKw/5/8FEma3YPdRdmQ8IJr6fV
         hXPM8nnX3GHmpUjtlj/v6ibTby0lLq6D8kblpw3qpJnQd28gXkZ+BjdvHWuw4N39VsSB
         RQ0vsTE82U3jG09y+fLfsbhN+foHANDwB1qj+0lPZWAQ0VTflCPFD+TnaieOsCdjNFQh
         PGeEwafnIGRvX7LJzyEebM3zdanpfWKG1rxd+P7NL6/zBaas09YamM45qBHOdewcVwDI
         WEooIGlLa6R1/6pJhnM0amgjG8amSgiEHB1XAtOLDOwx+MHIGDS8H7Bz/hsjYGp0TKLs
         7Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699983847; x=1700588647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOopcK9K4HsHFD0FhRzafDXESddDDjm1WV41GtBAoVg=;
        b=YUggoDPgezVEYnYSAz31FQPO+Q9fHYK5aFtTFZP9Mscu0lJUYLsRPvmKe+GQU7QggW
         hOxnjp1svBcCwQO4Nb1J3jsVl7UHUFbt0mJKMcTJE1a3CC+l8/2BvzieJHZOLzisSH0g
         hQ+ARV7y73vtHnNpVk4Dso1IwE/cQQLuuRd5k2cVBPltz9rKtwObbV2PxbEONaxzgsbG
         Uic9SlAIlyVt0pCI5sPCmu6YU7CG8m8iEAKxgbuAQnjq4YuDnBCK9rWxhj8j1C5srsHr
         Yl0EzsdZkAqosgMrf/d39M6JHiI6yyIAJKJtpui28H4QyehcoF28LLUn2bNdxA0X0Z6z
         9zDw==
X-Gm-Message-State: AOJu0YwYxp2S0/V8JvZs6GqVi1xXyhS7rZZpz8na+YbQnNFpaWLPAs/Z
	5sc1BhMQwz0+s2jsosCu0vwaxw==
X-Google-Smtp-Source: AGHT+IEoUWi2pDWF6jdLsDdB9bo4yCiuTcH+dJCQhosEkkKLGNi7bZ3RwGK2wPPoN9/9Te+GQZRRKg==
X-Received: by 2002:a05:620a:4453:b0:77b:d90e:dd91 with SMTP id w19-20020a05620a445300b0077bd90edd91mr3857377qkp.46.1699983847240;
        Tue, 14 Nov 2023 09:44:07 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 09:44:07 -0800 (PST)
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
Subject: [PATCH 3/4] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Date: Tue, 14 Nov 2023 12:42:15 -0500
Message-Id: <20231114174218.19765-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
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
index 2ea2fc105fbf..7284346ab787 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -161,6 +161,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -855,17 +856,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
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
@@ -1002,12 +996,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
@@ -1634,8 +1624,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
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


