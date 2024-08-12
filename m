Return-Path: <linux-arm-msm+bounces-28282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B794E573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71701B21BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED681509BF;
	Mon, 12 Aug 2024 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdNqb1YU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94315099B;
	Mon, 12 Aug 2024 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432065; cv=none; b=D7qVGnkmtcXt4xrZvvAzpUR4irzeyxcL6lu484dvtshC5ClKZlmhIEcbq1pt25BEFg/g0Yrz55QKWyfxpGy/phO/W+jap/ntBiDZGRyNB9JxboRQ3sh7kT1sJ4kuXJ8SWM5GWPgcQE3/tWY37apQJN6aYFpeJsEVaY37V6ja37c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432065; c=relaxed/simple;
	bh=IBs5TNIM1V/OXerzEeVNLCwxeUyaiFvUp5FOXG1kAHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLe001jZRREXg32TkugbqIKZXsPOX2xie1Mor0hkSsc8GPU0Pdhc7WuiXbPaks8kNRWiabngl02CytFh8FLqOsrhgwfa1vJqdRW8L/RoeDmZk2shfsG7hNGg0UKz7ABMMLrP3ckT8vgSOgVFdPf/MUFkEIuUKweuik4eOwQhkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdNqb1YU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A3FC4AF13;
	Mon, 12 Aug 2024 03:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432065;
	bh=IBs5TNIM1V/OXerzEeVNLCwxeUyaiFvUp5FOXG1kAHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JdNqb1YUKvZ2mRBuAh1JHguufYDohJKRyLCqeKECq94xiiM3vomb8LvJjlNRlfFNY
	 TmSjVtb5ng2tQXaO7aNR+ZBcGujudf9esZadxKIcGM2Xrll11ZPPDcNCNrhzexGMvl
	 sHY9IcKn1gUbG/oZw46eFdzAEByWgvIaoj5I2RBr1a7HMqCbCknM9xRl4tvlWPrr0b
	 5/e9GkKBvTzGmQ063tdl4mkbFXYgPXeIuibajICf3+2KKcLYTaPiATMP3loHKejhYN
	 YlgwnMn+App/Exx352L1dpKLTWW00Y09JjWbN1QAOzdRvnJCQXgiO0X9+8t22FgPzH
	 FHv5lYH5ZjgBA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:12:02 -0700
Subject: [PATCH v2 5/7] usb: dwc3: qcom: Don't reply on drvdata during
 probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=7AcXBxFPjtawUiIPQkGwBPtWoCTuSNqW2M4A26Y8Cxk=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2AT19DtCXobrxGKJK8Xc3bfr/te/zMxvexX
 W9EXZY8fmqJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVngw/+NkEXi7z5zCpPgEy9PnvAlWNUH3pbCtc5B8mw55/
 gJnnpkOwT3ImbtDGjB2UG7PKBMqEHhUyZG5Nmmbw9+YrTD7ReIn8fQBHfR/XtK+2YeOJXbBNwlW
 HMhz1B8p1vBMWzh/bzSys/yVrlOZSAPgp4KWWYemrnuxkWoAx1A5RgWe16x/7m5HX0XgDwc7CTn
 XQs2p6Ysal3uxz9kAvj8sLb/5RYbbd9kVX20FVsIGTdUxgo0N/Vx/40rn1VUDYn4kfQac1bHcGV
 /+Yu5lm49/zC9+dhhBtWMGiAJ0xZw/o5BliMjJJssuEby490ai8JJTWl1hc8od4VpUmZBB9X/Kb
 grLxI34nvLP5CzpZz4tfiVw4AYZgSKpwK6pe6fCGhgiwdpKokVA2QjfKpP3ivOEPswmELFaA6LE
 tkFy5hl+RoGKMQlEzD8hn6sSOovI3ogr/Gmj0TIAAREPLUtbhBf5FFqeNrvWDO2XZDsiOCdE+uj
 5fvLP9dJHZAkyC1w8xZMisA9odhFROzUjGjUPMQzUlEpJS1zjBd3+3oHwLASpVhh7KGsc9kmm+U
 Bt1fl3Vgn1of1E3QNGWkrkmP7ETf77Ufv2fGNdCesl6hTdGTzCjsgilAroRfZ/Z9tJ5GYXxjCHb
 76nto5DKOrw8rimYtSxzXi+B+ReznVW9ZeA8aXCd6pwk=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 88fb6706a18d..33de03f2d782 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -546,9 +546,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -633,9 +634,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -644,7 +644,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -699,9 +699,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -782,7 +781,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -797,7 +796,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.45.2


