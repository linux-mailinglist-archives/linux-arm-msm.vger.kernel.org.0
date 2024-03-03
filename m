Return-Path: <linux-arm-msm+bounces-13169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA8286F59E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4526A1F21EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8691667C4F;
	Sun,  3 Mar 2024 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mml4Wgv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2BE67C41
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478088; cv=none; b=axb+MJFecwOuqlGaBkh3IdYRW4wxATdeG0dgdOfno/ZMr1/NH+PbIu8y9ZcpAhEE4+VbWEpNG+dh/9ESKO1WF4zi5570AghkLyVw3pBeolcmevVH55NJr3uQWH3xkja8vJ5dQ8u8hkC4Gaz/OX/RE7vXI9E8RtPU7Nvl8rlH43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478088; c=relaxed/simple;
	bh=dhPHG49+UE+Xhs0MBAhilLHAVcEDT01o86GHYILdoTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FAOAvil6o7l2XmSMPoDZdcBuXNBySxjmLaEJMIoM6es0/zTnWeJsepEpH8GUj6sOdaXBPDgCxbikAq2rdXFAd5S0qOrLqlZxKxg25M9y7e/TZBmLi5gJhuZAGwO1YtAs8o8X4iRnuu163di5pVxwmmY+Lu5/E4ufnjV6eRdXAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mml4Wgv0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56533e30887so6287675a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478085; x=1710082885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f0fZ+mvuobwqRmEJ6FMeGs/lhMedUb8b4lbCQGk2+4=;
        b=mml4Wgv0Ypl5SBnNTihue0Pv3SdkUH3/qaPF9qiX9UmRnU1W2NsFWOsudabBxdN8lm
         XXdHdONYvL4RrfrbuG2PvrUMKRyBU5u3a0A10ZP77gbeiMPfPgUwDg6j+qr9Qghh0ymo
         PGwNXiTizw+voRbnzUYAOM4m9xTVugkpSW8b98tN3nTnN9dIm/9pskJanO8aoKBtwmW5
         3K+NGjpPOaXNI0Zciu695Q+cwPaQdBafKPd1s4czAw8AxXapiN8rjQKu9xSCXvgoTAyv
         QqfhTYdr0rbth1b3dTrZcy0qe0LpWPpMIU3L6Ck5+rzB4bFvxj31b8QrDhZjtjR5zoen
         u7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478085; x=1710082885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9f0fZ+mvuobwqRmEJ6FMeGs/lhMedUb8b4lbCQGk2+4=;
        b=oM7KjYzSl8MOnvr4KsoqXcJhg6RT24mEfw4Z0I5wWKZGakw224HfUT3eQYmBounMV6
         THMkZKVjP3bAZXq7E6ml0+XQf8wrB9E7rVMuAsU2fr3jaNTJTqR28Bru5ARDDQ9tfIxe
         Xo9gj41r541GmmOgzxaokSKBNjilFnT9TXlTrH8EOsT0B4URtXLKkUfml/K4FET+cr/+
         8azFT6j8RPnN1FZ7Zgtn7w6R9uDP0eMyRkCOkQT52xnE8ds4O1wfJ/OtmMbxyYsElcgJ
         uYMloImAJKN0dLcvLo9QkIP7+IGuYnAe39EAimez7Ytyl4a7oLyiD5MCvly8XumEHTxH
         gnyg==
X-Gm-Message-State: AOJu0YxnKCHcVghRYGBR32O49vDm0Wxpo4066LyG7KQ7dmeRd6IyWAA1
	/odlh+DJECTpFsGWzGoVkIsnn11g357l0PRldGg/6zEKDl6aTqcOs+bnG8NU5I0=
X-Google-Smtp-Source: AGHT+IGx+UAn5om3k3T5rx4lM6IEAlIbTzf7XS1OK8hZ2qhS6tn94N+XdFsJhI4ljzF0dHMof1lz3Q==
X-Received: by 2002:a17:907:7677:b0:a3f:98e4:7dc9 with SMTP id kk23-20020a170907767700b00a3f98e47dc9mr4853658ejc.28.1709478085081;
        Sun, 03 Mar 2024 07:01:25 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:24 -0800 (PST)
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
Subject: [PATCH v8 02/12] firmware: qcom: scm: enable the TZ mem allocator
Date: Sun,  3 Mar 2024 16:01:05 +0100
Message-Id: <20240303150115.133633-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
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
index 520de9b5633a..2245ec8278e0 100644
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
@@ -1812,6 +1818,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 
 static int qcom_scm_probe(struct platform_device *pdev)
 {
+	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
 
@@ -1887,6 +1894,21 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


