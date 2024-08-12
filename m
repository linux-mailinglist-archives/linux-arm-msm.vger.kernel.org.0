Return-Path: <linux-arm-msm+bounces-28281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8D94E56D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA3E283679
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D41114EC4C;
	Mon, 12 Aug 2024 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjJNzmNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDCF14E2F0;
	Mon, 12 Aug 2024 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432064; cv=none; b=QhhdhkKyU+Hb1cHULBbpqTb3csAb84r/mVw9g7RZwLpA5wdFJ08rKjoEXN1fu+HtswlOfcocU0EJ+YFllV/dje4Dqd/VksAOLSnMGaPFkvzJIT/CLIwnDSjnpEFcExrQfBvgIa3NDcwFIgHG4g7D8AlzlpUW4rKQKoN7E9wb7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432064; c=relaxed/simple;
	bh=wheZJ3gpyB6Zs9r3Q6YvAm6TeCtn3KFvdhSos/BvTwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaHSqb4JOBBG8gZeNIbenJHHoLiy+kwNHRidPvLK+ldycWXgwRT75vCLPcFDzrGxMCN5blFdzHGbh0R9aupmIIwoI53UK/n2sEldu56HfwwWGVQHMmnvW3vDH7UNm/O37cZ0SqsUm3sPZ4GeKxMnOQ3/1ntGfxxIvPksNRgNvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjJNzmNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D97C32786;
	Mon, 12 Aug 2024 03:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432063;
	bh=wheZJ3gpyB6Zs9r3Q6YvAm6TeCtn3KFvdhSos/BvTwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HjJNzmNsjjtasurP/5IPk9P8dNcEVHiJyMOGu1s3rScPLdLhEW07mBxn5p8pax9yD
	 MuEwXaSOVlQ4uVSIyy/ba4AqGIXc6+pDlVjLxj/PY/eb7eAms88t6gjfB8zDDCzP0a
	 To8aSrFD7hM1g2jsVJhhvjPL1uMl6hD8F6H3SpHVfa7Ep3vKkaXnGsMstzXU+rBH2W
	 Z6ylMfeRuY1I7cHMd75nWvbuqkyiQ0e8Dt+7I+bsY1yNsSWJpdJfRpy7GkJZniadAK
	 7SCH9cpABK5mlw+gKaVzYtqIZBsNupus3qDES/qGkXdjTOC4YTJqLIb5dGun8CW55z
	 LbpqU5M8Oa2+Q==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:12:01 -0700
Subject: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10839;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=GCQQHCUzQXwHR9piSA8dIQCRV9qOK7mymBwH/l7csGI=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2AxEvEkvaY8TXwZhQd70o4RiQdiaxm5nePi
 zCYzRxhIPmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVUlxAAgX8Q4NPK2eQC8n8jgVkDSb05RxPev/pv0FS6cf6
 Z9WYbIiLgfllurCAQWSkNcboPf0eyEMRYKSVBLPjS4qT2rXqq2UpCOGsvG0vPxcBKCNhJzWIpMY
 zDqopLRJQ57XipiWL8O30o4iDA9I94KlRo3/QGFhFshu8J2Jq2h5qB1Xs9W7+ydj60f5WZ7dSg8
 ptuDM8eAymAAqbOA8j8sMtkba3GQREyzYclXSyOJAZbR2Kx0CRO0VQolzxpmVabS4hS797RCeDt
 J1DyXqk7w2baYdGvkXqb5ZX7Bs0ZDDo279kBuH2n6UMAZ9eAhUOmpWamgma97idNhb87gY8EpL4
 dxBlSrYDzDDnfuxrEFJ78lxCO7B7iwhK4OTovfAOpTlH9yJvMhgOnTnwA9Ny3lcEitBccr+L/TF
 J98Q+OETPFG/n6TJJoCFqYdJtUWJvnQULndtN0kV8168Fv1wRyQ0oc0oOAiNky2vT/pG11TmdO4
 oCqUqD1p67DEHIQToH5fuRl1zqcr8h3MadKt6h+h+vdRJXPedRnrbxHhGkUe57ukapHrnmj7ADH
 mcwFdgu4CDiZtKeMNyMKdIBAKQS7G/T8HDipznfAn4tS1iMy8Ny5NwkTtCehnemuLwIAEVDRsBR
 1MH6PwfFrYrvnD/yne4BxeVJO0eft/7XNxI8gqzsrTp8=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The DWC3 IP block is handled by three distinct device drivers: XHCI,
