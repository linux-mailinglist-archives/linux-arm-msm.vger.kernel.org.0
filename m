Return-Path: <linux-arm-msm+bounces-994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692067EF715
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 18:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7EF1C20B3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 17:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9743165;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN2wNnnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421BDDA7;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A93C433C8;
	Fri, 17 Nov 2023 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700242689;
	bh=sDWfI3dfDm/XeUFimA2vIUoCw4maHSxqpQcHwRZvnSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZN2wNnnk3BLjE4zbhrKriuJksBjzbf+xiebRKjnCpC0d3WWBLcvR1uK6QDOAlZ6Xr
	 RUxdKJIHybOW+/mYS3foJCR4yhiVV94gDS96rYESDbdeELsnw8vFsxDxHFLxS9LRMH
	 qGc+9ZT0p0vgWr8zRYuXpZMudUGCL4tCukmM1wUwRKLovKxQnx1pciCew7XXFAXra4
	 QpWvCV8/zcFgkLhPWK57lw2OmZXYmfpYufBRVVtLeIWQTDWfSArgwQW0A9XDaREv64
	 vnE0FE80NEGld3vr6D+8EdHkEYobniucaqA6wRuji3j2+5dVe/a6/r4jjJWvAD4Bat
	 1hVIuVxe9oHKw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r42nF-0005Vs-0v;
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
	stable@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/3] USB: dwc3: qcom: fix software node leak on probe errors
Date: Fri, 17 Nov 2023 18:36:49 +0100
Message-ID: <20231117173650.21161-3-johan+linaro@kernel.org>
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

Make sure to remove the software node also on (ACPI) probe errors to
avoid leaking the underlying resources.

Note that the software node is only used for ACPI probe so the driver
unbind tear down is updated to match probe.

Fixes: 8dc6e6dd1bee ("usb: dwc3: qcom: Constify the software node")
Cc: stable@vger.kernel.org      # 5.12
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 00c3021b43ce..0703f9b85cda 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -932,10 +932,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 interconnect_exit:
 	dwc3_qcom_interconnect_exit(qcom);
 depopulate:
-	if (np)
+	if (np) {
 		of_platform_depopulate(&pdev->dev);
-	else
+	} else {
+		device_remove_software_node(&qcom->dwc3->dev);
 		platform_device_del(qcom->dwc3);
+	}
 	platform_device_put(qcom->dwc3);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
@@ -955,11 +957,12 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
-	device_remove_software_node(&qcom->dwc3->dev);
-	if (np)
+	if (np) {
 		of_platform_depopulate(&pdev->dev);
-	else
+	} else {
+		device_remove_software_node(&qcom->dwc3->dev);
 		platform_device_del(qcom->dwc3);
+	}
 	platform_device_put(qcom->dwc3);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-- 
2.41.0


