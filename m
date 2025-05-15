Return-Path: <linux-arm-msm+bounces-58148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F089AB912B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 23:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B6F37AC0BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 21:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA54E1E7C03;
	Thu, 15 May 2025 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLZHyvcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474F4174A;
	Thu, 15 May 2025 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343186; cv=none; b=XUAKQGXa7J1y45dPv8XxlMx8qMzE/LX5fZyxuHHM1RJup6HLpwRxZ8t2gIn2wUA/LLpD4tkVsO6+cnzL+bu/4a3hoRq4Q+ZaAUh6GnLHyhidhA88yWExO6+dnwgRG1SL3Ujde1rNH18KJ93TfIEMrOHHE91odkRa7nF2SpOxSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343186; c=relaxed/simple;
	bh=rqmL8wSHIPVWED95fhvQCkgWovv7Z03OviE3lvpKypI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAe6aUgCXRCPsS/BoUPxm/pI6KyqwnUHpASw+uDLyu9rH4bgHwXBx2tdCq3H5PA7tryOucP1jGGcQyKicgH1STgJzUwwnnlMIbMNl0HvJPR2VZ63e1rFFZNuyg8g5dAVu8YyL36he3D2T7RKOc4SNwTKoEcywohW2JnccHDvyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLZHyvcF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2317d94c9cdso14095685ad.2;
        Thu, 15 May 2025 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747343184; x=1747947984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glVvTUmZ1lEPqkPsZ0IswYkeh0jiUIOqzVPrPGI5vCQ=;
        b=NLZHyvcFgZn3p1zRfW4FphwHYi4ktebYvsIdNOdIjPnJV0Zyo0E6CP2IPa7NK46OOP
         fCtwy/qXKTm7DQ/yLZbiqkI7jqoxQm+alMcELcd3WoyKjP5c5mbedoykA/hDOruSiv0P
         dDFWte1RVI4lHtKgwTuIjdNLnMMblphWu+6wXzAKpiENCNEVteDmQLNJmQGeVlXF058g
         Kf+Xwf4aqGfczHQO+7uyfBAlsfYTQPuKJDjx7GLXChH67rPsLj8cQeHzeQ0PwF1GcJ2c
         HMCkiknhJTYZlOBZpATrkt/ZpPoOj9+jKW2ClzjncXiJJHlEgquyJMYzM1tfIuA4sph5
         HN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747343184; x=1747947984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glVvTUmZ1lEPqkPsZ0IswYkeh0jiUIOqzVPrPGI5vCQ=;
        b=l+muWRVxCG3Ss8+Eld+bl/kKBwpP59DRgZ4CXSRJWGV7v+qVt+Oda197uo537uxJSx
         pyylETzn9T8U/U1JOLq1dvhrcE55ZsRyj8MHc6ssE4nIEE0aC3uHVzmcV9tCp4xUgUCn
         ya1JZEJRSHwc2JzvSltupVBXCp+P61hqqPMfPdBW1chl1Qg5h20rWMt/HcXgVQIa55Lh
         D3Va8Bw9k5A+z8axljNSSlD4y+EfbxsVhXcCvrljODldQDOrBThNCztAZgUGV9cygC6p
         LXvtYYSYRnfBoywlBSvvMBTEfFRlvxFqHgOZGAznSEFBlez1F9R/+b5OykoIjG48ytry
         Kxug==
X-Forwarded-Encrypted: i=1; AJvYcCUJBiVv2lnvwE0wMfoHMnnycYwolSkdjRy1hfYdRL4sGsibeq2LWNrfOV01+7SDNhd2kz2TzTQ2RYwmTJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywor6XNULUT/Kamrnn9ACjNpRwNHMbBjcGeMKl4KRoEu4ookOgo
	IOrsmg97AiuHAJe6ZVA09XeS3btKknT5KWNOjTLu8SUCHLO32GiN0pu+
X-Gm-Gg: ASbGncsB3msVMVcovFg1cArP64zO4S7ytFMZbwn+4HbcS4Z67Kut6rantSo6ZehJDtW
	N0201MEDOnx3+GrM0wB1jki7+ct/isLUgehQvMwMb1eHLuBsATT2CVK8KUb0kGJAlnDMal3m5kK
	B0WXjZS/+MXueBt7kKXx/gfq04OoLONNe7eKdzgzSE3GnoCcxbSvJo2eMvWvtf+CCgKU4PoLy53
	gljc/qDvjKP4BFBhWXtbhng9MiUalG0UNyFRF+LVSWBQkFISXSJQNkfOhI42EnGp6Xiq11cVY6o
	RRpd47DYCGNG1vzfUIcwa1hj5yuv2WlbH118qT+++ZdsYNDT/YxEdNIEOH6pJ3VcLlgCo2g/zvf
	lp9INlw1jI3ibC65kAiPt15PbTA==
X-Google-Smtp-Source: AGHT+IGtCDa8JGGZEv5Fo4WJTmdj8+IdkuqNCkKpY6C/TQ/oUVVGOm13unafuIogtRfF2mhwQf2RYw==
X-Received: by 2002:a17:902:f543:b0:210:fce4:11ec with SMTP id d9443c01a7336-231d43d7f23mr11109175ad.1.1747343184344;
        Thu, 15 May 2025 14:06:24 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb733sm2146485ad.63.2025.05.15.14.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 14:06:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
Date: Thu, 15 May 2025 14:06:20 -0700
Message-ID: <20250515210621.7753-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Add an eDP panel for BOE NV133WUM-N61, which appears to be a 3rd panel
option on the lenevo x13s laptop.

edid:
00 ff ff ff ff ff ff 00 09 e5 64 09 00 00 00 00
16 1e 01 04 a5 1d 12 78 03 55 8e a7 51 4c 9c 26
0f 52 53 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
36 00 1e b3 10 00 00 1a 5d 30 80 a0 70 b0 28 40
30 20 36 00 1e b3 10 00 00 1a 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 33 33 57 55 4d 2d 4e 36 31 0a 00 7d

datasheet: https://datasheet4u.com/pdf-down/N/V/1/NV133WUM-N61-BOE.pdf

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..aa7b58204523 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1916,6 +1916,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0964, &delay_200_500_e50, "NV116WUM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
-- 
2.49.0


