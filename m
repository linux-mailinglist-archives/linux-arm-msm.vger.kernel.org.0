Return-Path: <linux-arm-msm+bounces-88180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 899C5D07267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF0C1307CA6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5222F2E0407;
	Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSkgQcbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E82DCF7D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933265; cv=none; b=sHtvWDDT1Tu2EqX8aS20OYmyZN0IHCD1igHz2IYbSi8rEj3uopX+SD9jYYL7jP0EombnkoEjjDrR43YIIqqY8dSAE5NVDsirnMR7JuBod/hrSBwy1QcxeEuieP0CqeoHFa9CcXMz8qC+ZaOXhaMxQruw4FLSaAFdN39gWIMLnOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933265; c=relaxed/simple;
	bh=MRR96YRL/BnW1TS6FRX/9kI3Hyxu+j1AhYRaOe8ePBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxwdWOFyTQQxq4JMog/qMJgbLsEZnKvn9EMP2by5SbgO3x1z0NSuLQVPuYSwTHSxjwIif2ExttnIDOQTYgebFWzR+ZlYMgPRDzABQuvyZIe7n6dYXm11ngKgWmtrPRSwYCqxYV7OKJRNlQEmWePoz5EV5gpGRlo4Tb0oYzkrXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSkgQcbt; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3e37ad3d95aso2681188fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933259; x=1768538059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQB/JYeBaUeD1NoNXFs5NwTVmBLqqvOE3WDrmvFYil8=;
        b=mSkgQcbtVz5iY9uQHO9C0Uo70KyWQK4IGUWHqrSL+0pDTAbobUCzsO6cfgegHYgrLU
         UAkJBAg7JKSM/QpwZl5IORjkF8b73EQSza9G5OwcuoOaILppWdsMvZ3HUxgDfmZuq3Iq
         iW050J+rLYefruYOSkz1qW5f4eA5LY472rTR5I3/E4QtN2bZJoU8JBMJ3jjY+5Ip/Nia
         hnk9Bvo0hWNcsoXLW5qBb8fxwUI7694jHYjxJbO8YsTlH50kKSOJYBhL/562XNWgMpqc
         tOoJ3knLqcnwzIjDBn5PcYbTKEoJimbIjtOb5DyNhI1jnxcf2ppr2drsV6oPFZNsOB4B
         Lhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933259; x=1768538059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aQB/JYeBaUeD1NoNXFs5NwTVmBLqqvOE3WDrmvFYil8=;
        b=C3I9+0PFKH4XlDwJ/r6bKpd8ItrPGPNiECrBXk2QW52Dgm/m2ZlarZx/EpJ9ClR/jH
         tDOfOR8xB6wNiTzMjrTv+i17hiVimwvKFuQTkLKwyvZYgt/nw+TkOzPUoimu3VTOdphM
         bI6Ep0BeDEs15wKSjtfv2k9xhhLEEzsv2SdoPCo29/o4L/DsOncX9gvK4P3NSwoG+oh3
         iCdQ6aihyX7pGus8u9OyasRQCDpyl4RUgRrtBHML/txJr5JNb5QlK+k09BCtTJEsKfhW
         IsK5bMLTAwhDchD3aeWjtlC0n/KQUgt/BYzybn90dOHJKT8kHX6ocwbqeOhDFgKZUE7B
         KzRA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgXLMGpqNAlZJ1bxsfFKdQ/SvgirmSJV9cVb7Vvl5Ok8F9fAB/vRcZUsoR1bwzzMRO4V09OqmGwWgP/P8@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDw0YPEkI222O5R4MwHvpe41KYf5CgNG1VLZ2q6xB4vzXyk0a
	m6hFfVcQCMxhv3GaKa/cTOhZKC1QGBa63uZrD98SwEDGnK/ZQLlyzzrd
