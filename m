Return-Path: <linux-arm-msm+bounces-20609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF888D009B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715F92861E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E28B15F3F7;
	Mon, 27 May 2024 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eIWfyzc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE515F318
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814611; cv=none; b=myInGTucWUT+hTtzZRgGxXqVIWZA612lAgI7dkrPUu7DNshA/Nryti8O4mFlb1xN3SSgD4U67ggEOaPcofCoHgraCpyBV11ZRy4mB3m4S++keAmvt+XJemVp8JmHSWiNuX5vPdQh5Cobl+MYAXj/LouXavsW0FU6jADDUO8Safk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814611; c=relaxed/simple;
	bh=IA58S7AdH2xIYDhZoMKljASxiGtz51vTFlKP2HHrFAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=md8Tbl/y6qPi17WP1Bh4MZL+e6jvux6uWsTBqNMfk93+fs/S5i5ux0SLe5v58y28G5Dytt/AfZ4LGueeD0kaD8aGtY/PD/rPKJqPoRHctYx/oW8oMaedkxTIJzBug+IKpLwRn/asMkOZHQRmmGcm4ULznU9d/XK7VY3+ZpbV6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eIWfyzc2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5296232e00bso3391482e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814608; x=1717419408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+cLvo74QVnhzgz8Xflm3n4b7nMWc8jqZkEXgEWJK9g=;
        b=eIWfyzc2lSJ9dhhYPhYFEns2D7X6p61dsDcIb4gREKnVCEB3vO4gP9KuGqWqtTMnia
         Y6ZQsd783v39LhHkAdk4aM6YsCHyOmnqt2wq7mIaRUD/zSSH8HPEMbCn5d3v3KQl7Gbs
         ifXN17WhSxW/fgvJueOCdkKC7Us78R0l0Z4AoW4MaSBtVJrxjm9PmqSjzRM6kjaDZDMh
         6Tu7Cb9KYhlyIYn/SqbgVrWOW39cMZv1p2B55aXgEihcxj40S9hfgA5XaFNWUDKTF+di
         Tgb8/Cj8rb6cHrAZZ132Ow8zomumW7KxH3Ks0S6/sGxrEm0dV3MutUStpt7yigejMBbN
         +oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814608; x=1717419408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+cLvo74QVnhzgz8Xflm3n4b7nMWc8jqZkEXgEWJK9g=;
        b=iZzPdLvdN9toi6ETjEQ5/GB/VdGp3EhHvczDCtknzqlhdmOA1OUYFmp76iRKb3r6JC
         d7ZDRWcwoeuwx7QqvYwZC1evqk87q90oUPUxm224dB/AcjW+PnO1OHWUCLJ0YMH47ly/
         uGm1Pzpdce2hbM0p2JqFwep6NrbfkvBZdvSrEaipXJucuP6/KHdU5ch04y26FFG/vCto
         6D5Y7LtoWPpdeZ80r8YIzlSoTt8zGPfonAqLStYWVAp7EKccsw803vBagqBXC24KPC/k
         ZdfvMxtNH8DHuzgj05IiMBAM5yudRgma4yixa0xRW19DLVANJZH4eDNuWOKKXOkAp0nT
         kIXA==
X-Gm-Message-State: AOJu0YwEO7fyEY4jkD+Po6esC8SnHFGmLVfUrpduNIhcayqFap+TavQ8
	ynJgfEFQRvaUsL4n/zqX3F9m4xEcrUOqiDJ14/ORxVeVbZQeQfdKHQK8jRogNQQ=
X-Google-Smtp-Source: AGHT+IHQ8ItaW+iFK5OlRvGfWq9EA4HNWzDi5E9PtyhLZERWJa54SDX5gErpbt5Wh8NI7hgohYlWHg==
X-Received: by 2002:a19:8c07:0:b0:519:5df9:d945 with SMTP id 2adb3069b0e04-529642048d7mr5320820e87.4.1716814607620;
        Mon, 27 May 2024 05:56:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:53 +0200
Subject: [PATCH v10 03/15] firmware: qcom: scm: enable the TZ mem allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-3-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VMZSfmk3eqpWY9NL2dFp3h21LWVeHTxpNDflrZ1eZOM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMITyNKHp5skdmBs6KrCE/1XNv7+uwrxG3r+
 wU+iovCRPOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCAAKCRARpy6gFHHX
 cowGEADgV7KVfui358E++tzUTQN3sMCwCUSy7jyWtCxHOOyGfyLAH9Tyy54loxpX2KuPJMAp8XL
 3TNTe8VbUq8C5btZUZzivDiObnKDb/r6mKy0VIIXmzCTN+R9tpPVLCYrnsKTFgRkchSXqT6pVkH
 579wmhzUMWRDSMMhgLRG32LpWG4lfeCqpBTUzt+A4VuN/y7MRO4/LD+0cpa7RKiYRThG8UgEJf/
 nqkOR1fEP8rarhb9NCd+su7Xid31VX6Nmhe6d+6tkGLo32UDzVpJvC9CULkUBPRE41TIuvqt8WM
 GWTVtDYOe/23q/PBQTAr9RGjoiHbw5LeiSpGYxOAHivq3F3Lse81h1jm9+24g5x9azaePNN2fx5
 PuesDthSkdfBdA7BzHnru6p2XTNIl0xWbQJQbNiDVBoUJ48sm7DoVWvbKJzJUvmjsoQlfNfpNFF
 MqDzdLyRM3MkJSvXFACc/YmBNLrbzWrQOcMiRYPOmSVdPMHNZYPYLDnJaG0MT1aVvZ4hHOXE4/Z
 Q/nRTUop3ZZDiFCw5d4t/CyPCiU2z6Bpv2QpK+sCw8kEZZdaE366AdJPlUQRIleN9/VLUVGQDiU
 MJGkTnIkIo3nppSe/UgvlzBQ5ETN4O9jRFGLYkAYCaspvnvDx7CasHvjI60bit8IemPFj7aXYep
 v6XkJxmG2+pp3lg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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
index 68f4df7e6c3c..0e7b1813e4a7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -10,8 +10,10 @@
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
@@ -22,9 +24,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include "qcom_scm.h"
+#include "qcom_tzmem.h"
 
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
 module_param(download_mode, bool, 0);
@@ -43,6 +47,8 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+
+	struct qcom_tzmem_pool *mempool;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1810,6 +1816,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 
 static int qcom_scm_probe(struct platform_device *pdev)
 {
+	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
 
@@ -1885,6 +1892,21 @@ static int qcom_scm_probe(struct platform_device *pdev)
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
2.43.0


