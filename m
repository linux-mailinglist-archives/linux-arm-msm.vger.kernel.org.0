Return-Path: <linux-arm-msm+bounces-85773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD73CCE759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5814D308A3A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB2F288C34;
	Fri, 19 Dec 2025 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCvqSzvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F429B200
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118884; cv=none; b=cUoUot9n2Figkmr2OTkK8XtMPBNY6LuOiDtNw9Ku7qeExCdcHurhVY3r7jqckTMB/pe9XjGL45wKVYWIxAFtQyWlRSs5w3Ql2qWFBO+1OKD45VREwHit9OABdYybTpIOneIpMIO3qP210cesyKFcatPZbwKemiQlti4wzt5yPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118884; c=relaxed/simple;
	bh=bdMEo4uEw4keV7imycYpVrULG0tvoTIK0I50nmEWq3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F34Bs/qCjnlw5jDsiAy9UFfDwyvlKOqvFkTgpvfpRuiOyIE0U+9v4diPwImVbAUZMMbCOaQzNo9u2bjKQALyACp9F2Bg8axtOFfVg/a6mNWiObP93iJubBncFYebRLih8VQIWd7M9EziiOyyUaU+t1x3LUtliReH2kcmDORKi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCvqSzvt; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78f89501423so26961577b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118880; x=1766723680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aKpuwK8ek2NbH4AWFnKdemkwvoys762HaRuVDmW618=;
        b=WCvqSzvto60ZFLDkxGtrr8myv1kt2l9gL6n2QY8NItillHGicjp1Ck3YCs0nmeAWta
         ODnLDXklTPQCCjYQ6FHP8UqTzWsyPH+DOpVRQfn2SgXkvVlba1fhIJ+hxTOk2AGj4zFF
         ueekHMi3pYnNE3BdDGtZbq7qvx5C+e56pcfiyQduWXn/H5H2SaaC0C/ChP824tzjtz4S
         lvPH/JaTxh+0BKbIyOXSVR2kPHfITT+CITF4pyUIHXuFzi4Nl6kQ7zSAf4McdOXFKShj
         6VAoG5S8sZAH2BGvhQs6iIOo6zQVfDXoJCYSgpxa27+waxiZW8dTr+p3uQhdFwZ+LIRz
         1+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118880; x=1766723680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+aKpuwK8ek2NbH4AWFnKdemkwvoys762HaRuVDmW618=;
        b=seoBpTn7hUPF1tDvLHLWGyBckS9gnlCLGtqCQfUSyUh1MlRKUq/ggMp6NtAR6HJOTY
         fZSLcfHLbAE7L+2fIf7PIm8QmAXlRxTI2bQgx9TpfQeMK3kNJaANWbNbMrueHydUGpYD
         DhRYZiniZSQrg5wdBroe4SeOCX0JXN2Droua1Yk5zxZaGHSWHq9FBio7G5VgdGWa/zoZ
         nS0F91EHk9Rg28hgvYyLBAZIAjEnk72QVXETDqErcLPtgO+wZaK9Q0GTmwV2U8dVcNQr
         A/lUPDuiO417IEmwCwMbkD4qAX86hYgDC3oo2VNpTYJYn9aoz5/WHgy8Rj5STL4wsrVY
         um3g==
X-Forwarded-Encrypted: i=1; AJvYcCXTCSX6fmcXEfikw7YbN1TYgd+fQ9WhZAV6B3e8TP3fZohQR3oVxPUPkxGXKeyd+gxPNMVljMtW+Jw6lT/G@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGtfV8DLci/D2JjvibwBsVNREjhzbcN4pG3vF7QdmA0iDe8E9
	bJ61YXdmTON+h2ex89P8PaXUMFMzgCdG//eQBPwF7nBKrS9gcszA4VbT
X-Gm-Gg: AY/fxX5UUW+0VCAEi5uW3CviEeCeokrEXw0CgTLL9knipxc6VJPRQawOMQ+LLaHvjUz
	FGvIZjjwpZYsl8BTnrmtMQCPR3w9YuBA70UXmkscbtKZeSavHBRz0w9rRE5lkGhq3xV7uiHxKwz
	sZ7+j/zSbjwZ+gfb15fmUXfSpiiPHzlwzyezBxBsJ/anyktkhFh3dVeCSqvFYJXXos2UrqzuRA2
	lnxpFkEKCegv2EqHHcn05LOLqqtt7E+h3oBqED+5osCxIfcfE6jewBBh2G8m44gqpRsbfz1EEoR
	xdj7pYPd+EJ+bWb/jf58QW/5gKfO9dFGqQyg04fdZXbFkMOHNnV52Y8528NkhD6l1xw5xV1mEZN
	iyUARCLM4c+FltxbmuaB2zcH8Sq2UE0jJscdR0ZbO58PwneX5VWuF55Pa2gErmVE8mEDAmVn94a
	+dH8e1DcnPiXaebLv7No1p9zDa4EekstlhXHSCQDBXA+HFuToN3/lq9xNjj+JsdmezQNZFrq8D4
	Tbvg4sHCrSGe58KVDwUkMP8XZWL
