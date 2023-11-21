Return-Path: <linux-arm-msm+bounces-1288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26A7F254F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 06:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A8BB21CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC4619472;
	Tue, 21 Nov 2023 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="sYZSAqVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEF6E7;
	Mon, 20 Nov 2023 21:35:55 -0800 (PST)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4SZClZ3tQhz9vYH;
	Tue, 21 Nov 2023 05:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1700544954; bh=VWkiyyXi9IiPmSEbuEpdAjgFMlKgangprATD6XDAIOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sYZSAqVykXpSZoHFriT4k0s7IBNSjNPlrVb5SPaeZDjiVJK4qpIa3zLjNiko0q6Lg
	 W5fE11beMAuQQNOBD0Bzk099buzYTz7T2Cv6iJxDZIqeSMYM7OdDI2k+ZS3u7M9GHz
	 3Ur1C/Ki9jTPpJJ/5lis6gxkqmxpgwFzcsNLb3Mg=
X-Riseup-User-ID: 44156379049542D03EE563A7B28F009519EE46A4C06B28EF74D923BFF33AD523
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SZClW4Nf3zFvkn;
	Tue, 21 Nov 2023 05:35:51 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Tue, 21 Nov 2023 12:34:59 +0700
Subject: [PATCH v2 1/4] mfd: qcom-spmi-pmic: Add support for PM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-pm8937-v2-1-b0171ab62075@riseup.net>
References: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
In-Reply-To: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dang Huynh <danct12@riseup.net>, 
 Caleb Connolly <caleb.connolly@linaro.org>

Add the subtype and compatible strings for PM8937.

The PM8937 is found in various SoCs, including MSM8917, MSM8937,
MSM8940 and APQ variants.

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 drivers/mfd/qcom-spmi-pmic.c      | 1 +
 include/soc/qcom/qcom-spmi-pmic.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 4549fa9f7d4b..eab5bf6cff10 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -53,6 +53,7 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm8901", .data = N_USIDS(2) },
 	{ .compatible = "qcom,pm8909", .data = N_USIDS(2) },
 	{ .compatible = "qcom,pm8916", .data = N_USIDS(2) },
+	{ .compatible = "qcom,pm8937", .data = N_USIDS(2) },
 	{ .compatible = "qcom,pm8941", .data = N_USIDS(2) },
 	{ .compatible = "qcom,pm8950", .data = N_USIDS(2) },
 	{ .compatible = "qcom,pm8994", .data = N_USIDS(2) },
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index c47cc71a999e..17a0a8c3d656 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -31,6 +31,7 @@
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
+#define PM8937_SUBTYPE		0x19
 #define PM660L_SUBTYPE		0x1a
 #define PM660_SUBTYPE		0x1b
 #define PM8150_SUBTYPE		0x1e

-- 
2.42.1


