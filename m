Return-Path: <linux-arm-msm+bounces-38286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C49D216D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A01AB20366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 08:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34BB19067C;
	Tue, 19 Nov 2024 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hBsfJ3fk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB7E1A28C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732004234; cv=none; b=XnzQPV17LEiAZSzMCw8bQBQE9LDYDfg7CuWEDL5PiBx/RHOWGji9IHraAFXRbLGA20hf6MRSIzew1oBkjhZkQMinGrINaPaJe9gtgdnnIPft2Gkzys6orPYQgxRZ5ECbi07RSnOjOrMa/3ZtnIeO466L1q4YmyDCiUCNo5BCmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732004234; c=relaxed/simple;
	bh=BnCPo5Jv3ffjYxxYM7XQApvz+ShJZ5fwcjW9lNQ732I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L81bj4prLNjoZxNlb7AA2CPpJ0gCmBFV0f/SWOpwpM7mwYIT4StbtkTp+zhMN9rF953MaFjO+oPlWEhbVcDD0NNek5Ja4s9HG1QtQ1Tq/a3cEs+yRvJfQGFpYhEUevi6fM8WJol32SZYrZLV0uD6VeErRuhH9Gr+I6K3A7CjSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hBsfJ3fk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso29023875e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732004230; x=1732609030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfRPeJv9b+5MklHMVSrCiVgH+hmaDNicfWnfjxpRi08=;
        b=hBsfJ3fkcRev0UBJAESJpGI1GExIH+pLIpoftUVNorahap0tUiY+OifB5+VwG9/xAM
         DMhZ6NiqkvcnBeyffDttRmd+r5hdwYTqzpkdjoOMZeKqXdC0Dae1OY016yF4k44scINM
         Ax48Tv710mM90gIYebKuUxnhZbWhDGX0+IHRuKuTnc/ACIcqrQ9a0Pjd/kJxrPoYCcnf
         j2t4c2c7a0feRi8XQbn5FAe2Sm7awxcnvC3G5vnbFVLB8fqzG6Je9YK64+hgL49WvK/a
         gzxIU3BFA8mZWfuc+sdHDobwC0TKayZQbVzJ32RNVwCs1xo7r863ui8d4m04QJLji86l
         WuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004230; x=1732609030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfRPeJv9b+5MklHMVSrCiVgH+hmaDNicfWnfjxpRi08=;
        b=NtNaZbS5gfvTPOJoj99+bCTooxsSSccWsIiOrflAFj6q3drvTDyCRjzks3o/tKR1Q8
         R1etHSVvbc4LLbw+bjrHjUS9iKY69WFIrCOlJB7G1TI7QXalTR4P9Yphi7A8J6VjNnEr
         eOokTCwXVCSkFh0D/rioLxgy5rp4bUosRbYInITgKMQT9iqWy5zwka3gjAsbzXzdKdgN
         IrrQDJGy5H7EnFk3/W6yn2VAFxgpGuqGnxjtok3s/RtqYVusGHo3dn3LkBKbYn2Tw1sR
         uHGM+zrfmbf8IH/5YyAdjHks42X6eMKwnV0zbJnPv6pRe9SbuHvm0x5Kc3A6eqT9FORT
         6IAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZMyqkE+WqJ2gsDMePEvxXWlCa2tGP3oksAK/LrYZsbVnEwDLrFKddkaTHlYP4c+wk3XWLuzErithBKie1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr5vJ8veAk+v3eXZbkQtVT+LnRwYnyRfqZYU6TiWE+hwxw/Cxl
	zzsPT2x1K+c23usdubnGnqZbCNv35Tojp0UTPRQGK3kEorjBrifzd08kQni/i0A=
X-Google-Smtp-Source: AGHT+IE8UC5xo/EXauIpi30O/6QpEs3dvAFOyd1qOQ9SCqrRP4JGzhvWxQ0rNGF/bwnRQGTw1YZ6JQ==
X-Received: by 2002:a5d:6d82:0:b0:382:484d:45da with SMTP id ffacd0b85a97d-3824cb30e81mr1673211f8f.6.1732004228585;
        Tue, 19 Nov 2024 00:17:08 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:9b70:ed4b:d274:54e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38244220183sm6495288f8f.99.2024.11.19.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:17:08 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH] mailbox: Switch back to struct platform_driver::remove()
Date: Tue, 19 Nov 2024 09:16:51 +0100
Message-ID:  <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7380; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BnCPo5Jv3ffjYxxYM7XQApvz+ShJZ5fwcjW9lNQ732I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnPEl0l82yWH4cD9PUDIPfKIE/RnbW2FKHwIBNo NRXP1KykqyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzxJdAAKCRCPgPtYfRL+ ToaTCACO97vvz1RQ3OfeVhaCoF9jIByuwurbxrlo/e4TXGjXh2MD85LTlsW7X/pdlEpXrP7LStP rubeC1o9FEsFEJDpzNVhMoNb2mBLHniaqeivaaIITO1C7iOgf/7l6bUdNF6szQsgsyIOa7eK+h4 6Evgz1M3LBYLhtZcwyCg8pysblUX/f+7Bpgdzo1ijgQjhinFHE0K8ep6xD7n3F0gZTUEt/9QWEa fgoFuQD5sY05UOOOvRjFNRAkpP+8qV6HYJ8eSFoFVoVvAsSuYcnfHR1oaeC82Zdgm4c4nHE4sye cAgefJza5W4P8GCaVvE9A7L2tHfGs7DQoQm1AUVXBMxOcDDU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/mailbox to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Make a few indentions consistent while touching these struct
initializers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/mailbox. While I usually prefer
to do one logical change per patch, this seems to be overengineering
here as the individual changes are really trivial and shouldn't be much
in the way for stable backports. But I'll happily split the patch if you
prefer it split.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/mailbox/bcm-flexrm-mailbox.c    | 2 +-
 drivers/mailbox/bcm-pdc-mailbox.c       | 2 +-
 drivers/mailbox/imx-mailbox.c           | 2 +-
 drivers/mailbox/mailbox-test.c          | 4 ++--
 drivers/mailbox/mtk-cmdq-mailbox.c      | 2 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 drivers/mailbox/qcom-ipcc.c             | 2 +-
 drivers/mailbox/stm32-ipcc.c            | 2 +-
 drivers/mailbox/sun6i-msgbox.c          | 4 ++--
 drivers/mailbox/tegra-hsp.c             | 2 +-
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index b1abc2a0c971..41f79e51d9e5 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -1675,7 +1675,7 @@ static struct platform_driver flexrm_mbox_driver = {
 		.of_match_table = flexrm_mbox_of_match,
 	},
 	.probe		= flexrm_mbox_probe,
