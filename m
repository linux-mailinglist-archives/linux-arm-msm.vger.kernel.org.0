Return-Path: <linux-arm-msm+bounces-81989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A55C6196F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8147F363E79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AC5283FEE;
	Sun, 16 Nov 2025 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHFtvhzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KoHy3qUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4230FC1B
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763313455; cv=none; b=nPJ1W2oX/Atl/3oFQOUFKcj8IMSyYXMuGcx3S5HZfjYDSLikTiQD5u/eXPDjlu2LfOXgkToCo88zU1uP/GvkSMp8Ro0opuipH5smXgFwiGD9fWFLSbUSu08oywxhWsLrksgJnNrQl11rXSEy5qcI999OZsJ/+FkM2W56NAAAtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763313455; c=relaxed/simple;
	bh=A2jhTJBv48tZR9KSn0M18zAOHPP72niCOfvHJ8M+HQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DQAsn8AKoPf65Ra4rXY3x3kVZPfb2GhB+DZyNN2L1aLd0r1TrJXPOZnpbG14EXH5/FxmehYvC6GtBoBPia/SZwL69Okz8QaMmghkZRrP8p2f8KYNdSXWqiISTKsmk5HM7H51op4YyLqhtQajRME7E1jg3LwoH1U0nx+41HrPGGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHFtvhzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KoHy3qUe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGDoYTY1033817
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mNvZ1sxdcon
	k3p5fqMzobXp1ThinWPQ04PJDoex8tTU=; b=VHFtvhzZcvo99Y4Cas5SpwANUJh
	Jg1KGB5TXdehodoaxA2M13fEfHxWu7bC0ajhbSVBqHomxSb4SPofUzJEnYI2ZHNH
	27upv5mgYMxHb/aqBo8CjVl6gH6nEuGOCV+K9BT2wbpAiFxyWTjEMOARHjecyatT
	uSJkn50z4VOxpRKu3gJD2+NtXEp6cBH7BKRpNOQE/L0SLbem/5wmSnhLh1tB+JJC
	AeTnzDh/pQdcGdNwJFWFApTfY8v3KckAu4Vzdu5FQvNHYX/el3xRsZZUt1kqeYzk
	pbLEbRYnLxriu2SN3wUiz+Coh3d2WstuP5ULLQ7xxtekgwFSX3G6gaGBFug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmytd2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f587dc2eso56145425ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763313452; x=1763918252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNvZ1sxdconk3p5fqMzobXp1ThinWPQ04PJDoex8tTU=;
        b=KoHy3qUemc2Ta1989GfblPki6jP9vNgV1AGatxJDJCz6W/3QbG7CvBzY286mY9je8z
         z672ixUK4rEW4aeU/2V9+oUUMcNcShx/BH5//dPaqhMUsDIIKcDulcJVaDDCrSnWo2rv
         YbmiqBqdOAYw/UlVEILK672olPoxsSMkcoVYee34XauTS92N+ZA2lsCa3gy1Wd8iAU3s
         vBnJbz97qGNWvhvi/eadey9k2OIBKX5qBM7PXJgmMbd0a6Zy6c0wLlsjSKifAN2wncpo
         eOiIAcJsjY6NYvKBLUSfnNL/RYlczsZTm5toH93+TsRUefl2n/wSool0F7luUpheL1vY
         Yf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763313452; x=1763918252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNvZ1sxdconk3p5fqMzobXp1ThinWPQ04PJDoex8tTU=;
        b=nzJtUKMDLwEmv5zX8tnrHNYraUdTjcIIoUuGURkdt/tNIxBDUVDsDSDw7kt9dSAwUN
         gkmr0XITiYqjHPGGSNKlFohkF0IEXbfSWtHNPqoVSPpScy12txk931GRSzggh13pSL/U
         f4hDgubAFhrORADYRJipndwi+anGs7Faj8i2LuWhHK5UdfIb3OrPJthukGeFvbgr8bTW
         6MxiC2fSa1xhggWZlQmCz939+acM9E7vtRFBAZuagE8wuf9y1MFax5vf3JFMjvwowgp6
         MGvWJKYGbVJl/v/ZnWAQfpYYtSNfnFLBwDQQtibNqek3dw8LD9k4X7CtmwTTCqXwe24i
         SgtQ==
