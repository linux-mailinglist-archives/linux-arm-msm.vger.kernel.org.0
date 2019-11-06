Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C87FF2286
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 00:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfKFX0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 18:26:07 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:48400 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfKFX0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 18:26:07 -0500
Received: by mail-pg1-f202.google.com with SMTP id q20so195863pgj.15
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 15:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OHExp+tEDC2Ckd4KCyaDSPrKz/CgG2oFSWHwrtG6Nuk=;
        b=hB5JsGIVBCVe0yAEVD1QoBFXIRnU5jUy1y5W0BWww6JzDTq785Vz0L54DSpf4k7Pym
         ewgZkLcVkpxRzfGViPWtJw26qBsk3rLYAjJmd0c0b+f+Ok83IYPkuJBdtxzdM/DKkme7
         5VKeZTdmZVSLFbDoOxW0+/y7vxlxwJeQR2g3XVel7onDJ7bXVGwxulyEPtj87iu9cQ2L
         VgDEo4E5beVuXLVaEzKDprnA7iWAjdfOPG22NkzbTKfQcxS1hCWuRpoZ4PBv77NtiESc
         YMHUKOv3mp33jia8LIdBOtYoIX29N8eRRp0bkhgd6JV3PQILVppg1ZAPAyuL0IALRa5k
         swqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OHExp+tEDC2Ckd4KCyaDSPrKz/CgG2oFSWHwrtG6Nuk=;
        b=F9WyEzQduY/f+VT2zZSQ7No3uHVgm/zV7Mv7uDBHvUEilIj/ZOZOFlJN624BSf95o9
         W4DagLD6dd3QLn53S2lgykYpU8w3ymCrpzHYyWG1Ushyzb91CTlNYqHQYrnxaXahh4gt
         a6l+KTbAeEKvwPVNyKmofv5/H5EbLA6zBkt+V7A7riJM94ZKk4L8SOsd3PAXVWTzgqjr
         /BO6hcpiiqaSD3ySH8sQRv3WL5+xuGmOQYFJ77hewQBHj6k5dDuT7CCfAlS5nIaymYy3
         m81U2npo2q1JUlcbG0zishbi7NUwReVi9sUMqPYMDSjlx/yDAE6ppIafY5nUTdvPwmdx
         AXgQ==
X-Gm-Message-State: APjAAAVwMgT155mgSdC0UrLrxNsBbApMS2ZegQP9jsnBUtPxYRZdyIfy
        zAKj8WArHVNSqJYW/odiAb53vniaKf7tSA==
X-Google-Smtp-Source: APXvYqw+lyIGfoOJx9NcumMhBIdS7SlvcbY2irz9ydE3WS2lDD1iv9VMZkOUmgFplo4egCEImSiASh5dTrFaow==
X-Received: by 2002:a63:7247:: with SMTP id c7mr496438pgn.311.1573082766024;
 Wed, 06 Nov 2019 15:26:06 -0800 (PST)
Date:   Wed,  6 Nov 2019 15:25:53 -0800
Message-Id: <20191106232553.76553-1-frkoenig@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
From:   Fritz Koenig <frkoenig@google.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hardware only natively supports BGR8888 UBWC.
UBWC support for RGB8888 can be had by pretending
that the buffer is BGR.

Signed-off-by: Fritz Koenig <frkoenig@google.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/dpu_hw_catalog_format.h  |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 24ab6249083a..528632690f1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -489,12 +489,28 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
 		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
+	/* ARGB8888 and ABGR8888 purposely have the same color
+	 * ordering.  The hardware only supports ABGR8888 UBWC
+	 * natively.
+	 */
+	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		true, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
 		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
 		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
 
+	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+		false, 4, DPU_FORMAT_FLAG_COMPRESSED,
+		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
@@ -550,7 +566,9 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
 {
 	static const struct dpu_media_color_map dpu_media_ubwc_map[] = {
 		{DRM_FORMAT_ABGR8888, COLOR_FMT_RGBA8888_UBWC},
+		{DRM_FORMAT_ARGB8888, COLOR_FMT_RGBA8888_UBWC},
 		{DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
+		{DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
 		{DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
 		{DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
 		{DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
index bb6112c949ae..fbcb3c4bbfee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
@@ -6,7 +6,9 @@
 
 static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 };
 
-- 
2.24.0.432.g9d3f5f5b63-goog