DWC3 core and a platform specific (optional) DWC3 glue driver.

This has resulted in, at least in the case of the Qualcomm glue, the
presence of a number of layering violations, where the glue code either
can't handle, or has to work around, the fact that core might not probe
deterministically.

An example of this is that the suspend path should operate slightly
different depending on the device operating in host or peripheral mode,
and the only way to determine the operating state is to peek into the
core's drvdata.

The Qualcomm glue driver is expected to make updates in the qscratch
register region (the "glue" region) during role switch events, but with
the glue and core split using the driver model, there is no reasonable
way to introduce listeners for mode changes.

Split the dwc3 core platform_driver callbacks and their implementation
and export the implementation, to make it possible to deterministically
instantiate the dwc3 core as part of the dwc3 glue drivers and to
allow flattening of the DeviceTree representation.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/usb/dwc3/core.c | 169 +++++++++++++++++++++++++++++++-----------------
 drivers/usb/dwc3/core.h |   3 +
 2 files changed, 114 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 734de2a8bd21..6addb3c367e6 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -36,6 +36,7 @@
 
 #include "core.h"
 #include "gadget.h"
+#include "glue.h"
 #include "io.h"
 
 #include "debug.h"
@@ -2076,10 +2077,11 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_probe(struct platform_device *pdev)
+struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *res,
+			bool ignore_clocks_and_resets, void *glue)
 {
 	struct device		*dev = &pdev->dev;
-	struct resource		*res, dwc_res;
+	struct resource		dwc_res;
 	unsigned int		hw_mode;
 	void __iomem		*regs;
 	struct dwc3		*dwc;
@@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
 	if (!dwc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dwc->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "missing memory resource\n");
-		return -ENODEV;
-	}
+	dwc->glue = glue;
 
 	dwc->xhci_resources[0].start = res->start;
 	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
@@ -2123,7 +2120,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	regs = devm_ioremap_resource(dev, &dwc_res);
 	if (IS_ERR(regs))
-		return PTR_ERR(regs);
+		return ERR_CAST(regs);
 
 	dwc->regs	= regs;
 	dwc->regs_size	= resource_size(&dwc_res);
@@ -2132,15 +2129,17 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_software_properties(dwc);
 
-	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset)) {
-		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
-	}
+	if (!ignore_clocks_and_resets) {
+		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
+		if (IS_ERR(dwc->reset)) {
+			ret = PTR_ERR(dwc->reset);
+			goto err_put_psy;
+		}
 
-	ret = dwc3_get_clocks(dwc);
-	if (ret)
-		goto err_put_psy;
+		ret = dwc3_get_clocks(dwc);
+		if (ret)
+			goto err_put_psy;
+	}
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
@@ -2225,7 +2224,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	return 0;
+	return dwc;
 
 err_exit_debugfs:
 	dwc3_debugfs_exit(dwc);
@@ -2249,14 +2248,33 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 
-	return ret;
+	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(dwc3_probe);
 
