Return-Path: <linux-arm-msm+bounces-80818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EAC42600
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 04:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2639A346FC1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 03:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED5C2D59EF;
	Sat,  8 Nov 2025 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YddkaI5C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnWyJf/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E42D5946
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762572243; cv=none; b=QCZjqGx1qe5TO88i6hKYspDW3RKqHg3H8zb7F3rPxxswLiFx/BWE9aoeA/LAmhiLxUQKz1dMr+k5vc3dXTtfCaaMxDKds/wIh1ueC+GjND+Rpb/t2h2RRf1WOj7JWt61lKHDtnaP+jCY3iA3bFHlvEidgtvcS7D8MZBpQpCTrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762572243; c=relaxed/simple;
	bh=OVN34xQvWdQnzMzIUanYNvprU+WPc4hLhYjzqjWZYe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o34u7YVvVcNlVKEnsCaaAvcgFubcVAUXOGO2f0QbVQ3xjcCKmaB4l70Xlg3bd1bxOrZa0fJ00WQ0bGTz7OY8aWWlHjVFhfav1YyNbq9B1gL7m+G1/5mhfPzQcK1t7ZTjrNx/IYn4nijVeTIAQhxB/RLcSpeAEzsSWP780FQlswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YddkaI5C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnWyJf/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A81Q309439534
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 03:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaTV6fSJpghkMj44xjyrxIVyvBhGm3h7M0nGxOIbQk8=; b=YddkaI5CHnfKvASt
	EkizRxRGDNN6yXKl0yrdid+Hqu2ankNm3IGK1CRQ9AnqhMq6bVHM/mXYbGVHw7cM
	4ZmksXyCFIx6t/IQ1e8IEp7GwaoPYiqqTAPtApN7E+/xggacEbL9wGgSrR/myrGt
	0+6tURjCVA3A/CW/SCfifdlZjLtn56UhuB6jqRc5LVCRI3gyhJYpCTQiRJ9uF5PN
	a+gxlmHZQYNL3hD20aHpaTzNfIu35nMg4XQ+WCiT3lJsdk1mzhq8Aqqi8JWI/lmj
	qGZai6Afag1pQ30HtXZ3h41zAAtc57hl2ehobJYcYwEZwYTZ44ESkkDyzl2HDfv/
	5ri9Bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9ujfg745-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 03:24:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dabf9fd0so6873905ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 19:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762572241; x=1763177041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaTV6fSJpghkMj44xjyrxIVyvBhGm3h7M0nGxOIbQk8=;
        b=GnWyJf/gE0qk9B4vyjT6VxcZrK00juiKpIJYkIRUgwLF5jy4pPq0oC+Il+RtmCxfRm
         kirsRI6zgJfBMYigUeC5dTUO909i/Pi+ZMFyPORp0+KEViz3OYhsStLWzzOP7QYXJpw8
         wl5koUT9wD1C58dOffZY4NDAD3leOXtvGeW0SmyGSt9ikv0KttbvjD6B6CDXe6QOvIlq
         4wYjXKc+lfPR7+jJm8gU9an3PRUIQR1OwcMWQktjtktntJte36mH8yNzrluLLYqikAov
         0pnz+rcAIPoulGJ8mGvolxeXGDMj3gNdOHr6Tu8euyLS5r1lgUWOVVd9Cj2sPjR1MDdx
         G9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762572241; x=1763177041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BaTV6fSJpghkMj44xjyrxIVyvBhGm3h7M0nGxOIbQk8=;
        b=lIRQ1dTUuKYqT/Tbhi7AUGWYTeBHWrdqFreRtsa67Hak2PcfTHy+6Sl6uxaYO3g0D3
         HPI1lvOXdoWLasSRZBRf6XkolyW9rmn8gYyJBXEvD18RHurE2f+BZ4tfilXb4DNgnzhP
         7Fn7QR4CkUA5F5A3grQtrDaRC1omkLqcD8B1haWFwj5UHe14sQohIdc/dKBOXHis05iy
         VmmdPg6YzfCDxxHkveHhGSZLPh+1dPMJ9zzKbzHCVOxyjli5Hpys+v224p4NdvrD736i
         9CJCIB0n1gARKsf79FtFEkNL3YNfizr9fblsQ3xRhst8F//4yHfnKQgEHtvuJKjSf0t1
         Bvlg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1/TjoW8sTqxgoPHPyz9uELIc/Sacin9yn87petS2W2oofkYZHB3j8n/1FCCJLVt7dZjhBxmIVzARvZht@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+irAsw6rHqGEnXuvMofOHRopff08LTGHPe0zycJ9dEN9CPgf
	TJAZYbyVhxNck8CsFGhqXeoOZLwTlO++C/mYYNmO5YZyHXV6IGkscC4+M+UuZMaEm+F6O+HLp1n
	5wb5mkuhB46bIhrSbonICizpdFupqS4dSJ6i7SYTM/9fiwpdSP942V6Ih9zS9fC3yBW1B