X-Google-Smtp-Source: AGHT+IHA788AI9tvJXH6wsn793uK6OCkUvXgrMkaQNm629WOyrL9weYZHjhWgtxDGSqEyjpSVnLE5Q==
X-Received: by 2002:a05:690e:4086:b0:63f:af0f:aaf with SMTP id 956f58d0204a3-64669d2a06cmr1477472d50.1.1766118880283;
        Thu, 18 Dec 2025 20:34:40 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:39 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
Date: Thu, 18 Dec 2025 22:34:14 -0600
Message-ID: <20251219043425.888585-6-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Q6 based firmware loading is also present on IPQ9574, when coupled
with a wifi-6 device, such as QCN5024. Populate driver data for
IPQ9574 with values from the downstream 5.4 kerrnel.

Add the new sequences for the WCSS reset and stop. The downstream
5.4 kernel calls these "Q6V7", so keep the name. This is still worth
using with the "q6v5" driver because all other parts of the driver
can be seamlessly reused.

The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
register. The second set of clocks, "clks" should only be enabled
after the Q6 is placed out of reset. Otherwise, the host CPU core that
tries to start the remoteproc will hang.

The downstream kernel had a funny comment, "Pray god and wait for
reset to complete", which I decided to keep for entertainment value.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 241 +++++++++++++++++++++++++++-
 1 file changed, 234 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88a..b62e97c92d058 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -31,8 +31,13 @@
 #define Q6SS_MEM_PWR_CTL		0x0B0
 #define Q6SS_STRAP_ACC			0x110
 #define Q6SS_CGC_OVERRIDE		0x034
+#define Q6SS_BOOT_CORE_START		0x400
+#define Q6SS_BOOT_CMD                   0x404
+#define Q6SS_BOOT_STATUS		0x408
 #define Q6SS_BCR_REG			0x6000
 
+#define Q6SS_TIMEOUT_US         1000
+
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
 #define AXI_HALTACK_REG			0x4
@@ -67,6 +72,7 @@
 #define HALT_CHECK_MAX_LOOPS		200
 #define Q6SS_XO_CBCR		GENMASK(5, 3)
 #define Q6SS_SLEEP_CBCR		GENMASK(5, 2)
+#define Q6SS_CORE_CBCR		BIT(5)
 
 /* Q6SS config/status registers */
 #define TCSR_GLOBAL_CFG0	0x0
@@ -77,9 +83,11 @@
 #define Q6SS_RST_EVB		0x10
 
 #define BHS_EN_REST_ACK		BIT(0)
+#define WCSS_HM_RET		BIT(1)
 #define SSCAON_ENABLE		BIT(13)
 #define SSCAON_BUS_EN		BIT(15)
 #define SSCAON_BUS_MUX_MASK	GENMASK(18, 16)
+#define SSCAON_MASK             GENMASK(17, 15)
 
 #define MEM_BANKS		19
 #define TCSR_WCSS_CLK_MASK	0x1F
@@ -88,6 +96,7 @@
 #define MAX_HALT_REG		4
 enum {
 	WCSS_IPQ8074,
+	WCSS_IPQ9574,
 	WCSS_QCS404,
 };
 
