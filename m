Return-Path: <linux-arm-msm+bounces-66557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDDB10C4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F0637B9CEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0192E3376;
	Thu, 24 Jul 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RHROcwon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B622E173E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365391; cv=none; b=dA6IvKWCkgf5+RtJW/Wm0Yoc1oM0TJ6AmX5iQ6q8kS07iirFI7WPCkhayW5nugpRzP+y57wd58d5Bru+iJ5wk0iAOPLKd4ZUst6EtzLfyNnBQQzyWNtScg9zB5g5AtjQWCYtzEIsiim3iIbInhT8lV3NnbOOvIR9OWYOhf6JKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365391; c=relaxed/simple;
	bh=Vzp3U7aGndkyJ82EgcFvHbZjMAKNTPgILqBaVa9ZKKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6mlB+c/oD91yH/Oui3jM+aYeV8xULmmjXz9EGrU4Bx/VCRvO9t+lajfx344cqhGb/TFsQgHAKLWJpM3d73OA1gx/G2Tk3jXdXPDI1VXT8JTLsn3Uv6XYpCEHv1QI14A1MmLbmIotaMPogUxDWNEgsN0cQRvKtXJP89djqnHfxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RHROcwon; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45629703011so7322105e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365387; x=1753970187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXG7080vUoTS71soVhA4Gbq56Ym56pqDEVpEhL2XCIg=;
        b=RHROcwon2Ud+HX/4JYfbI8AeIlRPuE37aGaORXuyjeuCK/5tKW2uS7682GhreQmJfy
         qSgjbAlw6xuO2e7ct5d6oRHucze+NlfN9iQuh/n9nVkLmQSo705NqE4p2jsK//pIXT1R
         FWR6LLd2cmYFXEebAjCGRR+N1I2TqAayaMGiXUNn0iudgrZLXParpU8hWN3n8bVbvlSq
         HofZDgHCJIKBBaZGQhprxt13iG6iTTDJrYWOtdsFQYzkJamAZrXBklaWNqmMzHOGbUpD
         2T2KJz5gkBfibeHVzVokkFEhJ8pS4WsK6UPNZRE+Y9DsNQlJI8e67jM1BpTQ8B4Tqiwr
         mYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365387; x=1753970187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXG7080vUoTS71soVhA4Gbq56Ym56pqDEVpEhL2XCIg=;
        b=kebHf7n2b6EHOP5OC+I37ThUJe2dC05KVlYi2/wd3957sp8qJM8HvMhOH676Xecy3h
         cK9+Sjd98UecCn8bDXeyXmMfw0s4ZFtdJEG9WGJj1H6O74E3j72pRFj9R2UoJ8xOD/nN
         yM6/s796So8t5g2po+1PIgzexHpGnf726AoGzNGts3H990T42UngcAxMBm9CrwKbY0Qs
         2HYtcskWVA3NEyI8V2DAnXqSgzIq7FCCgN7w4wdjLQz5zsbuxvijwt4HYXky5m1wJa4G
         iv114jsV2bcbGeU1LqVUE2rzKUYwQORa6zcj8Z37ICLkHVoEIEJu294tXy3SvUEPb7vH
         ZVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWZ/1mtyeQQNJBQtgWZ9Duk8D9hRRFG8Os2gen2NXBvfXle3igcfoBck0ZBSr25S0VcpaPp4OXdDTk3LAs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vNAWNVb4P0KNeK72FrR6pxFWKJ/aEMG7k62Y3GWA32HEz6ZJ
	nRYZTnZsKM0dfvtPvf3zWNPH0gSscMXBtKUB8S8+TPj74TLrzWI/w6jLpfTVFYTd4e0=
X-Gm-Gg: ASbGncsQPncZgOS714iw/yiumzgTzogeBQD8Jb0+8oY5kDCg5r15FfxyYkq+NNp/7gZ
	yxJ2Vg58NqYWKKQmxYoVqThqctVnIsrGjIiRYNWa/LKFV4M8HwY6hPVn9cnpbx7U1EF8I8tFChD
	SdCxbMHhZ1+8X5MArJQqKb+39HjnREc0oPnllL8GlBcz91wY08TFEqDG8yA0jhTY0bgQg5fnXGR
	myQJfRCd+WNJn+KsEmvBIeo6H1UpBO735YHKbhsYQeNkciYllQVX0VmbQxZjxa30c4bnye4hYBz
	wj6eDMkDkK54f6uH9YwweFn1cGozU5FLGFmWsCJPL88xNV0GacPNxaq0iS6UhG6mPCQUHKlJ1cJ
	d76PUIDy4PNf7WMxSiz/LjV+mJl76C2bFewVnH+k4pk31zFi1Z8FMi/davU9vfB4BR2dw7cGwlK
	lq+CBUYQ+G7OB7
X-Google-Smtp-Source: AGHT+IGoSF/EqSdGIwDb9gZl52m8tCgkgoHOuTGrpWGU+P8oq0e6jpOpRi4GM0HClIhflbnZpXQODA==
X-Received: by 2002:a05:600c:630f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-4586a7df4e9mr64595105e9.16.1753365387527;
        Thu, 24 Jul 2025 06:56:27 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:27 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 06/29] soc: qcom: smem: add minidump device
Date: Thu, 24 Jul 2025 16:54:49 +0300
Message-ID: <20250724135512.518487-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minidump platform device.
Minidump can collect various memory snippets using dedicated firmware.
To know which snippets to collect, each snippet must be registered
by the kernel into a specific shared memory table which is controlled
by the qcom smem driver.
To instantiate the minidump platform driver, register its data using
platform_device_register_data.
Later on, the minidump driver will probe and register itself into
kmemdump as a backend

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e..2aae0e696150 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0


