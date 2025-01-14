Return-Path: <linux-arm-msm+bounces-44956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB7A1001E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E873E1888503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C6623A11C;
	Tue, 14 Jan 2025 05:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0+hIFa1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F82397BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831154; cv=none; b=SjptwnUv0CFmInTdQ5nRJ5Gq5X4Gd7bPp2DhL0de87btTF87d2GFgI/rShskeiKAdPDdM7ZRk5/HlWsH4kqGCx+7+beg2D4ZywHnPKr5f/s4jQ0GnzN1Pmgi0jfSXGwZVZq9KQkEtzJv7UBHP67pIDzlzP9hQQ0N8DUwmggW6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831154; c=relaxed/simple;
	bh=HNcOKVWgkynOsQsZmCyiwG5aufCrKz7qvDtrRc11G98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsuxC+aqN7kmtI1XAHIo1kwWrpkrMdNek3YUm4g/BTfqfG2hNrXW2b/Fh4IxpDxIJbMPCmrbl9BnP98OxN9oHSLiZQ5dEHf+6RyjTvMxv+6EwDjVKcpPXu57aHWqlvf42Qwj0ONGZS9xTWK5Jpuv3MpPiCZISoKrh4LdCeLW7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0+hIFa1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E41itx022205
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7I2ZpH0MSoZBEKik/5sjgM3rSjLlQOF9XJbz0TLhn9A=; b=L0+hIFa1T5VtNHHe
	bJm3WN5qxaOHJyoTZBAMOnox7Rm8bT/18wrtNKVz3KPFDeOHj6ebgvJcfkYxU3J3
	8oSzcCxMNexLPycwh9a+BZifMCARB1XkX2RKpyv62IQhOAHmZYEs/FgaTlytRMZ5
	UpJQ7xICyoW1zEeiAh6v8fil33+jYq1+xAPTuwhzZmz9wUOpuHHwmKIQrUgqa+LB
	Qacfk1V0bTROA6gsD/cyfxt7PdEaQ37GJfYnjC0tbjNQJBDAVJuUoGosyRnc1fVH
	CU3tKthqaSoo8O5Y6yxx6h1+dWqbmqELl06mrU5VK2THXQkWC4xuwUC9Tq3jOOdL
	BAIplA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh603at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:50 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3eee0e2a528so4077069b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831150; x=1737435950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I2ZpH0MSoZBEKik/5sjgM3rSjLlQOF9XJbz0TLhn9A=;
        b=pnQ7ywgiXcPIO7cGL1psksV3lIsoXcM/3vnvzhx7eyZBHlI53ufgyQsbU0GXNcvFcJ
         sGw4oZhlXM8qK3AaiG2N1JrXp4uLHCEWj0ABe8uN3QJxnkehKp9hXaGQs3uY7VJgO2ho
         6oQV2e7MRRVIqfLGeHpZKNpDzin3aWhU29PFr1QIkOgUuaxneacVibI0pi7IPri9/Are
         N2se7VJH9AmKip9w774f7qmKdWLQmPlrms5dfwoZJ5IBUKKpkrt3Y3/58eSAwB888b3M
         Kp2wByD37dT+mj6YNzuF+ms4GeQ+8EUVm/WJliIslFuff6UeS6Q74ASmjkYyvvvB+TiY
         0VWQ==
X-Gm-Message-State: AOJu0Yxolfr0qbrGOpl2dcviJf9+15I9PxTTwCDzzhJ7r+JD0ZaEFq6l
	tQM9iO/jwAOAHT2yBAe4W7s1bXhCqn3lmg0tG3xs4HeD3VExQnZU6CX/PVJS6zu69ktn8h63jXC
	/aUhV5ivymcSV2qs9mEC/67r1oUgwVgVZckbQ2Z6iZcF5GARO2/UHS+flqKduLgQK
X-Gm-Gg: ASbGncvus/RQnWnAGNbxCdKyi5lJRELYXJMV+aMEPL7VJ6L+Jgqt1dwl4axAp1/F+z0
	pZPZE9MzsHa6ylNsCIuGHo/E6wPBVbqL3MBTjyPdOicGZcj3xQkEqBlL4YZUZaKmN15swo5xyAz
	/+RNu2zuiONpBjC56j8oTdYpQdHLeG4dUZIJHstPjS8kVw7KtYUijvTJ1bsOIeAMG6mxUK10qYm
	gm5deVGd6sZBB6eWK8BmeTK/wkGbL5uJegWDd2jpthpPLc8uY4IkQc286pE1+OF9mgwXhgNCBnz
	1phCt8YJyBA8jC7an0HPws+8ovrGaMo4t6jsXaV5+VmFFD6QuczeSDW2
