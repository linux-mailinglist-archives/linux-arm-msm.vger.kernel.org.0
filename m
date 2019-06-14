Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E715546B55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfFNU4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:56:35 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:44038 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbfFNU4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:56:35 -0400
Received: by mail-vs1-f74.google.com with SMTP id j186so1291093vsc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Hqmj3KOC0/+HjkeOr+Ogn5rNBLGqrlC9HeVJX7PS6ro=;
        b=dZhdIjz6vd/juH05RY6nTEp3Gekt5QdITEMcM/F6AViqk+XXSTlKvbdBrKqIlSCskF
         Z4SyOTM8Ia1UY7hdXBMpwXAKy0VpV2zqJYs3P+nbTdYA426dFSmwevqQI3AJPjt+iOh4
         X2Wv1S8yIgYH78W20GV9ldZej/yQ+odKeD0lx5g6115rUxmPUJ2yoEgB+J0uMdmoEGWs
         7GERveOOVs/hQpzzhh68dDy1gqFIpCfnIeUkQMkhA7Cl1im3WmqF8X/yqCy6+y03vSwW
         pN9onzrhtU3N0DQGj/CsKSbE3fXeCNldbUboxGoSkcFo6C7CtDkl3p+cBR47bXvMCCx1
         Rvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Hqmj3KOC0/+HjkeOr+Ogn5rNBLGqrlC9HeVJX7PS6ro=;
        b=ofvpL98a143rSjdCaMQrZ6blPamfSrSKYBTdsHZ9OrUH/t1wgSveJfsEtWbAkNty5z
         sCger7NEJwf7pT2TTkgB6pz5Nopt8VFIqKhSH4p+cz1zHCF9TTzSW3g93oosVi7LoiaG
         6n7iTKvBnV9LBLZR/7fk/PoM5dZGe5Y6glA0n/ULkMvsJm/LJiqaQdTtQQlEmm/XHF/8
         /ROt9vO0zY005f5wHG7DdbWED5no54z5OKoa0VuQyLIQ60mGQjuToYJ99nbh6zZj3C+H
         OqpObeP6edvglusZD38rgIZNgZ6p7V+6pcc3sx70VQkZrYbCITbDCyXnqLdamWFTuof5
         Q9Hw==
X-Gm-Message-State: APjAAAXxYSQhhi0x1sZJopGNEkTi77P8/f1lcOOHSHq7tUOjUgrIsccE
        zAGpsDbXc3A2XtOFs5rk6JwLkjU8fQ==
X-Google-Smtp-Source: APXvYqxQhQhf9yxGq2PhF5E9pperHshypElSemxeBdUJpiSfFj9fwgtnqfs1uCnvecZSAUJvLAOXMq7ELw==
X-Received: by 2002:ac5:c2d2:: with SMTP id i18mr1919912vkk.36.1560545794002;
 Fri, 14 Jun 2019 13:56:34 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:56:23 -0700
In-Reply-To: <CAKwvOdmq2og84Ja6eNpiNdZd_ArxJ+=4a6_q_c2OgwX3Z+93NQ@mail.gmail.com>
Message-Id: <20190614205623.128201-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdmq2og84Ja6eNpiNdZd_ArxJ+=4a6_q_c2OgwX3Z+93NQ@mail.gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] drm/msm/dpu: Fix Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang produces the following warning

drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:477:32: warning: unused
variable 'dpu_format_map_tile' [-Wunused-const-variable] static const
struct dpu_format dpu_format_map_tile[] = { ^

drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:602:32: warning: unused
variable 'dpu_format_map_p010' [-Wunused-const-variable] static const
struct dpu_format dpu_format_map_p010[] = { ^

drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:610:32: warning: unused
variable 'dpu_format_map_p010_ubwc' [-Wunused-const-variable] static
const struct dpu_format dpu_format_map_p010_ubwc[] = { ^

drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:619:32: warning: unused
variable 'dpu_format_map_tp10_ubwc' [-Wunused-const-variable] static
const struct dpu_format dpu_format_map_tp10_ubwc[] = { ^

Removing the unimplemented modifiers that cause the warning.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/528
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 110 --------------------
 1 file changed, 110 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 0440696b5bad..d28520faf157 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -470,90 +470,6 @@ static const struct dpu_format dpu_format_map[] = {
 		DPU_FETCH_LINEAR, 3),
 };
 
-/*
- * A5x tile formats tables:
- * These tables hold the A5x tile formats supported.
- */
-static const struct dpu_format dpu_format_map_tile[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(RGBA8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(BGRA8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(BGRX8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(RGBX8888,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
-		COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, DPU_FORMAT_FLAG_DX,
-		DPU_FETCH_UBWC, 1, DPU_TILE_HEIGHT_TILED),
-
-	PSEUDO_YUV_FMT_TILED(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_NV12),
-
-	PSEUDO_YUV_FMT_TILED(NV21,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C2_R_Cr, C1_B_Cb,
-		DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV,
-		DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_NV12),
-};
-
 /*
  * UBWC formats table:
  * This table holds the UBWC formats supported.
@@ -599,32 +515,6 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
 		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
 };
 
-static const struct dpu_format dpu_format_map_p010[] = {
-	PSEUDO_YUV_FMT_LOOSE(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, (DPU_FORMAT_FLAG_YUV | DPU_FORMAT_FLAG_DX),
-		DPU_FETCH_LINEAR, 2),
-};
-
-static const struct dpu_format dpu_format_map_p010_ubwc[] = {
-	PSEUDO_YUV_FMT_LOOSE_TILED(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, (DPU_FORMAT_FLAG_YUV | DPU_FORMAT_FLAG_DX |
-				DPU_FORMAT_FLAG_COMPRESSED),
-		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
-};
-
-static const struct dpu_format dpu_format_map_tp10_ubwc[] = {
-	PSEUDO_YUV_FMT_TILED(NV12,
-		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
-		C1_B_Cb, C2_R_Cr,
-		DPU_CHROMA_420, (DPU_FORMAT_FLAG_YUV | DPU_FORMAT_FLAG_DX |
-				DPU_FORMAT_FLAG_COMPRESSED),
-		DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
-};
-
 /* _dpu_get_v_h_subsample_rate - Get subsample rates for all formats we support
  *   Note: Not using the drm_format_*_subsampling since we have formats
  */
-- 
2.22.0.410.gd8fdbe21b5-goog

