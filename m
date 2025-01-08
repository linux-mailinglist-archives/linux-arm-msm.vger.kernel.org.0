Return-Path: <linux-arm-msm+bounces-44225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9629A04E49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C22165E2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69891F95A;
	Wed,  8 Jan 2025 00:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kGCRe6S4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBE5DF5C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736297457; cv=none; b=fEeq+jgveedKKmcgfZDdLFvLEDdVoy8jODvyTFkynh6oW6nlQ3eg0MbLs3LyXoLCIjAzupBA9P0pkrffh2muICCImelTbB3oREzY/mepU/kYrm/Zd4xPRhnQL0lsCB9TYSccmJq95Pc4/uS4xA2lHwG79hX5LLkIjJSDgEAri1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736297457; c=relaxed/simple;
	bh=DPbSWuq2o0DZLfWEZ3kor0ZJ/H4buV/b9sB02jclP/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LQ14o21rk/t9tJ/A3jyMSzc+iHgfYURrA6VEyFyLYPb6IUX/0zwu6GfXPStOE4ecfTxs25J+1Kol26ijjdp8mTEM4Hwv3TwU+H1EIMBaHsjodJehDb/icXkKWozMWBR5CgkCGcCSAnEeAupabkRLbJ1gFRt+attOoUkkWydbhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kGCRe6S4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216634dd574so157921385ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 16:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736297455; x=1736902255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T/H4qKBWxsLQZ0Wgfk0NqqS/2SWo0oCmcMpOk0wgbw=;
        b=kGCRe6S4opzQA0fDXdQ42fUnSLTrKWwKcWXBXmobl7W+25ECPz0weIgAygsT/TjBZ/
         OpAsZgamqX2DLIoRlxTq8OQ9J4KsucBxqZTjgQXCL9WJ4IjGV7sesT13prMwdzYTS6SX
         fv9bF6TqU/QaNIxOEybqBQHgPo+DrTqJGYF60nG0Tp6yRtwcQieVof2SfSOKZf14zw4L
         VFsHDY9rSU/fyqF0I5tBjT2nWDBMUSPWpff8exhu+fTZ2i0KB6P/UMoaJRI8kkNN3uAx
         FxTCj3DSqIo0GbcrIp9vXgQPTaBrRaOnHSaza5IanqWtoNqahkE6PfqD56pZQrX9KkLv
         vgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736297455; x=1736902255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T/H4qKBWxsLQZ0Wgfk0NqqS/2SWo0oCmcMpOk0wgbw=;
        b=cqk+5B+G+uGwZtDeePcY8F7NtoKrPAlQEfis8sf6jCb8JCiWfyd5fDVrBsFtHVYssv
         aikks5zVTFjOeaxihsqdVUlhQgQMQbTsZgk0smvgqW5dpPb8jCyFBgZ+0JYCUouqOwIp
         OakPTAFxqur3vhm1LuOV0gp14+T3jvGtlO80Z9P2DqJqYoWieDLZl1onqBoao1mYZSQZ
         z9S0x3tgXveYrcombbH4d02u2rl1+Hx48qQ9Dfocjr4Vcidyur1ZyGslDELnXIvc018Z
         UTJJSTSjahJMk0DwmsSeg+6yLGKdnym8iGLosA6mMppve1nWIRGZhrmdu4EVOn8aRL5h
         aGMw==
X-Gm-Message-State: AOJu0Yz8X1NeSskAxmHC1I0spSVJPwBnMWIoMbtXl/0lt3qlK9U01zxD
	kcmtMP8QtaFtqQRsh977I5PA5TZs5mr6HdG3It24Il9YSpqT0Ys2guG7UvLaBos=
X-Gm-Gg: ASbGnctPXnlTaEwCqD70in1XJ+S6pFsn5QhW3ssVxmeGv8s6SRHXWplTFkU/uv4xAoc
	w0kcBquGA8FqgqqW2UegbhoqC19+SjuLOrEpnMFeEqdUcc3ivUmQDuxZiIWsPcnIf6HlWWTcNjr
	I3+/3FBK0klupWkNe4EBM0spUSyn5+US7cekAoffDP479gRr/5jSSmT+PnS3prT0+szYCihgy4X
	o9ox6YmuhWKBqVHAs85brcmcjc4C2s0+HeXqIPN6/uD+bxWp+hOw24Egk0ishPe+N0FC1uj+/gG
	Fddq
X-Google-Smtp-Source: AGHT+IHUuEiZBdG3omlHGc4ZkH2vvEsKR/HCHgwXps2NDTxpakpxXIrweBkqhk4Gm4QwEIfeDyy7pg==
X-Received: by 2002:a05:6a21:7898:b0:1e1:ae4a:1d50 with SMTP id adf61e73a8af0-1e88cfd3cd9mr2154472637.25.1736297455171;
        Tue, 07 Jan 2025 16:50:55 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:83ee:4294:3e0f:6eda])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e4db5fb6sm26331644a12.85.2025.01.07.16.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:50:54 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] rpmsg: qcom_smd: Fix an OF node leak inqcom_smd_register_edge()
Date: Wed,  8 Jan 2025 09:50:45 +0900
Message-Id: <20250108005045.2716459-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smd_register_edge() leaks an OF node reference when
qcom_smd_create_chrdev() fails, since qcom_smd_parse_edge() sets
of_node_get(node) to edge->of_node. Add of_node_put() calls to the error
path of qcom_smd_register_edge() and qcom_smd_unregister_edge().

This was found by an experimental verifier that I am developing. Due to
the lack of actual devices, no runtime test was able to be performed.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Put edge->of_node for clarity.
---
 drivers/rpmsg/qcom_smd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..c2bb4887424f 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1509,13 +1509,15 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	ret = qcom_smd_create_chrdev(edge);
 	if (ret) {
 		dev_err(&edge->dev, "failed to register chrdev for edge\n");
-		goto unregister_dev;
+		goto put_node;
 	}
 
 	schedule_work(&edge->scan_work);
 
 	return edge;
 
+put_node:
+	of_node_put(edge->of_node);
 unregister_dev:
 	if (!IS_ERR_OR_NULL(edge->mbox_chan))
 		mbox_free_channel(edge->mbox_chan);
@@ -1548,6 +1550,7 @@ void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 	if (ret)
 		dev_warn(&edge->dev, "can't remove smd device: %d\n", ret);
 
+	of_node_put(edge->of_node);
 	mbox_free_channel(edge->mbox_chan);
 	device_unregister(&edge->dev);
 }
-- 
2.34.1