X-Received: by 2002:a05:6808:2026:b0:3ea:443e:d1cd with SMTP id 5614622812f47-3ef2ed8a3dbmr3343796b6e.34.1736831149857;
        Mon, 13 Jan 2025 21:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+gUzO4oPE8WL+6+zT4G5culPHMuy1PnSlPkXpFnletZ4dNXodA20W8hlF7+K2WN+2sYSuvQ==
X-Received: by 2002:a05:6808:2026:b0:3ea:443e:d1cd with SMTP id 5614622812f47-3ef2ed8a3dbmr3343768b6e.34.1736831149458;
        Mon, 13 Jan 2025 21:05:49 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:48 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:38 -0800
Subject: [PATCH v3 05/12] of: overlays: dwc3-flattening: Add Qualcomm Arm32
 overlays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-5-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11881;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=HNcOKVWgkynOsQsZmCyiwG5aufCrKz7qvDtrRc11G98=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVp/QB6yC+BHC8j5GvacF7Nvn4ICJDkLLPX
 SflYtgeR+uJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWiKw//Uhyzkd0STQcAAV7kT2fVl8Ewe5JoqcRo2br2TSJ
 w/xkWDpBVSi/pK2QuDnIxyjr/KtBuQZ6v7BWLUE/7k89Qc63Rsq5nTA9A8/uiy6GOWRCEeVamJW
 H3tOVGe6UCFBESasOjQHOkzo0S/QpQll5949WkXbkqCoM+VOPyMTOnbKXRkddZvKcdstK5MLwsz
 0p9xD8bjyte+UnpmlDMWzIr3XJQEB9wC1Ys59RaJVdsQvyGFcqgKeEvYYDNYLtUXzksem94oj/O
 ob/JL1cZFRPa5m8vkGMJnlAXo2IhLgNZsXnklN1QuPIRVTM8qhNYXeGlFC5cP8lj/G7+LGLOVJb
 c8RRys3eJt9n6YCDur77w4pT4ag88GikuYXHpi4XoB0jC/ewSXdgF1i09lPrLlombwPHIl8x/BJ
 m2tvOTittEJsP3wTZMSB0cWWawuWxqbpO0v36nXwARevtdG2YFJsRcMCbEAWZ06+55ehf6PrNFA
 5yftg+n7WpaihzfysZrdOvph6sg1Osfk2GizSIgsqRSLscZmdE+kvnM6bp9Xl5ZW/mieUtGRNKs
 DMLNIiv64CxwqdCgLnF+xssYWOxBar9wcununXf/j3dERIyrTMcLZ0JICUeIiTS2AgT5IUdK6UE
 JhaeNghARkVTq6p7B9yMrxpYcOHDu1ADcSWhwd3Jw9nE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: -nNiwlSm2IYbZ4apQmFdrNYJI47IvIrT
X-Proofpoint-GUID: -nNiwlSm2IYbZ4apQmFdrNYJI47IvIrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140039

Introduce the overlays necessary for migrating Qualcomm Arm32 boards
currently present in the upstream Linux kernel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/of/overlays/dwc3-flattening/Makefile       |  6 ++++
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 42 ++++++++++++++++++++++
 .../of/overlays/dwc3-flattening/dwc3-flattening.h  | 13 +++++++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts | 36 +++++++++++++++++++
 .../dwc3-qcom_ipq4018_8dev_jalapeno.dts            | 38 ++++++++++++++++++++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts | 38 ++++++++++++++++++++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts | 40 +++++++++++++++++++++
 .../overlays/dwc3-flattening/dwc3-qcom_sdx55.dts   | 38 ++++++++++++++++++++
 .../overlays/dwc3-flattening/dwc3-qcom_sdx65.dts   | 38 ++++++++++++++++++++
 9 files changed, 289 insertions(+)

diff --git a/drivers/of/overlays/dwc3-flattening/Makefile b/drivers/of/overlays/dwc3-flattening/Makefile
index 78ed59517887..248ddabd424e 100644
--- a/drivers/of/overlays/dwc3-flattening/Makefile
+++ b/drivers/of/overlays/dwc3-flattening/Makefile
@@ -2,3 +2,9 @@
 
 obj-$(CONFIG_OF_OVERLAYS_DWC3_FLATTENING) += dwc3-flattening-overlay.o
 dwc3-flattening-overlay-y += dwc3-flattening.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq4018.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq4018_8dev_jalapeno.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq4019.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq8064.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdx55.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdx65.dtb.o
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
index fe8e42627fe3..0a3a31c5088b 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
@@ -21,7 +21,49 @@ struct dwc3_overlay_data {
 	const char *migrate_match;
 };
 
