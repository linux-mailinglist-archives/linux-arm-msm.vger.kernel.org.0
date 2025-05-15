Return-Path: <linux-arm-msm+bounces-58149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C51AB9139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 23:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C833B1E67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 21:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F0229B79D;
	Thu, 15 May 2025 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuDo8UOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997329B791;
	Thu, 15 May 2025 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343485; cv=none; b=urlYVbOiPxl8vZ8L4BhwiHDaWGkYqD3WERa/xWphcR/6AP5ypx4wYwGHXWlEP0yE8CzjFrGjse7U7hY3ooXps62JVokQO604/LxAUiDNTJlL0sYFy3FlfElkp/HCyKL9x2TVF6vxz98HJwO6SCwHNG+4/V4dzA3dmbM4qDSiH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343485; c=relaxed/simple;
	bh=yxw7XY5YZWxuopjnhj9nRwMOfXcahZ26siXv4dTTPCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1z8OBrAEchNa5CGBrTHYTyEmA2HKgrkh77NsYy3pu2bF6ZcfCTWrQtWMMJ69lpDbBTuA5kijzEDOpwRuP4RRCSsheno4B8uQCyPZI5vzvuUsNUcxpopXEboK6wZRfYzdGeA4/U2y12stb4iMLaLtO2W3HKH+MUkDE231Z4vt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuDo8UOe; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7300069c447so1310622a34.2;
        Thu, 15 May 2025 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747343483; x=1747948283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsrbCQbXdTBMHnkFh4svvgR8i1h1hl4ZIoZzKn+642g=;
        b=cuDo8UOeEKYIHsBySOYBnMt3cs6USNLb+fSwdCJvmNcvljyf6OzP4apwQYZLluO0TU
         O9nxHNsui7hQxDN9RIm7yUgP6A9r/pADQG1soYRV5QdmNUpax8MBQCQC5hJB0B/1zYaE
         eQzZ07SRA49hDBSZ9IUofxZS5VtSl5sEHs81APbL5VHHD+AFi5Gu36pKYDCAnmMP/MMr
         qIulcMOAYSvi1YZQCSzpOiaz88nUkXlkh+rhRZ7/Vvj/MGdRz+9RSNW/NInea83mc5Dj
         th0+LOKVngcK+KyvTI0XlPoHlV1gYTCMGhKs8dQyY2v8WzAbENx/3maE7OAvFjT0tVlI
         Ex+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747343483; x=1747948283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsrbCQbXdTBMHnkFh4svvgR8i1h1hl4ZIoZzKn+642g=;
        b=PBJY5IQtvdiGzNsqQZNMvbR4ib/dwAmUXq2+Xz9UUIzOUhHXE+8mmE/ZqxQuimsaeB
         TQwUQbTdQY4jXlh58PUTLY14MOszk5P7tqueLQ1vgn5Qgbdj6e7rbOJBK6o/PnEzw0Dx
         KJxiPpE27oeWfY9fX2ZyQVUNWUsPJT+baUthlz3IiXnM2ZX420KmZoKowoxgMCcG9BMy
         Mye7FsB2/fLr2K4Zz98s4jtfLmAGBWI9/b/loA6CQnUxgMYBQj8Y8ESRtRDFktmOG0fC
         Sy+5W2I1IyhX7jzPt9oWtiijeoGEJzZf3bszvbfAYK2EhlF5VvYrmB6y8L5lXc30OE9t
         Rxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOfKg5ies0TLUGNnLC9wa5Z35xLwxFxUCd6Wzpi39n23fx1BwAVL5DFHSHomd1xn5aJOu0cyhkP531u/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCEBPAWWhxqeMGEE5MLoYbgi0aHyByjmuhfWZlIkUIuXZpjy0
	whLYp4dX/1RZ18Acj2OPJgkuf/VyX3rV/fs2DeZC5WOBjvhG75OsMkSSTl+Blw==
X-Gm-Gg: ASbGncv2y8cEdYGmTnknKFcX/Mqa+EqRANHX3tM7xWcdRcsWzh5LQaW4gPD8jBheMhO
	zcaEe3j44umXRnx1FqzPvaT03R83aiboVJcjfyE7nM7YVVTER1pGz/eqoUP0frSgjXfUanuz9U+
	y08hw41L1Hnv3gO1MhQgKsVsmJp/J6beiYRDseebRPqkBK3htIEHLrnFd8oPsMKnmptlowtQyCz
	J4itPzO9lnUNmSpJKwPb4Xp6xzRx/QXgOLtfTPVVyfVzTSNamkx0dZL+6YYXFZZkjw2x+Xo2fWp
	4TUUvTwdc0q9trmrnzws5yYStZJfT3NqNnjbY3RM2sphyLsx9TBs08owqbms2c2Z8Gaa3IbNLyI
	xka8utTpzYePlLP4UOLhDjL/7ew==
X-Google-Smtp-Source: AGHT+IGXAwZ1lMKkYKPVqm106lsiF8QexIHxQXcdvdh4KcFq2Lq7wgLaksOTSGOb37VGrFzEV43asw==
X-Received: by 2002:a17:90b:1c05:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-30e7d4f91ccmr1021115a91.1.1747343472751;
        Thu, 15 May 2025 14:11:12 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d4892a1sm261094a91.14.2025.05.15.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 14:11:12 -0700 (PDT)
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
Date: Thu, 15 May 2025 14:11:10 -0700
Message-ID: <20250515211110.8806-1-robdclark@gmail.com>
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

v2: Actually get the panel name correct in the table

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..28c38672c898 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1916,6 +1916,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0964, &delay_200_500_e50, "NV133WUM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
-- 
2.49.0


