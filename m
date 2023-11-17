Return-Path: <linux-arm-msm+bounces-996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2277EF718
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 18:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD7328133E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 17:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0246433B8;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZY+9QHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42DE3454C;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEA2C433CB;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700242689;
	bh=IDrqe0MvHTg6enNUp8mTcE/BgNy+EDele8qbx8DCFmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nZY+9QHQrZY7aae9tNrEW16uBgb+gK8D9LEpKbV3uKNZZSycjpDoiD5Z+jnml14Vl
	 PilvGJTsfZlrkdW7hu9pqR/xD0q5jFo0L6HJUtHjrf9TCp/4IaDh+cW0D9YpHP/BMU
	 bLHLOFc2AczbfruoCz/8eRUfwePgOxfd/onUWUqd7zXHe1Ww3Virrdk6kSEcQI5Sxe
	 kK/OJ0ER84KOgxHHStzkXz0q09ZuLDeV0lRKB+H9gb7QaAcZD4BfEm1AmjJvzxWMMM
	 y1GD+Lrl7fKZpnxiEq43OMuNTiS79DMnhNm3eeMvRtbJZPILnScgV0SO+HxlxhmyHg
	 +qq8ATEygyXJQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r42nF-0005Vu-1A;
	Fri, 17 Nov 2023 18:38:13 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] USB: dwc3: qcom: fix ACPI platform device leak
Date: Fri, 17 Nov 2023 18:36:50 +0100
Message-ID: <20231117173650.21161-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117173650.21161-1-johan+linaro@kernel.org>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to free the "urs" platform device, which is created for some
ACPI platforms, on probe errors and on driver unbind.

Compile-tested only.

Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot")
Cc: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 37 +++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0703f9b85cda..10fb481d943b 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -767,9 +767,9 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_device *
-dwc3_qcom_create_urs_usb_platdev(struct device *dev)
+static struct platform_device *dwc3_qcom_create_urs_usb_platdev(struct device *dev)
 {
+	struct platform_device *urs_usb = NULL;
 	struct fwnode_handle *fwh;
 	struct acpi_device *adev;
 	char name[8];
@@ -789,9 +789,26 @@ dwc3_qcom_create_urs_usb_platdev(struct device *dev)
 
 	adev = to_acpi_device_node(fwh);
 	if (!adev)
-		return NULL;
+		goto err_put_handle;
+
+	urs_usb = acpi_create_platform_device(adev, NULL);
+	if (IS_ERR_OR_NULL(urs_usb))
+		goto err_put_handle;
+
+	return urs_usb;
 
-	return acpi_create_platform_device(adev, NULL);
+err_put_handle:
+	fwnode_handle_put(fwh);
+
+	return urs_usb;
+}
+
+static void dwc3_qcom_destroy_urs_usb_platdev(struct platform_device *urs_usb)
+{
+	struct fwnode_handle *fwh = urs_usb->dev.fwnode;
+
+	platform_device_unregister(urs_usb);
+	fwnode_handle_put(fwh);
 }
 
 static int dwc3_qcom_probe(struct platform_device *pdev)
@@ -875,13 +892,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
 	if (IS_ERR(qcom->qscratch_base)) {
 		ret = PTR_ERR(qcom->qscratch_base);
-		goto clk_disable;
+		goto free_urs;
 	}
 
 	ret = dwc3_qcom_setup_irq(pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
-		goto clk_disable;
+		goto free_urs;
 	}
 
 	/*
@@ -900,7 +917,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
-		goto clk_disable;
+		goto free_urs;
 	}
 
 	ret = dwc3_qcom_interconnect_init(qcom);
@@ -939,6 +956,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		platform_device_del(qcom->dwc3);
 	}
 	platform_device_put(qcom->dwc3);
+free_urs:
+	if (qcom->urs_usb)
+		dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -965,6 +985,9 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	}
 	platform_device_put(qcom->dwc3);
 
+	if (qcom->urs_usb)
+		dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
+
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
 		clk_put(qcom->clks[i]);
-- 
2.41.0


