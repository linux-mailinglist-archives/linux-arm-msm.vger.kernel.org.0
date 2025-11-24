Return-Path: <linux-arm-msm+bounces-83024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08694C7FA15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4487E4E5EBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05EA2F8BF5;
	Mon, 24 Nov 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gE9SZfel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5cWSGcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5D62F8BD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976386; cv=none; b=EuVRU3DHU9tA5UamvDRhOvXlGz214N/NnQoLW+PPMAjtfUoXtX7Kdva5Aq2k+o7/y/hiXC1Lhb8iUrqWSSw7yeiHAhjnUYjvS6AMaCETNJUUbT2YLh4BJ2W08ot17JbBensQk4xrDACg26RXSh0IdeGjzC3k+DKcTsCQYjo0GHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976386; c=relaxed/simple;
	bh=DR9ZshB3tCF8ot5jNA0cLJbKXckeVnTyWsQbBdZAI5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAu3ES8T43Sl6XbjoM0myiPw18quS6tWNHL88kEDNECo04ZJM3T1EhqxBGJrQjDzUZfsR0CwS4EeO9ijW5YbHyqLzMizYpbmor3kpx4TSuyRuDWw47kItjwzFMrSeFTHppIYqqPU4EP+eE8mMd7vQyuBMz8lvc+IeKkpKx1G7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gE9SZfel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5cWSGcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7vQuT2411517
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJY7Rj8zcXCk0C9xSYbel9jvd/INPXaMfmQIQcX+9wY=; b=gE9SZfelrcOABPcy
	bPc9JgjFFoyHzhtrBHSuKkjdeZXYEUlPKxARjW91ALOsu+7vA9KgGavU8MRprr+K
	SJb0z5eO7f8qQmdeG40Osk8ZPYsT+r02NzvElnNincKe+VZoqH54cuBnen0e02KG
	heE37+IWWv2uzqTJtJIha+F3RD8hbpYxR4HigA5EssR5PbPvYBXI/IJyhMXZvoSg
	AAcDu/KhVDpaUqXXfwDd5hrD+IbT9jYZyOzKrica/LViaTxn6IEAL4/c+2xeWndc
	3Z9j8oIjL+WtJCqc9LhigVDg9hPQ29k9dAKUezvIXc+Z2ZDzW6qVMrVOm1lop+oL
	HGaG6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdvd3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297d50cd8c4so138677005ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976383; x=1764581183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJY7Rj8zcXCk0C9xSYbel9jvd/INPXaMfmQIQcX+9wY=;
        b=S5cWSGcpmF3Bi7net5vIHHUKD08qKmmxdF6G2KKUBd+JPR1radFPZ+uSrbFdP39MOj
         mqYHlpWRTbi7WzCXHk4hezfJiBm3wl8XJYqTMOWFpbZSU3L9lKt8/reIhaKKGynLkoLI
         p9FCDGRB0Db54TKvwvYqXK5fYeDxBL4wrJWDFDWLQ+FXyrHw/4nEd0qSjcXV1OAh2SmU
         NRid7uEh2fPsRM3sWe1anCvk7hsJ3SUGJLnFG7GybA1CgX/7voF8sTt1YBvPdHXpdOis
         zFnpADIkVrxa4cAoD+z5MOg3y1/RD7mF/BMk3gVeuB3/Zl8pXuaRko2td1ovPFyp0mWQ
         lVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976383; x=1764581183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJY7Rj8zcXCk0C9xSYbel9jvd/INPXaMfmQIQcX+9wY=;
        b=aLj5JriE+b+f1DXjaRZ7UM4fjBceKMBv+gZy2XU9fKezOIfqwXeBtEOkbfZSUftUYt
         gBEs+c/fTomsqSwMRSiukXpZ+DFrHJrKk4AzUuNMvfXUnTE+fycWqh4pwj8gBVIuyBbm
         YAnlvhDouK0SpEcPjH4zutQcnhNM7SDfqvMtqPwijGG8JfCYlmmsfKrVmpUF1yUllWtt
         5jbL2rJ5IYR+JiwQUZOVz2MC6S+knEuJ7q05sWC0K066z2LWiygZjBZkOP3gSVrd/PMm
         e4bWhYb7XyYOI8WpEt/Tnlvaw0aWF70/xTZz5hyOjqFsJZMBxaA8nXZCz6Rr+8NPlO7L
         wprA==
X-Gm-Message-State: AOJu0Yyy6+UQTjkX+9Imb6J9DCAWwLSvOcpLDsMRNpzEJY5lWN2ik9bT
	gHOe17BFgF91U6mFSGuebJOAYH98e2pyaaEl0NDLe0qhXXG2PBIpvHbDBro4Mp5rnUzlzwpB+GT
	3SsOdVGOWMkprh1/fA9PQHUMUXfqMt2mzP7P7FJhA1fBYSRMBZtYEsKuJiVUgPvyyIl7S