X-Gm-Message-State: AOJu0YwJYsnQ0/KUFvbU5TeJfmfttAUQpaJH26ydGRHS3Ny5KMruZMTP
	CUHF5jJoAkglF2kN52mcC+j/5hv8EqV9hZjjYv2ydCPTdNzGeifN2bK30MmOw38O4kAH240lzUC
	rTj9PT115EOOQ2XHORvGzDRVuov5vPLrjfpDy/ZVFaJgjaz/YKmiEzgjLJrm5/FrAGv8Q
X-Gm-Gg: ASbGncttuXZfZML/RDSkAtby2lZy9vAnGE9tY+In78yU8ObiMXc1+btf0HydonDII0w
	sJrUQ24CYGV6iebRmDvWBOp2oUM+tkui5TJKyR8eYR8sZSLnA/WSW6OWts4rQ30UftZwV0fNJCh
	1qs3vuNTb0Ff1IIM694Pv5hXzXSTLwlBgYB71o+RInMvUyaNDn891e2iCt3uzyfP5Um5w3VimD5
	VIPVTaW/HVvoYEwsf1cFkKnWiJJCV3CyqYT9KlRSNEy5FDBzpmfGp0yYh3jWUCMIPrq53pFPyPo
	vDHuD+l5Yb2RamZ+j8kwHpsGmunaofnHciVrQdbVUP6CcOa+MYNzxIDwEijqltGdLXGc8PiwlvG
	sUmR6aLMRNT9Y613JZYKZEa+8ez/kcZgJ28g=
X-Received: by 2002:a17:903:2b0f:b0:295:7804:13dc with SMTP id d9443c01a7336-2986a752f37mr117517195ad.48.1763313451812;
        Sun, 16 Nov 2025 09:17:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcollzvNLHgEjLejUyvWHUz/nRw+WP3PlAjwTxM/ylAwspGtn/jj4JDjfPsP7XgWozxdttQg==
X-Received: by 2002:a17:903:2b0f:b0:295:7804:13dc with SMTP id d9443c01a7336-2986a752f37mr117516915ad.48.1763313451310;
        Sun, 16 Nov 2025 09:17:31 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm114415105ad.59.2025.11.16.09.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:17:30 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
Subject: [PATCH v1 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P LPASS pinctrl
Date: Sun, 16 Nov 2025 22:46:56 +0530
Message-Id: <20251116171656.3105461-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0MyBTYWx0ZWRfX5PmJex9zUcoW
 H5HWSLnFW7C5V1wFO2WQurFCZtTCOIXynaLD1BxGMGEXbOzkV9hUrgZZOJpSmoQPH1uniBjdxYd
 bE1wGiUAgPzKYXhyOpTeVqDNzt3j4p068fGWsE2vwIPQRXLGG2+sAUUoTC+wxAQ/uB4Q3IulA6G
 wuWTCvGWir12Y8IN7qwyMxWo4hQOa8ziLtZmPCFRanmNpj6W3R8X7AJV7I1NpOKvC1Nkl5AXuog
 cYeddGUWBUi/088LwqeLRblnuyaB8eMVoTQBuKllQe9hU9ZJmVLmq718CwbKSikK8HQ4C+TBJOc
 cDZDXpA7NWzUhkRNO+kfforR0MWGpqNZzet5iTnaE+dm7tAkuNsTcC67TGx77g1TjzTE2XtPpDW
 QkvHWcz9E4tEKK8s9CN0ZPHtDg07EA==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=691a072c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TKk1ZooRSNHayU2e024A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: biLK-m4XpNa_WQqP3QezqPUy8Ej-6ir4
X-Proofpoint-GUID: biLK-m4XpNa_WQqP3QezqPUy8Ej-6ir4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160143

Add pin control support for Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index c480e8b78503..bb1524243906 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -60,6 +60,16 @@ config PINCTRL_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
+config PINCTRL_SA8775P_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SA8775P LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SA8775P
+	  platform.
+
 config PINCTRL_SC7280_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 748b17a77b2c..b2a23a824846 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
 obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-mpp.o
 obj-$(CONFIG_PINCTRL_QDU1000)	+= pinctrl-qdu1000.o
 obj-$(CONFIG_PINCTRL_SA8775P)	+= pinctrl-sa8775p.o
+obj-$(CONFIG_PINCTRL_SA8775P_LPASS_LPI) += pinctrl-sa8775p-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SAR2130P)	+= pinctrl-sar2130p.o
 obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
 obj-$(CONFIG_PINCTRL_SC7280)	+= pinctrl-sc7280.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