X-Gm-Gg: ASbGncuTU32z9X/3fsGR60QS+XVBzictMkeCI6wSNU+ySobpPOQt6IrVs5/mXn2emO1
	atQM9v277ipcElxFMzFGe9inbISbFmgcKwLujGy1nnLzAzTvIDaJDgRGyLpo/6nsN4pPtKMdrf0
	EECaDhNg6kQMLSdVa34+uJj4psna+SwQg8N6EyHOJUtKaZNGLQgupmoQ1k42+1Tbh+J5w7MfIm1
	pAAl4meWjD5WRFQhF61q/Sl9VylUXkNR1Axc2m4OjhAIDbh1UsH0KValx0VzEOIfp2KLD1IZrEn
	QLTFwFcWgn8w4XENCaCDDsKyjkdRzBMlf0pkm0Jj5LcPkUms0qcK+sZAt0G/T6ylaSlMUDgiLpR
	3uEsxCXa6Ds24FzN9Qz7KjCS/yhm/HXk=
X-Received: by 2002:a17:902:cf42:b0:295:3d5d:fe57 with SMTP id d9443c01a7336-297e5654e0bmr16448025ad.21.1762572240471;
        Fri, 07 Nov 2025 19:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG18eBJDNlQTKlU/W8HVbHalpdek9IgvR5aIZVa3oaBqvh3+zMvUcV20Fucl157NbrPRftPrw==
X-Received: by 2002:a17:902:cf42:b0:295:3d5d:fe57 with SMTP id d9443c01a7336-297e5654e0bmr16447775ad.21.1762572239947;
        Fri, 07 Nov 2025 19:23:59 -0800 (PST)
