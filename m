Return-Path: <linux-arm-msm+bounces-55173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2AA99525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 18:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73B89258BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCAF280CF6;
	Wed, 23 Apr 2025 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0ZQsBGx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA1280CDC;
	Wed, 23 Apr 2025 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425579; cv=none; b=ch6H/3y3S0al7KnV+BN/qRIinXpmzo2SzUX0dTdJd+U58S0hnSrYP6jxKeCaaZSnwp0JXMVTbxHLebng5Oc7g9MqgsFXGJPij6IepfNhfOwNlHjjgR04U3RwBq7NxByKN89F+39zn6gxYp+qh99x8jEZv8t7YFjLcyymHXnYEl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425579; c=relaxed/simple;
	bh=ogMKzGyxgNsRLI52o+wQUuU/FxCjNBZR167etGTl+Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NYKRkuNXlEz+XlAcEfxsNnd3YH5HyMfTEZY7NkSTnOmpxgH17jLFVeeo3tXk65E+KuvLtHzFxHSNj8xY1C/q8V/Tbh0xxyIpRByeHQreXa/mNAg5lQN7PJFTCTx6CCCXkz1uuuKf/fkMrYXSpb4Z2/QHmBiGEBOfNnB1+jYL228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0ZQsBGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE821C4CEEA;
	Wed, 23 Apr 2025 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425578;
	bh=ogMKzGyxgNsRLI52o+wQUuU/FxCjNBZR167etGTl+Eg=;
	h=From:To:Cc:Subject:Date:From;
	b=s0ZQsBGxMLPVHZuPTsdOLlbDPlnzQruO2+xnEAnaSGhG0hXAl+/1GmhrtmJZqNLiF
	 CVLwMyNfM08ZoQJinvdltnGc7pvzw4EH7tYWWqTuY+oy8NbMsOasEbgL727PLY0q1f
	 uKA5jXBjRwpUhE9gmAE2hJ8/arLLsx4a+1YkCAQBlRlb5JUygY+b7iBCLHzT2gR5kl
	 IjfaKapJbFENs/TfRHV9Ej8iRirSgo5ydnTH27DhqO9lPZ1/od+PAINDdY2YUEeSgV
	 +zpqB2WoKwck15W65xIq7C9PMX+2uCnxtjBuxtKo2BnovxE/kodlcLspiRQQfI/68u
	 FX98fKgpG/Zuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: qcom: use modern PM macros
Date: Wed, 23 Apr 2025 18:26:09 +0200
Message-Id: <20250423162613.2082417-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The use of the old SET_SYSTEM_SLEEP_PM_OPS/SET_RUNTIME_PM_OPS macros
without __maybe_unused annotations causes warnings when build testing
without CONFIG_PM:

drivers/usb/dwc3/dwc3-qcom.c:421:12: error: unused function 'dwc3_qcom_suspend' [-Werror,-Wunused-function]
  421 | static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
      |            ^~~~~~~~~~~~~~~~~
drivers/usb/dwc3/dwc3-qcom.c:457:12: error: unused function 'dwc3_qcom_resume' [-Werror,-Wunused-function]
  457 | static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)

Change these to the modern SYSTEM_SLEEP_PM_OPS/RUNTIME_PM_OPS/pm_ptr
macros, which avoids the warnings and improves readability at the same
time.

Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d512002e1e88..cbba11589cd0 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -832,7 +832,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	reset_control_assert(qcom->resets);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
@@ -886,12 +885,7 @@ static int dwc3_qcom_prepare(struct device *dev)
 
 	return dwc3_pm_prepare(dwc);
 }
-#else
-#define dwc3_qcom_complete NULL
-#define dwc3_qcom_prepare NULL
-#endif /* CONFIG_PM_SLEEP */
 
-#ifdef CONFIG_PM
 static int dwc3_qcom_runtime_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
@@ -922,14 +916,13 @@ static int dwc3_qcom_runtime_idle(struct device *dev)
 {
 	return dwc3_runtime_idle(dev_get_drvdata(dev));
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
-	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
+	SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
+	RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
 			   dwc3_qcom_runtime_idle)
-	.complete = dwc3_qcom_complete,
-	.prepare = dwc3_qcom_prepare,
+	.complete = pm_sleep_ptr(dwc3_qcom_complete),
+	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
@@ -943,7 +936,7 @@ static struct platform_driver dwc3_qcom_driver = {
 	.remove		= dwc3_qcom_remove,
 	.driver		= {
 		.name	= "dwc3-qcom",
-		.pm	= &dwc3_qcom_dev_pm_ops,
+		.pm	= pm_ptr(&dwc3_qcom_dev_pm_ops),
 		.of_match_table	= dwc3_qcom_of_match,
 	},
 };
-- 
2.39.5


