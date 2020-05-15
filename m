Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1ECA1D4C76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 13:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgEOLUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 07:20:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49159 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726226AbgEOLUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 07:20:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589541624; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TdbgNU84tttRbZCttqG+H0mUAEdILqBseDgLWRUYG84=; b=iJgtklYCfXd6t1llEx7ACn09tjdu0VmvxzppAXxQJtu+LpqZ0dlH5Mq6ZGvagJlCQtblzYol
 Hx7E0KbyRfBwqwh/QYOXJ3aJO+dUPTtGYPghhc/R5tPQ1wK0mKLRPVEMsNNc+Sni1OoBDFR1
 Y+YXxcuqH8SIMx0PdljydaTPWJI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ebe7af7d4b17227eabff35b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 May 2020 11:20:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90D38C44791; Fri, 15 May 2020 11:20:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D873C433D2;
        Fri, 15 May 2020 11:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D873C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V1 2/3] mmc: sdhci-msm: Use internal voltage control
Date:   Fri, 15 May 2020 16:48:53 +0530
Message-Id: <1589541535-8523-3-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vijay Viswanath <vviswana@codeaurora.org>

On qcom SD host controllers voltage switching be done after the HW
is ready for it. The HW informs its readiness through power irq.
The voltage switching should happen only then.

Use the internal voltage switching and then control the voltage
switching using power irq.

Set the regulator load as well so that regulator can be configured
in LPM mode when in is not being used.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 215 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 207 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 97758fa..a10e955 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -36,7 +36,9 @@
 #define CORE_PWRCTL_IO_LOW	BIT(2)
 #define CORE_PWRCTL_IO_HIGH	BIT(3)
 #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
+#define CORE_PWRCTL_BUS_FAIL    BIT(1)
 #define CORE_PWRCTL_IO_SUCCESS	BIT(2)
+#define CORE_PWRCTL_IO_FAIL     BIT(3)
 #define REQ_BUS_OFF		BIT(0)
 #define REQ_BUS_ON		BIT(1)
 #define REQ_IO_LOW		BIT(2)
@@ -263,6 +265,9 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	u32 vmmc_load;
+	u32 vqmmc_load;
+	bool vqmmc_enabled;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -1298,6 +1303,78 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
 		sdhci_msm_hs400(host, &mmc->ios);
 }
 
+static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, int level)
+{
+	int load, ret;
+
+	if (IS_ERR(mmc->supply.vmmc))
+		return 0;
+
+	if (msm_host->vmmc_load) {
+		load = level ? msm_host->vmmc_load : 0;
+		ret = regulator_set_load(mmc->supply.vmmc, load);
+		if (ret)
+			goto out;
+	}
+
+	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
+out:
+	if (ret)
+		pr_err("%s: vmmc set load/ocr failed: %d\n",
+				mmc_hostname(mmc), ret);
+
+	return ret;
+}
+
+static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, int level)
+{
+	int load, ret;
+	struct mmc_ios ios;
+
+	if (IS_ERR(mmc->supply.vqmmc)			 ||
+	    (mmc->ios.power_mode == MMC_POWER_UNDEFINED) ||
+	    (msm_host->vqmmc_enabled == level))
+		return 0;
+
+	if (msm_host->vqmmc_load) {
+		load = level ? msm_host->vqmmc_load : 0;
+		ret = regulator_set_load(mmc->supply.vqmmc, load);
+		if (ret)
+			goto out;
+	}
+
+	/*
+	 * The IO voltage regulator may not always support a voltage close to
+	 * vdd. Set IO voltage based on capability of the regulator.
+	 */
+	if (level) {
+		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
+			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
+		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
+			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
+		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
+			pr_debug("%s: %s: setting signal voltage: %d\n",
+					mmc_hostname(mmc), __func__,
+					ios.signal_voltage);
+			ret = mmc_regulator_set_vqmmc(mmc, &ios);
+			if (ret < 0)
+				goto out;
+		}
+		ret = regulator_enable(mmc->supply.vqmmc);
+	} else {
+		ret = regulator_disable(mmc->supply.vqmmc);
+	}
+out:
+	if (ret)
+		pr_err("%s: vqmmc failed: %d\n", mmc_hostname(mmc), ret);
+	else
+		msm_host->vqmmc_enabled = level;
+
+	return ret;
+}
+
 static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
 {
 	init_waitqueue_head(&msm_host->pwr_irq_wait);
@@ -1401,8 +1478,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = host->mmc;
 	u32 irq_status, irq_ack = 0;
-	int retry = 10;
+	int retry = 10, ret = 0;
 	u32 pwr_state = 0, io_level = 0;
 	u32 config;
 	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
@@ -1438,14 +1516,35 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 
 	/* Handle BUS ON/OFF*/
 	if (irq_status & CORE_PWRCTL_BUS_ON) {
-		pwr_state = REQ_BUS_ON;
-		io_level = REQ_IO_HIGH;
-		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
+		ret = sdhci_msm_set_vmmc(msm_host, mmc, 1);
+		if (!ret)
+			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 1);
+
+		if (!ret) {
+			pwr_state = REQ_BUS_ON;
+			io_level = REQ_IO_HIGH;
+			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
+		} else {
+			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
+					mmc_hostname(mmc), ret, irq_status);
+			irq_ack |= CORE_PWRCTL_BUS_FAIL;
+			sdhci_msm_set_vmmc(msm_host, mmc, 0);
+		}
 	}
 	if (irq_status & CORE_PWRCTL_BUS_OFF) {
-		pwr_state = REQ_BUS_OFF;
-		io_level = REQ_IO_LOW;
-		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
+		ret = sdhci_msm_set_vmmc(msm_host, mmc, 0);
+		if (!ret)
+			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 0);
+
+		if (!ret) {
+			pwr_state = REQ_BUS_OFF;
+			io_level = REQ_IO_LOW;
+			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
+		} else {
+			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
+					mmc_hostname(mmc), ret, irq_status);
+			irq_ack |= CORE_PWRCTL_BUS_FAIL;
+		}
 	}
 	/* Handle IO LOW/HIGH */
 	if (irq_status & CORE_PWRCTL_IO_LOW) {
@@ -1457,6 +1556,15 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
 	}
 