X-Gm-Gg: ASbGncsN8wcg0o7WeUwIUBj0XNhwjaT9sMtvV6h4iRdSPNpPVi2QVhW9s/QQ1vvXtTY
	v0VGnktUw1GtxQtLvPb1zegEN8TNBSpiQG+sUKCNCqlD2P+f94ogIYt6ApwDL0vbqTW/rplIRz2
	5xaK1FjpY2dTevkJ1JFHtgpzZMxIFUo3V9dIefZ7UIA6fvUedNWNSISdc+MSsh0idKjEinb20uG
	rs2JDOIew2C8jo/xw6QOxykFPguCS05KJ9efClI00xK07XmAqfeD0ZrrS72RszWBthDZjZw2GdI
	pmsf2bE7OWLa5RdZ1KYIaBZK4HdF4pTggIRWAXr3Nnlhm2HwAvS1zN/Pozfso5N9gRXg/h/aFkl
	Rv94wOVQ1bbNbVFyL52aKbxfIwxxLspQLdHoo+oU=
X-Received: by 2002:a17:903:1a83:b0:295:888e:d204 with SMTP id d9443c01a7336-29b6bf73815mr117612025ad.57.1763976383057;
        Mon, 24 Nov 2025 01:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXiu4X8k99lPstiKTSh++HZ+UDc77Vx174r918bKFVvRjzwR5/PL/BIK0pJ0dX100a60NL+w==
X-Received: by 2002:a17:903:1a83:b0:295:888e:d204 with SMTP id d9443c01a7336-29b6bf73815mr117611775ad.57.1763976382548;
        Mon, 24 Nov 2025 01:26:22 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:22 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:22 +0530
Subject: [PATCH 6/6] phy: qcom: sgmii-eth: add second regulator support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-6-73ae8f9cbe2a@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=2606;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=DR9ZshB3tCF8ot5jNA0cLJbKXckeVnTyWsQbBdZAI5k=;
 b=mPop2tXPQ4qQaO+f9OHG/yKFpsjo/voNre3K2+Bs/qAos4xoq4jMK5gCGTip9ybAh9MIaJ0vA
 zdvPDtZF5TeDG7YyEdJX+dBP3UlB2SulMGGj0pQ4JPaQQ9NtBb73QFa
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=692424c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gIf8zwsM_d9Eo6wCimYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: uyRYw8cQ5PeFJMrhxuoUZRuA8knBLRJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX/NrYtsFSgINx
 YkVYhvwpBDDCr5N/rssEXVDPk1etHvxC7qOWQb/uDPl/kupxDt5Hc+3TAcG3mnLG256PJ+z5h37
 AQcOc9uPKsDJKw+ptrKg91kugt2gJqGPXdKop/y+zNKm/d1FtsW1B2ZFtHnFdSG9htx9OotyK+8
 spJpb8f4W2b+3SdCsAcQkAnNj0E1Qvq+mh5r8K0UbB0es8CxtysGCingimoqZ3yv+odgyO+mGIC
 xAQIniPKuw4WUkOr278pVUOndUjQIKkrBUD1hGv/NbPFVk5h3eSABVInb8vHcPh0RtqxCsSEqqZ
 T/yudzT+buIw1PKQMta0lxOz3LAwGXJ3kOy0j/NmQ10UvUUf593ufKLEbsl16Qr5KLZNtFnQrNp
 uVb5cGEVD8p/FVv54SzaVsFzMKmrAQ==
X-Proofpoint-GUID: uyRYw8cQ5PeFJMrhxuoUZRuA8knBLRJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

The Qualcomm SGMII SerDes PHY requires two regulators to function
properly. If both of these are not enabled, the following error is
observed:
[   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
[   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed

Therefore, add support for handling the additional regulator in the
driver.

Fixes: 601d06277007 ("phy: qcom: add the SGMII SerDes PHY driver")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c126fe3a046a89601483d8c73090fd3..5044f244762f4bb2318618b83bd94324d445b62d 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -10,6 +10,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
@@ -26,6 +27,7 @@
 #define QSERDES_COM_C_PLL_LOCKED			BIT(1)
 
 struct qcom_dwmac_sgmii_phy_data {
+	struct regulator *vdda_0p9;
 	struct regmap *regmap;
 	struct clk *refclk;
 	int speed;
@@ -266,9 +268,23 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 
 static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
 {
+	int ret;
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
 
-	return clk_prepare_enable(data->refclk);
+	ret = regulator_enable(data->vdda_0p9);
+	if (ret)
+		goto out_ret;
+
+	ret = clk_prepare_enable(data->refclk);
+	if (ret)
+		goto out_reg_disable;
+
+	return 0;
+
+out_reg_disable:
+	regulator_disable(data->vdda_0p9);
+out_ret:
+	return ret;
 }
 
 static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
@@ -283,6 +299,8 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 
 	clk_disable_unprepare(data->refclk);
 
+	regulator_disable(data->vdda_0p9);
+
 	return 0;
 }
 
@@ -343,6 +361,10 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->refclk))
 		return PTR_ERR(data->refclk);
 
+	data->vdda_0p9 = devm_regulator_get(dev, "vdda-0p9");
+	if (IS_ERR(data->vdda_0p9))
+		return PTR_ERR(data->vdda_0p9);
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider))
 		return PTR_ERR(provider);

-- 
2.34.1