Received: from [192.168.0.104] ([106.219.179.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d83c941esm19942445ad.44.2025.11.07.19.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 19:23:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sat, 08 Nov 2025 08:53:22 +0530
Subject: [PATCH v2 4/4] power: sequencing: Add the Power Sequencing driver
 for the PCIe M.2 connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-pci-m2-v2-4-e8bc4d7bf42d@oss.qualcomm.com>
References: <20251108-pci-m2-v2-0-e8bc4d7bf42d@oss.qualcomm.com>
In-Reply-To: <20251108-pci-m2-v2-0-e8bc4d7bf42d@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7872;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=OVN34xQvWdQnzMzIUanYNvprU+WPc4hLhYjzqjWZYe4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpDre2e1ol23eCJhpZHZQlupKAi1D9Fm3P/fwh8
 VtpWH6qOKOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQ63tgAKCRBVnxHm/pHO
 9TmVB/96wWPF84FNah50vmYOPwtXOxkcaBWx630Xv2S7ArFVwWcK5E1VikWnRtFIAtWvg9EgRsE
 baeRH3wRl3fHLbNvgq7+wtJv/ONcUaAu5q5nF9rMn5ckGpN7ZWFus0d4QCQ+xFxAUNP5CEtehHw
 0Bjv2nxKfEuYbs2eSPjd0akHjO8cco1o5xF9BDADMJw+TJRHiZvVIZDDe7cN7y8Z31FtN4MpEZJ
 m4v7zA8DmJYttjtsAu0yL97RhT1WVSWt3uyfwaT26RL2RQ/jy3swgSQxX/Z2PIbtKHHgFWxgUjH
 oIj9SKvN3zlJM6r5V+YUVhd2zLMpKyxOowcKebMxdZ93f385
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=bpZBxUai c=1 sm=1 tr=0 ts=690eb7d1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qronr9GGDLuyXDLutoyxMA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=Mi8d0xCGeq3gkRWnbWsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 0fLeSZx_hBdqEPunbqexOJfwdZyi5nrM
X-Proofpoint-ORIG-GUID: 0fLeSZx_hBdqEPunbqexOJfwdZyi5nrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyNyBTYWx0ZWRfXyyrKXuTORyCU
 S/r8MM7G13aIwat3IAersDoQYnf833LRbWmkkEw1yLnBrdasI+fsAiydOzA5HyW06xUFj4EPmQY
 IhpeGv01HA391muj46knFXHF9PKW58oH1UOWF7ffkJfhSQ9ixqSMPot2Y6i592WnXLYRQwlhmQA
 yaFEphpFOwL81GTfTAzyao7zABa0epfavOJ9Dv+rV8CQIn6bDaDPbgAWhwsh7dfXSOWKjvG8g9L
 VjiyWKe9GE886PdJq3pJZF3Gz1heW3kruX9jvOJWt9rxI+5lDeRpjmQPoiOYz8KqcgyGLIwPpOf
 q3T/x9tuTuph8P0iXOD11gj3At7xuSDpFKpxcfJ7QUo03XaCF3Px7rmW2zfDQd5sRvLs0RqnD1A
 3xASPQtoXuOr4vUhKWoEmP1Q++z81Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080027

This driver is used to control the PCIe M.2 connectors of different
Mechanical Keys attached to the host machines and supporting different
interfaces like PCIe/SATA, USB/UART etc...

Currently, this driver supports only the Mechanical Key M connectors with
PCIe interface. The driver also only supports driving the mandatory 3.3v
and optional 1.8v power supplies. The optional signals of the Key M
connectors are not currently supported.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS                               |   7 ++
 drivers/power/sequencing/Kconfig          |   8 ++
 drivers/power/sequencing/Makefile         |   1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c | 163 ++++++++++++++++++++++++++++++
 4 files changed, 179 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..9b3f689d1f50c62afa3772a0c6802f99a98ac2de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20474,6 +20474,13 @@ F:	Documentation/driver-api/pwrseq.rst
 F:	drivers/power/sequencing/
 F:	include/linux/pwrseq/
 
+PCIE M.2 POWER SEQUENCING
+M:	Manivannan Sadhasivam <mani@kernel.org>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
+F:	drivers/power/sequencing/pwrseq-pcie-m2.c
+
 POWER STATE COORDINATION INTERFACE (PSCI)
 M:	Mark Rutland <mark.rutland@arm.com>
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 280f92beb5d0ed524e67a28d1c5dd264bbd6c87e..f5fff84566ba463b55d3cd0c07db34c82f9f1e31 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -35,4 +35,12 @@ config POWER_SEQUENCING_TH1520_GPU
 	  GPU. This driver handles the complex clock and reset sequence
 	  required to power on the Imagination BXM GPU on this platform.
 
+config POWER_SEQUENCING_PCIE_M2
+	tristate "PCIe M.2 connector power sequencing driver"
+	depends on OF || COMPILE_TEST
+	help
+	  Say Y here to enable the power sequencing driver for PCIe M.2
+	  connectors. This driver handles the power sequencing for the M.2
+	  connectors exposing multiple interfaces like PCIe, SATA, UART, etc...
+
 endif
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index 96c1cf0a98ac54c9c1d65a4bb4e34289a3550fa1..0911d461829897c5018e26dbe475b28f6fb6914c 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -5,3 +5,4 @@ pwrseq-core-y				:= core.o
 
 obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
 obj-$(CONFIG_POWER_SEQUENCING_TH1520_GPU) += pwrseq-thead-gpu.o
+obj-$(CONFIG_POWER_SEQUENCING_PCIE_M2)	+= pwrseq-pcie-m2.o
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
new file mode 100644
index 0000000000000000000000000000000000000000..15659b009fb3e01227e40f26d633f675bc2af701
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct pwrseq_pcie_m2_pdata {
+	const struct pwrseq_target_data **targets;
+};
+
+struct pwrseq_pcie_m2_ctx {
+	struct pwrseq_device *pwrseq;
+	struct device_node *of_node;
+	const struct pwrseq_pcie_m2_pdata *pdata;
+	struct regulator_bulk_data *regs;
+	size_t num_vregs;
+	struct notifier_block nb;
+};
+
+static int pwrseq_pcie_m2_m_vregs_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_bulk_enable(ctx->num_vregs, ctx->regs);
+}
+
+static int pwrseq_pcie_m2_m_vregs_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_bulk_disable(ctx->num_vregs, ctx->regs);
+}
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_vregs_unit_data = {
+	.name = "regulators-enable",
+	.enable = pwrseq_pcie_m2_m_vregs_enable,
+	.disable = pwrseq_pcie_m2_m_vregs_disable,
+};
+
+static const struct pwrseq_unit_data *pwrseq_pcie_m2_m_unit_deps[] = {
+	&pwrseq_pcie_m2_vregs_unit_data,
+	NULL
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
+	.name = "pcie-enable",
+	.deps = pwrseq_pcie_m2_m_unit_deps,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
+	.name = "pcie",
+	.unit = &pwrseq_pcie_m2_m_pcie_unit_data,
+};
+
+static const struct pwrseq_target_data *pwrseq_pcie_m2_m_targets[] = {
+	&pwrseq_pcie_m2_m_pcie_target_data,
+	NULL
+};
+
+static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_m_of_data = {
+	.targets = pwrseq_pcie_m2_m_targets,
+};
+
+static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
+				 struct device *dev)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	struct device_node *remote, *endpoint;
+
+	/*
+	 * Traverse the 'remote-endpoint' nodes and check if the remote node's
+	 * parent matches the OF node of 'dev'.
+	 */
+	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		remote = of_graph_get_remote_port_parent(endpoint);
+		if (remote && (remote == dev_of_node(dev))) {
+			of_node_put(remote);
+			of_node_put(endpoint);
+			return PWRSEQ_MATCH_OK;
+		}
+		of_node_put(remote);
+	}
+
+	return PWRSEQ_NO_MATCH;
+}
+
+static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwrseq_pcie_m2_ctx *ctx;
+	struct pwrseq_config config = {};
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->of_node = dev_of_node(dev);
+	ctx->pdata = device_get_match_data(dev);
+	if (!ctx->pdata)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to obtain platform data\n");
+
+	/*
+	 * Currently, of_regulator_bulk_get_all() is the only regulator API that
+	 * allows to get all supplies in the devicetree node without manually
+	 * specifying them.
+	 */
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev), &ctx->regs);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get all regulators\n");
+
+	ctx->num_vregs = ret;
+
+	config.parent = dev;
+	config.owner = THIS_MODULE;
+	config.drvdata = ctx;
+	config.match = pwrseq_pcie_m2_match;
+	config.targets = ctx->pdata->targets;
+
+	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
+	if (IS_ERR(ctx->pwrseq)) {
+		regulator_bulk_free(ctx->num_vregs, ctx->regs);
+		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+				     "Failed to register the power sequencer\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id pwrseq_pcie_m2_of_match[] = {
+	{
+		.compatible = "pcie-m2-m-connector",
+		.data = &pwrseq_pcie_m2_m_of_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pwrseq_pcie_m2_of_match);
+
+static struct platform_driver pwrseq_pcie_m2_driver = {
+	.driver = {
+		.name = "pwrseq-pcie-m2",
+		.of_match_table = pwrseq_pcie_m2_of_match,
+	},
+	.probe = pwrseq_pcie_m2_probe,
+};
+module_platform_driver(pwrseq_pcie_m2_driver);
+
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Power Sequencing driver for PCIe M.2 connector");
+MODULE_LICENSE("GPL");

-- 
2.48.1