+	if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
+		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
+		if (ret < 0)
+			pr_err("%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
+					mmc_hostname(mmc), ret,
+					mmc->ios.signal_voltage, mmc->ios.vdd,
+					irq_status);
+	}
+
 	/*
 	 * The driver has to acknowledge the interrupt, switch voltages and
 	 * report back if it succeded or not to this register. The voltage
@@ -1833,6 +1941,91 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
+{
+	int ret = 0;
+	struct mmc_host *mmc = msm_host->mmc;
+
+	ret = mmc_regulator_get_supply(msm_host->mmc);
+	if (ret)
+		return ret;
+	device_property_read_u32(&msm_host->pdev->dev,
+			"vmmc-max-load-microamp",
+			&msm_host->vmmc_load);
+	device_property_read_u32(&msm_host->pdev->dev,
+			"vqmmc-max-load-microamp",
+			&msm_host->vqmmc_load);
+
+	sdhci_msm_set_regulator_caps(msm_host);
+	mmc->ios.power_mode = MMC_POWER_UNDEFINED;
+
+	return 0;
+
+}
+
+static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
+				      struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	u16 ctrl;
+
+	/*
+	 * Signal Voltage Switching is only applicable for Host Controllers
+	 * v3.00 and above.
+	 */
+	if (host->version < SDHCI_SPEC_300)
+		return 0;
+
+	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		if (!(host->flags & SDHCI_SIGNALING_330))
+			return -EINVAL;
+		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
+		ctrl &= ~SDHCI_CTRL_VDD_180;
+		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
+
+		/* 3.3V regulator output should be stable within 5 ms */
+		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+		if (!(ctrl & SDHCI_CTRL_VDD_180))
+			return 0;
+
+		pr_warn("%s: 3.3V regulator output did not became stable\n",
+			mmc_hostname(mmc));
+
+		return -EAGAIN;
+	case MMC_SIGNAL_VOLTAGE_180:
+		if (!(host->flags & SDHCI_SIGNALING_180))
+			return -EINVAL;
+
+		/*
+		 * Enable 1.8V Signal Enable in the Host Control2
+		 * register
+		 */
+		ctrl |= SDHCI_CTRL_VDD_180;
+		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
+
+		/* 1.8V regulator output should be stable within 5 ms */
+		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+		if (ctrl & SDHCI_CTRL_VDD_180)
+			return 0;
+
+		pr_warn("%s: 1.8V regulator output did not became stable\n",
+			mmc_hostname(mmc));
+
+		return -EAGAIN;
+	case MMC_SIGNAL_VOLTAGE_120:
+		if (!(host->flags & SDHCI_SIGNALING_120))
+			return -EINVAL;
+		return 0;
+	default:
+		/* No signal voltage switch required */
+		return 0;
+	}
+
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1880,6 +2073,7 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	.write_w = sdhci_msm_writew,
 	.write_b = sdhci_msm_writeb,
 	.irq	= sdhci_msm_cqe_irq,
+	.set_power = sdhci_set_power_noreg,
 };
 
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
@@ -2072,6 +2266,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x49)
 		msm_host->updated_ddr_cfg = true;
 
+	ret = sdhci_msm_register_vreg(msm_host);
+	if (ret)
+		goto clk_disable;
+
 	/*
 	 * Power on reset state may trigger power irq if previous status of
 	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
@@ -2116,6 +2314,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					 MSM_MMC_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
 
+	host->mmc_host_ops.start_signal_voltage_switch =
+		sdhci_msm_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
 	if (of_property_read_bool(node, "supports-cqe"))
 		ret = sdhci_msm_cqe_add_host(host, pdev);
@@ -2123,7 +2323,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		ret = sdhci_add_host(host);
 	if (ret)
 		goto pm_runtime_disable;
-	sdhci_msm_set_regulator_caps(msm_host);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