-static void dwc3_remove(struct platform_device *pdev)
+static int dwc3_plat_probe(struct platform_device *pdev)
 {
-	struct dwc3	*dwc = platform_get_drvdata(pdev);
+	struct resource *res;
+	struct dwc3 *dwc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
 
-	pm_runtime_get_sync(&pdev->dev);
+	dwc = dwc3_probe(pdev, res, false, NULL);
+	if (IS_ERR(dwc))
+		return PTR_ERR(dwc);
+
+	platform_set_drvdata(pdev, dwc);
+
+	return 0;
+}
+
+void dwc3_remove(struct dwc3 *dwc)
+{
+	pm_runtime_get_sync(dwc->dev);
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
@@ -2264,22 +2282,28 @@ static void dwc3_remove(struct platform_device *pdev)
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
 
-	pm_runtime_allow(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_allow(dwc->dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_dont_use_autosuspend(dwc->dev);
+	pm_runtime_put_noidle(dwc->dev);
 	/*
 	 * HACK: Clear the driver data, which is currently accessed by parent
 	 * glue drivers, before allowing the parent to suspend.
 	 */
-	platform_set_drvdata(pdev, NULL);
-	pm_runtime_set_suspended(&pdev->dev);
+	dev_set_drvdata(dwc->dev, NULL);
+	pm_runtime_set_suspended(dwc->dev);
 
 	dwc3_free_event_buffers(dwc);
 
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 }
+EXPORT_SYMBOL_GPL(dwc3_remove);
+
+static void dwc3_plat_remove(struct platform_device *pdev)
+{
+	dwc3_remove(platform_get_drvdata(pdev));
+}
 
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
@@ -2450,9 +2474,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_runtime_suspend(struct device *dev)
+int dwc3_runtime_suspend(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	if (dwc3_runtime_checks(dwc))
@@ -2464,10 +2487,10 @@ static int dwc3_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
 
-static int dwc3_runtime_resume(struct device *dev)
+int dwc3_runtime_resume(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
@@ -2484,15 +2507,14 @@ static int dwc3_runtime_resume(struct device *dev)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
 
-static int dwc3_runtime_idle(struct device *dev)
+int dwc3_runtime_idle(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
-
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (dwc3_runtime_checks(dwc))
@@ -2504,52 +2526,67 @@ static int dwc3_runtime_idle(struct device *dev)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_autosuspend(dev);
+	pm_runtime_mark_last_busy(dwc->dev);
+	pm_runtime_autosuspend(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
+
+static int dwc3_plat_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PM_SLEEP
-static int dwc3_suspend(struct device *dev)
+int dwc3_suspend(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
-	pinctrl_pm_select_sleep_state(dev);
+	pinctrl_pm_select_sleep_state(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_suspend);
 
-static int dwc3_resume(struct device *dev)
+int dwc3_resume(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret;
 
-	pinctrl_pm_select_default_state(dev);
+	pinctrl_pm_select_default_state(dwc->dev);
 
-	pm_runtime_disable(dev);
-	pm_runtime_set_active(dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_set_active(dwc->dev);
 
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
 	if (ret) {
-		pm_runtime_set_suspended(dev);
+		pm_runtime_set_suspended(dwc->dev);
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
+	pm_runtime_enable(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_resume);
 
-static void dwc3_complete(struct device *dev)
+void dwc3_complete(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	u32		reg;
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
@@ -2559,15 +2596,31 @@ static void dwc3_complete(struct device *dev)
 		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_complete);
+
+static int dwc3_plat_suspend(struct device *dev)
+{
+	return dwc3_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_resume(struct device *dev)
+{
+	return dwc3_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_plat_complete(struct device *dev)
+{
+	dwc3_complete(dev_get_drvdata(dev));
+}
 #else
-#define dwc3_complete NULL
+#define dwc3_plat_complete NULL
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
-	.complete = dwc3_complete,
-	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
-			dwc3_runtime_idle)
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
+	.complete = dwc3_plat_complete,
+	SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_resume,
+			   dwc3_plat_runtime_idle)
 };
 
 #ifdef CONFIG_OF
@@ -2595,8 +2648,8 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
 #endif
 
 static struct platform_driver dwc3_driver = {
-	.probe		= dwc3_probe,
-	.remove_new	= dwc3_remove,
+	.probe		= dwc3_plat_probe,
+	.remove_new	= dwc3_plat_remove,
 	.driver		= {
 		.name	= "dwc3",
 		.of_match_table	= of_match_ptr(of_dwc3_match),
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1e561fd8b86e..4a0ee9ef72e2 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1160,6 +1160,7 @@ struct dwc3_scratchpad_array {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @glue: private reference to any glue context
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1388,6 +1389,8 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+
+	void			*glue;
 };
 
 #define INCRX_BURST_MODE 0

-- 
2.45.2