@@ -128,6 +137,12 @@ struct q6v5_wcss {
 	struct clk *qdsp6ss_xo_cbcr;
 	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
+	struct clk_bulk_data *clks;
+	/* clocks that must be started before the Q6 is booted */
+	struct clk_bulk_data *q6_clks;
+	int num_clks;
+	int num_q6_clks;
+
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
 
@@ -236,6 +251,87 @@ static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
+{
+	int ret;
+	u32 val;
+
+	/*1. Set TCSR GLOBAL CFG1*/
+	ret = regmap_update_bits(wcss->halt_map,
+				 wcss->halt_nc + TCSR_GLOBAL_CFG1,
+				 0xff00, 0x1100);
+	if (ret) {
+		dev_err(wcss->dev, "TCSE_GLOBAL_CFG1 failed\n");
+		return ret;
+	}
+
+	/* Enable Q6 clocks */
+	ret = clk_bulk_prepare_enable(wcss->num_q6_clks, wcss->q6_clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
+		return ret;
+	};
+
+	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */
+	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+
+	/*2. Deassert AON Reset */
+	ret = reset_control_deassert(wcss->wcss_aon_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_aon_reset failed\n");
+		clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
+		return ret;
+	}
+
+	/*8. Set mpm configs*/
+	/*set CFG[18:15]=1*/
+	val = readl(wcss->rmb_base + SSCAON_CONFIG);
+	val &= ~SSCAON_MASK;
+	val |= SSCAON_BUS_EN;
+	writel(val, wcss->rmb_base + SSCAON_CONFIG);
+
+	/*9. Wait for SSCAON_STATUS */
+	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
+				 val, (val & 0xffff) == 0x10, 1000,
+				 Q6SS_TIMEOUT_US * 1000);
+	if (ret) {
+		dev_err(wcss->dev, " Boot Error, SSCAON=0x%08X\n", val);
+		return ret;
+	}
+
+	/*3. BHS require xo cbcr to be enabled */
+	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
+	val |= 0x1;
+	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
+
+	/*4. Enable core cbcr*/
+	val = readl(wcss->reg_base + Q6SS_CORE_CBCR);
+	val |= 0x1;
+	writel(val, wcss->reg_base + Q6SS_CORE_CBCR);
+
+	/*5. Enable sleep cbcr*/
+	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val |= 0x1;
+	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+
+	/*6. Boot core start */
+	writel(0x1, wcss->reg_base + Q6SS_BOOT_CORE_START);
+	writel(0x1, wcss->reg_base + Q6SS_BOOT_CMD);
+
+	/*7. Pray god and wait for reset to complete*/
+	ret = readl_poll_timeout(wcss->reg_base + Q6SS_BOOT_STATUS, val,
+				 (val & 0x01), 20000, 1000);
+
+	/* Enable non-Q6 clocks */
+	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
+		return ret;
+	};
+
+	return 0;
+}
+
 static int q6v5_wcss_start(struct rproc *rproc)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -270,10 +366,20 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	if (ret)
 		goto wcss_q6_reset;
 
-	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */
-	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+	switch (wcss->version) {
+	case WCSS_QCS404:
+	case WCSS_IPQ8074:
+		/* Write bootaddr to EVB so that Q6WCSS will jump there after
+		 * reset.
+		 */
+		writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+		ret = q6v5_wcss_reset(wcss);
+		break;
+	case WCSS_IPQ9574:
+		ret = q6v7_wcss_reset(wcss, rproc);
+		break;
+	}
 
-	ret = q6v5_wcss_reset(wcss);
 	if (ret)
 		goto wcss_q6_reset;
 
