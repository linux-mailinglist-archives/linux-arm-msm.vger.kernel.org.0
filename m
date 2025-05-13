Return-Path: <linux-arm-msm+bounces-57710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFEAB56FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF0E189A3C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF1A2BD020;
	Tue, 13 May 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZRDmxVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CF2BCF5B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146252; cv=none; b=nfSDv4qExVLk90dRTUebUbWivltnAdBxuXAVjJeea0Py0xrSOD2LyckjQHoiAKjUitVgYzdRS6JcLX5EKGLVLAEtoiZR1Vc0U8DVCeRkC/WT0bSXjD7JZeB5/sqNi/52E/usnp7HxSrLVi9cyiMoaNKs2tQUk/b5O6orSoxBLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146252; c=relaxed/simple;
	bh=erNjneX1ykXPs40HPM7FAn+r4hIz/TDnlNai6OUxWf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaEU4CaJ4SJsYn4+EpEy82XVFaYNil2TZy2/1qxJnK1sybCndBIfWal2kJfRS/Z9u6Io+CX8HbCjuRISik0Wrw2hDI6ll1xIzt2cU8xLWtBc3xOKbvTevB4/8WPduIsWB/MuvOFBHoK922xmlM7Ave+Lol0kD9ddcK+8hQ3BSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZRDmxVX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fc7dcf64fso566547e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146249; x=1747751049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1GPv/f99tPbM0UPQ85Mqw1y4SMVAklj5dFNW1gK2Gs=;
        b=dZRDmxVXe7IgZ59LhcNgMZV0kqJQKStUV9bSymNRtug+eBHpji3Jq1qTlJJKyXPt31
         evd4ieac6ybyOq5lNoCyF90hvuwUUe7XvUE6crR5Xk+ywW1x2tIWzT42YomMOeAHCsnf
         se4zO19xWu717NQmHkcrHMcXXP33xkFYjZf6N2Xt0QodcpGIzdKI2NGN5L9pnhsnTGp4
         QloCxIultmNLvSa2lrDdIfSJzSW+PbpTQ5awZy2T5yGhhiMuPNbUJdHgroDie5NdMj/0
         4qllg9aGxMfgbI/pCPFSP5wEbqZWRm38SEMT1Shmbp7H5vo72Ci7XrzPnEq9ZyWBfHel
         Ptlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146249; x=1747751049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1GPv/f99tPbM0UPQ85Mqw1y4SMVAklj5dFNW1gK2Gs=;
        b=J1xAGHO2Djg7iAhAjghZ2Q3nvGSY3WhHktXH58cdC7GsgmCmbhyzWT4P4g+Xiiyy9s
         TVX3eyca/TfLQcWatmieMIIW5eOGAt5gJd0XPAnpRrYReHkY8veUdg0ApXXPONROmXNT
         jEE916MLmfRwrOWP61DkDttfaU5alvbniP3krmr14WtqSLQLDpdZW35gKI/f9cuuam0w
         ZnJi0NTh3yjziAtuSWDZkrDErxw2N0UB1uDeOwAxrRgRUKdZg6Uvkl8/MNQGk3AF4f+A
         jMAuN0uNplRWJwGouFW9I1N11Ift2vdNVwtTERG4QQQ5pQ5TwUNTDgPs4hTuYwP7qGov
         Rekw==
X-Forwarded-Encrypted: i=1; AJvYcCU04qHnX94LqwAEDq29x6jFaXCByO+Hpfh1VYtphVPzIdFzsRiZtiB4xX/uL883C2iCQIziccdC+YMACEvd@vger.kernel.org
X-Gm-Message-State: AOJu0YySgSJqp/l4kiJZHpgVgan9D+L+TkvZfwXxFlS1Rf7g2hjFvA4U
	/AGcsHEDPDYDMne2fZyC1ygsmrSFGex1eMCkqw3huWfRWLj9kJ1ziw3AXBl12v4=
X-Gm-Gg: ASbGncvEsU4YF5dl3KaOGxnzUlL3yVpTMnoeE8wvK0jTP/GnCQGI5xbmk3KyjmYkqCx
	kGhgViRJE/qgIdFoe3aZgcvMxBQDpoK8m835088oI3qIQBWebd6XQpaX2RgSkESE/So3bAvtriE
	alnx7CdtbzXF0UBFJkdeERHP1Sh2SjgPg97jPuWYSeohL7bj5TKpSYjmnxCXg6HlH0kKTc95L8v
	ohTQFn1t/YZvnw7cygknLnhAdzsOr0ENbtOr9fUjBI185NDM9s3UKyhbNHo5o8PMqgX5JjrtAJV
	Bw64xX9a0My2F/hdgYIruLIIgd3pD0xaHEKmsdR3AqeEX7L/JGYn7J+A5vJNZegEZ54vqXhVO9u
	lO7F/vqYLcELOd42uPsS5Pv5FlqEOQS6eStOvKncn
X-Google-Smtp-Source: AGHT+IGO1rTBMd+2KCdhIBdhmkYdra8c308MKiP+DS9B6TmEo+B1Fa2ub8Is/wdTA9cZdM0jG2ILhg==
X-Received: by 2002:a05:6512:a8d:b0:545:760:44ca with SMTP id 2adb3069b0e04-54fc67cfea0mr1793598e87.10.1747146248650;
        Tue, 13 May 2025 07:24:08 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:08 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/9] media: qcom: camss: unconditionally set async notifier of subdevices
Date: Tue, 13 May 2025 17:23:49 +0300
Message-ID: <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For sake of simplicity it makes sense to register async notifier
for all type of subdevices, both CAMSS components and sensors.

The case of sensors not connected to CAMSS is extraordinary and
degenerate, it does not deserve any specific optimization.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 976b70cc6d6a..4e91e4b6ef52 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct camss *camss;
-	int num_subdevs;
 	int ret;
 
 	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
@@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
+	ret = camss_of_parse_ports(camss);
+	if (ret < 0)
 		goto err_v4l2_device_unregister;
-	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
@@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_register_subdevs;
 	}
 
-	if (num_subdevs) {
-		camss->notifier.ops = &camss_subdev_notifier_ops;
-
-		ret = v4l2_async_nf_register(&camss->notifier);
-		if (ret) {
-			dev_err(dev,
-				"Failed to register async subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
-	} else {
-		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(dev, "Failed to register subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
+	camss->notifier.ops = &camss_subdev_notifier_ops;
+	ret = v4l2_async_nf_register(&camss->notifier);
+	if (ret) {
+		dev_err(dev,
+			"Failed to register async subdev nodes: %d\n", ret);
+		goto err_media_device_unregister;
 	}
 
 	return 0;
-- 
2.45.2