-	.remove_new	= flexrm_mbox_remove,
+	.remove		= flexrm_mbox_remove,
 };
 module_platform_driver(flexrm_mbox_driver);
 
diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index a873672a9082..406bc41cba60 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -1618,7 +1618,7 @@ static void pdc_remove(struct platform_device *pdev)
 
 static struct platform_driver pdc_mbox_driver = {
 	.probe = pdc_probe,
-	.remove_new = pdc_remove,
+	.remove = pdc_remove,
 	.driver = {
 		   .name = "brcm-iproc-pdc-mbox",
 		   .of_match_table = pdc_mbox_of_match,
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f815dab3be50..9889e4d0d9da 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -1120,7 +1120,7 @@ static const struct dev_pm_ops imx_mu_pm_ops = {
 
 static struct platform_driver imx_mu_driver = {
 	.probe		= imx_mu_probe,
-	.remove_new	= imx_mu_remove,
+	.remove		= imx_mu_remove,
 	.driver = {
 		.name	= "imx_mu",
 		.of_match_table = imx_mu_dt_ids,
diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3386b4e72551..c9dd8c42c0cd 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -441,8 +441,8 @@ static struct platform_driver mbox_test_driver = {
 		.name = "mailbox_test",
 		.of_match_table = mbox_test_match,
 	},
-	.probe  = mbox_test_probe,
-	.remove_new = mbox_test_remove,
+	.probe = mbox_test_probe,
+	.remove = mbox_test_remove,
 };
 module_platform_driver(mbox_test_driver);
 
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4bff73532085..bac5b8eaa665 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -796,7 +796,7 @@ MODULE_DEVICE_TABLE(of, cmdq_of_ids);
 
 static struct platform_driver cmdq_drv = {
 	.probe = cmdq_probe,
-	.remove_new = cmdq_remove,
+	.remove = cmdq_remove,
 	.driver = {
 		.name = "mtk_cmdq",
 		.pm = &cmdq_pm_ops,
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 7d91e7c016ba..f0d1fc0fb9ff 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -167,7 +167,7 @@ MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
 
 static struct platform_driver qcom_apcs_ipc_driver = {
 	.probe = qcom_apcs_ipc_probe,
-	.remove_new = qcom_apcs_ipc_remove,
+	.remove = qcom_apcs_ipc_remove,
 	.driver = {
 		.name = "qcom_apcs_ipc",
 		.of_match_table = qcom_apcs_ipc_of_match,
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index d537cc9c4d4b..14c7907c6632 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -346,7 +346,7 @@ static const struct dev_pm_ops qcom_ipcc_dev_pm_ops = {
 
 static struct platform_driver qcom_ipcc_driver = {
 	.probe = qcom_ipcc_probe,
-	.remove_new = qcom_ipcc_remove,
+	.remove = qcom_ipcc_remove,
 	.driver = {
 		.name = "qcom-ipcc",
 		.of_match_table = qcom_ipcc_of_match,
diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 1442f275782b..4f63f1a14ca6 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -379,7 +379,7 @@ static struct platform_driver stm32_ipcc_driver = {
 		.of_match_table = stm32_ipcc_of_match,
 	},
 	.probe		= stm32_ipcc_probe,
-	.remove_new	= stm32_ipcc_remove,
+	.remove		= stm32_ipcc_remove,
 };
 
 module_platform_driver(stm32_ipcc_driver);
diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 3dcc54dc83b2..6ba6920f4645 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -307,8 +307,8 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.name = "sun6i-msgbox",
 		.of_match_table = sun6i_msgbox_of_match,
 	},
-	.probe  = sun6i_msgbox_probe,
-	.remove_new = sun6i_msgbox_remove,
+	.probe = sun6i_msgbox_probe,
+	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 19ef56cbcfd3..8d5e2d7dc03b 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -951,7 +951,7 @@ static struct platform_driver tegra_hsp_driver = {
 		.pm = &tegra_hsp_pm_ops,
 	},
 	.probe = tegra_hsp_probe,
-	.remove_new = tegra_hsp_remove,
+	.remove = tegra_hsp_remove,
 };
 
 static int __init tegra_hsp_init(void)
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 521d08b9ab47..91365acd334d 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1015,7 +1015,7 @@ MODULE_DEVICE_TABLE(of, zynqmp_ipi_of_match);
 
 static struct platform_driver zynqmp_ipi_driver = {
 	.probe = zynqmp_ipi_probe,
-	.remove_new = zynqmp_ipi_remove,
+	.remove = zynqmp_ipi_remove,
 	.driver = {
 		   .name = "zynqmp-ipi",
 		   .of_match_table = of_match_ptr(zynqmp_ipi_of_match),

base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
-- 
2.45.2


