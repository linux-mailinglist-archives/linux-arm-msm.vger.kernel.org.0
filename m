Return-Path: <linux-arm-msm+bounces-1139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 529377F1436
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0B01F244DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598D91A5BC;
	Mon, 20 Nov 2023 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zyfj7ofZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCD9113
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:27 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso55257221fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486486; x=1701091286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkEfLIdUazWHVoS/f6N40pGJ+r4HD9QT8ToB//6WjKI=;
        b=Zyfj7ofZwS7iS1mWlAnlUqhothV7z3UOni/InFGgsOrPAHLPr7P/YdlwaFkoejAu9X
         5P6fMbpBmmYU+lFxzfFZbvoDxt1jcAYSmbjEGM3YPpF2GMUQCbyDvIIut0/erxQVO9PA
         fL9MUYSAgRvpN3LSRvKEPNgisi46bi5DEJsO6RnF+/59aLzkFaeTarVNYrdDUbJMmRAZ
         nalhVqx35UEcSJPZP/lfDX9dTwfQsTqJOE+xAu9EJw6ia5O8gl0Da8L2dEvpL/tHLJgv
         +yZVWBJoKX2nB2f2TKTQub55f9G2r6NnXZLbOM3ivcES8H4nG+pZA3a9QgKDK0qt2ASa
         bC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486486; x=1701091286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkEfLIdUazWHVoS/f6N40pGJ+r4HD9QT8ToB//6WjKI=;
        b=mi+NGmiAtyOC7c1CmP2VrcnT3lG/3HudF7vmwRe5RYZN/5qRtxUviJkQZ3l5mfM7Zb
         tBncFVWhYw24vY+bdZr04forpXuWx1aCbmsJ3kI+0sJs1++4IaeJkZ0WUmmiIyrxyzFE
         SilLt82bmeG9JNdYCh3fp+7PdpCDPgfdVpYXHc5hxHzOeBTWbWx+49Epf9Ki43n3Ytyb
         ytXr+zRX8cweHYiWrc8XFOGaMPL9qRGP4Ptm/c2GN9tpUi0vhRJLZtPy9TiSQ9e+OYBp
         fO4qUZd81ApU/MHbaV+HCh4uDqHq///+yrfkmFujbLlGVaRTnbdFTyJXLC633qdmtHkT
         0GFg==
X-Gm-Message-State: AOJu0YxTBBiDh6yXeAVSlu6lIuvGEe32yojyK0AKneaLpdgP2RwK8Q2A
	LaVDkphutX/NEgHQaFItsucJHg==
X-Google-Smtp-Source: AGHT+IEBg0sWYKhteHNNiZo3z7mEwGggZ0vD5AkS67yo3o29/vLlWBE1OhJiPSA9zC2rfiAr5nuNjA==
X-Received: by 2002:a2e:9008:0:b0:2c8:7176:1727 with SMTP id h8-20020a2e9008000000b002c871761727mr4806408ljg.5.1700486486135;
        Mon, 20 Nov 2023 05:21:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:25 -0800 (PST)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v5 02/12] firmware: qcom: scm: enable the TZ mem allocator
Date: Mon, 20 Nov 2023 14:21:08 +0100
Message-Id: <20231120132118.30473-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120132118.30473-1-brgl@bgdev.pl>
References: <20231120132118.30473-1-brgl@bgdev.pl>
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