+static const struct dwc3_overlay_data dwc3_qcom_ipq4018_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq4018_begin,
+	.end = __dtb_dwc3_qcom_ipq4018_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq4018_8dev_jalapeno_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_begin,
+	.end = __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq4019_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq4019_begin,
+	.end = __dtb_dwc3_qcom_ipq4019_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq8064_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq8064_begin,
+	.end = __dtb_dwc3_qcom_ipq8064_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdx55_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdx55_begin,
+	.end = __dtb_dwc3_qcom_sdx55_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdx65_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdx65_begin,
+	.end = __dtb_dwc3_qcom_sdx65_end,
+	.migrate_match = "qcom,dwc3",
+};
+
 static const struct of_device_id dwc3_flatten_of_match[] = {
+	{ .compatible = "8dev,jalapeno", .data = &dwc3_qcom_ipq4018_8dev_jalapeno_overlay },
+	{ .compatible = "qcom,ipq4018", .data = &dwc3_qcom_ipq4018_overlay },
+	{ .compatible = "qcom,ipq4019", .data = &dwc3_qcom_ipq4019_overlay },
+	{ .compatible = "qcom,ipq8064", .data = &dwc3_qcom_ipq8064_overlay },
+	{ .compatible = "qcom,sdx55", .data = &dwc3_qcom_sdx55_overlay },
+	{ .compatible = "qcom,sdx65", .data = &dwc3_qcom_sdx65_overlay },
 	{}
 };
 
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
index 6147376d3c92..57d7dbc94980 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
@@ -4,4 +4,17 @@
 
 #include <linux/kernel.h>
 
+extern u8 __dtb_dwc3_qcom_ipq4018_begin[];
+extern u8 __dtb_dwc3_qcom_ipq4018_end[];
+extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_begin[];
+extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_end[];
+extern u8 __dtb_dwc3_qcom_ipq4019_begin[];
+extern u8 __dtb_dwc3_qcom_ipq4019_end[];
+extern u8 __dtb_dwc3_qcom_ipq8064_begin[];
+extern u8 __dtb_dwc3_qcom_ipq8064_end[];
+extern u8 __dtb_dwc3_qcom_sdx55_begin[];
+extern u8 __dtb_dwc3_qcom_sdx55_end[];
+extern u8 __dtb_dwc3_qcom_sdx65_begin[];
+extern u8 __dtb_dwc3_qcom_sdx65_end[];
+
 #endif
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts
new file mode 100644
index 000000000000..1bd86a1852ba
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xf8100>;
+			phys = <&usb3_hs_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/usb@60f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x06000000 0xf8100>;
+			phys = <&usb2_hs_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018_8dev_jalapeno.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018_8dev_jalapeno.dts
new file mode 100644
index 000000000000..bdc76b73c1fe
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4018_8dev_jalapeno.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xf8100>;
+			phys = <&usb3_hs_phy>,
+			       <&usb3_ss_phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/usb@60f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x06000000 0xf8100>;
+			phys = <&usb2_hs_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts
new file mode 100644
index 000000000000..bdc76b73c1fe
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xf8100>;
+			phys = <&usb3_hs_phy>,
+			       <&usb3_ss_phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/usb@60f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x06000000 0xf8100>;
+			phys = <&usb2_hs_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts
new file mode 100644
index 000000000000..8e29a17472c6
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@100f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq8064-dwc3", "qcom,snps-dwc3";
+			reg = <0x10000000 0x14d00>;
+			phys = <&hs_phy_0>,
+			       <&ss_phy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/usb@110f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq8064-dwc3", "qcom,snps-dwc3";
+			reg = <0x11000000 0x14d00>;
+			phys = <&hs_phy_1>,
+			       <&ss_phy_1>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx55.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx55.dts
new file mode 100644
index 000000000000..9ebb5d42f355
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx55.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@a6f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,sdx55-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a600000 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 51 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1a0 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx65.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx65.dts
new file mode 100644
index 000000000000..239caec1f80d
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx65.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc/usb@a6f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,sdx65-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a600000 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 19 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 18 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 76 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1a0 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};

-- 
2.45.2


