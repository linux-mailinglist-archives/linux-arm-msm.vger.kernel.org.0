Return-Path: <linux-arm-msm+bounces-48189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD5A37FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2B2173536
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283F3217668;
	Mon, 17 Feb 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6jcOYWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900F21A42A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787485; cv=none; b=G25asgZoDmtgExSov+pXXAX7YmZbVx2hcveeZmCDdcR8K6ny3R4cF8yUv6bSAefREpPVjus3nmzRi52H2EYDjF7I4vzW9R5SdAe1l7Yv7DRuR6KuTidl6UtvcZKNhp37ouhN30j1UlRDoPtD3LtH/NBBo9bVIyo4jbxUJVV0Mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787485; c=relaxed/simple;
	bh=H1Q/+IWyWi+vB9ilQ6BLrSUry9GYCCCUwBI0kz8T7RA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCgVQhANoUolWwD8DLrMb4cG/l5Dzclh4N9J4xk0WX1Z3phPSuz2mzcunobikVnTzi+om7ZkIoZToGhWwpUfalPkq8Rk2XimWYSjvWWRK1UhZdBgh8LtHK7HaxIjfOUIegSB1qdjwLOGTR0ZgQ3/VgHQ9edhCfi/OI53tj3QrII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6jcOYWM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb7aecd39fso283067566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787481; x=1740392281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOx/QjhnUzr5iZf43d5r89IsS2FOdAlXvdjY2fxKvfY=;
        b=j6jcOYWMI+xBtGufFxtNgFXkcWHfBITO7ir/tJj4DdFAtVlkTQO72/L3+0sCKJg0xH
         BwfZtRHLBchmHXbktX6cEsV0ganx0LddNHdEsnEQEpLgnE1JOD4lnHLVAyCNv4mawObA
         V1njXv86+puXsxF1HH18+YIDGe8IgNsyi0Gy/l82d5LdYIrnVUAdwovpfisz01eMyMS6
         FwYQ1kAsHuS8KtNfIF/tQsMWDJsFk39noEwsiyenNvp8qhKy2p/NLVg7uokL4nt1rftN
         /ZXUlSoxGUYPWictch6imohZ8QbTXB4x3a6HvU6wuEbXbwXXqwIIYn4C+yIQ3fTjiG48
         A3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787481; x=1740392281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOx/QjhnUzr5iZf43d5r89IsS2FOdAlXvdjY2fxKvfY=;
        b=JZql3X3YQWsMfbQVtJKl9PER+v6l4qux6t4afhFDvX6HQgkjPbKNSQaSOCX2BMrtpv
         fsswEg+Ev2PbF2P1euyZS6JpOD1xuH7EqiYo7Gc6G/BJSbeCqKwJ3g3NYLBQMmloqE5K
         iak0QoP0OC4txrsV00s9fDzw4nQKeIuCYekf/+vaVSdYI90olIb4bLakFs04EC+IOYV9
         sz2ygQThKq7UP20vO6xcewaUule46HkdPRKQY1kqlIi0UrqQJ+r6U6wKySKn0bHi3uBI
         AZ43It9kMPE2rC65b6J7y5TzHnJnzMqQSaWS3sQ06T0gUECO5P77AqUv9kvpL+VaJKxY
         3Now==
X-Gm-Message-State: AOJu0YzF+LmFLor8V2dKTXWnwR1X6T6KNn+gReE3gV/V1C31J3haRV9M
	UnNCMomdV87ds73bUgrUTQJfOtzlQtiWRDk1G4Bl3WshOS6v8XQ1Jqm3iRRp4JAENDEXx4jvewj
	Nabc=
X-Gm-Gg: ASbGncvRY6Bvsn0w/Y5gfQwY9i+8UyITH8xDtStJbMO+QgfNRCeQhtly7KYLfIML4v9
	jDpEoWLM8M12ZYHYskdGHtREygcHHYcDEBAgxGUdj3rU0HZEY6gd1ifDvhaPT+IZS7eiydIeZAZ
	buUMeT3gKMclnoxdchNncGxa9SKeb8l189z0xKCilM8wW7nlnQAAIDKXICGT6dm1eWnd2l8gxn3
	s24dOYCRzeyrJc3rio0fWxu6Dddos4tlu4EG8Qo3m2szxbmNj9Y8l2c+H5c7dHVfx/rGvg/Zh8X
	fXMehXpVq9W2/cz73cCFhbUW
X-Google-Smtp-Source: AGHT+IEyhYoBsYp2nsZUxaNrWoEJIkJcEzeW3uR5U89aJyr/W0mS2FbZhC0xUYWaFE0athJ0Fx91Xg==
X-Received: by 2002:a17:906:4fd0:b0:ab6:fe30:f49e with SMTP id a640c23a62f3a-abb70cd5108mr714909166b.28.1739787481314;
        Mon, 17 Feb 2025 02:18:01 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:18:01 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 10/10] rng: qcom_rng: EXAMPLE: registering dev structure
Date: Mon, 17 Feb 2025 12:17:06 +0200
Message-ID: <20250217101706.2104498-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proof of concept on how devcd register core area works.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/crypto/qcom-rng.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 0685ba122e8a..a1509609f50c 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -7,6 +7,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/crypto.h>
+#include <linux/devcoredump.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -32,11 +33,13 @@
 #define QCOM_TRNG_QUALITY	1024
 
 struct qcom_rng {
+	char start[10];
 	struct mutex lock;
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng hwrng;
 	struct qcom_rng_match_data *match_data;
+	char end[10];
 };
 
 struct qcom_rng_ctx {
@@ -192,6 +195,10 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->base))
 		return PTR_ERR(rng->base);
 
+	/* Setting some markers to easily recognize them afterwards */
+	strcpy(rng->start, "MD_RNG_ST");
+	strcpy(rng->end, "MD_RNG_en");
+
 	rng->clk = devm_clk_get_optional(&pdev->dev, "core");
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
@@ -218,6 +225,8 @@ static int qcom_rng_probe(struct platform_device *pdev)
 		}
 	}
 
+	devcd_register_core_area(&pdev->dev, rng, sizeof(*rng));
+
 	return ret;
 fail:
 	crypto_unregister_rng(&qcom_rng_alg);
@@ -228,6 +237,8 @@ static void qcom_rng_remove(struct platform_device *pdev)
 {
 	crypto_unregister_rng(&qcom_rng_alg);
 
+	devcd_unregister_core_area(&pdev->dev, qcom_rng_dev,
+				   sizeof(*qcom_rng_dev));
 	qcom_rng_dev = NULL;
 }
 
-- 
2.43.0