X-Gm-Gg: AY/fxX6uOO4V7dF6JZCpC/mIg7Dy+eG0bRbYkDJpa7/SwBbPjcqp+DZUGPpbsx7eEJd
	8AR2+NfPpYVpw7cfKuVoxMrUOYzkNXU7sEMoB3OUWR99zxLxqGeKVagNz+4QtIACtCPQA9vvXkJ
	NHmUiPDVu6lNxXyM9b2kcgjucrU8763Sf02hs1DTbdy6qe6tocYndRhUusd2RDEdx1x3sYMIMxe
	m/E/FGDQxrkFLPwEUEK1ec8sALAz0Kp4Gok2KhGGXNJGmqxjsq+5TscGv7q5d1kfq+u70scX8KY
	rO7U7WAUf+BMP/+nxcMSUVlcLOHW5kr4STfCqwxnBCn3hDL4oVTYuaRqCgYFAnpmmMPDs8ZAM/b
	cmT5cJ0xwH0sZ9Z0uS/xqAmDtdj4EmItEAC/Q83paqPJ2wmI8DRe2YHIfefjAzgtjRw4rnnBlvC
	mULpY7Q2SgD0tQ56A4fRTYMk/qk357S60jiu9eXDMHjsMvX+E3bbBj74+OE4LC8iyDbXs9np0aJ
	GA4PdB8lccgJfXnW+0uZ3EKkRaw
X-Google-Smtp-Source: AGHT+IHwX+GNh5/DwiG7T8HWYUrWoLfZr0QWP9ORLGp7c/Mh7CX2gaYJOOtLXTTaret+B4ss2zrolg==
X-Received: by 2002:a05:6870:1989:b0:2e9:93c6:6e4a with SMTP id 586e51a60fabf-3ffc0b652demr4312921fac.38.1767933258739;
        Thu, 08 Jan 2026 20:34:18 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:18 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 7/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
Date: Thu,  8 Jan 2026 22:33:42 -0600
Message-ID: <20260109043352.3072933-8-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
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

The IPQ9574 uses two sets of clocks. the first, dubbed "pre_boot_clks"
must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
register. The second set of clocks, "clks" should only be enabled
after the Q6 is placed out of reset. Otherwise, the host CPU core that
tries to start the remoteproc will hang.

The shutdown path requires a small delay between asserting the Q6 and
WCSS resets. The delay is handled in q6v7_q6_powerdown(). Also add it
in the error path of q6v5_wcss_start().

The downstream kernel had a funny comment, "Pray god and wait for
reset to complete", which I decided to keep for entertainment value.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - rename "q6_clks" to "pre_boot_clks"
 - drop step numbers from q6v7_wcss_reset() comments
 - disable clocks on init failures in q6v7_wcss_reset()
 - Add Q6SS_CBCR_CLKEN macro
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 253 +++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 07bba47eb084..ccf5fbc5be66 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -31,6 +31,9 @@
 #define Q6SS_MEM_PWR_CTL		0x0B0
 #define Q6SS_STRAP_ACC			0x110
 #define Q6SS_CGC_OVERRIDE		0x034
+#define Q6SS_BOOT_CORE_START		0x400
+#define Q6SS_BOOT_CMD                   0x404
+#define Q6SS_BOOT_STATUS		0x408
 #define Q6SS_BCR_REG			0x6000
 
 /* AXI Halt Register Offsets */
@@ -48,7 +51,11 @@
 /* Q6SS_BRC_RESET */
 #define Q6SS_BRC_BLK_ARES		BIT(0)
 
+/* QDSP6SS CBCR */
+#define Q6SS_CBCR_CLKEN			BIT(0)
+
 /* Q6SS_GFMUX_CTL */
+#define Q6SS_CLK_SRC_MUX		BIT(0)
 #define Q6SS_CLK_ENABLE			BIT(1)
 #define Q6SS_SWITCH_CLK_SRC		BIT(8)
 
@@ -67,6 +74,7 @@
 #define HALT_CHECK_MAX_LOOPS		200
 #define Q6SS_XO_CBCR		GENMASK(5, 3)
 #define Q6SS_SLEEP_CBCR		GENMASK(5, 2)
+#define Q6SS_CORE_CBCR		BIT(5)
 
 /* Q6SS config/status registers */
 #define TCSR_GLOBAL_CFG0	0x0
@@ -77,9 +85,11 @@
 #define Q6SS_RST_EVB		0x10
 
 #define BHS_EN_REST_ACK		BIT(0)
+#define WCSS_HM_RET		BIT(1)
 #define SSCAON_ENABLE		BIT(13)
 #define SSCAON_BUS_EN		BIT(15)
 #define SSCAON_BUS_MUX_MASK	GENMASK(18, 16)
