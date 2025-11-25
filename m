Return-Path: <linux-arm-msm+bounces-83256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33575C853B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA7B74E23AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B0A225A38;
	Tue, 25 Nov 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LxdVuKl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F1CA5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078426; cv=none; b=nXJ75q6a9J+jzeokYUZC/OB3BFMLMgXXvcGMlRzMcD0MZ8DrHfmOUtztYgBMHzO/VzgkpfOfPidTu3eCV9WiWzX/2PH0X9Czw3cgFfufRGAQZ3+8GCWPOD8D6MhHlc6bMV56vtyuoVCPcpj0rQZn4PWlS9uhvDTbV88QvQ6ZC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078426; c=relaxed/simple;
	bh=KEQFU7OI2vOZ2XEN6wAtMfzsdlEWHw/1VFIzyeTL73I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkpXB+/+FFX/GlEFt5vkEiFlpuFYEpSTbeunpSVBSU4MTkJMb8UPYkWcZZ2xBmCT14mdU4oxrWyjXeG3mpCM8iHSbS9ukTJ5eRm9Y0be4fY8c8TjPMF4j77spEglrE2QnOsSQOM3L2u6Kyxwna8oYTIa/gqChiyP0cMWVhLSRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LxdVuKl0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775895d69cso23149935e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764078423; x=1764683223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuLUlee2qTjguKBRn8Jjr6ZSUtU+7Vzi8xHny+2sQtk=;
        b=LxdVuKl0OEF8xQ34gi5D214dQWIbTt1D+z/4PtHYA8gbBT7W61P8qpOxRD2pn3O1ew
         /+lhoEC3wGMOYrKy34pI1wywdBdyCscfQPq3K8qtRZRPWWSmzamAZq1sptn2Ow7bOFzb
         s9oy0cJBsrlLx0xFBEa0+YxzNJVeAGAOpERCOvRPjS4TdMNNEqr2+pJdrUH/E2xXUvQ5
         4S8pezkeqS6NbZV19/KrnO+FYGbpMbMNjXW0FnNmdwca5X2pdwv3b2nMrYi03e5NN0f8
         59nkrYtEjXZ2/1uwbp39UnTW7RavZcoM4RQMKGO90tVQ/tJMsIsjI6ci6/nsa6IVQC5e
         BUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078423; x=1764683223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuLUlee2qTjguKBRn8Jjr6ZSUtU+7Vzi8xHny+2sQtk=;
        b=j4xWFEYFHLbneV1A3oHU2SjZhbp+3o1v0QGxLSpArLRkN1xv3tUJbEjhgm68VhXDVT
         Ne1CPtTLb+9t6sUOjgEIZKRoDZL5axqSppJpPRDmNGpJStwFeEE6mhSp5TTLFNyJs7IN
         lwC3Fs20F7e8oKzsMW5+Va+XmQ1v6udTeA9vBaihYf5yLM2jONMQdRotVnbRtlfxjeX2
         lfwekdfM2Vz1/vHBc01LPT6QTwuTRtOhmIsgaQRPBRtonbmDrmYpg0yALA9E58jeiHF6
         UOb0wKelLEcWp+IjM7wrx7157MsMDXGXT0+rpN0r2uBc2+bq8JM9sJYIDseuEA4QaSSv
         31kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsKX8eKyuZVCuR5DfV72Q8BbiLnQ7Os4bFubbKAsiino/k0w9VStpwqGUFNo4IQpcrxbQA+MD5POFj0wPF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9Psc0IHD3j4GP4PqL9cmHsPbupFp4zNCpaM1/D91U0OeDbf8
	fOfrV/Axb4GBXE92O4ztKAgb4d7EkeXT3Wluznau6N3pw4d5njdTz3FJH9Tr8s4ZUzHfQcBv3AP
	UspE4
X-Gm-Gg: ASbGncshZUf6aekmV6KnS3txifJGCWpp90KXz7X/m390hL0GL52p6WGeD+MzHxIxFyP
	KGRR+se6QOatC3jUvFHNhd5GQexsjxILiUY+CCIqPwB2zjtN4mNoMLwTKeshlCRZXmLR4fn6B0X
	TblSdFKWuTSONLYt+7CA5brDtrg2iT7w+AfmHW6pGXpUecNLNKv/P8Yebt3DpNAroYpR8o2keCP
	68qyQ1DYAQIJsgw0K4hhNnrO8N7cX9eONT39yjaIpUgp+gW2P+X0eSPQnPmlVgAoiC5YcsOlb1A
	OsAa0AVRs3d02Wv7yXY8IjJO/IbcYRlhH8mnchFNiVihLDGlC8gzRqhjQxiEoK9TjPJ5LbnEJvh
	StPjY3ElRuVGQoFQIbHzw5f7zD5QkB/62KpYSV2SDKaMMsqRfJqg5yXaEsUl4XSiVfHQhCTUkhl
	2CxkdC
X-Google-Smtp-Source: AGHT+IGi4EcMrjBlksCLyycdvlrg7Yix+I0DacooX0H+CkCNHSZBtY6zFdpBZ92P45uXfmddFlxV9Q==
X-Received: by 2002:a05:600c:255:b0:477:acb7:7141 with SMTP id 5b1f17b1804b1-47904ac44cbmr21213615e9.3.1764078423297;
        Tue, 25 Nov 2025 05:47:03 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e868bsm244973485e9.4.2025.11.25.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:47:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] power: sequencing: qcom-wcn: use device_get_match_data()
Date: Tue, 25 Nov 2025 14:47:00 +0100
Message-ID: <20251125134700.29135-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the generic fwnode interface for retrieving device match data
instead of the OF-specific one.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 663d9a5370653..823f68ffebd1a 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pwrseq/provider.h>
 #include <linux/string.h>
@@ -373,7 +374,7 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 
 	ctx->of_node = dev->of_node;
 
-	ctx->pdata = of_device_get_match_data(dev);
+	ctx->pdata = device_get_match_data(dev);
 	if (!ctx->pdata)
 		return dev_err_probe(dev, -ENODEV,
 				     "Failed to obtain platform data\n");
-- 
2.51.0


