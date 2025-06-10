Return-Path: <linux-arm-msm+bounces-60775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A441AAD3627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FFA9176B40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A0A2918F3;
	Tue, 10 Jun 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="A1U0ge5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396692918C1;
	Tue, 10 Jun 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558475; cv=none; b=bHIzeC2qw79UpP23HSYh0Iw0bSCTRsPEP7iVIzBc/11d3luEmv97rtmVi0uWbmnrfqhTnVPZeDjQRsRXI1GQMf+3t5TgUyrN8GeQCkGBiAoBB1uMoQgXcq53+06nronh/JSuibUMvr0j5XHIdpVCsky1c6nDIQ+GqnhldMqeIuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558475; c=relaxed/simple;
	bh=Fgl8Km4RcqFqfY5t3kYoDxE8TNS0WlKWi77RytkhSfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnuRRIgnzurCyr/Os8mo9wT6W7EZd75jkhcJxHUy/apuxvUm2oxCAD2zsjWZQrrL52xim4evpIcdk3grwi+wWjaTb2VVrM6T5F+EKh12Mt0cw3kCoCJ2FqqyZvHfQxHO016hKGZvO8SaWByQ2YYyR4S9lQpzDe2TxVDPiB3AiS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=A1U0ge5c; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1749558468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Bbt95GEmQZjMfBLT8mqmVirRMgBRSh8XbLFCIcVluk=;
	b=A1U0ge5cGHWCXef1/O7X6PRMh1IycsE0FrYls3CumAZvkv6CE6op5zROUo50PfT/Sjf3iC
	EY2cFaSkyb3p4cxNoaS9gGaBYVWqoRcE26N+Zd2GK2jXneEBuVZ5AkEsK/E+h8XO0qeFzz
	27yONfEjeP5PYKNbxNkp6G8YJGubTOM=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH 5.10] usb: dwc3: dwc3-qcom: Add missing platform_device_put() in dwc3_qcom_acpi_register_core
Date: Tue, 10 Jun 2025 15:27:46 +0300
Message-ID: <20250610122748.22575-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Miaoqian Lin <linmq006@gmail.com>

commit fa0ef93868a6062babe1144df2807a8b1d4924d2 upstream.

Add the missing platform_device_put() before return from
dwc3_qcom_acpi_register_core in the error handling case.

Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Link: https://lore.kernel.org/r/20211231113641.31474-1-linmq006@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Denis: minor fix to resolve merge conflict and add tag Fixes.]
Signed-off-by: Denis Arefev <arefev@swemel.ru>                                    
---
Backport fix for CVE-2023-22995
Link: https://nvd.nist.gov/vuln/detail/cve-2023-22995
---
 drivers/usb/dwc3/dwc3-qcom.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index db3559a10207..568973582b75 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -622,8 +622,10 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 	qcom->dwc3->dev.coherent_dma_mask = dev->coherent_dma_mask;
 
 	child_res = kcalloc(2, sizeof(*child_res), GFP_KERNEL);
-	if (!child_res)
+	if (!child_res) {
+		platform_device_put(qcom->dwc3);
 		return -ENOMEM;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -659,10 +661,15 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 	}
 
 	ret = platform_device_add(qcom->dwc3);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "failed to add device\n");
+		goto out;
+	}
+	kfree(child_res);
+	return 0;
 
 out:
+	platform_device_put(qcom->dwc3);
 	kfree(child_res);
 	return ret;
 }
-- 
2.43.0


