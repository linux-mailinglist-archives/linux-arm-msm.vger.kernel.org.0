Return-Path: <linux-arm-msm+bounces-60257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE74ACE400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 19:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74E257AA03B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E5C1FBCA7;
	Wed,  4 Jun 2025 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A04olrBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11691141987;
	Wed,  4 Jun 2025 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059780; cv=none; b=gNPWR4uXFlea4zzpaLhS8tF46/AFxIobZU1yeQ2tOf4hev+Zuzs757L7Gg7Bm3F/+6c9H5IAP9faxwtCygcx7kfb91MWFd0y73jnuHvfnEbC4fYnLaeCp8Xzi8ldoY/Ak/A2BBPXVev9iClyMdcP29jFbrXkf9tULA9ZAwtaWJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059780; c=relaxed/simple;
	bh=LanZ6nb2p+uD+QPGfvXz73pBQC0IcFdV3eUSjxilio0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q1u6KD/VXtqEl75PlxtiCqf4G8zySA8v8NC5hf1BqwBqJmvwz+dGoqYEmEXFLJ9p3p7J08XWRFzFaPJugIwRzAg8jFWoM+0MYW9kNLBRBax8zDv5cVD5LYbCuUcIeJ5GQ3Pc6DRqNbcdmajVr2x9x+gJwOps82NDwFkp+v5uArM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A04olrBT; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-309fac646adso1274778a91.1;
        Wed, 04 Jun 2025 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749059778; x=1749664578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Euwi8cH8s0mdwA2LRTqEh1pB7vpHN6OEAf9ObZHDik=;
        b=A04olrBTAXoJk+2Azow7BwmvtG3eem6721KYkrGWGGGV69cA7Sp6sWhDFfiDYcAVKI
         3m0B7hfrTW+Wbgq2weN+zEfwhxEPFPnl1i0HbJze9Re/NHcY20Uzd6PUckZMZ2IzDcv1
         AaaneIdy3bEoPH352ptS487WdGW/YHcOTi3rTc486shCud/xh56ViYzUTsiySUcNJmBa
         4hENzS6IgwQ3lJLC30FjUj2hnJTKOtKFTCB/ENG+FsPyR0vTKRga4AlBu2LmrYwE3ORv
         sA/1mjJ5QpkyRQCeDdDvUwwAwBYZwF91gxBQJodQvziwl+54cvlhx8Ew57ugrmrHgNwf
         Tcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749059778; x=1749664578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Euwi8cH8s0mdwA2LRTqEh1pB7vpHN6OEAf9ObZHDik=;
        b=lVT3Io+OzWK/uTzVTJI5x2YH/6G5xGw8R0quMfQDbp/3xZACMUeb125ywa90kWTTrk
         6YVA7TIQVUMP8A/c4I4VwPwgbqdHSdUd4JX+VhOWcZUUOSYSsBcm0x2j4GU2/uxQ16rX
         IZaFoaPJHnHdD38vR1NU8IUvPdHpRRCjpoTM88QdgAfUXF50fkqakwEJHujiXk2/stFo
         WwSmWMSZb69iRY2HV3SUgD+GjDz9eP+XLcSXqaL3EPXYWGMMSoTUlNzOBTcsBXn9af+K
         EQPQvp4Ox8jydG9roGnPw2Tpl26KByRntZ/3fWURRMStYOFaqzESHBZei4SxfVFBZE4o
         bo6A==
X-Forwarded-Encrypted: i=1; AJvYcCVUQUkxv3odhqU07YpW6gX9+9WhFh2tkVY5K6eyZBeYGL9Abfxr6kLtoHVJsUWnq8gG+jnEvoC4/CF7t5c8@vger.kernel.org, AJvYcCVfPQr8KH+4POM737cc2p80po9DHlwzVuJAY1+oThdWitwtVlNUEzf7Ab7vDoTbwOx6Lp9v/TQ1VzdyBOd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0hwSLVvL2KSxLcfRzzBlug7urE9xIzrAuII/hkbFgc0z55u6i
	h3ZsDG1bkK1yQH+FlQvk/RWVCPILWgLaxA70nAFzm/U6F1GSq1aPA4UmE3f38Q==
X-Gm-Gg: ASbGncs/6Xw3I0ZiyHcvR98c9T0dzhoe9zhfXpP7iUeh1d2uj7Rgo0oqFcq9u99C2HS
	8hzFLQMkbpBdnVipqLEsu9oO77MYmL5jMNbNribFHvCm4kvCkHqRkhPsZ/msoYyhW7gSZk1kuZr
	RKYdP7LC9xwljHpm5NggliBLxlIzrtZh616hmcvVj7JdA4tq7U9AptkxbZtw3arPTAEPghDDYkh
	HEgoX9DZgmpYaqw9TZLpyo/A76nLRVtcHjO7NCxc67ElK3ICR1tdwlU5SaIbrGykMgecnCLNod+
	HW0JDl5YC4o/Ql/VNCATCoWNjyoItLCjpozB7zunc5f4vSi3jg==
X-Google-Smtp-Source: AGHT+IHblasMKmm6BcsNSe9ySzE24cboKqnKZUZq5n3QdEBR7VgbwEyc17E0jOQpdWgdihRXEusRnA==
X-Received: by 2002:a17:90b:55c7:b0:311:be43:f09a with SMTP id 98e67ed59e1d1-31328fa028emr519168a91.9.1749059778060;
        Wed, 04 Jun 2025 10:56:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67f4sm9232208a91.3.2025.06.04.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:56:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Date: Wed,  4 Jun 2025 10:55:58 -0700
Message-ID: <20250604175600.89902-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robin.clark@oss.qualcomm.com>

Remap historical email addresses to @oss.qualcomm.com.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 6a6aa09e244b..b72a164280ea 100644
--- a/.mailmap
+++ b/.mailmap
@@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
 Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
+Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
+Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>
 Robert Foss <rfoss@kernel.org> <robert.foss@linaro.org>
 Rocky Liao <quic_rjliao@quicinc.com> <rjliao@codeaurora.org>
 Rodrigo Siqueira <siqueira@igalia.com> <rodrigosiqueiramelo@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index ee57fc5d48f8..5dd1a3234cc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7567,7 +7567,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 
 DRM DRIVER for Qualcomm Adreno GPUs
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -7586,7 +7586,7 @@ F:	drivers/gpu/drm/msm/registers/adreno/
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER for Qualcomm display hardware
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Sean Paul <sean@poorly.run>
@@ -20287,7 +20287,7 @@ F:	drivers/soc/qcom/icc-bwmon.c
 F:	drivers/soc/qcom/trace_icc-bwmon.h
 
 QUALCOMM IOMMU
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 L:	iommu@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.49.0


