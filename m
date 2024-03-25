Return-Path: <linux-arm-msm+bounces-14981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4F88A3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA2E1C3ABE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174C712C7EB;
	Mon, 25 Mar 2024 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CZR1ftg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E919668D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361051; cv=none; b=XmQhfLVnBYXgxnVX0+Y+mVkKjuALWu8UrnRPpzdifiZY56BrSsHRNGswZXhyq0l8gPN2dAbWW4pHIIlkTuAinSHxCbi/HpRhIo49jSW7+S0XHp0yTP6+iCmxel219ohb+7Hq6Pi+X7rSrReCb1Y/uI9lC00S/Ce+Vvguvvgsv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361051; c=relaxed/simple;
	bh=J5hF2soPC/xdLEap/3kEcAFYRK03cvoZcKZ5nHiJHE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AqQ5+Nmq13j707drxCCNiYWIdDHOx0e0RRdJ75yIJbI0Dfgk3j8aOulGYVHKDv1zBCrbt1x9xSqTHZjAPW4yIO7EGquE8DfWS0NxVpe2dDROrJjGyW8VcSj6iY6jWD5ExUkMHlaF15tgLzL5wtwG8MFegKUwDnzvuCn0vYqvjvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CZR1ftg5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512e39226efso2832172e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361047; x=1711965847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ng5BrcKH2u1PepcO4ehhcz1HLdaVac5+yYLHKNMA3sg=;
        b=CZR1ftg5D2Wko1j1swtb3f+OZ5PR0ioF1xiO8ZDMfPFBjuWxd8styaXrbVmFe7pzMg
         5oQnXKs5SYekWuPiquItREQsil+rJHOd7GJrOk1ZESR61VYYbMPSuGGXMl5R7KDGdqK+
         dT2R0Q1d3UNFMhgv2NQAXUGz0fuFv7v07wFztOaoMKinLfuo3GZCK0qC3ln8WsxjbwPy
         kICNqWdOewo8kVMN1rwHVz65hrUYHVuwg7+8cKsJWjZULtu2WT+QiYWWn802g2CvLvgJ
         VFyzGhTU4BpWY1EoQbDnFNIGrvW3BBvjtrbTP3YVaNi3TFz2PKarpIud4HRZaLGjV6Ws
         nrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361047; x=1711965847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng5BrcKH2u1PepcO4ehhcz1HLdaVac5+yYLHKNMA3sg=;
        b=P/+pX4jrV1C/F7IvVBmH7AHE4aXj5aePKaQ/0DoWkfEzBprj3DGfRv2m+uCgAVX5Sx
         DmLArCsfOaWrwre+KyJTtjBJciavBaQ6EohSGDCbsPgX+JQVvdsozY4U8F6qJJvfgo+G
         0QPlCAtUsY0cbk+ZxSzEqRBJswevaobEiqD07S6RyuPZHOFv4m99sh7C/UPqB8Q55JrD
         S02KIXL5mNDbOIKK2sdyrsssyWjPugYve2Ka+/zFRlRLHdMxQAsrCFHMomO/syIZdvwX
         NBA1oM4D+Fd0KVhn8K+jZglCJI2QWlE6yelrffw4XSz3fmM2MD3y9H6dvoCnvq1rSMYE
         LzIQ==
X-Gm-Message-State: AOJu0YzGVT+j0axxKNmFO+JajBZGmr4/2xT8mThyBukG5Bo17e/dcSB2
	seAVBVWy3V1rvBxcOM0QKu7gt9cq319Plmq2Fm0ifRKluYvwKgRd+q9yrDjqVNs=
X-Google-Smtp-Source: AGHT+IFEJpqqE6ui66dDlnqFDRywEMJTVQ3MapnxjqRVVRpO8lm8MMBDsWCpEajgc0lhG+7z2EIHIQ==
X-Received: by 2002:a19:8c04:0:b0:513:cff2:fe4e with SMTP id o4-20020a198c04000000b00513cff2fe4emr3935924lfd.8.1711361047092;
        Mon, 25 Mar 2024 03:04:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v9 02/13] firmware: qcom: scm: enable the TZ mem allocator
Date: Mon, 25 Mar 2024 11:03:48 +0100
Message-Id: <20240325100359.17001-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325100359.17001-1-brgl@bgdev.pl>
References: <20240325100359.17001-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Select the TrustZone memory allocator in Kconfig and create a pool of
memory shareable with the TrustZone when probing the SCM driver.

This will allow a gradual conversion of all relevant SCM calls to using
the dedicated allocator.

The policy used for the pool is "on-demand" and the initial size is 0
as - depending on the config - it's possible that no SCM calls needing
to allocate memory will be called. The sizes of possible allocations also
vary substiantially further warranting the "on-demand" approach.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/Kconfig    |  1 +
 drivers/firmware/qcom/qcom_scm.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 3c495f8698e1..4634f8cecc7b 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,6 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_SCM
+	select QCOM_TZMEM
 	tristate
 
 config QCOM_TZMEM
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 49ddbcab0680..ebb1141f8be4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -8,8 +8,10 @@
 #include <linux/completion.h>
 #include <linux/cpumask.h>
 #include <linux/dma-mapping.h>
+#include <linux/err.h>
 #include <linux/export.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
@@ -20,9 +22,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include "qcom_scm.h"
+#include "qcom_tzmem.h"
 
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
 module_param(download_mode, bool, 0);
@@ -41,6 +45,8 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+
+	struct qcom_tzmem_pool *mempool;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1815,6 +1821,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 
 static int qcom_scm_probe(struct platform_device *pdev)
 {
+	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
 
@@ -1890,6 +1897,21 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
 		qcom_scm_disable_sdi();
 
+	ret = qcom_tzmem_enable(__scm->dev);
+	if (ret)
+		return dev_err_probe(__scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
+
+	memset(&pool_config, 0, sizeof(pool_config));
+	pool_config.initial_size = 0;
+	pool_config.policy = QCOM_TZMEM_POLICY_ON_DEMAND;
+	pool_config.max_size = SZ_256K;
+
+	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
+	if (IS_ERR(__scm->mempool))
+		return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+				     "Failed to create the SCM memory pool\n");
+
 	/*
 	 * Initialize the QSEECOM interface.
 	 *
-- 
2.40.1


