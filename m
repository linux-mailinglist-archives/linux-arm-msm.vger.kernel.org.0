Return-Path: <linux-arm-msm+bounces-7516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F3830E14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CEB31F28E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616824B3E;
	Wed, 17 Jan 2024 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdUJJtCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2722420C;
	Wed, 17 Jan 2024 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523886; cv=none; b=gyRwq1Yi591JfIsLSuQ6Ks/eELdDT29cr50LrYiJgIapdLLQBAKgdk+uvau2LvS8igZUhL5mnh+jEe/oJ2VaRS3cr9bLUopXZp+XZDZxnhH+bZhnw9xyWPQyzAsbVHwVLz5EgndHuCW0aHLVB5nRf8RjBg4ixMRbdYOhVB0l/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523886; c=relaxed/simple;
	bh=06UyuMspjUOT41qL6v2XDm0s2QgxJGLmZ/XpazlHRK4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=mdfkKTGMFaMPo8v9wkUIIy8U6SxfdJ/6+LA9KL2bYENVATZoTxslminI1k+Z47dEfzwAx3a4R3+poin1eEVsLDfgPxqcED7fuprXf3rQYQipgyPfHQxnryDFjQajophtOQoxaWWBTtOPM7nZ+kvs0IoGQuhwY5ElTQ0djfaaPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdUJJtCA; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28e82c1f7e4so1360148a91.1;
        Wed, 17 Jan 2024 12:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705523873; x=1706128673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEueicJMTQx9ZU5TPz3ej33QasfS+lblKa6pBTeQNpY=;
        b=mdUJJtCALzgvGm3/AzMsUzkv69O5ijXLAPdcQqoED8lZcG5F/IN/GAsmloGryHDh4f
         Fn/VP8lNhCM1/9Py0MVuhUYyZmOkaU89zETAjNYr3ffjVy7XfrEmb6JTil6TluyT5VaA
         g13xxZM+pEmpDXYa0q/s2QeZSsGhuXBNBxei12bV89g0REYQPFnDf6/rLJXTAzanlXpj
         yEm3oB2P7AuyEkVYfO29srXjDssrIk0crqnxu198qqq+3nX1OkU25CHe8vWT7Tb4pkv7
         Pbxb+BXvDqvmKJ727jzpJlGMxsIGXV163OkorPDEkb4hEtN5Tr1cySXkyPJH99RmmkyS
         HZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523873; x=1706128673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEueicJMTQx9ZU5TPz3ej33QasfS+lblKa6pBTeQNpY=;
        b=Byfonql61pW+VMni1uhvBtmzlfFfSUOs3ptGoRVODcixB+nSv5IvJ/B+41XvkkqN0c
         2Gr1O9xKKKcILqiA9lL5jJyUDCBoGzL4ian+gRH/EGfMdmFrYvTJXvNn+qQ0r4o9a11U
         kFZFruaHnvTH+PIZSO3oPBch11aOgqx7xl5KtOna50j73iJ4+abjKxpwIQQIXR5065dB
         QARpToOqR8Y4j0rREWyqLO7mqGgkj/mPCsCXYitfYfh0yUi9E6mPslF4QL2RD6PhF0cr
         YGwVgm6DZX44SN2fJD2TpP6g7jCVMe1liwFGO5nq7Ar6/W3u2H216OiLRyjIZ/ugZETv
         zq/A==
X-Gm-Message-State: AOJu0YwLkBbqEcXNes4nZgzv/kd08DjpCw2U0lUtONinqf/df5KlajG/
	atx2eFGYcoORQJn3VS2lr0k=
X-Google-Smtp-Source: AGHT+IHpAkho2C5uSlZfbqATv90LyFspWQ9oRVtb+nEjSL4FJ372qVOPr/+FehT2NHssrnFOhEqpAg==
X-Received: by 2002:a17:90a:1348:b0:28f:f70b:8e67 with SMTP id y8-20020a17090a134800b0028ff70b8e67mr1216980pjf.73.1705523872618;
        Wed, 17 Jan 2024 12:37:52 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
        by smtp.gmail.com with ESMTPSA id sh11-20020a17090b524b00b0028cdbf2281dsm82969pjb.48.2024.01.17.12.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 12:37:51 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Update generated headers
Date: Wed, 17 Jan 2024 12:37:18 -0800
Message-ID: <20240117203744.394260-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This updates the GPU headers to latest from mesa, using gen_header.py
(which is used to generate headers at bulid time for mesa), rather than
headergen2 (which doesn't have proper support for A6XX vs A7XX register
variants).

Mostly just uninteresting churn, but there are a couple spots in a7xx
paths which update REG_A6XX_foo to REG_A7XX_foo for registers which are
a7xx specific.

Cc: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx.xml.h         |   73 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h         |  131 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h         |  182 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  666 +--
 drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 4631 ++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |  179 +-
 .../gpu/drm/msm/adreno/adreno_common.xml.h    |  260 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  572 +-
 9 files changed, 4960 insertions(+), 1740 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx.xml.h b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
index f87a1312f580..b66ea995b631 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
@@ -3,28 +3,20 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml          (  91929 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,8 +37,21 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum a2xx_rb_dither_type {
 	DITHER_PIXEL = 0,
@@ -1442,16 +1447,18 @@ static inline uint32_t A2XX_MH_ARBITER_CONFIG_IN_FLIGHT_LIMIT(uint32_t val)
 #define A2XX_A220_VSC_BIN_SIZE_WIDTH__SHIFT			0
 static inline uint32_t A2XX_A220_VSC_BIN_SIZE_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A2XX_A220_VSC_BIN_SIZE_WIDTH__SHIFT) & A2XX_A220_VSC_BIN_SIZE_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A2XX_A220_VSC_BIN_SIZE_WIDTH__SHIFT) & A2XX_A220_VSC_BIN_SIZE_WIDTH__MASK;
 }
 #define A2XX_A220_VSC_BIN_SIZE_HEIGHT__MASK			0x000003e0
 #define A2XX_A220_VSC_BIN_SIZE_HEIGHT__SHIFT			5
 static inline uint32_t A2XX_A220_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A2XX_A220_VSC_BIN_SIZE_HEIGHT__SHIFT) & A2XX_A220_VSC_BIN_SIZE_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A2XX_A220_VSC_BIN_SIZE_HEIGHT__SHIFT) & A2XX_A220_VSC_BIN_SIZE_HEIGHT__MASK;
 }
 
-static inline uint32_t REG_A2XX_VSC_PIPE(uint32_t i0) { return 0x00000c06 + 0x3*i0; }
+#define REG_A2XX_VSC_PIPE(i0) (0x00000c06 + 0x3*(i0))
 
 static inline uint32_t REG_A2XX_VSC_PIPE_CONFIG(uint32_t i0) { return 0x00000c06 + 0x3*i0; }
 
@@ -1661,7 +1668,8 @@ static inline uint32_t A2XX_RB_COLOR_INFO_SWAP(uint32_t val)
 #define A2XX_RB_COLOR_INFO_BASE__SHIFT				12
 static inline uint32_t A2XX_RB_COLOR_INFO_BASE(uint32_t val)
 {
-	return ((val >> 12) << A2XX_RB_COLOR_INFO_BASE__SHIFT) & A2XX_RB_COLOR_INFO_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A2XX_RB_COLOR_INFO_BASE__SHIFT) & A2XX_RB_COLOR_INFO_BASE__MASK;
 }
 
 #define REG_A2XX_RB_DEPTH_INFO					0x00002002
@@ -1675,7 +1683,8 @@ static inline uint32_t A2XX_RB_DEPTH_INFO_DEPTH_FORMAT(enum adreno_rb_depth_form
 #define A2XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT			12
 static inline uint32_t A2XX_RB_DEPTH_INFO_DEPTH_BASE(uint32_t val)
 {
-	return ((val >> 12) << A2XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A2XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A2XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A2XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
 }
 
 #define REG_A2XX_A225_RB_COLOR_INFO3				0x00002005
@@ -2654,7 +2663,8 @@ static inline uint32_t A2XX_RB_COPY_CONTROL_CLEAR_MASK(uint32_t val)
 #define A2XX_RB_COPY_DEST_PITCH__SHIFT				0
 static inline uint32_t A2XX_RB_COPY_DEST_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A2XX_RB_COPY_DEST_PITCH__SHIFT) & A2XX_RB_COPY_DEST_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A2XX_RB_COPY_DEST_PITCH__SHIFT) & A2XX_RB_COPY_DEST_PITCH__MASK;
 }
 
 #define REG_A2XX_RB_COPY_DEST_INFO				0x0000231b
@@ -3027,7 +3037,8 @@ static inline uint32_t A2XX_SQ_TEX_0_CLAMP_Z(enum sq_tex_clamp val)
 #define A2XX_SQ_TEX_0_PITCH__SHIFT				22
 static inline uint32_t A2XX_SQ_TEX_0_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A2XX_SQ_TEX_0_PITCH__SHIFT) & A2XX_SQ_TEX_0_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A2XX_SQ_TEX_0_PITCH__SHIFT) & A2XX_SQ_TEX_0_PITCH__MASK;
 }
 #define A2XX_SQ_TEX_0_TILED					0x80000000
 
@@ -3061,7 +3072,8 @@ static inline uint32_t A2XX_SQ_TEX_1_CLAMP_POLICY(enum sq_tex_clamp_policy val)
 #define A2XX_SQ_TEX_1_BASE_ADDRESS__SHIFT			12
 static inline uint32_t A2XX_SQ_TEX_1_BASE_ADDRESS(uint32_t val)
 {
-	return ((val >> 12) << A2XX_SQ_TEX_1_BASE_ADDRESS__SHIFT) & A2XX_SQ_TEX_1_BASE_ADDRESS__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A2XX_SQ_TEX_1_BASE_ADDRESS__SHIFT) & A2XX_SQ_TEX_1_BASE_ADDRESS__MASK;
 }
 
 #define REG_A2XX_SQ_TEX_2					0x00000002
@@ -3229,8 +3241,11 @@ static inline uint32_t A2XX_SQ_TEX_5_DIMENSION(enum sq_tex_dimension val)
 #define A2XX_SQ_TEX_5_MIP_ADDRESS__SHIFT			12
 static inline uint32_t A2XX_SQ_TEX_5_MIP_ADDRESS(uint32_t val)
 {
-	return ((val >> 12) << A2XX_SQ_TEX_5_MIP_ADDRESS__SHIFT) & A2XX_SQ_TEX_5_MIP_ADDRESS__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A2XX_SQ_TEX_5_MIP_ADDRESS__SHIFT) & A2XX_SQ_TEX_5_MIP_ADDRESS__MASK;
 }
 
+#ifdef __cplusplus
+#endif
 
 #endif /* A2XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a3xx.xml.h b/drivers/gpu/drm/msm/adreno/a3xx.xml.h
index 237b564445be..119d4d6e5796 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a3xx.xml.h
@@ -3,28 +3,20 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml          (  84323 bytes, from Wed Aug 23 10:39:39 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,8 +37,21 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum a3xx_tile_mode {
 	LINEAR = 0,
@@ -612,6 +617,7 @@ enum a3xx_tex_msaa {
 #define A3XX_INT0_CP_AHB_ERROR_HALT				0x00200000
 #define A3XX_INT0_MISC_HANG_DETECT				0x01000000
 #define A3XX_INT0_UCHE_OOB_ACCESS				0x02000000
+
 #define REG_A3XX_RBBM_HW_VERSION				0x00000000
 
 #define REG_A3XX_RBBM_HW_RELEASE				0x00000001
@@ -672,13 +678,9 @@ enum a3xx_tex_msaa {
 #define REG_A3XX_RBBM_INTERFACE_HANG_MASK_CTL3			0x0000005a
 
 #define REG_A3XX_RBBM_INT_SET_CMD				0x00000060
-
 #define REG_A3XX_RBBM_INT_CLEAR_CMD				0x00000061
-
 #define REG_A3XX_RBBM_INT_0_MASK				0x00000063
-
 #define REG_A3XX_RBBM_INT_0_STATUS				0x00000064
-
 #define REG_A3XX_RBBM_PERFCTR_CTL				0x00000080
 #define A3XX_RBBM_PERFCTR_CTL_ENABLE				0x00000001
 
@@ -912,7 +914,7 @@ enum a3xx_tex_msaa {
 
 #define REG_A3XX_CP_PROTECT_STATUS				0x0000045f
 
-static inline uint32_t REG_A3XX_CP_PROTECT(uint32_t i0) { return 0x00000460 + 0x1*i0; }
+#define REG_A3XX_CP_PROTECT(i0) (0x00000460 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_CP_PROTECT_REG(uint32_t i0) { return 0x00000460 + 0x1*i0; }
 
@@ -1167,7 +1169,8 @@ static inline uint32_t A3XX_RB_MODE_CONTROL_MRT(uint32_t val)
 #define A3XX_RB_RENDER_CONTROL_BIN_WIDTH__SHIFT			4
 static inline uint32_t A3XX_RB_RENDER_CONTROL_BIN_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A3XX_RB_RENDER_CONTROL_BIN_WIDTH__SHIFT) & A3XX_RB_RENDER_CONTROL_BIN_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_RB_RENDER_CONTROL_BIN_WIDTH__SHIFT) & A3XX_RB_RENDER_CONTROL_BIN_WIDTH__MASK;
 }
 #define A3XX_RB_RENDER_CONTROL_DISABLE_COLOR_PIPE		0x00001000
 #define A3XX_RB_RENDER_CONTROL_ENABLE_GMEM			0x00002000
@@ -1218,7 +1221,7 @@ static inline uint32_t A3XX_RB_ALPHA_REF_FLOAT(float val)
 	return ((_mesa_float_to_half(val)) << A3XX_RB_ALPHA_REF_FLOAT__SHIFT) & A3XX_RB_ALPHA_REF_FLOAT__MASK;
 }
 
-static inline uint32_t REG_A3XX_RB_MRT(uint32_t i0) { return 0x000020c4 + 0x4*i0; }
+#define REG_A3XX_RB_MRT(i0) (0x000020c4 + 0x4*(i0))
 
 static inline uint32_t REG_A3XX_RB_MRT_CONTROL(uint32_t i0) { return 0x000020c4 + 0x4*i0; }
 #define A3XX_RB_MRT_CONTROL_READ_DEST_ENABLE			0x00000008
@@ -1267,7 +1270,8 @@ static inline uint32_t A3XX_RB_MRT_BUF_INFO_COLOR_SWAP(enum a3xx_color_swap val)
 #define A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT		17
 static inline uint32_t A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT) & A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT) & A3XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__MASK;
 }
 
 static inline uint32_t REG_A3XX_RB_MRT_BUF_BASE(uint32_t i0) { return 0x000020c6 + 0x4*i0; }
@@ -1275,7 +1279,8 @@ static inline uint32_t REG_A3XX_RB_MRT_BUF_BASE(uint32_t i0) { return 0x000020c6
 #define A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE__SHIFT		4
 static inline uint32_t A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE(uint32_t val)
 {
-	return ((val >> 5) << A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE__SHIFT) & A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE__SHIFT) & A3XX_RB_MRT_BUF_BASE_COLOR_BUF_BASE__MASK;
 }
 
 static inline uint32_t REG_A3XX_RB_MRT_BLEND_CONTROL(uint32_t i0) { return 0x000020c7 + 0x4*i0; }
@@ -1407,7 +1412,8 @@ static inline uint32_t A3XX_RB_COPY_CONTROL_FASTCLEAR(uint32_t val)
 #define A3XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT			14
 static inline uint32_t A3XX_RB_COPY_CONTROL_GMEM_BASE(uint32_t val)
 {
-	return ((val >> 14) << A3XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT) & A3XX_RB_COPY_CONTROL_GMEM_BASE__MASK;
+	assert(!(val & 0x3fff));
+	return (((val >> 14)) << A3XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT) & A3XX_RB_COPY_CONTROL_GMEM_BASE__MASK;
 }
 
 #define REG_A3XX_RB_COPY_DEST_BASE				0x000020ed
@@ -1415,7 +1421,8 @@ static inline uint32_t A3XX_RB_COPY_CONTROL_GMEM_BASE(uint32_t val)
 #define A3XX_RB_COPY_DEST_BASE_BASE__SHIFT			4
 static inline uint32_t A3XX_RB_COPY_DEST_BASE_BASE(uint32_t val)
 {
-	return ((val >> 5) << A3XX_RB_COPY_DEST_BASE_BASE__SHIFT) & A3XX_RB_COPY_DEST_BASE_BASE__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_RB_COPY_DEST_BASE_BASE__SHIFT) & A3XX_RB_COPY_DEST_BASE_BASE__MASK;
 }
 
 #define REG_A3XX_RB_COPY_DEST_PITCH				0x000020ee
@@ -1423,7 +1430,8 @@ static inline uint32_t A3XX_RB_COPY_DEST_BASE_BASE(uint32_t val)
 #define A3XX_RB_COPY_DEST_PITCH_PITCH__SHIFT			0
 static inline uint32_t A3XX_RB_COPY_DEST_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A3XX_RB_COPY_DEST_PITCH_PITCH__SHIFT) & A3XX_RB_COPY_DEST_PITCH_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_RB_COPY_DEST_PITCH_PITCH__SHIFT) & A3XX_RB_COPY_DEST_PITCH_PITCH__MASK;
 }
 
 #define REG_A3XX_RB_COPY_DEST_INFO				0x000020ef
@@ -1491,7 +1499,8 @@ static inline uint32_t A3XX_RB_DEPTH_INFO_DEPTH_FORMAT(enum adreno_rb_depth_form
 #define A3XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT			11
 static inline uint32_t A3XX_RB_DEPTH_INFO_DEPTH_BASE(uint32_t val)
 {
-	return ((val >> 12) << A3XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A3XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A3XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A3XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
 }
 
 #define REG_A3XX_RB_DEPTH_PITCH					0x00002103
@@ -1499,7 +1508,8 @@ static inline uint32_t A3XX_RB_DEPTH_INFO_DEPTH_BASE(uint32_t val)
 #define A3XX_RB_DEPTH_PITCH__SHIFT				0
 static inline uint32_t A3XX_RB_DEPTH_PITCH(uint32_t val)
 {
-	return ((val >> 3) << A3XX_RB_DEPTH_PITCH__SHIFT) & A3XX_RB_DEPTH_PITCH__MASK;
+	assert(!(val & 0x7));
+	return (((val >> 3)) << A3XX_RB_DEPTH_PITCH__SHIFT) & A3XX_RB_DEPTH_PITCH__MASK;
 }
 
 #define REG_A3XX_RB_STENCIL_CONTROL				0x00002104
@@ -1562,7 +1572,8 @@ static inline uint32_t A3XX_RB_STENCIL_CONTROL_ZFAIL_BF(enum adreno_stencil_op v
 #define A3XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT		11
 static inline uint32_t A3XX_RB_STENCIL_INFO_STENCIL_BASE(uint32_t val)
 {
-	return ((val >> 12) << A3XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT) & A3XX_RB_STENCIL_INFO_STENCIL_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A3XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT) & A3XX_RB_STENCIL_INFO_STENCIL_BASE__MASK;
 }
 
 #define REG_A3XX_RB_STENCIL_PITCH				0x00002107
@@ -1570,7 +1581,8 @@ static inline uint32_t A3XX_RB_STENCIL_INFO_STENCIL_BASE(uint32_t val)
 #define A3XX_RB_STENCIL_PITCH__SHIFT				0
 static inline uint32_t A3XX_RB_STENCIL_PITCH(uint32_t val)
 {
-	return ((val >> 3) << A3XX_RB_STENCIL_PITCH__SHIFT) & A3XX_RB_STENCIL_PITCH__MASK;
+	assert(!(val & 0x7));
+	return (((val >> 3)) << A3XX_RB_STENCIL_PITCH__SHIFT) & A3XX_RB_STENCIL_PITCH__MASK;
 }
 
 #define REG_A3XX_RB_STENCILREFMASK				0x00002108
@@ -1877,7 +1889,7 @@ static inline uint32_t A3XX_HLSQ_CL_NDRANGE_0_REG_LOCALSIZE2(uint32_t val)
 	return ((val) << A3XX_HLSQ_CL_NDRANGE_0_REG_LOCALSIZE2__SHIFT) & A3XX_HLSQ_CL_NDRANGE_0_REG_LOCALSIZE2__MASK;
 }
 
-static inline uint32_t REG_A3XX_HLSQ_CL_GLOBAL_WORK(uint32_t i0) { return 0x0000220b + 0x2*i0; }
+#define REG_A3XX_HLSQ_CL_GLOBAL_WORK(i0) (0x0000220b + 0x2*(i0))
 
 static inline uint32_t REG_A3XX_HLSQ_CL_GLOBAL_WORK_SIZE(uint32_t i0) { return 0x0000220b + 0x2*i0; }
 
@@ -1889,7 +1901,7 @@ static inline uint32_t REG_A3XX_HLSQ_CL_GLOBAL_WORK_OFFSET(uint32_t i0) { return
 
 #define REG_A3XX_HLSQ_CL_KERNEL_CONST_REG			0x00002214
 
-static inline uint32_t REG_A3XX_HLSQ_CL_KERNEL_GROUP(uint32_t i0) { return 0x00002215 + 0x1*i0; }
+#define REG_A3XX_HLSQ_CL_KERNEL_GROUP(i0) (0x00002215 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_HLSQ_CL_KERNEL_GROUP_RATIO(uint32_t i0) { return 0x00002215 + 0x1*i0; }
 
@@ -1965,7 +1977,7 @@ static inline uint32_t A3XX_VFD_CONTROL_1_REGID4INST(uint32_t val)
 
 #define REG_A3XX_VFD_INDEX_OFFSET				0x00002245
 
-static inline uint32_t REG_A3XX_VFD_FETCH(uint32_t i0) { return 0x00002246 + 0x2*i0; }
+#define REG_A3XX_VFD_FETCH(i0) (0x00002246 + 0x2*(i0))
 
 static inline uint32_t REG_A3XX_VFD_FETCH_INSTR_0(uint32_t i0) { return 0x00002246 + 0x2*i0; }
 #define A3XX_VFD_FETCH_INSTR_0_FETCHSIZE__MASK			0x0000007f
@@ -1997,7 +2009,7 @@ static inline uint32_t A3XX_VFD_FETCH_INSTR_0_STEPRATE(uint32_t val)
 
 static inline uint32_t REG_A3XX_VFD_FETCH_INSTR_1(uint32_t i0) { return 0x00002247 + 0x2*i0; }
 
-static inline uint32_t REG_A3XX_VFD_DECODE(uint32_t i0) { return 0x00002266 + 0x1*i0; }
+#define REG_A3XX_VFD_DECODE(i0) (0x00002266 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_VFD_DECODE_INSTR(uint32_t i0) { return 0x00002266 + 0x1*i0; }
 #define A3XX_VFD_DECODE_INSTR_WRITEMASK__MASK			0x0000000f
@@ -2084,7 +2096,7 @@ static inline uint32_t A3XX_VPC_PACK_NUMNONPOSVSVAR(uint32_t val)
 	return ((val) << A3XX_VPC_PACK_NUMNONPOSVSVAR__SHIFT) & A3XX_VPC_PACK_NUMNONPOSVSVAR__MASK;
 }
 
-static inline uint32_t REG_A3XX_VPC_VARYING_INTERP(uint32_t i0) { return 0x00002282 + 0x1*i0; }
+#define REG_A3XX_VPC_VARYING_INTERP(i0) (0x00002282 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_VPC_VARYING_INTERP_MODE(uint32_t i0) { return 0x00002282 + 0x1*i0; }
 #define A3XX_VPC_VARYING_INTERP_MODE_C0__MASK			0x00000003
@@ -2184,7 +2196,7 @@ static inline uint32_t A3XX_VPC_VARYING_INTERP_MODE_CF(enum a3xx_intp_mode val)
 	return ((val) << A3XX_VPC_VARYING_INTERP_MODE_CF__SHIFT) & A3XX_VPC_VARYING_INTERP_MODE_CF__MASK;
 }
 
-static inline uint32_t REG_A3XX_VPC_VARYING_PS_REPL(uint32_t i0) { return 0x00002286 + 0x1*i0; }
+#define REG_A3XX_VPC_VARYING_PS_REPL(i0) (0x00002286 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0x00002286 + 0x1*i0; }
 #define A3XX_VPC_VARYING_PS_REPL_MODE_C0__MASK			0x00000003
@@ -2392,7 +2404,7 @@ static inline uint32_t A3XX_SP_VS_PARAM_REG_TOTALVSOUTVAR(uint32_t val)
 	return ((val) << A3XX_SP_VS_PARAM_REG_TOTALVSOUTVAR__SHIFT) & A3XX_SP_VS_PARAM_REG_TOTALVSOUTVAR__MASK;
 }
 
-static inline uint32_t REG_A3XX_SP_VS_OUT(uint32_t i0) { return 0x000022c7 + 0x1*i0; }
+#define REG_A3XX_SP_VS_OUT(i0) (0x000022c7 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_SP_VS_OUT_REG(uint32_t i0) { return 0x000022c7 + 0x1*i0; }
 #define A3XX_SP_VS_OUT_REG_A_REGID__MASK			0x000000ff
@@ -2422,7 +2434,7 @@ static inline uint32_t A3XX_SP_VS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A3XX_SP_VS_OUT_REG_B_COMPMASK__SHIFT) & A3XX_SP_VS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A3XX_SP_VS_VPC_DST(uint32_t i0) { return 0x000022d0 + 0x1*i0; }
+#define REG_A3XX_SP_VS_VPC_DST(i0) (0x000022d0 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_SP_VS_VPC_DST_REG(uint32_t i0) { return 0x000022d0 + 0x1*i0; }
 #define A3XX_SP_VS_VPC_DST_REG_OUTLOC0__MASK			0x0000007f
@@ -2477,7 +2489,8 @@ static inline uint32_t A3XX_SP_VS_OBJ_OFFSET_REG_SHADEROBJOFFSET(uint32_t val)
 #define A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM__SHIFT	0
 static inline uint32_t A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val) << A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM__SHIFT) & A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x7f));
+	return (((val >> 7)) << A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM__SHIFT) & A3XX_SP_VS_PVT_MEM_PARAM_REG_MEMSIZEPERITEM__MASK;
 }
 #define A3XX_SP_VS_PVT_MEM_PARAM_REG_HWSTACKOFFSET__MASK	0x00ffff00
 #define A3XX_SP_VS_PVT_MEM_PARAM_REG_HWSTACKOFFSET__SHIFT	8
@@ -2503,7 +2516,8 @@ static inline uint32_t A3XX_SP_VS_PVT_MEM_ADDR_REG_BURSTLEN(uint32_t val)
 #define A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT	5
 static inline uint32_t A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS(uint32_t val)
 {
-	return ((val >> 5) << A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT) & A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT) & A3XX_SP_VS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__MASK;
 }
 
 #define REG_A3XX_SP_VS_PVT_MEM_SIZE_REG				0x000022d8
@@ -2641,7 +2655,8 @@ static inline uint32_t A3XX_SP_FS_PVT_MEM_ADDR_REG_BURSTLEN(uint32_t val)
 #define A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT	5
 static inline uint32_t A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS(uint32_t val)
 {
-	return ((val >> 5) << A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT) & A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__SHIFT) & A3XX_SP_FS_PVT_MEM_ADDR_REG_SHADERSTARTADDRESS__MASK;
 }
 
 #define REG_A3XX_SP_FS_PVT_MEM_SIZE_REG				0x000022e6
@@ -2665,7 +2680,7 @@ static inline uint32_t A3XX_SP_FS_OUTPUT_REG_DEPTH_REGID(uint32_t val)
 	return ((val) << A3XX_SP_FS_OUTPUT_REG_DEPTH_REGID__SHIFT) & A3XX_SP_FS_OUTPUT_REG_DEPTH_REGID__MASK;
 }
 
-static inline uint32_t REG_A3XX_SP_FS_MRT(uint32_t i0) { return 0x000022f0 + 0x1*i0; }
+#define REG_A3XX_SP_FS_MRT(i0) (0x000022f0 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_SP_FS_MRT_REG(uint32_t i0) { return 0x000022f0 + 0x1*i0; }
 #define A3XX_SP_FS_MRT_REG_REGID__MASK				0x000000ff
@@ -2678,7 +2693,7 @@ static inline uint32_t A3XX_SP_FS_MRT_REG_REGID(uint32_t val)
 #define A3XX_SP_FS_MRT_REG_SINT					0x00000400
 #define A3XX_SP_FS_MRT_REG_UINT					0x00000800
 
-static inline uint32_t REG_A3XX_SP_FS_IMAGE_OUTPUT(uint32_t i0) { return 0x000022f4 + 0x1*i0; }
+#define REG_A3XX_SP_FS_IMAGE_OUTPUT(i0) (0x000022f4 + 0x1*(i0))
 
 static inline uint32_t REG_A3XX_SP_FS_IMAGE_OUTPUT_REG(uint32_t i0) { return 0x000022f4 + 0x1*i0; }
 #define A3XX_SP_FS_IMAGE_OUTPUT_REG_MRTFORMAT__MASK		0x0000003f
@@ -2821,18 +2836,20 @@ static inline uint32_t A3XX_TPL1_TP_FS_TEX_OFFSET_BASETABLEPTR(uint32_t val)
 #define A3XX_VSC_BIN_SIZE_WIDTH__SHIFT				0
 static inline uint32_t A3XX_VSC_BIN_SIZE_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A3XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A3XX_VSC_BIN_SIZE_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A3XX_VSC_BIN_SIZE_WIDTH__MASK;
 }
 #define A3XX_VSC_BIN_SIZE_HEIGHT__MASK				0x000003e0
 #define A3XX_VSC_BIN_SIZE_HEIGHT__SHIFT				5
 static inline uint32_t A3XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A3XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A3XX_VSC_BIN_SIZE_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A3XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A3XX_VSC_BIN_SIZE_HEIGHT__MASK;
 }
 
 #define REG_A3XX_VSC_SIZE_ADDRESS				0x00000c02
 
-static inline uint32_t REG_A3XX_VSC_PIPE(uint32_t i0) { return 0x00000c06 + 0x3*i0; }
+#define REG_A3XX_VSC_PIPE(i0) (0x00000c06 + 0x3*(i0))
 
 static inline uint32_t REG_A3XX_VSC_PIPE_CONFIG(uint32_t i0) { return 0x00000c06 + 0x3*i0; }
 #define A3XX_VSC_PIPE_CONFIG_X__MASK				0x000003ff
@@ -2887,7 +2904,7 @@ static inline uint32_t REG_A3XX_VSC_PIPE_DATA_LENGTH(uint32_t i0) { return 0x000
 
 #define REG_A3XX_GRAS_PERFCOUNTER3_SELECT			0x00000c8b
 
-static inline uint32_t REG_A3XX_GRAS_CL_USER_PLANE(uint32_t i0) { return 0x00000ca0 + 0x4*i0; }
+#define REG_A3XX_GRAS_CL_USER_PLANE(i0) (0x00000ca0 + 0x4*(i0))
 
 static inline uint32_t REG_A3XX_GRAS_CL_USER_PLANE_X(uint32_t i0) { return 0x00000ca0 + 0x4*i0; }
 
@@ -3228,7 +3245,8 @@ static inline uint32_t A3XX_TEX_CONST_2_SWAP(enum a3xx_color_swap val)
 #define A3XX_TEX_CONST_3_LAYERSZ1__SHIFT			0
 static inline uint32_t A3XX_TEX_CONST_3_LAYERSZ1(uint32_t val)
 {
-	return ((val >> 12) << A3XX_TEX_CONST_3_LAYERSZ1__SHIFT) & A3XX_TEX_CONST_3_LAYERSZ1__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A3XX_TEX_CONST_3_LAYERSZ1__SHIFT) & A3XX_TEX_CONST_3_LAYERSZ1__MASK;
 }
 #define A3XX_TEX_CONST_3_DEPTH__MASK				0x0ffe0000
 #define A3XX_TEX_CONST_3_DEPTH__SHIFT				17
@@ -3240,8 +3258,11 @@ static inline uint32_t A3XX_TEX_CONST_3_DEPTH(uint32_t val)
 #define A3XX_TEX_CONST_3_LAYERSZ2__SHIFT			28
 static inline uint32_t A3XX_TEX_CONST_3_LAYERSZ2(uint32_t val)
 {
-	return ((val >> 12) << A3XX_TEX_CONST_3_LAYERSZ2__SHIFT) & A3XX_TEX_CONST_3_LAYERSZ2__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A3XX_TEX_CONST_3_LAYERSZ2__SHIFT) & A3XX_TEX_CONST_3_LAYERSZ2__MASK;
 }
 
+#ifdef __cplusplus
+#endif
 
 #endif /* A3XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a4xx.xml.h b/drivers/gpu/drm/msm/adreno/a4xx.xml.h
index ff5f1e98a5fc..47f893dfe474 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a4xx.xml.h
@@ -3,28 +3,20 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml          ( 113474 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,8 +37,21 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum a4xx_color_fmt {
 	RB4_A8_UNORM = 1,
@@ -846,6 +851,7 @@ static inline uint32_t A4XX_CGC_HLSQ_EARLY_CYC(uint32_t val)
 {
 	return ((val) << A4XX_CGC_HLSQ_EARLY_CYC__SHIFT) & A4XX_CGC_HLSQ_EARLY_CYC__MASK;
 }
+
 #define A4XX_INT0_RBBM_GPU_IDLE					0x00000001
 #define A4XX_INT0_RBBM_AHB_ERROR				0x00000002
 #define A4XX_INT0_RBBM_REG_TIMEOUT				0x00000004
@@ -870,6 +876,7 @@ static inline uint32_t A4XX_CGC_HLSQ_EARLY_CYC(uint32_t val)
 #define A4XX_INT0_CP_AHB_ERROR_HALT				0x00200000
 #define A4XX_INT0_MISC_HANG_DETECT				0x01000000
 #define A4XX_INT0_UCHE_OOB_ACCESS				0x02000000
+
 #define REG_A4XX_RB_GMEM_BASE_ADDR				0x00000cc0
 
 #define REG_A4XX_RB_PERFCTR_RB_SEL_0				0x00000cc7
@@ -923,13 +930,15 @@ static inline uint32_t A4XX_RB_FRAME_BUFFER_DIMENSION_HEIGHT(uint32_t val)
 #define A4XX_RB_MODE_CONTROL_WIDTH__SHIFT			0
 static inline uint32_t A4XX_RB_MODE_CONTROL_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_MODE_CONTROL_WIDTH__SHIFT) & A4XX_RB_MODE_CONTROL_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_MODE_CONTROL_WIDTH__SHIFT) & A4XX_RB_MODE_CONTROL_WIDTH__MASK;
 }
 #define A4XX_RB_MODE_CONTROL_HEIGHT__MASK			0x00003f00
 #define A4XX_RB_MODE_CONTROL_HEIGHT__SHIFT			8
 static inline uint32_t A4XX_RB_MODE_CONTROL_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_MODE_CONTROL_HEIGHT__SHIFT) & A4XX_RB_MODE_CONTROL_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_MODE_CONTROL_HEIGHT__SHIFT) & A4XX_RB_MODE_CONTROL_HEIGHT__MASK;
 }
 #define A4XX_RB_MODE_CONTROL_ENABLE_GMEM			0x00010000
 
@@ -968,7 +977,7 @@ static inline uint32_t A4XX_RB_RENDER_CONTROL2_MSAA_SAMPLES(uint32_t val)
 #define A4XX_RB_RENDER_CONTROL2_IJ_PERSP_SAMPLE			0x00004000
 #define A4XX_RB_RENDER_CONTROL2_SIZE				0x00008000
 
-static inline uint32_t REG_A4XX_RB_MRT(uint32_t i0) { return 0x000020a4 + 0x5*i0; }
+#define REG_A4XX_RB_MRT(i0) (0x000020a4 + 0x5*(i0))
 
 static inline uint32_t REG_A4XX_RB_MRT_CONTROL(uint32_t i0) { return 0x000020a4 + 0x5*i0; }
 #define A4XX_RB_MRT_CONTROL_READ_DEST_ENABLE			0x00000008
@@ -1018,7 +1027,8 @@ static inline uint32_t A4XX_RB_MRT_BUF_INFO_COLOR_SWAP(enum a3xx_color_swap val)
 #define A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT		14
 static inline uint32_t A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH(uint32_t val)
 {
-	return ((val >> 4) << A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT) & A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__SHIFT) & A4XX_RB_MRT_BUF_INFO_COLOR_BUF_PITCH__MASK;
 }
 
 static inline uint32_t REG_A4XX_RB_MRT_BASE(uint32_t i0) { return 0x000020a6 + 0x5*i0; }
@@ -1217,7 +1227,8 @@ static inline uint32_t A4XX_RB_FS_OUTPUT_SAMPLE_MASK(uint32_t val)
 #define A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR__SHIFT		2
 static inline uint32_t A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR(uint32_t val)
 {
-	return ((val >> 2) << A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR__SHIFT) & A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR__SHIFT) & A4XX_RB_SAMPLE_COUNT_CONTROL_ADDR__MASK;
 }
 
 #define REG_A4XX_RB_RENDER_COMPONENTS				0x000020fb
@@ -1293,7 +1304,8 @@ static inline uint32_t A4XX_RB_COPY_CONTROL_FASTCLEAR(uint32_t val)
 #define A4XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT			14
 static inline uint32_t A4XX_RB_COPY_CONTROL_GMEM_BASE(uint32_t val)
 {
-	return ((val >> 14) << A4XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT) & A4XX_RB_COPY_CONTROL_GMEM_BASE__MASK;
+	assert(!(val & 0x3fff));
+	return (((val >> 14)) << A4XX_RB_COPY_CONTROL_GMEM_BASE__SHIFT) & A4XX_RB_COPY_CONTROL_GMEM_BASE__MASK;
 }
 
 #define REG_A4XX_RB_COPY_DEST_BASE				0x000020fd
@@ -1301,7 +1313,8 @@ static inline uint32_t A4XX_RB_COPY_CONTROL_GMEM_BASE(uint32_t val)
 #define A4XX_RB_COPY_DEST_BASE_BASE__SHIFT			5
 static inline uint32_t A4XX_RB_COPY_DEST_BASE_BASE(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_COPY_DEST_BASE_BASE__SHIFT) & A4XX_RB_COPY_DEST_BASE_BASE__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_COPY_DEST_BASE_BASE__SHIFT) & A4XX_RB_COPY_DEST_BASE_BASE__MASK;
 }
 
 #define REG_A4XX_RB_COPY_DEST_PITCH				0x000020fe
@@ -1309,7 +1322,8 @@ static inline uint32_t A4XX_RB_COPY_DEST_BASE_BASE(uint32_t val)
 #define A4XX_RB_COPY_DEST_PITCH_PITCH__SHIFT			0
 static inline uint32_t A4XX_RB_COPY_DEST_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_COPY_DEST_PITCH_PITCH__SHIFT) & A4XX_RB_COPY_DEST_PITCH_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_COPY_DEST_PITCH_PITCH__SHIFT) & A4XX_RB_COPY_DEST_PITCH_PITCH__MASK;
 }
 
 #define REG_A4XX_RB_COPY_DEST_INFO				0x000020ff
@@ -1387,7 +1401,8 @@ static inline uint32_t A4XX_RB_DEPTH_INFO_DEPTH_FORMAT(enum a4xx_depth_format va
 #define A4XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT			12
 static inline uint32_t A4XX_RB_DEPTH_INFO_DEPTH_BASE(uint32_t val)
 {
-	return ((val >> 12) << A4XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A4XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A4XX_RB_DEPTH_INFO_DEPTH_BASE__SHIFT) & A4XX_RB_DEPTH_INFO_DEPTH_BASE__MASK;
 }
 
 #define REG_A4XX_RB_DEPTH_PITCH					0x00002104
@@ -1395,7 +1410,8 @@ static inline uint32_t A4XX_RB_DEPTH_INFO_DEPTH_BASE(uint32_t val)
 #define A4XX_RB_DEPTH_PITCH__SHIFT				0
 static inline uint32_t A4XX_RB_DEPTH_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_DEPTH_PITCH__SHIFT) & A4XX_RB_DEPTH_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_DEPTH_PITCH__SHIFT) & A4XX_RB_DEPTH_PITCH__MASK;
 }
 
 #define REG_A4XX_RB_DEPTH_PITCH2				0x00002105
@@ -1403,7 +1419,8 @@ static inline uint32_t A4XX_RB_DEPTH_PITCH(uint32_t val)
 #define A4XX_RB_DEPTH_PITCH2__SHIFT				0
 static inline uint32_t A4XX_RB_DEPTH_PITCH2(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_DEPTH_PITCH2__SHIFT) & A4XX_RB_DEPTH_PITCH2__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_DEPTH_PITCH2__SHIFT) & A4XX_RB_DEPTH_PITCH2__MASK;
 }
 
 #define REG_A4XX_RB_STENCIL_CONTROL				0x00002106
@@ -1468,7 +1485,8 @@ static inline uint32_t A4XX_RB_STENCIL_CONTROL_ZFAIL_BF(enum adreno_stencil_op v
 #define A4XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT		12
 static inline uint32_t A4XX_RB_STENCIL_INFO_STENCIL_BASE(uint32_t val)
 {
-	return ((val >> 12) << A4XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT) & A4XX_RB_STENCIL_INFO_STENCIL_BASE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A4XX_RB_STENCIL_INFO_STENCIL_BASE__SHIFT) & A4XX_RB_STENCIL_INFO_STENCIL_BASE__MASK;
 }
 
 #define REG_A4XX_RB_STENCIL_PITCH				0x00002109
@@ -1476,7 +1494,8 @@ static inline uint32_t A4XX_RB_STENCIL_INFO_STENCIL_BASE(uint32_t val)
 #define A4XX_RB_STENCIL_PITCH__SHIFT				0
 static inline uint32_t A4XX_RB_STENCIL_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A4XX_RB_STENCIL_PITCH__SHIFT) & A4XX_RB_STENCIL_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_RB_STENCIL_PITCH__SHIFT) & A4XX_RB_STENCIL_PITCH__MASK;
 }
 
 #define REG_A4XX_RB_STENCILREFMASK				0x0000210b
@@ -1534,7 +1553,7 @@ static inline uint32_t A4XX_RB_BIN_OFFSET_Y(uint32_t val)
 	return ((val) << A4XX_RB_BIN_OFFSET_Y__SHIFT) & A4XX_RB_BIN_OFFSET_Y__MASK;
 }
 
-static inline uint32_t REG_A4XX_RB_VPORT_Z_CLAMP(uint32_t i0) { return 0x00002120 + 0x2*i0; }
+#define REG_A4XX_RB_VPORT_Z_CLAMP(i0) (0x00002120 + 0x2*(i0))
 
 static inline uint32_t REG_A4XX_RB_VPORT_Z_CLAMP_MIN(uint32_t i0) { return 0x00002120 + 0x2*i0; }
 
@@ -1544,19 +1563,19 @@ static inline uint32_t REG_A4XX_RB_VPORT_Z_CLAMP_MAX(uint32_t i0) { return 0x000
 
 #define REG_A4XX_RBBM_HW_CONFIGURATION				0x00000002
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_TP(uint32_t i0) { return 0x00000004 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL_TP(i0) (0x00000004 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_TP_REG(uint32_t i0) { return 0x00000004 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_TP(uint32_t i0) { return 0x00000008 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL2_TP(i0) (0x00000008 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_TP_REG(uint32_t i0) { return 0x00000008 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_TP(uint32_t i0) { return 0x0000000c + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_HYST_TP(i0) (0x0000000c + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_TP_REG(uint32_t i0) { return 0x0000000c + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_TP(uint32_t i0) { return 0x00000010 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_DELAY_TP(i0) (0x00000010 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_TP_REG(uint32_t i0) { return 0x00000010 + 0x1*i0; }
 
@@ -2008,35 +2027,35 @@ static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_TP_REG(uint32_t i0) { return 0x
 
 #define REG_A4XX_RBBM_ALWAYSON_COUNTER_HI			0x0000016f
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_SP(uint32_t i0) { return 0x00000068 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL_SP(i0) (0x00000068 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_SP_REG(uint32_t i0) { return 0x00000068 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_SP(uint32_t i0) { return 0x0000006c + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL2_SP(i0) (0x0000006c + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_SP_REG(uint32_t i0) { return 0x0000006c + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_SP(uint32_t i0) { return 0x00000070 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_HYST_SP(i0) (0x00000070 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_SP_REG(uint32_t i0) { return 0x00000070 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_SP(uint32_t i0) { return 0x00000074 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_DELAY_SP(i0) (0x00000074 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_SP_REG(uint32_t i0) { return 0x00000074 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_RB(uint32_t i0) { return 0x00000078 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL_RB(i0) (0x00000078 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_RB_REG(uint32_t i0) { return 0x00000078 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_RB(uint32_t i0) { return 0x0000007c + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL2_RB(i0) (0x0000007c + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL2_RB_REG(uint32_t i0) { return 0x0000007c + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(uint32_t i0) { return 0x00000082 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU(i0) (0x00000082 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_CTL_MARB_CCU_REG(uint32_t i0) { return 0x00000082 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(uint32_t i0) { return 0x00000086 + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU(i0) (0x00000086 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU_REG(uint32_t i0) { return 0x00000086 + 0x1*i0; }
 
@@ -2052,7 +2071,7 @@ static inline uint32_t REG_A4XX_RBBM_CLOCK_HYST_RB_MARB_CCU_REG(uint32_t i0) { r
 
 #define REG_A4XX_RBBM_CLOCK_DELAY_COM_DCOM			0x0000008d
 
-static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(uint32_t i0) { return 0x0000008e + 0x1*i0; }
+#define REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1(i0) (0x0000008e + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1_REG(uint32_t i0) { return 0x0000008e + 0x1*i0; }
 
@@ -2192,7 +2211,7 @@ static inline uint32_t REG_A4XX_RBBM_CLOCK_DELAY_RB_MARB_CCU_L1_REG(uint32_t i0)
 
 #define REG_A4XX_CP_DRAW_STATE_ADDR				0x00000232
 
-static inline uint32_t REG_A4XX_CP_PROTECT(uint32_t i0) { return 0x00000240 + 0x1*i0; }
+#define REG_A4XX_CP_PROTECT(i0) (0x00000240 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_CP_PROTECT_REG(uint32_t i0) { return 0x00000240 + 0x1*i0; }
 #define A4XX_CP_PROTECT_REG_BASE_ADDR__MASK			0x0001ffff
@@ -2207,18 +2226,8 @@ static inline uint32_t A4XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 {
 	return ((val) << A4XX_CP_PROTECT_REG_MASK_LEN__SHIFT) & A4XX_CP_PROTECT_REG_MASK_LEN__MASK;
 }
-#define A4XX_CP_PROTECT_REG_TRAP_WRITE__MASK			0x20000000
-#define A4XX_CP_PROTECT_REG_TRAP_WRITE__SHIFT			29
-static inline uint32_t A4XX_CP_PROTECT_REG_TRAP_WRITE(uint32_t val)
-{
-	return ((val) << A4XX_CP_PROTECT_REG_TRAP_WRITE__SHIFT) & A4XX_CP_PROTECT_REG_TRAP_WRITE__MASK;
-}
-#define A4XX_CP_PROTECT_REG_TRAP_READ__MASK			0x40000000
-#define A4XX_CP_PROTECT_REG_TRAP_READ__SHIFT			30
-static inline uint32_t A4XX_CP_PROTECT_REG_TRAP_READ(uint32_t val)
-{
-	return ((val) << A4XX_CP_PROTECT_REG_TRAP_READ__SHIFT) & A4XX_CP_PROTECT_REG_TRAP_READ__MASK;
-}
+#define A4XX_CP_PROTECT_REG_TRAP_WRITE				0x20000000
+#define A4XX_CP_PROTECT_REG_TRAP_READ				0x40000000
 
 #define REG_A4XX_CP_PROTECT_CTRL				0x00000250
 
@@ -2254,7 +2263,7 @@ static inline uint32_t A4XX_CP_PROTECT_REG_TRAP_READ(uint32_t val)
 
 #define REG_A4XX_CP_PERFCOMBINER_SELECT				0x0000050b
 
-static inline uint32_t REG_A4XX_CP_SCRATCH(uint32_t i0) { return 0x00000578 + 0x1*i0; }
+#define REG_A4XX_CP_SCRATCH(i0) (0x00000578 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_CP_SCRATCH_REG(uint32_t i0) { return 0x00000578 + 0x1*i0; }
 
@@ -2364,7 +2373,7 @@ static inline uint32_t A4XX_SP_VS_PARAM_REG_TOTALVSOUTVAR(uint32_t val)
 	return ((val) << A4XX_SP_VS_PARAM_REG_TOTALVSOUTVAR__SHIFT) & A4XX_SP_VS_PARAM_REG_TOTALVSOUTVAR__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_VS_OUT(uint32_t i0) { return 0x000022c7 + 0x1*i0; }
+#define REG_A4XX_SP_VS_OUT(i0) (0x000022c7 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_VS_OUT_REG(uint32_t i0) { return 0x000022c7 + 0x1*i0; }
 #define A4XX_SP_VS_OUT_REG_A_REGID__MASK			0x000001ff
@@ -2392,7 +2401,7 @@ static inline uint32_t A4XX_SP_VS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A4XX_SP_VS_OUT_REG_B_COMPMASK__SHIFT) & A4XX_SP_VS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_VS_VPC_DST(uint32_t i0) { return 0x000022d8 + 0x1*i0; }
+#define REG_A4XX_SP_VS_VPC_DST(i0) (0x000022d8 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_VS_VPC_DST_REG(uint32_t i0) { return 0x000022d8 + 0x1*i0; }
 #define A4XX_SP_VS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -2532,7 +2541,7 @@ static inline uint32_t A4XX_SP_FS_OUTPUT_REG_SAMPLEMASK_REGID(uint32_t val)
 	return ((val) << A4XX_SP_FS_OUTPUT_REG_SAMPLEMASK_REGID__SHIFT) & A4XX_SP_FS_OUTPUT_REG_SAMPLEMASK_REGID__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_FS_MRT(uint32_t i0) { return 0x000022f1 + 0x1*i0; }
+#define REG_A4XX_SP_FS_MRT(i0) (0x000022f1 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_FS_MRT_REG(uint32_t i0) { return 0x000022f1 + 0x1*i0; }
 #define A4XX_SP_FS_MRT_REG_REGID__MASK				0x000000ff
@@ -2636,7 +2645,7 @@ static inline uint32_t A4XX_SP_DS_PARAM_REG_TOTALGSOUTVAR(uint32_t val)
 	return ((val) << A4XX_SP_DS_PARAM_REG_TOTALGSOUTVAR__SHIFT) & A4XX_SP_DS_PARAM_REG_TOTALGSOUTVAR__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_DS_OUT(uint32_t i0) { return 0x0000231b + 0x1*i0; }
+#define REG_A4XX_SP_DS_OUT(i0) (0x0000231b + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_DS_OUT_REG(uint32_t i0) { return 0x0000231b + 0x1*i0; }
 #define A4XX_SP_DS_OUT_REG_A_REGID__MASK			0x000001ff
@@ -2664,7 +2673,7 @@ static inline uint32_t A4XX_SP_DS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A4XX_SP_DS_OUT_REG_B_COMPMASK__SHIFT) & A4XX_SP_DS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_DS_VPC_DST(uint32_t i0) { return 0x0000232c + 0x1*i0; }
+#define REG_A4XX_SP_DS_VPC_DST(i0) (0x0000232c + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_DS_VPC_DST_REG(uint32_t i0) { return 0x0000232c + 0x1*i0; }
 #define A4XX_SP_DS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -2734,7 +2743,7 @@ static inline uint32_t A4XX_SP_GS_PARAM_REG_TOTALGSOUTVAR(uint32_t val)
 	return ((val) << A4XX_SP_GS_PARAM_REG_TOTALGSOUTVAR__SHIFT) & A4XX_SP_GS_PARAM_REG_TOTALGSOUTVAR__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_GS_OUT(uint32_t i0) { return 0x00002342 + 0x1*i0; }
+#define REG_A4XX_SP_GS_OUT(i0) (0x00002342 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_GS_OUT_REG(uint32_t i0) { return 0x00002342 + 0x1*i0; }
 #define A4XX_SP_GS_OUT_REG_A_REGID__MASK			0x000001ff
@@ -2762,7 +2771,7 @@ static inline uint32_t A4XX_SP_GS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A4XX_SP_GS_OUT_REG_B_COMPMASK__SHIFT) & A4XX_SP_GS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A4XX_SP_GS_VPC_DST(uint32_t i0) { return 0x00002353 + 0x1*i0; }
+#define REG_A4XX_SP_GS_VPC_DST(i0) (0x00002353 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_SP_GS_VPC_DST_REG(uint32_t i0) { return 0x00002353 + 0x1*i0; }
 #define A4XX_SP_GS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -2862,11 +2871,11 @@ static inline uint32_t A4XX_VPC_PACK_NUMNONPOSVSVAR(uint32_t val)
 	return ((val) << A4XX_VPC_PACK_NUMNONPOSVSVAR__SHIFT) & A4XX_VPC_PACK_NUMNONPOSVSVAR__MASK;
 }
 
-static inline uint32_t REG_A4XX_VPC_VARYING_INTERP(uint32_t i0) { return 0x00002142 + 0x1*i0; }
+#define REG_A4XX_VPC_VARYING_INTERP(i0) (0x00002142 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VPC_VARYING_INTERP_MODE(uint32_t i0) { return 0x00002142 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_VPC_VARYING_PS_REPL(uint32_t i0) { return 0x0000214a + 0x1*i0; }
+#define REG_A4XX_VPC_VARYING_PS_REPL(i0) (0x0000214a + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0x0000214a + 0x1*i0; }
 
@@ -2877,13 +2886,15 @@ static inline uint32_t REG_A4XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0
 #define A4XX_VSC_BIN_SIZE_WIDTH__SHIFT				0
 static inline uint32_t A4XX_VSC_BIN_SIZE_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A4XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A4XX_VSC_BIN_SIZE_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A4XX_VSC_BIN_SIZE_WIDTH__MASK;
 }
 #define A4XX_VSC_BIN_SIZE_HEIGHT__MASK				0x000003e0
 #define A4XX_VSC_BIN_SIZE_HEIGHT__SHIFT				5
 static inline uint32_t A4XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A4XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A4XX_VSC_BIN_SIZE_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A4XX_VSC_BIN_SIZE_HEIGHT__MASK;
 }
 
 #define REG_A4XX_VSC_SIZE_ADDRESS				0x00000c01
@@ -2892,7 +2903,7 @@ static inline uint32_t A4XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 
 #define REG_A4XX_VSC_DEBUG_ECO_CONTROL				0x00000c03
 
-static inline uint32_t REG_A4XX_VSC_PIPE_CONFIG(uint32_t i0) { return 0x00000c08 + 0x1*i0; }
+#define REG_A4XX_VSC_PIPE_CONFIG(i0) (0x00000c08 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VSC_PIPE_CONFIG_REG(uint32_t i0) { return 0x00000c08 + 0x1*i0; }
 #define A4XX_VSC_PIPE_CONFIG_REG_X__MASK			0x000003ff
@@ -2920,11 +2931,11 @@ static inline uint32_t A4XX_VSC_PIPE_CONFIG_REG_H(uint32_t val)
 	return ((val) << A4XX_VSC_PIPE_CONFIG_REG_H__SHIFT) & A4XX_VSC_PIPE_CONFIG_REG_H__MASK;
 }
 
-static inline uint32_t REG_A4XX_VSC_PIPE_DATA_ADDRESS(uint32_t i0) { return 0x00000c10 + 0x1*i0; }
+#define REG_A4XX_VSC_PIPE_DATA_ADDRESS(i0) (0x00000c10 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VSC_PIPE_DATA_ADDRESS_REG(uint32_t i0) { return 0x00000c10 + 0x1*i0; }
 
-static inline uint32_t REG_A4XX_VSC_PIPE_DATA_LENGTH(uint32_t i0) { return 0x00000c18 + 0x1*i0; }
+#define REG_A4XX_VSC_PIPE_DATA_LENGTH(i0) (0x00000c18 + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VSC_PIPE_DATA_LENGTH_REG(uint32_t i0) { return 0x00000c18 + 0x1*i0; }
 
@@ -3028,7 +3039,7 @@ static inline uint32_t A4XX_VFD_CONTROL_3_REGID_TESSY(uint32_t val)
 
 #define REG_A4XX_VFD_INDEX_OFFSET				0x00002208
 
-static inline uint32_t REG_A4XX_VFD_FETCH(uint32_t i0) { return 0x0000220a + 0x4*i0; }
+#define REG_A4XX_VFD_FETCH(i0) (0x0000220a + 0x4*(i0))
 
 static inline uint32_t REG_A4XX_VFD_FETCH_INSTR_0(uint32_t i0) { return 0x0000220a + 0x4*i0; }
 #define A4XX_VFD_FETCH_INSTR_0_FETCHSIZE__MASK			0x0000007f
@@ -3064,7 +3075,7 @@ static inline uint32_t A4XX_VFD_FETCH_INSTR_3_STEPRATE(uint32_t val)
 	return ((val) << A4XX_VFD_FETCH_INSTR_3_STEPRATE__SHIFT) & A4XX_VFD_FETCH_INSTR_3_STEPRATE__MASK;
 }
 
-static inline uint32_t REG_A4XX_VFD_DECODE(uint32_t i0) { return 0x0000228a + 0x1*i0; }
+#define REG_A4XX_VFD_DECODE(i0) (0x0000228a + 0x1*(i0))
 
 static inline uint32_t REG_A4XX_VFD_DECODE_INSTR(uint32_t i0) { return 0x0000228a + 0x1*i0; }
 #define A4XX_VFD_DECODE_INSTR_WRITEMASK__MASK			0x0000000f
@@ -4262,7 +4273,8 @@ static inline uint32_t A4XX_TEX_CONST_2_SWAP(enum a3xx_color_swap val)
 #define A4XX_TEX_CONST_3_LAYERSZ__SHIFT				0
 static inline uint32_t A4XX_TEX_CONST_3_LAYERSZ(uint32_t val)
 {
-	return ((val >> 12) << A4XX_TEX_CONST_3_LAYERSZ__SHIFT) & A4XX_TEX_CONST_3_LAYERSZ__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A4XX_TEX_CONST_3_LAYERSZ__SHIFT) & A4XX_TEX_CONST_3_LAYERSZ__MASK;
 }
 #define A4XX_TEX_CONST_3_DEPTH__MASK				0x7ffc0000
 #define A4XX_TEX_CONST_3_DEPTH__SHIFT				18
@@ -4276,13 +4288,15 @@ static inline uint32_t A4XX_TEX_CONST_3_DEPTH(uint32_t val)
 #define A4XX_TEX_CONST_4_LAYERSZ__SHIFT				0
 static inline uint32_t A4XX_TEX_CONST_4_LAYERSZ(uint32_t val)
 {
-	return ((val >> 12) << A4XX_TEX_CONST_4_LAYERSZ__SHIFT) & A4XX_TEX_CONST_4_LAYERSZ__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A4XX_TEX_CONST_4_LAYERSZ__SHIFT) & A4XX_TEX_CONST_4_LAYERSZ__MASK;
 }
 #define A4XX_TEX_CONST_4_BASE__MASK				0xffffffe0
 #define A4XX_TEX_CONST_4_BASE__SHIFT				5
 static inline uint32_t A4XX_TEX_CONST_4_BASE(uint32_t val)
 {
-	return ((val >> 5) << A4XX_TEX_CONST_4_BASE__SHIFT) & A4XX_TEX_CONST_4_BASE__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_TEX_CONST_4_BASE__SHIFT) & A4XX_TEX_CONST_4_BASE__MASK;
 }
 
 #define REG_A4XX_TEX_CONST_5					0x00000005
@@ -4296,7 +4310,8 @@ static inline uint32_t A4XX_TEX_CONST_4_BASE(uint32_t val)
 #define A4XX_SSBO_0_0_BASE__SHIFT				5
 static inline uint32_t A4XX_SSBO_0_0_BASE(uint32_t val)
 {
-	return ((val >> 5) << A4XX_SSBO_0_0_BASE__SHIFT) & A4XX_SSBO_0_0_BASE__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A4XX_SSBO_0_0_BASE__SHIFT) & A4XX_SSBO_0_0_BASE__MASK;
 }
 
 #define REG_A4XX_SSBO_0_1					0x00000001
@@ -4312,7 +4327,8 @@ static inline uint32_t A4XX_SSBO_0_1_PITCH(uint32_t val)
 #define A4XX_SSBO_0_2_ARRAY_PITCH__SHIFT			12
 static inline uint32_t A4XX_SSBO_0_2_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 12) << A4XX_SSBO_0_2_ARRAY_PITCH__SHIFT) & A4XX_SSBO_0_2_ARRAY_PITCH__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A4XX_SSBO_0_2_ARRAY_PITCH__SHIFT) & A4XX_SSBO_0_2_ARRAY_PITCH__MASK;
 }
 
 #define REG_A4XX_SSBO_0_3					0x00000003
@@ -4357,5 +4373,7 @@ static inline uint32_t A4XX_SSBO_1_1_DEPTH(uint32_t val)
 	return ((val) << A4XX_SSBO_1_1_DEPTH__SHIFT) & A4XX_SSBO_1_1_DEPTH__MASK;
 }
 
+#ifdef __cplusplus
+#endif
 
 #endif /* A4XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
index 03b7ee592b11..5633351af0e0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
@@ -3,28 +3,20 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml          ( 151693 bytes, from Wed Aug 23 10:39:39 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,8 +37,21 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum a5xx_color_fmt {
 	RB5_A8_UNORM = 2,
@@ -907,12 +912,14 @@ enum a5xx_tex_type {
 #define A5XX_INT0_GPMU_FIRMWARE					0x20000000
 #define A5XX_INT0_ISDB_CPU_IRQ					0x40000000
 #define A5XX_INT0_ISDB_UNDER_DEBUG				0x80000000
+
 #define A5XX_CP_INT_CP_OPCODE_ERROR				0x00000001
 #define A5XX_CP_INT_CP_RESERVED_BIT_ERROR			0x00000002
 #define A5XX_CP_INT_CP_HW_FAULT_ERROR				0x00000004
 #define A5XX_CP_INT_CP_DMA_ERROR				0x00000008
 #define A5XX_CP_INT_CP_REGISTER_PROTECTION_ERROR		0x00000010
 #define A5XX_CP_INT_CP_AHB_ERROR				0x00000020
+
 #define REG_A5XX_CP_RB_BASE					0x00000800
 
 #define REG_A5XX_CP_RB_BASE_HI					0x00000801
@@ -1031,11 +1038,11 @@ enum a5xx_tex_type {
 
 #define REG_A5XX_CP_IB2_BUFSZ					0x00000b24
 
-static inline uint32_t REG_A5XX_CP_SCRATCH(uint32_t i0) { return 0x00000b78 + 0x1*i0; }
+#define REG_A5XX_CP_SCRATCH(i0) (0x00000b78 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_CP_SCRATCH_REG(uint32_t i0) { return 0x00000b78 + 0x1*i0; }
 
-static inline uint32_t REG_A5XX_CP_PROTECT(uint32_t i0) { return 0x00000880 + 0x1*i0; }
+#define REG_A5XX_CP_PROTECT(i0) (0x00000880 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_CP_PROTECT_REG(uint32_t i0) { return 0x00000880 + 0x1*i0; }
 #define A5XX_CP_PROTECT_REG_BASE_ADDR__MASK			0x0001ffff
@@ -1050,18 +1057,8 @@ static inline uint32_t A5XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 {
 	return ((val) << A5XX_CP_PROTECT_REG_MASK_LEN__SHIFT) & A5XX_CP_PROTECT_REG_MASK_LEN__MASK;
 }
-#define A5XX_CP_PROTECT_REG_TRAP_WRITE__MASK			0x20000000
-#define A5XX_CP_PROTECT_REG_TRAP_WRITE__SHIFT			29
-static inline uint32_t A5XX_CP_PROTECT_REG_TRAP_WRITE(uint32_t val)
-{
-	return ((val) << A5XX_CP_PROTECT_REG_TRAP_WRITE__SHIFT) & A5XX_CP_PROTECT_REG_TRAP_WRITE__MASK;
-}
-#define A5XX_CP_PROTECT_REG_TRAP_READ__MASK			0x40000000
-#define A5XX_CP_PROTECT_REG_TRAP_READ__SHIFT			30
-static inline uint32_t A5XX_CP_PROTECT_REG_TRAP_READ(uint32_t val)
-{
-	return ((val) << A5XX_CP_PROTECT_REG_TRAP_READ__SHIFT) & A5XX_CP_PROTECT_REG_TRAP_READ__MASK;
-}
+#define A5XX_CP_PROTECT_REG_TRAP_WRITE				0x20000000
+#define A5XX_CP_PROTECT_REG_TRAP_READ				0x40000000
 
 #define REG_A5XX_CP_PROTECT_CNTL				0x000008a0
 
@@ -1833,192 +1830,37 @@ static inline uint32_t A5XX_CP_PROTECT_REG_TRAP_READ(uint32_t val)
 #define REG_A5XX_RBBM_ALWAYSON_COUNTER_HI			0x000004d3
 
 #define REG_A5XX_RBBM_STATUS					0x000004f5
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB__MASK			0x80000000
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB__SHIFT		31
-static inline uint32_t A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB__SHIFT) & A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB__MASK;
-}
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP__MASK		0x40000000
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP__SHIFT		30
-static inline uint32_t A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP__SHIFT) & A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP__MASK;
-}
-#define A5XX_RBBM_STATUS_HLSQ_BUSY__MASK			0x20000000
-#define A5XX_RBBM_STATUS_HLSQ_BUSY__SHIFT			29
-static inline uint32_t A5XX_RBBM_STATUS_HLSQ_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_HLSQ_BUSY__SHIFT) & A5XX_RBBM_STATUS_HLSQ_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_VSC_BUSY__MASK				0x10000000
-#define A5XX_RBBM_STATUS_VSC_BUSY__SHIFT			28
-static inline uint32_t A5XX_RBBM_STATUS_VSC_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_VSC_BUSY__SHIFT) & A5XX_RBBM_STATUS_VSC_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_TPL1_BUSY__MASK			0x08000000
-#define A5XX_RBBM_STATUS_TPL1_BUSY__SHIFT			27
-static inline uint32_t A5XX_RBBM_STATUS_TPL1_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_TPL1_BUSY__SHIFT) & A5XX_RBBM_STATUS_TPL1_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_SP_BUSY__MASK				0x04000000
-#define A5XX_RBBM_STATUS_SP_BUSY__SHIFT				26
-static inline uint32_t A5XX_RBBM_STATUS_SP_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_SP_BUSY__SHIFT) & A5XX_RBBM_STATUS_SP_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_UCHE_BUSY__MASK			0x02000000
-#define A5XX_RBBM_STATUS_UCHE_BUSY__SHIFT			25
-static inline uint32_t A5XX_RBBM_STATUS_UCHE_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_UCHE_BUSY__SHIFT) & A5XX_RBBM_STATUS_UCHE_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_VPC_BUSY__MASK				0x01000000
-#define A5XX_RBBM_STATUS_VPC_BUSY__SHIFT			24
-static inline uint32_t A5XX_RBBM_STATUS_VPC_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_VPC_BUSY__SHIFT) & A5XX_RBBM_STATUS_VPC_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_VFDP_BUSY__MASK			0x00800000
-#define A5XX_RBBM_STATUS_VFDP_BUSY__SHIFT			23
-static inline uint32_t A5XX_RBBM_STATUS_VFDP_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_VFDP_BUSY__SHIFT) & A5XX_RBBM_STATUS_VFDP_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_VFD_BUSY__MASK				0x00400000
-#define A5XX_RBBM_STATUS_VFD_BUSY__SHIFT			22
-static inline uint32_t A5XX_RBBM_STATUS_VFD_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_VFD_BUSY__SHIFT) & A5XX_RBBM_STATUS_VFD_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_TESS_BUSY__MASK			0x00200000
-#define A5XX_RBBM_STATUS_TESS_BUSY__SHIFT			21
-static inline uint32_t A5XX_RBBM_STATUS_TESS_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_TESS_BUSY__SHIFT) & A5XX_RBBM_STATUS_TESS_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_PC_VSD_BUSY__MASK			0x00100000
-#define A5XX_RBBM_STATUS_PC_VSD_BUSY__SHIFT			20
-static inline uint32_t A5XX_RBBM_STATUS_PC_VSD_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_PC_VSD_BUSY__SHIFT) & A5XX_RBBM_STATUS_PC_VSD_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_PC_DCALL_BUSY__MASK			0x00080000
-#define A5XX_RBBM_STATUS_PC_DCALL_BUSY__SHIFT			19
-static inline uint32_t A5XX_RBBM_STATUS_PC_DCALL_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_PC_DCALL_BUSY__SHIFT) & A5XX_RBBM_STATUS_PC_DCALL_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY__MASK			0x00040000
-#define A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY__SHIFT			18
-static inline uint32_t A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY__SHIFT) & A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_DCOM_BUSY__MASK			0x00020000
-#define A5XX_RBBM_STATUS_DCOM_BUSY__SHIFT			17
-static inline uint32_t A5XX_RBBM_STATUS_DCOM_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_DCOM_BUSY__SHIFT) & A5XX_RBBM_STATUS_DCOM_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_COM_BUSY__MASK				0x00010000
-#define A5XX_RBBM_STATUS_COM_BUSY__SHIFT			16
-static inline uint32_t A5XX_RBBM_STATUS_COM_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_COM_BUSY__SHIFT) & A5XX_RBBM_STATUS_COM_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_LRZ_BUZY__MASK				0x00008000
-#define A5XX_RBBM_STATUS_LRZ_BUZY__SHIFT			15
-static inline uint32_t A5XX_RBBM_STATUS_LRZ_BUZY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_LRZ_BUZY__SHIFT) & A5XX_RBBM_STATUS_LRZ_BUZY__MASK;
-}
-#define A5XX_RBBM_STATUS_A2D_DSP_BUSY__MASK			0x00004000
-#define A5XX_RBBM_STATUS_A2D_DSP_BUSY__SHIFT			14
-static inline uint32_t A5XX_RBBM_STATUS_A2D_DSP_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_A2D_DSP_BUSY__SHIFT) & A5XX_RBBM_STATUS_A2D_DSP_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_CCUFCHE_BUSY__MASK			0x00002000
-#define A5XX_RBBM_STATUS_CCUFCHE_BUSY__SHIFT			13
-static inline uint32_t A5XX_RBBM_STATUS_CCUFCHE_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CCUFCHE_BUSY__SHIFT) & A5XX_RBBM_STATUS_CCUFCHE_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_RB_BUSY__MASK				0x00001000
-#define A5XX_RBBM_STATUS_RB_BUSY__SHIFT				12
-static inline uint32_t A5XX_RBBM_STATUS_RB_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_RB_BUSY__SHIFT) & A5XX_RBBM_STATUS_RB_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_RAS_BUSY__MASK				0x00000800
-#define A5XX_RBBM_STATUS_RAS_BUSY__SHIFT			11
-static inline uint32_t A5XX_RBBM_STATUS_RAS_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_RAS_BUSY__SHIFT) & A5XX_RBBM_STATUS_RAS_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_TSE_BUSY__MASK				0x00000400
-#define A5XX_RBBM_STATUS_TSE_BUSY__SHIFT			10
-static inline uint32_t A5XX_RBBM_STATUS_TSE_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_TSE_BUSY__SHIFT) & A5XX_RBBM_STATUS_TSE_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_VBIF_BUSY__MASK			0x00000200
-#define A5XX_RBBM_STATUS_VBIF_BUSY__SHIFT			9
-static inline uint32_t A5XX_RBBM_STATUS_VBIF_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_VBIF_BUSY__SHIFT) & A5XX_RBBM_STATUS_VBIF_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST__MASK		0x00000100
-#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST__SHIFT		8
-static inline uint32_t A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST__SHIFT) & A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST__MASK			0x00000080
-#define A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST__SHIFT		7
-static inline uint32_t A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST__SHIFT) & A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_BUSY__MASK				0x00000040
-#define A5XX_RBBM_STATUS_CP_BUSY__SHIFT				6
-static inline uint32_t A5XX_RBBM_STATUS_CP_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_BUSY__SHIFT) & A5XX_RBBM_STATUS_CP_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_GPMU_MASTER_BUSY__MASK			0x00000020
-#define A5XX_RBBM_STATUS_GPMU_MASTER_BUSY__SHIFT		5
-static inline uint32_t A5XX_RBBM_STATUS_GPMU_MASTER_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_GPMU_MASTER_BUSY__SHIFT) & A5XX_RBBM_STATUS_GPMU_MASTER_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_CRASH_BUSY__MASK			0x00000010
-#define A5XX_RBBM_STATUS_CP_CRASH_BUSY__SHIFT			4
-static inline uint32_t A5XX_RBBM_STATUS_CP_CRASH_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_CRASH_BUSY__SHIFT) & A5XX_RBBM_STATUS_CP_CRASH_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_ETS_BUSY__MASK			0x00000008
-#define A5XX_RBBM_STATUS_CP_ETS_BUSY__SHIFT			3
-static inline uint32_t A5XX_RBBM_STATUS_CP_ETS_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_ETS_BUSY__SHIFT) & A5XX_RBBM_STATUS_CP_ETS_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_PFP_BUSY__MASK			0x00000004
-#define A5XX_RBBM_STATUS_CP_PFP_BUSY__SHIFT			2
-static inline uint32_t A5XX_RBBM_STATUS_CP_PFP_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_PFP_BUSY__SHIFT) & A5XX_RBBM_STATUS_CP_PFP_BUSY__MASK;
-}
-#define A5XX_RBBM_STATUS_CP_ME_BUSY__MASK			0x00000002
-#define A5XX_RBBM_STATUS_CP_ME_BUSY__SHIFT			1
-static inline uint32_t A5XX_RBBM_STATUS_CP_ME_BUSY(uint32_t val)
-{
-	return ((val) << A5XX_RBBM_STATUS_CP_ME_BUSY__SHIFT) & A5XX_RBBM_STATUS_CP_ME_BUSY__MASK;
-}
+#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB			0x80000000
+#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP			0x40000000
+#define A5XX_RBBM_STATUS_HLSQ_BUSY				0x20000000
+#define A5XX_RBBM_STATUS_VSC_BUSY				0x10000000
+#define A5XX_RBBM_STATUS_TPL1_BUSY				0x08000000
+#define A5XX_RBBM_STATUS_SP_BUSY				0x04000000
+#define A5XX_RBBM_STATUS_UCHE_BUSY				0x02000000
+#define A5XX_RBBM_STATUS_VPC_BUSY				0x01000000
+#define A5XX_RBBM_STATUS_VFDP_BUSY				0x00800000
+#define A5XX_RBBM_STATUS_VFD_BUSY				0x00400000
+#define A5XX_RBBM_STATUS_TESS_BUSY				0x00200000
+#define A5XX_RBBM_STATUS_PC_VSD_BUSY				0x00100000
+#define A5XX_RBBM_STATUS_PC_DCALL_BUSY				0x00080000
+#define A5XX_RBBM_STATUS_GPMU_SLAVE_BUSY			0x00040000
+#define A5XX_RBBM_STATUS_DCOM_BUSY				0x00020000
+#define A5XX_RBBM_STATUS_COM_BUSY				0x00010000
+#define A5XX_RBBM_STATUS_LRZ_BUZY				0x00008000
+#define A5XX_RBBM_STATUS_A2D_DSP_BUSY				0x00004000
+#define A5XX_RBBM_STATUS_CCUFCHE_BUSY				0x00002000
+#define A5XX_RBBM_STATUS_RB_BUSY				0x00001000
+#define A5XX_RBBM_STATUS_RAS_BUSY				0x00000800
+#define A5XX_RBBM_STATUS_TSE_BUSY				0x00000400
+#define A5XX_RBBM_STATUS_VBIF_BUSY				0x00000200
+#define A5XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_HYST			0x00000100
+#define A5XX_RBBM_STATUS_CP_BUSY_IGN_HYST			0x00000080
+#define A5XX_RBBM_STATUS_CP_BUSY				0x00000040
+#define A5XX_RBBM_STATUS_GPMU_MASTER_BUSY			0x00000020
+#define A5XX_RBBM_STATUS_CP_CRASH_BUSY				0x00000010
+#define A5XX_RBBM_STATUS_CP_ETS_BUSY				0x00000008
+#define A5XX_RBBM_STATUS_CP_PFP_BUSY				0x00000004
+#define A5XX_RBBM_STATUS_CP_ME_BUSY				0x00000002
 #define A5XX_RBBM_STATUS_HI_BUSY				0x00000001
 
 #define REG_A5XX_RBBM_STATUS3					0x00000530
@@ -2113,13 +1955,15 @@ static inline uint32_t A5XX_RBBM_STATUS_CP_ME_BUSY(uint32_t val)
 #define A5XX_VSC_BIN_SIZE_WIDTH__SHIFT				0
 static inline uint32_t A5XX_VSC_BIN_SIZE_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A5XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A5XX_VSC_BIN_SIZE_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A5XX_VSC_BIN_SIZE_WIDTH__MASK;
 }
 #define A5XX_VSC_BIN_SIZE_HEIGHT__MASK				0x0001fe00
 #define A5XX_VSC_BIN_SIZE_HEIGHT__SHIFT				9
 static inline uint32_t A5XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A5XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A5XX_VSC_BIN_SIZE_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A5XX_VSC_BIN_SIZE_HEIGHT__MASK;
 }
 
 #define REG_A5XX_VSC_SIZE_ADDRESS_LO				0x00000bc3
@@ -2130,7 +1974,7 @@ static inline uint32_t A5XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 
 #define REG_A5XX_UNKNOWN_0BC6					0x00000bc6
 
-static inline uint32_t REG_A5XX_VSC_PIPE_CONFIG(uint32_t i0) { return 0x00000bd0 + 0x1*i0; }
+#define REG_A5XX_VSC_PIPE_CONFIG(i0) (0x00000bd0 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VSC_PIPE_CONFIG_REG(uint32_t i0) { return 0x00000bd0 + 0x1*i0; }
 #define A5XX_VSC_PIPE_CONFIG_REG_X__MASK			0x000003ff
@@ -2158,13 +2002,13 @@ static inline uint32_t A5XX_VSC_PIPE_CONFIG_REG_H(uint32_t val)
 	return ((val) << A5XX_VSC_PIPE_CONFIG_REG_H__SHIFT) & A5XX_VSC_PIPE_CONFIG_REG_H__MASK;
 }
 
-static inline uint32_t REG_A5XX_VSC_PIPE_DATA_ADDRESS(uint32_t i0) { return 0x00000be0 + 0x2*i0; }
+#define REG_A5XX_VSC_PIPE_DATA_ADDRESS(i0) (0x00000be0 + 0x2*(i0))
 
 static inline uint32_t REG_A5XX_VSC_PIPE_DATA_ADDRESS_LO(uint32_t i0) { return 0x00000be0 + 0x2*i0; }
 
 static inline uint32_t REG_A5XX_VSC_PIPE_DATA_ADDRESS_HI(uint32_t i0) { return 0x00000be1 + 0x2*i0; }
 
-static inline uint32_t REG_A5XX_VSC_PIPE_DATA_LENGTH(uint32_t i0) { return 0x00000c00 + 0x1*i0; }
+#define REG_A5XX_VSC_PIPE_DATA_LENGTH(i0) (0x00000c00 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VSC_PIPE_DATA_LENGTH_REG(uint32_t i0) { return 0x00000c00 + 0x1*i0; }
 
@@ -2594,36 +2438,6 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
 
 #define REG_A5XX_GPMU_DATA_RAM_BASE				0x00009800
 
-#define REG_A5XX_GPMU_SP_POWER_CNTL				0x0000a881
-
-#define REG_A5XX_GPMU_RBCCU_CLOCK_CNTL				0x0000a886
-
-#define REG_A5XX_GPMU_RBCCU_POWER_CNTL				0x0000a887
-
-#define REG_A5XX_GPMU_SP_PWR_CLK_STATUS				0x0000a88b
-#define A5XX_GPMU_SP_PWR_CLK_STATUS_PWR_ON			0x00100000
-
-#define REG_A5XX_GPMU_RBCCU_PWR_CLK_STATUS			0x0000a88d
-#define A5XX_GPMU_RBCCU_PWR_CLK_STATUS_PWR_ON			0x00100000
-
-#define REG_A5XX_GPMU_PWR_COL_STAGGER_DELAY			0x0000a891
-
-#define REG_A5XX_GPMU_PWR_COL_INTER_FRAME_CTRL			0x0000a892
-
-#define REG_A5XX_GPMU_PWR_COL_INTER_FRAME_HYST			0x0000a893
-
-#define REG_A5XX_GPMU_PWR_COL_BINNING_CTRL			0x0000a894
-
-#define REG_A5XX_GPMU_WFI_CONFIG				0x0000a8c1
-
-#define REG_A5XX_GPMU_RBBM_INTR_INFO				0x0000a8d6
-
-#define REG_A5XX_GPMU_CM3_SYSRESET				0x0000a8d8
-
-#define REG_A5XX_GPMU_GENERAL_0					0x0000a8e0
-
-#define REG_A5XX_GPMU_GENERAL_1					0x0000a8e1
-
 #define REG_A5XX_SP_POWER_COUNTER_0_LO				0x0000a840
 
 #define REG_A5XX_SP_POWER_COUNTER_0_HI				0x0000a841
@@ -2748,10 +2562,42 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
 
 #define REG_A5XX_GPMU_POWER_COUNTER_SELECT_1			0x0000a87d
 
+#define REG_A5XX_GPMU_GPMU_SP_CLOCK_CONTROL			0x0000a880
+
+#define REG_A5XX_GPMU_SP_POWER_CNTL				0x0000a881
+
+#define REG_A5XX_GPMU_RBCCU_CLOCK_CNTL				0x0000a886
+
+#define REG_A5XX_GPMU_RBCCU_POWER_CNTL				0x0000a887
+
+#define REG_A5XX_GPMU_SP_PWR_CLK_STATUS				0x0000a88b
+#define A5XX_GPMU_SP_PWR_CLK_STATUS_PWR_ON			0x00100000
+
+#define REG_A5XX_GPMU_RBCCU_PWR_CLK_STATUS			0x0000a88d
+#define A5XX_GPMU_RBCCU_PWR_CLK_STATUS_PWR_ON			0x00100000
+
+#define REG_A5XX_GPMU_PWR_COL_STAGGER_DELAY			0x0000a891
+
+#define REG_A5XX_GPMU_PWR_COL_INTER_FRAME_CTRL			0x0000a892
+
+#define REG_A5XX_GPMU_PWR_COL_INTER_FRAME_HYST			0x0000a893
+
+#define REG_A5XX_GPMU_PWR_COL_BINNING_CTRL			0x0000a894
+
 #define REG_A5XX_GPMU_CLOCK_THROTTLE_CTRL			0x0000a8a3
 
 #define REG_A5XX_GPMU_THROTTLE_UNMASK_FORCE_CTRL		0x0000a8a8
 
+#define REG_A5XX_GPMU_WFI_CONFIG				0x0000a8c1
+
+#define REG_A5XX_GPMU_RBBM_INTR_INFO				0x0000a8d6
+
+#define REG_A5XX_GPMU_CM3_SYSRESET				0x0000a8d8
+
+#define REG_A5XX_GPMU_GENERAL_0					0x0000a8e0
+
+#define REG_A5XX_GPMU_GENERAL_1					0x0000a8e1
+
 #define REG_A5XX_GPMU_TEMP_SENSOR_ID				0x0000ac00
 
 #define REG_A5XX_GPMU_TEMP_SENSOR_CONFIG			0x0000ac01
@@ -3112,7 +2958,8 @@ static inline uint32_t A5XX_GRAS_SC_WINDOW_SCISSOR_BR_Y(uint32_t val)
 #define A5XX_GRAS_LRZ_BUFFER_PITCH__SHIFT			0
 static inline uint32_t A5XX_GRAS_LRZ_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A5XX_GRAS_LRZ_BUFFER_PITCH__SHIFT) & A5XX_GRAS_LRZ_BUFFER_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_GRAS_LRZ_BUFFER_PITCH__SHIFT) & A5XX_GRAS_LRZ_BUFFER_PITCH__MASK;
 }
 
 #define REG_A5XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE_LO		0x0000e104
@@ -3124,13 +2971,15 @@ static inline uint32_t A5XX_GRAS_LRZ_BUFFER_PITCH(uint32_t val)
 #define A5XX_RB_CNTL_WIDTH__SHIFT				0
 static inline uint32_t A5XX_RB_CNTL_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A5XX_RB_CNTL_WIDTH__SHIFT) & A5XX_RB_CNTL_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_RB_CNTL_WIDTH__SHIFT) & A5XX_RB_CNTL_WIDTH__MASK;
 }
 #define A5XX_RB_CNTL_HEIGHT__MASK				0x0001fe00
 #define A5XX_RB_CNTL_HEIGHT__SHIFT				9
 static inline uint32_t A5XX_RB_CNTL_HEIGHT(uint32_t val)
 {
-	return ((val >> 5) << A5XX_RB_CNTL_HEIGHT__SHIFT) & A5XX_RB_CNTL_HEIGHT__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_RB_CNTL_HEIGHT__SHIFT) & A5XX_RB_CNTL_HEIGHT__MASK;
 }
 #define A5XX_RB_CNTL_BYPASS					0x00020000
 
@@ -3248,7 +3097,7 @@ static inline uint32_t A5XX_RB_RENDER_COMPONENTS_RT7(uint32_t val)
 	return ((val) << A5XX_RB_RENDER_COMPONENTS_RT7__SHIFT) & A5XX_RB_RENDER_COMPONENTS_RT7__MASK;
 }
 
-static inline uint32_t REG_A5XX_RB_MRT(uint32_t i0) { return 0x0000e150 + 0x7*i0; }
+#define REG_A5XX_RB_MRT(i0) (0x0000e150 + 0x7*(i0))
 
 static inline uint32_t REG_A5XX_RB_MRT_CONTROL(uint32_t i0) { return 0x0000e150 + 0x7*i0; }
 #define A5XX_RB_MRT_CONTROL_BLEND				0x00000001
@@ -3337,7 +3186,8 @@ static inline uint32_t REG_A5XX_RB_MRT_PITCH(uint32_t i0) { return 0x0000e153 +
 #define A5XX_RB_MRT_PITCH__SHIFT				0
 static inline uint32_t A5XX_RB_MRT_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_MRT_PITCH__SHIFT) & A5XX_RB_MRT_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_MRT_PITCH__SHIFT) & A5XX_RB_MRT_PITCH__MASK;
 }
 
 static inline uint32_t REG_A5XX_RB_MRT_ARRAY_PITCH(uint32_t i0) { return 0x0000e154 + 0x7*i0; }
@@ -3345,7 +3195,8 @@ static inline uint32_t REG_A5XX_RB_MRT_ARRAY_PITCH(uint32_t i0) { return 0x0000e
 #define A5XX_RB_MRT_ARRAY_PITCH__SHIFT				0
 static inline uint32_t A5XX_RB_MRT_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_MRT_ARRAY_PITCH__SHIFT) & A5XX_RB_MRT_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_MRT_ARRAY_PITCH__SHIFT) & A5XX_RB_MRT_ARRAY_PITCH__MASK;
 }
 
 static inline uint32_t REG_A5XX_RB_MRT_BASE_LO(uint32_t i0) { return 0x0000e155 + 0x7*i0; }
@@ -3527,7 +3378,8 @@ static inline uint32_t A5XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT(enum a5xx_depth_fo
 #define A5XX_RB_DEPTH_BUFFER_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_DEPTH_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_DEPTH_BUFFER_PITCH__SHIFT) & A5XX_RB_DEPTH_BUFFER_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_DEPTH_BUFFER_PITCH__SHIFT) & A5XX_RB_DEPTH_BUFFER_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH			0x0000e1b6
@@ -3535,7 +3387,8 @@ static inline uint32_t A5XX_RB_DEPTH_BUFFER_PITCH(uint32_t val)
 #define A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT) & A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT) & A5XX_RB_DEPTH_BUFFER_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_STENCIL_CONTROL				0x0000e1c0
@@ -3603,7 +3456,8 @@ static inline uint32_t A5XX_RB_STENCIL_CONTROL_ZFAIL_BF(enum adreno_stencil_op v
 #define A5XX_RB_STENCIL_PITCH__SHIFT				0
 static inline uint32_t A5XX_RB_STENCIL_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_STENCIL_PITCH__SHIFT) & A5XX_RB_STENCIL_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_STENCIL_PITCH__SHIFT) & A5XX_RB_STENCIL_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_STENCIL_ARRAY_PITCH				0x0000e1c5
@@ -3611,7 +3465,8 @@ static inline uint32_t A5XX_RB_STENCIL_PITCH(uint32_t val)
 #define A5XX_RB_STENCIL_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_STENCIL_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_STENCIL_ARRAY_PITCH__SHIFT) & A5XX_RB_STENCIL_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_STENCIL_ARRAY_PITCH__SHIFT) & A5XX_RB_STENCIL_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_STENCILREFMASK				0x0000e1c6
@@ -3722,7 +3577,8 @@ static inline uint32_t A5XX_RB_RESOLVE_CNTL_2_Y(uint32_t val)
 #define A5XX_RB_BLIT_DST_PITCH__SHIFT				0
 static inline uint32_t A5XX_RB_BLIT_DST_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_BLIT_DST_PITCH__SHIFT) & A5XX_RB_BLIT_DST_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_BLIT_DST_PITCH__SHIFT) & A5XX_RB_BLIT_DST_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_BLIT_DST_ARRAY_PITCH			0x0000e217
@@ -3730,7 +3586,8 @@ static inline uint32_t A5XX_RB_BLIT_DST_PITCH(uint32_t val)
 #define A5XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_BLIT_DST_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT) & A5XX_RB_BLIT_DST_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT) & A5XX_RB_BLIT_DST_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_CLEAR_COLOR_DW0				0x0000e218
@@ -3757,7 +3614,7 @@ static inline uint32_t A5XX_RB_CLEAR_CNTL_MASK(uint32_t val)
 
 #define REG_A5XX_RB_DEPTH_FLAG_BUFFER_PITCH			0x0000e242
 
-static inline uint32_t REG_A5XX_RB_MRT_FLAG_BUFFER(uint32_t i0) { return 0x0000e243 + 0x4*i0; }
+#define REG_A5XX_RB_MRT_FLAG_BUFFER(i0) (0x0000e243 + 0x4*(i0))
 
 static inline uint32_t REG_A5XX_RB_MRT_FLAG_BUFFER_ADDR_LO(uint32_t i0) { return 0x0000e243 + 0x4*i0; }
 
@@ -3768,7 +3625,8 @@ static inline uint32_t REG_A5XX_RB_MRT_FLAG_BUFFER_PITCH(uint32_t i0) { return 0
 #define A5XX_RB_MRT_FLAG_BUFFER_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_MRT_FLAG_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_MRT_FLAG_BUFFER_PITCH__SHIFT) & A5XX_RB_MRT_FLAG_BUFFER_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_MRT_FLAG_BUFFER_PITCH__SHIFT) & A5XX_RB_MRT_FLAG_BUFFER_PITCH__MASK;
 }
 
 static inline uint32_t REG_A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH(uint32_t i0) { return 0x0000e246 + 0x4*i0; }
@@ -3776,7 +3634,8 @@ static inline uint32_t REG_A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH(uint32_t i0) { re
 #define A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH__SHIFT		0
 static inline uint32_t A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH__SHIFT) & A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH__SHIFT) & A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_BLIT_FLAG_DST_LO				0x0000e263
@@ -3788,7 +3647,8 @@ static inline uint32_t A5XX_RB_MRT_FLAG_BUFFER_ARRAY_PITCH(uint32_t val)
 #define A5XX_RB_BLIT_FLAG_DST_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_BLIT_FLAG_DST_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_BLIT_FLAG_DST_PITCH__SHIFT) & A5XX_RB_BLIT_FLAG_DST_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_BLIT_FLAG_DST_PITCH__SHIFT) & A5XX_RB_BLIT_FLAG_DST_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH			0x0000e266
@@ -3796,7 +3656,8 @@ static inline uint32_t A5XX_RB_BLIT_FLAG_DST_PITCH(uint32_t val)
 #define A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH__SHIFT		0
 static inline uint32_t A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH__SHIFT) & A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH__SHIFT) & A5XX_RB_BLIT_FLAG_DST_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_SAMPLE_COUNT_ADDR_LO			0x0000e267
@@ -3812,11 +3673,11 @@ static inline uint32_t A5XX_VPC_CNTL_0_STRIDE_IN_VPC(uint32_t val)
 }
 #define A5XX_VPC_CNTL_0_VARYING					0x00000800
 
-static inline uint32_t REG_A5XX_VPC_VARYING_INTERP(uint32_t i0) { return 0x0000e282 + 0x1*i0; }
+#define REG_A5XX_VPC_VARYING_INTERP(i0) (0x0000e282 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VPC_VARYING_INTERP_MODE(uint32_t i0) { return 0x0000e282 + 0x1*i0; }
 
-static inline uint32_t REG_A5XX_VPC_VARYING_PS_REPL(uint32_t i0) { return 0x0000e28a + 0x1*i0; }
+#define REG_A5XX_VPC_VARYING_PS_REPL(i0) (0x0000e28a + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0x0000e28a + 0x1*i0; }
 
@@ -3824,7 +3685,7 @@ static inline uint32_t REG_A5XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0
 
 #define REG_A5XX_UNKNOWN_E293					0x0000e293
 
-static inline uint32_t REG_A5XX_VPC_VAR(uint32_t i0) { return 0x0000e294 + 0x1*i0; }
+#define REG_A5XX_VPC_VAR(i0) (0x0000e294 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VPC_VAR_DISABLE(uint32_t i0) { return 0x0000e294 + 0x1*i0; }
 
@@ -3890,7 +3751,8 @@ static inline uint32_t A5XX_VPC_SO_PROG_A_BUF(uint32_t val)
 #define A5XX_VPC_SO_PROG_A_OFF__SHIFT				2
 static inline uint32_t A5XX_VPC_SO_PROG_A_OFF(uint32_t val)
 {
-	return ((val >> 2) << A5XX_VPC_SO_PROG_A_OFF__SHIFT) & A5XX_VPC_SO_PROG_A_OFF__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A5XX_VPC_SO_PROG_A_OFF__SHIFT) & A5XX_VPC_SO_PROG_A_OFF__MASK;
 }
 #define A5XX_VPC_SO_PROG_A_EN					0x00000800
 #define A5XX_VPC_SO_PROG_B_BUF__MASK				0x00003000
@@ -3903,11 +3765,12 @@ static inline uint32_t A5XX_VPC_SO_PROG_B_BUF(uint32_t val)
 #define A5XX_VPC_SO_PROG_B_OFF__SHIFT				14
 static inline uint32_t A5XX_VPC_SO_PROG_B_OFF(uint32_t val)
 {
-	return ((val >> 2) << A5XX_VPC_SO_PROG_B_OFF__SHIFT) & A5XX_VPC_SO_PROG_B_OFF__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A5XX_VPC_SO_PROG_B_OFF__SHIFT) & A5XX_VPC_SO_PROG_B_OFF__MASK;
 }
 #define A5XX_VPC_SO_PROG_B_EN					0x00800000
 
-static inline uint32_t REG_A5XX_VPC_SO(uint32_t i0) { return 0x0000e2a7 + 0x7*i0; }
+#define REG_A5XX_VPC_SO(i0) (0x0000e2a7 + 0x7*(i0))
 
 static inline uint32_t REG_A5XX_VPC_SO_BUFFER_BASE_LO(uint32_t i0) { return 0x0000e2a7 + 0x7*i0; }
 
@@ -4066,7 +3929,7 @@ static inline uint32_t A5XX_VFD_CONTROL_3_REGID_TESSY(uint32_t val)
 
 #define REG_A5XX_VFD_INSTANCE_START_OFFSET			0x0000e409
 
-static inline uint32_t REG_A5XX_VFD_FETCH(uint32_t i0) { return 0x0000e40a + 0x4*i0; }
+#define REG_A5XX_VFD_FETCH(i0) (0x0000e40a + 0x4*(i0))
 
 static inline uint32_t REG_A5XX_VFD_FETCH_BASE_LO(uint32_t i0) { return 0x0000e40a + 0x4*i0; }
 
@@ -4076,7 +3939,7 @@ static inline uint32_t REG_A5XX_VFD_FETCH_SIZE(uint32_t i0) { return 0x0000e40c
 
 static inline uint32_t REG_A5XX_VFD_FETCH_STRIDE(uint32_t i0) { return 0x0000e40d + 0x4*i0; }
 
-static inline uint32_t REG_A5XX_VFD_DECODE(uint32_t i0) { return 0x0000e48a + 0x2*i0; }
+#define REG_A5XX_VFD_DECODE(i0) (0x0000e48a + 0x2*(i0))
 
 static inline uint32_t REG_A5XX_VFD_DECODE_INSTR(uint32_t i0) { return 0x0000e48a + 0x2*i0; }
 #define A5XX_VFD_DECODE_INSTR_IDX__MASK				0x0000001f
@@ -4103,7 +3966,7 @@ static inline uint32_t A5XX_VFD_DECODE_INSTR_SWAP(enum a3xx_color_swap val)
 
 static inline uint32_t REG_A5XX_VFD_DECODE_STEP_RATE(uint32_t i0) { return 0x0000e48b + 0x2*i0; }
 
-static inline uint32_t REG_A5XX_VFD_DEST_CNTL(uint32_t i0) { return 0x0000e4ca + 0x1*i0; }
+#define REG_A5XX_VFD_DEST_CNTL(i0) (0x0000e4ca + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_VFD_DEST_CNTL_INSTR(uint32_t i0) { return 0x0000e4ca + 0x1*i0; }
 #define A5XX_VFD_DEST_CNTL_INSTR_WRITEMASK__MASK		0x0000000f
@@ -4254,7 +4117,7 @@ static inline uint32_t A5XX_SP_PRIMITIVE_CNTL_VSOUT(uint32_t val)
 	return ((val) << A5XX_SP_PRIMITIVE_CNTL_VSOUT__SHIFT) & A5XX_SP_PRIMITIVE_CNTL_VSOUT__MASK;
 }
 
-static inline uint32_t REG_A5XX_SP_VS_OUT(uint32_t i0) { return 0x0000e593 + 0x1*i0; }
+#define REG_A5XX_SP_VS_OUT(i0) (0x0000e593 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_SP_VS_OUT_REG(uint32_t i0) { return 0x0000e593 + 0x1*i0; }
 #define A5XX_SP_VS_OUT_REG_A_REGID__MASK			0x000000ff
@@ -4282,7 +4145,7 @@ static inline uint32_t A5XX_SP_VS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A5XX_SP_VS_OUT_REG_B_COMPMASK__SHIFT) & A5XX_SP_VS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A5XX_SP_VS_VPC_DST(uint32_t i0) { return 0x0000e5a3 + 0x1*i0; }
+#define REG_A5XX_SP_VS_VPC_DST(i0) (0x0000e5a3 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_SP_VS_VPC_DST_REG(uint32_t i0) { return 0x0000e5a3 + 0x1*i0; }
 #define A5XX_SP_VS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -4316,6 +4179,39 @@ static inline uint32_t A5XX_SP_VS_VPC_DST_REG_OUTLOC3(uint32_t val)
 
 #define REG_A5XX_SP_VS_OBJ_START_HI				0x0000e5ad
 
+#define REG_A5XX_SP_VS_PVT_MEM_PARAM				0x0000e5ae
+#define A5XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_VS_PVT_MEM_ADDR				0x0000e5af
+
+#define REG_A5XX_SP_VS_PVT_MEM_SIZE				0x0000e5b1
+#define A5XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_SP_FS_CTRL_REG0				0x0000e5c0
 #define A5XX_SP_FS_CTRL_REG0_BUFFER				0x00000004
 #define A5XX_SP_FS_CTRL_REG0_THREADSIZE__MASK			0x00000008
@@ -4351,6 +4247,39 @@ static inline uint32_t A5XX_SP_FS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 
 #define REG_A5XX_SP_FS_OBJ_START_HI				0x0000e5c4
 
+#define REG_A5XX_SP_FS_PVT_MEM_PARAM				0x0000e5c5
+#define A5XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_FS_PVT_MEM_ADDR				0x0000e5c6
+
+#define REG_A5XX_SP_FS_PVT_MEM_SIZE				0x0000e5c8
+#define A5XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_SP_BLEND_CNTL					0x0000e5c9
 #define A5XX_SP_BLEND_CNTL_ENABLE_BLEND__MASK			0x000000ff
 #define A5XX_SP_BLEND_CNTL_ENABLE_BLEND__SHIFT			0
@@ -4381,7 +4310,7 @@ static inline uint32_t A5XX_SP_FS_OUTPUT_CNTL_SAMPLEMASK_REGID(uint32_t val)
 	return ((val) << A5XX_SP_FS_OUTPUT_CNTL_SAMPLEMASK_REGID__SHIFT) & A5XX_SP_FS_OUTPUT_CNTL_SAMPLEMASK_REGID__MASK;
 }
 
-static inline uint32_t REG_A5XX_SP_FS_OUTPUT(uint32_t i0) { return 0x0000e5cb + 0x1*i0; }
+#define REG_A5XX_SP_FS_OUTPUT(i0) (0x0000e5cb + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_SP_FS_OUTPUT_REG(uint32_t i0) { return 0x0000e5cb + 0x1*i0; }
 #define A5XX_SP_FS_OUTPUT_REG_REGID__MASK			0x000000ff
@@ -4392,7 +4321,7 @@ static inline uint32_t A5XX_SP_FS_OUTPUT_REG_REGID(uint32_t val)
 }
 #define A5XX_SP_FS_OUTPUT_REG_HALF_PRECISION			0x00000100
 
-static inline uint32_t REG_A5XX_SP_FS_MRT(uint32_t i0) { return 0x0000e5d3 + 0x1*i0; }
+#define REG_A5XX_SP_FS_MRT(i0) (0x0000e5d3 + 0x1*(i0))
 
 static inline uint32_t REG_A5XX_SP_FS_MRT_REG(uint32_t i0) { return 0x0000e5d3 + 0x1*i0; }
 #define A5XX_SP_FS_MRT_REG_COLOR_FORMAT__MASK			0x000000ff
@@ -4442,6 +4371,39 @@ static inline uint32_t A5XX_SP_CS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 
 #define REG_A5XX_SP_CS_OBJ_START_HI				0x0000e5f4
 
+#define REG_A5XX_SP_CS_PVT_MEM_PARAM				0x0000e5f5
+#define A5XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_CS_PVT_MEM_ADDR				0x0000e5f6
+
+#define REG_A5XX_SP_CS_PVT_MEM_SIZE				0x0000e5f8
+#define A5XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_SP_HS_CTRL_REG0				0x0000e600
 #define A5XX_SP_HS_CTRL_REG0_BUFFER				0x00000004
 #define A5XX_SP_HS_CTRL_REG0_THREADSIZE__MASK			0x00000008
@@ -4477,6 +4439,39 @@ static inline uint32_t A5XX_SP_HS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 
 #define REG_A5XX_SP_HS_OBJ_START_HI				0x0000e604
 
+#define REG_A5XX_SP_HS_PVT_MEM_PARAM				0x0000e605
+#define A5XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_HS_PVT_MEM_ADDR				0x0000e606
+
+#define REG_A5XX_SP_HS_PVT_MEM_SIZE				0x0000e608
+#define A5XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_SP_DS_CTRL_REG0				0x0000e610
 #define A5XX_SP_DS_CTRL_REG0_BUFFER				0x00000004
 #define A5XX_SP_DS_CTRL_REG0_THREADSIZE__MASK			0x00000008
@@ -4512,6 +4507,39 @@ static inline uint32_t A5XX_SP_DS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 
 #define REG_A5XX_SP_DS_OBJ_START_HI				0x0000e62d
 
+#define REG_A5XX_SP_DS_PVT_MEM_PARAM				0x0000e62e
+#define A5XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_DS_PVT_MEM_ADDR				0x0000e62f
+
+#define REG_A5XX_SP_DS_PVT_MEM_SIZE				0x0000e631
+#define A5XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_SP_GS_CTRL_REG0				0x0000e640
 #define A5XX_SP_GS_CTRL_REG0_BUFFER				0x00000004
 #define A5XX_SP_GS_CTRL_REG0_THREADSIZE__MASK			0x00000008
@@ -4547,6 +4575,39 @@ static inline uint32_t A5XX_SP_GS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 
 #define REG_A5XX_SP_GS_OBJ_START_HI				0x0000e65d
 
+#define REG_A5XX_SP_GS_PVT_MEM_PARAM				0x0000e65e
+#define A5XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
+#define A5XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
+static inline uint32_t A5XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
+{
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A5XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A5XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+}
+#define A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK		0x00ffff00
+#define A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT		8
+static inline uint32_t A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKOFFSET(uint32_t val)
+{
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKOFFSET__SHIFT) & A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKOFFSET__MASK;
+}
+#define A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
+#define A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
+static inline uint32_t A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t val)
+{
+	return ((val) << A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT) & A5XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK;
+}
+
+#define REG_A5XX_SP_GS_PVT_MEM_ADDR				0x0000e65f
+
+#define REG_A5XX_SP_GS_PVT_MEM_SIZE				0x0000e661
+#define A5XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
+#define A5XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
+static inline uint32_t A5XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
+{
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A5XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+}
+
 #define REG_A5XX_TPL1_TP_RAS_MSAA_CNTL				0x0000e704
 #define A5XX_TPL1_TP_RAS_MSAA_CNTL_SAMPLES__MASK		0x00000003
 #define A5XX_TPL1_TP_RAS_MSAA_CNTL_SAMPLES__SHIFT		0
@@ -5061,13 +5122,15 @@ static inline uint32_t A5XX_RB_2D_SRC_INFO_COLOR_SWAP(enum a3xx_color_swap val)
 #define A5XX_RB_2D_SRC_SIZE_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_2D_SRC_SIZE_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_SRC_SIZE_PITCH__SHIFT) & A5XX_RB_2D_SRC_SIZE_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_SRC_SIZE_PITCH__SHIFT) & A5XX_RB_2D_SRC_SIZE_PITCH__MASK;
 }
 #define A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__MASK			0xffff0000
 #define A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__SHIFT			16
 static inline uint32_t A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__SHIFT) & A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__SHIFT) & A5XX_RB_2D_SRC_SIZE_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_2D_DST_INFO					0x00002110
@@ -5101,13 +5164,15 @@ static inline uint32_t A5XX_RB_2D_DST_INFO_COLOR_SWAP(enum a3xx_color_swap val)
 #define A5XX_RB_2D_DST_SIZE_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_2D_DST_SIZE_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_DST_SIZE_PITCH__SHIFT) & A5XX_RB_2D_DST_SIZE_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_DST_SIZE_PITCH__SHIFT) & A5XX_RB_2D_DST_SIZE_PITCH__MASK;
 }
 #define A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__MASK			0xffff0000
 #define A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__SHIFT			16
 static inline uint32_t A5XX_RB_2D_DST_SIZE_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__SHIFT) & A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__SHIFT) & A5XX_RB_2D_DST_SIZE_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_2D_SRC_FLAGS_LO				0x00002140
@@ -5119,7 +5184,8 @@ static inline uint32_t A5XX_RB_2D_DST_SIZE_ARRAY_PITCH(uint32_t val)
 #define A5XX_RB_2D_SRC_FLAGS_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_2D_SRC_FLAGS_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_SRC_FLAGS_PITCH__SHIFT) & A5XX_RB_2D_SRC_FLAGS_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_SRC_FLAGS_PITCH__SHIFT) & A5XX_RB_2D_SRC_FLAGS_PITCH__MASK;
 }
 
 #define REG_A5XX_RB_2D_DST_FLAGS_LO				0x00002143
@@ -5131,7 +5197,8 @@ static inline uint32_t A5XX_RB_2D_SRC_FLAGS_PITCH(uint32_t val)
 #define A5XX_RB_2D_DST_FLAGS_PITCH__SHIFT			0
 static inline uint32_t A5XX_RB_2D_DST_FLAGS_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A5XX_RB_2D_DST_FLAGS_PITCH__SHIFT) & A5XX_RB_2D_DST_FLAGS_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A5XX_RB_2D_DST_FLAGS_PITCH__SHIFT) & A5XX_RB_2D_DST_FLAGS_PITCH__MASK;
 }
 
 #define REG_A5XX_GRAS_2D_BLIT_CNTL				0x00002180
@@ -5357,13 +5424,15 @@ static inline uint32_t A5XX_TEX_CONST_2_TYPE(enum a5xx_tex_type val)
 #define A5XX_TEX_CONST_3_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A5XX_TEX_CONST_3_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 12) << A5XX_TEX_CONST_3_ARRAY_PITCH__SHIFT) & A5XX_TEX_CONST_3_ARRAY_PITCH__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_TEX_CONST_3_ARRAY_PITCH__SHIFT) & A5XX_TEX_CONST_3_ARRAY_PITCH__MASK;
 }
 #define A5XX_TEX_CONST_3_MIN_LAYERSZ__MASK			0x07800000
 #define A5XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT			23
 static inline uint32_t A5XX_TEX_CONST_3_MIN_LAYERSZ(uint32_t val)
 {
-	return ((val >> 12) << A5XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT) & A5XX_TEX_CONST_3_MIN_LAYERSZ__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT) & A5XX_TEX_CONST_3_MIN_LAYERSZ__MASK;
 }
 #define A5XX_TEX_CONST_3_TILE_ALL				0x08000000
 #define A5XX_TEX_CONST_3_FLAG					0x10000000
@@ -5373,7 +5442,8 @@ static inline uint32_t A5XX_TEX_CONST_3_MIN_LAYERSZ(uint32_t val)
 #define A5XX_TEX_CONST_4_BASE_LO__SHIFT				5
 static inline uint32_t A5XX_TEX_CONST_4_BASE_LO(uint32_t val)
 {
-	return ((val >> 5) << A5XX_TEX_CONST_4_BASE_LO__SHIFT) & A5XX_TEX_CONST_4_BASE_LO__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_TEX_CONST_4_BASE_LO__SHIFT) & A5XX_TEX_CONST_4_BASE_LO__MASK;
 }
 
 #define REG_A5XX_TEX_CONST_5					0x00000005
@@ -5407,7 +5477,8 @@ static inline uint32_t A5XX_TEX_CONST_5_DEPTH(uint32_t val)
 #define A5XX_SSBO_0_0_BASE_LO__SHIFT				5
 static inline uint32_t A5XX_SSBO_0_0_BASE_LO(uint32_t val)
 {
-	return ((val >> 5) << A5XX_SSBO_0_0_BASE_LO__SHIFT) & A5XX_SSBO_0_0_BASE_LO__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A5XX_SSBO_0_0_BASE_LO__SHIFT) & A5XX_SSBO_0_0_BASE_LO__MASK;
 }
 
 #define REG_A5XX_SSBO_0_1					0x00000001
@@ -5423,7 +5494,8 @@ static inline uint32_t A5XX_SSBO_0_1_PITCH(uint32_t val)
 #define A5XX_SSBO_0_2_ARRAY_PITCH__SHIFT			12
 static inline uint32_t A5XX_SSBO_0_2_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 12) << A5XX_SSBO_0_2_ARRAY_PITCH__SHIFT) & A5XX_SSBO_0_2_ARRAY_PITCH__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A5XX_SSBO_0_2_ARRAY_PITCH__SHIFT) & A5XX_SSBO_0_2_ARRAY_PITCH__MASK;
 }
 
 #define REG_A5XX_SSBO_0_3					0x00000003
@@ -5494,5 +5566,7 @@ static inline uint32_t A5XX_UBO_1_BASE_HI(uint32_t val)
 	return ((val) << A5XX_UBO_1_BASE_HI__SHIFT) & A5XX_UBO_1_BASE_HI__MASK;
 }
 
+#ifdef __cplusplus
+#endif
 
 #endif /* A5XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..ad6f6be9bfae 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -3,28 +3,20 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml          ( 227290 bytes, from Thu Jan  4 07:25:22 2024)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,8 +37,21 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum a6xx_tile_mode {
 	TILE6_LINEAR = 0,
@@ -914,6 +919,19 @@ enum a6xx_ztest_mode {
 	A6XX_INVALID_ZTEST = 3,
 };
 
+enum a6xx_tess_spacing {
+	TESS_EQUAL = 0,
+	TESS_FRACTIONAL_ODD = 2,
+	TESS_FRACTIONAL_EVEN = 3,
+};
+
+enum a6xx_tess_output {
+	TESS_POINTS = 0,
+	TESS_LINES = 1,
+	TESS_CW_TRIS = 2,
+	TESS_CCW_TRIS = 3,
+};
+
 enum a6xx_sequenced_thread_dist {
 	DIST_SCREEN_COORD = 0,
 	DIST_ALL_TO_RB0 = 1,
@@ -967,17 +985,11 @@ enum a6xx_rotation {
 	ROTATE_VFLIP = 5,
 };
 
-enum a6xx_tess_spacing {
-	TESS_EQUAL = 0,
-	TESS_FRACTIONAL_ODD = 2,
-	TESS_FRACTIONAL_EVEN = 3,
-};
-
-enum a6xx_tess_output {
-	TESS_POINTS = 0,
-	TESS_LINES = 1,
-	TESS_CW_TRIS = 2,
-	TESS_CCW_TRIS = 3,
+enum a6xx_ccu_color_cache_size {
+	CCU_COLOR_CACHE_SIZE_FULL = 0,
+	CCU_COLOR_CACHE_SIZE_HALF = 1,
+	CCU_COLOR_CACHE_SIZE_QUARTER = 2,
+	CCU_COLOR_CACHE_SIZE_EIGHTH = 3,
 };
 
 enum a6xx_threadsize {
@@ -991,9 +1003,17 @@ enum a6xx_bindless_descriptor_size {
 };
 
 enum a6xx_isam_mode {
+	ISAMMODE_CL = 1,
 	ISAMMODE_GL = 2,
 };
 
+enum a7xx_cs_yalign {
+	CS_YALIGN_1 = 8,
+	CS_YALIGN_2 = 4,
+	CS_YALIGN_4 = 2,
+	CS_YALIGN_8 = 1,
+};
+
 enum a6xx_tex_filter {
 	A6XX_TEX_NEAREST = 0,
 	A6XX_TEX_LINEAR = 1,
@@ -1069,6 +1089,7 @@ enum a6xx_tex_type {
 #define A6XX_RBBM_INT_0_MASK_TSBWRITEERROR			0x10000000
 #define A6XX_RBBM_INT_0_MASK_ISDB_CPU_IRQ			0x40000000
 #define A6XX_RBBM_INT_0_MASK_ISDB_UNDER_DEBUG			0x80000000
+
 #define A6XX_CP_INT_CP_OPCODE_ERROR				0x00000001
 #define A6XX_CP_INT_CP_UCODE_ERROR				0x00000002
 #define A6XX_CP_INT_CP_HW_FAULT_ERROR				0x00000004
@@ -1086,6 +1107,7 @@ enum a6xx_tex_type {
 #define A6XX_CP_INT_CP_HW_FAULT_ERROR_BV			0x00008000
 #define A6XX_CP_INT_CP_REGISTER_PROTECTION_ERROR_BV		0x00010000
 #define A6XX_CP_INT_CP_ILLEGAL_INSTR_ERROR_BV			0x00020000
+
 #define REG_A6XX_CP_RB_BASE					0x00000800
 
 #define REG_A6XX_CP_RB_CNTL					0x00000802
@@ -1104,7 +1126,6 @@ enum a6xx_tex_type {
 #define REG_A6XX_CP_HW_FAULT					0x00000821
 
 #define REG_A6XX_CP_INTERRUPT_STATUS				0x00000823
-
 #define REG_A6XX_CP_PROTECT_STATUS				0x00000824
 
 #define REG_A6XX_CP_STATUS_1					0x00000825
@@ -1128,25 +1149,29 @@ enum a6xx_tex_type {
 #define A6XX_CP_ROQ_THRESHOLDS_1_MRB_START__SHIFT		0
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_1_MRB_START(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_1_MRB_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_MRB_START__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_1_MRB_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_MRB_START__MASK;
 }
 #define A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__MASK		0x0000ff00
 #define A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__SHIFT		8
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_1_VSD_START(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_VSD_START__MASK;
 }
 #define A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__MASK		0x00ff0000
 #define A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__SHIFT		16
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_1_IB1_START(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_IB1_START__MASK;
 }
 #define A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__MASK		0xff000000
 #define A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__SHIFT		24
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_1_IB2_START(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_1_IB2_START__MASK;
 }
 
 #define REG_A6XX_CP_ROQ_THRESHOLDS_2				0x000008c2
@@ -1154,13 +1179,15 @@ static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_1_IB2_START(uint32_t val)
 #define A6XX_CP_ROQ_THRESHOLDS_2_SDS_START__SHIFT		0
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_2_SDS_START(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_2_SDS_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_2_SDS_START__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_2_SDS_START__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_2_SDS_START__MASK;
 }
 #define A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__MASK			0xffff0000
 #define A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__SHIFT		16
 static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE(uint32_t val)
 {
-	return ((val >> 2) << A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__SHIFT) & A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE__MASK;
 }
 
 #define REG_A6XX_CP_MEM_POOL_SIZE				0x000008c3
@@ -1176,11 +1203,11 @@ static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE(uint32_t val)
 #define A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN		0x00000002
 #define A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN			0x00000001
 
-static inline uint32_t REG_A6XX_CP_SCRATCH(uint32_t i0) { return 0x00000883 + 0x1*i0; }
+#define REG_A6XX_CP_SCRATCH(i0) (0x00000883 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_CP_SCRATCH_REG(uint32_t i0) { return 0x00000883 + 0x1*i0; }
 
-static inline uint32_t REG_A6XX_CP_PROTECT(uint32_t i0) { return 0x00000850 + 0x1*i0; }
+#define REG_A6XX_CP_PROTECT(i0) (0x00000850 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_CP_PROTECT_REG(uint32_t i0) { return 0x00000850 + 0x1*i0; }
 #define A6XX_CP_PROTECT_REG_BASE_ADDR__MASK			0x0003ffff
@@ -1209,9 +1236,9 @@ static inline uint32_t A6XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 
 #define REG_A7XX_CP_CONTEXT_SWITCH_LEVEL_STATUS			0x000008ab
 
-static inline uint32_t REG_A6XX_CP_PERFCTR_CP_SEL(uint32_t i0) { return 0x000008d0 + 0x1*i0; }
+#define REG_A6XX_CP_PERFCTR_CP_SEL(i0) (0x000008d0 + 0x1*(i0))
 
-static inline uint32_t REG_A7XX_CP_BV_PERFCTR_CP_SEL(uint32_t i0) { return 0x000008e0 + 0x1*i0; }
+#define REG_A7XX_CP_BV_PERFCTR_CP_SEL(i0) (0x000008e0 + 0x1*(i0))
 
 #define REG_A6XX_CP_CRASH_SCRIPT_BASE				0x00000900
 
@@ -1472,7 +1499,6 @@ static inline uint32_t A6XX_CP_ROQ_AVAIL_VSD_REM(uint32_t val)
 #define REG_A6XX_RBBM_GPR0_CNTL					0x00000018
 
 #define REG_A6XX_RBBM_INT_0_STATUS				0x00000201
-
 #define REG_A6XX_RBBM_STATUS					0x00000210
 #define A6XX_RBBM_STATUS_GPU_BUSY_IGN_AHB			0x00800000
 #define A6XX_RBBM_STATUS_GPU_BUSY_IGN_AHB_CP			0x00400000
@@ -1520,93 +1546,93 @@ static inline uint32_t A6XX_CP_ROQ_AVAIL_VSD_REM(uint32_t val)
 
 #define REG_A7XX_RBBM_CLOCK_MODE_BV_GPC				0x00000288
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_CP(uint32_t i0) { return 0x00000400 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_CP(i0) (0x00000400 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM(uint32_t i0) { return 0x0000041c + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_RBBM(i0) (0x0000041c + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_PC(uint32_t i0) { return 0x00000424 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_PC(i0) (0x00000424 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_VFD(uint32_t i0) { return 0x00000434 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_VFD(i0) (0x00000434 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_HLSQ(uint32_t i0) { return 0x00000444 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_HLSQ(i0) (0x00000444 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_VPC(uint32_t i0) { return 0x00000450 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_VPC(i0) (0x00000450 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_CCU(uint32_t i0) { return 0x0000045c + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_CCU(i0) (0x0000045c + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_TSE(uint32_t i0) { return 0x00000466 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_TSE(i0) (0x00000466 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_RAS(uint32_t i0) { return 0x0000046e + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_RAS(i0) (0x0000046e + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_UCHE(uint32_t i0) { return 0x00000476 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_UCHE(i0) (0x00000476 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_TP(uint32_t i0) { return 0x0000048e + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_TP(i0) (0x0000048e + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_SP(uint32_t i0) { return 0x000004a6 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_SP(i0) (0x000004a6 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_RB(uint32_t i0) { return 0x000004d6 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_RB(i0) (0x000004d6 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_VSC(uint32_t i0) { return 0x000004e6 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_VSC(i0) (0x000004e6 + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_LRZ(uint32_t i0) { return 0x000004ea + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_LRZ(i0) (0x000004ea + 0x2*(i0))
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_CMP(uint32_t i0) { return 0x000004f2 + 0x2*i0; }
+#define REG_A6XX_RBBM_PERFCTR_CMP(i0) (0x000004f2 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_CP(uint32_t i0) { return 0x00000300 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_CP(i0) (0x00000300 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_RBBM(uint32_t i0) { return 0x0000031c + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_RBBM(i0) (0x0000031c + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_PC(uint32_t i0) { return 0x00000324 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_PC(i0) (0x00000324 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_VFD(uint32_t i0) { return 0x00000334 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_VFD(i0) (0x00000334 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_HLSQ(uint32_t i0) { return 0x00000344 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_HLSQ(i0) (0x00000344 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_VPC(uint32_t i0) { return 0x00000350 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_VPC(i0) (0x00000350 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_CCU(uint32_t i0) { return 0x0000035c + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_CCU(i0) (0x0000035c + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_TSE(uint32_t i0) { return 0x00000366 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_TSE(i0) (0x00000366 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_RAS(uint32_t i0) { return 0x0000036e + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_RAS(i0) (0x0000036e + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_UCHE(uint32_t i0) { return 0x00000376 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_UCHE(i0) (0x00000376 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_TP(uint32_t i0) { return 0x0000038e + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_TP(i0) (0x0000038e + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_SP(uint32_t i0) { return 0x000003a6 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_SP(i0) (0x000003a6 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_RB(uint32_t i0) { return 0x000003d6 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_RB(i0) (0x000003d6 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_VSC(uint32_t i0) { return 0x000003e6 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_VSC(i0) (0x000003e6 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_LRZ(uint32_t i0) { return 0x000003ea + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_LRZ(i0) (0x000003ea + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_CMP(uint32_t i0) { return 0x000003f2 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_CMP(i0) (0x000003f2 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_UFC(uint32_t i0) { return 0x000003fa + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_UFC(i0) (0x000003fa + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR2_HLSQ(uint32_t i0) { return 0x00000410 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR2_HLSQ(i0) (0x00000410 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR2_CP(uint32_t i0) { return 0x0000041c + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR2_CP(i0) (0x0000041c + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR2_SP(uint32_t i0) { return 0x0000042a + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR2_SP(i0) (0x0000042a + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR2_TP(uint32_t i0) { return 0x00000442 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR2_TP(i0) (0x00000442 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR2_UFC(uint32_t i0) { return 0x0000044e + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR2_UFC(i0) (0x0000044e + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_PC(uint32_t i0) { return 0x00000460 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_PC(i0) (0x00000460 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_VFD(uint32_t i0) { return 0x00000470 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_VFD(i0) (0x00000470 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_VPC(uint32_t i0) { return 0x00000480 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_VPC(i0) (0x00000480 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_TSE(uint32_t i0) { return 0x0000048c + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_TSE(i0) (0x0000048c + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_RAS(uint32_t i0) { return 0x00000494 + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_RAS(i0) (0x00000494 + 0x2*(i0))
 
-static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_LRZ(uint32_t i0) { return 0x0000049c + 0x2*i0; }
+#define REG_A7XX_RBBM_PERFCTR_BV_LRZ(i0) (0x0000049c + 0x2*(i0))
 
 #define REG_A6XX_RBBM_PERFCTR_CNTL				0x00000500
 
@@ -1622,7 +1648,7 @@ static inline uint32_t REG_A7XX_RBBM_PERFCTR_BV_LRZ(uint32_t i0) { return 0x0000
 
 #define REG_A6XX_RBBM_PERFCTR_LOAD_VALUE_HI			0x00000506
 
-static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00000507 + 0x1*i0; }
+#define REG_A6XX_RBBM_PERFCTR_RBBM_SEL(i0) (0x00000507 + 0x1*(i0))
 
 #define REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED			0x0000050b
 
@@ -1710,9 +1736,7 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 #define REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL			0x0000001f
 
 #define REG_A6XX_RBBM_INT_CLEAR_CMD				0x00000037
-
 #define REG_A6XX_RBBM_INT_0_MASK				0x00000038
-
 #define REG_A7XX_RBBM_INT_2_MASK				0x0000003a
 
 #define REG_A6XX_RBBM_SP_HYST_CNT				0x00000042
@@ -2117,7 +2141,10 @@ static inline uint32_t A6XX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
 
 #define REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF2			0x00000630
 
-static inline uint32_t REG_A6XX_VSC_PERFCTR_VSC_SEL(uint32_t i0) { return 0x00000cd8 + 0x1*i0; }
+#define REG_A6XX_VSC_PERFCTR_VSC_SEL(i0) (0x00000cd8 + 0x1*(i0))
+
+#define REG_A7XX_VSC_UNKNOWN_0CD8				0x00000cd8
+#define A7XX_VSC_UNKNOWN_0CD8_BINNING				0x00000001
 
 #define REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE			0x0000c800
 
@@ -2149,7 +2176,7 @@ static inline uint32_t A6XX_UCHE_CLIENT_PF_PERFSEL(uint32_t val)
 	return ((val) << A6XX_UCHE_CLIENT_PF_PERFSEL__SHIFT) & A6XX_UCHE_CLIENT_PF_PERFSEL__MASK;
 }
 
-static inline uint32_t REG_A6XX_UCHE_PERFCTR_UCHE_SEL(uint32_t i0) { return 0x00000e1c + 0x1*i0; }
+#define REG_A6XX_UCHE_PERFCTR_UCHE_SEL(i0) (0x00000e1c + 0x1*(i0))
 
 #define REG_A6XX_UCHE_GBIF_GX_CONFIG				0x00000e3a
 
@@ -2291,13 +2318,15 @@ static inline uint32_t A6XX_VBIF_TEST_BUS2_CTRL1_DATA_SEL(uint32_t val)
 #define A6XX_VSC_BIN_SIZE_WIDTH__SHIFT				0
 static inline uint32_t A6XX_VSC_BIN_SIZE_WIDTH(uint32_t val)
 {
-	return ((val >> 5) << A6XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A6XX_VSC_BIN_SIZE_WIDTH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_VSC_BIN_SIZE_WIDTH__SHIFT) & A6XX_VSC_BIN_SIZE_WIDTH__MASK;
 }
 #define A6XX_VSC_BIN_SIZE_HEIGHT__MASK				0x0001ff00
 #define A6XX_VSC_BIN_SIZE_HEIGHT__SHIFT				8
 static inline uint32_t A6XX_VSC_BIN_SIZE_HEIGHT(uint32_t val)
 {
-	return ((val >> 4) << A6XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A6XX_VSC_BIN_SIZE_HEIGHT__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_VSC_BIN_SIZE_HEIGHT__SHIFT) & A6XX_VSC_BIN_SIZE_HEIGHT__MASK;
 }
 
 #define REG_A6XX_VSC_DRAW_STRM_SIZE_ADDRESS			0x00000c03
@@ -2316,7 +2345,7 @@ static inline uint32_t A6XX_VSC_BIN_COUNT_NY(uint32_t val)
 	return ((val) << A6XX_VSC_BIN_COUNT_NY__SHIFT) & A6XX_VSC_BIN_COUNT_NY__MASK;
 }
 
-static inline uint32_t REG_A6XX_VSC_PIPE_CONFIG(uint32_t i0) { return 0x00000c10 + 0x1*i0; }
+#define REG_A6XX_VSC_PIPE_CONFIG(i0) (0x00000c10 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VSC_PIPE_CONFIG_REG(uint32_t i0) { return 0x00000c10 + 0x1*i0; }
 #define A6XX_VSC_PIPE_CONFIG_REG_X__MASK			0x000003ff
@@ -2356,18 +2385,22 @@ static inline uint32_t A6XX_VSC_PIPE_CONFIG_REG_H(uint32_t val)
 
 #define REG_A6XX_VSC_DRAW_STRM_LIMIT				0x00000c37
 
-static inline uint32_t REG_A6XX_VSC_STATE(uint32_t i0) { return 0x00000c38 + 0x1*i0; }
+#define REG_A6XX_VSC_STATE(i0) (0x00000c38 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VSC_STATE_REG(uint32_t i0) { return 0x00000c38 + 0x1*i0; }
 
-static inline uint32_t REG_A6XX_VSC_PRIM_STRM_SIZE(uint32_t i0) { return 0x00000c58 + 0x1*i0; }
+#define REG_A6XX_VSC_PRIM_STRM_SIZE(i0) (0x00000c58 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VSC_PRIM_STRM_SIZE_REG(uint32_t i0) { return 0x00000c58 + 0x1*i0; }
 
-static inline uint32_t REG_A6XX_VSC_DRAW_STRM_SIZE(uint32_t i0) { return 0x00000c78 + 0x1*i0; }
+#define REG_A6XX_VSC_DRAW_STRM_SIZE(i0) (0x00000c78 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VSC_DRAW_STRM_SIZE_REG(uint32_t i0) { return 0x00000c78 + 0x1*i0; }
 
+#define REG_A7XX_UCHE_UNKNOWN_0E10				0x00000e10
+
+#define REG_A7XX_UCHE_UNKNOWN_0E11				0x00000e11
+
 #define REG_A6XX_UCHE_UNKNOWN_0E12				0x00000e12
 
 #define REG_A6XX_GRAS_CL_CNTL					0x00008000
@@ -2437,6 +2470,8 @@ static inline uint32_t A6XX_GRAS_CNTL_COORD_MASK(uint32_t val)
 {
 	return ((val) << A6XX_GRAS_CNTL_COORD_MASK__SHIFT) & A6XX_GRAS_CNTL_COORD_MASK__MASK;
 }
+#define A6XX_GRAS_CNTL_UNK10					0x00000400
+#define A6XX_GRAS_CNTL_UNK11					0x00000800
 
 #define REG_A6XX_GRAS_CL_GUARDBAND_CLIP_ADJ			0x00008006
 #define A6XX_GRAS_CL_GUARDBAND_CLIP_ADJ_HORZ__MASK		0x000001ff
@@ -2452,7 +2487,19 @@ static inline uint32_t A6XX_GRAS_CL_GUARDBAND_CLIP_ADJ_VERT(uint32_t val)
 	return ((val) << A6XX_GRAS_CL_GUARDBAND_CLIP_ADJ_VERT__SHIFT) & A6XX_GRAS_CL_GUARDBAND_CLIP_ADJ_VERT__MASK;
 }
 
-static inline uint32_t REG_A6XX_GRAS_CL_VPORT(uint32_t i0) { return 0x00008010 + 0x6*i0; }
+#define REG_A7XX_GRAS_UNKNOWN_8007				0x00008007
+
+#define REG_A7XX_GRAS_UNKNOWN_8008				0x00008008
+
+#define REG_A7XX_GRAS_UNKNOWN_8009				0x00008009
+
+#define REG_A7XX_GRAS_UNKNOWN_800A				0x0000800a
+
+#define REG_A7XX_GRAS_UNKNOWN_800B				0x0000800b
+
+#define REG_A7XX_GRAS_UNKNOWN_800C				0x0000800c
+
+#define REG_A6XX_GRAS_CL_VPORT(i0) (0x00008010 + 0x6*(i0))
 
 static inline uint32_t REG_A6XX_GRAS_CL_VPORT_XOFFSET(uint32_t i0) { return 0x00008010 + 0x6*i0; }
 #define A6XX_GRAS_CL_VPORT_XOFFSET__MASK			0xffffffff
@@ -2502,7 +2549,7 @@ static inline uint32_t A6XX_GRAS_CL_VPORT_ZSCALE(float val)
 	return ((fui(val)) << A6XX_GRAS_CL_VPORT_ZSCALE__SHIFT) & A6XX_GRAS_CL_VPORT_ZSCALE__MASK;
 }
 
-static inline uint32_t REG_A6XX_GRAS_CL_Z_CLAMP(uint32_t i0) { return 0x00008070 + 0x2*i0; }
+#define REG_A6XX_GRAS_CL_Z_CLAMP(i0) (0x00008070 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_GRAS_CL_Z_CLAMP_MIN(uint32_t i0) { return 0x00008070 + 0x2*i0; }
 #define A6XX_GRAS_CL_Z_CLAMP_MIN__MASK				0xffffffff
@@ -2531,12 +2578,7 @@ static inline uint32_t A6XX_GRAS_SU_CNTL_LINEHALFWIDTH(float val)
 	return ((((int32_t)(val * 4.0))) << A6XX_GRAS_SU_CNTL_LINEHALFWIDTH__SHIFT) & A6XX_GRAS_SU_CNTL_LINEHALFWIDTH__MASK;
 }
 #define A6XX_GRAS_SU_CNTL_POLY_OFFSET				0x00000800
-#define A6XX_GRAS_SU_CNTL_UNK12__MASK				0x00001000
-#define A6XX_GRAS_SU_CNTL_UNK12__SHIFT				12
-static inline uint32_t A6XX_GRAS_SU_CNTL_UNK12(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_SU_CNTL_UNK12__SHIFT) & A6XX_GRAS_SU_CNTL_UNK12__MASK;
-}
+#define A6XX_GRAS_SU_CNTL_UNK12					0x00001000
 #define A6XX_GRAS_SU_CNTL_LINE_MODE__MASK			0x00002000
 #define A6XX_GRAS_SU_CNTL_LINE_MODE__SHIFT			13
 static inline uint32_t A6XX_GRAS_SU_CNTL_LINE_MODE(enum a5xx_line_mode val)
@@ -2549,13 +2591,14 @@ static inline uint32_t A6XX_GRAS_SU_CNTL_UNK15(uint32_t val)
 {
 	return ((val) << A6XX_GRAS_SU_CNTL_UNK15__SHIFT) & A6XX_GRAS_SU_CNTL_UNK15__MASK;
 }
-#define A6XX_GRAS_SU_CNTL_UNK17					0x00020000
-#define A6XX_GRAS_SU_CNTL_MULTIVIEW_ENABLE			0x00040000
-#define A6XX_GRAS_SU_CNTL_UNK19__MASK				0x00780000
-#define A6XX_GRAS_SU_CNTL_UNK19__SHIFT				19
-static inline uint32_t A6XX_GRAS_SU_CNTL_UNK19(uint32_t val)
+#define A6XX_GRAS_SU_CNTL_MULTIVIEW_ENABLE			0x00020000
+#define A6XX_GRAS_SU_CNTL_RENDERTARGETINDEXINCR			0x00040000
+#define A6XX_GRAS_SU_CNTL_VIEWPORTINDEXINCR			0x00080000
+#define A6XX_GRAS_SU_CNTL_UNK20__MASK				0x00700000
+#define A6XX_GRAS_SU_CNTL_UNK20__SHIFT				20
+static inline uint32_t A6XX_GRAS_SU_CNTL_UNK20(uint32_t val)
 {
-	return ((val) << A6XX_GRAS_SU_CNTL_UNK19__SHIFT) & A6XX_GRAS_SU_CNTL_UNK19__MASK;
+	return ((val) << A6XX_GRAS_SU_CNTL_UNK20__SHIFT) & A6XX_GRAS_SU_CNTL_UNK20__MASK;
 }
 
 #define REG_A6XX_GRAS_SU_POINT_MINMAX				0x00008091
@@ -2619,12 +2662,7 @@ static inline uint32_t A6XX_GRAS_SU_DEPTH_BUFFER_INFO_DEPTH_FORMAT(enum a6xx_dep
 {
 	return ((val) << A6XX_GRAS_SU_DEPTH_BUFFER_INFO_DEPTH_FORMAT__SHIFT) & A6XX_GRAS_SU_DEPTH_BUFFER_INFO_DEPTH_FORMAT__MASK;
 }
-#define A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3__MASK		0x00000008
-#define A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3__SHIFT		3
-static inline uint32_t A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3__SHIFT) & A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3__MASK;
-}
+#define A6XX_GRAS_SU_DEPTH_BUFFER_INFO_UNK3			0x00000008
 
 #define REG_A6XX_GRAS_SU_CONSERVATIVE_RAS_CNTL			0x00008099
 #define A6XX_GRAS_SU_CONSERVATIVE_RAS_CNTL_CONSERVATIVERASEN	0x00000001
@@ -2703,13 +2741,15 @@ static inline uint32_t A6XX_GRAS_SC_CNTL_ROTATION(uint32_t val)
 #define A6XX_GRAS_BIN_CONTROL_BINW__SHIFT			0
 static inline uint32_t A6XX_GRAS_BIN_CONTROL_BINW(uint32_t val)
 {
-	return ((val >> 5) << A6XX_GRAS_BIN_CONTROL_BINW__SHIFT) & A6XX_GRAS_BIN_CONTROL_BINW__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_GRAS_BIN_CONTROL_BINW__SHIFT) & A6XX_GRAS_BIN_CONTROL_BINW__MASK;
 }
 #define A6XX_GRAS_BIN_CONTROL_BINH__MASK			0x00007f00
 #define A6XX_GRAS_BIN_CONTROL_BINH__SHIFT			8
 static inline uint32_t A6XX_GRAS_BIN_CONTROL_BINH(uint32_t val)
 {
-	return ((val >> 4) << A6XX_GRAS_BIN_CONTROL_BINH__SHIFT) & A6XX_GRAS_BIN_CONTROL_BINH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_GRAS_BIN_CONTROL_BINH__SHIFT) & A6XX_GRAS_BIN_CONTROL_BINH__MASK;
 }
 #define A6XX_GRAS_BIN_CONTROL_RENDER_MODE__MASK			0x001c0000
 #define A6XX_GRAS_BIN_CONTROL_RENDER_MODE__SHIFT		18
@@ -2730,12 +2770,7 @@ static inline uint32_t A6XX_GRAS_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK(uint32_t va
 {
 	return ((val) << A6XX_GRAS_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__SHIFT) & A6XX_GRAS_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__MASK;
 }
-#define A6XX_GRAS_BIN_CONTROL_UNK27__MASK			0x08000000
-#define A6XX_GRAS_BIN_CONTROL_UNK27__SHIFT			27
-static inline uint32_t A6XX_GRAS_BIN_CONTROL_UNK27(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_BIN_CONTROL_UNK27__SHIFT) & A6XX_GRAS_BIN_CONTROL_UNK27__MASK;
-}
+#define A6XX_GRAS_BIN_CONTROL_UNK27				0x08000000
 
 #define REG_A6XX_GRAS_RAS_MSAA_CNTL				0x000080a2
 #define A6XX_GRAS_RAS_MSAA_CNTL_SAMPLES__MASK			0x00000003
@@ -2744,18 +2779,8 @@ static inline uint32_t A6XX_GRAS_RAS_MSAA_CNTL_SAMPLES(enum a3xx_msaa_samples va
 {
 	return ((val) << A6XX_GRAS_RAS_MSAA_CNTL_SAMPLES__SHIFT) & A6XX_GRAS_RAS_MSAA_CNTL_SAMPLES__MASK;
 }
-#define A6XX_GRAS_RAS_MSAA_CNTL_UNK2__MASK			0x00000004
-#define A6XX_GRAS_RAS_MSAA_CNTL_UNK2__SHIFT			2
-static inline uint32_t A6XX_GRAS_RAS_MSAA_CNTL_UNK2(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_RAS_MSAA_CNTL_UNK2__SHIFT) & A6XX_GRAS_RAS_MSAA_CNTL_UNK2__MASK;
-}
-#define A6XX_GRAS_RAS_MSAA_CNTL_UNK3__MASK			0x00000008
-#define A6XX_GRAS_RAS_MSAA_CNTL_UNK3__SHIFT			3
-static inline uint32_t A6XX_GRAS_RAS_MSAA_CNTL_UNK3(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_RAS_MSAA_CNTL_UNK3__SHIFT) & A6XX_GRAS_RAS_MSAA_CNTL_UNK3__MASK;
-}
+#define A6XX_GRAS_RAS_MSAA_CNTL_UNK2				0x00000004
+#define A6XX_GRAS_RAS_MSAA_CNTL_UNK3				0x00000008
 
 #define REG_A6XX_GRAS_DEST_MSAA_CNTL				0x000080a3
 #define A6XX_GRAS_DEST_MSAA_CNTL_SAMPLES__MASK			0x00000003
@@ -2775,49 +2800,49 @@ static inline uint32_t A6XX_GRAS_DEST_MSAA_CNTL_SAMPLES(enum a3xx_msaa_samples v
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
 }
 
 #define REG_A6XX_GRAS_SAMPLE_LOCATION_1				0x000080a6
@@ -2825,54 +2850,56 @@ static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
 }
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_GRAS_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
 }
 
+#define REG_A7XX_GRAS_UNKNOWN_80A7				0x000080a7
+
 #define REG_A6XX_GRAS_UNKNOWN_80AF				0x000080af
 
-static inline uint32_t REG_A6XX_GRAS_SC_SCREEN_SCISSOR(uint32_t i0) { return 0x000080b0 + 0x2*i0; }
+#define REG_A6XX_GRAS_SC_SCREEN_SCISSOR(i0) (0x000080b0 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_GRAS_SC_SCREEN_SCISSOR_TL(uint32_t i0) { return 0x000080b0 + 0x2*i0; }
 #define A6XX_GRAS_SC_SCREEN_SCISSOR_TL_X__MASK			0x0000ffff
@@ -2902,7 +2929,7 @@ static inline uint32_t A6XX_GRAS_SC_SCREEN_SCISSOR_BR_Y(uint32_t val)
 	return ((val) << A6XX_GRAS_SC_SCREEN_SCISSOR_BR_Y__SHIFT) & A6XX_GRAS_SC_SCREEN_SCISSOR_BR_Y__MASK;
 }
 
-static inline uint32_t REG_A6XX_GRAS_SC_VIEWPORT_SCISSOR(uint32_t i0) { return 0x000080d0 + 0x2*i0; }
+#define REG_A6XX_GRAS_SC_VIEWPORT_SCISSOR(i0) (0x000080d0 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_GRAS_SC_VIEWPORT_SCISSOR_TL(uint32_t i0) { return 0x000080d0 + 0x2*i0; }
 #define A6XX_GRAS_SC_VIEWPORT_SCISSOR_TL_X__MASK		0x0000ffff
@@ -2960,6 +2987,18 @@ static inline uint32_t A6XX_GRAS_SC_WINDOW_SCISSOR_BR_Y(uint32_t val)
 	return ((val) << A6XX_GRAS_SC_WINDOW_SCISSOR_BR_Y__SHIFT) & A6XX_GRAS_SC_WINDOW_SCISSOR_BR_Y__MASK;
 }
 
+#define REG_A7XX_GRAS_UNKNOWN_80F4				0x000080f4
+
+#define REG_A7XX_GRAS_UNKNOWN_80F5				0x000080f5
+
+#define REG_A7XX_GRAS_UNKNOWN_80F6				0x000080f6
+
+#define REG_A7XX_GRAS_UNKNOWN_80F8				0x000080f8
+
+#define REG_A7XX_GRAS_UNKNOWN_80F9				0x000080f9
+
+#define REG_A7XX_GRAS_UNKNOWN_80FA				0x000080fa
+
 #define REG_A6XX_GRAS_LRZ_CNTL					0x00008100
 #define A6XX_GRAS_LRZ_CNTL_ENABLE				0x00000001
 #define A6XX_GRAS_LRZ_CNTL_LRZ_WRITE				0x00000002
@@ -2975,6 +3014,12 @@ static inline uint32_t A6XX_GRAS_LRZ_CNTL_DIR(enum a6xx_lrz_dir_status val)
 }
 #define A6XX_GRAS_LRZ_CNTL_DIR_WRITE				0x00000100
 #define A6XX_GRAS_LRZ_CNTL_DISABLE_ON_WRONG_DIR			0x00000200
+#define A6XX_GRAS_LRZ_CNTL_Z_FUNC__MASK				0x00003800
+#define A6XX_GRAS_LRZ_CNTL_Z_FUNC__SHIFT			11
+static inline uint32_t A6XX_GRAS_LRZ_CNTL_Z_FUNC(enum adreno_compare_func val)
+{
+	return ((val) << A6XX_GRAS_LRZ_CNTL_Z_FUNC__SHIFT) & A6XX_GRAS_LRZ_CNTL_Z_FUNC__MASK;
+}
 
 #define REG_A6XX_GRAS_LRZ_PS_INPUT_CNTL				0x00008101
 #define A6XX_GRAS_LRZ_PS_INPUT_CNTL_SAMPLEID			0x00000001
@@ -2994,34 +3039,24 @@ static inline uint32_t A6XX_GRAS_LRZ_MRT_BUF_INFO_0_COLOR_FORMAT(enum a6xx_forma
 }
 
 #define REG_A6XX_GRAS_LRZ_BUFFER_BASE				0x00008103
-#define A6XX_GRAS_LRZ_BUFFER_BASE__MASK				0xffffffff
-#define A6XX_GRAS_LRZ_BUFFER_BASE__SHIFT			0
-static inline uint32_t A6XX_GRAS_LRZ_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_LRZ_BUFFER_BASE__SHIFT) & A6XX_GRAS_LRZ_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_GRAS_LRZ_BUFFER_PITCH				0x00008105
 #define A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__MASK			0x000000ff
 #define A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__SHIFT			0
 static inline uint32_t A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 5) << A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__SHIFT) & A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__SHIFT) & A6XX_GRAS_LRZ_BUFFER_PITCH_PITCH__MASK;
 }
 #define A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__MASK		0x1ffffc00
 #define A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__SHIFT		10
 static inline uint32_t A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 4) << A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_GRAS_LRZ_BUFFER_PITCH_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE		0x00008106
-#define A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE__MASK		0xffffffff
-#define A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE__SHIFT		0
-static inline uint32_t A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE__SHIFT) & A6XX_GRAS_LRZ_FAST_CLEAR_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_GRAS_SAMPLE_CNTL				0x00008109
 #define A6XX_GRAS_SAMPLE_CNTL_PER_SAMP_MODE			0x00000001
@@ -3046,8 +3081,24 @@ static inline uint32_t A6XX_GRAS_LRZ_DEPTH_VIEW_BASE_MIP_LEVEL(uint32_t val)
 	return ((val) << A6XX_GRAS_LRZ_DEPTH_VIEW_BASE_MIP_LEVEL__SHIFT) & A6XX_GRAS_LRZ_DEPTH_VIEW_BASE_MIP_LEVEL__MASK;
 }
 
+#define REG_A7XX_GRAS_UNKNOWN_810B				0x0000810b
+
 #define REG_A6XX_GRAS_UNKNOWN_8110				0x00008110
 
+#define REG_A7XX_GRAS_LRZ_CLEAR_DEPTH_F32			0x00008111
+#define A7XX_GRAS_LRZ_CLEAR_DEPTH_F32__MASK			0xffffffff
+#define A7XX_GRAS_LRZ_CLEAR_DEPTH_F32__SHIFT			0
+static inline uint32_t A7XX_GRAS_LRZ_CLEAR_DEPTH_F32(float val)
+{
+	return ((fui(val)) << A7XX_GRAS_LRZ_CLEAR_DEPTH_F32__SHIFT) & A7XX_GRAS_LRZ_CLEAR_DEPTH_F32__MASK;
+}
+
+#define REG_A7XX_GRAS_UNKNOWN_8113				0x00008113
+
+#define REG_A7XX_GRAS_UNKNOWN_8120				0x00008120
+
+#define REG_A7XX_GRAS_UNKNOWN_8121				0x00008121
+
 #define REG_A6XX_GRAS_2D_BLIT_CNTL				0x00008400
 #define A6XX_GRAS_2D_BLIT_CNTL_ROTATE__MASK			0x00000007
 #define A6XX_GRAS_2D_BLIT_CNTL_ROTATE__SHIFT			0
@@ -3095,14 +3146,39 @@ static inline uint32_t A6XX_GRAS_2D_BLIT_CNTL_RASTER_MODE(enum a6xx_raster_mode
 {
 	return ((val) << A6XX_GRAS_2D_BLIT_CNTL_RASTER_MODE__SHIFT) & A6XX_GRAS_2D_BLIT_CNTL_RASTER_MODE__MASK;
 }
+#define A6XX_GRAS_2D_BLIT_CNTL_UNK30				0x40000000
 
 #define REG_A6XX_GRAS_2D_SRC_TL_X				0x00008401
+#define A6XX_GRAS_2D_SRC_TL_X__MASK				0x01ffff00
+#define A6XX_GRAS_2D_SRC_TL_X__SHIFT				8
+static inline uint32_t A6XX_GRAS_2D_SRC_TL_X(int32_t val)
+{
+	return ((val) << A6XX_GRAS_2D_SRC_TL_X__SHIFT) & A6XX_GRAS_2D_SRC_TL_X__MASK;
+}
 
 #define REG_A6XX_GRAS_2D_SRC_BR_X				0x00008402
+#define A6XX_GRAS_2D_SRC_BR_X__MASK				0x01ffff00
+#define A6XX_GRAS_2D_SRC_BR_X__SHIFT				8
+static inline uint32_t A6XX_GRAS_2D_SRC_BR_X(int32_t val)
+{
+	return ((val) << A6XX_GRAS_2D_SRC_BR_X__SHIFT) & A6XX_GRAS_2D_SRC_BR_X__MASK;
+}
 
 #define REG_A6XX_GRAS_2D_SRC_TL_Y				0x00008403
+#define A6XX_GRAS_2D_SRC_TL_Y__MASK				0x01ffff00
+#define A6XX_GRAS_2D_SRC_TL_Y__SHIFT				8
+static inline uint32_t A6XX_GRAS_2D_SRC_TL_Y(int32_t val)
+{
+	return ((val) << A6XX_GRAS_2D_SRC_TL_Y__SHIFT) & A6XX_GRAS_2D_SRC_TL_Y__MASK;
+}
 
 #define REG_A6XX_GRAS_2D_SRC_BR_Y				0x00008404
+#define A6XX_GRAS_2D_SRC_BR_Y__MASK				0x01ffff00
+#define A6XX_GRAS_2D_SRC_BR_Y__SHIFT				8
+static inline uint32_t A6XX_GRAS_2D_SRC_BR_Y(int32_t val)
+{
+	return ((val) << A6XX_GRAS_2D_SRC_BR_Y__SHIFT) & A6XX_GRAS_2D_SRC_BR_Y__MASK;
+}
 
 #define REG_A6XX_GRAS_2D_DST_TL					0x00008405
 #define A6XX_GRAS_2D_DST_TL_X__MASK				0x00003fff
@@ -3174,24 +3250,26 @@ static inline uint32_t A6XX_GRAS_2D_RESOLVE_CNTL_2_Y(uint32_t val)
 
 #define REG_A7XX_GRAS_NC_MODE_CNTL				0x00008602
 
-static inline uint32_t REG_A6XX_GRAS_PERFCTR_TSE_SEL(uint32_t i0) { return 0x00008610 + 0x1*i0; }
+#define REG_A6XX_GRAS_PERFCTR_TSE_SEL(i0) (0x00008610 + 0x1*(i0))
 
-static inline uint32_t REG_A6XX_GRAS_PERFCTR_RAS_SEL(uint32_t i0) { return 0x00008614 + 0x1*i0; }
+#define REG_A6XX_GRAS_PERFCTR_RAS_SEL(i0) (0x00008614 + 0x1*(i0))
 
-static inline uint32_t REG_A6XX_GRAS_PERFCTR_LRZ_SEL(uint32_t i0) { return 0x00008618 + 0x1*i0; }
+#define REG_A6XX_GRAS_PERFCTR_LRZ_SEL(i0) (0x00008618 + 0x1*(i0))
 
 #define REG_A6XX_RB_BIN_CONTROL					0x00008800
 #define A6XX_RB_BIN_CONTROL_BINW__MASK				0x0000003f
 #define A6XX_RB_BIN_CONTROL_BINW__SHIFT				0
 static inline uint32_t A6XX_RB_BIN_CONTROL_BINW(uint32_t val)
 {
-	return ((val >> 5) << A6XX_RB_BIN_CONTROL_BINW__SHIFT) & A6XX_RB_BIN_CONTROL_BINW__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_RB_BIN_CONTROL_BINW__SHIFT) & A6XX_RB_BIN_CONTROL_BINW__MASK;
 }
 #define A6XX_RB_BIN_CONTROL_BINH__MASK				0x00007f00
 #define A6XX_RB_BIN_CONTROL_BINH__SHIFT				8
 static inline uint32_t A6XX_RB_BIN_CONTROL_BINH(uint32_t val)
 {
-	return ((val >> 4) << A6XX_RB_BIN_CONTROL_BINH__SHIFT) & A6XX_RB_BIN_CONTROL_BINH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_RB_BIN_CONTROL_BINH__SHIFT) & A6XX_RB_BIN_CONTROL_BINH__MASK;
 }
 #define A6XX_RB_BIN_CONTROL_RENDER_MODE__MASK			0x001c0000
 #define A6XX_RB_BIN_CONTROL_RENDER_MODE__SHIFT			18
@@ -3213,6 +3291,35 @@ static inline uint32_t A6XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK(uint32_t val)
 	return ((val) << A6XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__SHIFT) & A6XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__MASK;
 }
 
+#define REG_A7XX_RB_BIN_CONTROL					0x00008800
+#define A7XX_RB_BIN_CONTROL_BINW__MASK				0x0000003f
+#define A7XX_RB_BIN_CONTROL_BINW__SHIFT				0
+static inline uint32_t A7XX_RB_BIN_CONTROL_BINW(uint32_t val)
+{
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A7XX_RB_BIN_CONTROL_BINW__SHIFT) & A7XX_RB_BIN_CONTROL_BINW__MASK;
+}
+#define A7XX_RB_BIN_CONTROL_BINH__MASK				0x00007f00
+#define A7XX_RB_BIN_CONTROL_BINH__SHIFT				8
+static inline uint32_t A7XX_RB_BIN_CONTROL_BINH(uint32_t val)
+{
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A7XX_RB_BIN_CONTROL_BINH__SHIFT) & A7XX_RB_BIN_CONTROL_BINH__MASK;
+}
+#define A7XX_RB_BIN_CONTROL_RENDER_MODE__MASK			0x001c0000
+#define A7XX_RB_BIN_CONTROL_RENDER_MODE__SHIFT			18
+static inline uint32_t A7XX_RB_BIN_CONTROL_RENDER_MODE(enum a6xx_render_mode val)
+{
+	return ((val) << A7XX_RB_BIN_CONTROL_RENDER_MODE__SHIFT) & A7XX_RB_BIN_CONTROL_RENDER_MODE__MASK;
+}
+#define A7XX_RB_BIN_CONTROL_FORCE_LRZ_WRITE_DIS			0x00200000
+#define A7XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__MASK	0x07000000
+#define A7XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__SHIFT	24
+static inline uint32_t A7XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK(uint32_t val)
+{
+	return ((val) << A7XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__SHIFT) & A7XX_RB_BIN_CONTROL_LRZ_FEEDBACK_ZMODE_MASK__MASK;
+}
+
 #define REG_A6XX_RB_RENDER_CNTL					0x00008801
 #define A6XX_RB_RENDER_CNTL_CCUSINGLECACHELINESIZE__MASK	0x00000038
 #define A6XX_RB_RENDER_CNTL_CCUSINGLECACHELINESIZE__SHIFT	3
@@ -3250,6 +3357,24 @@ static inline uint32_t A6XX_RB_RENDER_CNTL_FLAG_MRTS(uint32_t val)
 	return ((val) << A6XX_RB_RENDER_CNTL_FLAG_MRTS__SHIFT) & A6XX_RB_RENDER_CNTL_FLAG_MRTS__MASK;
 }
 
+#define REG_A7XX_RB_RENDER_CNTL					0x00008801
+#define A7XX_RB_RENDER_CNTL_EARLYVIZOUTEN			0x00000040
+#define A7XX_RB_RENDER_CNTL_BINNING				0x00000080
+#define A7XX_RB_RENDER_CNTL_RASTER_MODE__MASK			0x00000100
+#define A7XX_RB_RENDER_CNTL_RASTER_MODE__SHIFT			8
+static inline uint32_t A7XX_RB_RENDER_CNTL_RASTER_MODE(enum a6xx_raster_mode val)
+{
+	return ((val) << A7XX_RB_RENDER_CNTL_RASTER_MODE__SHIFT) & A7XX_RB_RENDER_CNTL_RASTER_MODE__MASK;
+}
+#define A7XX_RB_RENDER_CNTL_RASTER_DIRECTION__MASK		0x00000600
+#define A7XX_RB_RENDER_CNTL_RASTER_DIRECTION__SHIFT		9
+static inline uint32_t A7XX_RB_RENDER_CNTL_RASTER_DIRECTION(enum a6xx_raster_direction val)
+{
+	return ((val) << A7XX_RB_RENDER_CNTL_RASTER_DIRECTION__SHIFT) & A7XX_RB_RENDER_CNTL_RASTER_DIRECTION__MASK;
+}
+#define A7XX_RB_RENDER_CNTL_CONSERVATIVERASEN			0x00000800
+#define A7XX_RB_RENDER_CNTL_INNERCONSERVATIVERASEN		0x00001000
+
 #define REG_A6XX_RB_RAS_MSAA_CNTL				0x00008802
 #define A6XX_RB_RAS_MSAA_CNTL_SAMPLES__MASK			0x00000003
 #define A6XX_RB_RAS_MSAA_CNTL_SAMPLES__SHIFT			0
@@ -3257,18 +3382,8 @@ static inline uint32_t A6XX_RB_RAS_MSAA_CNTL_SAMPLES(enum a3xx_msaa_samples val)
 {
 	return ((val) << A6XX_RB_RAS_MSAA_CNTL_SAMPLES__SHIFT) & A6XX_RB_RAS_MSAA_CNTL_SAMPLES__MASK;
 }
-#define A6XX_RB_RAS_MSAA_CNTL_UNK2__MASK			0x00000004
-#define A6XX_RB_RAS_MSAA_CNTL_UNK2__SHIFT			2
-static inline uint32_t A6XX_RB_RAS_MSAA_CNTL_UNK2(uint32_t val)
-{
-	return ((val) << A6XX_RB_RAS_MSAA_CNTL_UNK2__SHIFT) & A6XX_RB_RAS_MSAA_CNTL_UNK2__MASK;
-}
-#define A6XX_RB_RAS_MSAA_CNTL_UNK3__MASK			0x00000008
-#define A6XX_RB_RAS_MSAA_CNTL_UNK3__SHIFT			3
-static inline uint32_t A6XX_RB_RAS_MSAA_CNTL_UNK3(uint32_t val)
-{
-	return ((val) << A6XX_RB_RAS_MSAA_CNTL_UNK3__SHIFT) & A6XX_RB_RAS_MSAA_CNTL_UNK3__MASK;
-}
+#define A6XX_RB_RAS_MSAA_CNTL_UNK2				0x00000004
+#define A6XX_RB_RAS_MSAA_CNTL_UNK3				0x00000008
 
 #define REG_A6XX_RB_DEST_MSAA_CNTL				0x00008803
 #define A6XX_RB_DEST_MSAA_CNTL_SAMPLES__MASK			0x00000003
@@ -3288,49 +3403,49 @@ static inline uint32_t A6XX_RB_DEST_MSAA_CNTL_SAMPLES(enum a3xx_msaa_samples val
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
 }
 
 #define REG_A6XX_RB_SAMPLE_LOCATION_1				0x00008806
@@ -3338,49 +3453,49 @@ static inline uint32_t A6XX_RB_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
 }
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_RB_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
 }
 
 #define REG_A6XX_RB_RENDER_CONTROL0				0x00008809
@@ -3514,7 +3629,7 @@ static inline uint32_t A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT5(enum adreno_rb_dithe
 {
 	return ((val) << A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT5__SHIFT) & A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT5__MASK;
 }
-#define A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT6__MASK		0x00001000
+#define A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT6__MASK		0x00003000
 #define A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT6__SHIFT		12
 static inline uint32_t A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT6(enum adreno_rb_dither_mode val)
 {
@@ -3542,6 +3657,8 @@ static inline uint32_t A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT7(enum adreno_rb_dithe
 
 #define REG_A6XX_RB_UNKNOWN_8811				0x00008811
 
+#define REG_A7XX_RB_UNKNOWN_8812				0x00008812
+
 #define REG_A6XX_RB_UNKNOWN_8818				0x00008818
 
 #define REG_A6XX_RB_UNKNOWN_8819				0x00008819
@@ -3556,7 +3673,7 @@ static inline uint32_t A6XX_RB_DITHER_CNTL_DITHER_MODE_MRT7(enum adreno_rb_dithe
 
 #define REG_A6XX_RB_UNKNOWN_881E				0x0000881e
 
-static inline uint32_t REG_A6XX_RB_MRT(uint32_t i0) { return 0x00008820 + 0x8*i0; }
+#define REG_A6XX_RB_MRT(i0) (0x00008820 + 0x8*(i0))
 
 static inline uint32_t REG_A6XX_RB_MRT_CONTROL(uint32_t i0) { return 0x00008820 + 0x8*i0; }
 #define A6XX_RB_MRT_CONTROL_BLEND				0x00000001
@@ -3626,12 +3743,7 @@ static inline uint32_t A6XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE(enum a6xx_tile_mode
 {
 	return ((val) << A6XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__SHIFT) & A6XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__MASK;
 }
-#define A6XX_RB_MRT_BUF_INFO_UNK10__MASK			0x00000400
-#define A6XX_RB_MRT_BUF_INFO_UNK10__SHIFT			10
-static inline uint32_t A6XX_RB_MRT_BUF_INFO_UNK10(uint32_t val)
-{
-	return ((val) << A6XX_RB_MRT_BUF_INFO_UNK10__SHIFT) & A6XX_RB_MRT_BUF_INFO_UNK10__MASK;
-}
+#define A6XX_RB_MRT_BUF_INFO_UNK10				0x00000400
 #define A6XX_RB_MRT_BUF_INFO_COLOR_SWAP__MASK			0x00006000
 #define A6XX_RB_MRT_BUF_INFO_COLOR_SWAP__SHIFT			13
 static inline uint32_t A6XX_RB_MRT_BUF_INFO_COLOR_SWAP(enum a3xx_color_swap val)
@@ -3639,37 +3751,49 @@ static inline uint32_t A6XX_RB_MRT_BUF_INFO_COLOR_SWAP(enum a3xx_color_swap val)
 	return ((val) << A6XX_RB_MRT_BUF_INFO_COLOR_SWAP__SHIFT) & A6XX_RB_MRT_BUF_INFO_COLOR_SWAP__MASK;
 }
 
+static inline uint32_t REG_A7XX_RB_MRT_BUF_INFO(uint32_t i0) { return 0x00008822 + 0x8*i0; }
+#define A7XX_RB_MRT_BUF_INFO_COLOR_FORMAT__MASK			0x000000ff
+#define A7XX_RB_MRT_BUF_INFO_COLOR_FORMAT__SHIFT		0
+static inline uint32_t A7XX_RB_MRT_BUF_INFO_COLOR_FORMAT(enum a6xx_format val)
+{
+	return ((val) << A7XX_RB_MRT_BUF_INFO_COLOR_FORMAT__SHIFT) & A7XX_RB_MRT_BUF_INFO_COLOR_FORMAT__MASK;
+}
+#define A7XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__MASK		0x00000300
+#define A7XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__SHIFT		8
+static inline uint32_t A7XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE(enum a6xx_tile_mode val)
+{
+	return ((val) << A7XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__SHIFT) & A7XX_RB_MRT_BUF_INFO_COLOR_TILE_MODE__MASK;
+}
+#define A7XX_RB_MRT_BUF_INFO_UNK10				0x00000400
+#define A7XX_RB_MRT_BUF_INFO_LOSSLESSCOMPEN			0x00000800
+#define A7XX_RB_MRT_BUF_INFO_COLOR_SWAP__MASK			0x00006000
+#define A7XX_RB_MRT_BUF_INFO_COLOR_SWAP__SHIFT			13
+static inline uint32_t A7XX_RB_MRT_BUF_INFO_COLOR_SWAP(enum a3xx_color_swap val)
+{
+	return ((val) << A7XX_RB_MRT_BUF_INFO_COLOR_SWAP__SHIFT) & A7XX_RB_MRT_BUF_INFO_COLOR_SWAP__MASK;
+}
+
 static inline uint32_t REG_A6XX_RB_MRT_PITCH(uint32_t i0) { return 0x00008823 + 0x8*i0; }
-#define A6XX_RB_MRT_PITCH__MASK					0x0000ffff
+#define A6XX_RB_MRT_PITCH__MASK					0xffffffff
 #define A6XX_RB_MRT_PITCH__SHIFT				0
 static inline uint32_t A6XX_RB_MRT_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_MRT_PITCH__SHIFT) & A6XX_RB_MRT_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_MRT_PITCH__SHIFT) & A6XX_RB_MRT_PITCH__MASK;
 }
 
 static inline uint32_t REG_A6XX_RB_MRT_ARRAY_PITCH(uint32_t i0) { return 0x00008824 + 0x8*i0; }
-#define A6XX_RB_MRT_ARRAY_PITCH__MASK				0x1fffffff
+#define A6XX_RB_MRT_ARRAY_PITCH__MASK				0xffffffff
 #define A6XX_RB_MRT_ARRAY_PITCH__SHIFT				0
 static inline uint32_t A6XX_RB_MRT_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_MRT_ARRAY_PITCH__SHIFT) & A6XX_RB_MRT_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_MRT_ARRAY_PITCH__SHIFT) & A6XX_RB_MRT_ARRAY_PITCH__MASK;
 }
 
 static inline uint32_t REG_A6XX_RB_MRT_BASE(uint32_t i0) { return 0x00008825 + 0x8*i0; }
-#define A6XX_RB_MRT_BASE__MASK					0xffffffff
-#define A6XX_RB_MRT_BASE__SHIFT					0
-static inline uint32_t A6XX_RB_MRT_BASE(uint32_t val)
-{
-	return ((val) << A6XX_RB_MRT_BASE__SHIFT) & A6XX_RB_MRT_BASE__MASK;
-}
 
 static inline uint32_t REG_A6XX_RB_MRT_BASE_GMEM(uint32_t i0) { return 0x00008827 + 0x8*i0; }
-#define A6XX_RB_MRT_BASE_GMEM__MASK				0xfffff000
-#define A6XX_RB_MRT_BASE_GMEM__SHIFT				12
-static inline uint32_t A6XX_RB_MRT_BASE_GMEM(uint32_t val)
-{
-	return ((val >> 12) << A6XX_RB_MRT_BASE_GMEM__SHIFT) & A6XX_RB_MRT_BASE_GMEM__MASK;
-}
 
 #define REG_A6XX_RB_BLEND_RED_F32				0x00008860
 #define A6XX_RB_BLEND_RED_F32__MASK				0xffffffff
@@ -3771,12 +3895,34 @@ static inline uint32_t A6XX_RB_DEPTH_BUFFER_INFO_UNK3(uint32_t val)
 	return ((val) << A6XX_RB_DEPTH_BUFFER_INFO_UNK3__SHIFT) & A6XX_RB_DEPTH_BUFFER_INFO_UNK3__MASK;
 }
 
+#define REG_A7XX_RB_DEPTH_BUFFER_INFO				0x00008872
+#define A7XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT__MASK		0x00000007
+#define A7XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT__SHIFT		0
+static inline uint32_t A7XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT(enum a6xx_depth_format val)
+{
+	return ((val) << A7XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT__SHIFT) & A7XX_RB_DEPTH_BUFFER_INFO_DEPTH_FORMAT__MASK;
+}
+#define A7XX_RB_DEPTH_BUFFER_INFO_UNK3__MASK			0x00000018
+#define A7XX_RB_DEPTH_BUFFER_INFO_UNK3__SHIFT			3
+static inline uint32_t A7XX_RB_DEPTH_BUFFER_INFO_UNK3(uint32_t val)
+{
+	return ((val) << A7XX_RB_DEPTH_BUFFER_INFO_UNK3__SHIFT) & A7XX_RB_DEPTH_BUFFER_INFO_UNK3__MASK;
+}
+#define A7XX_RB_DEPTH_BUFFER_INFO_TILEMODE__MASK		0x00000060
+#define A7XX_RB_DEPTH_BUFFER_INFO_TILEMODE__SHIFT		5
+static inline uint32_t A7XX_RB_DEPTH_BUFFER_INFO_TILEMODE(enum a6xx_tile_mode val)
+{
+	return ((val) << A7XX_RB_DEPTH_BUFFER_INFO_TILEMODE__SHIFT) & A7XX_RB_DEPTH_BUFFER_INFO_TILEMODE__MASK;
+}
+#define A7XX_RB_DEPTH_BUFFER_INFO_LOSSLESSCOMPEN		0x00000080
+
 #define REG_A6XX_RB_DEPTH_BUFFER_PITCH				0x00008873
 #define A6XX_RB_DEPTH_BUFFER_PITCH__MASK			0x00003fff
 #define A6XX_RB_DEPTH_BUFFER_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_DEPTH_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_DEPTH_BUFFER_PITCH__SHIFT) & A6XX_RB_DEPTH_BUFFER_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_DEPTH_BUFFER_PITCH__SHIFT) & A6XX_RB_DEPTH_BUFFER_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH			0x00008874
@@ -3784,24 +3930,13 @@ static inline uint32_t A6XX_RB_DEPTH_BUFFER_PITCH(uint32_t val)
 #define A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_RB_DEPTH_BUFFER_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_DEPTH_BUFFER_BASE				0x00008875
-#define A6XX_RB_DEPTH_BUFFER_BASE__MASK				0xffffffff
-#define A6XX_RB_DEPTH_BUFFER_BASE__SHIFT			0
-static inline uint32_t A6XX_RB_DEPTH_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_RB_DEPTH_BUFFER_BASE__SHIFT) & A6XX_RB_DEPTH_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_RB_DEPTH_BUFFER_BASE_GMEM			0x00008877
-#define A6XX_RB_DEPTH_BUFFER_BASE_GMEM__MASK			0xfffff000
-#define A6XX_RB_DEPTH_BUFFER_BASE_GMEM__SHIFT			12
-static inline uint32_t A6XX_RB_DEPTH_BUFFER_BASE_GMEM(uint32_t val)
-{
-	return ((val >> 12) << A6XX_RB_DEPTH_BUFFER_BASE_GMEM__SHIFT) & A6XX_RB_DEPTH_BUFFER_BASE_GMEM__MASK;
-}
 
 #define REG_A6XX_RB_Z_BOUNDS_MIN				0x00008878
 #define A6XX_RB_Z_BOUNDS_MIN__MASK				0xffffffff
@@ -3876,12 +4011,23 @@ static inline uint32_t A6XX_RB_STENCIL_CONTROL_ZFAIL_BF(enum adreno_stencil_op v
 #define A6XX_RB_STENCIL_INFO_SEPARATE_STENCIL			0x00000001
 #define A6XX_RB_STENCIL_INFO_UNK1				0x00000002
 
+#define REG_A7XX_RB_STENCIL_INFO				0x00008881
+#define A7XX_RB_STENCIL_INFO_SEPARATE_STENCIL			0x00000001
+#define A7XX_RB_STENCIL_INFO_UNK1				0x00000002
+#define A7XX_RB_STENCIL_INFO_TILEMODE__MASK			0x0000000c
+#define A7XX_RB_STENCIL_INFO_TILEMODE__SHIFT			2
+static inline uint32_t A7XX_RB_STENCIL_INFO_TILEMODE(enum a6xx_tile_mode val)
+{
+	return ((val) << A7XX_RB_STENCIL_INFO_TILEMODE__SHIFT) & A7XX_RB_STENCIL_INFO_TILEMODE__MASK;
+}
+
 #define REG_A6XX_RB_STENCIL_BUFFER_PITCH			0x00008882
 #define A6XX_RB_STENCIL_BUFFER_PITCH__MASK			0x00000fff
 #define A6XX_RB_STENCIL_BUFFER_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_STENCIL_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_STENCIL_BUFFER_PITCH__SHIFT) & A6XX_RB_STENCIL_BUFFER_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_STENCIL_BUFFER_PITCH__SHIFT) & A6XX_RB_STENCIL_BUFFER_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH			0x00008883
@@ -3889,24 +4035,13 @@ static inline uint32_t A6XX_RB_STENCIL_BUFFER_PITCH(uint32_t val)
 #define A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH__SHIFT		0
 static inline uint32_t A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_RB_STENCIL_BUFFER_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_STENCIL_BUFFER_BASE				0x00008884
-#define A6XX_RB_STENCIL_BUFFER_BASE__MASK			0xffffffff
-#define A6XX_RB_STENCIL_BUFFER_BASE__SHIFT			0
-static inline uint32_t A6XX_RB_STENCIL_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_RB_STENCIL_BUFFER_BASE__SHIFT) & A6XX_RB_STENCIL_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_RB_STENCIL_BUFFER_BASE_GMEM			0x00008886
-#define A6XX_RB_STENCIL_BUFFER_BASE_GMEM__MASK			0xfffff000
-#define A6XX_RB_STENCIL_BUFFER_BASE_GMEM__SHIFT			12
-static inline uint32_t A6XX_RB_STENCIL_BUFFER_BASE_GMEM(uint32_t val)
-{
-	return ((val >> 12) << A6XX_RB_STENCIL_BUFFER_BASE_GMEM__SHIFT) & A6XX_RB_STENCIL_BUFFER_BASE_GMEM__MASK;
-}
 
 #define REG_A6XX_RB_STENCILREF					0x00008887
 #define A6XX_RB_STENCILREF_REF__MASK				0x000000ff
@@ -3971,6 +4106,8 @@ static inline uint32_t A6XX_RB_WINDOW_OFFSET_Y(uint32_t val)
 #define REG_A6XX_RB_LRZ_CNTL					0x00008898
 #define A6XX_RB_LRZ_CNTL_ENABLE					0x00000001
 
+#define REG_A7XX_RB_UNKNOWN_8899				0x00008899
+
 #define REG_A6XX_RB_Z_CLAMP_MIN					0x000088c0
 #define A6XX_RB_Z_CLAMP_MIN__MASK				0xffffffff
 #define A6XX_RB_Z_CLAMP_MIN__SHIFT				0
@@ -4034,13 +4171,15 @@ static inline uint32_t A6XX_RB_BLIT_SCISSOR_BR_Y(uint32_t val)
 #define A6XX_RB_BIN_CONTROL2_BINW__SHIFT			0
 static inline uint32_t A6XX_RB_BIN_CONTROL2_BINW(uint32_t val)
 {
-	return ((val >> 5) << A6XX_RB_BIN_CONTROL2_BINW__SHIFT) & A6XX_RB_BIN_CONTROL2_BINW__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_RB_BIN_CONTROL2_BINW__SHIFT) & A6XX_RB_BIN_CONTROL2_BINW__MASK;
 }
 #define A6XX_RB_BIN_CONTROL2_BINH__MASK				0x00007f00
 #define A6XX_RB_BIN_CONTROL2_BINH__SHIFT			8
 static inline uint32_t A6XX_RB_BIN_CONTROL2_BINH(uint32_t val)
 {
-	return ((val >> 4) << A6XX_RB_BIN_CONTROL2_BINH__SHIFT) & A6XX_RB_BIN_CONTROL2_BINH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_RB_BIN_CONTROL2_BINH__SHIFT) & A6XX_RB_BIN_CONTROL2_BINH__MASK;
 }
 
 #define REG_A6XX_RB_WINDOW_OFFSET2				0x000088d4
@@ -4066,12 +4205,6 @@ static inline uint32_t A6XX_RB_BLIT_GMEM_MSAA_CNTL_SAMPLES(enum a3xx_msaa_sample
 }
 
 #define REG_A6XX_RB_BLIT_BASE_GMEM				0x000088d6
-#define A6XX_RB_BLIT_BASE_GMEM__MASK				0xfffff000
-#define A6XX_RB_BLIT_BASE_GMEM__SHIFT				12
-static inline uint32_t A6XX_RB_BLIT_BASE_GMEM(uint32_t val)
-{
-	return ((val >> 12) << A6XX_RB_BLIT_BASE_GMEM__SHIFT) & A6XX_RB_BLIT_BASE_GMEM__MASK;
-}
 
 #define REG_A6XX_RB_BLIT_DST_INFO				0x000088d7
 #define A6XX_RB_BLIT_DST_INFO_TILE_MODE__MASK			0x00000003
@@ -4102,19 +4235,14 @@ static inline uint32_t A6XX_RB_BLIT_DST_INFO_COLOR_FORMAT(enum a6xx_format val)
 #define A6XX_RB_BLIT_DST_INFO_UNK15				0x00008000
 
 #define REG_A6XX_RB_BLIT_DST					0x000088d8
-#define A6XX_RB_BLIT_DST__MASK					0xffffffff
-#define A6XX_RB_BLIT_DST__SHIFT					0
-static inline uint32_t A6XX_RB_BLIT_DST(uint32_t val)
-{
-	return ((val) << A6XX_RB_BLIT_DST__SHIFT) & A6XX_RB_BLIT_DST__MASK;
-}
 
 #define REG_A6XX_RB_BLIT_DST_PITCH				0x000088da
 #define A6XX_RB_BLIT_DST_PITCH__MASK				0x0000ffff
 #define A6XX_RB_BLIT_DST_PITCH__SHIFT				0
 static inline uint32_t A6XX_RB_BLIT_DST_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_BLIT_DST_PITCH__SHIFT) & A6XX_RB_BLIT_DST_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_BLIT_DST_PITCH__SHIFT) & A6XX_RB_BLIT_DST_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_BLIT_DST_ARRAY_PITCH			0x000088db
@@ -4122,29 +4250,26 @@ static inline uint32_t A6XX_RB_BLIT_DST_PITCH(uint32_t val)
 #define A6XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_BLIT_DST_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT) & A6XX_RB_BLIT_DST_ARRAY_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_BLIT_DST_ARRAY_PITCH__SHIFT) & A6XX_RB_BLIT_DST_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_BLIT_FLAG_DST				0x000088dc
-#define A6XX_RB_BLIT_FLAG_DST__MASK				0xffffffff
-#define A6XX_RB_BLIT_FLAG_DST__SHIFT				0
-static inline uint32_t A6XX_RB_BLIT_FLAG_DST(uint32_t val)
-{
-	return ((val) << A6XX_RB_BLIT_FLAG_DST__SHIFT) & A6XX_RB_BLIT_FLAG_DST__MASK;
-}
 
 #define REG_A6XX_RB_BLIT_FLAG_DST_PITCH				0x000088de
 #define A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__MASK			0x000007ff
 #define A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__SHIFT		0
 static inline uint32_t A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__SHIFT) & A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__SHIFT) & A6XX_RB_BLIT_FLAG_DST_PITCH_PITCH__MASK;
 }
 #define A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__MASK		0x0ffff800
 #define A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__SHIFT		11
 static inline uint32_t A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 7) << A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__MASK;
+	assert(!(val & 0x7f));
+	return (((val >> 7)) << A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_BLIT_FLAG_DST_PITCH_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_BLIT_CLEAR_COLOR_DW0			0x000088df
@@ -4179,46 +4304,44 @@ static inline uint32_t A6XX_RB_BLIT_INFO_BUFFER_ID(uint32_t val)
 	return ((val) << A6XX_RB_BLIT_INFO_BUFFER_ID__SHIFT) & A6XX_RB_BLIT_INFO_BUFFER_ID__MASK;
 }
 
+#define REG_A7XX_RB_UNKNOWN_88E4				0x000088e4
+#define A7XX_RB_UNKNOWN_88E4_UNK0				0x00000001
+
+#define REG_A7XX_RB_UNKNOWN_88E5				0x000088e5
+
 #define REG_A6XX_RB_UNKNOWN_88F0				0x000088f0
 
 #define REG_A6XX_RB_UNK_FLAG_BUFFER_BASE			0x000088f1
-#define A6XX_RB_UNK_FLAG_BUFFER_BASE__MASK			0xffffffff
-#define A6XX_RB_UNK_FLAG_BUFFER_BASE__SHIFT			0
-static inline uint32_t A6XX_RB_UNK_FLAG_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_RB_UNK_FLAG_BUFFER_BASE__SHIFT) & A6XX_RB_UNK_FLAG_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_RB_UNK_FLAG_BUFFER_PITCH			0x000088f3
 #define A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__MASK		0x000007ff
 #define A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__SHIFT		0
 static inline uint32_t A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_UNK_FLAG_BUFFER_PITCH_PITCH__MASK;
 }
 #define A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK		0x00fff800
 #define A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT	11
 static inline uint32_t A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 7) << A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
+	assert(!(val & 0x7f));
+	return (((val >> 7)) << A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_UNK_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_UNKNOWN_88F4				0x000088f4
 
+#define REG_A7XX_RB_UNKNOWN_88F5				0x000088f5
+
 #define REG_A6XX_RB_DEPTH_FLAG_BUFFER_BASE			0x00008900
-#define A6XX_RB_DEPTH_FLAG_BUFFER_BASE__MASK			0xffffffff
-#define A6XX_RB_DEPTH_FLAG_BUFFER_BASE__SHIFT			0
-static inline uint32_t A6XX_RB_DEPTH_FLAG_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_RB_DEPTH_FLAG_BUFFER_BASE__SHIFT) & A6XX_RB_DEPTH_FLAG_BUFFER_BASE__MASK;
-}
 
 #define REG_A6XX_RB_DEPTH_FLAG_BUFFER_PITCH			0x00008902
 #define A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__MASK		0x0000007f
 #define A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__SHIFT		0
 static inline uint32_t A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_PITCH__MASK;
 }
 #define A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_UNK8__MASK		0x00000700
 #define A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_UNK8__SHIFT		8
@@ -4230,40 +4353,31 @@ static inline uint32_t A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_UNK8(uint32_t val)
 #define A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT	11
 static inline uint32_t A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 7) << A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
+	assert(!(val & 0x7f));
+	return (((val >> 7)) << A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_DEPTH_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
 }
 
-static inline uint32_t REG_A6XX_RB_MRT_FLAG_BUFFER(uint32_t i0) { return 0x00008903 + 0x3*i0; }
+#define REG_A6XX_RB_MRT_FLAG_BUFFER(i0) (0x00008903 + 0x3*(i0))
 
 static inline uint32_t REG_A6XX_RB_MRT_FLAG_BUFFER_ADDR(uint32_t i0) { return 0x00008903 + 0x3*i0; }
-#define A6XX_RB_MRT_FLAG_BUFFER_ADDR__MASK			0xffffffff
-#define A6XX_RB_MRT_FLAG_BUFFER_ADDR__SHIFT			0
-static inline uint32_t A6XX_RB_MRT_FLAG_BUFFER_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_RB_MRT_FLAG_BUFFER_ADDR__SHIFT) & A6XX_RB_MRT_FLAG_BUFFER_ADDR__MASK;
-}
 
 static inline uint32_t REG_A6XX_RB_MRT_FLAG_BUFFER_PITCH(uint32_t i0) { return 0x00008905 + 0x3*i0; }
 #define A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__MASK		0x000007ff
 #define A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__SHIFT		0
 static inline uint32_t A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__SHIFT) & A6XX_RB_MRT_FLAG_BUFFER_PITCH_PITCH__MASK;
 }
 #define A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK		0x1ffff800
 #define A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT	11
 static inline uint32_t A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 7) << A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
+	assert(!(val & 0x7f));
+	return (((val >> 7)) << A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__SHIFT) & A6XX_RB_MRT_FLAG_BUFFER_PITCH_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_SAMPLE_COUNT_ADDR				0x00008927
-#define A6XX_RB_SAMPLE_COUNT_ADDR__MASK				0xffffffff
-#define A6XX_RB_SAMPLE_COUNT_ADDR__SHIFT			0
-static inline uint32_t A6XX_RB_SAMPLE_COUNT_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_RB_SAMPLE_COUNT_ADDR__SHIFT) & A6XX_RB_SAMPLE_COUNT_ADDR__MASK;
-}
 
 #define REG_A6XX_RB_UNKNOWN_8A00				0x00008a00
 
@@ -4320,6 +4434,7 @@ static inline uint32_t A6XX_RB_2D_BLIT_CNTL_RASTER_MODE(enum a6xx_raster_mode va
 {
 	return ((val) << A6XX_RB_2D_BLIT_CNTL_RASTER_MODE__SHIFT) & A6XX_RB_2D_BLIT_CNTL_RASTER_MODE__MASK;
 }
+#define A6XX_RB_2D_BLIT_CNTL_UNK30				0x40000000
 
 #define REG_A6XX_RB_2D_UNKNOWN_8C01				0x00008c01
 
@@ -4366,75 +4481,49 @@ static inline uint32_t A6XX_RB_2D_DST_INFO_UNK23(uint32_t val)
 #define A6XX_RB_2D_DST_INFO_UNK28				0x10000000
 
 #define REG_A6XX_RB_2D_DST					0x00008c18
-#define A6XX_RB_2D_DST__MASK					0xffffffff
-#define A6XX_RB_2D_DST__SHIFT					0
-static inline uint32_t A6XX_RB_2D_DST(uint32_t val)
-{
-	return ((val) << A6XX_RB_2D_DST__SHIFT) & A6XX_RB_2D_DST__MASK;
-}
 
 #define REG_A6XX_RB_2D_DST_PITCH				0x00008c1a
 #define A6XX_RB_2D_DST_PITCH__MASK				0x0000ffff
 #define A6XX_RB_2D_DST_PITCH__SHIFT				0
 static inline uint32_t A6XX_RB_2D_DST_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_2D_DST_PITCH__SHIFT) & A6XX_RB_2D_DST_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_2D_DST_PITCH__SHIFT) & A6XX_RB_2D_DST_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_2D_DST_PLANE1				0x00008c1b
-#define A6XX_RB_2D_DST_PLANE1__MASK				0xffffffff
-#define A6XX_RB_2D_DST_PLANE1__SHIFT				0
-static inline uint32_t A6XX_RB_2D_DST_PLANE1(uint32_t val)
-{
-	return ((val) << A6XX_RB_2D_DST_PLANE1__SHIFT) & A6XX_RB_2D_DST_PLANE1__MASK;
-}
 
 #define REG_A6XX_RB_2D_DST_PLANE_PITCH				0x00008c1d
 #define A6XX_RB_2D_DST_PLANE_PITCH__MASK			0x0000ffff
 #define A6XX_RB_2D_DST_PLANE_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_2D_DST_PLANE_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_2D_DST_PLANE_PITCH__SHIFT) & A6XX_RB_2D_DST_PLANE_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_2D_DST_PLANE_PITCH__SHIFT) & A6XX_RB_2D_DST_PLANE_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_2D_DST_PLANE2				0x00008c1e
-#define A6XX_RB_2D_DST_PLANE2__MASK				0xffffffff
-#define A6XX_RB_2D_DST_PLANE2__SHIFT				0
-static inline uint32_t A6XX_RB_2D_DST_PLANE2(uint32_t val)
-{
-	return ((val) << A6XX_RB_2D_DST_PLANE2__SHIFT) & A6XX_RB_2D_DST_PLANE2__MASK;
-}
 
 #define REG_A6XX_RB_2D_DST_FLAGS				0x00008c20
-#define A6XX_RB_2D_DST_FLAGS__MASK				0xffffffff
-#define A6XX_RB_2D_DST_FLAGS__SHIFT				0
-static inline uint32_t A6XX_RB_2D_DST_FLAGS(uint32_t val)
-{
-	return ((val) << A6XX_RB_2D_DST_FLAGS__SHIFT) & A6XX_RB_2D_DST_FLAGS__MASK;
-}
 
 #define REG_A6XX_RB_2D_DST_FLAGS_PITCH				0x00008c22
 #define A6XX_RB_2D_DST_FLAGS_PITCH__MASK			0x000000ff
 #define A6XX_RB_2D_DST_FLAGS_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_2D_DST_FLAGS_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_2D_DST_FLAGS_PITCH__SHIFT) & A6XX_RB_2D_DST_FLAGS_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_2D_DST_FLAGS_PITCH__SHIFT) & A6XX_RB_2D_DST_FLAGS_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_2D_DST_FLAGS_PLANE				0x00008c23
-#define A6XX_RB_2D_DST_FLAGS_PLANE__MASK			0xffffffff
-#define A6XX_RB_2D_DST_FLAGS_PLANE__SHIFT			0
-static inline uint32_t A6XX_RB_2D_DST_FLAGS_PLANE(uint32_t val)
-{
-	return ((val) << A6XX_RB_2D_DST_FLAGS_PLANE__SHIFT) & A6XX_RB_2D_DST_FLAGS_PLANE__MASK;
-}
 
 #define REG_A6XX_RB_2D_DST_FLAGS_PLANE_PITCH			0x00008c25
 #define A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__MASK			0x000000ff
 #define A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__SHIFT			0
 static inline uint32_t A6XX_RB_2D_DST_FLAGS_PLANE_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__SHIFT) & A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__SHIFT) & A6XX_RB_2D_DST_FLAGS_PLANE_PITCH__MASK;
 }
 
 #define REG_A6XX_RB_2D_SRC_SOLID_C0				0x00008c2c
@@ -4451,7 +4540,10 @@ static inline uint32_t A6XX_RB_2D_DST_FLAGS_PLANE_PITCH(uint32_t val)
 
 #define REG_A6XX_RB_ADDR_MODE_CNTL				0x00008e05
 
+#define REG_A7XX_RB_UNKNOWN_8E06				0x00008e06
+
 #define REG_A6XX_RB_CCU_CNTL					0x00008e07
+#define A6XX_RB_CCU_CNTL_GMEM_FAST_CLEAR_DISABLE		0x00000001
 #define A6XX_RB_CCU_CNTL_CONCURRENT_RESOLVE			0x00000004
 #define A6XX_RB_CCU_CNTL_DEPTH_OFFSET_HI__MASK			0x00000080
 #define A6XX_RB_CCU_CNTL_DEPTH_OFFSET_HI__SHIFT			7
@@ -4465,18 +4557,31 @@ static inline uint32_t A6XX_RB_CCU_CNTL_COLOR_OFFSET_HI(uint32_t val)
 {
 	return ((val) << A6XX_RB_CCU_CNTL_COLOR_OFFSET_HI__SHIFT) & A6XX_RB_CCU_CNTL_COLOR_OFFSET_HI__MASK;
 }
+#define A6XX_RB_CCU_CNTL_DEPTH_CACHE_SIZE__MASK			0x00000c00
+#define A6XX_RB_CCU_CNTL_DEPTH_CACHE_SIZE__SHIFT		10
+static inline uint32_t A6XX_RB_CCU_CNTL_DEPTH_CACHE_SIZE(uint32_t val)
+{
+	return ((val) << A6XX_RB_CCU_CNTL_DEPTH_CACHE_SIZE__SHIFT) & A6XX_RB_CCU_CNTL_DEPTH_CACHE_SIZE__MASK;
+}
 #define A6XX_RB_CCU_CNTL_DEPTH_OFFSET__MASK			0x001ff000
 #define A6XX_RB_CCU_CNTL_DEPTH_OFFSET__SHIFT			12
 static inline uint32_t A6XX_RB_CCU_CNTL_DEPTH_OFFSET(uint32_t val)
 {
-	return ((val >> 12) << A6XX_RB_CCU_CNTL_DEPTH_OFFSET__SHIFT) & A6XX_RB_CCU_CNTL_DEPTH_OFFSET__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_RB_CCU_CNTL_DEPTH_OFFSET__SHIFT) & A6XX_RB_CCU_CNTL_DEPTH_OFFSET__MASK;
+}
+#define A6XX_RB_CCU_CNTL_COLOR_CACHE_SIZE__MASK			0x00600000
+#define A6XX_RB_CCU_CNTL_COLOR_CACHE_SIZE__SHIFT		21
+static inline uint32_t A6XX_RB_CCU_CNTL_COLOR_CACHE_SIZE(enum a6xx_ccu_color_cache_size val)
+{
+	return ((val) << A6XX_RB_CCU_CNTL_COLOR_CACHE_SIZE__SHIFT) & A6XX_RB_CCU_CNTL_COLOR_CACHE_SIZE__MASK;
 }
-#define A6XX_RB_CCU_CNTL_GMEM					0x00400000
 #define A6XX_RB_CCU_CNTL_COLOR_OFFSET__MASK			0xff800000
 #define A6XX_RB_CCU_CNTL_COLOR_OFFSET__SHIFT			23
 static inline uint32_t A6XX_RB_CCU_CNTL_COLOR_OFFSET(uint32_t val)
 {
-	return ((val >> 12) << A6XX_RB_CCU_CNTL_COLOR_OFFSET__SHIFT) & A6XX_RB_CCU_CNTL_COLOR_OFFSET__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_RB_CCU_CNTL_COLOR_OFFSET__SHIFT) & A6XX_RB_CCU_CNTL_COLOR_OFFSET__MASK;
 }
 
 #define REG_A6XX_RB_NC_MODE_CNTL				0x00008e08
@@ -4503,15 +4608,17 @@ static inline uint32_t A6XX_RB_NC_MODE_CNTL_UNK12(uint32_t val)
 	return ((val) << A6XX_RB_NC_MODE_CNTL_UNK12__SHIFT) & A6XX_RB_NC_MODE_CNTL_UNK12__MASK;
 }
 
-static inline uint32_t REG_A6XX_RB_PERFCTR_RB_SEL(uint32_t i0) { return 0x00008e10 + 0x1*i0; }
+#define REG_A7XX_RB_UNKNOWN_8E09				0x00008e09
 
-static inline uint32_t REG_A6XX_RB_PERFCTR_CCU_SEL(uint32_t i0) { return 0x00008e18 + 0x1*i0; }
+#define REG_A6XX_RB_PERFCTR_RB_SEL(i0) (0x00008e10 + 0x1*(i0))
+
+#define REG_A6XX_RB_PERFCTR_CCU_SEL(i0) (0x00008e18 + 0x1*(i0))
 
 #define REG_A6XX_RB_UNKNOWN_8E28				0x00008e28
 
-static inline uint32_t REG_A6XX_RB_PERFCTR_CMP_SEL(uint32_t i0) { return 0x00008e2c + 0x1*i0; }
+#define REG_A6XX_RB_PERFCTR_CMP_SEL(i0) (0x00008e2c + 0x1*(i0))
 
-static inline uint32_t REG_A7XX_RB_PERFCTR_UFC_SEL(uint32_t i0) { return 0x00008e30 + 0x1*i0; }
+#define REG_A7XX_RB_PERFCTR_UFC_SEL(i0) (0x00008e30 + 0x1*(i0))
 
 #define REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST			0x00008e3b
 
@@ -4520,12 +4627,8 @@ static inline uint32_t REG_A7XX_RB_PERFCTR_UFC_SEL(uint32_t i0) { return 0x00008
 #define REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE		0x00008e50
 
 #define REG_A6XX_RB_UNKNOWN_8E51				0x00008e51
-#define A6XX_RB_UNKNOWN_8E51__MASK				0xffffffff
-#define A6XX_RB_UNKNOWN_8E51__SHIFT				0
-static inline uint32_t A6XX_RB_UNKNOWN_8E51(uint32_t val)
-{
-	return ((val) << A6XX_RB_UNKNOWN_8E51__SHIFT) & A6XX_RB_UNKNOWN_8E51__MASK;
-}
+
+#define REG_A7XX_RB_UNKNOWN_8E79				0x00008e79
 
 #define REG_A6XX_VPC_GS_PARAM					0x00009100
 #define A6XX_VPC_GS_PARAM_LINELENGTHLOC__MASK			0x000000ff
@@ -4608,6 +4711,12 @@ static inline uint32_t A6XX_VPC_VS_LAYER_CNTL_VIEWLOC(uint32_t val)
 {
 	return ((val) << A6XX_VPC_VS_LAYER_CNTL_VIEWLOC__SHIFT) & A6XX_VPC_VS_LAYER_CNTL_VIEWLOC__MASK;
 }
+#define A6XX_VPC_VS_LAYER_CNTL_SHADINGRATELOC__MASK		0x00ff0000
+#define A6XX_VPC_VS_LAYER_CNTL_SHADINGRATELOC__SHIFT		16
+static inline uint32_t A6XX_VPC_VS_LAYER_CNTL_SHADINGRATELOC(uint32_t val)
+{
+	return ((val) << A6XX_VPC_VS_LAYER_CNTL_SHADINGRATELOC__SHIFT) & A6XX_VPC_VS_LAYER_CNTL_SHADINGRATELOC__MASK;
+}
 
 #define REG_A6XX_VPC_GS_LAYER_CNTL				0x00009105
 #define A6XX_VPC_GS_LAYER_CNTL_LAYERLOC__MASK			0x000000ff
@@ -4622,6 +4731,12 @@ static inline uint32_t A6XX_VPC_GS_LAYER_CNTL_VIEWLOC(uint32_t val)
 {
 	return ((val) << A6XX_VPC_GS_LAYER_CNTL_VIEWLOC__SHIFT) & A6XX_VPC_GS_LAYER_CNTL_VIEWLOC__MASK;
 }
+#define A6XX_VPC_GS_LAYER_CNTL_SHADINGRATELOC__MASK		0x00ff0000
+#define A6XX_VPC_GS_LAYER_CNTL_SHADINGRATELOC__SHIFT		16
+static inline uint32_t A6XX_VPC_GS_LAYER_CNTL_SHADINGRATELOC(uint32_t val)
+{
+	return ((val) << A6XX_VPC_GS_LAYER_CNTL_SHADINGRATELOC__SHIFT) & A6XX_VPC_GS_LAYER_CNTL_SHADINGRATELOC__MASK;
+}
 
 #define REG_A6XX_VPC_DS_LAYER_CNTL				0x00009106
 #define A6XX_VPC_DS_LAYER_CNTL_LAYERLOC__MASK			0x000000ff
@@ -4636,6 +4751,12 @@ static inline uint32_t A6XX_VPC_DS_LAYER_CNTL_VIEWLOC(uint32_t val)
 {
 	return ((val) << A6XX_VPC_DS_LAYER_CNTL_VIEWLOC__SHIFT) & A6XX_VPC_DS_LAYER_CNTL_VIEWLOC__MASK;
 }
+#define A6XX_VPC_DS_LAYER_CNTL_SHADINGRATELOC__MASK		0x00ff0000
+#define A6XX_VPC_DS_LAYER_CNTL_SHADINGRATELOC__SHIFT		16
+static inline uint32_t A6XX_VPC_DS_LAYER_CNTL_SHADINGRATELOC(uint32_t val)
+{
+	return ((val) << A6XX_VPC_DS_LAYER_CNTL_SHADINGRATELOC__SHIFT) & A6XX_VPC_DS_LAYER_CNTL_SHADINGRATELOC__MASK;
+}
 
 #define REG_A6XX_VPC_UNKNOWN_9107				0x00009107
 #define A6XX_VPC_UNKNOWN_9107_RASTER_DISCARD			0x00000001
@@ -4649,11 +4770,51 @@ static inline uint32_t A6XX_VPC_POLYGON_MODE_MODE(enum a6xx_polygon_mode val)
 	return ((val) << A6XX_VPC_POLYGON_MODE_MODE__SHIFT) & A6XX_VPC_POLYGON_MODE_MODE__MASK;
 }
 
-static inline uint32_t REG_A6XX_VPC_VARYING_INTERP(uint32_t i0) { return 0x00009200 + 0x1*i0; }
+#define REG_A7XX_VPC_PRIMITIVE_CNTL_0				0x00009109
+#define A7XX_VPC_PRIMITIVE_CNTL_0_PRIMITIVE_RESTART		0x00000001
+#define A7XX_VPC_PRIMITIVE_CNTL_0_PROVOKING_VTX_LAST		0x00000002
+#define A7XX_VPC_PRIMITIVE_CNTL_0_D3D_VERTEX_ORDERING		0x00000004
+#define A7XX_VPC_PRIMITIVE_CNTL_0_UNK3				0x00000008
+
+#define REG_A7XX_VPC_PRIMITIVE_CNTL_5				0x0000910a
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT__MASK		0x000000ff
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT__SHIFT	0
+static inline uint32_t A7XX_VPC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT(uint32_t val)
+{
+	return ((val) << A7XX_VPC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT__SHIFT) & A7XX_VPC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT__MASK;
+}
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_INVOCATIONS__MASK		0x00007c00
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_INVOCATIONS__SHIFT		10
+static inline uint32_t A7XX_VPC_PRIMITIVE_CNTL_5_GS_INVOCATIONS(uint32_t val)
+{
+	return ((val) << A7XX_VPC_PRIMITIVE_CNTL_5_GS_INVOCATIONS__SHIFT) & A7XX_VPC_PRIMITIVE_CNTL_5_GS_INVOCATIONS__MASK;
+}
+#define A7XX_VPC_PRIMITIVE_CNTL_5_LINELENGTHEN			0x00008000
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_OUTPUT__MASK		0x00030000
+#define A7XX_VPC_PRIMITIVE_CNTL_5_GS_OUTPUT__SHIFT		16
+static inline uint32_t A7XX_VPC_PRIMITIVE_CNTL_5_GS_OUTPUT(enum a6xx_tess_output val)
+{
+	return ((val) << A7XX_VPC_PRIMITIVE_CNTL_5_GS_OUTPUT__SHIFT) & A7XX_VPC_PRIMITIVE_CNTL_5_GS_OUTPUT__MASK;
+}
+#define A7XX_VPC_PRIMITIVE_CNTL_5_UNK18				0x00040000
+
+#define REG_A7XX_VPC_MULTIVIEW_MASK				0x0000910b
+
+#define REG_A7XX_VPC_MULTIVIEW_CNTL				0x0000910c
+#define A7XX_VPC_MULTIVIEW_CNTL_ENABLE				0x00000001
+#define A7XX_VPC_MULTIVIEW_CNTL_DISABLEMULTIPOS			0x00000002
+#define A7XX_VPC_MULTIVIEW_CNTL_VIEWS__MASK			0x0000007c
+#define A7XX_VPC_MULTIVIEW_CNTL_VIEWS__SHIFT			2
+static inline uint32_t A7XX_VPC_MULTIVIEW_CNTL_VIEWS(uint32_t val)
+{
+	return ((val) << A7XX_VPC_MULTIVIEW_CNTL_VIEWS__SHIFT) & A7XX_VPC_MULTIVIEW_CNTL_VIEWS__MASK;
+}
+
+#define REG_A6XX_VPC_VARYING_INTERP(i0) (0x00009200 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VPC_VARYING_INTERP_MODE(uint32_t i0) { return 0x00009200 + 0x1*i0; }
 
-static inline uint32_t REG_A6XX_VPC_VARYING_PS_REPL(uint32_t i0) { return 0x00009208 + 0x1*i0; }
+#define REG_A6XX_VPC_VARYING_PS_REPL(i0) (0x00009208 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0x00009208 + 0x1*i0; }
 
@@ -4661,7 +4822,7 @@ static inline uint32_t REG_A6XX_VPC_VARYING_PS_REPL_MODE(uint32_t i0) { return 0
 
 #define REG_A6XX_VPC_UNKNOWN_9211				0x00009211
 
-static inline uint32_t REG_A6XX_VPC_VAR(uint32_t i0) { return 0x00009212 + 0x1*i0; }
+#define REG_A6XX_VPC_VAR(i0) (0x00009212 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VPC_VAR_DISABLE(uint32_t i0) { return 0x00009212 + 0x1*i0; }
 
@@ -4685,7 +4846,8 @@ static inline uint32_t A6XX_VPC_SO_PROG_A_BUF(uint32_t val)
 #define A6XX_VPC_SO_PROG_A_OFF__SHIFT				2
 static inline uint32_t A6XX_VPC_SO_PROG_A_OFF(uint32_t val)
 {
-	return ((val >> 2) << A6XX_VPC_SO_PROG_A_OFF__SHIFT) & A6XX_VPC_SO_PROG_A_OFF__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_VPC_SO_PROG_A_OFF__SHIFT) & A6XX_VPC_SO_PROG_A_OFF__MASK;
 }
 #define A6XX_VPC_SO_PROG_A_EN					0x00000800
 #define A6XX_VPC_SO_PROG_B_BUF__MASK				0x00003000
@@ -4698,59 +4860,24 @@ static inline uint32_t A6XX_VPC_SO_PROG_B_BUF(uint32_t val)
 #define A6XX_VPC_SO_PROG_B_OFF__SHIFT				14
 static inline uint32_t A6XX_VPC_SO_PROG_B_OFF(uint32_t val)
 {
-	return ((val >> 2) << A6XX_VPC_SO_PROG_B_OFF__SHIFT) & A6XX_VPC_SO_PROG_B_OFF__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_VPC_SO_PROG_B_OFF__SHIFT) & A6XX_VPC_SO_PROG_B_OFF__MASK;
 }
 #define A6XX_VPC_SO_PROG_B_EN					0x00800000
 
 #define REG_A6XX_VPC_SO_STREAM_COUNTS				0x00009218
-#define A6XX_VPC_SO_STREAM_COUNTS__MASK				0xffffffff
-#define A6XX_VPC_SO_STREAM_COUNTS__SHIFT			0
-static inline uint32_t A6XX_VPC_SO_STREAM_COUNTS(uint32_t val)
-{
-	return ((val) << A6XX_VPC_SO_STREAM_COUNTS__SHIFT) & A6XX_VPC_SO_STREAM_COUNTS__MASK;
-}
 
-static inline uint32_t REG_A6XX_VPC_SO(uint32_t i0) { return 0x0000921a + 0x7*i0; }
+#define REG_A6XX_VPC_SO(i0) (0x0000921a + 0x7*(i0))
 
 static inline uint32_t REG_A6XX_VPC_SO_BUFFER_BASE(uint32_t i0) { return 0x0000921a + 0x7*i0; }
-#define A6XX_VPC_SO_BUFFER_BASE__MASK				0xffffffff
-#define A6XX_VPC_SO_BUFFER_BASE__SHIFT				0
-static inline uint32_t A6XX_VPC_SO_BUFFER_BASE(uint32_t val)
-{
-	return ((val) << A6XX_VPC_SO_BUFFER_BASE__SHIFT) & A6XX_VPC_SO_BUFFER_BASE__MASK;
-}
 
 static inline uint32_t REG_A6XX_VPC_SO_BUFFER_SIZE(uint32_t i0) { return 0x0000921c + 0x7*i0; }
-#define A6XX_VPC_SO_BUFFER_SIZE__MASK				0xfffffffc
-#define A6XX_VPC_SO_BUFFER_SIZE__SHIFT				2
-static inline uint32_t A6XX_VPC_SO_BUFFER_SIZE(uint32_t val)
-{
-	return ((val >> 2) << A6XX_VPC_SO_BUFFER_SIZE__SHIFT) & A6XX_VPC_SO_BUFFER_SIZE__MASK;
-}
 
 static inline uint32_t REG_A6XX_VPC_SO_BUFFER_STRIDE(uint32_t i0) { return 0x0000921d + 0x7*i0; }
-#define A6XX_VPC_SO_BUFFER_STRIDE__MASK				0x000003ff
-#define A6XX_VPC_SO_BUFFER_STRIDE__SHIFT			0
-static inline uint32_t A6XX_VPC_SO_BUFFER_STRIDE(uint32_t val)
-{
-	return ((val >> 2) << A6XX_VPC_SO_BUFFER_STRIDE__SHIFT) & A6XX_VPC_SO_BUFFER_STRIDE__MASK;
-}
 
 static inline uint32_t REG_A6XX_VPC_SO_BUFFER_OFFSET(uint32_t i0) { return 0x0000921e + 0x7*i0; }
-#define A6XX_VPC_SO_BUFFER_OFFSET__MASK				0xfffffffc
-#define A6XX_VPC_SO_BUFFER_OFFSET__SHIFT			2
-static inline uint32_t A6XX_VPC_SO_BUFFER_OFFSET(uint32_t val)
-{
-	return ((val >> 2) << A6XX_VPC_SO_BUFFER_OFFSET__SHIFT) & A6XX_VPC_SO_BUFFER_OFFSET__MASK;
-}
 
 static inline uint32_t REG_A6XX_VPC_SO_FLUSH_BASE(uint32_t i0) { return 0x0000921f + 0x7*i0; }
-#define A6XX_VPC_SO_FLUSH_BASE__MASK				0xffffffff
-#define A6XX_VPC_SO_FLUSH_BASE__SHIFT				0
-static inline uint32_t A6XX_VPC_SO_FLUSH_BASE(uint32_t val)
-{
-	return ((val) << A6XX_VPC_SO_FLUSH_BASE__SHIFT) & A6XX_VPC_SO_FLUSH_BASE__MASK;
-}
 
 #define REG_A6XX_VPC_POINT_COORD_INVERT				0x00009236
 #define A6XX_VPC_POINT_COORD_INVERT_INVERT			0x00000001
@@ -4891,6 +5018,14 @@ static inline uint32_t A6XX_VPC_SO_STREAM_CNTL_STREAM_ENABLE(uint32_t val)
 #define REG_A6XX_VPC_SO_DISABLE					0x00009306
 #define A6XX_VPC_SO_DISABLE_DISABLE				0x00000001
 
+#define REG_A7XX_VPC_POLYGON_MODE2				0x00009307
+#define A7XX_VPC_POLYGON_MODE2_MODE__MASK			0x00000003
+#define A7XX_VPC_POLYGON_MODE2_MODE__SHIFT			0
+static inline uint32_t A7XX_VPC_POLYGON_MODE2_MODE(enum a6xx_polygon_mode val)
+{
+	return ((val) << A7XX_VPC_POLYGON_MODE2_MODE__SHIFT) & A7XX_VPC_POLYGON_MODE2_MODE__MASK;
+}
+
 #define REG_A6XX_VPC_DBG_ECO_CNTL				0x00009600
 
 #define REG_A6XX_VPC_ADDR_MODE_CNTL				0x00009601
@@ -4899,9 +5034,9 @@ static inline uint32_t A6XX_VPC_SO_STREAM_CNTL_STREAM_ENABLE(uint32_t val)
 
 #define REG_A6XX_VPC_UNKNOWN_9603				0x00009603
 
-static inline uint32_t REG_A6XX_VPC_PERFCTR_VPC_SEL(uint32_t i0) { return 0x00009604 + 0x1*i0; }
+#define REG_A6XX_VPC_PERFCTR_VPC_SEL(i0) (0x00009604 + 0x1*(i0))
 
-static inline uint32_t REG_A7XX_VPC_PERFCTR_VPC_SEL(uint32_t i0) { return 0x0000960b + 0x1*i0; }
+#define REG_A7XX_VPC_PERFCTR_VPC_SEL(i0) (0x0000960b + 0x1*(i0))
 
 #define REG_A6XX_PC_TESS_NUM_VERTEX				0x00009800
 
@@ -4912,12 +5047,7 @@ static inline uint32_t A6XX_PC_HS_INPUT_SIZE_SIZE(uint32_t val)
 {
 	return ((val) << A6XX_PC_HS_INPUT_SIZE_SIZE__SHIFT) & A6XX_PC_HS_INPUT_SIZE_SIZE__MASK;
 }
-#define A6XX_PC_HS_INPUT_SIZE_UNK13__MASK			0x00002000
-#define A6XX_PC_HS_INPUT_SIZE_UNK13__SHIFT			13
-static inline uint32_t A6XX_PC_HS_INPUT_SIZE_UNK13(uint32_t val)
-{
-	return ((val) << A6XX_PC_HS_INPUT_SIZE_UNK13__SHIFT) & A6XX_PC_HS_INPUT_SIZE_UNK13__MASK;
-}
+#define A6XX_PC_HS_INPUT_SIZE_UNK13				0x00002000
 
 #define REG_A6XX_PC_TESS_CNTL					0x00009802
 #define A6XX_PC_TESS_CNTL_SPACING__MASK				0x00000003
@@ -4939,7 +5069,8 @@ static inline uint32_t A6XX_PC_TESS_CNTL_OUTPUT(enum a6xx_tess_output val)
 
 #define REG_A6XX_PC_POWER_CNTL					0x00009805
 
-#define REG_A6XX_PC_PRIMID_PASSTHRU				0x00009806
+#define REG_A6XX_PC_PS_CNTL					0x00009806
+#define A6XX_PC_PS_CNTL_PRIMITIVEIDEN				0x00000001
 
 #define REG_A6XX_PC_SO_STREAM_CNTL				0x00009808
 #define A6XX_PC_SO_STREAM_CNTL_STREAM_ENABLE__MASK		0x00078000
@@ -4992,6 +5123,14 @@ static inline uint32_t A6XX_PC_POLYGON_MODE_MODE(enum a6xx_polygon_mode val)
 	return ((val) << A6XX_PC_POLYGON_MODE_MODE__SHIFT) & A6XX_PC_POLYGON_MODE_MODE__MASK;
 }
 
+#define REG_A7XX_PC_POLYGON_MODE				0x00009809
+#define A7XX_PC_POLYGON_MODE_MODE__MASK				0x00000003
+#define A7XX_PC_POLYGON_MODE_MODE__SHIFT			0
+static inline uint32_t A7XX_PC_POLYGON_MODE_MODE(enum a6xx_polygon_mode val)
+{
+	return ((val) << A7XX_PC_POLYGON_MODE_MODE__SHIFT) & A7XX_PC_POLYGON_MODE_MODE__MASK;
+}
+
 #define REG_A6XX_PC_RASTER_CNTL					0x00009980
 #define A6XX_PC_RASTER_CNTL_STREAM__MASK			0x00000003
 #define A6XX_PC_RASTER_CNTL_STREAM__SHIFT			0
@@ -5001,10 +5140,19 @@ static inline uint32_t A6XX_PC_RASTER_CNTL_STREAM(uint32_t val)
 }
 #define A6XX_PC_RASTER_CNTL_DISCARD				0x00000004
 
+#define REG_A7XX_PC_RASTER_CNTL					0x00009107
+#define A7XX_PC_RASTER_CNTL_STREAM__MASK			0x00000003
+#define A7XX_PC_RASTER_CNTL_STREAM__SHIFT			0
+static inline uint32_t A7XX_PC_RASTER_CNTL_STREAM(uint32_t val)
+{
+	return ((val) << A7XX_PC_RASTER_CNTL_STREAM__SHIFT) & A7XX_PC_RASTER_CNTL_STREAM__MASK;
+}
+#define A7XX_PC_RASTER_CNTL_DISCARD				0x00000004
+
 #define REG_A6XX_PC_PRIMITIVE_CNTL_0				0x00009b00
 #define A6XX_PC_PRIMITIVE_CNTL_0_PRIMITIVE_RESTART		0x00000001
 #define A6XX_PC_PRIMITIVE_CNTL_0_PROVOKING_VTX_LAST		0x00000002
-#define A6XX_PC_PRIMITIVE_CNTL_0_TESS_UPPER_LEFT_DOMAIN_ORIGIN	0x00000004
+#define A6XX_PC_PRIMITIVE_CNTL_0_D3D_VERTEX_ORDERING		0x00000004
 #define A6XX_PC_PRIMITIVE_CNTL_0_UNK3				0x00000008
 
 #define REG_A6XX_PC_VS_OUT_CNTL					0x00009b01
@@ -5024,6 +5172,7 @@ static inline uint32_t A6XX_PC_VS_OUT_CNTL_CLIP_MASK(uint32_t val)
 {
 	return ((val) << A6XX_PC_VS_OUT_CNTL_CLIP_MASK__SHIFT) & A6XX_PC_VS_OUT_CNTL_CLIP_MASK__MASK;
 }
+#define A6XX_PC_VS_OUT_CNTL_SHADINGRATE				0x01000000
 
 #define REG_A6XX_PC_GS_OUT_CNTL					0x00009b02
 #define A6XX_PC_GS_OUT_CNTL_STRIDE_IN_VPC__MASK			0x000000ff
@@ -5042,6 +5191,7 @@ static inline uint32_t A6XX_PC_GS_OUT_CNTL_CLIP_MASK(uint32_t val)
 {
 	return ((val) << A6XX_PC_GS_OUT_CNTL_CLIP_MASK__SHIFT) & A6XX_PC_GS_OUT_CNTL_CLIP_MASK__MASK;
 }
+#define A6XX_PC_GS_OUT_CNTL_SHADINGRATE				0x01000000
 
 #define REG_A6XX_PC_HS_OUT_CNTL					0x00009b03
 #define A6XX_PC_HS_OUT_CNTL_STRIDE_IN_VPC__MASK			0x000000ff
@@ -5060,6 +5210,7 @@ static inline uint32_t A6XX_PC_HS_OUT_CNTL_CLIP_MASK(uint32_t val)
 {
 	return ((val) << A6XX_PC_HS_OUT_CNTL_CLIP_MASK__SHIFT) & A6XX_PC_HS_OUT_CNTL_CLIP_MASK__MASK;
 }
+#define A6XX_PC_HS_OUT_CNTL_SHADINGRATE				0x01000000
 
 #define REG_A6XX_PC_DS_OUT_CNTL					0x00009b04
 #define A6XX_PC_DS_OUT_CNTL_STRIDE_IN_VPC__MASK			0x000000ff
@@ -5078,6 +5229,7 @@ static inline uint32_t A6XX_PC_DS_OUT_CNTL_CLIP_MASK(uint32_t val)
 {
 	return ((val) << A6XX_PC_DS_OUT_CNTL_CLIP_MASK__SHIFT) & A6XX_PC_DS_OUT_CNTL_CLIP_MASK__MASK;
 }
+#define A6XX_PC_DS_OUT_CNTL_SHADINGRATE				0x01000000
 
 #define REG_A6XX_PC_PRIMITIVE_CNTL_5				0x00009b05
 #define A6XX_PC_PRIMITIVE_CNTL_5_GS_VERTICES_OUT__MASK		0x000000ff
@@ -5099,12 +5251,7 @@ static inline uint32_t A6XX_PC_PRIMITIVE_CNTL_5_GS_OUTPUT(enum a6xx_tess_output
 {
 	return ((val) << A6XX_PC_PRIMITIVE_CNTL_5_GS_OUTPUT__SHIFT) & A6XX_PC_PRIMITIVE_CNTL_5_GS_OUTPUT__MASK;
 }
-#define A6XX_PC_PRIMITIVE_CNTL_5_UNK18__MASK			0x00040000
-#define A6XX_PC_PRIMITIVE_CNTL_5_UNK18__SHIFT			18
-static inline uint32_t A6XX_PC_PRIMITIVE_CNTL_5_UNK18(uint32_t val)
-{
-	return ((val) << A6XX_PC_PRIMITIVE_CNTL_5_UNK18__SHIFT) & A6XX_PC_PRIMITIVE_CNTL_5_UNK18__MASK;
-}
+#define A6XX_PC_PRIMITIVE_CNTL_5_UNK18				0x00040000
 
 #define REG_A6XX_PC_PRIMITIVE_CNTL_6				0x00009b06
 #define A6XX_PC_PRIMITIVE_CNTL_6_STRIDE_IN_VPC__MASK		0x000007ff
@@ -5151,12 +5298,8 @@ static inline uint32_t A6XX_PC_2D_EVENT_CMD_STATE_ID(uint32_t val)
 #define REG_A6XX_PC_DRAW_MAX_INDICES				0x00009e07
 
 #define REG_A6XX_PC_TESSFACTOR_ADDR				0x00009e08
-#define A6XX_PC_TESSFACTOR_ADDR__MASK				0xffffffff
-#define A6XX_PC_TESSFACTOR_ADDR__SHIFT				0
-static inline uint32_t A6XX_PC_TESSFACTOR_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_PC_TESSFACTOR_ADDR__SHIFT) & A6XX_PC_TESSFACTOR_ADDR__MASK;
-}
+
+#define REG_A7XX_PC_TESSFACTOR_ADDR				0x00009810
 
 #define REG_A6XX_PC_DRAW_INITIATOR				0x00009e0b
 #define A6XX_PC_DRAW_INITIATOR_PRIM_TYPE__MASK			0x0000003f
@@ -5217,27 +5360,17 @@ static inline uint32_t A6XX_PC_VSTREAM_CONTROL_VSC_N(uint32_t val)
 }
 
 #define REG_A6XX_PC_BIN_PRIM_STRM				0x00009e12
-#define A6XX_PC_BIN_PRIM_STRM__MASK				0xffffffff
-#define A6XX_PC_BIN_PRIM_STRM__SHIFT				0
-static inline uint32_t A6XX_PC_BIN_PRIM_STRM(uint32_t val)
-{
-	return ((val) << A6XX_PC_BIN_PRIM_STRM__SHIFT) & A6XX_PC_BIN_PRIM_STRM__MASK;
-}
 
 #define REG_A6XX_PC_BIN_DRAW_STRM				0x00009e14
-#define A6XX_PC_BIN_DRAW_STRM__MASK				0xffffffff
-#define A6XX_PC_BIN_DRAW_STRM__SHIFT				0
-static inline uint32_t A6XX_PC_BIN_DRAW_STRM(uint32_t val)
-{
-	return ((val) << A6XX_PC_BIN_DRAW_STRM__SHIFT) & A6XX_PC_BIN_DRAW_STRM__MASK;
-}
 
 #define REG_A6XX_PC_VISIBILITY_OVERRIDE				0x00009e1c
 #define A6XX_PC_VISIBILITY_OVERRIDE_OVERRIDE			0x00000001
 
-static inline uint32_t REG_A6XX_PC_PERFCTR_PC_SEL(uint32_t i0) { return 0x00009e34 + 0x1*i0; }
+#define REG_A7XX_PC_UNKNOWN_9E24				0x00009e24
 
-static inline uint32_t REG_A7XX_PC_PERFCTR_PC_SEL(uint32_t i0) { return 0x00009e42 + 0x1*i0; }
+#define REG_A6XX_PC_PERFCTR_PC_SEL(i0) (0x00009e34 + 0x1*(i0))
+
+#define REG_A7XX_PC_PERFCTR_PC_SEL(i0) (0x00009e42 + 0x1*(i0))
 
 #define REG_A6XX_PC_UNKNOWN_9E72				0x00009e72
 
@@ -5344,7 +5477,7 @@ static inline uint32_t A6XX_VFD_CONTROL_5_UNK8(uint32_t val)
 }
 
 #define REG_A6XX_VFD_CONTROL_6					0x0000a006
-#define A6XX_VFD_CONTROL_6_PRIMID_PASSTHRU			0x00000001
+#define A6XX_VFD_CONTROL_6_PRIMID4PSEN				0x00000001
 
 #define REG_A6XX_VFD_MODE_CNTL					0x0000a007
 #define A6XX_VFD_MODE_CNTL_RENDER_MODE__MASK			0x00000007
@@ -5372,21 +5505,15 @@ static inline uint32_t A6XX_VFD_MULTIVIEW_CNTL_VIEWS(uint32_t val)
 
 #define REG_A6XX_VFD_INSTANCE_START_OFFSET			0x0000a00f
 
-static inline uint32_t REG_A6XX_VFD_FETCH(uint32_t i0) { return 0x0000a010 + 0x4*i0; }
+#define REG_A6XX_VFD_FETCH(i0) (0x0000a010 + 0x4*(i0))
 
 static inline uint32_t REG_A6XX_VFD_FETCH_BASE(uint32_t i0) { return 0x0000a010 + 0x4*i0; }
-#define A6XX_VFD_FETCH_BASE__MASK				0xffffffff
-#define A6XX_VFD_FETCH_BASE__SHIFT				0
-static inline uint32_t A6XX_VFD_FETCH_BASE(uint32_t val)
-{
-	return ((val) << A6XX_VFD_FETCH_BASE__SHIFT) & A6XX_VFD_FETCH_BASE__MASK;
-}
 
 static inline uint32_t REG_A6XX_VFD_FETCH_SIZE(uint32_t i0) { return 0x0000a012 + 0x4*i0; }
 
 static inline uint32_t REG_A6XX_VFD_FETCH_STRIDE(uint32_t i0) { return 0x0000a013 + 0x4*i0; }
 
-static inline uint32_t REG_A6XX_VFD_DECODE(uint32_t i0) { return 0x0000a090 + 0x2*i0; }
+#define REG_A6XX_VFD_DECODE(i0) (0x0000a090 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_VFD_DECODE_INSTR(uint32_t i0) { return 0x0000a090 + 0x2*i0; }
 #define A6XX_VFD_DECODE_INSTR_IDX__MASK				0x0000001f
@@ -5419,7 +5546,7 @@ static inline uint32_t A6XX_VFD_DECODE_INSTR_SWAP(enum a3xx_color_swap val)
 
 static inline uint32_t REG_A6XX_VFD_DECODE_STEP_RATE(uint32_t i0) { return 0x0000a091 + 0x2*i0; }
 
-static inline uint32_t REG_A6XX_VFD_DEST_CNTL(uint32_t i0) { return 0x0000a0d0 + 0x1*i0; }
+#define REG_A6XX_VFD_DEST_CNTL(i0) (0x0000a0d0 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_VFD_DEST_CNTL_INSTR(uint32_t i0) { return 0x0000a0d0 + 0x1*i0; }
 #define A6XX_VFD_DEST_CNTL_INSTR_WRITEMASK__MASK		0x0000000f
@@ -5437,15 +5564,15 @@ static inline uint32_t A6XX_VFD_DEST_CNTL_INSTR_REGID(uint32_t val)
 
 #define REG_A6XX_VFD_POWER_CNTL					0x0000a0f8
 
+#define REG_A7XX_VFD_UNKNOWN_A600				0x0000a600
+
 #define REG_A6XX_VFD_ADDR_MODE_CNTL				0x0000a601
 
-static inline uint32_t REG_A6XX_VFD_PERFCTR_VFD_SEL(uint32_t i0) { return 0x0000a610 + 0x1*i0; }
+#define REG_A6XX_VFD_PERFCTR_VFD_SEL(i0) (0x0000a610 + 0x1*(i0))
 
-static inline uint32_t REG_A7XX_VFD_PERFCTR_VFD_SEL(uint32_t i0) { return 0x0000a610 + 0x1*i0; }
+#define REG_A7XX_VFD_PERFCTR_VFD_SEL(i0) (0x0000a610 + 0x1*(i0))
 
 #define REG_A6XX_SP_VS_CTRL_REG0				0x0000a800
-#define A6XX_SP_VS_CTRL_REG0_MERGEDREGS				0x00100000
-#define A6XX_SP_VS_CTRL_REG0_EARLYPREAMBLE			0x00200000
 #define A6XX_SP_VS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_VS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_VS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -5471,6 +5598,8 @@ static inline uint32_t A6XX_SP_VS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_VS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_VS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_VS_CTRL_REG0_MERGEDREGS				0x00100000
+#define A6XX_SP_VS_CTRL_REG0_EARLYPREAMBLE			0x00200000
 
 #define REG_A6XX_SP_VS_BRANCH_COND				0x0000a801
 
@@ -5488,7 +5617,7 @@ static inline uint32_t A6XX_SP_VS_PRIMITIVE_CNTL_FLAGS_REGID(uint32_t val)
 	return ((val) << A6XX_SP_VS_PRIMITIVE_CNTL_FLAGS_REGID__SHIFT) & A6XX_SP_VS_PRIMITIVE_CNTL_FLAGS_REGID__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_VS_OUT(uint32_t i0) { return 0x0000a803 + 0x1*i0; }
+#define REG_A6XX_SP_VS_OUT(i0) (0x0000a803 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_VS_OUT_REG(uint32_t i0) { return 0x0000a803 + 0x1*i0; }
 #define A6XX_SP_VS_OUT_REG_A_REGID__MASK			0x000000ff
@@ -5516,7 +5645,7 @@ static inline uint32_t A6XX_SP_VS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A6XX_SP_VS_OUT_REG_B_COMPMASK__SHIFT) & A6XX_SP_VS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_VS_VPC_DST(uint32_t i0) { return 0x0000a813 + 0x1*i0; }
+#define REG_A6XX_SP_VS_VPC_DST(i0) (0x0000a813 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_VS_VPC_DST_REG(uint32_t i0) { return 0x0000a813 + 0x1*i0; }
 #define A6XX_SP_VS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -5547,19 +5676,14 @@ static inline uint32_t A6XX_SP_VS_VPC_DST_REG_OUTLOC3(uint32_t val)
 #define REG_A6XX_SP_VS_OBJ_FIRST_EXEC_OFFSET			0x0000a81b
 
 #define REG_A6XX_SP_VS_OBJ_START				0x0000a81c
-#define A6XX_SP_VS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_VS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_VS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_VS_OBJ_START__SHIFT) & A6XX_SP_VS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_VS_PVT_MEM_PARAM				0x0000a81e
 #define A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_VS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -5569,19 +5693,14 @@ static inline uint32_t A6XX_SP_VS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_VS_PVT_MEM_ADDR				0x0000a81f
-#define A6XX_SP_VS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_VS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_VS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_VS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_VS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_VS_PVT_MEM_SIZE				0x0000a821
 #define A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_VS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_VS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -5619,11 +5738,13 @@ static inline uint32_t A6XX_SP_VS_CONFIG_NIBO(uint32_t val)
 #define A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_VS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
+#define REG_A7XX_SP_UNKNOWN_A82D				0x0000a82d
+
 #define REG_A6XX_SP_HS_CTRL_REG0				0x0000a830
-#define A6XX_SP_HS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 #define A6XX_SP_HS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_HS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_HS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -5649,6 +5770,7 @@ static inline uint32_t A6XX_SP_HS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_HS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_HS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_HS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 
 #define REG_A6XX_SP_HS_WAVE_INPUT_SIZE				0x0000a831
 
@@ -5657,19 +5779,14 @@ static inline uint32_t A6XX_SP_HS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 #define REG_A6XX_SP_HS_OBJ_FIRST_EXEC_OFFSET			0x0000a833
 
 #define REG_A6XX_SP_HS_OBJ_START				0x0000a834
-#define A6XX_SP_HS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_HS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_HS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_HS_OBJ_START__SHIFT) & A6XX_SP_HS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_HS_PVT_MEM_PARAM				0x0000a836
 #define A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_HS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -5679,19 +5796,14 @@ static inline uint32_t A6XX_SP_HS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_HS_PVT_MEM_ADDR				0x0000a837
-#define A6XX_SP_HS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_HS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_HS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_HS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_HS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_HS_PVT_MEM_SIZE				0x0000a839
 #define A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_HS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_HS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -5729,11 +5841,11 @@ static inline uint32_t A6XX_SP_HS_CONFIG_NIBO(uint32_t val)
 #define A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_HS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
 #define REG_A6XX_SP_DS_CTRL_REG0				0x0000a840
-#define A6XX_SP_DS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 #define A6XX_SP_DS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_DS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_DS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -5759,6 +5871,7 @@ static inline uint32_t A6XX_SP_DS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_DS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_DS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_DS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 
 #define REG_A6XX_SP_DS_BRANCH_COND				0x0000a841
 
@@ -5776,7 +5889,7 @@ static inline uint32_t A6XX_SP_DS_PRIMITIVE_CNTL_FLAGS_REGID(uint32_t val)
 	return ((val) << A6XX_SP_DS_PRIMITIVE_CNTL_FLAGS_REGID__SHIFT) & A6XX_SP_DS_PRIMITIVE_CNTL_FLAGS_REGID__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_DS_OUT(uint32_t i0) { return 0x0000a843 + 0x1*i0; }
+#define REG_A6XX_SP_DS_OUT(i0) (0x0000a843 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_DS_OUT_REG(uint32_t i0) { return 0x0000a843 + 0x1*i0; }
 #define A6XX_SP_DS_OUT_REG_A_REGID__MASK			0x000000ff
@@ -5804,7 +5917,7 @@ static inline uint32_t A6XX_SP_DS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A6XX_SP_DS_OUT_REG_B_COMPMASK__SHIFT) & A6XX_SP_DS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_DS_VPC_DST(uint32_t i0) { return 0x0000a853 + 0x1*i0; }
+#define REG_A6XX_SP_DS_VPC_DST(i0) (0x0000a853 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_DS_VPC_DST_REG(uint32_t i0) { return 0x0000a853 + 0x1*i0; }
 #define A6XX_SP_DS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -5835,19 +5948,14 @@ static inline uint32_t A6XX_SP_DS_VPC_DST_REG_OUTLOC3(uint32_t val)
 #define REG_A6XX_SP_DS_OBJ_FIRST_EXEC_OFFSET			0x0000a85b
 
 #define REG_A6XX_SP_DS_OBJ_START				0x0000a85c
-#define A6XX_SP_DS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_DS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_DS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_DS_OBJ_START__SHIFT) & A6XX_SP_DS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_DS_PVT_MEM_PARAM				0x0000a85e
 #define A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_DS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -5857,19 +5965,14 @@ static inline uint32_t A6XX_SP_DS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_DS_PVT_MEM_ADDR				0x0000a85f
-#define A6XX_SP_DS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_DS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_DS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_DS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_DS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_DS_PVT_MEM_SIZE				0x0000a861
 #define A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_DS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_DS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -5907,11 +6010,11 @@ static inline uint32_t A6XX_SP_DS_CONFIG_NIBO(uint32_t val)
 #define A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_DS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
 #define REG_A6XX_SP_GS_CTRL_REG0				0x0000a870
-#define A6XX_SP_GS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 #define A6XX_SP_GS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_GS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_GS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -5937,6 +6040,7 @@ static inline uint32_t A6XX_SP_GS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_GS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_GS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_GS_CTRL_REG0_EARLYPREAMBLE			0x00100000
 
 #define REG_A6XX_SP_GS_PRIM_SIZE				0x0000a871
 
@@ -5956,7 +6060,7 @@ static inline uint32_t A6XX_SP_GS_PRIMITIVE_CNTL_FLAGS_REGID(uint32_t val)
 	return ((val) << A6XX_SP_GS_PRIMITIVE_CNTL_FLAGS_REGID__SHIFT) & A6XX_SP_GS_PRIMITIVE_CNTL_FLAGS_REGID__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_GS_OUT(uint32_t i0) { return 0x0000a874 + 0x1*i0; }
+#define REG_A6XX_SP_GS_OUT(i0) (0x0000a874 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_GS_OUT_REG(uint32_t i0) { return 0x0000a874 + 0x1*i0; }
 #define A6XX_SP_GS_OUT_REG_A_REGID__MASK			0x000000ff
@@ -5984,7 +6088,7 @@ static inline uint32_t A6XX_SP_GS_OUT_REG_B_COMPMASK(uint32_t val)
 	return ((val) << A6XX_SP_GS_OUT_REG_B_COMPMASK__SHIFT) & A6XX_SP_GS_OUT_REG_B_COMPMASK__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_GS_VPC_DST(uint32_t i0) { return 0x0000a884 + 0x1*i0; }
+#define REG_A6XX_SP_GS_VPC_DST(i0) (0x0000a884 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_GS_VPC_DST_REG(uint32_t i0) { return 0x0000a884 + 0x1*i0; }
 #define A6XX_SP_GS_VPC_DST_REG_OUTLOC0__MASK			0x000000ff
@@ -6015,19 +6119,14 @@ static inline uint32_t A6XX_SP_GS_VPC_DST_REG_OUTLOC3(uint32_t val)
 #define REG_A6XX_SP_GS_OBJ_FIRST_EXEC_OFFSET			0x0000a88c
 
 #define REG_A6XX_SP_GS_OBJ_START				0x0000a88d
-#define A6XX_SP_GS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_GS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_GS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_GS_OBJ_START__SHIFT) & A6XX_SP_GS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_GS_PVT_MEM_PARAM				0x0000a88f
 #define A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_GS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -6037,19 +6136,14 @@ static inline uint32_t A6XX_SP_GS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_GS_PVT_MEM_ADDR				0x0000a890
-#define A6XX_SP_GS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_GS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_GS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_GS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_GS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_GS_PVT_MEM_SIZE				0x0000a892
 #define A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_GS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_GS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -6087,89 +6181,27 @@ static inline uint32_t A6XX_SP_GS_CONFIG_NIBO(uint32_t val)
 #define A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_GS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
 #define REG_A6XX_SP_VS_TEX_SAMP					0x0000a8a0
-#define A6XX_SP_VS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_VS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_VS_TEX_SAMP(uint32_t val)
-{
-	return ((val) << A6XX_SP_VS_TEX_SAMP__SHIFT) & A6XX_SP_VS_TEX_SAMP__MASK;
-}
 
 #define REG_A6XX_SP_HS_TEX_SAMP					0x0000a8a2
-#define A6XX_SP_HS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_HS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_HS_TEX_SAMP(uint32_t val)
-{
-	return ((val) << A6XX_SP_HS_TEX_SAMP__SHIFT) & A6XX_SP_HS_TEX_SAMP__MASK;
-}
 
 #define REG_A6XX_SP_DS_TEX_SAMP					0x0000a8a4
-#define A6XX_SP_DS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_DS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_DS_TEX_SAMP(uint32_t val)
-{
-	return ((val) << A6XX_SP_DS_TEX_SAMP__SHIFT) & A6XX_SP_DS_TEX_SAMP__MASK;
-}
 
 #define REG_A6XX_SP_GS_TEX_SAMP					0x0000a8a6
-#define A6XX_SP_GS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_GS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_GS_TEX_SAMP(uint32_t val)
-{
-	return ((val) << A6XX_SP_GS_TEX_SAMP__SHIFT) & A6XX_SP_GS_TEX_SAMP__MASK;
-}
 
 #define REG_A6XX_SP_VS_TEX_CONST				0x0000a8a8
-#define A6XX_SP_VS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_VS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_VS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_VS_TEX_CONST__SHIFT) & A6XX_SP_VS_TEX_CONST__MASK;
-}
 
 #define REG_A6XX_SP_HS_TEX_CONST				0x0000a8aa
-#define A6XX_SP_HS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_HS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_HS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_HS_TEX_CONST__SHIFT) & A6XX_SP_HS_TEX_CONST__MASK;
-}
 
 #define REG_A6XX_SP_DS_TEX_CONST				0x0000a8ac
-#define A6XX_SP_DS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_DS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_DS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_DS_TEX_CONST__SHIFT) & A6XX_SP_DS_TEX_CONST__MASK;
-}
 
 #define REG_A6XX_SP_GS_TEX_CONST				0x0000a8ae
-#define A6XX_SP_GS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_GS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_GS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_GS_TEX_CONST__SHIFT) & A6XX_SP_GS_TEX_CONST__MASK;
-}
 
 #define REG_A6XX_SP_FS_CTRL_REG0				0x0000a980
-#define A6XX_SP_FS_CTRL_REG0_THREADSIZE__MASK			0x00100000
-#define A6XX_SP_FS_CTRL_REG0_THREADSIZE__SHIFT			20
-static inline uint32_t A6XX_SP_FS_CTRL_REG0_THREADSIZE(enum a6xx_threadsize val)
-{
-	return ((val) << A6XX_SP_FS_CTRL_REG0_THREADSIZE__SHIFT) & A6XX_SP_FS_CTRL_REG0_THREADSIZE__MASK;
-}
-#define A6XX_SP_FS_CTRL_REG0_UNK21				0x00200000
-#define A6XX_SP_FS_CTRL_REG0_VARYING				0x00400000
-#define A6XX_SP_FS_CTRL_REG0_DIFF_FINE				0x00800000
-#define A6XX_SP_FS_CTRL_REG0_UNK24				0x01000000
-#define A6XX_SP_FS_CTRL_REG0_UNK25				0x02000000
-#define A6XX_SP_FS_CTRL_REG0_PIXLODENABLE			0x04000000
-#define A6XX_SP_FS_CTRL_REG0_UNK27				0x08000000
-#define A6XX_SP_FS_CTRL_REG0_EARLYPREAMBLE			0x10000000
-#define A6XX_SP_FS_CTRL_REG0_MERGEDREGS				0x80000000
 #define A6XX_SP_FS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_FS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_FS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -6195,25 +6227,35 @@ static inline uint32_t A6XX_SP_FS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_FS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_FS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_FS_CTRL_REG0_THREADSIZE__MASK			0x00100000
+#define A6XX_SP_FS_CTRL_REG0_THREADSIZE__SHIFT			20
+static inline uint32_t A6XX_SP_FS_CTRL_REG0_THREADSIZE(enum a6xx_threadsize val)
+{
+	return ((val) << A6XX_SP_FS_CTRL_REG0_THREADSIZE__SHIFT) & A6XX_SP_FS_CTRL_REG0_THREADSIZE__MASK;
+}
+#define A6XX_SP_FS_CTRL_REG0_UNK21				0x00200000
+#define A6XX_SP_FS_CTRL_REG0_VARYING				0x00400000
+#define A6XX_SP_FS_CTRL_REG0_LODPIXMASK				0x00800000
+#define A6XX_SP_FS_CTRL_REG0_UNK24				0x01000000
+#define A6XX_SP_FS_CTRL_REG0_UNK25				0x02000000
+#define A6XX_SP_FS_CTRL_REG0_PIXLODENABLE			0x04000000
+#define A6XX_SP_FS_CTRL_REG0_UNK27				0x08000000
+#define A6XX_SP_FS_CTRL_REG0_EARLYPREAMBLE			0x10000000
+#define A6XX_SP_FS_CTRL_REG0_MERGEDREGS				0x80000000
 
 #define REG_A6XX_SP_FS_BRANCH_COND				0x0000a981
 
 #define REG_A6XX_SP_FS_OBJ_FIRST_EXEC_OFFSET			0x0000a982
 
 #define REG_A6XX_SP_FS_OBJ_START				0x0000a983
-#define A6XX_SP_FS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_FS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_FS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_FS_OBJ_START__SHIFT) & A6XX_SP_FS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_FS_PVT_MEM_PARAM				0x0000a985
 #define A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_FS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -6223,19 +6265,14 @@ static inline uint32_t A6XX_SP_FS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_FS_PVT_MEM_ADDR				0x0000a986
-#define A6XX_SP_FS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_FS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_FS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_FS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_FS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_FS_PVT_MEM_SIZE				0x0000a988
 #define A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_FS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_FS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -6339,7 +6376,7 @@ static inline uint32_t A6XX_SP_FS_OUTPUT_CNTL1_MRT(uint32_t val)
 	return ((val) << A6XX_SP_FS_OUTPUT_CNTL1_MRT__SHIFT) & A6XX_SP_FS_OUTPUT_CNTL1_MRT__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_FS_OUTPUT(uint32_t i0) { return 0x0000a98e + 0x1*i0; }
+#define REG_A6XX_SP_FS_OUTPUT(i0) (0x0000a98e + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_FS_OUTPUT_REG(uint32_t i0) { return 0x0000a98e + 0x1*i0; }
 #define A6XX_SP_FS_OUTPUT_REG_REGID__MASK			0x000000ff
@@ -6350,7 +6387,7 @@ static inline uint32_t A6XX_SP_FS_OUTPUT_REG_REGID(uint32_t val)
 }
 #define A6XX_SP_FS_OUTPUT_REG_HALF_PRECISION			0x00000100
 
-static inline uint32_t REG_A6XX_SP_FS_MRT(uint32_t i0) { return 0x0000a996 + 0x1*i0; }
+#define REG_A6XX_SP_FS_MRT(i0) (0x0000a996 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_FS_MRT_REG(uint32_t i0) { return 0x0000a996 + 0x1*i0; }
 #define A6XX_SP_FS_MRT_REG_COLOR_FORMAT__MASK			0x000000ff
@@ -6371,16 +6408,22 @@ static inline uint32_t A6XX_SP_FS_PREFETCH_CNTL_COUNT(uint32_t val)
 	return ((val) << A6XX_SP_FS_PREFETCH_CNTL_COUNT__SHIFT) & A6XX_SP_FS_PREFETCH_CNTL_COUNT__MASK;
 }
 #define A6XX_SP_FS_PREFETCH_CNTL_IJ_WRITE_DISABLE		0x00000008
-#define A6XX_SP_FS_PREFETCH_CNTL_UNK4				0x00000010
+#define A6XX_SP_FS_PREFETCH_CNTL_ENDOFQUAD			0x00000010
 #define A6XX_SP_FS_PREFETCH_CNTL_WRITE_COLOR_TO_OUTPUT		0x00000020
-#define A6XX_SP_FS_PREFETCH_CNTL_UNK6__MASK			0x00007fc0
-#define A6XX_SP_FS_PREFETCH_CNTL_UNK6__SHIFT			6
-static inline uint32_t A6XX_SP_FS_PREFETCH_CNTL_UNK6(uint32_t val)
+#define A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID__MASK		0x00007fc0
+#define A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID__SHIFT		6
+static inline uint32_t A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID(uint32_t val)
+{
+	return ((val) << A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID__SHIFT) & A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID__MASK;
+}
+#define A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID4COORD__MASK	0x01ff0000
+#define A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID4COORD__SHIFT	16
+static inline uint32_t A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID4COORD(uint32_t val)
 {
-	return ((val) << A6XX_SP_FS_PREFETCH_CNTL_UNK6__SHIFT) & A6XX_SP_FS_PREFETCH_CNTL_UNK6__MASK;
+	return ((val) << A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID4COORD__SHIFT) & A6XX_SP_FS_PREFETCH_CNTL_CONSTSLOTID4COORD__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_FS_PREFETCH(uint32_t i0) { return 0x0000a99f + 0x1*i0; }
+#define REG_A6XX_SP_FS_PREFETCH(i0) (0x0000a99f + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_FS_PREFETCH_CMD(uint32_t i0) { return 0x0000a99f + 0x1*i0; }
 #define A6XX_SP_FS_PREFETCH_CMD_SRC__MASK			0x0000007f
@@ -6423,7 +6466,49 @@ static inline uint32_t A6XX_SP_FS_PREFETCH_CMD_CMD(enum a6xx_tex_prefetch_cmd va
 	return ((val) << A6XX_SP_FS_PREFETCH_CMD_CMD__SHIFT) & A6XX_SP_FS_PREFETCH_CMD_CMD__MASK;
 }
 
-static inline uint32_t REG_A6XX_SP_FS_BINDLESS_PREFETCH(uint32_t i0) { return 0x0000a9a3 + 0x1*i0; }
+#define REG_A7XX_SP_FS_PREFETCH(i0) (0x0000a99f + 0x1*(i0))
+
+static inline uint32_t REG_A7XX_SP_FS_PREFETCH_CMD(uint32_t i0) { return 0x0000a99f + 0x1*i0; }
+#define A7XX_SP_FS_PREFETCH_CMD_SRC__MASK			0x0000007f
+#define A7XX_SP_FS_PREFETCH_CMD_SRC__SHIFT			0
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_SRC(uint32_t val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_SRC__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_SRC__MASK;
+}
+#define A7XX_SP_FS_PREFETCH_CMD_SAMP_ID__MASK			0x00000380
+#define A7XX_SP_FS_PREFETCH_CMD_SAMP_ID__SHIFT			7
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_SAMP_ID(uint32_t val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_SAMP_ID__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_SAMP_ID__MASK;
+}
+#define A7XX_SP_FS_PREFETCH_CMD_TEX_ID__MASK			0x00001c00
+#define A7XX_SP_FS_PREFETCH_CMD_TEX_ID__SHIFT			10
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_TEX_ID(uint32_t val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_TEX_ID__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_TEX_ID__MASK;
+}
+#define A7XX_SP_FS_PREFETCH_CMD_DST__MASK			0x0007e000
+#define A7XX_SP_FS_PREFETCH_CMD_DST__SHIFT			13
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_DST(uint32_t val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_DST__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_DST__MASK;
+}
+#define A7XX_SP_FS_PREFETCH_CMD_WRMASK__MASK			0x00780000
+#define A7XX_SP_FS_PREFETCH_CMD_WRMASK__SHIFT			19
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_WRMASK(uint32_t val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_WRMASK__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_WRMASK__MASK;
+}
+#define A7XX_SP_FS_PREFETCH_CMD_HALF				0x00800000
+#define A7XX_SP_FS_PREFETCH_CMD_BINDLESS			0x02000000
+#define A7XX_SP_FS_PREFETCH_CMD_CMD__MASK			0x3c000000
+#define A7XX_SP_FS_PREFETCH_CMD_CMD__SHIFT			26
+static inline uint32_t A7XX_SP_FS_PREFETCH_CMD_CMD(enum a6xx_tex_prefetch_cmd val)
+{
+	return ((val) << A7XX_SP_FS_PREFETCH_CMD_CMD__SHIFT) & A7XX_SP_FS_PREFETCH_CMD_CMD__MASK;
+}
+
+#define REG_A6XX_SP_FS_BINDLESS_PREFETCH(i0) (0x0000a9a3 + 0x1*(i0))
 
 static inline uint32_t REG_A6XX_SP_FS_BINDLESS_PREFETCH_CMD(uint32_t i0) { return 0x0000a9a3 + 0x1*i0; }
 #define A6XX_SP_FS_BINDLESS_PREFETCH_CMD_SAMP_ID__MASK		0x0000ffff
@@ -6448,20 +6533,11 @@ static inline uint32_t A6XX_SP_FS_BINDLESS_PREFETCH_CMD_TEX_ID(uint32_t val)
 #define A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_FS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
 #define REG_A6XX_SP_CS_CTRL_REG0				0x0000a9b0
-#define A6XX_SP_CS_CTRL_REG0_THREADSIZE__MASK			0x00100000
-#define A6XX_SP_CS_CTRL_REG0_THREADSIZE__SHIFT			20
-static inline uint32_t A6XX_SP_CS_CTRL_REG0_THREADSIZE(enum a6xx_threadsize val)
-{
-	return ((val) << A6XX_SP_CS_CTRL_REG0_THREADSIZE__SHIFT) & A6XX_SP_CS_CTRL_REG0_THREADSIZE__MASK;
-}
-#define A6XX_SP_CS_CTRL_REG0_UNK21				0x00200000
-#define A6XX_SP_CS_CTRL_REG0_UNK22				0x00400000
-#define A6XX_SP_CS_CTRL_REG0_EARLYPREAMBLE			0x00800000
-#define A6XX_SP_CS_CTRL_REG0_MERGEDREGS				0x80000000
 #define A6XX_SP_CS_CTRL_REG0_THREADMODE__MASK			0x00000001
 #define A6XX_SP_CS_CTRL_REG0_THREADMODE__SHIFT			0
 static inline uint32_t A6XX_SP_CS_CTRL_REG0_THREADMODE(enum a3xx_threadmode val)
@@ -6487,6 +6563,16 @@ static inline uint32_t A6XX_SP_CS_CTRL_REG0_BRANCHSTACK(uint32_t val)
 {
 	return ((val) << A6XX_SP_CS_CTRL_REG0_BRANCHSTACK__SHIFT) & A6XX_SP_CS_CTRL_REG0_BRANCHSTACK__MASK;
 }
+#define A6XX_SP_CS_CTRL_REG0_THREADSIZE__MASK			0x00100000
+#define A6XX_SP_CS_CTRL_REG0_THREADSIZE__SHIFT			20
+static inline uint32_t A6XX_SP_CS_CTRL_REG0_THREADSIZE(enum a6xx_threadsize val)
+{
+	return ((val) << A6XX_SP_CS_CTRL_REG0_THREADSIZE__SHIFT) & A6XX_SP_CS_CTRL_REG0_THREADSIZE__MASK;
+}
+#define A6XX_SP_CS_CTRL_REG0_UNK21				0x00200000
+#define A6XX_SP_CS_CTRL_REG0_UNK22				0x00400000
+#define A6XX_SP_CS_CTRL_REG0_EARLYPREAMBLE			0x00800000
+#define A6XX_SP_CS_CTRL_REG0_MERGEDREGS				0x80000000
 
 #define REG_A6XX_SP_CS_UNKNOWN_A9B1				0x0000a9b1
 #define A6XX_SP_CS_UNKNOWN_A9B1_SHARED_SIZE__MASK		0x0000001f
@@ -6503,19 +6589,14 @@ static inline uint32_t A6XX_SP_CS_UNKNOWN_A9B1_SHARED_SIZE(uint32_t val)
 #define REG_A6XX_SP_CS_OBJ_FIRST_EXEC_OFFSET			0x0000a9b3
 
 #define REG_A6XX_SP_CS_OBJ_START				0x0000a9b4
-#define A6XX_SP_CS_OBJ_START__MASK				0xffffffff
-#define A6XX_SP_CS_OBJ_START__SHIFT				0
-static inline uint32_t A6XX_SP_CS_OBJ_START(uint32_t val)
-{
-	return ((val) << A6XX_SP_CS_OBJ_START__SHIFT) & A6XX_SP_CS_OBJ_START__MASK;
-}
 
 #define REG_A6XX_SP_CS_PVT_MEM_PARAM				0x0000a9b6
 #define A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK		0x000000ff
 #define A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT		0
 static inline uint32_t A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM(uint32_t val)
 {
-	return ((val >> 9) << A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
+	assert(!(val & 0x1ff));
+	return (((val >> 9)) << A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__SHIFT) & A6XX_SP_CS_PVT_MEM_PARAM_MEMSIZEPERITEM__MASK;
 }
 #define A6XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__MASK	0xff000000
 #define A6XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD__SHIFT	24
@@ -6525,19 +6606,14 @@ static inline uint32_t A6XX_SP_CS_PVT_MEM_PARAM_HWSTACKSIZEPERTHREAD(uint32_t va
 }
 
 #define REG_A6XX_SP_CS_PVT_MEM_ADDR				0x0000a9b7
-#define A6XX_SP_CS_PVT_MEM_ADDR__MASK				0xffffffff
-#define A6XX_SP_CS_PVT_MEM_ADDR__SHIFT				0
-static inline uint32_t A6XX_SP_CS_PVT_MEM_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_CS_PVT_MEM_ADDR__SHIFT) & A6XX_SP_CS_PVT_MEM_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_CS_PVT_MEM_SIZE				0x0000a9b9
 #define A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK		0x0003ffff
 #define A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT		0
 static inline uint32_t A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE(uint32_t val)
 {
-	return ((val >> 12) << A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__SHIFT) & A6XX_SP_CS_PVT_MEM_SIZE_TOTALPVTMEMSIZE__MASK;
 }
 #define A6XX_SP_CS_PVT_MEM_SIZE_PERWAVEMEMLAYOUT		0x80000000
 
@@ -6575,9 +6651,12 @@ static inline uint32_t A6XX_SP_CS_CONFIG_NIBO(uint32_t val)
 #define A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT	0
 static inline uint32_t A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET(uint32_t val)
 {
-	return ((val >> 11) << A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
+	assert(!(val & 0x7ff));
+	return (((val >> 11)) << A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET__SHIFT) & A6XX_SP_CS_PVT_MEM_HW_STACK_OFFSET_OFFSET__MASK;
 }
 
+#define REG_A7XX_SP_CS_UNKNOWN_A9BE				0x0000a9be
+
 #define REG_A6XX_SP_CS_CNTL_0					0x0000a9c2
 #define A6XX_SP_CS_CNTL_0_WGIDCONSTID__MASK			0x000000ff
 #define A6XX_SP_CS_CNTL_0_WGIDCONSTID__SHIFT			0
@@ -6620,39 +6699,31 @@ static inline uint32_t A6XX_SP_CS_CNTL_1_THREADSIZE(enum a6xx_threadsize val)
 }
 #define A6XX_SP_CS_CNTL_1_THREADSIZE_SCALAR			0x00000400
 
-#define REG_A6XX_SP_FS_TEX_SAMP					0x0000a9e0
-#define A6XX_SP_FS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_FS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_FS_TEX_SAMP(uint32_t val)
+#define REG_A7XX_SP_CS_CNTL_1					0x0000a9c3
+#define A7XX_SP_CS_CNTL_1_LINEARLOCALIDREGID__MASK		0x000000ff
+#define A7XX_SP_CS_CNTL_1_LINEARLOCALIDREGID__SHIFT		0
+static inline uint32_t A7XX_SP_CS_CNTL_1_LINEARLOCALIDREGID(uint32_t val)
 {
-	return ((val) << A6XX_SP_FS_TEX_SAMP__SHIFT) & A6XX_SP_FS_TEX_SAMP__MASK;
+	return ((val) << A7XX_SP_CS_CNTL_1_LINEARLOCALIDREGID__SHIFT) & A7XX_SP_CS_CNTL_1_LINEARLOCALIDREGID__MASK;
 }
-
-#define REG_A6XX_SP_CS_TEX_SAMP					0x0000a9e2
-#define A6XX_SP_CS_TEX_SAMP__MASK				0xffffffff
-#define A6XX_SP_CS_TEX_SAMP__SHIFT				0
-static inline uint32_t A6XX_SP_CS_TEX_SAMP(uint32_t val)
+#define A7XX_SP_CS_CNTL_1_THREADSIZE__MASK			0x00000100
+#define A7XX_SP_CS_CNTL_1_THREADSIZE__SHIFT			8
+static inline uint32_t A7XX_SP_CS_CNTL_1_THREADSIZE(enum a6xx_threadsize val)
 {
-	return ((val) << A6XX_SP_CS_TEX_SAMP__SHIFT) & A6XX_SP_CS_TEX_SAMP__MASK;
+	return ((val) << A7XX_SP_CS_CNTL_1_THREADSIZE__SHIFT) & A7XX_SP_CS_CNTL_1_THREADSIZE__MASK;
 }
+#define A7XX_SP_CS_CNTL_1_THREADSIZE_SCALAR			0x00000200
+#define A7XX_SP_CS_CNTL_1_UNK15					0x00008000
+
+#define REG_A6XX_SP_FS_TEX_SAMP					0x0000a9e0
+
+#define REG_A6XX_SP_CS_TEX_SAMP					0x0000a9e2
 
 #define REG_A6XX_SP_FS_TEX_CONST				0x0000a9e4
-#define A6XX_SP_FS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_FS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_FS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_FS_TEX_CONST__SHIFT) & A6XX_SP_FS_TEX_CONST__MASK;
-}
 
 #define REG_A6XX_SP_CS_TEX_CONST				0x0000a9e6
-#define A6XX_SP_CS_TEX_CONST__MASK				0xffffffff
-#define A6XX_SP_CS_TEX_CONST__SHIFT				0
-static inline uint32_t A6XX_SP_CS_TEX_CONST(uint32_t val)
-{
-	return ((val) << A6XX_SP_CS_TEX_CONST__SHIFT) & A6XX_SP_CS_TEX_CONST__MASK;
-}
 
-static inline uint32_t REG_A6XX_SP_CS_BINDLESS_BASE(uint32_t i0) { return 0x0000a9e8 + 0x2*i0; }
+#define REG_A6XX_SP_CS_BINDLESS_BASE(i0) (0x0000a9e8 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000a9e8 + 0x2*i0; }
 #define A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
@@ -6661,23 +6732,39 @@ static inline uint32_t A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx_b
 {
 	return ((val) << A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
-#define A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffc
+#define A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffffffffffc
 #define A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT		2
-static inline uint32_t A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR(uint32_t val)
+static inline uint32_t A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
 {
-	return ((val >> 2) << A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
 }
 
-#define REG_A6XX_SP_CS_IBO					0x0000a9f2
-#define A6XX_SP_CS_IBO__MASK					0xffffffff
-#define A6XX_SP_CS_IBO__SHIFT					0
-static inline uint32_t A6XX_SP_CS_IBO(uint32_t val)
+#define REG_A7XX_SP_CS_BINDLESS_BASE(i0) (0x0000a9e8 + 0x2*(i0))
+
+static inline uint32_t REG_A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000a9e8 + 0x2*i0; }
+#define A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
+#define A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT	0
+static inline uint32_t A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx_bindless_descriptor_size val)
 {
-	return ((val) << A6XX_SP_CS_IBO__SHIFT) & A6XX_SP_CS_IBO__MASK;
+	return ((val) << A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
+#define A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffffffffffc
+#define A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT		2
+static inline uint32_t A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A7XX_SP_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+}
+
+#define REG_A6XX_SP_CS_IBO					0x0000a9f2
 
 #define REG_A6XX_SP_CS_IBO_COUNT				0x0000aa00
 
+#define REG_A7XX_SP_UNKNOWN_AA01				0x0000aa01
+
+#define REG_A6XX_SP_UNKNOWN_AAF2				0x0000aaf2
+
 #define REG_A6XX_SP_MODE_CONTROL				0x0000ab00
 #define A6XX_SP_MODE_CONTROL_CONSTANT_DEMOTION_ENABLE		0x00000001
 #define A6XX_SP_MODE_CONTROL_ISAMMODE__MASK			0x00000006
@@ -6688,6 +6775,10 @@ static inline uint32_t A6XX_SP_MODE_CONTROL_ISAMMODE(enum a6xx_isam_mode val)
 }
 #define A6XX_SP_MODE_CONTROL_SHARED_CONSTS_ENABLE		0x00000008
 
+#define REG_A7XX_SP_UNKNOWN_AB01				0x0000ab01
+
+#define REG_A7XX_SP_UNKNOWN_AB02				0x0000ab02
+
 #define REG_A6XX_SP_FS_CONFIG					0x0000ab04
 #define A6XX_SP_FS_CONFIG_BINDLESS_TEX				0x00000001
 #define A6XX_SP_FS_CONFIG_BINDLESS_SAMP				0x00000002
@@ -6715,7 +6806,7 @@ static inline uint32_t A6XX_SP_FS_CONFIG_NIBO(uint32_t val)
 
 #define REG_A6XX_SP_FS_INSTRLEN					0x0000ab05
 
-static inline uint32_t REG_A6XX_SP_BINDLESS_BASE(uint32_t i0) { return 0x0000ab10 + 0x2*i0; }
+#define REG_A6XX_SP_BINDLESS_BASE(i0) (0x0000ab10 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_SP_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000ab10 + 0x2*i0; }
 #define A6XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
@@ -6724,23 +6815,37 @@ static inline uint32_t A6XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx_bind
 {
 	return ((val) << A6XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A6XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
-#define A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffc
+#define A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffffffffffc
 #define A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT		2
-static inline uint32_t A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR(uint32_t val)
+static inline uint32_t A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
 {
-	return ((val >> 2) << A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
 }
 
-#define REG_A6XX_SP_IBO						0x0000ab1a
-#define A6XX_SP_IBO__MASK					0xffffffff
-#define A6XX_SP_IBO__SHIFT					0
-static inline uint32_t A6XX_SP_IBO(uint32_t val)
+#define REG_A7XX_SP_BINDLESS_BASE(i0) (0x0000ab0a + 0x2*(i0))
+
+static inline uint32_t REG_A7XX_SP_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000ab0a + 0x2*i0; }
+#define A7XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
+#define A7XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT	0
+static inline uint32_t A7XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx_bindless_descriptor_size val)
 {
-	return ((val) << A6XX_SP_IBO__SHIFT) & A6XX_SP_IBO__MASK;
+	return ((val) << A7XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A7XX_SP_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
+#define A7XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffffffffffc
+#define A7XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT		2
+static inline uint32_t A7XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A7XX_SP_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+}
+
+#define REG_A6XX_SP_IBO						0x0000ab1a
 
 #define REG_A6XX_SP_IBO_COUNT					0x0000ab20
 
+#define REG_A7XX_SP_UNKNOWN_AB22				0x0000ab22
+
 #define REG_A6XX_SP_2D_DST_FORMAT				0x0000acc0
 #define A6XX_SP_2D_DST_FORMAT_NORM				0x00000001
 #define A6XX_SP_2D_DST_FORMAT_SINT				0x00000002
@@ -6759,6 +6864,24 @@ static inline uint32_t A6XX_SP_2D_DST_FORMAT_MASK(uint32_t val)
 	return ((val) << A6XX_SP_2D_DST_FORMAT_MASK__SHIFT) & A6XX_SP_2D_DST_FORMAT_MASK__MASK;
 }
 
+#define REG_A7XX_SP_2D_DST_FORMAT				0x0000a9bf
+#define A7XX_SP_2D_DST_FORMAT_NORM				0x00000001
+#define A7XX_SP_2D_DST_FORMAT_SINT				0x00000002
+#define A7XX_SP_2D_DST_FORMAT_UINT				0x00000004
+#define A7XX_SP_2D_DST_FORMAT_COLOR_FORMAT__MASK		0x000007f8
+#define A7XX_SP_2D_DST_FORMAT_COLOR_FORMAT__SHIFT		3
+static inline uint32_t A7XX_SP_2D_DST_FORMAT_COLOR_FORMAT(enum a6xx_format val)
+{
+	return ((val) << A7XX_SP_2D_DST_FORMAT_COLOR_FORMAT__SHIFT) & A7XX_SP_2D_DST_FORMAT_COLOR_FORMAT__MASK;
+}
+#define A7XX_SP_2D_DST_FORMAT_SRGB				0x00000800
+#define A7XX_SP_2D_DST_FORMAT_MASK__MASK			0x0000f000
+#define A7XX_SP_2D_DST_FORMAT_MASK__SHIFT			12
+static inline uint32_t A7XX_SP_2D_DST_FORMAT_MASK(uint32_t val)
+{
+	return ((val) << A7XX_SP_2D_DST_FORMAT_MASK__SHIFT) & A7XX_SP_2D_DST_FORMAT_MASK__MASK;
+}
+
 #define REG_A6XX_SP_DBG_ECO_CNTL				0x0000ae00
 
 #define REG_A6XX_SP_ADDR_MODE_CNTL				0x0000ae01
@@ -6770,6 +6893,14 @@ static inline uint32_t A6XX_SP_2D_DST_FORMAT_MASK(uint32_t val)
 #define REG_A6XX_SP_FLOAT_CNTL					0x0000ae04
 #define A6XX_SP_FLOAT_CNTL_F16_NO_INF				0x00000008
 
+#define REG_A7XX_SP_UNKNOWN_AE06				0x0000ae06
+
+#define REG_A7XX_SP_UNKNOWN_AE08				0x0000ae08
+
+#define REG_A7XX_SP_UNKNOWN_AE09				0x0000ae09
+
+#define REG_A7XX_SP_UNKNOWN_AE0A				0x0000ae0a
+
 #define REG_A6XX_SP_PERFCTR_ENABLE				0x0000ae0f
 #define A6XX_SP_PERFCTR_ENABLE_VS				0x00000001
 #define A6XX_SP_PERFCTR_ENABLE_HS				0x00000002
@@ -6778,23 +6909,25 @@ static inline uint32_t A6XX_SP_2D_DST_FORMAT_MASK(uint32_t val)
 #define A6XX_SP_PERFCTR_ENABLE_FS				0x00000010
 #define A6XX_SP_PERFCTR_ENABLE_CS				0x00000020
 
-static inline uint32_t REG_A6XX_SP_PERFCTR_SP_SEL(uint32_t i0) { return 0x0000ae10 + 0x1*i0; }
+#define REG_A6XX_SP_PERFCTR_SP_SEL(i0) (0x0000ae10 + 0x1*(i0))
 
-static inline uint32_t REG_A7XX_SP_PERFCTR_HLSQ_SEL(uint32_t i0) { return 0x0000ae60 + 0x1*i0; }
+#define REG_A7XX_SP_PERFCTR_HLSQ_SEL(i0) (0x0000ae60 + 0x1*(i0))
+
+#define REG_A7XX_SP_UNKNOWN_AE6A				0x0000ae6a
+
+#define REG_A7XX_SP_UNKNOWN_AE6B				0x0000ae6b
+
+#define REG_A7XX_SP_UNKNOWN_AE6C				0x0000ae6c
 
 #define REG_A7XX_SP_READ_SEL					0x0000ae6d
 
-static inline uint32_t REG_A7XX_SP_PERFCTR_SP_SEL(uint32_t i0) { return 0x0000ae80 + 0x1*i0; }
+#define REG_A7XX_SP_UNKNOWN_AE73				0x0000ae73
+
+#define REG_A7XX_SP_PERFCTR_SP_SEL(i0) (0x0000ae80 + 0x1*(i0))
 
 #define REG_A6XX_SP_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE	0x0000be22
 
 #define REG_A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR		0x0000b180
-#define A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR__MASK		0xffffffff
-#define A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR__SHIFT		0
-static inline uint32_t A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR__SHIFT) & A6XX_SP_PS_TP_BORDER_COLOR_BASE_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_UNKNOWN_B182				0x0000b182
 
@@ -6828,12 +6961,6 @@ static inline uint32_t A6XX_SP_TP_DEST_MSAA_CNTL_SAMPLES(enum a3xx_msaa_samples
 #define A6XX_SP_TP_DEST_MSAA_CNTL_MSAA_DISABLE			0x00000004
 
 #define REG_A6XX_SP_TP_BORDER_COLOR_BASE_ADDR			0x0000b302
-#define A6XX_SP_TP_BORDER_COLOR_BASE_ADDR__MASK			0xffffffff
-#define A6XX_SP_TP_BORDER_COLOR_BASE_ADDR__SHIFT		0
-static inline uint32_t A6XX_SP_TP_BORDER_COLOR_BASE_ADDR(uint32_t val)
-{
-	return ((val) << A6XX_SP_TP_BORDER_COLOR_BASE_ADDR__SHIFT) & A6XX_SP_TP_BORDER_COLOR_BASE_ADDR__MASK;
-}
 
 #define REG_A6XX_SP_TP_SAMPLE_CONFIG				0x0000b304
 #define A6XX_SP_TP_SAMPLE_CONFIG_UNK0				0x00000001
@@ -6844,49 +6971,49 @@ static inline uint32_t A6XX_SP_TP_BORDER_COLOR_BASE_ADDR(uint32_t val)
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_0_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_1_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_2_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y__MASK;
 }
 
 #define REG_A6XX_SP_TP_SAMPLE_LOCATION_1			0x0000b306
@@ -6894,49 +7021,49 @@ static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_0_SAMPLE_3_Y(float val)
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT		0
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK		0x000000f0
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT		4
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_0_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK		0x00000f00
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT		8
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK		0x0000f000
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT		12
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_1_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK		0x000f0000
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT		16
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK		0x00f00000
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT		20
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_2_Y__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK		0x0f000000
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT		24
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_X__MASK;
 }
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK		0xf0000000
 #define A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT		28
 static inline uint32_t A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y(float val)
 {
-	return ((((int32_t)(val * 1.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
+	return ((((int32_t)(val * 16.0))) << A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__SHIFT) & A6XX_SP_TP_SAMPLE_LOCATION_1_SAMPLE_3_Y__MASK;
 }
 
 #define REG_A6XX_SP_TP_WINDOW_OFFSET				0x0000b307
@@ -6967,6 +7094,8 @@ static inline uint32_t A6XX_SP_TP_MODE_CNTL_UNK3(uint32_t val)
 	return ((val) << A6XX_SP_TP_MODE_CNTL_UNK3__SHIFT) & A6XX_SP_TP_MODE_CNTL_UNK3__MASK;
 }
 
+#define REG_A7XX_SP_UNKNOWN_B310				0x0000b310
+
 #define REG_A6XX_SP_PS_2D_SRC_INFO				0x0000b4c0
 #define A6XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__MASK		0x000000ff
 #define A6XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__SHIFT		0
@@ -7024,12 +7153,6 @@ static inline uint32_t A6XX_SP_PS_2D_SRC_SIZE_HEIGHT(uint32_t val)
 }
 
 #define REG_A6XX_SP_PS_2D_SRC					0x0000b4c2
-#define A6XX_SP_PS_2D_SRC__MASK					0xffffffff
-#define A6XX_SP_PS_2D_SRC__SHIFT				0
-static inline uint32_t A6XX_SP_PS_2D_SRC(uint32_t val)
-{
-	return ((val) << A6XX_SP_PS_2D_SRC__SHIFT) & A6XX_SP_PS_2D_SRC__MASK;
-}
 
 #define REG_A6XX_SP_PS_2D_SRC_PITCH				0x0000b4c4
 #define A6XX_SP_PS_2D_SRC_PITCH_UNK0__MASK			0x000001ff
@@ -7042,47 +7165,129 @@ static inline uint32_t A6XX_SP_PS_2D_SRC_PITCH_UNK0(uint32_t val)
 #define A6XX_SP_PS_2D_SRC_PITCH_PITCH__SHIFT			9
 static inline uint32_t A6XX_SP_PS_2D_SRC_PITCH_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_SP_PS_2D_SRC_PITCH_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_PITCH_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_SP_PS_2D_SRC_PITCH_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_PITCH_PITCH__MASK;
 }
 
-#define REG_A6XX_SP_PS_2D_SRC_PLANE1				0x0000b4c5
-#define A6XX_SP_PS_2D_SRC_PLANE1__MASK				0xffffffff
-#define A6XX_SP_PS_2D_SRC_PLANE1__SHIFT				0
-static inline uint32_t A6XX_SP_PS_2D_SRC_PLANE1(uint32_t val)
+#define REG_A7XX_SP_PS_2D_SRC_INFO				0x0000b2c0
+#define A7XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__MASK		0x000000ff
+#define A7XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__SHIFT		0
+static inline uint32_t A7XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT(enum a6xx_format val)
 {
-	return ((val) << A6XX_SP_PS_2D_SRC_PLANE1__SHIFT) & A6XX_SP_PS_2D_SRC_PLANE1__MASK;
+	return ((val) << A7XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__SHIFT) & A7XX_SP_PS_2D_SRC_INFO_COLOR_FORMAT__MASK;
 }
+#define A7XX_SP_PS_2D_SRC_INFO_TILE_MODE__MASK			0x00000300
+#define A7XX_SP_PS_2D_SRC_INFO_TILE_MODE__SHIFT			8
+static inline uint32_t A7XX_SP_PS_2D_SRC_INFO_TILE_MODE(enum a6xx_tile_mode val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_INFO_TILE_MODE__SHIFT) & A7XX_SP_PS_2D_SRC_INFO_TILE_MODE__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_INFO_COLOR_SWAP__MASK			0x00000c00
+#define A7XX_SP_PS_2D_SRC_INFO_COLOR_SWAP__SHIFT		10
+static inline uint32_t A7XX_SP_PS_2D_SRC_INFO_COLOR_SWAP(enum a3xx_color_swap val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_INFO_COLOR_SWAP__SHIFT) & A7XX_SP_PS_2D_SRC_INFO_COLOR_SWAP__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_INFO_FLAGS				0x00001000
+#define A7XX_SP_PS_2D_SRC_INFO_SRGB				0x00002000
+#define A7XX_SP_PS_2D_SRC_INFO_SAMPLES__MASK			0x0000c000
+#define A7XX_SP_PS_2D_SRC_INFO_SAMPLES__SHIFT			14
+static inline uint32_t A7XX_SP_PS_2D_SRC_INFO_SAMPLES(enum a3xx_msaa_samples val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_INFO_SAMPLES__SHIFT) & A7XX_SP_PS_2D_SRC_INFO_SAMPLES__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_INFO_FILTER				0x00010000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK17				0x00020000
+#define A7XX_SP_PS_2D_SRC_INFO_SAMPLES_AVERAGE			0x00040000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK19				0x00080000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK20				0x00100000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK21				0x00200000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK22				0x00400000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK23__MASK			0x07800000
+#define A7XX_SP_PS_2D_SRC_INFO_UNK23__SHIFT			23
+static inline uint32_t A7XX_SP_PS_2D_SRC_INFO_UNK23(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_INFO_UNK23__SHIFT) & A7XX_SP_PS_2D_SRC_INFO_UNK23__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_INFO_UNK28				0x10000000
+
+#define REG_A7XX_SP_PS_2D_SRC_SIZE				0x0000b2c1
+#define A7XX_SP_PS_2D_SRC_SIZE_WIDTH__MASK			0x00007fff
+#define A7XX_SP_PS_2D_SRC_SIZE_WIDTH__SHIFT			0
+static inline uint32_t A7XX_SP_PS_2D_SRC_SIZE_WIDTH(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_SIZE_WIDTH__SHIFT) & A7XX_SP_PS_2D_SRC_SIZE_WIDTH__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_SIZE_HEIGHT__MASK			0x3fff8000
+#define A7XX_SP_PS_2D_SRC_SIZE_HEIGHT__SHIFT			15
+static inline uint32_t A7XX_SP_PS_2D_SRC_SIZE_HEIGHT(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_SIZE_HEIGHT__SHIFT) & A7XX_SP_PS_2D_SRC_SIZE_HEIGHT__MASK;
+}
+
+#define REG_A7XX_SP_PS_2D_SRC					0x0000b2c2
+
+#define REG_A7XX_SP_PS_2D_SRC_PITCH				0x0000b2c4
+#define A7XX_SP_PS_2D_SRC_PITCH_UNK0__MASK			0x000001ff
+#define A7XX_SP_PS_2D_SRC_PITCH_UNK0__SHIFT			0
+static inline uint32_t A7XX_SP_PS_2D_SRC_PITCH_UNK0(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_SRC_PITCH_UNK0__SHIFT) & A7XX_SP_PS_2D_SRC_PITCH_UNK0__MASK;
+}
+#define A7XX_SP_PS_2D_SRC_PITCH_PITCH__MASK			0x00fffe00
+#define A7XX_SP_PS_2D_SRC_PITCH_PITCH__SHIFT			9
+static inline uint32_t A7XX_SP_PS_2D_SRC_PITCH_PITCH(uint32_t val)
+{
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A7XX_SP_PS_2D_SRC_PITCH_PITCH__SHIFT) & A7XX_SP_PS_2D_SRC_PITCH_PITCH__MASK;
+}
+
+#define REG_A6XX_SP_PS_2D_SRC_PLANE1				0x0000b4c5
 
 #define REG_A6XX_SP_PS_2D_SRC_PLANE_PITCH			0x0000b4c7
 #define A6XX_SP_PS_2D_SRC_PLANE_PITCH__MASK			0x00000fff
 #define A6XX_SP_PS_2D_SRC_PLANE_PITCH__SHIFT			0
 static inline uint32_t A6XX_SP_PS_2D_SRC_PLANE_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_SP_PS_2D_SRC_PLANE_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_PLANE_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_SP_PS_2D_SRC_PLANE_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_PLANE_PITCH__MASK;
 }
 
 #define REG_A6XX_SP_PS_2D_SRC_PLANE2				0x0000b4c8
-#define A6XX_SP_PS_2D_SRC_PLANE2__MASK				0xffffffff
-#define A6XX_SP_PS_2D_SRC_PLANE2__SHIFT				0
-static inline uint32_t A6XX_SP_PS_2D_SRC_PLANE2(uint32_t val)
+
+#define REG_A7XX_SP_PS_2D_SRC_PLANE1				0x0000b2c5
+
+#define REG_A7XX_SP_PS_2D_SRC_PLANE_PITCH			0x0000b2c7
+#define A7XX_SP_PS_2D_SRC_PLANE_PITCH__MASK			0x00000fff
+#define A7XX_SP_PS_2D_SRC_PLANE_PITCH__SHIFT			0
+static inline uint32_t A7XX_SP_PS_2D_SRC_PLANE_PITCH(uint32_t val)
 {
-	return ((val) << A6XX_SP_PS_2D_SRC_PLANE2__SHIFT) & A6XX_SP_PS_2D_SRC_PLANE2__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A7XX_SP_PS_2D_SRC_PLANE_PITCH__SHIFT) & A7XX_SP_PS_2D_SRC_PLANE_PITCH__MASK;
 }
 
+#define REG_A7XX_SP_PS_2D_SRC_PLANE2				0x0000b2c8
+
 #define REG_A6XX_SP_PS_2D_SRC_FLAGS				0x0000b4ca
-#define A6XX_SP_PS_2D_SRC_FLAGS__MASK				0xffffffff
-#define A6XX_SP_PS_2D_SRC_FLAGS__SHIFT				0
-static inline uint32_t A6XX_SP_PS_2D_SRC_FLAGS(uint32_t val)
-{
-	return ((val) << A6XX_SP_PS_2D_SRC_FLAGS__SHIFT) & A6XX_SP_PS_2D_SRC_FLAGS__MASK;
-}
 
 #define REG_A6XX_SP_PS_2D_SRC_FLAGS_PITCH			0x0000b4cc
 #define A6XX_SP_PS_2D_SRC_FLAGS_PITCH__MASK			0x000000ff
 #define A6XX_SP_PS_2D_SRC_FLAGS_PITCH__SHIFT			0
 static inline uint32_t A6XX_SP_PS_2D_SRC_FLAGS_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_SP_PS_2D_SRC_FLAGS_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_FLAGS_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_SP_PS_2D_SRC_FLAGS_PITCH__SHIFT) & A6XX_SP_PS_2D_SRC_FLAGS_PITCH__MASK;
+}
+
+#define REG_A7XX_SP_PS_2D_SRC_FLAGS				0x0000b2ca
+
+#define REG_A7XX_SP_PS_2D_SRC_FLAGS_PITCH			0x0000b2cc
+#define A7XX_SP_PS_2D_SRC_FLAGS_PITCH__MASK			0x000000ff
+#define A7XX_SP_PS_2D_SRC_FLAGS_PITCH__SHIFT			0
+static inline uint32_t A7XX_SP_PS_2D_SRC_FLAGS_PITCH(uint32_t val)
+{
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A7XX_SP_PS_2D_SRC_FLAGS_PITCH__SHIFT) & A7XX_SP_PS_2D_SRC_FLAGS_PITCH__MASK;
 }
 
 #define REG_A6XX_SP_PS_UNKNOWN_B4CD				0x0000b4cd
@@ -7107,6 +7312,44 @@ static inline uint32_t A6XX_SP_WINDOW_OFFSET_Y(uint32_t val)
 	return ((val) << A6XX_SP_WINDOW_OFFSET_Y__SHIFT) & A6XX_SP_WINDOW_OFFSET_Y__MASK;
 }
 
+#define REG_A7XX_SP_PS_UNKNOWN_B4CD				0x0000b2cd
+
+#define REG_A7XX_SP_PS_UNKNOWN_B4CE				0x0000b2ce
+
+#define REG_A7XX_SP_PS_UNKNOWN_B4CF				0x0000b2cf
+
+#define REG_A7XX_SP_PS_UNKNOWN_B4D0				0x0000b2d0
+
+#define REG_A7XX_SP_PS_2D_WINDOW_OFFSET				0x0000b2d1
+#define A7XX_SP_PS_2D_WINDOW_OFFSET_X__MASK			0x00003fff
+#define A7XX_SP_PS_2D_WINDOW_OFFSET_X__SHIFT			0
+static inline uint32_t A7XX_SP_PS_2D_WINDOW_OFFSET_X(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_WINDOW_OFFSET_X__SHIFT) & A7XX_SP_PS_2D_WINDOW_OFFSET_X__MASK;
+}
+#define A7XX_SP_PS_2D_WINDOW_OFFSET_Y__MASK			0x3fff0000
+#define A7XX_SP_PS_2D_WINDOW_OFFSET_Y__SHIFT			16
+static inline uint32_t A7XX_SP_PS_2D_WINDOW_OFFSET_Y(uint32_t val)
+{
+	return ((val) << A7XX_SP_PS_2D_WINDOW_OFFSET_Y__SHIFT) & A7XX_SP_PS_2D_WINDOW_OFFSET_Y__MASK;
+}
+
+#define REG_A7XX_SP_PS_UNKNOWN_B2D2				0x0000b2d2
+
+#define REG_A7XX_SP_WINDOW_OFFSET				0x0000ab21
+#define A7XX_SP_WINDOW_OFFSET_X__MASK				0x00003fff
+#define A7XX_SP_WINDOW_OFFSET_X__SHIFT				0
+static inline uint32_t A7XX_SP_WINDOW_OFFSET_X(uint32_t val)
+{
+	return ((val) << A7XX_SP_WINDOW_OFFSET_X__SHIFT) & A7XX_SP_WINDOW_OFFSET_X__MASK;
+}
+#define A7XX_SP_WINDOW_OFFSET_Y__MASK				0x3fff0000
+#define A7XX_SP_WINDOW_OFFSET_Y__SHIFT				16
+static inline uint32_t A7XX_SP_WINDOW_OFFSET_Y(uint32_t val)
+{
+	return ((val) << A7XX_SP_WINDOW_OFFSET_Y__SHIFT) & A7XX_SP_WINDOW_OFFSET_Y__MASK;
+}
+
 #define REG_A6XX_TPL1_DBG_ECO_CNTL				0x0000b600
 
 #define REG_A6XX_TPL1_ADDR_MODE_CNTL				0x0000b601
@@ -7147,53 +7390,125 @@ static inline uint32_t A6XX_TPL1_NC_MODE_CNTL_UNK6(uint32_t val)
 
 #define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4			0x0000b60c
 
-static inline uint32_t REG_A6XX_TPL1_PERFCTR_TP_SEL(uint32_t i0) { return 0x0000b610 + 0x1*i0; }
+#define REG_A7XX_TPL1_BICUBIC_WEIGHTS_TABLE_0			0x0000b608
+
+#define REG_A7XX_TPL1_BICUBIC_WEIGHTS_TABLE_1			0x0000b609
+
+#define REG_A7XX_TPL1_BICUBIC_WEIGHTS_TABLE_2			0x0000b60a
+
+#define REG_A7XX_TPL1_BICUBIC_WEIGHTS_TABLE_3			0x0000b60b
+
+#define REG_A7XX_TPL1_BICUBIC_WEIGHTS_TABLE_4			0x0000b60c
+
+#define REG_A6XX_TPL1_PERFCTR_TP_SEL(i0) (0x0000b610 + 0x1*(i0))
 
 #define REG_A6XX_HLSQ_VS_CNTL					0x0000b800
 #define A6XX_HLSQ_VS_CNTL_CONSTLEN__MASK			0x000000ff
 #define A6XX_HLSQ_VS_CNTL_CONSTLEN__SHIFT			0
 static inline uint32_t A6XX_HLSQ_VS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_VS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_VS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_VS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_VS_CNTL_CONSTLEN__MASK;
 }
 #define A6XX_HLSQ_VS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_VS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
 #define REG_A6XX_HLSQ_HS_CNTL					0x0000b801
 #define A6XX_HLSQ_HS_CNTL_CONSTLEN__MASK			0x000000ff
 #define A6XX_HLSQ_HS_CNTL_CONSTLEN__SHIFT			0
 static inline uint32_t A6XX_HLSQ_HS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_HS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_HS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_HS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_HS_CNTL_CONSTLEN__MASK;
 }
 #define A6XX_HLSQ_HS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_HS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
 #define REG_A6XX_HLSQ_DS_CNTL					0x0000b802
 #define A6XX_HLSQ_DS_CNTL_CONSTLEN__MASK			0x000000ff
 #define A6XX_HLSQ_DS_CNTL_CONSTLEN__SHIFT			0
 static inline uint32_t A6XX_HLSQ_DS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_DS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_DS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_DS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_DS_CNTL_CONSTLEN__MASK;
 }
 #define A6XX_HLSQ_DS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_DS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
 #define REG_A6XX_HLSQ_GS_CNTL					0x0000b803
 #define A6XX_HLSQ_GS_CNTL_CONSTLEN__MASK			0x000000ff
 #define A6XX_HLSQ_GS_CNTL_CONSTLEN__SHIFT			0
 static inline uint32_t A6XX_HLSQ_GS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_GS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_GS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_GS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_GS_CNTL_CONSTLEN__MASK;
 }
 #define A6XX_HLSQ_GS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_GS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
-#define REG_A6XX_HLSQ_LOAD_STATE_GEOM_CMD			0x0000b820
+#define REG_A7XX_HLSQ_VS_CNTL					0x0000a827
+#define A7XX_HLSQ_VS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_VS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_VS_CNTL_CONSTLEN(uint32_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_VS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_VS_CNTL_CONSTLEN__MASK;
+}
+#define A7XX_HLSQ_VS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_VS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
-#define REG_A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR		0x0000b821
-#define A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR__MASK		0xffffffff
-#define A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR__SHIFT		0
-static inline uint32_t A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR(uint32_t val)
+#define REG_A7XX_HLSQ_HS_CNTL					0x0000a83f
+#define A7XX_HLSQ_HS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_HS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_HS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val) << A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR__SHIFT) & A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_HS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_HS_CNTL_CONSTLEN__MASK;
 }
+#define A7XX_HLSQ_HS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_HS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_DS_CNTL					0x0000a867
+#define A7XX_HLSQ_DS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_DS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_DS_CNTL_CONSTLEN(uint32_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_DS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_DS_CNTL_CONSTLEN__MASK;
+}
+#define A7XX_HLSQ_DS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_DS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_GS_CNTL					0x0000a898
+#define A7XX_HLSQ_GS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_GS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_GS_CNTL_CONSTLEN(uint32_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_GS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_GS_CNTL_CONSTLEN__MASK;
+}
+#define A7XX_HLSQ_GS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_GS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_FS_UNKNOWN_A9AA				0x0000a9aa
+#define A7XX_HLSQ_FS_UNKNOWN_A9AA_CONSTS_LOAD_DISABLE		0x00000001
+
+#define REG_A7XX_HLSQ_UNKNOWN_A9AC				0x0000a9ac
+
+#define REG_A7XX_HLSQ_UNKNOWN_A9AD				0x0000a9ad
+
+#define REG_A7XX_HLSQ_UNKNOWN_A9AE				0x0000a9ae
+#define A7XX_HLSQ_UNKNOWN_A9AE_UNK0__MASK			0x000000ff
+#define A7XX_HLSQ_UNKNOWN_A9AE_UNK0__SHIFT			0
+static inline uint32_t A7XX_HLSQ_UNKNOWN_A9AE_UNK0(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_UNKNOWN_A9AE_UNK0__SHIFT) & A7XX_HLSQ_UNKNOWN_A9AE_UNK0__MASK;
+}
+#define A7XX_HLSQ_UNKNOWN_A9AE_UNK8				0x00000100
+
+#define REG_A6XX_HLSQ_LOAD_STATE_GEOM_CMD			0x0000b820
+
+#define REG_A6XX_HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR		0x0000b821
 
 #define REG_A6XX_HLSQ_LOAD_STATE_GEOM_DATA			0x0000b823
 
@@ -7215,8 +7530,12 @@ static inline uint32_t A6XX_HLSQ_FS_CNTL_0_UNK2(uint32_t val)
 #define REG_A6XX_HLSQ_UNKNOWN_B981				0x0000b981
 
 #define REG_A6XX_HLSQ_CONTROL_1_REG				0x0000b982
-
-#define REG_A7XX_HLSQ_CONTROL_1_REG				0x0000a9c7
+#define A6XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__MASK	0x00000007
+#define A6XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__SHIFT	0
+static inline uint32_t A6XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD(uint32_t val)
+{
+	return ((val) << A6XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__SHIFT) & A6XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__MASK;
+}
 
 #define REG_A6XX_HLSQ_CONTROL_2_REG				0x0000b983
 #define A6XX_HLSQ_CONTROL_2_REG_FACEREGID__MASK			0x000000ff
@@ -7244,32 +7563,6 @@ static inline uint32_t A6XX_HLSQ_CONTROL_2_REG_CENTERRHW(uint32_t val)
 	return ((val) << A6XX_HLSQ_CONTROL_2_REG_CENTERRHW__SHIFT) & A6XX_HLSQ_CONTROL_2_REG_CENTERRHW__MASK;
 }
 
-#define REG_A7XX_HLSQ_CONTROL_2_REG				0x0000a9c8
-#define A7XX_HLSQ_CONTROL_2_REG_FACEREGID__MASK			0x000000ff
-#define A7XX_HLSQ_CONTROL_2_REG_FACEREGID__SHIFT		0
-static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_FACEREGID(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_2_REG_FACEREGID__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_FACEREGID__MASK;
-}
-#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__MASK			0x0000ff00
-#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__SHIFT			8
-static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_SAMPLEID(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__MASK;
-}
-#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__MASK		0x00ff0000
-#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__SHIFT		16
-static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__MASK;
-}
-#define A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__MASK			0xff000000
-#define A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__SHIFT		24
-static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_CENTERRHW(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__MASK;
-}
-
 #define REG_A6XX_HLSQ_CONTROL_3_REG				0x0000b984
 #define A6XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__MASK		0x000000ff
 #define A6XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__SHIFT		0
@@ -7296,32 +7589,6 @@ static inline uint32_t A6XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID(uint32_t val)
 	return ((val) << A6XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__SHIFT) & A6XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__MASK;
 }
 
-#define REG_A7XX_HLSQ_CONTROL_3_REG				0x0000a9c9
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__MASK		0x000000ff
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__SHIFT		0
-static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__MASK;
-}
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__MASK		0x0000ff00
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__SHIFT		8
-static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__MASK;
-}
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__MASK		0x00ff0000
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__SHIFT	16
-static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__MASK;
-}
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__MASK	0xff000000
-#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__SHIFT	24
-static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID(uint32_t val)
-{
-	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__MASK;
-}
-
 #define REG_A6XX_HLSQ_CONTROL_4_REG				0x0000b985
 #define A6XX_HLSQ_CONTROL_4_REG_IJ_PERSP_SAMPLE__MASK		0x000000ff
 #define A6XX_HLSQ_CONTROL_4_REG_IJ_PERSP_SAMPLE__SHIFT		0
@@ -7348,6 +7615,108 @@ static inline uint32_t A6XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID(uint32_t val)
 	return ((val) << A6XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID__SHIFT) & A6XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID__MASK;
 }
 
+#define REG_A6XX_HLSQ_CONTROL_5_REG				0x0000b986
+#define A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__MASK		0x000000ff
+#define A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__SHIFT		0
+static inline uint32_t A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID(uint32_t val)
+{
+	return ((val) << A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__SHIFT) & A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__MASK;
+}
+#define A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__MASK	0x0000ff00
+#define A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__SHIFT	8
+static inline uint32_t A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID(uint32_t val)
+{
+	return ((val) << A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__SHIFT) & A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__MASK;
+}
+
+#define REG_A6XX_HLSQ_CS_CNTL					0x0000b987
+#define A6XX_HLSQ_CS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A6XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A6XX_HLSQ_CS_CNTL_CONSTLEN(uint32_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_CS_CNTL_CONSTLEN__MASK;
+}
+#define A6XX_HLSQ_CS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_CS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_UNKNOWN_A9C5				0x0000a9c5
+
+#define REG_A7XX_HLSQ_FS_CNTL_0					0x0000a9c6
+#define A7XX_HLSQ_FS_CNTL_0_THREADSIZE__MASK			0x00000001
+#define A7XX_HLSQ_FS_CNTL_0_THREADSIZE__SHIFT			0
+static inline uint32_t A7XX_HLSQ_FS_CNTL_0_THREADSIZE(enum a6xx_threadsize val)
+{
+	return ((val) << A7XX_HLSQ_FS_CNTL_0_THREADSIZE__SHIFT) & A7XX_HLSQ_FS_CNTL_0_THREADSIZE__MASK;
+}
+#define A7XX_HLSQ_FS_CNTL_0_VARYINGS				0x00000002
+#define A7XX_HLSQ_FS_CNTL_0_UNK2__MASK				0x00000ffc
+#define A7XX_HLSQ_FS_CNTL_0_UNK2__SHIFT				2
+static inline uint32_t A7XX_HLSQ_FS_CNTL_0_UNK2(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_FS_CNTL_0_UNK2__SHIFT) & A7XX_HLSQ_FS_CNTL_0_UNK2__MASK;
+}
+
+#define REG_A7XX_HLSQ_CONTROL_1_REG				0x0000a9c7
+#define A7XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__MASK	0x00000007
+#define A7XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__SHIFT	0
+static inline uint32_t A7XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__SHIFT) & A7XX_HLSQ_CONTROL_1_REG_PRIMALLOCTHRESHOLD__MASK;
+}
+
+#define REG_A7XX_HLSQ_CONTROL_2_REG				0x0000a9c8
+#define A7XX_HLSQ_CONTROL_2_REG_FACEREGID__MASK			0x000000ff
+#define A7XX_HLSQ_CONTROL_2_REG_FACEREGID__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_FACEREGID(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_2_REG_FACEREGID__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_FACEREGID__MASK;
+}
+#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__MASK			0x0000ff00
+#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__SHIFT			8
+static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_SAMPLEID(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_SAMPLEID__MASK;
+}
+#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__MASK		0x00ff0000
+#define A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__SHIFT		16
+static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_SAMPLEMASK__MASK;
+}
+#define A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__MASK			0xff000000
+#define A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__SHIFT		24
+static inline uint32_t A7XX_HLSQ_CONTROL_2_REG_CENTERRHW(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__SHIFT) & A7XX_HLSQ_CONTROL_2_REG_CENTERRHW__MASK;
+}
+
+#define REG_A7XX_HLSQ_CONTROL_3_REG				0x0000a9c9
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__MASK		0x000000ff
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_PIXEL__MASK;
+}
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__MASK		0x0000ff00
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__SHIFT		8
+static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_PIXEL__MASK;
+}
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__MASK		0x00ff0000
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__SHIFT	16
+static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_PERSP_CENTROID__MASK;
+}
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__MASK	0xff000000
+#define A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__SHIFT	24
+static inline uint32_t A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__SHIFT) & A7XX_HLSQ_CONTROL_3_REG_IJ_LINEAR_CENTROID__MASK;
+}
+
 #define REG_A7XX_HLSQ_CONTROL_4_REG				0x0000a9ca
 #define A7XX_HLSQ_CONTROL_4_REG_IJ_PERSP_SAMPLE__MASK		0x000000ff
 #define A7XX_HLSQ_CONTROL_4_REG_IJ_PERSP_SAMPLE__SHIFT		0
@@ -7374,20 +7743,6 @@ static inline uint32_t A7XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID(uint32_t val)
 	return ((val) << A7XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID__SHIFT) & A7XX_HLSQ_CONTROL_4_REG_ZWCOORDREGID__MASK;
 }
 
-#define REG_A6XX_HLSQ_CONTROL_5_REG				0x0000b986
-#define A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__MASK		0x000000ff
-#define A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__SHIFT		0
-static inline uint32_t A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID(uint32_t val)
-{
-	return ((val) << A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__SHIFT) & A6XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__MASK;
-}
-#define A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__MASK	0x0000ff00
-#define A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__SHIFT	8
-static inline uint32_t A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID(uint32_t val)
-{
-	return ((val) << A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__SHIFT) & A6XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__MASK;
-}
-
 #define REG_A7XX_HLSQ_CONTROL_5_REG				0x0000a9cb
 #define A7XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__MASK		0x000000ff
 #define A7XX_HLSQ_CONTROL_5_REG_LINELENGTHREGID__SHIFT		0
@@ -7402,14 +7757,16 @@ static inline uint32_t A7XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID(uint32_t va
 	return ((val) << A7XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__SHIFT) & A7XX_HLSQ_CONTROL_5_REG_FOVEATIONQUALITYREGID__MASK;
 }
 
-#define REG_A6XX_HLSQ_CS_CNTL					0x0000b987
-#define A6XX_HLSQ_CS_CNTL_CONSTLEN__MASK			0x000000ff
-#define A6XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT			0
-static inline uint32_t A6XX_HLSQ_CS_CNTL_CONSTLEN(uint32_t val)
+#define REG_A7XX_HLSQ_CS_CNTL					0x0000a9cd
+#define A7XX_HLSQ_CS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_CS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_CS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_CS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_CS_CNTL_CONSTLEN__MASK;
 }
-#define A6XX_HLSQ_CS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_CS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_CS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
 
 #define REG_A6XX_HLSQ_CS_NDRANGE_0				0x0000b990
 #define A6XX_HLSQ_CS_NDRANGE_0_KERNELDIM__MASK			0x00000003
@@ -7533,19 +7890,136 @@ static inline uint32_t A6XX_HLSQ_CS_CNTL_1_THREADSIZE(enum a6xx_threadsize val)
 
 #define REG_A6XX_HLSQ_CS_KERNEL_GROUP_Z				0x0000b99b
 
-#define REG_A6XX_HLSQ_LOAD_STATE_FRAG_CMD			0x0000b9a0
+#define REG_A7XX_HLSQ_CS_NDRANGE_0				0x0000a9d4
+#define A7XX_HLSQ_CS_NDRANGE_0_KERNELDIM__MASK			0x00000003
+#define A7XX_HLSQ_CS_NDRANGE_0_KERNELDIM__SHIFT			0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_0_KERNELDIM(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_0_KERNELDIM__SHIFT) & A7XX_HLSQ_CS_NDRANGE_0_KERNELDIM__MASK;
+}
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEX__MASK			0x00000ffc
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEX__SHIFT		2
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEX(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEX__SHIFT) & A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEX__MASK;
+}
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEY__MASK			0x003ff000
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEY__SHIFT		12
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEY(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEY__SHIFT) & A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEY__MASK;
+}
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEZ__MASK			0xffc00000
+#define A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEZ__SHIFT		22
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEZ(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEZ__SHIFT) & A7XX_HLSQ_CS_NDRANGE_0_LOCALSIZEZ__MASK;
+}
 
-#define REG_A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR		0x0000b9a1
-#define A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR__MASK		0xffffffff
-#define A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR__SHIFT		0
-static inline uint32_t A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR(uint32_t val)
+#define REG_A7XX_HLSQ_CS_NDRANGE_1				0x0000a9d5
+#define A7XX_HLSQ_CS_NDRANGE_1_GLOBALSIZE_X__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_1_GLOBALSIZE_X__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_1_GLOBALSIZE_X(uint32_t val)
 {
-	return ((val) << A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR__SHIFT) & A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR__MASK;
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_1_GLOBALSIZE_X__SHIFT) & A7XX_HLSQ_CS_NDRANGE_1_GLOBALSIZE_X__MASK;
 }
 
+#define REG_A7XX_HLSQ_CS_NDRANGE_2				0x0000a9d6
+#define A7XX_HLSQ_CS_NDRANGE_2_GLOBALOFF_X__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_2_GLOBALOFF_X__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_2_GLOBALOFF_X(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_2_GLOBALOFF_X__SHIFT) & A7XX_HLSQ_CS_NDRANGE_2_GLOBALOFF_X__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_NDRANGE_3				0x0000a9d7
+#define A7XX_HLSQ_CS_NDRANGE_3_GLOBALSIZE_Y__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_3_GLOBALSIZE_Y__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_3_GLOBALSIZE_Y(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_3_GLOBALSIZE_Y__SHIFT) & A7XX_HLSQ_CS_NDRANGE_3_GLOBALSIZE_Y__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_NDRANGE_4				0x0000a9d8
+#define A7XX_HLSQ_CS_NDRANGE_4_GLOBALOFF_Y__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_4_GLOBALOFF_Y__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_4_GLOBALOFF_Y(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_4_GLOBALOFF_Y__SHIFT) & A7XX_HLSQ_CS_NDRANGE_4_GLOBALOFF_Y__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_NDRANGE_5				0x0000a9d9
+#define A7XX_HLSQ_CS_NDRANGE_5_GLOBALSIZE_Z__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_5_GLOBALSIZE_Z__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_5_GLOBALSIZE_Z(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_5_GLOBALSIZE_Z__SHIFT) & A7XX_HLSQ_CS_NDRANGE_5_GLOBALSIZE_Z__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_NDRANGE_6				0x0000a9da
+#define A7XX_HLSQ_CS_NDRANGE_6_GLOBALOFF_Z__MASK		0xffffffff
+#define A7XX_HLSQ_CS_NDRANGE_6_GLOBALOFF_Z__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_NDRANGE_6_GLOBALOFF_Z(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_NDRANGE_6_GLOBALOFF_Z__SHIFT) & A7XX_HLSQ_CS_NDRANGE_6_GLOBALOFF_Z__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_KERNEL_GROUP_X				0x0000a9dc
+
+#define REG_A7XX_HLSQ_CS_KERNEL_GROUP_Y				0x0000a9dd
+
+#define REG_A7XX_HLSQ_CS_KERNEL_GROUP_Z				0x0000a9de
+
+#define REG_A7XX_HLSQ_CS_CNTL_1					0x0000a9db
+#define A7XX_HLSQ_CS_CNTL_1_LINEARLOCALIDREGID__MASK		0x000000ff
+#define A7XX_HLSQ_CS_CNTL_1_LINEARLOCALIDREGID__SHIFT		0
+static inline uint32_t A7XX_HLSQ_CS_CNTL_1_LINEARLOCALIDREGID(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_CNTL_1_LINEARLOCALIDREGID__SHIFT) & A7XX_HLSQ_CS_CNTL_1_LINEARLOCALIDREGID__MASK;
+}
+#define A7XX_HLSQ_CS_CNTL_1_THREADSIZE__MASK			0x00000200
+#define A7XX_HLSQ_CS_CNTL_1_THREADSIZE__SHIFT			9
+static inline uint32_t A7XX_HLSQ_CS_CNTL_1_THREADSIZE(enum a6xx_threadsize val)
+{
+	return ((val) << A7XX_HLSQ_CS_CNTL_1_THREADSIZE__SHIFT) & A7XX_HLSQ_CS_CNTL_1_THREADSIZE__MASK;
+}
+#define A7XX_HLSQ_CS_CNTL_1_UNK11				0x00000800
+#define A7XX_HLSQ_CS_CNTL_1_UNK22				0x00400000
+#define A7XX_HLSQ_CS_CNTL_1_UNK26				0x04000000
+#define A7XX_HLSQ_CS_CNTL_1_YALIGN__MASK			0x78000000
+#define A7XX_HLSQ_CS_CNTL_1_YALIGN__SHIFT			27
+static inline uint32_t A7XX_HLSQ_CS_CNTL_1_YALIGN(enum a7xx_cs_yalign val)
+{
+	return ((val) << A7XX_HLSQ_CS_CNTL_1_YALIGN__SHIFT) & A7XX_HLSQ_CS_CNTL_1_YALIGN__MASK;
+}
+
+#define REG_A7XX_HLSQ_CS_LOCAL_SIZE				0x0000a9df
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEX__MASK		0x00000ffc
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEX__SHIFT		2
+static inline uint32_t A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEX(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEX__SHIFT) & A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEX__MASK;
+}
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEY__MASK		0x003ff000
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEY__SHIFT		12
+static inline uint32_t A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEY(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEY__SHIFT) & A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEY__MASK;
+}
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEZ__MASK		0xffc00000
+#define A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEZ__SHIFT		22
+static inline uint32_t A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEZ(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEZ__SHIFT) & A7XX_HLSQ_CS_LOCAL_SIZE_LOCALSIZEZ__MASK;
+}
+
+#define REG_A6XX_HLSQ_LOAD_STATE_FRAG_CMD			0x0000b9a0
+
+#define REG_A6XX_HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR		0x0000b9a1
+
 #define REG_A6XX_HLSQ_LOAD_STATE_FRAG_DATA			0x0000b9a3
 
-static inline uint32_t REG_A6XX_HLSQ_CS_BINDLESS_BASE(uint32_t i0) { return 0x0000b9c0 + 0x2*i0; }
+#define REG_A6XX_HLSQ_CS_BINDLESS_BASE(i0) (0x0000b9c0 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000b9c0 + 0x2*i0; }
 #define A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
@@ -7554,11 +8028,12 @@ static inline uint32_t A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx
 {
 	return ((val) << A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
-#define A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK	0xfffffffc
+#define A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK	0xfffffffffffffffc
 #define A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT	2
-static inline uint32_t A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR(uint32_t val)
+static inline uint32_t A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_HLSQ_CS_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
 }
 
 #define REG_A6XX_HLSQ_CS_UNKNOWN_B9D0				0x0000b9d0
@@ -7625,19 +8100,56 @@ static inline uint32_t A6XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS(uint32_t val)
 	return ((val) << A6XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__SHIFT) & A6XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__MASK;
 }
 
+#define REG_A7XX_HLSQ_INVALIDATE_CMD				0x0000ab1f
+#define A7XX_HLSQ_INVALIDATE_CMD_VS_STATE			0x00000001
+#define A7XX_HLSQ_INVALIDATE_CMD_HS_STATE			0x00000002
+#define A7XX_HLSQ_INVALIDATE_CMD_DS_STATE			0x00000004
+#define A7XX_HLSQ_INVALIDATE_CMD_GS_STATE			0x00000008
+#define A7XX_HLSQ_INVALIDATE_CMD_FS_STATE			0x00000010
+#define A7XX_HLSQ_INVALIDATE_CMD_CS_STATE			0x00000020
+#define A7XX_HLSQ_INVALIDATE_CMD_CS_IBO				0x00000040
+#define A7XX_HLSQ_INVALIDATE_CMD_GFX_IBO			0x00000080
+#define A7XX_HLSQ_INVALIDATE_CMD_CS_BINDLESS__MASK		0x0001fe00
+#define A7XX_HLSQ_INVALIDATE_CMD_CS_BINDLESS__SHIFT		9
+static inline uint32_t A7XX_HLSQ_INVALIDATE_CMD_CS_BINDLESS(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_INVALIDATE_CMD_CS_BINDLESS__SHIFT) & A7XX_HLSQ_INVALIDATE_CMD_CS_BINDLESS__MASK;
+}
+#define A7XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__MASK		0x01fe0000
+#define A7XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__SHIFT		17
+static inline uint32_t A7XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS(uint32_t val)
+{
+	return ((val) << A7XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__SHIFT) & A7XX_HLSQ_INVALIDATE_CMD_GFX_BINDLESS__MASK;
+}
+
 #define REG_A6XX_HLSQ_FS_CNTL					0x0000bb10
 #define A6XX_HLSQ_FS_CNTL_CONSTLEN__MASK			0x000000ff
 #define A6XX_HLSQ_FS_CNTL_CONSTLEN__SHIFT			0
 static inline uint32_t A6XX_HLSQ_FS_CNTL_CONSTLEN(uint32_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_FS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_FS_CNTL_CONSTLEN__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_FS_CNTL_CONSTLEN__SHIFT) & A6XX_HLSQ_FS_CNTL_CONSTLEN__MASK;
 }
 #define A6XX_HLSQ_FS_CNTL_ENABLED				0x00000100
+#define A6XX_HLSQ_FS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_FS_CNTL					0x0000ab03
+#define A7XX_HLSQ_FS_CNTL_CONSTLEN__MASK			0x000000ff
+#define A7XX_HLSQ_FS_CNTL_CONSTLEN__SHIFT			0
+static inline uint32_t A7XX_HLSQ_FS_CNTL_CONSTLEN(uint32_t val)
+{
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A7XX_HLSQ_FS_CNTL_CONSTLEN__SHIFT) & A7XX_HLSQ_FS_CNTL_CONSTLEN__MASK;
+}
+#define A7XX_HLSQ_FS_CNTL_ENABLED				0x00000100
+#define A7XX_HLSQ_FS_CNTL_READ_IMM_SHARED_CONSTS		0x00000200
+
+#define REG_A7XX_HLSQ_SHARED_CONSTS_IMM(i0) (0x0000ab40 + 0x1*(i0))
 
 #define REG_A6XX_HLSQ_SHARED_CONSTS				0x0000bb11
 #define A6XX_HLSQ_SHARED_CONSTS_ENABLE				0x00000001
 
-static inline uint32_t REG_A6XX_HLSQ_BINDLESS_BASE(uint32_t i0) { return 0x0000bb20 + 0x2*i0; }
+#define REG_A6XX_HLSQ_BINDLESS_BASE(i0) (0x0000bb20 + 0x2*(i0))
 
 static inline uint32_t REG_A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR(uint32_t i0) { return 0x0000bb20 + 0x2*i0; }
 #define A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK	0x00000003
@@ -7646,11 +8158,12 @@ static inline uint32_t A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE(enum a6xx_bi
 {
 	return ((val) << A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__SHIFT) & A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_DESC_SIZE__MASK;
 }
-#define A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffc
+#define A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK		0xfffffffffffffffc
 #define A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT		2
-static inline uint32_t A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR(uint32_t val)
+static inline uint32_t A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR(uint64_t val)
 {
-	return ((val >> 2) << A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__SHIFT) & A6XX_HLSQ_BINDLESS_BASE_DESCRIPTOR_ADDR__MASK;
 }
 
 #define REG_A6XX_HLSQ_2D_EVENT_CMD				0x0000bd80
@@ -7677,12 +8190,18 @@ static inline uint32_t A6XX_HLSQ_2D_EVENT_CMD_EVENT(enum vgt_event_type val)
 
 #define REG_A6XX_HLSQ_UNKNOWN_BE08				0x0000be08
 
-static inline uint32_t REG_A6XX_HLSQ_PERFCTR_HLSQ_SEL(uint32_t i0) { return 0x0000be10 + 0x1*i0; }
+#define REG_A6XX_HLSQ_PERFCTR_HLSQ_SEL(i0) (0x0000be10 + 0x1*(i0))
 
 #define REG_A6XX_HLSQ_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE	0x0000be22
 
 #define REG_A7XX_SP_AHB_READ_APERTURE				0x0000c000
 
+#define REG_A7XX_SP_UNKNOWN_0CE2				0x00000ce2
+
+#define REG_A7XX_SP_UNKNOWN_0CE4				0x00000ce4
+
+#define REG_A7XX_SP_UNKNOWN_0CE6				0x00000ce6
+
 #define REG_A6XX_CP_EVENT_START					0x0000d600
 #define A6XX_CP_EVENT_START_STATE_ID__MASK			0x000000ff
 #define A6XX_CP_EVENT_START_STATE_ID__SHIFT			0
@@ -7907,17 +8426,19 @@ static inline uint32_t A6XX_TEX_CONST_2_TYPE(enum a6xx_tex_type val)
 }
 
 #define REG_A6XX_TEX_CONST_3					0x00000003
-#define A6XX_TEX_CONST_3_ARRAY_PITCH__MASK			0x00003fff
+#define A6XX_TEX_CONST_3_ARRAY_PITCH__MASK			0x007fffff
 #define A6XX_TEX_CONST_3_ARRAY_PITCH__SHIFT			0
 static inline uint32_t A6XX_TEX_CONST_3_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 12) << A6XX_TEX_CONST_3_ARRAY_PITCH__SHIFT) & A6XX_TEX_CONST_3_ARRAY_PITCH__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_TEX_CONST_3_ARRAY_PITCH__SHIFT) & A6XX_TEX_CONST_3_ARRAY_PITCH__MASK;
 }
 #define A6XX_TEX_CONST_3_MIN_LAYERSZ__MASK			0x07800000
 #define A6XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT			23
 static inline uint32_t A6XX_TEX_CONST_3_MIN_LAYERSZ(uint32_t val)
 {
-	return ((val >> 12) << A6XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT) & A6XX_TEX_CONST_3_MIN_LAYERSZ__MASK;
+	assert(!(val & 0xfff));
+	return (((val >> 12)) << A6XX_TEX_CONST_3_MIN_LAYERSZ__SHIFT) & A6XX_TEX_CONST_3_MIN_LAYERSZ__MASK;
 }
 #define A6XX_TEX_CONST_3_TILE_ALL				0x08000000
 #define A6XX_TEX_CONST_3_FLAG					0x10000000
@@ -7927,7 +8448,8 @@ static inline uint32_t A6XX_TEX_CONST_3_MIN_LAYERSZ(uint32_t val)
 #define A6XX_TEX_CONST_4_BASE_LO__SHIFT				5
 static inline uint32_t A6XX_TEX_CONST_4_BASE_LO(uint32_t val)
 {
-	return ((val >> 5) << A6XX_TEX_CONST_4_BASE_LO__SHIFT) & A6XX_TEX_CONST_4_BASE_LO__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_TEX_CONST_4_BASE_LO__SHIFT) & A6XX_TEX_CONST_4_BASE_LO__MASK;
 }
 
 #define REG_A6XX_TEX_CONST_5					0x00000005
@@ -7963,7 +8485,8 @@ static inline uint32_t A6XX_TEX_CONST_6_PLANE_PITCH(uint32_t val)
 #define A6XX_TEX_CONST_7_FLAG_LO__SHIFT				5
 static inline uint32_t A6XX_TEX_CONST_7_FLAG_LO(uint32_t val)
 {
-	return ((val >> 5) << A6XX_TEX_CONST_7_FLAG_LO__SHIFT) & A6XX_TEX_CONST_7_FLAG_LO__MASK;
+	assert(!(val & 0x1f));
+	return (((val >> 5)) << A6XX_TEX_CONST_7_FLAG_LO__SHIFT) & A6XX_TEX_CONST_7_FLAG_LO__MASK;
 }
 
 #define REG_A6XX_TEX_CONST_8					0x00000008
@@ -7979,7 +8502,8 @@ static inline uint32_t A6XX_TEX_CONST_8_FLAG_HI(uint32_t val)
 #define A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH__SHIFT		0
 static inline uint32_t A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH(uint32_t val)
 {
-	return ((val >> 4) << A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH__MASK;
+	assert(!(val & 0xf));
+	return (((val >> 4)) << A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH__SHIFT) & A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH__MASK;
 }
 
 #define REG_A6XX_TEX_CONST_10					0x0000000a
@@ -7987,7 +8511,8 @@ static inline uint32_t A6XX_TEX_CONST_9_FLAG_BUFFER_ARRAY_PITCH(uint32_t val)
 #define A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH__SHIFT		0
 static inline uint32_t A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH(uint32_t val)
 {
-	return ((val >> 6) << A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH__SHIFT) & A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH__MASK;
+	assert(!(val & 0x3f));
+	return (((val >> 6)) << A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH__SHIFT) & A6XX_TEX_CONST_10_FLAG_BUFFER_PITCH__MASK;
 }
 #define A6XX_TEX_CONST_10_FLAG_BUFFER_LOGW__MASK		0x00000f00
 #define A6XX_TEX_CONST_10_FLAG_BUFFER_LOGW__SHIFT		8
@@ -8262,4 +8787,2442 @@ static inline uint32_t A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
 
 #define REG_A7XX_CX_MISC_TCM_RET_CNTL				0x00000039
 
+#ifdef __cplusplus
+template<chip CHIP> constexpr inline uint16_t CMD_REGS[] = {};
+template<chip CHIP> constexpr inline uint16_t RP_BLIT_REGS[] = {};
+template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
+	0xc03,
+	0xc04,
+	0xc30,
+	0xc31,
+	0xc32,
+	0xc33,
+	0xc34,
+	0xc35,
+	0xc36,
+	0xc37,
+	0xe12,
+	0xe17,
+	0xe19,
+	0x8099,
+	0x80af,
+	0x810a,
+	0x8110,
+	0x8600,
+	0x880e,
+	0x8811,
+	0x8818,
+	0x8819,
+	0x881a,
+	0x881b,
+	0x881c,
+	0x881d,
+	0x881e,
+	0x8864,
+	0x8891,
+	0x88f0,
+	0x8927,
+	0x8928,
+	0x8e01,
+	0x8e04,
+	0x8e07,
+	0x9210,
+	0x9211,
+	0x9218,
+	0x9219,
+	0x921a,
+	0x921b,
+	0x921c,
+	0x921d,
+	0x921e,
+	0x921f,
+	0x9220,
+	0x9221,
+	0x9222,
+	0x9223,
+	0x9224,
+	0x9225,
+	0x9226,
+	0x9227,
+	0x9228,
+	0x9229,
+	0x922a,
+	0x922b,
+	0x922c,
+	0x922d,
+	0x922e,
+	0x922f,
+	0x9230,
+	0x9231,
+	0x9232,
+	0x9233,
+	0x9234,
+	0x9235,
+	0x9236,
+	0x9300,
+	0x9600,
+	0x9601,
+	0x9602,
+	0x9e08,
+	0x9e09,
+	0x9e72,
+	0xa007,
+	0xa009,
+	0xa8a0,
+	0xa8a1,
+	0xa8a2,
+	0xa8a3,
+	0xa8a4,
+	0xa8a5,
+	0xa8a6,
+	0xa8a7,
+	0xa8a8,
+	0xa8a9,
+	0xa8aa,
+	0xa8ab,
+	0xa8ac,
+	0xa8ad,
+	0xa8ae,
+	0xa8af,
+	0xa9a8,
+	0xa9b0,
+	0xa9b1,
+	0xa9b2,
+	0xa9b3,
+	0xa9b4,
+	0xa9b5,
+	0xa9b6,
+	0xa9b7,
+	0xa9b8,
+	0xa9b9,
+	0xa9ba,
+	0xa9bb,
+	0xa9bc,
+	0xa9bd,
+	0xa9c2,
+	0xa9c3,
+	0xa9e2,
+	0xa9e3,
+	0xa9e6,
+	0xa9e7,
+	0xa9e8,
+	0xa9e9,
+	0xa9ea,
+	0xa9eb,
+	0xa9ec,
+	0xa9ed,
+	0xa9ee,
+	0xa9ef,
+	0xa9f0,
+	0xa9f1,
+	0xaaf2,
+	0xab1a,
+	0xab1b,
+	0xab20,
+	0xae00,
+	0xae03,
+	0xae04,
+	0xae0f,
+	0xb180,
+	0xb181,
+	0xb182,
+	0xb183,
+	0xb302,
+	0xb303,
+	0xb309,
+	0xb600,
+	0xb602,
+	0xb605,
+	0xb987,
+	0xb9d0,
+	0xbb08,
+	0xbb11,
+	0xbb20,
+	0xbb21,
+	0xbb22,
+	0xbb23,
+	0xbb24,
+	0xbb25,
+	0xbb26,
+	0xbb27,
+	0xbb28,
+	0xbb29,
+	0xbe00,
+	0xbe01,
+	0xbe04,
+};
+template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
+	0xc03,
+	0xc04,
+	0xc30,
+	0xc31,
+	0xc32,
+	0xc33,
+	0xc34,
+	0xc35,
+	0xc36,
+	0xc37,
+	0xce2,
+	0xce3,
+	0xce4,
+	0xce5,
+	0xce6,
+	0xce7,
+	0xe10,
+	0xe11,
+	0xe12,
+	0xe17,
+	0xe19,
+	0x8009,
+	0x800a,
+	0x800b,
+	0x800c,
+	0x8099,
+	0x80af,
+	0x810a,
+	0x8110,
+	0x8120,
+	0x8121,
+	0x8600,
+	0x880e,
+	0x8811,
+	0x8818,
+	0x8819,
+	0x881a,
+	0x881b,
+	0x881c,
+	0x881d,
+	0x881e,
+	0x8864,
+	0x8891,
+	0x8899,
+	0x88f0,
+	0x8927,
+	0x8928,
+	0x8e01,
+	0x8e04,
+	0x8e06,
+	0x8e07,
+	0x8e09,
+	0x8e79,
+	0x9218,
+	0x9219,
+	0x921a,
+	0x921b,
+	0x921c,
+	0x921d,
+	0x921e,
+	0x921f,
+	0x9220,
+	0x9221,
+	0x9222,
+	0x9223,
+	0x9224,
+	0x9225,
+	0x9226,
+	0x9227,
+	0x9228,
+	0x9229,
+	0x922a,
+	0x922b,
+	0x922c,
+	0x922d,
+	0x922e,
+	0x922f,
+	0x9230,
+	0x9231,
+	0x9232,
+	0x9233,
+	0x9234,
+	0x9235,
+	0x9236,
+	0x9300,
+	0x9600,
+	0x9601,
+	0x9602,
+	0x9810,
+	0x9811,
+	0x9e24,
+	0x9e72,
+	0xa007,
+	0xa009,
+	0xa600,
+	0xa82d,
+	0xa8a0,
+	0xa8a1,
+	0xa8a2,
+	0xa8a3,
+	0xa8a4,
+	0xa8a5,
+	0xa8a6,
+	0xa8a7,
+	0xa8a8,
+	0xa8a9,
+	0xa8aa,
+	0xa8ab,
+	0xa8ac,
+	0xa8ad,
+	0xa8ae,
+	0xa8af,
+	0xa9a8,
+	0xa9ae,
+	0xa9b0,
+	0xa9b1,
+	0xa9b2,
+	0xa9b3,
+	0xa9b4,
+	0xa9b5,
+	0xa9b6,
+	0xa9b7,
+	0xa9b8,
+	0xa9b9,
+	0xa9ba,
+	0xa9bb,
+	0xa9bc,
+	0xa9bd,
+	0xa9be,
+	0xa9c2,
+	0xa9c3,
+	0xa9c5,
+	0xa9cd,
+	0xa9df,
+	0xa9e2,
+	0xa9e3,
+	0xa9e6,
+	0xa9e7,
+	0xa9e8,
+	0xa9e9,
+	0xa9ea,
+	0xa9eb,
+	0xa9ec,
+	0xa9ed,
+	0xa9ee,
+	0xa9ef,
+	0xa9f0,
+	0xa9f1,
+	0xa9f2,
+	0xa9f3,
+	0xa9f4,
+	0xa9f5,
+	0xa9f6,
+	0xa9f7,
+	0xaa01,
+	0xaaf2,
+	0xab01,
+	0xab02,
+	0xab1a,
+	0xab1b,
+	0xab1f,
+	0xab20,
+	0xab22,
+	0xae00,
+	0xae03,
+	0xae04,
+	0xae06,
+	0xae08,
+	0xae09,
+	0xae0a,
+	0xae0f,
+	0xae6a,
+	0xae6b,
+	0xae6c,
+	0xae73,
+	0xb180,
+	0xb181,
+	0xb182,
+	0xb183,
+	0xb302,
+	0xb303,
+	0xb309,
+	0xb310,
+	0xb600,
+	0xb602,
+	0xb608,
+	0xb609,
+	0xb60a,
+	0xb60b,
+	0xb60c,
+};
+template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
+	0xc02,
+	0xc06,
+	0xc10,
+	0xc11,
+	0xc12,
+	0xc13,
+	0xc14,
+	0xc15,
+	0xc16,
+	0xc17,
+	0xc18,
+	0xc19,
+	0xc1a,
+	0xc1b,
+	0xc1c,
+	0xc1d,
+	0xc1e,
+	0xc1f,
+	0xc20,
+	0xc21,
+	0xc22,
+	0xc23,
+	0xc24,
+	0xc25,
+	0xc26,
+	0xc27,
+	0xc28,
+	0xc29,
+	0xc2a,
+	0xc2b,
+	0xc2c,
+	0xc2d,
+	0xc2e,
+	0xc2f,
+	0xc38,
+	0xc39,
+	0xc3a,
+	0xc3b,
+	0xc3c,
+	0xc3d,
+	0xc3e,
+	0xc3f,
+	0xc40,
+	0xc41,
+	0xc42,
+	0xc43,
+	0xc44,
+	0xc45,
+	0xc46,
+	0xc47,
+	0xc48,
+	0xc49,
+	0xc4a,
+	0xc4b,
+	0xc4c,
+	0xc4d,
+	0xc4e,
+	0xc4f,
+	0xc50,
+	0xc51,
+	0xc52,
+	0xc53,
+	0xc54,
+	0xc55,
+	0xc56,
+	0xc57,
+	0xc58,
+	0xc59,
+	0xc5a,
+	0xc5b,
+	0xc5c,
+	0xc5d,
+	0xc5e,
+	0xc5f,
+	0xc60,
+	0xc61,
+	0xc62,
+	0xc63,
+	0xc64,
+	0xc65,
+	0xc66,
+	0xc67,
+	0xc68,
+	0xc69,
+	0xc6a,
+	0xc6b,
+	0xc6c,
+	0xc6d,
+	0xc6e,
+	0xc6f,
+	0xc70,
+	0xc71,
+	0xc72,
+	0xc73,
+	0xc74,
+	0xc75,
+	0xc76,
+	0xc77,
+	0xc78,
+	0xc79,
+	0xc7a,
+	0xc7b,
+	0xc7c,
+	0xc7d,
+	0xc7e,
+	0xc7f,
+	0xc80,
+	0xc81,
+	0xc82,
+	0xc83,
+	0xc84,
+	0xc85,
+	0xc86,
+	0xc87,
+	0xc88,
+	0xc89,
+	0xc8a,
+	0xc8b,
+	0xc8c,
+	0xc8d,
+	0xc8e,
+	0xc8f,
+	0xc90,
+	0xc91,
+	0xc92,
+	0xc93,
+	0xc94,
+	0xc95,
+	0xc96,
+	0xc97,
+	0x8000,
+	0x8001,
+	0x8002,
+	0x8003,
+	0x8004,
+	0x8005,
+	0x8006,
+	0x8010,
+	0x8011,
+	0x8012,
+	0x8013,
+	0x8014,
+	0x8015,
+	0x8016,
+	0x8017,
+	0x8018,
+	0x8019,
+	0x801a,
+	0x801b,
+	0x801c,
+	0x801d,
+	0x801e,
+	0x801f,
+	0x8020,
+	0x8021,
+	0x8022,
+	0x8023,
+	0x8024,
+	0x8025,
+	0x8026,
+	0x8027,
+	0x8028,
+	0x8029,
+	0x802a,
+	0x802b,
+	0x802c,
+	0x802d,
+	0x802e,
+	0x802f,
+	0x8030,
+	0x8031,
+	0x8032,
+	0x8033,
+	0x8034,
+	0x8035,
+	0x8036,
+	0x8037,
+	0x8038,
+	0x8039,
+	0x803a,
+	0x803b,
+	0x803c,
+	0x803d,
+	0x803e,
+	0x803f,
+	0x8040,
+	0x8041,
+	0x8042,
+	0x8043,
+	0x8044,
+	0x8045,
+	0x8046,
+	0x8047,
+	0x8048,
+	0x8049,
+	0x804a,
+	0x804b,
+	0x804c,
+	0x804d,
+	0x804e,
+	0x804f,
+	0x8050,
+	0x8051,
+	0x8052,
+	0x8053,
+	0x8054,
+	0x8055,
+	0x8056,
+	0x8057,
+	0x8058,
+	0x8059,
+	0x805a,
+	0x805b,
+	0x805c,
+	0x805d,
+	0x805e,
+	0x805f,
+	0x8060,
+	0x8061,
+	0x8062,
+	0x8063,
+	0x8064,
+	0x8065,
+	0x8066,
+	0x8067,
+	0x8068,
+	0x8069,
+	0x806a,
+	0x806b,
+	0x806c,
+	0x806d,
+	0x806e,
+	0x806f,
+	0x8070,
+	0x8071,
+	0x8072,
+	0x8073,
+	0x8074,
+	0x8075,
+	0x8076,
+	0x8077,
+	0x8078,
+	0x8079,
+	0x807a,
+	0x807b,
+	0x807c,
+	0x807d,
+	0x807e,
+	0x807f,
+	0x8080,
+	0x8081,
+	0x8082,
+	0x8083,
+	0x8084,
+	0x8085,
+	0x8086,
+	0x8087,
+	0x8088,
+	0x8089,
+	0x808a,
+	0x808b,
+	0x808c,
+	0x808d,
+	0x808e,
+	0x808f,
+	0x8090,
+	0x8091,
+	0x8092,
+	0x8094,
+	0x8095,
+	0x8096,
+	0x8097,
+	0x8098,
+	0x809b,
+	0x809c,
+	0x809d,
+	0x80a0,
+	0x80a1,
+	0x80a2,
+	0x80a3,
+	0x80a4,
+	0x80a5,
+	0x80a6,
+	0x80b0,
+	0x80b1,
+	0x80b2,
+	0x80b3,
+	0x80b4,
+	0x80b5,
+	0x80b6,
+	0x80b7,
+	0x80b8,
+	0x80b9,
+	0x80ba,
+	0x80bb,
+	0x80bc,
+	0x80bd,
+	0x80be,
+	0x80bf,
+	0x80c0,
+	0x80c1,
+	0x80c2,
+	0x80c3,
+	0x80c4,
+	0x80c5,
+	0x80c6,
+	0x80c7,
+	0x80c8,
+	0x80c9,
+	0x80ca,
+	0x80cb,
+	0x80cc,
+	0x80cd,
+	0x80ce,
+	0x80cf,
+	0x80d0,
+	0x80d1,
+	0x80d2,
+	0x80d3,
+	0x80d4,
+	0x80d5,
+	0x80d6,
+	0x80d7,
+	0x80d8,
+	0x80d9,
+	0x80da,
+	0x80db,
+	0x80dc,
+	0x80dd,
+	0x80de,
+	0x80df,
+	0x80e0,
+	0x80e1,
+	0x80e2,
+	0x80e3,
+	0x80e4,
+	0x80e5,
+	0x80e6,
+	0x80e7,
+	0x80e8,
+	0x80e9,
+	0x80ea,
+	0x80eb,
+	0x80ec,
+	0x80ed,
+	0x80ee,
+	0x80ef,
+	0x80f0,
+	0x80f1,
+	0x8100,
+	0x8101,
+	0x8102,
+	0x8103,
+	0x8104,
+	0x8105,
+	0x8106,
+	0x8107,
+	0x8109,
+	0x8400,
+	0x8401,
+	0x8402,
+	0x8403,
+	0x8404,
+	0x8405,
+	0x8406,
+	0x840a,
+	0x840b,
+	0x8800,
+	0x8801,
+	0x8802,
+	0x8803,
+	0x8804,
+	0x8805,
+	0x8806,
+	0x8809,
+	0x880a,
+	0x880b,
+	0x880c,
+	0x880d,
+	0x880f,
+	0x8810,
+	0x8820,
+	0x8821,
+	0x8822,
+	0x8823,
+	0x8824,
+	0x8825,
+	0x8826,
+	0x8827,
+	0x8828,
+	0x8829,
+	0x882a,
+	0x882b,
+	0x882c,
+	0x882d,
+	0x882e,
+	0x882f,
+	0x8830,
+	0x8831,
+	0x8832,
+	0x8833,
+	0x8834,
+	0x8835,
+	0x8836,
+	0x8837,
+	0x8838,
+	0x8839,
+	0x883a,
+	0x883b,
+	0x883c,
+	0x883d,
+	0x883e,
+	0x883f,
+	0x8840,
+	0x8841,
+	0x8842,
+	0x8843,
+	0x8844,
+	0x8845,
+	0x8846,
+	0x8847,
+	0x8848,
+	0x8849,
+	0x884a,
+	0x884b,
+	0x884c,
+	0x884d,
+	0x884e,
+	0x884f,
+	0x8850,
+	0x8851,
+	0x8852,
+	0x8853,
+	0x8854,
+	0x8855,
+	0x8856,
+	0x8857,
+	0x8858,
+	0x8859,
+	0x885a,
+	0x885b,
+	0x885c,
+	0x885d,
+	0x885e,
+	0x885f,
+	0x8860,
+	0x8861,
+	0x8862,
+	0x8863,
+	0x8865,
+	0x8870,
+	0x8871,
+	0x8872,
+	0x8873,
+	0x8874,
+	0x8875,
+	0x8876,
+	0x8877,
+	0x8878,
+	0x8879,
+	0x8880,
+	0x8881,
+	0x8882,
+	0x8883,
+	0x8884,
+	0x8885,
+	0x8886,
+	0x8887,
+	0x8888,
+	0x8889,
+	0x8890,
+	0x8898,
+	0x88c0,
+	0x88c1,
+	0x88d0,
+	0x88d1,
+	0x88d2,
+	0x88d3,
+	0x88d4,
+	0x88d5,
+	0x88d6,
+	0x88d7,
+	0x88d8,
+	0x88d9,
+	0x88da,
+	0x88db,
+	0x88dc,
+	0x88dd,
+	0x88de,
+	0x88df,
+	0x88e0,
+	0x88e1,
+	0x88e2,
+	0x88e3,
+	0x8900,
+	0x8901,
+	0x8902,
+	0x8903,
+	0x8904,
+	0x8905,
+	0x8906,
+	0x8907,
+	0x8908,
+	0x8909,
+	0x890a,
+	0x890b,
+	0x890c,
+	0x890d,
+	0x890e,
+	0x890f,
+	0x8910,
+	0x8911,
+	0x8912,
+	0x8913,
+	0x8914,
+	0x8915,
+	0x8916,
+	0x8917,
+	0x8918,
+	0x8919,
+	0x891a,
+	0x8a00,
+	0x8a10,
+	0x8a20,
+	0x8a30,
+	0x8c00,
+	0x8c01,
+	0x8c17,
+	0x8c18,
+	0x8c19,
+	0x8c1a,
+	0x8c1b,
+	0x8c1c,
+	0x8c1d,
+	0x8c1e,
+	0x8c1f,
+	0x8c20,
+	0x8c21,
+	0x8c22,
+	0x8c23,
+	0x8c24,
+	0x8c25,
+	0x8c2c,
+	0x8c2d,
+	0x8c2e,
+	0x8c2f,
+	0x9100,
+	0x9101,
+	0x9102,
+	0x9103,
+	0x9104,
+	0x9105,
+	0x9106,
+	0x9107,
+	0x9108,
+	0x9200,
+	0x9201,
+	0x9202,
+	0x9203,
+	0x9204,
+	0x9205,
+	0x9206,
+	0x9207,
+	0x9208,
+	0x9209,
+	0x920a,
+	0x920b,
+	0x920c,
+	0x920d,
+	0x920e,
+	0x920f,
+	0x9212,
+	0x9213,
+	0x9214,
+	0x9215,
+	0x9216,
+	0x9217,
+	0x9301,
+	0x9302,
+	0x9303,
+	0x9304,
+	0x9305,
+	0x9306,
+	0x9800,
+	0x9801,
+	0x9802,
+	0x9803,
+	0x9804,
+	0x9805,
+	0x9806,
+	0x9808,
+	0x9980,
+	0x9981,
+	0x9b00,
+	0x9b01,
+	0x9b02,
+	0x9b03,
+	0x9b04,
+	0x9b05,
+	0x9b06,
+	0x9b07,
+	0x9b08,
+	0xa000,
+	0xa001,
+	0xa002,
+	0xa003,
+	0xa004,
+	0xa005,
+	0xa006,
+	0xa008,
+	0xa00e,
+	0xa00f,
+	0xa010,
+	0xa011,
+	0xa012,
+	0xa013,
+	0xa014,
+	0xa015,
+	0xa016,
+	0xa017,
+	0xa018,
+	0xa019,
+	0xa01a,
+	0xa01b,
+	0xa01c,
+	0xa01d,
+	0xa01e,
+	0xa01f,
+	0xa020,
+	0xa021,
+	0xa022,
+	0xa023,
+	0xa024,
+	0xa025,
+	0xa026,
+	0xa027,
+	0xa028,
+	0xa029,
+	0xa02a,
+	0xa02b,
+	0xa02c,
+	0xa02d,
+	0xa02e,
+	0xa02f,
+	0xa030,
+	0xa031,
+	0xa032,
+	0xa033,
+	0xa034,
+	0xa035,
+	0xa036,
+	0xa037,
+	0xa038,
+	0xa039,
+	0xa03a,
+	0xa03b,
+	0xa03c,
+	0xa03d,
+	0xa03e,
+	0xa03f,
+	0xa040,
+	0xa041,
+	0xa042,
+	0xa043,
+	0xa044,
+	0xa045,
+	0xa046,
+	0xa047,
+	0xa048,
+	0xa049,
+	0xa04a,
+	0xa04b,
+	0xa04c,
+	0xa04d,
+	0xa04e,
+	0xa04f,
+	0xa050,
+	0xa051,
+	0xa052,
+	0xa053,
+	0xa054,
+	0xa055,
+	0xa056,
+	0xa057,
+	0xa058,
+	0xa059,
+	0xa05a,
+	0xa05b,
+	0xa05c,
+	0xa05d,
+	0xa05e,
+	0xa05f,
+	0xa060,
+	0xa061,
+	0xa062,
+	0xa063,
+	0xa064,
+	0xa065,
+	0xa066,
+	0xa067,
+	0xa068,
+	0xa069,
+	0xa06a,
+	0xa06b,
+	0xa06c,
+	0xa06d,
+	0xa06e,
+	0xa06f,
+	0xa070,
+	0xa071,
+	0xa072,
+	0xa073,
+	0xa074,
+	0xa075,
+	0xa076,
+	0xa077,
+	0xa078,
+	0xa079,
+	0xa07a,
+	0xa07b,
+	0xa07c,
+	0xa07d,
+	0xa07e,
+	0xa07f,
+	0xa080,
+	0xa081,
+	0xa082,
+	0xa083,
+	0xa084,
+	0xa085,
+	0xa086,
+	0xa087,
+	0xa088,
+	0xa089,
+	0xa08a,
+	0xa08b,
+	0xa08c,
+	0xa08d,
+	0xa08e,
+	0xa08f,
+	0xa090,
+	0xa091,
+	0xa092,
+	0xa093,
+	0xa094,
+	0xa095,
+	0xa096,
+	0xa097,
+	0xa098,
+	0xa099,
+	0xa09a,
+	0xa09b,
+	0xa09c,
+	0xa09d,
+	0xa09e,
+	0xa09f,
+	0xa0a0,
+	0xa0a1,
+	0xa0a2,
+	0xa0a3,
+	0xa0a4,
+	0xa0a5,
+	0xa0a6,
+	0xa0a7,
+	0xa0a8,
+	0xa0a9,
+	0xa0aa,
+	0xa0ab,
+	0xa0ac,
+	0xa0ad,
+	0xa0ae,
+	0xa0af,
+	0xa0b0,
+	0xa0b1,
+	0xa0b2,
+	0xa0b3,
+	0xa0b4,
+	0xa0b5,
+	0xa0b6,
+	0xa0b7,
+	0xa0b8,
+	0xa0b9,
+	0xa0ba,
+	0xa0bb,
+	0xa0bc,
+	0xa0bd,
+	0xa0be,
+	0xa0bf,
+	0xa0c0,
+	0xa0c1,
+	0xa0c2,
+	0xa0c3,
+	0xa0c4,
+	0xa0c5,
+	0xa0c6,
+	0xa0c7,
+	0xa0c8,
+	0xa0c9,
+	0xa0ca,
+	0xa0cb,
+	0xa0cc,
+	0xa0cd,
+	0xa0ce,
+	0xa0cf,
+	0xa0d0,
+	0xa0d1,
+	0xa0d2,
+	0xa0d3,
+	0xa0d4,
+	0xa0d5,
+	0xa0d6,
+	0xa0d7,
+	0xa0d8,
+	0xa0d9,
+	0xa0da,
+	0xa0db,
+	0xa0dc,
+	0xa0dd,
+	0xa0de,
+	0xa0df,
+	0xa0e0,
+	0xa0e1,
+	0xa0e2,
+	0xa0e3,
+	0xa0e4,
+	0xa0e5,
+	0xa0e6,
+	0xa0e7,
+	0xa0e8,
+	0xa0e9,
+	0xa0ea,
+	0xa0eb,
+	0xa0ec,
+	0xa0ed,
+	0xa0ee,
+	0xa0ef,
+	0xa0f8,
+	0xa800,
+	0xa802,
+	0xa803,
+	0xa804,
+	0xa805,
+	0xa806,
+	0xa807,
+	0xa808,
+	0xa809,
+	0xa80a,
+	0xa80b,
+	0xa80c,
+	0xa80d,
+	0xa80e,
+	0xa80f,
+	0xa810,
+	0xa811,
+	0xa812,
+	0xa813,
+	0xa814,
+	0xa815,
+	0xa816,
+	0xa817,
+	0xa818,
+	0xa819,
+	0xa81a,
+	0xa81b,
+	0xa81c,
+	0xa81d,
+	0xa81e,
+	0xa81f,
+	0xa820,
+	0xa821,
+	0xa822,
+	0xa823,
+	0xa824,
+	0xa825,
+	0xa830,
+	0xa831,
+	0xa832,
+	0xa833,
+	0xa834,
+	0xa835,
+	0xa836,
+	0xa837,
+	0xa838,
+	0xa839,
+	0xa83a,
+	0xa83b,
+	0xa83c,
+	0xa83d,
+	0xa840,
+	0xa842,
+	0xa843,
+	0xa844,
+	0xa845,
+	0xa846,
+	0xa847,
+	0xa848,
+	0xa849,
+	0xa84a,
+	0xa84b,
+	0xa84c,
+	0xa84d,
+	0xa84e,
+	0xa84f,
+	0xa850,
+	0xa851,
+	0xa852,
+	0xa853,
+	0xa854,
+	0xa855,
+	0xa856,
+	0xa857,
+	0xa858,
+	0xa859,
+	0xa85a,
+	0xa85b,
+	0xa85c,
+	0xa85d,
+	0xa85e,
+	0xa85f,
+	0xa860,
+	0xa861,
+	0xa862,
+	0xa863,
+	0xa864,
+	0xa865,
+	0xa870,
+	0xa871,
+	0xa872,
+	0xa873,
+	0xa874,
+	0xa875,
+	0xa876,
+	0xa877,
+	0xa878,
+	0xa879,
+	0xa87a,
+	0xa87b,
+	0xa87c,
+	0xa87d,
+	0xa87e,
+	0xa87f,
+	0xa880,
+	0xa881,
+	0xa882,
+	0xa883,
+	0xa884,
+	0xa885,
+	0xa886,
+	0xa887,
+	0xa888,
+	0xa889,
+	0xa88a,
+	0xa88b,
+	0xa88c,
+	0xa88d,
+	0xa88e,
+	0xa88f,
+	0xa890,
+	0xa891,
+	0xa892,
+	0xa893,
+	0xa894,
+	0xa895,
+	0xa896,
+	0xa980,
+	0xa982,
+	0xa983,
+	0xa984,
+	0xa985,
+	0xa986,
+	0xa987,
+	0xa988,
+	0xa989,
+	0xa98a,
+	0xa98b,
+	0xa98c,
+	0xa98d,
+	0xa98e,
+	0xa98f,
+	0xa990,
+	0xa991,
+	0xa992,
+	0xa993,
+	0xa994,
+	0xa995,
+	0xa996,
+	0xa997,
+	0xa998,
+	0xa999,
+	0xa99a,
+	0xa99b,
+	0xa99c,
+	0xa99d,
+	0xa99e,
+	0xa99f,
+	0xa9a0,
+	0xa9a1,
+	0xa9a2,
+	0xa9a3,
+	0xa9a4,
+	0xa9a5,
+	0xa9a6,
+	0xa9a7,
+	0xa9a9,
+	0xa9e0,
+	0xa9e1,
+	0xa9e4,
+	0xa9e5,
+	0xab00,
+	0xab04,
+	0xab05,
+	0xab10,
+	0xab11,
+	0xab12,
+	0xab13,
+	0xab14,
+	0xab15,
+	0xab16,
+	0xab17,
+	0xab18,
+	0xab19,
+	0xacc0,
+	0xb300,
+	0xb301,
+	0xb304,
+	0xb305,
+	0xb306,
+	0xb307,
+	0xb4c0,
+	0xb4c1,
+	0xb4c2,
+	0xb4c3,
+	0xb4c4,
+	0xb4ca,
+	0xb4cb,
+	0xb4cc,
+	0xb4d1,
+	0xb800,
+	0xb801,
+	0xb802,
+	0xb803,
+	0xb980,
+	0xb982,
+	0xb983,
+	0xb984,
+	0xb985,
+	0xb986,
+	0xb990,
+	0xb991,
+	0xb992,
+	0xb993,
+	0xb994,
+	0xb995,
+	0xb996,
+	0xb997,
+	0xb998,
+	0xb999,
+	0xb99a,
+	0xb99b,
+	0xb9c0,
+	0xb9c1,
+	0xb9c2,
+	0xb9c3,
+	0xb9c4,
+	0xb9c5,
+	0xb9c6,
+	0xb9c7,
+	0xb9c8,
+	0xb9c9,
+	0xbb10,
+};
+template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
+	0xc02,
+	0xc06,
+	0xc10,
+	0xc11,
+	0xc12,
+	0xc13,
+	0xc14,
+	0xc15,
+	0xc16,
+	0xc17,
+	0xc18,
+	0xc19,
+	0xc1a,
+	0xc1b,
+	0xc1c,
+	0xc1d,
+	0xc1e,
+	0xc1f,
+	0xc20,
+	0xc21,
+	0xc22,
+	0xc23,
+	0xc24,
+	0xc25,
+	0xc26,
+	0xc27,
+	0xc28,
+	0xc29,
+	0xc2a,
+	0xc2b,
+	0xc2c,
+	0xc2d,
+	0xc2e,
+	0xc2f,
+	0xc38,
+	0xc39,
+	0xc3a,
+	0xc3b,
+	0xc3c,
+	0xc3d,
+	0xc3e,
+	0xc3f,
+	0xc40,
+	0xc41,
+	0xc42,
+	0xc43,
+	0xc44,
+	0xc45,
+	0xc46,
+	0xc47,
+	0xc48,
+	0xc49,
+	0xc4a,
+	0xc4b,
+	0xc4c,
+	0xc4d,
+	0xc4e,
+	0xc4f,
+	0xc50,
+	0xc51,
+	0xc52,
+	0xc53,
+	0xc54,
+	0xc55,
+	0xc56,
+	0xc57,
+	0x8000,
+	0x8001,
+	0x8002,
+	0x8003,
+	0x8004,
+	0x8005,
+	0x8006,
+	0x8007,
+	0x8008,
+	0x8010,
+	0x8011,
+	0x8012,
+	0x8013,
+	0x8014,
+	0x8015,
+	0x8016,
+	0x8017,
+	0x8018,
+	0x8019,
+	0x801a,
+	0x801b,
+	0x801c,
+	0x801d,
+	0x801e,
+	0x801f,
+	0x8020,
+	0x8021,
+	0x8022,
+	0x8023,
+	0x8024,
+	0x8025,
+	0x8026,
+	0x8027,
+	0x8028,
+	0x8029,
+	0x802a,
+	0x802b,
+	0x802c,
+	0x802d,
+	0x802e,
+	0x802f,
+	0x8030,
+	0x8031,
+	0x8032,
+	0x8033,
+	0x8034,
+	0x8035,
+	0x8036,
+	0x8037,
+	0x8038,
+	0x8039,
+	0x803a,
+	0x803b,
+	0x803c,
+	0x803d,
+	0x803e,
+	0x803f,
+	0x8040,
+	0x8041,
+	0x8042,
+	0x8043,
+	0x8044,
+	0x8045,
+	0x8046,
+	0x8047,
+	0x8048,
+	0x8049,
+	0x804a,
+	0x804b,
+	0x804c,
+	0x804d,
+	0x804e,
+	0x804f,
+	0x8050,
+	0x8051,
+	0x8052,
+	0x8053,
+	0x8054,
+	0x8055,
+	0x8056,
+	0x8057,
+	0x8058,
+	0x8059,
+	0x805a,
+	0x805b,
+	0x805c,
+	0x805d,
+	0x805e,
+	0x805f,
+	0x8060,
+	0x8061,
+	0x8062,
+	0x8063,
+	0x8064,
+	0x8065,
+	0x8066,
+	0x8067,
+	0x8068,
+	0x8069,
+	0x806a,
+	0x806b,
+	0x806c,
+	0x806d,
+	0x806e,
+	0x806f,
+	0x8070,
+	0x8071,
+	0x8072,
+	0x8073,
+	0x8074,
+	0x8075,
+	0x8076,
+	0x8077,
+	0x8078,
+	0x8079,
+	0x807a,
+	0x807b,
+	0x807c,
+	0x807d,
+	0x807e,
+	0x807f,
+	0x8080,
+	0x8081,
+	0x8082,
+	0x8083,
+	0x8084,
+	0x8085,
+	0x8086,
+	0x8087,
+	0x8088,
+	0x8089,
+	0x808a,
+	0x808b,
+	0x808c,
+	0x808d,
+	0x808e,
+	0x808f,
+	0x8090,
+	0x8091,
+	0x8092,
+	0x8094,
+	0x8095,
+	0x8096,
+	0x8097,
+	0x8098,
+	0x809b,
+	0x809c,
+	0x809d,
+	0x80a0,
+	0x80a1,
+	0x80a2,
+	0x80a3,
+	0x80a4,
+	0x80a5,
+	0x80a6,
+	0x80a7,
+	0x80b0,
+	0x80b1,
+	0x80b2,
+	0x80b3,
+	0x80b4,
+	0x80b5,
+	0x80b6,
+	0x80b7,
+	0x80b8,
+	0x80b9,
+	0x80ba,
+	0x80bb,
+	0x80bc,
+	0x80bd,
+	0x80be,
+	0x80bf,
+	0x80c0,
+	0x80c1,
+	0x80c2,
+	0x80c3,
+	0x80c4,
+	0x80c5,
+	0x80c6,
+	0x80c7,
+	0x80c8,
+	0x80c9,
+	0x80ca,
+	0x80cb,
+	0x80cc,
+	0x80cd,
+	0x80ce,
+	0x80cf,
+	0x80d0,
+	0x80d1,
+	0x80d2,
+	0x80d3,
+	0x80d4,
+	0x80d5,
+	0x80d6,
+	0x80d7,
+	0x80d8,
+	0x80d9,
+	0x80da,
+	0x80db,
+	0x80dc,
+	0x80dd,
+	0x80de,
+	0x80df,
+	0x80e0,
+	0x80e1,
+	0x80e2,
+	0x80e3,
+	0x80e4,
+	0x80e5,
+	0x80e6,
+	0x80e7,
+	0x80e8,
+	0x80e9,
+	0x80ea,
+	0x80eb,
+	0x80ec,
+	0x80ed,
+	0x80ee,
+	0x80ef,
+	0x80f0,
+	0x80f1,
+	0x8100,
+	0x8101,
+	0x8102,
+	0x8103,
+	0x8104,
+	0x8105,
+	0x8106,
+	0x8107,
+	0x8109,
+	0x810b,
+	0x8113,
+	0x8400,
+	0x8401,
+	0x8402,
+	0x8403,
+	0x8404,
+	0x8405,
+	0x8406,
+	0x840a,
+	0x840b,
+	0x8800,
+	0x8801,
+	0x8802,
+	0x8803,
+	0x8804,
+	0x8805,
+	0x8806,
+	0x8809,
+	0x880a,
+	0x880b,
+	0x880c,
+	0x880d,
+	0x880f,
+	0x8810,
+	0x8812,
+	0x8820,
+	0x8821,
+	0x8822,
+	0x8823,
+	0x8824,
+	0x8825,
+	0x8826,
+	0x8827,
+	0x8828,
+	0x8829,
+	0x882a,
+	0x882b,
+	0x882c,
+	0x882d,
+	0x882e,
+	0x882f,
+	0x8830,
+	0x8831,
+	0x8832,
+	0x8833,
+	0x8834,
+	0x8835,
+	0x8836,
+	0x8837,
+	0x8838,
+	0x8839,
+	0x883a,
+	0x883b,
+	0x883c,
+	0x883d,
+	0x883e,
+	0x883f,
+	0x8840,
+	0x8841,
+	0x8842,
+	0x8843,
+	0x8844,
+	0x8845,
+	0x8846,
+	0x8847,
+	0x8848,
+	0x8849,
+	0x884a,
+	0x884b,
+	0x884c,
+	0x884d,
+	0x884e,
+	0x884f,
+	0x8850,
+	0x8851,
+	0x8852,
+	0x8853,
+	0x8854,
+	0x8855,
+	0x8856,
+	0x8857,
+	0x8858,
+	0x8859,
+	0x885a,
+	0x885b,
+	0x885c,
+	0x885d,
+	0x885e,
+	0x885f,
+	0x8860,
+	0x8861,
+	0x8862,
+	0x8863,
+	0x8865,
+	0x8870,
+	0x8871,
+	0x8872,
+	0x8873,
+	0x8874,
+	0x8875,
+	0x8876,
+	0x8877,
+	0x8878,
+	0x8879,
+	0x8880,
+	0x8881,
+	0x8882,
+	0x8883,
+	0x8884,
+	0x8885,
+	0x8886,
+	0x8887,
+	0x8888,
+	0x8889,
+	0x8890,
+	0x8898,
+	0x88c0,
+	0x88c1,
+	0x88d0,
+	0x88d1,
+	0x88d2,
+	0x88d3,
+	0x88d4,
+	0x88d5,
+	0x88d6,
+	0x88d7,
+	0x88d8,
+	0x88d9,
+	0x88da,
+	0x88db,
+	0x88dc,
+	0x88dd,
+	0x88de,
+	0x88df,
+	0x88e0,
+	0x88e1,
+	0x88e2,
+	0x88e3,
+	0x88e5,
+	0x8900,
+	0x8901,
+	0x8902,
+	0x8903,
+	0x8904,
+	0x8905,
+	0x8906,
+	0x8907,
+	0x8908,
+	0x8909,
+	0x890a,
+	0x890b,
+	0x890c,
+	0x890d,
+	0x890e,
+	0x890f,
+	0x8910,
+	0x8911,
+	0x8912,
+	0x8913,
+	0x8914,
+	0x8915,
+	0x8916,
+	0x8917,
+	0x8918,
+	0x8919,
+	0x891a,
+	0x8c00,
+	0x8c01,
+	0x8c17,
+	0x8c18,
+	0x8c19,
+	0x8c1a,
+	0x8c1b,
+	0x8c1c,
+	0x8c1d,
+	0x8c1e,
+	0x8c1f,
+	0x8c20,
+	0x8c21,
+	0x8c22,
+	0x8c23,
+	0x8c24,
+	0x8c25,
+	0x8c2c,
+	0x8c2d,
+	0x8c2e,
+	0x8c2f,
+	0x9101,
+	0x9102,
+	0x9103,
+	0x9104,
+	0x9105,
+	0x9106,
+	0x9107,
+	0x9108,
+	0x9109,
+	0x910a,
+	0x910b,
+	0x910c,
+	0x9200,
+	0x9201,
+	0x9202,
+	0x9203,
+	0x9204,
+	0x9205,
+	0x9206,
+	0x9207,
+	0x9208,
+	0x9209,
+	0x920a,
+	0x920b,
+	0x920c,
+	0x920d,
+	0x920e,
+	0x920f,
+	0x9212,
+	0x9213,
+	0x9214,
+	0x9215,
+	0x9216,
+	0x9217,
+	0x9301,
+	0x9302,
+	0x9303,
+	0x9304,
+	0x9305,
+	0x9306,
+	0x9307,
+	0x9800,
+	0x9801,
+	0x9802,
+	0x9803,
+	0x9804,
+	0x9805,
+	0x9806,
+	0x9808,
+	0x9809,
+	0x9b00,
+	0x9b01,
+	0x9b02,
+	0x9b03,
+	0x9b04,
+	0x9b05,
+	0x9b07,
+	0x9b08,
+	0xa000,
+	0xa001,
+	0xa002,
+	0xa003,
+	0xa004,
+	0xa005,
+	0xa006,
+	0xa008,
+	0xa00e,
+	0xa00f,
+	0xa010,
+	0xa011,
+	0xa012,
+	0xa013,
+	0xa014,
+	0xa015,
+	0xa016,
+	0xa017,
+	0xa018,
+	0xa019,
+	0xa01a,
+	0xa01b,
+	0xa01c,
+	0xa01d,
+	0xa01e,
+	0xa01f,
+	0xa020,
+	0xa021,
+	0xa022,
+	0xa023,
+	0xa024,
+	0xa025,
+	0xa026,
+	0xa027,
+	0xa028,
+	0xa029,
+	0xa02a,
+	0xa02b,
+	0xa02c,
+	0xa02d,
+	0xa02e,
+	0xa02f,
+	0xa030,
+	0xa031,
+	0xa032,
+	0xa033,
+	0xa034,
+	0xa035,
+	0xa036,
+	0xa037,
+	0xa038,
+	0xa039,
+	0xa03a,
+	0xa03b,
+	0xa03c,
+	0xa03d,
+	0xa03e,
+	0xa03f,
+	0xa040,
+	0xa041,
+	0xa042,
+	0xa043,
+	0xa044,
+	0xa045,
+	0xa046,
+	0xa047,
+	0xa048,
+	0xa049,
+	0xa04a,
+	0xa04b,
+	0xa04c,
+	0xa04d,
+	0xa04e,
+	0xa04f,
+	0xa050,
+	0xa051,
+	0xa052,
+	0xa053,
+	0xa054,
+	0xa055,
+	0xa056,
+	0xa057,
+	0xa058,
+	0xa059,
+	0xa05a,
+	0xa05b,
+	0xa05c,
+	0xa05d,
+	0xa05e,
+	0xa05f,
+	0xa060,
+	0xa061,
+	0xa062,
+	0xa063,
+	0xa064,
+	0xa065,
+	0xa066,
+	0xa067,
+	0xa068,
+	0xa069,
+	0xa06a,
+	0xa06b,
+	0xa06c,
+	0xa06d,
+	0xa06e,
+	0xa06f,
+	0xa070,
+	0xa071,
+	0xa072,
+	0xa073,
+	0xa074,
+	0xa075,
+	0xa076,
+	0xa077,
+	0xa078,
+	0xa079,
+	0xa07a,
+	0xa07b,
+	0xa07c,
+	0xa07d,
+	0xa07e,
+	0xa07f,
+	0xa080,
+	0xa081,
+	0xa082,
+	0xa083,
+	0xa084,
+	0xa085,
+	0xa086,
+	0xa087,
+	0xa088,
+	0xa089,
+	0xa08a,
+	0xa08b,
+	0xa08c,
+	0xa08d,
+	0xa08e,
+	0xa08f,
+	0xa090,
+	0xa091,
+	0xa092,
+	0xa093,
+	0xa094,
+	0xa095,
+	0xa096,
+	0xa097,
+	0xa098,
+	0xa099,
+	0xa09a,
+	0xa09b,
+	0xa09c,
+	0xa09d,
+	0xa09e,
+	0xa09f,
+	0xa0a0,
+	0xa0a1,
+	0xa0a2,
+	0xa0a3,
+	0xa0a4,
+	0xa0a5,
+	0xa0a6,
+	0xa0a7,
+	0xa0a8,
+	0xa0a9,
+	0xa0aa,
+	0xa0ab,
+	0xa0ac,
+	0xa0ad,
+	0xa0ae,
+	0xa0af,
+	0xa0b0,
+	0xa0b1,
+	0xa0b2,
+	0xa0b3,
+	0xa0b4,
+	0xa0b5,
+	0xa0b6,
+	0xa0b7,
+	0xa0b8,
+	0xa0b9,
+	0xa0ba,
+	0xa0bb,
+	0xa0bc,
+	0xa0bd,
+	0xa0be,
+	0xa0bf,
+	0xa0c0,
+	0xa0c1,
+	0xa0c2,
+	0xa0c3,
+	0xa0c4,
+	0xa0c5,
+	0xa0c6,
+	0xa0c7,
+	0xa0c8,
+	0xa0c9,
+	0xa0ca,
+	0xa0cb,
+	0xa0cc,
+	0xa0cd,
+	0xa0ce,
+	0xa0cf,
+	0xa0d0,
+	0xa0d1,
+	0xa0d2,
+	0xa0d3,
+	0xa0d4,
+	0xa0d5,
+	0xa0d6,
+	0xa0d7,
+	0xa0d8,
+	0xa0d9,
+	0xa0da,
+	0xa0db,
+	0xa0dc,
+	0xa0dd,
+	0xa0de,
+	0xa0df,
+	0xa0e0,
+	0xa0e1,
+	0xa0e2,
+	0xa0e3,
+	0xa0e4,
+	0xa0e5,
+	0xa0e6,
+	0xa0e7,
+	0xa0e8,
+	0xa0e9,
+	0xa0ea,
+	0xa0eb,
+	0xa0ec,
+	0xa0ed,
+	0xa0ee,
+	0xa0ef,
+	0xa0f8,
+	0xa800,
+	0xa802,
+	0xa803,
+	0xa804,
+	0xa805,
+	0xa806,
+	0xa807,
+	0xa808,
+	0xa809,
+	0xa80a,
+	0xa80b,
+	0xa80c,
+	0xa80d,
+	0xa80e,
+	0xa80f,
+	0xa810,
+	0xa811,
+	0xa812,
+	0xa813,
+	0xa814,
+	0xa815,
+	0xa816,
+	0xa817,
+	0xa818,
+	0xa819,
+	0xa81a,
+	0xa81b,
+	0xa81c,
+	0xa81d,
+	0xa81e,
+	0xa81f,
+	0xa820,
+	0xa821,
+	0xa822,
+	0xa823,
+	0xa824,
+	0xa825,
+	0xa827,
+	0xa830,
+	0xa831,
+	0xa832,
+	0xa833,
+	0xa834,
+	0xa835,
+	0xa836,
+	0xa837,
+	0xa838,
+	0xa839,
+	0xa83a,
+	0xa83b,
+	0xa83c,
+	0xa83d,
+	0xa83f,
+	0xa840,
+	0xa842,
+	0xa843,
+	0xa844,
+	0xa845,
+	0xa846,
+	0xa847,
+	0xa848,
+	0xa849,
+	0xa84a,
+	0xa84b,
+	0xa84c,
+	0xa84d,
+	0xa84e,
+	0xa84f,
+	0xa850,
+	0xa851,
+	0xa852,
+	0xa853,
+	0xa854,
+	0xa855,
+	0xa856,
+	0xa857,
+	0xa858,
+	0xa859,
+	0xa85a,
+	0xa85b,
+	0xa85c,
+	0xa85d,
+	0xa85e,
+	0xa85f,
+	0xa860,
+	0xa861,
+	0xa862,
+	0xa863,
+	0xa864,
+	0xa865,
+	0xa867,
+	0xa870,
+	0xa871,
+	0xa872,
+	0xa873,
+	0xa874,
+	0xa875,
+	0xa876,
+	0xa877,
+	0xa878,
+	0xa879,
+	0xa87a,
+	0xa87b,
+	0xa87c,
+	0xa87d,
+	0xa87e,
+	0xa87f,
+	0xa880,
+	0xa881,
+	0xa882,
+	0xa883,
+	0xa884,
+	0xa885,
+	0xa886,
+	0xa887,
+	0xa888,
+	0xa889,
+	0xa88a,
+	0xa88b,
+	0xa88c,
+	0xa88d,
+	0xa88e,
+	0xa88f,
+	0xa890,
+	0xa891,
+	0xa892,
+	0xa893,
+	0xa894,
+	0xa895,
+	0xa896,
+	0xa898,
+	0xa980,
+	0xa982,
+	0xa983,
+	0xa984,
+	0xa985,
+	0xa986,
+	0xa987,
+	0xa988,
+	0xa989,
+	0xa98a,
+	0xa98b,
+	0xa98c,
+	0xa98d,
+	0xa98e,
+	0xa98f,
+	0xa990,
+	0xa991,
+	0xa992,
+	0xa993,
+	0xa994,
+	0xa995,
+	0xa996,
+	0xa997,
+	0xa998,
+	0xa999,
+	0xa99a,
+	0xa99b,
+	0xa99c,
+	0xa99d,
+	0xa99e,
+	0xa99f,
+	0xa9a0,
+	0xa9a1,
+	0xa9a2,
+	0xa9a3,
+	0xa9a4,
+	0xa9a5,
+	0xa9a6,
+	0xa9a7,
+	0xa9a9,
+	0xa9aa,
+	0xa9bf,
+	0xa9c6,
+	0xa9c7,
+	0xa9c8,
+	0xa9c9,
+	0xa9ca,
+	0xa9cb,
+	0xa9d4,
+	0xa9d5,
+	0xa9d6,
+	0xa9d7,
+	0xa9d8,
+	0xa9d9,
+	0xa9da,
+	0xa9db,
+	0xa9dc,
+	0xa9dd,
+	0xa9de,
+	0xa9e0,
+	0xa9e1,
+	0xa9e4,
+	0xa9e5,
+	0xab00,
+	0xab03,
+	0xab04,
+	0xab05,
+	0xab0a,
+	0xab0b,
+	0xab0c,
+	0xab0d,
+	0xab0e,
+	0xab0f,
+	0xab10,
+	0xab11,
+	0xab12,
+	0xab13,
+	0xab14,
+	0xab15,
+	0xab16,
+	0xab17,
+	0xab18,
+	0xab19,
+	0xab21,
+	0xb2c0,
+	0xb2c2,
+	0xb2c3,
+	0xb2ca,
+	0xb2cb,
+	0xb2cc,
+	0xb2d2,
+	0xb300,
+	0xb301,
+	0xb304,
+	0xb305,
+	0xb306,
+	0xb307,
+};
+#endif
+
 #endif /* A6XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 24e20aeeb3c3..c6b065a63dd3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -223,7 +223,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	 * note: downstream saves the value in poweroff and restores it here
 	 */
 	if (adreno_is_a7xx(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_GENERAL_9, 0);
+		gmu_write(gmu, REG_A7XX_GMU_GENERAL_9, 0);
 	else
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
 
@@ -863,8 +863,8 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	}
 
 	if (adreno_is_a7xx(adreno_gpu)) {
-		gmu_write(gmu, REG_A6XX_GMU_GENERAL_10, chipid);
-		gmu_write(gmu, REG_A6XX_GMU_GENERAL_8,
+		gmu_write(gmu, REG_A7XX_GMU_GENERAL_10, chipid);
+		gmu_write(gmu, REG_A7XX_GMU_GENERAL_8,
 			  (gmu->log.iova & GENMASK(31, 12)) |
 			  ((gmu->log.size / SZ_4K - 1) & GENMASK(7, 0)));
 	} else {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 5b66efafc901..9d7f93929367 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -3,28 +3,19 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml      (  11820 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
+
+Copyright (C) 2013-2024 by the following authors:
+- Rob Clark <robdclark@gmail.com> Rob Clark
+- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
 
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
@@ -45,112 +36,42 @@ IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
+
+#define A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB			0x00800000
+#define A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB		0x40000000
+
+#define A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK			0x00400000
+#define A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK			0x40000000
+#define A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK			0x40000000
+#define A6XX_GMU_OOB_DCVS_SET_MASK				0x00800000
+#define A6XX_GMU_OOB_DCVS_CHECK_MASK				0x80000000
+#define A6XX_GMU_OOB_DCVS_CLEAR_MASK				0x80000000
+#define A6XX_GMU_OOB_GPU_SET_MASK				0x00040000
+#define A6XX_GMU_OOB_GPU_CHECK_MASK				0x04000000
+#define A6XX_GMU_OOB_GPU_CLEAR_MASK				0x04000000
+#define A6XX_GMU_OOB_PERFCNTR_SET_MASK				0x00020000
+#define A6XX_GMU_OOB_PERFCNTR_CHECK_MASK			0x02000000
+#define A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK			0x02000000
 
-#define A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB__MASK		0x00800000
-#define A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB__SHIFT		23
-static inline uint32_t A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB(uint32_t val)
-{
-	return ((val) << A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB__SHIFT) & A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB__MASK;
-}
-#define A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB__MASK	0x40000000
-#define A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB__SHIFT	30
-static inline uint32_t A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB(uint32_t val)
-{
-	return ((val) << A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB__SHIFT) & A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB__MASK;
-}
-#define A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK__MASK		0x00400000
-#define A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK__SHIFT		22
-static inline uint32_t A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK__SHIFT) & A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK__MASK;
-}
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK__MASK		0x40000000
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK__SHIFT		30
-static inline uint32_t A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK__SHIFT) & A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK__MASK;
-}
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK__MASK		0x40000000
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK__SHIFT		30
-static inline uint32_t A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK__SHIFT) & A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK__MASK;
-}
-#define A6XX_GMU_OOB_DCVS_SET_MASK__MASK			0x00800000
-#define A6XX_GMU_OOB_DCVS_SET_MASK__SHIFT			23
-static inline uint32_t A6XX_GMU_OOB_DCVS_SET_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_DCVS_SET_MASK__SHIFT) & A6XX_GMU_OOB_DCVS_SET_MASK__MASK;
-}
-#define A6XX_GMU_OOB_DCVS_CHECK_MASK__MASK			0x80000000
-#define A6XX_GMU_OOB_DCVS_CHECK_MASK__SHIFT			31
-static inline uint32_t A6XX_GMU_OOB_DCVS_CHECK_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_DCVS_CHECK_MASK__SHIFT) & A6XX_GMU_OOB_DCVS_CHECK_MASK__MASK;
-}
-#define A6XX_GMU_OOB_DCVS_CLEAR_MASK__MASK			0x80000000
-#define A6XX_GMU_OOB_DCVS_CLEAR_MASK__SHIFT			31
-static inline uint32_t A6XX_GMU_OOB_DCVS_CLEAR_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_DCVS_CLEAR_MASK__SHIFT) & A6XX_GMU_OOB_DCVS_CLEAR_MASK__MASK;
-}
-#define A6XX_GMU_OOB_GPU_SET_MASK__MASK				0x00040000
-#define A6XX_GMU_OOB_GPU_SET_MASK__SHIFT			18
-static inline uint32_t A6XX_GMU_OOB_GPU_SET_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_GPU_SET_MASK__SHIFT) & A6XX_GMU_OOB_GPU_SET_MASK__MASK;
-}
-#define A6XX_GMU_OOB_GPU_CHECK_MASK__MASK			0x04000000
-#define A6XX_GMU_OOB_GPU_CHECK_MASK__SHIFT			26
-static inline uint32_t A6XX_GMU_OOB_GPU_CHECK_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_GPU_CHECK_MASK__SHIFT) & A6XX_GMU_OOB_GPU_CHECK_MASK__MASK;
-}
-#define A6XX_GMU_OOB_GPU_CLEAR_MASK__MASK			0x04000000
-#define A6XX_GMU_OOB_GPU_CLEAR_MASK__SHIFT			26
-static inline uint32_t A6XX_GMU_OOB_GPU_CLEAR_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_GPU_CLEAR_MASK__SHIFT) & A6XX_GMU_OOB_GPU_CLEAR_MASK__MASK;
-}
-#define A6XX_GMU_OOB_PERFCNTR_SET_MASK__MASK			0x00020000
-#define A6XX_GMU_OOB_PERFCNTR_SET_MASK__SHIFT			17
-static inline uint32_t A6XX_GMU_OOB_PERFCNTR_SET_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_PERFCNTR_SET_MASK__SHIFT) & A6XX_GMU_OOB_PERFCNTR_SET_MASK__MASK;
-}
-#define A6XX_GMU_OOB_PERFCNTR_CHECK_MASK__MASK			0x02000000
-#define A6XX_GMU_OOB_PERFCNTR_CHECK_MASK__SHIFT			25
-static inline uint32_t A6XX_GMU_OOB_PERFCNTR_CHECK_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_PERFCNTR_CHECK_MASK__SHIFT) & A6XX_GMU_OOB_PERFCNTR_CHECK_MASK__MASK;
-}
-#define A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK__MASK			0x02000000
-#define A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK__SHIFT			25
-static inline uint32_t A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK(uint32_t val)
-{
-	return ((val) << A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK__SHIFT) & A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK__MASK;
-}
 #define A6XX_HFI_IRQ_MSGQ_MASK					0x00000001
-#define A6XX_HFI_IRQ_DSGQ_MASK__MASK				0x00000002
-#define A6XX_HFI_IRQ_DSGQ_MASK__SHIFT				1
-static inline uint32_t A6XX_HFI_IRQ_DSGQ_MASK(uint32_t val)
-{
-	return ((val) << A6XX_HFI_IRQ_DSGQ_MASK__SHIFT) & A6XX_HFI_IRQ_DSGQ_MASK__MASK;
-}
-#define A6XX_HFI_IRQ_BLOCKED_MSG_MASK__MASK			0x00000004
-#define A6XX_HFI_IRQ_BLOCKED_MSG_MASK__SHIFT			2
-static inline uint32_t A6XX_HFI_IRQ_BLOCKED_MSG_MASK(uint32_t val)
-{
-	return ((val) << A6XX_HFI_IRQ_BLOCKED_MSG_MASK__SHIFT) & A6XX_HFI_IRQ_BLOCKED_MSG_MASK__MASK;
-}
-#define A6XX_HFI_IRQ_CM3_FAULT_MASK__MASK			0x00800000
-#define A6XX_HFI_IRQ_CM3_FAULT_MASK__SHIFT			23
-static inline uint32_t A6XX_HFI_IRQ_CM3_FAULT_MASK(uint32_t val)
-{
-	return ((val) << A6XX_HFI_IRQ_CM3_FAULT_MASK__SHIFT) & A6XX_HFI_IRQ_CM3_FAULT_MASK__MASK;
-}
+#define A6XX_HFI_IRQ_DSGQ_MASK					0x00000002
+#define A6XX_HFI_IRQ_BLOCKED_MSG_MASK				0x00000004
+#define A6XX_HFI_IRQ_CM3_FAULT_MASK				0x00800000
 #define A6XX_HFI_IRQ_GMU_ERR_MASK__MASK				0x007f0000
 #define A6XX_HFI_IRQ_GMU_ERR_MASK__SHIFT			16
 static inline uint32_t A6XX_HFI_IRQ_GMU_ERR_MASK(uint32_t val)
@@ -163,7 +84,9 @@ static inline uint32_t A6XX_HFI_IRQ_OOB_MASK(uint32_t val)
 {
 	return ((val) << A6XX_HFI_IRQ_OOB_MASK__SHIFT) & A6XX_HFI_IRQ_OOB_MASK__MASK;
 }
+
 #define A6XX_HFI_H2F_IRQ_MASK_BIT				0x00000001
+
 #define REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL		0x00000080
 
 #define REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL			0x00000081
@@ -356,15 +279,19 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_HOST2GMU_INTR_INFO_3			0x0000519e
 
+#define REG_A6XX_GMU_GENERAL_0					0x000051c5
+
 #define REG_A6XX_GMU_GENERAL_1					0x000051c6
 
+#define REG_A6XX_GMU_GENERAL_6					0x000051cb
+
 #define REG_A6XX_GMU_GENERAL_7					0x000051cc
 
-#define REG_A6XX_GMU_GENERAL_8					0x000051cd
+#define REG_A7XX_GMU_GENERAL_8					0x000051cd
 
-#define REG_A6XX_GMU_GENERAL_9					0x000051ce
+#define REG_A7XX_GMU_GENERAL_9					0x000051ce
 
-#define REG_A6XX_GMU_GENERAL_10					0x000051cf
+#define REG_A7XX_GMU_GENERAL_10					0x000051cf
 
 #define REG_A6XX_GMU_ISENSE_CTRL				0x0000515d
 
@@ -489,5 +416,7 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
 
+#ifdef __cplusplus
+#endif
 
 #endif /* A6XX_GMU_XML */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_common.xml.h b/drivers/gpu/drm/msm/adreno/adreno_common.xml.h
index 51c320a2e5c0..fbc27930e550 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_common.xml.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_common.xml.h
@@ -3,50 +3,27 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum chip {
 	A2XX = 2,
@@ -141,11 +118,13 @@ enum a3xx_rop_code {
 	ROP_COPY_INVERTED = 3,
 	ROP_AND_REVERSE = 4,
 	ROP_INVERT = 5,
+	ROP_XOR = 6,
 	ROP_NAND = 7,
 	ROP_AND = 8,
 	ROP_EQUIV = 9,
 	ROP_NOOP = 10,
 	ROP_OR_INVERTED = 11,
+	ROP_COPY = 12,
 	ROP_OR_REVERSE = 13,
 	ROP_OR = 14,
 	ROP_SET = 15,
@@ -258,7 +237,8 @@ static inline uint32_t AXXX_CP_RB_RPTR_ADDR_SWAP(uint32_t val)
 #define AXXX_CP_RB_RPTR_ADDR_ADDR__SHIFT			2
 static inline uint32_t AXXX_CP_RB_RPTR_ADDR_ADDR(uint32_t val)
 {
-	return ((val >> 2) << AXXX_CP_RB_RPTR_ADDR_ADDR__SHIFT) & AXXX_CP_RB_RPTR_ADDR_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << AXXX_CP_RB_RPTR_ADDR_ADDR__SHIFT) & AXXX_CP_RB_RPTR_ADDR_ADDR__MASK;
 }
 
 #define REG_AXXX_CP_RB_RPTR					0x000001c4
@@ -471,174 +451,34 @@ static inline uint32_t AXXX_CP_CSQ_IB2_STAT_WPTR(uint32_t val)
 #define REG_AXXX_CP_IB2_BUFSZ					0x0000045b
 
 #define REG_AXXX_CP_STAT					0x0000047f
-#define AXXX_CP_STAT_CP_BUSY__MASK				0x80000000
-#define AXXX_CP_STAT_CP_BUSY__SHIFT				31
-static inline uint32_t AXXX_CP_STAT_CP_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CP_BUSY__SHIFT) & AXXX_CP_STAT_CP_BUSY__MASK;
-}
-#define AXXX_CP_STAT_VS_EVENT_FIFO_BUSY__MASK			0x40000000
-#define AXXX_CP_STAT_VS_EVENT_FIFO_BUSY__SHIFT			30
-static inline uint32_t AXXX_CP_STAT_VS_EVENT_FIFO_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_VS_EVENT_FIFO_BUSY__SHIFT) & AXXX_CP_STAT_VS_EVENT_FIFO_BUSY__MASK;
-}
-#define AXXX_CP_STAT_PS_EVENT_FIFO_BUSY__MASK			0x20000000
-#define AXXX_CP_STAT_PS_EVENT_FIFO_BUSY__SHIFT			29
-static inline uint32_t AXXX_CP_STAT_PS_EVENT_FIFO_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_PS_EVENT_FIFO_BUSY__SHIFT) & AXXX_CP_STAT_PS_EVENT_FIFO_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CF_EVENT_FIFO_BUSY__MASK			0x10000000
-#define AXXX_CP_STAT_CF_EVENT_FIFO_BUSY__SHIFT			28
-static inline uint32_t AXXX_CP_STAT_CF_EVENT_FIFO_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CF_EVENT_FIFO_BUSY__SHIFT) & AXXX_CP_STAT_CF_EVENT_FIFO_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RB_EVENT_FIFO_BUSY__MASK			0x08000000
-#define AXXX_CP_STAT_RB_EVENT_FIFO_BUSY__SHIFT			27
-static inline uint32_t AXXX_CP_STAT_RB_EVENT_FIFO_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RB_EVENT_FIFO_BUSY__SHIFT) & AXXX_CP_STAT_RB_EVENT_FIFO_BUSY__MASK;
-}
-#define AXXX_CP_STAT_ME_BUSY__MASK				0x04000000
-#define AXXX_CP_STAT_ME_BUSY__SHIFT				26
-static inline uint32_t AXXX_CP_STAT_ME_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_ME_BUSY__SHIFT) & AXXX_CP_STAT_ME_BUSY__MASK;
-}
-#define AXXX_CP_STAT_MIU_WR_C_BUSY__MASK			0x02000000
-#define AXXX_CP_STAT_MIU_WR_C_BUSY__SHIFT			25
-static inline uint32_t AXXX_CP_STAT_MIU_WR_C_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_MIU_WR_C_BUSY__SHIFT) & AXXX_CP_STAT_MIU_WR_C_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CP_3D_BUSY__MASK				0x00800000
-#define AXXX_CP_STAT_CP_3D_BUSY__SHIFT				23
-static inline uint32_t AXXX_CP_STAT_CP_3D_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CP_3D_BUSY__SHIFT) & AXXX_CP_STAT_CP_3D_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CP_NRT_BUSY__MASK				0x00400000
-#define AXXX_CP_STAT_CP_NRT_BUSY__SHIFT				22
-static inline uint32_t AXXX_CP_STAT_CP_NRT_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CP_NRT_BUSY__SHIFT) & AXXX_CP_STAT_CP_NRT_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RBIU_SCRATCH_BUSY__MASK			0x00200000
-#define AXXX_CP_STAT_RBIU_SCRATCH_BUSY__SHIFT			21
-static inline uint32_t AXXX_CP_STAT_RBIU_SCRATCH_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RBIU_SCRATCH_BUSY__SHIFT) & AXXX_CP_STAT_RBIU_SCRATCH_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RCIU_ME_BUSY__MASK				0x00100000
-#define AXXX_CP_STAT_RCIU_ME_BUSY__SHIFT			20
-static inline uint32_t AXXX_CP_STAT_RCIU_ME_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RCIU_ME_BUSY__SHIFT) & AXXX_CP_STAT_RCIU_ME_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RCIU_PFP_BUSY__MASK			0x00080000
-#define AXXX_CP_STAT_RCIU_PFP_BUSY__SHIFT			19
-static inline uint32_t AXXX_CP_STAT_RCIU_PFP_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RCIU_PFP_BUSY__SHIFT) & AXXX_CP_STAT_RCIU_PFP_BUSY__MASK;
-}
-#define AXXX_CP_STAT_MEQ_RING_BUSY__MASK			0x00040000
-#define AXXX_CP_STAT_MEQ_RING_BUSY__SHIFT			18
-static inline uint32_t AXXX_CP_STAT_MEQ_RING_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_MEQ_RING_BUSY__SHIFT) & AXXX_CP_STAT_MEQ_RING_BUSY__MASK;
-}
-#define AXXX_CP_STAT_PFP_BUSY__MASK				0x00020000
-#define AXXX_CP_STAT_PFP_BUSY__SHIFT				17
-static inline uint32_t AXXX_CP_STAT_PFP_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_PFP_BUSY__SHIFT) & AXXX_CP_STAT_PFP_BUSY__MASK;
-}
-#define AXXX_CP_STAT_ST_QUEUE_BUSY__MASK			0x00010000
-#define AXXX_CP_STAT_ST_QUEUE_BUSY__SHIFT			16
-static inline uint32_t AXXX_CP_STAT_ST_QUEUE_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_ST_QUEUE_BUSY__SHIFT) & AXXX_CP_STAT_ST_QUEUE_BUSY__MASK;
-}
-#define AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY__MASK			0x00002000
-#define AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY__SHIFT		13
-static inline uint32_t AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY__SHIFT) & AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY__MASK;
-}
-#define AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY__MASK			0x00001000
-#define AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY__SHIFT		12
-static inline uint32_t AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY__SHIFT) & AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RING_QUEUE_BUSY__MASK			0x00000800
-#define AXXX_CP_STAT_RING_QUEUE_BUSY__SHIFT			11
-static inline uint32_t AXXX_CP_STAT_RING_QUEUE_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RING_QUEUE_BUSY__SHIFT) & AXXX_CP_STAT_RING_QUEUE_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CSF_BUSY__MASK				0x00000400
-#define AXXX_CP_STAT_CSF_BUSY__SHIFT				10
-static inline uint32_t AXXX_CP_STAT_CSF_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CSF_BUSY__SHIFT) & AXXX_CP_STAT_CSF_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CSF_ST_BUSY__MASK				0x00000200
-#define AXXX_CP_STAT_CSF_ST_BUSY__SHIFT				9
-static inline uint32_t AXXX_CP_STAT_CSF_ST_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CSF_ST_BUSY__SHIFT) & AXXX_CP_STAT_CSF_ST_BUSY__MASK;
-}
-#define AXXX_CP_STAT_EVENT_BUSY__MASK				0x00000100
-#define AXXX_CP_STAT_EVENT_BUSY__SHIFT				8
-static inline uint32_t AXXX_CP_STAT_EVENT_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_EVENT_BUSY__SHIFT) & AXXX_CP_STAT_EVENT_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CSF_INDIRECT2_BUSY__MASK			0x00000080
-#define AXXX_CP_STAT_CSF_INDIRECT2_BUSY__SHIFT			7
-static inline uint32_t AXXX_CP_STAT_CSF_INDIRECT2_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CSF_INDIRECT2_BUSY__SHIFT) & AXXX_CP_STAT_CSF_INDIRECT2_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CSF_INDIRECTS_BUSY__MASK			0x00000040
-#define AXXX_CP_STAT_CSF_INDIRECTS_BUSY__SHIFT			6
-static inline uint32_t AXXX_CP_STAT_CSF_INDIRECTS_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CSF_INDIRECTS_BUSY__SHIFT) & AXXX_CP_STAT_CSF_INDIRECTS_BUSY__MASK;
-}
-#define AXXX_CP_STAT_CSF_RING_BUSY__MASK			0x00000020
-#define AXXX_CP_STAT_CSF_RING_BUSY__SHIFT			5
-static inline uint32_t AXXX_CP_STAT_CSF_RING_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_CSF_RING_BUSY__SHIFT) & AXXX_CP_STAT_CSF_RING_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RCIU_BUSY__MASK				0x00000010
-#define AXXX_CP_STAT_RCIU_BUSY__SHIFT				4
-static inline uint32_t AXXX_CP_STAT_RCIU_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RCIU_BUSY__SHIFT) & AXXX_CP_STAT_RCIU_BUSY__MASK;
-}
-#define AXXX_CP_STAT_RBIU_BUSY__MASK				0x00000008
-#define AXXX_CP_STAT_RBIU_BUSY__SHIFT				3
-static inline uint32_t AXXX_CP_STAT_RBIU_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_RBIU_BUSY__SHIFT) & AXXX_CP_STAT_RBIU_BUSY__MASK;
-}
-#define AXXX_CP_STAT_MIU_RD_RETURN_BUSY__MASK			0x00000004
-#define AXXX_CP_STAT_MIU_RD_RETURN_BUSY__SHIFT			2
-static inline uint32_t AXXX_CP_STAT_MIU_RD_RETURN_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_MIU_RD_RETURN_BUSY__SHIFT) & AXXX_CP_STAT_MIU_RD_RETURN_BUSY__MASK;
-}
-#define AXXX_CP_STAT_MIU_RD_REQ_BUSY__MASK			0x00000002
-#define AXXX_CP_STAT_MIU_RD_REQ_BUSY__SHIFT			1
-static inline uint32_t AXXX_CP_STAT_MIU_RD_REQ_BUSY(uint32_t val)
-{
-	return ((val) << AXXX_CP_STAT_MIU_RD_REQ_BUSY__SHIFT) & AXXX_CP_STAT_MIU_RD_REQ_BUSY__MASK;
-}
+#define AXXX_CP_STAT_CP_BUSY					0x80000000
+#define AXXX_CP_STAT_VS_EVENT_FIFO_BUSY				0x40000000
+#define AXXX_CP_STAT_PS_EVENT_FIFO_BUSY				0x20000000
+#define AXXX_CP_STAT_CF_EVENT_FIFO_BUSY				0x10000000
+#define AXXX_CP_STAT_RB_EVENT_FIFO_BUSY				0x08000000
+#define AXXX_CP_STAT_ME_BUSY					0x04000000
+#define AXXX_CP_STAT_MIU_WR_C_BUSY				0x02000000
+#define AXXX_CP_STAT_CP_3D_BUSY					0x00800000
+#define AXXX_CP_STAT_CP_NRT_BUSY				0x00400000
+#define AXXX_CP_STAT_RBIU_SCRATCH_BUSY				0x00200000
+#define AXXX_CP_STAT_RCIU_ME_BUSY				0x00100000
+#define AXXX_CP_STAT_RCIU_PFP_BUSY				0x00080000
+#define AXXX_CP_STAT_MEQ_RING_BUSY				0x00040000
+#define AXXX_CP_STAT_PFP_BUSY					0x00020000
+#define AXXX_CP_STAT_ST_QUEUE_BUSY				0x00010000
+#define AXXX_CP_STAT_INDIRECT2_QUEUE_BUSY			0x00002000
+#define AXXX_CP_STAT_INDIRECTS_QUEUE_BUSY			0x00001000
+#define AXXX_CP_STAT_RING_QUEUE_BUSY				0x00000800
+#define AXXX_CP_STAT_CSF_BUSY					0x00000400
+#define AXXX_CP_STAT_CSF_ST_BUSY				0x00000200
+#define AXXX_CP_STAT_EVENT_BUSY					0x00000100
+#define AXXX_CP_STAT_CSF_INDIRECT2_BUSY				0x00000080
+#define AXXX_CP_STAT_CSF_INDIRECTS_BUSY				0x00000040
+#define AXXX_CP_STAT_CSF_RING_BUSY				0x00000020
+#define AXXX_CP_STAT_RCIU_BUSY					0x00000010
+#define AXXX_CP_STAT_RBIU_BUSY					0x00000008
+#define AXXX_CP_STAT_MIU_RD_RETURN_BUSY				0x00000004
+#define AXXX_CP_STAT_MIU_RD_REQ_BUSY				0x00000002
 #define AXXX_CP_STAT_MIU_WR_BUSY				0x00000001
 
 #define REG_AXXX_CP_SCRATCH_REG0				0x00000578
@@ -693,5 +533,7 @@ static inline uint32_t AXXX_CP_STAT_MIU_RD_REQ_BUSY(uint32_t val)
 
 #define REG_AXXX_CP_ME_VS_FETCH_DONE_DATA			0x00000614
 
+#ifdef __cplusplus
+#endif
 
 #endif /* ADRENO_COMMON_XML */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
index 8a4a2d161a29..146d4c1a9960 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
@@ -3,50 +3,28 @@
 
 /* Autogenerated file, DO NOT EDIT manually!
 
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno.xml                     (    594 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml        (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a2xx.xml                (  91929 bytes, from 2023-02-28 23:52:27)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml       (  15434 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml          (  74995 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a3xx.xml                (  84231 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a4xx.xml                ( 113474 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a5xx.xml                ( 149590 bytes, from 2023-02-14 19:37:12)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml                ( 198949 bytes, from 2023-03-20 18:06:23)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml            (  11404 bytes, from 2023-03-10 18:32:53)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/ocmem.xml               (   1773 bytes, from 2022-08-02 16:38:43)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_control_regs.xml (   9055 bytes, from 2023-03-10 18:32:52)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pipe_regs.xml    (   2976 bytes, from 2023-03-10 18:32:52)
-
-Copyright (C) 2013-2023 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
 */
 
+#ifdef __KERNEL__
+#include <linux/bug.h>
+#define assert(x) BUG_ON(!(x))
+#else
+#include <assert.h>
+#endif
+
+#ifdef __cplusplus
+#define __struct_cast(X)
+#else
+#define __struct_cast(X) (struct X)
+#endif
 
 enum vgt_event_type {
 	VS_DEALLOC = 0,
@@ -94,12 +72,14 @@ enum vgt_event_type {
 	LRZ_FLUSH = 38,
 	BLIT_OP_FILL_2D = 39,
 	BLIT_OP_COPY_2D = 40,
+	UNK_40 = 40,
 	BLIT_OP_SCALE_2D = 42,
 	CONTEXT_DONE_2D = 43,
 	UNK_2C = 44,
 	UNK_2D = 45,
 	CACHE_INVALIDATE = 49,
 	LABEL = 63,
+	DUMMY_EVENT = 1,
 	CCU_INVALIDATE_DEPTH = 24,
 	CCU_INVALIDATE_COLOR = 25,
 	CCU_RESOLVE_CLEAN = 26,
@@ -192,7 +172,7 @@ enum pc_di_vis_cull_mode {
 };
 
 enum adreno_pm4_packet_type {
-	CP_TYPE0_PKT = 0,
+	CP_TYPE0_PKT = 0x00000000,
 	CP_TYPE1_PKT = 0x40000000,
 	CP_TYPE2_PKT = 0x80000000,
 	CP_TYPE3_PKT = 0xc0000000,
@@ -224,6 +204,7 @@ enum adreno_pm4_type3_packets {
 	CP_COND_WRITE = 69,
 	CP_COND_WRITE5 = 69,
 	CP_EVENT_WRITE = 70,
+	CP_EVENT_WRITE7 = 70,
 	CP_EVENT_WRITE_SHD = 88,
 	CP_EVENT_WRITE_CFL = 89,
 	CP_EVENT_WRITE_ZPD = 91,
@@ -325,13 +306,16 @@ enum adreno_pm4_type3_packets {
 	CP_END_BIN = 81,
 	CP_PREEMPT_DISABLE = 108,
 	CP_WAIT_TIMESTAMP = 20,
+	CP_GLOBAL_TIMESTAMP = 21,
+	CP_LOCAL_TIMESTAMP = 22,
 	CP_THREAD_CONTROL = 23,
+	CP_RESOURCE_LIST = 24,
+	CP_BV_BR_COUNT_OPS = 27,
+	CP_MODIFY_TIMESTAMP = 28,
 	CP_CONTEXT_REG_BUNCH2 = 93,
-	CP_UNK15 = 21,
-	CP_UNK16 = 22,
-	CP_UNK18 = 24,
-	CP_UNK1B = 27,
-	CP_UNK49 = 73,
+	CP_MEM_TO_SCRATCH_MEM = 73,
+	CP_FIXED_STRIDE_DRAW_TABLE = 127,
+	CP_RESET_CONTEXT_STATE = 31,
 };
 
 enum adreno_state_block {
@@ -456,6 +440,13 @@ enum cp_cond_function {
 	WRITE_GT = 6,
 };
 
+enum poll_memory_type {
+	POLL_REGISTER = 0,
+	POLL_MEMORY = 1,
+	POLL_SCRATCH = 2,
+	POLL_ON_CHIP = 3,
+};
+
 enum render_mode_cmd {
 	BYPASS = 1,
 	BINNING = 2,
@@ -465,6 +456,19 @@ enum render_mode_cmd {
 	END2D = 8,
 };
 
+enum event_write_src {
+	EV_WRITE_USER_32B = 0,
+	EV_WRITE_USER_64B = 1,
+	EV_WRITE_TIMESTAMP_SUM = 2,
+	EV_WRITE_ALWAYSON = 3,
+	EV_WRITE_REGS_CONTENT = 4,
+};
+
+enum event_write_dst {
+	EV_DST_RAM = 0,
+	EV_DST_ONCHIP = 1,
+};
+
 enum cp_blit_cmd {
 	BLIT_OP_FILL = 0,
 	BLIT_OP_COPY = 1,
@@ -492,12 +496,31 @@ enum pseudo_reg {
 	SECURE_SAVE_ADDR = 2,
 	NON_PRIV_SAVE_ADDR = 3,
 	COUNTER = 4,
+	DRAW_STRM_ADDRESS = 8,
+	DRAW_STRM_SIZE_ADDRESS = 9,
+	PRIM_STRM_ADDRESS = 10,
+	UNK_STRM_ADDRESS = 11,
+	UNK_STRM_SIZE_ADDRESS = 12,
+	BINDLESS_BASE_0_ADDR = 16,
+	BINDLESS_BASE_1_ADDR = 17,
+	BINDLESS_BASE_2_ADDR = 18,
+	BINDLESS_BASE_3_ADDR = 19,
+	BINDLESS_BASE_4_ADDR = 20,
+	BINDLESS_BASE_5_ADDR = 21,
+	BINDLESS_BASE_6_ADDR = 22,
+};
+
+enum source_type {
+	SOURCE_REG = 0,
+	SOURCE_SCRATCH_MEM = 1,
 };
 
 enum compare_mode {
 	PRED_TEST = 1,
 	REG_COMPARE = 2,
 	RENDER_MODE = 3,
+	REG_COMPARE_IMM = 4,
+	THREAD_MODE = 5,
 };
 
 enum ctxswitch_ib {
@@ -514,6 +537,30 @@ enum reg_tracker {
 	TRACK_LRZ = 8,
 };
 
+enum ts_wait_value_src {
+	TS_WAIT_GE_32B = 0,
+	TS_WAIT_GE_64B = 1,
+	TS_WAIT_GE_TIMESTAMP_SUM = 2,
+};
+
+enum ts_wait_type {
+	TS_WAIT_RAM = 0,
+	TS_WAIT_ONCHIP = 1,
+};
+
+enum pipe_count_op {
+	PIPE_CLEAR_BV_BR = 1,
+	PIPE_SET_BR_OFFSET = 2,
+	PIPE_BR_WAIT_FOR_BV = 3,
+	PIPE_BV_WAIT_FOR_BR = 4,
+};
+
+enum timestamp_op {
+	MODIFY_TIMESTAMP_CLEAR = 0,
+	MODIFY_TIMESTAMP_ADD_GLOBAL = 1,
+	MODIFY_TIMESTAMP_ADD_LOCAL = 2,
+};
+
 enum cp_thread {
 	CP_SET_THREAD_BR = 1,
 	CP_SET_THREAD_BV = 2,
@@ -557,7 +604,8 @@ static inline uint32_t CP_LOAD_STATE_1_STATE_TYPE(enum adreno_state_type val)
 #define CP_LOAD_STATE_1_EXT_SRC_ADDR__SHIFT			2
 static inline uint32_t CP_LOAD_STATE_1_EXT_SRC_ADDR(uint32_t val)
 {
-	return ((val >> 2) << CP_LOAD_STATE_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE_1_EXT_SRC_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << CP_LOAD_STATE_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE_1_EXT_SRC_ADDR__MASK;
 }
 
 #define REG_CP_LOAD_STATE4_0					0x00000000
@@ -597,7 +645,8 @@ static inline uint32_t CP_LOAD_STATE4_1_STATE_TYPE(enum a4xx_state_type val)
 #define CP_LOAD_STATE4_1_EXT_SRC_ADDR__SHIFT			2
 static inline uint32_t CP_LOAD_STATE4_1_EXT_SRC_ADDR(uint32_t val)
 {
-	return ((val >> 2) << CP_LOAD_STATE4_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE4_1_EXT_SRC_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << CP_LOAD_STATE4_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE4_1_EXT_SRC_ADDR__MASK;
 }
 
 #define REG_CP_LOAD_STATE4_2					0x00000002
@@ -645,7 +694,8 @@ static inline uint32_t CP_LOAD_STATE6_0_NUM_UNIT(uint32_t val)
 #define CP_LOAD_STATE6_1_EXT_SRC_ADDR__SHIFT			2
 static inline uint32_t CP_LOAD_STATE6_1_EXT_SRC_ADDR(uint32_t val)
 {
-	return ((val >> 2) << CP_LOAD_STATE6_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE6_1_EXT_SRC_ADDR__MASK;
+	assert(!(val & 0x3));
+	return (((val >> 2)) << CP_LOAD_STATE6_1_EXT_SRC_ADDR__SHIFT) & CP_LOAD_STATE6_1_EXT_SRC_ADDR__MASK;
 }
 
 #define REG_CP_LOAD_STATE6_2					0x00000002
@@ -834,37 +884,36 @@ static inline uint32_t CP_DRAW_INDX_OFFSET_3_FIRST_INDX(uint32_t val)
 	return ((val) << CP_DRAW_INDX_OFFSET_3_FIRST_INDX__SHIFT) & CP_DRAW_INDX_OFFSET_3_FIRST_INDX__MASK;
 }
 
-
-#define REG_CP_DRAW_INDX_OFFSET_4				0x00000004
-#define CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__MASK		0xffffffff
-#define CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__SHIFT		0
-static inline uint32_t CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO(uint32_t val)
+#define REG_A5XX_CP_DRAW_INDX_OFFSET_4				0x00000004
+#define A5XX_CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__MASK		0xffffffff
+#define A5XX_CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__SHIFT		0
+static inline uint32_t A5XX_CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO(uint32_t val)
 {
-	return ((val) << CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__SHIFT) & CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__MASK;
+	return ((val) << A5XX_CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__SHIFT) & A5XX_CP_DRAW_INDX_OFFSET_4_INDX_BASE_LO__MASK;
 }
 
-#define REG_CP_DRAW_INDX_OFFSET_5				0x00000005
-#define CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__MASK		0xffffffff
-#define CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__SHIFT		0
-static inline uint32_t CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI(uint32_t val)
+#define REG_A5XX_CP_DRAW_INDX_OFFSET_5				0x00000005
+#define A5XX_CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__MASK		0xffffffff
+#define A5XX_CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__SHIFT		0
+static inline uint32_t A5XX_CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI(uint32_t val)
 {
-	return ((val) << CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__SHIFT) & CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__MASK;
+	return ((val) << A5XX_CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__SHIFT) & A5XX_CP_DRAW_INDX_OFFSET_5_INDX_BASE_HI__MASK;
 }
 
-#define REG_CP_DRAW_INDX_OFFSET_INDX_BASE			0x00000004
+#define REG_A5XX_CP_DRAW_INDX_OFFSET_INDX_BASE			0x00000004
 
-#define REG_CP_DRAW_INDX_OFFSET_6				0x00000006
-#define CP_DRAW_INDX_OFFSET_6_MAX_INDICES__MASK			0xffffffff
-#define CP_DRAW_INDX_OFFSET_6_MAX_INDICES__SHIFT		0
-static inline uint32_t CP_DRAW_INDX_OFFSET_6_MAX_INDICES(uint32_t val)
+#define REG_A5XX_CP_DRAW_INDX_OFFSET_6				0x00000006
+#define A5XX_CP_DRAW_INDX_OFFSET_6_MAX_INDICES__MASK		0xffffffff
+#define A5XX_CP_DRAW_INDX_OFFSET_6_MAX_INDICES__SHIFT		0
+static inline uint32_t A5XX_CP_DRAW_INDX_OFFSET_6_MAX_INDICES(uint32_t val)
 {
-	return ((val) << CP_DRAW_INDX_OFFSET_6_MAX_INDICES__SHIFT) & CP_DRAW_INDX_OFFSET_6_MAX_INDICES__MASK;
+	return ((val) << A5XX_CP_DRAW_INDX_OFFSET_6_MAX_INDICES__SHIFT) & A5XX_CP_DRAW_INDX_OFFSET_6_MAX_INDICES__MASK;
 }
 
 #define REG_CP_DRAW_INDX_OFFSET_4				0x00000004
 #define CP_DRAW_INDX_OFFSET_4_INDX_BASE__MASK			0xffffffff
 #define CP_DRAW_INDX_OFFSET_4_INDX_BASE__SHIFT			0
-static inline uint32_t CP_DRAW_INDX_OFFSET_4_INDX_BASE(uint32_t val)
+static inline uint32_t CP_DRAW_INDX_OFFSET_4_INDX_BASE(uint64_t val)
 {
 	return ((val) << CP_DRAW_INDX_OFFSET_4_INDX_BASE__SHIFT) & CP_DRAW_INDX_OFFSET_4_INDX_BASE__MASK;
 }
@@ -911,7 +960,6 @@ static inline uint32_t A4XX_CP_DRAW_INDIRECT_0_PATCH_TYPE(enum a6xx_patch_type v
 #define A4XX_CP_DRAW_INDIRECT_0_GS_ENABLE			0x00010000
 #define A4XX_CP_DRAW_INDIRECT_0_TESS_ENABLE			0x00020000
 
-
 #define REG_A4XX_CP_DRAW_INDIRECT_1				0x00000001
 #define A4XX_CP_DRAW_INDIRECT_1_INDIRECT__MASK			0xffffffff
 #define A4XX_CP_DRAW_INDIRECT_1_INDIRECT__SHIFT			0
@@ -920,7 +968,6 @@ static inline uint32_t A4XX_CP_DRAW_INDIRECT_1_INDIRECT(uint32_t val)
 	return ((val) << A4XX_CP_DRAW_INDIRECT_1_INDIRECT__SHIFT) & A4XX_CP_DRAW_INDIRECT_1_INDIRECT__MASK;
 }
 
-
 #define REG_A5XX_CP_DRAW_INDIRECT_1				0x00000001
 #define A5XX_CP_DRAW_INDIRECT_1_INDIRECT_LO__MASK		0xffffffff
 #define A5XX_CP_DRAW_INDIRECT_1_INDIRECT_LO__SHIFT		0
@@ -973,7 +1020,6 @@ static inline uint32_t A4XX_CP_DRAW_INDX_INDIRECT_0_PATCH_TYPE(enum a6xx_patch_t
 #define A4XX_CP_DRAW_INDX_INDIRECT_0_GS_ENABLE			0x00010000
 #define A4XX_CP_DRAW_INDX_INDIRECT_0_TESS_ENABLE		0x00020000
 
-
 #define REG_A4XX_CP_DRAW_INDX_INDIRECT_1			0x00000001
 #define A4XX_CP_DRAW_INDX_INDIRECT_1_INDX_BASE__MASK		0xffffffff
 #define A4XX_CP_DRAW_INDX_INDIRECT_1_INDX_BASE__SHIFT		0
@@ -998,7 +1044,6 @@ static inline uint32_t A4XX_CP_DRAW_INDX_INDIRECT_3_INDIRECT(uint32_t val)
 	return ((val) << A4XX_CP_DRAW_INDX_INDIRECT_3_INDIRECT__SHIFT) & A4XX_CP_DRAW_INDX_INDIRECT_3_INDIRECT__MASK;
 }
 
-
 #define REG_A5XX_CP_DRAW_INDX_INDIRECT_1			0x00000001
 #define A5XX_CP_DRAW_INDX_INDIRECT_1_INDX_BASE_LO__MASK		0xffffffff
 #define A5XX_CP_DRAW_INDX_INDIRECT_1_INDX_BASE_LO__SHIFT	0
@@ -1093,37 +1138,93 @@ static inline uint32_t A6XX_CP_DRAW_INDIRECT_MULTI_1_DST_OFF(uint32_t val)
 
 #define REG_A6XX_CP_DRAW_INDIRECT_MULTI_DRAW_COUNT		0x00000002
 
+#define REG_INDIRECT_OP_NORMAL_CP_DRAW_INDIRECT_MULTI_INDIRECT	0x00000003
 
-#define REG_A6XX_CP_DRAW_INDIRECT_MULTI_INDIRECT		0x00000003
+#define REG_INDIRECT_OP_NORMAL_CP_DRAW_INDIRECT_MULTI_STRIDE	0x00000005
 
-#define REG_A6XX_CP_DRAW_INDIRECT_MULTI_STRIDE			0x00000005
+#define REG_INDIRECT_OP_INDEXED_CP_DRAW_INDIRECT_MULTI_INDEX	0x00000003
 
+#define REG_INDIRECT_OP_INDEXED_CP_DRAW_INDIRECT_MULTI_MAX_INDICES	0x00000005
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDEX_INDEXED		0x00000003
+#define REG_INDIRECT_OP_INDEXED_CP_DRAW_INDIRECT_MULTI_INDIRECT	0x00000006
 
-#define REG_CP_DRAW_INDIRECT_MULTI_MAX_INDICES_INDEXED		0x00000005
+#define REG_INDIRECT_OP_INDEXED_CP_DRAW_INDIRECT_MULTI_STRIDE	0x00000008
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDIRECT_INDEXED		0x00000006
+#define REG_INDIRECT_OP_INDIRECT_COUNT_CP_DRAW_INDIRECT_MULTI_INDIRECT	0x00000003
 
-#define REG_CP_DRAW_INDIRECT_MULTI_STRIDE_INDEXED		0x00000008
+#define REG_INDIRECT_OP_INDIRECT_COUNT_CP_DRAW_INDIRECT_MULTI_INDIRECT_COUNT	0x00000005
 
+#define REG_INDIRECT_OP_INDIRECT_COUNT_CP_DRAW_INDIRECT_MULTI_STRIDE	0x00000007
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDIRECT_INDIRECT		0x00000003
+#define REG_INDIRECT_OP_INDIRECT_COUNT_INDEXED_CP_DRAW_INDIRECT_MULTI_INDEX	0x00000003
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDIRECT_COUNT_INDIRECT	0x00000005
+#define REG_INDIRECT_OP_INDIRECT_COUNT_INDEXED_CP_DRAW_INDIRECT_MULTI_MAX_INDICES	0x00000005
 
-#define REG_CP_DRAW_INDIRECT_MULTI_STRIDE_INDIRECT		0x00000007
+#define REG_INDIRECT_OP_INDIRECT_COUNT_INDEXED_CP_DRAW_INDIRECT_MULTI_INDIRECT	0x00000006
 
+#define REG_INDIRECT_OP_INDIRECT_COUNT_INDEXED_CP_DRAW_INDIRECT_MULTI_INDIRECT_COUNT	0x00000008
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDEX_INDIRECT_INDEXED	0x00000003
+#define REG_INDIRECT_OP_INDIRECT_COUNT_INDEXED_CP_DRAW_INDIRECT_MULTI_STRIDE	0x0000000a
 
-#define REG_CP_DRAW_INDIRECT_MULTI_MAX_INDICES_INDIRECT_INDEXED	0x00000005
+#define REG_CP_DRAW_AUTO_0					0x00000000
+#define CP_DRAW_AUTO_0_PRIM_TYPE__MASK				0x0000003f
+#define CP_DRAW_AUTO_0_PRIM_TYPE__SHIFT				0
+static inline uint32_t CP_DRAW_AUTO_0_PRIM_TYPE(enum pc_di_primtype val)
+{
+	return ((val) << CP_DRAW_AUTO_0_PRIM_TYPE__SHIFT) & CP_DRAW_AUTO_0_PRIM_TYPE__MASK;
+}
+#define CP_DRAW_AUTO_0_SOURCE_SELECT__MASK			0x000000c0
+#define CP_DRAW_AUTO_0_SOURCE_SELECT__SHIFT			6
+static inline uint32_t CP_DRAW_AUTO_0_SOURCE_SELECT(enum pc_di_src_sel val)
+{
+	return ((val) << CP_DRAW_AUTO_0_SOURCE_SELECT__SHIFT) & CP_DRAW_AUTO_0_SOURCE_SELECT__MASK;
+}
+#define CP_DRAW_AUTO_0_VIS_CULL__MASK				0x00000300
+#define CP_DRAW_AUTO_0_VIS_CULL__SHIFT				8
+static inline uint32_t CP_DRAW_AUTO_0_VIS_CULL(enum pc_di_vis_cull_mode val)
+{
+	return ((val) << CP_DRAW_AUTO_0_VIS_CULL__SHIFT) & CP_DRAW_AUTO_0_VIS_CULL__MASK;
+}
+#define CP_DRAW_AUTO_0_INDEX_SIZE__MASK				0x00000c00
+#define CP_DRAW_AUTO_0_INDEX_SIZE__SHIFT			10
+static inline uint32_t CP_DRAW_AUTO_0_INDEX_SIZE(enum a4xx_index_size val)
+{
+	return ((val) << CP_DRAW_AUTO_0_INDEX_SIZE__SHIFT) & CP_DRAW_AUTO_0_INDEX_SIZE__MASK;
+}
+#define CP_DRAW_AUTO_0_PATCH_TYPE__MASK				0x00003000
+#define CP_DRAW_AUTO_0_PATCH_TYPE__SHIFT			12
+static inline uint32_t CP_DRAW_AUTO_0_PATCH_TYPE(enum a6xx_patch_type val)
+{
+	return ((val) << CP_DRAW_AUTO_0_PATCH_TYPE__SHIFT) & CP_DRAW_AUTO_0_PATCH_TYPE__MASK;
+}
+#define CP_DRAW_AUTO_0_GS_ENABLE				0x00010000
+#define CP_DRAW_AUTO_0_TESS_ENABLE				0x00020000
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDIRECT_INDIRECT_INDEXED	0x00000006
+#define REG_CP_DRAW_AUTO_1					0x00000001
+#define CP_DRAW_AUTO_1_NUM_INSTANCES__MASK			0xffffffff
+#define CP_DRAW_AUTO_1_NUM_INSTANCES__SHIFT			0
+static inline uint32_t CP_DRAW_AUTO_1_NUM_INSTANCES(uint32_t val)
+{
+	return ((val) << CP_DRAW_AUTO_1_NUM_INSTANCES__SHIFT) & CP_DRAW_AUTO_1_NUM_INSTANCES__MASK;
+}
 
-#define REG_CP_DRAW_INDIRECT_MULTI_INDIRECT_COUNT_INDIRECT_INDEXED	0x00000008
+#define REG_CP_DRAW_AUTO_NUM_VERTICES_BASE			0x00000002
 
-#define REG_CP_DRAW_INDIRECT_MULTI_STRIDE_INDIRECT_INDEXED	0x0000000a
+#define REG_CP_DRAW_AUTO_4					0x00000004
+#define CP_DRAW_AUTO_4_NUM_VERTICES_OFFSET__MASK		0xffffffff
+#define CP_DRAW_AUTO_4_NUM_VERTICES_OFFSET__SHIFT		0
+static inline uint32_t CP_DRAW_AUTO_4_NUM_VERTICES_OFFSET(uint32_t val)
+{
+	return ((val) << CP_DRAW_AUTO_4_NUM_VERTICES_OFFSET__SHIFT) & CP_DRAW_AUTO_4_NUM_VERTICES_OFFSET__MASK;
+}
+
+#define REG_CP_DRAW_AUTO_5					0x00000005
+#define CP_DRAW_AUTO_5_STRIDE__MASK				0xffffffff
+#define CP_DRAW_AUTO_5_STRIDE__SHIFT				0
+static inline uint32_t CP_DRAW_AUTO_5_STRIDE(uint32_t val)
+{
+	return ((val) << CP_DRAW_AUTO_5_STRIDE__SHIFT) & CP_DRAW_AUTO_5_STRIDE__MASK;
+}
 
 #define REG_CP_DRAW_PRED_ENABLE_GLOBAL_0			0x00000000
 #define CP_DRAW_PRED_ENABLE_GLOBAL_0_ENABLE			0x00000001
@@ -1147,7 +1248,7 @@ static inline uint32_t CP_DRAW_PRED_SET_0_TEST(enum cp_draw_pred_test val)
 
 #define REG_CP_DRAW_PRED_SET_MEM_ADDR				0x00000001
 
-static inline uint32_t REG_CP_SET_DRAW_STATE_(uint32_t i0) { return 0x00000000 + 0x3*i0; }
+#define REG_CP_SET_DRAW_STATE_(i0) (0x00000000 + 0x3*(i0))
 
 static inline uint32_t REG_CP_SET_DRAW_STATE__0(uint32_t i0) { return 0x00000000 + 0x3*i0; }
 #define CP_SET_DRAW_STATE__0_COUNT__MASK			0x0000ffff
@@ -1693,8 +1794,12 @@ static inline uint32_t CP_COND_WRITE5_0_FUNCTION(enum cp_cond_function val)
 	return ((val) << CP_COND_WRITE5_0_FUNCTION__SHIFT) & CP_COND_WRITE5_0_FUNCTION__MASK;
 }
 #define CP_COND_WRITE5_0_SIGNED_COMPARE				0x00000008
-#define CP_COND_WRITE5_0_POLL_MEMORY				0x00000010
-#define CP_COND_WRITE5_0_POLL_SCRATCH				0x00000020
+#define CP_COND_WRITE5_0_POLL__MASK				0x00000030
+#define CP_COND_WRITE5_0_POLL__SHIFT				4
+static inline uint32_t CP_COND_WRITE5_0_POLL(enum poll_memory_type val)
+{
+	return ((val) << CP_COND_WRITE5_0_POLL__SHIFT) & CP_COND_WRITE5_0_POLL__MASK;
+}
 #define CP_COND_WRITE5_0_WRITE_MEMORY				0x00000100
 
 #define REG_CP_COND_WRITE5_1					0x00000001
@@ -1793,8 +1898,12 @@ static inline uint32_t CP_WAIT_REG_MEM_0_FUNCTION(enum cp_cond_function val)
 	return ((val) << CP_WAIT_REG_MEM_0_FUNCTION__SHIFT) & CP_WAIT_REG_MEM_0_FUNCTION__MASK;
 }
 #define CP_WAIT_REG_MEM_0_SIGNED_COMPARE			0x00000008
-#define CP_WAIT_REG_MEM_0_POLL_MEMORY				0x00000010
-#define CP_WAIT_REG_MEM_0_POLL_SCRATCH				0x00000020
+#define CP_WAIT_REG_MEM_0_POLL__MASK				0x00000030
+#define CP_WAIT_REG_MEM_0_POLL__SHIFT				4
+static inline uint32_t CP_WAIT_REG_MEM_0_POLL(enum poll_memory_type val)
+{
+	return ((val) << CP_WAIT_REG_MEM_0_POLL__SHIFT) & CP_WAIT_REG_MEM_0_POLL__MASK;
+}
 #define CP_WAIT_REG_MEM_0_WRITE_MEMORY				0x00000100
 
 #define REG_CP_WAIT_REG_MEM_1					0x00000001
@@ -1960,14 +2069,14 @@ static inline uint32_t CP_COMPUTE_CHECKPOINT_1_ADDR_0_HI(uint32_t val)
 #define REG_CP_COMPUTE_CHECKPOINT_2				0x00000002
 
 #define REG_CP_COMPUTE_CHECKPOINT_3				0x00000003
-#define CP_COMPUTE_CHECKPOINT_3_ADDR_1_LEN__MASK		0xffffffff
-#define CP_COMPUTE_CHECKPOINT_3_ADDR_1_LEN__SHIFT		0
-static inline uint32_t CP_COMPUTE_CHECKPOINT_3_ADDR_1_LEN(uint32_t val)
-{
-	return ((val) << CP_COMPUTE_CHECKPOINT_3_ADDR_1_LEN__SHIFT) & CP_COMPUTE_CHECKPOINT_3_ADDR_1_LEN__MASK;
-}
 
 #define REG_CP_COMPUTE_CHECKPOINT_4				0x00000004
+#define CP_COMPUTE_CHECKPOINT_4_ADDR_1_LEN__MASK		0xffffffff
+#define CP_COMPUTE_CHECKPOINT_4_ADDR_1_LEN__SHIFT		0
+static inline uint32_t CP_COMPUTE_CHECKPOINT_4_ADDR_1_LEN(uint32_t val)
+{
+	return ((val) << CP_COMPUTE_CHECKPOINT_4_ADDR_1_LEN__SHIFT) & CP_COMPUTE_CHECKPOINT_4_ADDR_1_LEN__MASK;
+}
 
 #define REG_CP_COMPUTE_CHECKPOINT_5				0x00000005
 #define CP_COMPUTE_CHECKPOINT_5_ADDR_1_LO__MASK			0xffffffff
@@ -2033,6 +2142,90 @@ static inline uint32_t CP_EVENT_WRITE_2_ADDR_0_HI(uint32_t val)
 
 #define REG_CP_EVENT_WRITE_3					0x00000003
 
+#define REG_CP_EVENT_WRITE7_0					0x00000000
+#define CP_EVENT_WRITE7_0_EVENT__MASK				0x000000ff
+#define CP_EVENT_WRITE7_0_EVENT__SHIFT				0
+static inline uint32_t CP_EVENT_WRITE7_0_EVENT(enum vgt_event_type val)
+{
+	return ((val) << CP_EVENT_WRITE7_0_EVENT__SHIFT) & CP_EVENT_WRITE7_0_EVENT__MASK;
+}
+#define CP_EVENT_WRITE7_0_WRITE_SAMPLE_COUNT			0x00001000
+#define CP_EVENT_WRITE7_0_SAMPLE_COUNT_END_OFFSET		0x00002000
+#define CP_EVENT_WRITE7_0_WRITE_SAMPLE_COUNT_DIFF		0x00004000
+#define CP_EVENT_WRITE7_0_INC_BV_COUNT				0x00010000
+#define CP_EVENT_WRITE7_0_INC_BR_COUNT				0x00020000
+#define CP_EVENT_WRITE7_0_CLEAR_RENDER_RESOURCE			0x00040000
+#define CP_EVENT_WRITE7_0_CLEAR_LRZ_RESOURCE			0x00080000
+#define CP_EVENT_WRITE7_0_WRITE_SRC__MASK			0x00700000
+#define CP_EVENT_WRITE7_0_WRITE_SRC__SHIFT			20
+static inline uint32_t CP_EVENT_WRITE7_0_WRITE_SRC(enum event_write_src val)
+{
+	return ((val) << CP_EVENT_WRITE7_0_WRITE_SRC__SHIFT) & CP_EVENT_WRITE7_0_WRITE_SRC__MASK;
+}
+#define CP_EVENT_WRITE7_0_WRITE_DST__MASK			0x01000000
+#define CP_EVENT_WRITE7_0_WRITE_DST__SHIFT			24
+static inline uint32_t CP_EVENT_WRITE7_0_WRITE_DST(enum event_write_dst val)
+{
+	return ((val) << CP_EVENT_WRITE7_0_WRITE_DST__SHIFT) & CP_EVENT_WRITE7_0_WRITE_DST__MASK;
+}
+#define CP_EVENT_WRITE7_0_WRITE_ENABLED				0x08000000
+
+#define REG_EV_DST_RAM_CP_EVENT_WRITE7_1			0x00000001
+#define EV_DST_RAM_CP_EVENT_WRITE7_1_ADDR_0_LO__MASK		0xffffffff
+#define EV_DST_RAM_CP_EVENT_WRITE7_1_ADDR_0_LO__SHIFT		0
+static inline uint32_t EV_DST_RAM_CP_EVENT_WRITE7_1_ADDR_0_LO(uint32_t val)
+{
+	return ((val) << EV_DST_RAM_CP_EVENT_WRITE7_1_ADDR_0_LO__SHIFT) & EV_DST_RAM_CP_EVENT_WRITE7_1_ADDR_0_LO__MASK;
+}
+
+#define REG_EV_DST_RAM_CP_EVENT_WRITE7_2			0x00000002
+#define EV_DST_RAM_CP_EVENT_WRITE7_2_ADDR_0_HI__MASK		0xffffffff
+#define EV_DST_RAM_CP_EVENT_WRITE7_2_ADDR_0_HI__SHIFT		0
+static inline uint32_t EV_DST_RAM_CP_EVENT_WRITE7_2_ADDR_0_HI(uint32_t val)
+{
+	return ((val) << EV_DST_RAM_CP_EVENT_WRITE7_2_ADDR_0_HI__SHIFT) & EV_DST_RAM_CP_EVENT_WRITE7_2_ADDR_0_HI__MASK;
+}
+
+#define REG_EV_DST_RAM_CP_EVENT_WRITE7_3			0x00000003
+#define EV_DST_RAM_CP_EVENT_WRITE7_3_PAYLOAD_0__MASK		0xffffffff
+#define EV_DST_RAM_CP_EVENT_WRITE7_3_PAYLOAD_0__SHIFT		0
+static inline uint32_t EV_DST_RAM_CP_EVENT_WRITE7_3_PAYLOAD_0(uint32_t val)
+{
+	return ((val) << EV_DST_RAM_CP_EVENT_WRITE7_3_PAYLOAD_0__SHIFT) & EV_DST_RAM_CP_EVENT_WRITE7_3_PAYLOAD_0__MASK;
+}
+
+#define REG_EV_DST_RAM_CP_EVENT_WRITE7_4			0x00000004
+#define EV_DST_RAM_CP_EVENT_WRITE7_4_PAYLOAD_1__MASK		0xffffffff
+#define EV_DST_RAM_CP_EVENT_WRITE7_4_PAYLOAD_1__SHIFT		0
+static inline uint32_t EV_DST_RAM_CP_EVENT_WRITE7_4_PAYLOAD_1(uint32_t val)
+{
+	return ((val) << EV_DST_RAM_CP_EVENT_WRITE7_4_PAYLOAD_1__SHIFT) & EV_DST_RAM_CP_EVENT_WRITE7_4_PAYLOAD_1__MASK;
+}
+
+#define REG_EV_DST_ONCHIP_CP_EVENT_WRITE7_1			0x00000001
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_1_ONCHIP_ADDR_0__MASK	0xffffffff
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_1_ONCHIP_ADDR_0__SHIFT	0
+static inline uint32_t EV_DST_ONCHIP_CP_EVENT_WRITE7_1_ONCHIP_ADDR_0(uint32_t val)
+{
+	return ((val) << EV_DST_ONCHIP_CP_EVENT_WRITE7_1_ONCHIP_ADDR_0__SHIFT) & EV_DST_ONCHIP_CP_EVENT_WRITE7_1_ONCHIP_ADDR_0__MASK;
+}
+
+#define REG_EV_DST_ONCHIP_CP_EVENT_WRITE7_3			0x00000003
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_3_PAYLOAD_0__MASK		0xffffffff
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_3_PAYLOAD_0__SHIFT	0
+static inline uint32_t EV_DST_ONCHIP_CP_EVENT_WRITE7_3_PAYLOAD_0(uint32_t val)
+{
+	return ((val) << EV_DST_ONCHIP_CP_EVENT_WRITE7_3_PAYLOAD_0__SHIFT) & EV_DST_ONCHIP_CP_EVENT_WRITE7_3_PAYLOAD_0__MASK;
+}
+
+#define REG_EV_DST_ONCHIP_CP_EVENT_WRITE7_4			0x00000004
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_4_PAYLOAD_1__MASK		0xffffffff
+#define EV_DST_ONCHIP_CP_EVENT_WRITE7_4_PAYLOAD_1__SHIFT	0
+static inline uint32_t EV_DST_ONCHIP_CP_EVENT_WRITE7_4_PAYLOAD_1(uint32_t val)
+{
+	return ((val) << EV_DST_ONCHIP_CP_EVENT_WRITE7_4_PAYLOAD_1__SHIFT) & EV_DST_ONCHIP_CP_EVENT_WRITE7_4_PAYLOAD_1__MASK;
+}
+
 #define REG_CP_BLIT_0						0x00000000
 #define CP_BLIT_0_OP__MASK					0x0000000f
 #define CP_BLIT_0_OP__SHIFT					0
@@ -2125,7 +2318,6 @@ static inline uint32_t CP_EXEC_CS_3_NGROUPS_Z(uint32_t val)
 
 #define REG_A4XX_CP_EXEC_CS_INDIRECT_0				0x00000000
 
-
 #define REG_A4XX_CP_EXEC_CS_INDIRECT_1				0x00000001
 #define A4XX_CP_EXEC_CS_INDIRECT_1_ADDR__MASK			0xffffffff
 #define A4XX_CP_EXEC_CS_INDIRECT_1_ADDR__SHIFT			0
@@ -2154,7 +2346,6 @@ static inline uint32_t A4XX_CP_EXEC_CS_INDIRECT_2_LOCALSIZEZ(uint32_t val)
 	return ((val) << A4XX_CP_EXEC_CS_INDIRECT_2_LOCALSIZEZ__SHIFT) & A4XX_CP_EXEC_CS_INDIRECT_2_LOCALSIZEZ__MASK;
 }
 
-
 #define REG_A5XX_CP_EXEC_CS_INDIRECT_1				0x00000001
 #define A5XX_CP_EXEC_CS_INDIRECT_1_ADDR_LO__MASK		0xffffffff
 #define A5XX_CP_EXEC_CS_INDIRECT_1_ADDR_LO__SHIFT		0
@@ -2205,10 +2396,10 @@ static inline uint32_t A6XX_CP_SET_MARKER_0_MARKER(enum a6xx_marker val)
 	return ((val) << A6XX_CP_SET_MARKER_0_MARKER__SHIFT) & A6XX_CP_SET_MARKER_0_MARKER__MASK;
 }
 
-static inline uint32_t REG_A6XX_CP_SET_PSEUDO_REG_(uint32_t i0) { return 0x00000000 + 0x3*i0; }
+#define REG_A6XX_CP_SET_PSEUDO_REG_(i0) (0x00000000 + 0x3*(i0))
 
 static inline uint32_t REG_A6XX_CP_SET_PSEUDO_REG__0(uint32_t i0) { return 0x00000000 + 0x3*i0; }
-#define A6XX_CP_SET_PSEUDO_REG__0_PSEUDO_REG__MASK		0x00000007
+#define A6XX_CP_SET_PSEUDO_REG__0_PSEUDO_REG__MASK		0x000007ff
 #define A6XX_CP_SET_PSEUDO_REG__0_PSEUDO_REG__SHIFT		0
 static inline uint32_t A6XX_CP_SET_PSEUDO_REG__0_PSEUDO_REG(enum pseudo_reg val)
 {
@@ -2238,6 +2429,18 @@ static inline uint32_t A6XX_CP_REG_TEST_0_REG(uint32_t val)
 {
 	return ((val) << A6XX_CP_REG_TEST_0_REG__SHIFT) & A6XX_CP_REG_TEST_0_REG__MASK;
 }
+#define A6XX_CP_REG_TEST_0_SCRATCH_MEM_OFFSET__MASK		0x0003ffff
+#define A6XX_CP_REG_TEST_0_SCRATCH_MEM_OFFSET__SHIFT		0
+static inline uint32_t A6XX_CP_REG_TEST_0_SCRATCH_MEM_OFFSET(uint32_t val)
+{
+	return ((val) << A6XX_CP_REG_TEST_0_SCRATCH_MEM_OFFSET__SHIFT) & A6XX_CP_REG_TEST_0_SCRATCH_MEM_OFFSET__MASK;
+}
+#define A6XX_CP_REG_TEST_0_SOURCE__MASK				0x00040000
+#define A6XX_CP_REG_TEST_0_SOURCE__SHIFT			18
+static inline uint32_t A6XX_CP_REG_TEST_0_SOURCE(enum source_type val)
+{
+	return ((val) << A6XX_CP_REG_TEST_0_SOURCE__SHIFT) & A6XX_CP_REG_TEST_0_SOURCE__MASK;
+}
 #define A6XX_CP_REG_TEST_0_BIT__MASK				0x01f00000
 #define A6XX_CP_REG_TEST_0_BIT__SHIFT				20
 static inline uint32_t A6XX_CP_REG_TEST_0_BIT(uint32_t val)
@@ -2270,9 +2473,14 @@ static inline uint32_t CP_COND_REG_EXEC_0_PRED_BIT(uint32_t val)
 {
 	return ((val) << CP_COND_REG_EXEC_0_PRED_BIT__SHIFT) & CP_COND_REG_EXEC_0_PRED_BIT__MASK;
 }
+#define CP_COND_REG_EXEC_0_SKIP_WAIT_FOR_ME			0x00800000
+#define CP_COND_REG_EXEC_0_ONCHIP_MEM				0x01000000
 #define CP_COND_REG_EXEC_0_BINNING				0x02000000
 #define CP_COND_REG_EXEC_0_GMEM					0x04000000
 #define CP_COND_REG_EXEC_0_SYSMEM				0x08000000
+#define CP_COND_REG_EXEC_0_BV					0x02000000
+#define CP_COND_REG_EXEC_0_BR					0x04000000
+#define CP_COND_REG_EXEC_0_LPAC					0x08000000
 #define CP_COND_REG_EXEC_0_MODE__MASK				0xf0000000
 #define CP_COND_REG_EXEC_0_MODE__SHIFT				28
 static inline uint32_t CP_COND_REG_EXEC_0_MODE(enum compare_mode val)
@@ -2280,12 +2488,53 @@ static inline uint32_t CP_COND_REG_EXEC_0_MODE(enum compare_mode val)
 	return ((val) << CP_COND_REG_EXEC_0_MODE__SHIFT) & CP_COND_REG_EXEC_0_MODE__MASK;
 }
 
-#define REG_CP_COND_REG_EXEC_1					0x00000001
-#define CP_COND_REG_EXEC_1_DWORDS__MASK				0xffffffff
-#define CP_COND_REG_EXEC_1_DWORDS__SHIFT			0
-static inline uint32_t CP_COND_REG_EXEC_1_DWORDS(uint32_t val)
+#define REG_PRED_TEST_CP_COND_REG_EXEC_1			0x00000001
+#define PRED_TEST_CP_COND_REG_EXEC_1_DWORDS__MASK		0x00ffffff
+#define PRED_TEST_CP_COND_REG_EXEC_1_DWORDS__SHIFT		0
+static inline uint32_t PRED_TEST_CP_COND_REG_EXEC_1_DWORDS(uint32_t val)
+{
+	return ((val) << PRED_TEST_CP_COND_REG_EXEC_1_DWORDS__SHIFT) & PRED_TEST_CP_COND_REG_EXEC_1_DWORDS__MASK;
+}
+
+#define REG_REG_COMPARE_CP_COND_REG_EXEC_1			0x00000001
+#define REG_COMPARE_CP_COND_REG_EXEC_1_REG1__MASK		0x0003ffff
+#define REG_COMPARE_CP_COND_REG_EXEC_1_REG1__SHIFT		0
+static inline uint32_t REG_COMPARE_CP_COND_REG_EXEC_1_REG1(uint32_t val)
 {
-	return ((val) << CP_COND_REG_EXEC_1_DWORDS__SHIFT) & CP_COND_REG_EXEC_1_DWORDS__MASK;
+	return ((val) << REG_COMPARE_CP_COND_REG_EXEC_1_REG1__SHIFT) & REG_COMPARE_CP_COND_REG_EXEC_1_REG1__MASK;
+}
+#define REG_COMPARE_CP_COND_REG_EXEC_1_ONCHIP_MEM		0x01000000
+
+#define REG_RENDER_MODE_CP_COND_REG_EXEC_1			0x00000001
+#define RENDER_MODE_CP_COND_REG_EXEC_1_DWORDS__MASK		0x00ffffff
+#define RENDER_MODE_CP_COND_REG_EXEC_1_DWORDS__SHIFT		0
+static inline uint32_t RENDER_MODE_CP_COND_REG_EXEC_1_DWORDS(uint32_t val)
+{
+	return ((val) << RENDER_MODE_CP_COND_REG_EXEC_1_DWORDS__SHIFT) & RENDER_MODE_CP_COND_REG_EXEC_1_DWORDS__MASK;
+}
+
+#define REG_REG_COMPARE_IMM_CP_COND_REG_EXEC_1			0x00000001
+#define REG_COMPARE_IMM_CP_COND_REG_EXEC_1_IMM__MASK		0xffffffff
+#define REG_COMPARE_IMM_CP_COND_REG_EXEC_1_IMM__SHIFT		0
+static inline uint32_t REG_COMPARE_IMM_CP_COND_REG_EXEC_1_IMM(uint32_t val)
+{
+	return ((val) << REG_COMPARE_IMM_CP_COND_REG_EXEC_1_IMM__SHIFT) & REG_COMPARE_IMM_CP_COND_REG_EXEC_1_IMM__MASK;
+}
+
+#define REG_THREAD_MODE_CP_COND_REG_EXEC_1			0x00000001
+#define THREAD_MODE_CP_COND_REG_EXEC_1_DWORDS__MASK		0x00ffffff
+#define THREAD_MODE_CP_COND_REG_EXEC_1_DWORDS__SHIFT		0
+static inline uint32_t THREAD_MODE_CP_COND_REG_EXEC_1_DWORDS(uint32_t val)
+{
+	return ((val) << THREAD_MODE_CP_COND_REG_EXEC_1_DWORDS__SHIFT) & THREAD_MODE_CP_COND_REG_EXEC_1_DWORDS__MASK;
+}
+
+#define REG_CP_COND_REG_EXEC_2					0x00000002
+#define CP_COND_REG_EXEC_2_DWORDS__MASK				0x00ffffff
+#define CP_COND_REG_EXEC_2_DWORDS__SHIFT			0
+static inline uint32_t CP_COND_REG_EXEC_2_DWORDS(uint32_t val)
+{
+	return ((val) << CP_COND_REG_EXEC_2_DWORDS__SHIFT) & CP_COND_REG_EXEC_2_DWORDS__MASK;
 }
 
 #define REG_CP_COND_EXEC_0					0x00000000
@@ -2425,10 +2674,88 @@ static inline uint32_t CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(uint32_t val)
 #define REG_CP_START_BIN_BODY_DWORDS				0x00000004
 
 #define REG_CP_WAIT_TIMESTAMP_0					0x00000000
+#define CP_WAIT_TIMESTAMP_0_WAIT_VALUE_SRC__MASK		0x00000003
+#define CP_WAIT_TIMESTAMP_0_WAIT_VALUE_SRC__SHIFT		0
+static inline uint32_t CP_WAIT_TIMESTAMP_0_WAIT_VALUE_SRC(enum ts_wait_value_src val)
+{
+	return ((val) << CP_WAIT_TIMESTAMP_0_WAIT_VALUE_SRC__SHIFT) & CP_WAIT_TIMESTAMP_0_WAIT_VALUE_SRC__MASK;
+}
+#define CP_WAIT_TIMESTAMP_0_WAIT_DST__MASK			0x00000010
+#define CP_WAIT_TIMESTAMP_0_WAIT_DST__SHIFT			4
+static inline uint32_t CP_WAIT_TIMESTAMP_0_WAIT_DST(enum ts_wait_type val)
+{
+	return ((val) << CP_WAIT_TIMESTAMP_0_WAIT_DST__SHIFT) & CP_WAIT_TIMESTAMP_0_WAIT_DST__MASK;
+}
+
+#define REG_TS_WAIT_RAM_CP_WAIT_TIMESTAMP_ADDR			0x00000001
 
-#define REG_CP_WAIT_TIMESTAMP_ADDR				0x00000001
+#define REG_TS_WAIT_ONCHIP_CP_WAIT_TIMESTAMP_ONCHIP_ADDR_0	0x00000001
 
-#define REG_CP_WAIT_TIMESTAMP_TIMESTAMP				0x00000003
+#define REG_CP_WAIT_TIMESTAMP_SRC_0				0x00000003
+
+#define REG_CP_WAIT_TIMESTAMP_SRC_1				0x00000004
+
+#define REG_CP_BV_BR_COUNT_OPS_0				0x00000000
+#define CP_BV_BR_COUNT_OPS_0_OP__MASK				0x0000000f
+#define CP_BV_BR_COUNT_OPS_0_OP__SHIFT				0
+static inline uint32_t CP_BV_BR_COUNT_OPS_0_OP(enum pipe_count_op val)
+{
+	return ((val) << CP_BV_BR_COUNT_OPS_0_OP__SHIFT) & CP_BV_BR_COUNT_OPS_0_OP__MASK;
+}
+
+#define REG_CP_BV_BR_COUNT_OPS_1				0x00000001
+#define CP_BV_BR_COUNT_OPS_1_BR_OFFSET__MASK			0x0000ffff
+#define CP_BV_BR_COUNT_OPS_1_BR_OFFSET__SHIFT			0
+static inline uint32_t CP_BV_BR_COUNT_OPS_1_BR_OFFSET(uint32_t val)
+{
+	return ((val) << CP_BV_BR_COUNT_OPS_1_BR_OFFSET__SHIFT) & CP_BV_BR_COUNT_OPS_1_BR_OFFSET__MASK;
+}
+
+#define REG_CP_MODIFY_TIMESTAMP_0				0x00000000
+#define CP_MODIFY_TIMESTAMP_0_ADD__MASK				0x000000ff
+#define CP_MODIFY_TIMESTAMP_0_ADD__SHIFT			0
+static inline uint32_t CP_MODIFY_TIMESTAMP_0_ADD(uint32_t val)
+{
+	return ((val) << CP_MODIFY_TIMESTAMP_0_ADD__SHIFT) & CP_MODIFY_TIMESTAMP_0_ADD__MASK;
+}
+#define CP_MODIFY_TIMESTAMP_0_OP__MASK				0xf0000000
+#define CP_MODIFY_TIMESTAMP_0_OP__SHIFT				28
+static inline uint32_t CP_MODIFY_TIMESTAMP_0_OP(enum timestamp_op val)
+{
+	return ((val) << CP_MODIFY_TIMESTAMP_0_OP__SHIFT) & CP_MODIFY_TIMESTAMP_0_OP__MASK;
+}
+
+#define REG_CP_MEM_TO_SCRATCH_MEM_0				0x00000000
+#define CP_MEM_TO_SCRATCH_MEM_0_CNT__MASK			0x0000003f
+#define CP_MEM_TO_SCRATCH_MEM_0_CNT__SHIFT			0
+static inline uint32_t CP_MEM_TO_SCRATCH_MEM_0_CNT(uint32_t val)
+{
+	return ((val) << CP_MEM_TO_SCRATCH_MEM_0_CNT__SHIFT) & CP_MEM_TO_SCRATCH_MEM_0_CNT__MASK;
+}
+
+#define REG_CP_MEM_TO_SCRATCH_MEM_1				0x00000001
+#define CP_MEM_TO_SCRATCH_MEM_1_OFFSET__MASK			0x0000003f
+#define CP_MEM_TO_SCRATCH_MEM_1_OFFSET__SHIFT			0
+static inline uint32_t CP_MEM_TO_SCRATCH_MEM_1_OFFSET(uint32_t val)
+{
+	return ((val) << CP_MEM_TO_SCRATCH_MEM_1_OFFSET__SHIFT) & CP_MEM_TO_SCRATCH_MEM_1_OFFSET__MASK;
+}
+
+#define REG_CP_MEM_TO_SCRATCH_MEM_2				0x00000002
+#define CP_MEM_TO_SCRATCH_MEM_2_SRC__MASK			0xffffffff
+#define CP_MEM_TO_SCRATCH_MEM_2_SRC__SHIFT			0
+static inline uint32_t CP_MEM_TO_SCRATCH_MEM_2_SRC(uint32_t val)
+{
+	return ((val) << CP_MEM_TO_SCRATCH_MEM_2_SRC__SHIFT) & CP_MEM_TO_SCRATCH_MEM_2_SRC__MASK;
+}
+
+#define REG_CP_MEM_TO_SCRATCH_MEM_3				0x00000003
+#define CP_MEM_TO_SCRATCH_MEM_3_SRC_HI__MASK			0xffffffff
+#define CP_MEM_TO_SCRATCH_MEM_3_SRC_HI__SHIFT			0
+static inline uint32_t CP_MEM_TO_SCRATCH_MEM_3_SRC_HI(uint32_t val)
+{
+	return ((val) << CP_MEM_TO_SCRATCH_MEM_3_SRC_HI__SHIFT) & CP_MEM_TO_SCRATCH_MEM_3_SRC_HI__MASK;
+}
 
 #define REG_CP_THREAD_CONTROL_0					0x00000000
 #define CP_THREAD_CONTROL_0_THREAD__MASK			0x00000003
@@ -2440,5 +2767,36 @@ static inline uint32_t CP_THREAD_CONTROL_0_THREAD(enum cp_thread val)
 #define CP_THREAD_CONTROL_0_CONCURRENT_BIN_DISABLE		0x08000000
 #define CP_THREAD_CONTROL_0_SYNC_THREADS			0x80000000
 
+#define REG_CP_FIXED_STRIDE_DRAW_TABLE_IB_BASE			0x00000000
+
+#define REG_CP_FIXED_STRIDE_DRAW_TABLE_2			0x00000002
+#define CP_FIXED_STRIDE_DRAW_TABLE_2_IB_SIZE__MASK		0x00000fff
+#define CP_FIXED_STRIDE_DRAW_TABLE_2_IB_SIZE__SHIFT		0
+static inline uint32_t CP_FIXED_STRIDE_DRAW_TABLE_2_IB_SIZE(uint32_t val)
+{
+	return ((val) << CP_FIXED_STRIDE_DRAW_TABLE_2_IB_SIZE__SHIFT) & CP_FIXED_STRIDE_DRAW_TABLE_2_IB_SIZE__MASK;
+}
+#define CP_FIXED_STRIDE_DRAW_TABLE_2_STRIDE__MASK		0xfff00000
+#define CP_FIXED_STRIDE_DRAW_TABLE_2_STRIDE__SHIFT		20
+static inline uint32_t CP_FIXED_STRIDE_DRAW_TABLE_2_STRIDE(uint32_t val)
+{
+	return ((val) << CP_FIXED_STRIDE_DRAW_TABLE_2_STRIDE__SHIFT) & CP_FIXED_STRIDE_DRAW_TABLE_2_STRIDE__MASK;
+}
+
+#define REG_CP_FIXED_STRIDE_DRAW_TABLE_3			0x00000003
+#define CP_FIXED_STRIDE_DRAW_TABLE_3_COUNT__MASK		0xffffffff
+#define CP_FIXED_STRIDE_DRAW_TABLE_3_COUNT__SHIFT		0
+static inline uint32_t CP_FIXED_STRIDE_DRAW_TABLE_3_COUNT(uint32_t val)
+{
+	return ((val) << CP_FIXED_STRIDE_DRAW_TABLE_3_COUNT__SHIFT) & CP_FIXED_STRIDE_DRAW_TABLE_3_COUNT__MASK;
+}
+
+#define REG_CP_RESET_CONTEXT_STATE_0				0x00000000
+#define CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS		0x00000001
+#define CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE		0x00000002
+#define CP_RESET_CONTEXT_STATE_0_CLEAR_GLOBAL_LOCAL_TS		0x00000004
+
+#ifdef __cplusplus
+#endif
 
 #endif /* ADRENO_PM4_XML */
-- 
2.43.0


