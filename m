Return-Path: <linux-arm-msm+bounces-86771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6915CE5EF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2956C3031376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 04:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34A62222B7;
	Mon, 29 Dec 2025 04:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu0N9tHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQw1eg68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BE242D97
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984131; cv=none; b=ZI1bROSXA18BU2dTiJPNxIHhSG65/kuRx3tZI9F4ssOcOLQ/IS0C0GZ5jQn74zo7ErPQoUqC1fnEiBU1Wp8nWZWsMhwgib6HI+6HaRCjsK7oRmpkFtUni1SVf4mqN5zB35feI9VyzgnSOzNELGR+Y1cbL6lC0GcCO5pnCtgDlB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984131; c=relaxed/simple;
	bh=OQWQWcWc7+ugBKip5ict3pRjJ5gzBzgAXNCqirSWtMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uUshRhPQzwZ7KL2uT0fStz98CYXsUxO1Uw+1iEkYTvVNkDc983cxRox6/CUOmFKn8POtMwEqZHxmQQh71CrsuScWKugTdEodTwqW/MwIR62RaIcNRT5Jsdq35lhxM19b8CewjaP8GQGpeMwLSCkpPpF8MQjx16uWwt1HNuwK6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu0N9tHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQw1eg68; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNdJem322822
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fPoLwp83rIO
	Ubb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=; b=Vu0N9tHdiAxgyKJY6LxVF8dxnjE
	/TXwdIG/FzC4lt09+K1YOLGPsEY/EfDauFiTzl09pxwaaynXFMSu5yr5pdtWO5kx
	pksOk9EIPzV5uoHMSl9bc9P3MpnHruEbtLwdigOalYg1srhFJT5nvRcfWPWPedTF
	XNF47epofjL3i4IeKX8TCQnZdGvYZHb8vC9rJm0QsGAYp9SQgtjptV6rHw6LrxKq
	9qPqgx3eUFPQtX7ZgsUJrJTd3yYcTz2hI6kJ0XVJcvAA0lyk2fogKxWuKL74iAGz
	Zn+CrRp6luUv+WC4m6T9aBydlD6MRow/ovYjxEEi0PbDrvUH1MvVxaTSOZw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0mdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so10358726b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984127; x=1767588927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPoLwp83rIOUbb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=;
        b=LQw1eg68knp3CCKmn16t2jjWvVLjFCy4dYlPZkhOEx4U00BUMFE+YT5Y4QxD+/RIuf
         mHA2jBLPjBd9xwlw3D5Gw5e61ch8UNH+tdhmBvkvevaCs/BbjpebG7CWJy9aRUNLq8iF
         AygCwGVcsyNERxUk6oJT4OU6FcSQGYKIYr+tygUrC2OP92IWQEo4jlmobzGUHL6e4pP/
         yQ/N0q09JKfPYUwM/+nz6h766bHrk5rGkD3ay7H6B41M/Bkkpnhx8yGi5gUEXIzWd0li
         VzhycvS7nONlAkl2Z/oW7X6Nhm1FrA/KILn8g5ae0fI+v0CKTU5b/fXrz5hv1lnNJV4n
         GcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984127; x=1767588927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPoLwp83rIOUbb8PD9th6XfMRFsQj0dEVzVP2zhRPbI=;
        b=Yc0Egsg/Veg3Mrv1XxHGlnceWBe2NyTSNy8/hqB63eNskjiIG6631FJxkoVlDXdnjn
         GcHPYUc+rH6hZG92h5cgrkjqPC84KlKekeiOuC6G7zsTh0Bb0TpnQUwavAHx0oC74zS1
         y1PPeyb+j81Xlr9vo20Q5axSIfw+MOx7Tb1YUa6JEgnYBUwhJRjLbd0prkCmXlN3V+og
         936HfGkkY4PPo3TDQe3BT6t1hekhNl2l8Gp/ER5EO6gYdc4mZn1HhvVrTpBEOy7xjgpQ
         csMeBdjQBt4m6oJJ48hsF515oq9jroF2hdXLO6Af5t3UkWJWdVSvCN6m6mvo22W9XXN+
         8Daw==
X-Forwarded-Encrypted: i=1; AJvYcCVaCahzqFTer3lABzhd1/GK0tCJo/KA1Y0Qvj2Wv/vIpRZHUduXZNeJPuJDMgaGRuk8zetLvbEm4fPq3brM@vger.kernel.org
X-Gm-Message-State: AOJu0YxlFI+6IZos+FutLF5LI/AlPrVGbJc79EVAyA+ha5FKnxT3lAEk
	xBpI6ZbY+ZBUMMuN1Kq6ku5wHv74KX04AiMMigbpSU+UQi218qF0mn8EXcX1yfCiCjf0hoGgqVp
	x92FMbU4WJPLc23WzYw5WORSbCWkW0zX3sUbDXJcWZAp2/zSwVPODY1iw9I8bMmbgBAx7