new file mode 100644
index 000000000000..5f1a96e901bc
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_dmic4_clk,
+	LPI_MUX_dmic4_data,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s3_clk,
+	LPI_MUX_i2s3_data,
+	LPI_MUX_i2s3_ws,
+	LPI_MUX_i2s4_clk,
+	LPI_MUX_i2s4_data,
+	LPI_MUX_i2s4_ws,
+	LPI_MUX_qua_mi2s_data,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_slimbus_clk,
+	LPI_MUX_slimbus_data,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_wsa2_swr_clk,
+	LPI_MUX_wsa2_swr_data,
+	LPI_MUX_ext_mclk1_a,
+	LPI_MUX_ext_mclk1_b,
+	LPI_MUX_ext_mclk1_c,
+	LPI_MUX_ext_mclk1_d,
+	LPI_MUX_ext_mclk1_e,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sa8775p_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+};
+
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const dmic4_clk_groups[] = { "gpio17" };
+static const char * const dmic4_data_groups[] = { "gpio18" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const i2s2_data_groups[] = { "gpio15", "gpio16" };
+static const char * const i2s3_clk_groups[] = { "gpio19" };
+static const char * const i2s3_ws_groups[] = { "gpio20" };
+static const char * const i2s3_data_groups[] = { "gpio21", "gpio22" };
+static const char * const i2s4_clk_groups[] = { "gpio12" };
+static const char * const i2s4_ws_groups[] = { "gpio13" };
+static const char * const i2s4_data_groups[] = { "gpio17", "gpio18" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const slimbus_clk_groups[] = { "gpio19"};
+static const char * const slimbus_data_groups[] = { "gpio20"};
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const wsa2_swr_clk_groups[] = { "gpio15" };
+static const char * const wsa2_swr_data_groups[] = { "gpio16" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
+static const char * const ext_mclk1_b_groups[] = { "gpio9" };
+static const char * const ext_mclk1_a_groups[] = { "gpio13" };
+static const char * const ext_mclk1_d_groups[] = { "gpio14" };
+static const char * const ext_mclk1_e_groups[] = { "gpio22" };
+
+static const struct lpi_pingroup sa8775p_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s4_clk, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s4_ws, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 6, swr_tx_data, ext_mclk1_d, _, _),
+	LPI_PINGROUP(15, 20, i2s2_data, wsa2_swr_clk, _, _),
+	LPI_PINGROUP(16, 21, i2s2_data, wsa2_swr_data, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, dmic4_clk, i2s4_data, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, dmic4_data, i2s4_data, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, _, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, _, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, ext_mclk1_e, _, _),
+};
+
+static const struct lpi_function sa8775p_functions[] = {
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(dmic4_clk),
+	LPI_FUNCTION(dmic4_data),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s3_clk),
+	LPI_FUNCTION(i2s3_data),
+	LPI_FUNCTION(i2s3_ws),
+	LPI_FUNCTION(i2s4_clk),
+	LPI_FUNCTION(i2s4_data),
+	LPI_FUNCTION(i2s4_ws),
+	LPI_FUNCTION(qua_mi2s_data),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(slimbus_clk),
+	LPI_FUNCTION(slimbus_data),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(wsa2_swr_clk),
+	LPI_FUNCTION(wsa2_swr_data),
+	LPI_FUNCTION(ext_mclk1_a),
+	LPI_FUNCTION(ext_mclk1_b),
+	LPI_FUNCTION(ext_mclk1_c),
+	LPI_FUNCTION(ext_mclk1_d),
+	LPI_FUNCTION(ext_mclk1_e),
+};
+
+static const struct lpi_pinctrl_variant_data sa8775p_lpi_data = {
+	.pins = sa8775p_lpi_pins,
+	.npins = ARRAY_SIZE(sa8775p_lpi_pins),
+	.groups = sa8775p_groups,
+	.ngroups = ARRAY_SIZE(sa8775p_groups),
+	.functions = sa8775p_functions,
+	.nfunctions = ARRAY_SIZE(sa8775p_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,sa8775p-lpass-lpi-pinctrl",
+	       .data = &sa8775p_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		   .name = "qcom-sa8775p-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("Qualcomm SA8775P LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