+#define SSCAON_MASK             GENMASK(17, 15)
 
 #define MEM_BANKS		19
 #define TCSR_WCSS_CLK_MASK	0x1F
@@ -88,6 +98,7 @@
 #define MAX_HALT_REG		4
 enum {
 	WCSS_IPQ8074,
+	WCSS_IPQ9574,
 	WCSS_QCS404,
 };
 
@@ -125,6 +136,12 @@ struct q6v5_wcss {
 	struct clk *qdsp6ss_abhm_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
 	struct clk *lcc_bcr_sleep;
+	struct clk_bulk_data *clks;
+	/* clocks that must be started before the Q6 is booted */
+	struct clk_bulk_data *pre_boot_clks;
+	int num_clks;
+	int num_pre_boot_clks;
+
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
 
@@ -233,6 +250,97 @@ static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
+{
+	int ret;
+	u32 val;
+
+	ret = regmap_update_bits(wcss->halt_map,
+				 wcss->halt_nc + TCSR_GLOBAL_CFG1,
+				 0xff00, 0x1100);
+	if (ret) {
+		dev_err(wcss->dev, "TCSR_GLOBAL_CFG1 failed\n");
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(wcss->num_pre_boot_clks,
+				      wcss->pre_boot_clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
+		return ret;
+	};
+
+	/* Write bootaddr to Q6WCSS */
+	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+
+	/* Deassert AON Reset */
+	ret = reset_control_deassert(wcss->wcss_aon_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_aon_reset failed\n");
+		goto disable_pre_boot_clocks;
+		return ret;
+	}
+
+	/* Set MPM configs*/
+	/*set CFG[18:15]=1*/
+	val = readl(wcss->rmb_base + SSCAON_CONFIG);
+	val &= ~SSCAON_MASK;
+	val |= SSCAON_BUS_EN;
+	writel(val, wcss->rmb_base + SSCAON_CONFIG);
+
+	/* Wait for SSCAON_STATUS, up to 1 second */
+	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
+				 val, (val & 0xffff) == 0x10, 1000, 1000000);
+	if (ret) {
+		dev_err(wcss->dev, " Boot Error, SSCAON=0x%08X\n", val);
+		goto assert_aon_reset;
+	}
+
+	/* BHS require xo cbcr to be enabled */
+	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
+	val |= Q6SS_CBCR_CLKEN;
+	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
+
+	/* Enable core cbcr */
+	val = readl(wcss->reg_base + Q6SS_CORE_CBCR);
+	val |= Q6SS_CBCR_CLKEN;
+	writel(val, wcss->reg_base + Q6SS_CORE_CBCR);
+
+	/* Enable sleep cbcr */
+	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
+	val |= Q6SS_CBCR_CLKEN;
+	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+
+	/* Boot core start */
+	writel(0x1, wcss->reg_base + Q6SS_BOOT_CORE_START);
+	writel(0x1, wcss->reg_base + Q6SS_BOOT_CMD);
+
+	/* Pray god and wait for reset to complete */
+	ret = readl_poll_timeout(wcss->reg_base + Q6SS_BOOT_STATUS, val,
+				 (val & BIT(0)), 1000, 20000);
+	if (ret) {
+		dev_err(wcss->dev, "WCSS boot timed out\n");
+		ret = -ETIMEDOUT;
+		goto assert_aon_reset;
+	}
+
+	/* Enable post-boot clocks */
+	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
+		goto assert_aon_reset;
+	};
+
+	return 0;
+
+assert_aon_reset:
+	reset_control_assert(wcss->wcss_aon_reset);
+disable_pre_boot_clocks:
+	clk_bulk_disable_unprepare(wcss->num_pre_boot_clks,
+				   wcss->pre_boot_clks);
+	return ret;
+}
+
 static int q6v5_wcss_start(struct rproc *rproc)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -267,10 +375,18 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	if (ret)
 		goto wcss_q6_reset;
 