X-Gm-Gg: AY/fxX57hMqYoZMH9qACgnOlKjR5zxLcmaDfbNmftZgUmwjaH68/0X8CJWBAgvRhiRY
	OkilydQb3S1rb+K8D+qEK2qzapMiIlJD/dDNV+Ykr8nwKMZ/Ef93dIZtUYNGvCZN8XuRFlPFag/
	D//MjHnNdj5xmrdODvqDK15qJyJcdFZSrtJjspfOaZR91xPyPJi/UsYrz+Jp2j7VMFDXjYHS6sj
	G2Y0rUJO3vvmK8SdbU9l7JCRTi5LlLa4tA4QkSAj9Mnj3loAlwq+TmjK8qK6z/o8bGsOrH6FCtt
	qRleHU/+s5zyBWPVbzsouXQ1BLbhSwsZUQegpTEL1MMWpsSWR+agPDo7jf1Ek+Nmwx/+pjINGoy
	j19gni1oRnzojweR1FyKyEpeB7eXr0XJ1TT1c/gZpw5E=
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr20923706b3a.50.1766984126602;
        Sun, 28 Dec 2025 20:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET5KLQmeiePvPhp+9fn08iXUwoY7qGCnQlUsCxN4yQLmjNhQdHtOuJzfBOUrgTiSJoFVhsQA==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr20923682b3a.50.1766984126021;
        Sun, 28 Dec 2025 20:55:26 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:25 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 04/12] soc: qcom: geni-se: Add resources activation/deactivation helpers
Date: Mon, 29 Dec 2025 10:24:38 +0530
Message-Id: <20251229045446.3227667-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MvUmvFqd4fAqVD6Y5AtLmSekZpqRiAqF
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=695209bf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KBRiQYpxJDLEvAb9SdYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX0xIiqpZv/jzz
 2FfRscj8eRwFBaRsPVR2L3gHJ/7DsmVRCCSdrWTdlzSVGxWfxE2UURXaEoLFHVi8BGZVSztTA1h
 1LMDKVXX9/sAkZCQQTdPbpUbSApHzuzALJDQ4asiH1B1NKGQGe1kH1pAwmUzGffiUuEBp6UcR//
 wGmxOqlYp7iK7ArYgeqXXy1HE/43jzNjFyBDFpELhtPaG4daQ+jNRd2itaP8VbRHL+2xvRHIk8B
 sT0iSMucZssj0xIfvuU6vuKCcCS4xhvnPaXt/PS12l7KQEMZjn1TAHfPy3AO44+sr+RVnP6bNKL
 O+VLrcAA5n1UdAYO4AyETLV1s8vfz6ODpy0B8pSJyhd5vL8r7Z2jvVlEAP2D4qewGkDTXgnsHb9
 y0imddTxBhx1s76BLiwNG7RgwDvL7toqxpP1/z4Z+mfeDYvyP2bvhg0oUzTaI7EZfe9Ke2HfIQ6
 P+7mAsPHmJjPnpW7kFw==
X-Proofpoint-ORIG-GUID: MvUmvFqd4fAqVD6Y5AtLmSekZpqRiAqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
activation/deactivation sequences independently, leading to code
duplication.

Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
power on/off resources.The activate function enables ICC, clocks, and TLMM
whereas the deactivate function disables resources in reverse order
including OPP rate reset, clocks, ICC and TLMM.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2
Bjorn
- Updated commit message based code changes.
- Removed geni_se_resource_state() API.
- Utilized code snippet from geni_se_resources_off()
---
 drivers/soc/qcom/qcom-geni-se.c  | 77 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..fbffbc9ea7a6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1013,6 +1013,83 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_deactivate() - Deactivate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Deactivates device resources for power saving: OPP rate to 0, pin control
+ * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_deactivate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	if (se->has_opp)
+		dev_pm_opp_set_rate(se->dev, 0);
+
+	ret = pinctrl_pm_select_sleep_state(se->dev);
+	if (ret)
+		return ret;
+
+	geni_se_clks_off(se);
+
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+
+	return geni_icc_disable(se);
+}
+
+/**
+ * geni_se_resources_activate() - Activate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Activates device resources for operation: enables interconnect, prepares clocks,
+ * and sets pin control to default state. Includes error cleanup. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_activate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	if (se->core_clk) {
+		ret = clk_prepare_enable(se->core_clk);
+		if (ret)
+			goto out_icc_disable;
+	}
+
+	ret = geni_se_clks_on(se);
+	if (ret)
+		goto out_clk_disable;
+
+	ret = pinctrl_pm_select_default_state(se->dev);
+	if (ret) {
+		geni_se_clks_off(se);
+		goto out_clk_disable;
+	}
+
+	return ret;
+
+out_clk_disable:
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..36a68149345c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -541,6 +541,10 @@ int geni_icc_disable(struct geni_se *se);
 
 int geni_se_resources_init(struct geni_se *se);
 
+int geni_se_resources_activate(struct geni_se *se);
+
+int geni_se_resources_deactivate(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


