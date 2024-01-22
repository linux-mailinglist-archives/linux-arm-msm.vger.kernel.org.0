Return-Path: <linux-arm-msm+bounces-7753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D37835F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87CB81C22E06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3623A8E2;
	Mon, 22 Jan 2024 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s+pGJGXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF793A27B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918931; cv=none; b=LFdBWPTB5Prf1Ccujg9wlyd16DrlmDk608yrSPsPE8ALmytmXZQh7wFuUluAi+aWDrRUnq8Zmquk4KHmTVxDhJsFObvt15G78Yu3ZRroUQ68Vv1TjEcjhKuBCGCfq9cRHp3M5FUsOghifchy6YtWIqbFv+b+zn6GH7+JVLLOOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918931; c=relaxed/simple;
	bh=hyEoF9fCMhuezS8hoWdU8yT9CIhZtGGianlM890PKm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CruslI+2BfjrW3Uce+EDGMWAjaTlX3umJ3eAeqPYsNR37jHAbjKv+H+vSJ1XIagBD+1+u3by0dqeKJwN0nsZ0A5KlD7CnzUMhPLGMlg9fCOcz62nZAB2+GUj+fTHInxE+AHrMw6y7S15S7JEn9wyVsFKxZOxnUM/ahO6pXSCw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s+pGJGXm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3387ef9fc62so2817033f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918928; x=1706523728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Xo+3rW2/GniBJfX+Sj7KlIfHlCcTjykgBLMr0N5dgw=;
        b=s+pGJGXm60PjtSM7zp7aJy9ZH0waze2BXMXrlo4miBfL2wZMgIz7r+QE/3oNaTY+Tl
         uvrBO4X7M6QtncnwWMVw2X4XptrrrDI6OpjVFMdmf17pbq+vN5xQZCzmvgmv6JNsRWMb
         9/rnogDQiLAsQIwsB7g2MK+DtWdqPEuuhUFfIFD17NHVCUnrFBZ5jQRAtJCcrYPTYPWL
         eJBb8z3AdR9ipd3PwMl9KlFu/MPtuybrkv7yRAgcfv4GtbgQdA5YeHEOpLEBycGmDxUQ
         2neTsaPEhFf62bpEGfg/ew60t3Z4P0aLDLzCn8kbQh8jnhdCzUlDQS7QauBd7t3Hw9+R
         +r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918928; x=1706523728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Xo+3rW2/GniBJfX+Sj7KlIfHlCcTjykgBLMr0N5dgw=;
        b=Z4K2jCrF7b9VX8f4bl/gwKDwGR+cHKFgjy9drdNe2Y7YypZPJpH/V6njNLu10RgyRE
         fhuRmGtzjgVwVEt8fwwvjF+D5bKD3CBhGo6vjgL8rl4acikgGVdo5KM01p2/XTtR0N0D
         s8I3NFtibGYfDFxvot4zIruGYX+CyEobsxSZIuydAy7GFoXHVJtmNNho9XOGqbKpIs9S
         bwn6syh+p9k46JJNnQaNAxeH5CQOH/fFkfzLA7KiC4wRT9XkKovpdFYYtViWNuEFRYm8
         TZBRNHFWCyPENNv0/zpA6DHsxtXhIwGfE33dmuY5F0Pqp6gUlqJZWtPUlFzUJVy3Kg79
         tWJw==
X-Gm-Message-State: AOJu0YwXMuq5H7BO8ygrvy39PMFWs1LX5eu2b/K97jZqV5Kl2MiacATX
	3RO4AQ+NaxbZqX1LJuu0Zj/VofteNgJCYBjcs+xbctU4/rL36+NJecam6+AFjaw=
X-Google-Smtp-Source: AGHT+IGbvfgWjlKT91yD/2mxr857mszRjDG1tRRSzICku5wC1rFULpFkLCee+kNyE6DMGDeinrJV/g==
X-Received: by 2002:a05:6000:11c5:b0:337:d535:2310 with SMTP id i5-20020a05600011c500b00337d5352310mr1672712wrx.139.1705918927723;
        Mon, 22 Jan 2024 02:22:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:07 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 02/12] firmware: qcom: scm: enable the TZ mem allocator
Date: Mon, 22 Jan 2024 11:21:47 +0100
Message-Id: <20240122102157.22761-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/Kconfig    |  1 +
 drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index b80269a28224..237da40de832 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,6 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_SCM
+	select QCOM_TZMEM
 	tristate
 
 config QCOM_TZMEM
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 520de9b5633a..0d4c028be0c1 100644
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
@@ -1887,6 +1893,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
 		qcom_scm_disable_sdi();
 
+	ret = qcom_tzmem_enable(__scm->dev);
+	if (ret)
+		return dev_err_probe(__scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
+
+	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, SZ_256K);
+	if (IS_ERR(__scm->mempool))
+		return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+				     "Failed to create the SCM memory pool\n");
+
 	/*
 	 * Initialize the QSEECOM interface.
 	 *
-- 
2.40.1


