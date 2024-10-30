Return-Path: <linux-arm-msm+bounces-36355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8579B5A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 03:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 586B1B21A30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 02:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E074437;
	Wed, 30 Oct 2024 02:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="D4dxNfow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB041865EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256683; cv=none; b=IvaTIvDjrghTvs1QqemrJ68SRJu+UOVUNuDjWXgxFFMXN35/cyrf2mxmihHYc8l5fEHQNx77V6/d04OyQb5v7UL/hLvwN+B7QNGz3m9v0mk50hJnZzxCL1BYMPj4X27E5w1nPjBLaYbZckmES2a/OGkZtEL4/0/AbnCVPT1vyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256683; c=relaxed/simple;
	bh=4d5z9Rmo2s17/rA39c+IWc28e1EP1aso4xRWd8FFmKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JLKDoOYtTM8O9pE3wOTsk9ADJF2YVY/NM3G+Ccli3b6WF9QUnPHfzudLNmNXY8IH9Pqb9ABFENZ76+KZbtQo+NKD6VXb90jkFjHz+1kVJL6DZu0InvAKBtp1npYiCa+N42wSnCUnQntSCDOzln6npywC/CC8qTsFBYZQgLTSgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=D4dxNfow; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7eab7622b61so4301278a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 19:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730256680; x=1730861480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9gqoun5xte5QUijW/JnBLgFajTMpyVkRPWbOwqhTUU=;
        b=D4dxNfowzgFUS24LtxInysU1adMD990b7FHn57NQB5XdH8IZKpDUrT/iJY3qts9Sew
         pRI3gBULUg2+sGWTL8T4Q43qvHvGioy4IChm/zh+eElJx3/afsuPtk2B7Ht/Sg/XBv+f
         UnbxU0wv+hY1xTGhHcNvMBHMFjiVGxe4/U/ESA8cvZEPhyqdtsOgvbrwAAhYjPThaZSa
         fdDaLe9QNcAnX1XUJJQfDDyr2r+fuee7HWRkE78VtBVftKWiIJlVvltlD3QMSxR1l5mJ
         KZkoJ8/peJLbl6GLTbkXL2fjIuEDNI6Qd5UkE8zetH9DK2jdKyLW2K4gBB4AIA78clMj
         zYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730256680; x=1730861480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9gqoun5xte5QUijW/JnBLgFajTMpyVkRPWbOwqhTUU=;
        b=wShLziTL3KVttbACmLVIuaJJXd02EDLyLefBWNyDSZJwxNrlQ0kBmGC5pdpvK9AF4i
         +wGrw2Hq1rtCs4In+f/YTCzk3efqhZkErR6ekQv2ayunpiLC6MYktm8xCbT7P/18CRxa
         cxDPYHrkNiSFDRRvtNmRja1AbaOaJpSjy77g7FlDYSEwNzlyEpSLgnpOiLW1w1DW0tyK
         ErJXnEQffRNDe8DepLj7jaVPLHYFuD2TlgPoNxAB3y+NaAfpBtK7Ms6DswNRNhEkXlWu
         InTa6H+EWb+rMeaGdu2fSt+sDUXFZMl394ivpgpakBP7U+EgkmA98PUHOJ8bHgtKc6KP
         HBWg==
X-Gm-Message-State: AOJu0Yw4YrSz3c3jfmc87681w3y118qZXnuo4N+p+TRKz6pZh+ejT4P1
	/gv8Zg8rZZV22N2uMh/Q7XfwTt0u+D2L2y6gSygnynUizpo9tcN719Kkx/EJEj0=
X-Google-Smtp-Source: AGHT+IFH2zeoSF+thbgmt/kRjAah20UO6f5s8rWCALIO5qyR0qmiYNDOEqD5NNlq+XIBss5mzrUhKA==
X-Received: by 2002:a05:6a21:38a:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1d9a8402d9dmr18230092637.23.1730256680412;
        Tue, 29 Oct 2024 19:51:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:f70:2520:9500:731f:30ad:22a8:e621])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm8321061a12.0.2024.10.29.19.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 19:51:19 -0700 (PDT)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] soc: qcom: ice: Remove the device_link field in qcom_ice
Date: Wed, 30 Oct 2024 11:50:46 +0900
Message-Id: <20241030025046.303342-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct device_link *link field in struct qcom_ice is only used to
store the result of a device_link_add call with the
DL_FLAG_AUTOREMOVE_SUPPLIER flag. With this flag, the resulting value
can only be used to check whether the link is present or not, as per the
device_link_add description, hence this commit removes the field.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/soc/qcom/ice.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index fbab7fe5c652..8c71bd1efaa7 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -43,7 +43,6 @@
 struct qcom_ice {
 	struct device *dev;
 	void __iomem *base;
-	struct device_link *link;
 
 	struct clk *core_clk;
 };
@@ -268,6 +267,7 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct device_node *node;
 	struct resource *res;
 	void __iomem *base;
+	struct device_link *link;
 
 	if (!dev || !dev->of_node)
 		return ERR_PTR(-ENODEV);
@@ -312,8 +312,8 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		goto out;
 	}
 
-	ice->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
-	if (!ice->link) {
+	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
+	if (!link) {
 		dev_err(&pdev->dev,
 			"Failed to create device link to consumer %s\n",
 			dev_name(dev));
-- 
2.34.1