-	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */
-	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+	switch (wcss->version) {
+	case WCSS_QCS404:
+	case WCSS_IPQ8074:
+		/* Write bootaddr to Q6WCSS */
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
 
@@ -282,6 +398,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
 
 wcss_q6_reset:
 	reset_control_assert(wcss->wcss_q6_reset);
+	usleep_range(1000, 2000);
 
 wcss_reset:
 	reset_control_assert(wcss->wcss_reset);
@@ -635,6 +752,41 @@ static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v7_wcss_powerdown(struct q6v5_wcss *wcss)
+{
+	u32 val;
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
@@ -702,6 +854,26 @@ static int q6v5_q6_powerdown(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static void q6v7_q6_powerdown(struct q6v5_wcss *wcss)
+{
+	u32 val;
+
+	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_q6);
+
+	/* Disable Q6 Core clock */
+	val = readl(wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+	val &= ~Q6SS_CLK_SRC_MUX;
+	writel(val, wcss->reg_base + Q6SS_GFMUX_CTL_REG);
+
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
+	clk_bulk_disable_unprepare(wcss->num_pre_boot_clks,
+				   wcss->pre_boot_clks);
+
+	reset_control_assert(wcss->wcss_q6_reset);
+	usleep_range(1000, 2000);
+	reset_control_assert(wcss->wcss_reset);
+}
+
 static int q6v5_wcss_stop(struct rproc *rproc)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -716,11 +888,21 @@ static int q6v5_wcss_stop(struct rproc *rproc)
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
@@ -729,6 +911,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 		ret = q6v5_q6_powerdown(wcss);
 		if (ret)
 			return ret;
+		break;
 	}
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
@@ -835,7 +1018,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 	if (!wcss->reg_base)
 		return -ENOMEM;
 
-	if (wcss->version == WCSS_IPQ8074) {
+	switch (wcss->version) {
+	case WCSS_IPQ8074:
+	case WCSS_IPQ9574:
 		wcss->rmb_base = devm_platform_ioremap_resource_byname(pdev, "rmb");
 		if (IS_ERR(wcss->rmb_base))
 			return PTR_ERR(wcss->rmb_base);
@@ -962,6 +1147,43 @@ static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int ipq9574_init_clocks(struct q6v5_wcss *wcss)
+{
+	static const char *const pre_boot_clks[] = {
+		"anoc_wcss_axi_m", "q6_ahb", "q6_ahb_s", "q6_axim", "q6ss_boot",
+		"mem_noc_q6_axi", "sys_noc_wcss_ahb", "wcss_acmt", "wcss_ecahb",
+		"wcss_q6_tbu" };
+	static const char *const clks[] = {
+		"q6_axim2", "wcss_ahb_s", "wcss_axi_m" };
+	int i, ret;
+
+	wcss->num_clks = ARRAY_SIZE(clks);
+	wcss->num_pre_boot_clks = ARRAY_SIZE(pre_boot_clks);
+
+	wcss->pre_boot_clks = devm_kcalloc(wcss->dev, wcss->num_pre_boot_clks,
+				     sizeof(*wcss->pre_boot_clks), GFP_KERNEL);
+	if (!wcss->pre_boot_clks)
+		return -ENOMEM;
+
+	wcss->clks = devm_kcalloc(wcss->dev, wcss->num_clks,
+				  sizeof(*wcss->clks), GFP_KERNEL);
+	if (!wcss->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < wcss->num_pre_boot_clks; i++)
+		wcss->pre_boot_clks[i].id = pre_boot_clks[i];
+
+	for (i = 0; i < wcss->num_clks; i++)
+		wcss->clks[i].id = clks[i];
+
+	ret = devm_clk_bulk_get(wcss->dev, wcss->num_pre_boot_clks,
+				wcss->pre_boot_clks);
+	if (ret < 0)
+		return ret;
+
+	return devm_clk_bulk_get(wcss->dev, wcss->num_clks, wcss->clks);
+}
+
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
 	const struct wcss_data *desc;
@@ -994,7 +1216,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (wcss->version == WCSS_QCS404) {
+	switch (wcss->version) {
+	case WCSS_QCS404:
 		ret = q6v5_wcss_init_clock(wcss);
 		if (ret)
 			return ret;
@@ -1002,6 +1225,11 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
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
@@ -1064,6 +1292,16 @@ static const struct wcss_data wcss_ipq8074_res_init = {
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
@@ -1079,6 +1317,7 @@ static const struct wcss_data wcss_qcs404_res_init = {
 
 static const struct of_device_id q6v5_wcss_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-pil", .data = &wcss_ipq9574_res_init },
 	{ .compatible = "qcom,qcs404-wcss-pil", .data = &wcss_qcs404_res_init },
 	{ },
 };
-- 
2.45.1