@@ -638,6 +744,41 @@ static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v7_wcss_powerdown(struct q6v5_wcss *wcss)
+{
+	uint32_t val;
+	int ret;
+
+	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_wcss);
+
+	val = readl(wcss->rmb_base + SSCAON_CONFIG);
+	val &= ~SSCAON_MASK;
+	val |= SSCAON_BUS_EN;
+	writel(val, wcss->rmb_base + SSCAON_CONFIG);
+
+	val |= WCSS_HM_RET;
+	writel(val, wcss->rmb_base + SSCAON_CONFIG);
+
+	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
+				 val, (val & 0xffff) == 0x400, 1000,
+				 HALT_CHECK_MAX_LOOPS);
+	if (ret) {
+		dev_err(wcss->dev,
+			"can't get SSCAON_STATUS rc:%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(2000, 4000);
+
+	reset_control_assert(wcss->wcss_aon_reset);
+
+	val = readl(wcss->rmb_base + SSCAON_CONFIG);
+	val &= ~WCSS_HM_RET;
+	writel(val, wcss->rmb_base + SSCAON_CONFIG);
+
+	return 0;
+}
+
 static int q6v5_q6_powerdown(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -705,6 +846,25 @@ static int q6v5_q6_powerdown(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static void q6v7_q6_powerdown(struct q6v5_wcss *wcss)
+{
+	uint32_t val;
+
+	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_q6);
+
+	/* Disable Q6 Core clock -- we don't know what bit 0 means */
+	val = readl(wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	val &= ~BIT(0);
+	writel(val, wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
+	clk_bulk_disable_unprepare(wcss->num_q6_clks, wcss->q6_clks);
+
+	reset_control_assert(wcss->wcss_q6_reset);
+	usleep_range(1000, 2000);
+	reset_control_assert(wcss->wcss_reset);
+}
+
 static int q6v5_wcss_stop(struct rproc *rproc)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -719,11 +879,21 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 		}
 	}
 
-	if (wcss->version == WCSS_QCS404) {
+	switch (wcss->version) {
+	case WCSS_QCS404:
 		ret = q6v5_qcs404_wcss_shutdown(wcss);
 		if (ret)
 			return ret;
-	} else {
+		break;
+	case WCSS_IPQ9574:
+		ret = q6v7_wcss_powerdown(wcss);
+		if (ret)
+			return ret;
+
+		q6v7_q6_powerdown(wcss);
+
+		break;
+	default:
 		ret = q6v5_wcss_powerdown(wcss);
 		if (ret)
 			return ret;
@@ -732,6 +902,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 		ret = q6v5_q6_powerdown(wcss);
 		if (ret)
 			return ret;
+		break;
 	}
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
@@ -838,7 +1009,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 	if (!wcss->reg_base)
 		return -ENOMEM;
 
-	if (wcss->version == WCSS_IPQ8074) {
+	switch (wcss->version) {
+	case WCSS_IPQ8074:
+	case WCSS_IPQ9574:
 		wcss->rmb_base = devm_platform_ioremap_resource_byname(pdev, "rmb");
 		if (IS_ERR(wcss->rmb_base))
 			return PTR_ERR(wcss->rmb_base);
@@ -965,6 +1138,43 @@ static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int ipq9574_init_clocks(struct q6v5_wcss *wcss)
+{
+	static const char *const q6_clks[] = {
+		"anoc_wcss_axi_m", "q6_ahb", "q6_ahb_s", "q6_axim", "q6ss_boot",
+		"mem_noc_q6_axi", "sys_noc_wcss_ahb", "wcss_acmt", "wcss_ecahb",
+		"wcss_q6_tbu" };
+	static const char *const clks[] = {
+		"q6_axim2", "wcss_ahb_s", "wcss_axi_m" };
+	int i, ret;
+
+	wcss->num_clks = ARRAY_SIZE(clks);
+	wcss->num_q6_clks = ARRAY_SIZE(q6_clks);
+
+	wcss->q6_clks = devm_kcalloc(wcss->dev, wcss->num_q6_clks,
+				     sizeof(*wcss->q6_clks), GFP_KERNEL);
+	if (!wcss->q6_clks)
+		return -ENOMEM;
+
+	wcss->clks = devm_kcalloc(wcss->dev, wcss->num_clks,
+				  sizeof(*wcss->clks), GFP_KERNEL);
+	if (!wcss->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < wcss->num_q6_clks; i++)
+		wcss->q6_clks[i].id = q6_clks[i];
+
+	for (i = 0; i < wcss->num_clks; i++)
+		wcss->clks[i].id = clks[i];
+
+	ret = devm_clk_bulk_get(wcss->dev, wcss->num_q6_clks, wcss->q6_clks);
+	if (ret < 0)
+		return ret;
+
+	return devm_clk_bulk_get(wcss->dev, wcss->num_clks, wcss->clks);
+}
+
+
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
 	const struct wcss_data *desc;
@@ -997,7 +1207,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (wcss->version == WCSS_QCS404) {
+	switch (wcss->version) {
+	case WCSS_QCS404:
 		ret = q6v5_wcss_init_clock(wcss);
 		if (ret)
 			return ret;
@@ -1005,6 +1216,11 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		ret = q6v5_wcss_init_regulator(wcss);
 		if (ret)
 			return ret;
+		break;
+	case WCSS_IPQ9574:
+		ret = ipq9574_init_clocks(wcss);
+		if (ret)
+			return ret;
 	}
 
 	ret = q6v5_wcss_init_reset(wcss, desc);
@@ -1067,6 +1283,16 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.requires_force_stop = true,
 };
 
+static const struct wcss_data wcss_ipq9574_res_init = {
+	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.version = WCSS_IPQ9574,
+	.crash_reason_smem = WCSS_CRASH_REASON,
+	.aon_reset_required = true,
+	.ssr_name = "q6wcss",
+	.ops = &q6v5_wcss_ipq8074_ops,
+	.requires_force_stop = true,
+};
+
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.firmware_name = "wcnss.mdt",
@@ -1082,6 +1308,7 @@ static const struct wcss_data wcss_qcs404_res_init = {
 
 static const struct of_device_id q6v5_wcss_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-pil", .data = &wcss_ipq9574_res_init },
 	{ .compatible = "qcom,qcs404-wcss-pil", .data = &wcss_qcs404_res_init },
 	{ },
 };
-- 
2.45.1


