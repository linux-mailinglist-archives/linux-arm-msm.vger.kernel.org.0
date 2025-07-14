Return-Path: <linux-arm-msm+bounces-64858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18327B046AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE04B4A46C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E4A26B2A9;
	Mon, 14 Jul 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Shx2Bv93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAE26AAB8;
	Mon, 14 Jul 2025 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514597; cv=none; b=IH+LnqF8aPppxgOkrcdSIF5J5qCYvMFCuNYMkWzcFRtMXa2skeKcBbluxXh9w/hTvjwysrKx+tfBY2ukJbuqJVVQF7fl55SZ96PoSPv295o4IrktGPd5A274e9O8NshHWfa/WKJp+J6dlnzA0w1NpUrxXYLFOw6iQyA5J5p9czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514597; c=relaxed/simple;
	bh=yFDhGE9IplYEOvGFju2aOSOp44FEaesNKxsZjzDka9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogbKY5AElpDAB3BzGpBW/7qk3RkSZuyLtcOtW0GO0dKahzX6ud+/VAVLLjqdfi+zmTQyQhOY/E+18OlsiwVgJSXtRyq1RrLUMXUXqQv7j/D9IFujrMN9VVHMuWqnANusWjuY0I+iPpncqD79pQpXdWixP6PBFXVHqAiMUzn5OEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Shx2Bv93; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so13666515e9.3;
        Mon, 14 Jul 2025 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514594; x=1753119394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtITE6KgMoS3AhCyG7ge+r6WLj1yPmuHodNoaoo4KmM=;
        b=Shx2Bv93si4/ATcc2lLsEmh/2jQTrfv/WMqdWBMI/DKs855IbY2ORidVxZDVUZe72z
         +6hPKvLA3jMFM8bxuip4uJxB7kmbRi64s8xi4EqenxnGGPBT7atYaUv3NN1tvDpY6VhP
         4nTOFjXCEfRi4mCIKGcdfUMAW3YTfFHNnK16SoPAzBzMHZx5xCEDe/zwXIgSK2iOdsm5
         ylDGOBZYidBBYn9VtKwYk/mMHc/Kz9q48mvf8FQ4QYPzypH8uwUwVFOC5Kkv9dCjEhGJ
         vv7ZppIM3aXl15M7BcSSa72IgSx8BftKetT38lzYjniirIohqjgDmcToApTJfHnpSs+N
         k2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514594; x=1753119394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtITE6KgMoS3AhCyG7ge+r6WLj1yPmuHodNoaoo4KmM=;
        b=hr+bKv/33YzOD7a7QQhgdhqtomxGTsJNSbGelFWGKmfpDjAwXBSCtReG2Li+4RcZPn
         HA7Um6TLw1RoqwmWftufJMHMkV+3/UILQ+G8OxAxhZpKPbcDoaqDVUNmgDd/3IIF3ZlO
         lgguUKg1k8t18NdM6vnL6HJDGbdr7RkbwTaZa6cpZpWTCZ01ZwWrh/QMY7GwAuaKQmi6
         qJGfxviG31tnbDoSaQEUIedBDzyXuOOZcdYXsH8SueNex9NPPjzOcdRdpWbWwkktpB1Y
         u1SrcqT5TPOsuF6IKpKsMLDvhOlSOaFyyBZ4mSeeLdQgaHyZAWI+CppXMr4kc7ashvQb
         LpKg==
X-Forwarded-Encrypted: i=1; AJvYcCUvC4bGOOhEKSGYt1xNJsyu5oNXm9t/pIWniOj+ZsKVBBzfny0yUJ4bq4ba69/3EyxfKcNw92UpX5R8o7zs@vger.kernel.org, AJvYcCW6eUJas6+BGpynytaTdCpXHZ1inYlb1XI32hDNPutEJIhHIdTeu7SjYJK7pcaxknZe/K+6PT0El/VXBqU+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlrGTCZEqmWMFKY0VGnXeERQeKoecMHOv0w4JwS0taKRL6nf/d
	um+HkJ1hjgePaF7FUpONhB20CeAVnOCyXnfiFhELLxVEmLhNP0pXk4zHNOZ0EX7L8q0=
X-Gm-Gg: ASbGncudsNdVrehN4dZlt5ZSnniH48Tvjv7wNMol0EYWu2GUwcZeV+NOzMBG6KROZbO
	wBxqDcBikME8ynvOjV/PhP9ujanvdL5qFwKhVV2gWo8lR4gmTWLhnf/jiiIOKloK/MAsC0IUrh2
	27opSAsUFA8NF6Tg0toNw7QijK9qSknY8pdDY6KZ+b1eTiBkg3DP3NjRf05XDnguOl18YRg9nMI
	rNsxYM6WwPvvd8jXg5i5CrADb2fr9CXhV+Q4GNyBJ7OsewEK/baj+me1GN0jrAUpjCn613FgWNt
	8ppPu/jICo6Cw3667TnrdCjpFO7K5qYlbLlCs7awwi67uyKYiu6GaPVnfHTXLyn+1J7WbSBeD++
	rlbAe+vCk9BnU/hsFoFINAMhnT6LAw/ROINSagquvPI8Jvw==
X-Google-Smtp-Source: AGHT+IF3IHZAfUwjccfOhHLL0NnXoP3T/kMpOhEmbqxn+mxAllsqLzGXG/3Az9GvJrjSX4te6HwBiQ==
X-Received: by 2002:a05:600c:3f18:b0:456:c50:1b3 with SMTP id 5b1f17b1804b1-4560c50065emr75556405e9.29.1752514593967;
        Mon, 14 Jul 2025 10:36:33 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:33 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
Date: Mon, 14 Jul 2025 18:35:42 +0100
Message-ID: <20250714173554.14223-7-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The OLED display in the Surface Pro 11 reports a maximum link rate of
zero in its DPCD, causing it to fail to probe correctly.

The Surface Pro 11's DSDT table contains some XML with an
"EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
(8.1Gbps/HBR3).

Add a quirk to conditionally override the max link rate if its value
is zero specifically for this model.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 4e8ab75c771b..b2e65b987c05 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -11,6 +11,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#include <linux/dmi.h>
+
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
@@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
+	/*
+	 * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
+	 * reports a max link rate of 0 in the DPCD. Fix it to match the
+	 * EDPOverrideDPCDCaps string found in the ACPI DSDT
+	 */
+	if (dpcd[DP_MAX_LINK_RATE] == 0 &&
+	    dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
+	    dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
+		dpcd[1] = DP_LINK_BW_8_1;
+	}
+
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
-- 
2.50.1


