Return-Path: <linux-arm-msm+bounces-89244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3ED25F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 581FD3015E24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00DE396B7D;
	Thu, 15 Jan 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Og3zfSGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD5349B0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496249; cv=none; b=dNTXjUHQBYYuxkeeqNEwx158ZNJN8OphuAeZ2T6WtwGWwgMIL04TpaVN/MQRiIDxavAI9GrR76PwELmAsAlh6dn2yfFxVx7EjDLEz/I91L2lUZyYWbL/sDqDvwvJ4Fo6VDTZcdPiZWYo/RcgIbuq5eMVfbUZThRkI52qHeWpIeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496249; c=relaxed/simple;
	bh=9ySFre6xeLFxuRQ1uFGc0x6OKIRIgNvKVxg9yBTPQsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLwkZta5AlS6FXVFMKVsIrumExhdMHInkCfj4gJ2hkJ9laC7r2fcKNa9QRcoeIcnBeWOYd7pj79/lctujAc7hS/5NxSl+c0y0iriQIu3wdNohcEP4TijyjhhEpxg8FHnZIe325xbkd5EJTpZ7UV6S+Y7f9hdL1wKZGYRwFQHyDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Og3zfSGo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso724464b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768496248; x=1769101048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXzZPPHjigDuE6/X7cZt8+YJ2SkPYBNIpUyOiSXW2w0=;
        b=Og3zfSGoYg9VIa1ZakxtfIiXkLxKF96Ju+lgckkv/lh5n96y9FcSz+pkchmdRmo/IV
         K3jDloTcanY49xN0PPjXx1l/2w++rCU2U0DkXrRW744KMc6ghHshBeLhukQC4yDt3a+1
         DKQJTE/eg6dGm+CS6XreMF9XWtvTfljJS2SIi0gTpOyUMElseiiCbG3doGkk+7Bn8Jdw
         VYMM+g8TnEs06Li3Hu21yGzoXxG/fiRo5aZzj1iZ3zF63ayH5qjv/AO4E8RgCgR0T8ZW
         etx8nE2iErWSlIuozXj9sPnemok0nKwLFcE8/OiXC60+7UxXMglZ2TSKmLr2Q3L/PRmC
         mxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496248; x=1769101048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXzZPPHjigDuE6/X7cZt8+YJ2SkPYBNIpUyOiSXW2w0=;
        b=fbYKFnTMcECoxzK2wkFsRVXrjGl3gl3aYE3sqXGMRO5oovM2/k/7yqHl65mzXTrBEs
         3mXUNzUkOw/x0HmcUZWUuQCAdAywrUe9QOLpMe7I8l8VvC+2wDMoOXyTVS6E3G/UsKo8
         s8F6OgivaBCZAHvGF0N/E5u/FlZRSCpPfb603iz64ULltJ1WwYkCOyfsix7mX0tUP4Py
         6yXk4cdWjA8KGnSy3wBAKO4bs+hOnshPRZI2vSyIGRZTidmyQpRAWEp+bSCNMTmj+jqK
         YjFtioKRmu43SFcaBDBz8+Q9Mr9/rpDQQCF863mwpp7YebUIQMEgrvx1Ho0ZUcvHLhBQ
         qpGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8R4i6/cHX306FNEgoGA10GXJ7qZnmke2aBvIU8KZtbC/jlxrcPMzXxhB4pLnfcLJ84xtT2pAS+yC6M4Sl@vger.kernel.org
X-Gm-Message-State: AOJu0YzakhD1cY2nuIt+fwiueWaAU5SkjnX4nA2JPT4FeiET+JR/l8Fg
	trgSFwKMdqFG6gnGEx2l/R/tjuaSLV/t/dAMov4/z80LEE/Na+Q3iE0R
X-Gm-Gg: AY/fxX5OVUb6W9DekRvKpik4HEHG+lrMAtYKLaANmkQkstpb3tuVVeaU2Eekaf9Nk0O
	tD7IVkPQHQXhMqsr49dFZsRCZuN9E5B+h/x2MIIR20Is6tj93GVA7iJdc9qMa43zj7MMiHETBUE
	4mVa1Mta8ilK2ar+a3Nusi6imrE+iwrbndQsx7fhrxych7sFs5DRxhly9Cm6rr4NLYNKnQJfBJf
	SYr1dM12xiKuORvE6HuoiGqRWgsn2NhptF/LBUXGj6Ea8/rYrx95kg1dqMX5V0G92FLsNfuEnoX
	9+/jhSHanZbRT21oQUgrsSl+azfZM6XK/nZ7YUm9sbLeuSumNvefyZP/iNe8jOX2eyotAQFzI9o
	W7pVgXQig+7aP50BlBhGLBY7iXBatQT35GvkkvtMz7AUud8TzST/f0e6LifDf825dDlaDgAQ9ib
	D/4GEKFj9HkCWjP2xPZ8w5F/MZPMNF
X-Received: by 2002:a05:6a00:22c7:b0:81f:50ea:5d98 with SMTP id d2e1a72fcca58-81f9f6c8dd0mr233498b3a.31.1768496247797;
        Thu, 15 Jan 2026 08:57:27 -0800 (PST)
Received: from ubuntu ([49.207.56.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4dd11dsm3002392b3a.18.2026.01.15.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:57:27 -0800 (PST)
From: Vinitha Vijayan <vinithamvijayan723@gmail.com>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	linux-arm-msm@vger.kernel.org,
	Vinitha Vijayan <vinithamvijayan723@gmail.com>
Subject: [PATCH] net: phy: qcom: replace CDT poll magic numbers with named constants
Date: Thu, 15 Jan 2026 22:27:18 +0530
Message-ID: <20260115165718.36809-1-vinithamvijayan723@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hard-coded poll interval and timeout values in
at803x_cdt_wait_for_completion() with named macros.

This improves readability and documents the timing assumptions
used by the cable diagnostic test without changing behavior.

Signed-off-by: Vinitha Vijayan <vinithamvijayan723@gmail.com>
---
 drivers/net/phy/qcom/qcom-phy-lib.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/qcom-phy-lib.c b/drivers/net/phy/qcom/qcom-phy-lib.c
index 965c2bb99a9b..cc4c6b254c62 100644
--- a/drivers/net/phy/qcom/qcom-phy-lib.c
+++ b/drivers/net/phy/qcom/qcom-phy-lib.c
@@ -9,6 +9,9 @@
 
 #include "qcom.h"
 
+#define AT803X_CDT_POLL_INTERVAL_US             30000
+#define AT803X_CDT_TIMEOUT_US                   100000
+
 MODULE_DESCRIPTION("Qualcomm PHY driver Common Functions");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
@@ -484,7 +487,9 @@ int at803x_cdt_wait_for_completion(struct phy_device *phydev,
 	/* One test run takes about 25ms */
 	ret = phy_read_poll_timeout(phydev, AT803X_CDT, val,
 				    !(val & cdt_en),
-				    30000, 100000, true);
+				    AT803X_CDT_POLL_INTERVAL_US,
+				    AT803X_CDT_TIMEOUT_US,
+				    true);
 
 	return ret < 0 ? ret : 0;
 }
-- 
2.50.1


