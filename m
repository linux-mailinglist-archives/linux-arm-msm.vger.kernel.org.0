Return-Path: <linux-arm-msm+bounces-80422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C7C34CC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B105602C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69B3312835;
	Wed,  5 Nov 2025 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccsDX/ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XA80tFHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9283126D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334209; cv=none; b=OypE2Nzbj9ymiWPLEQbiwamQs5d1wtMxmeT3Nz/ABCQQOPtl3LqvMCA0er1oYffh29f/B10PCBK4LXd8iBqR6/LyVYw3s+WcwwI0oguiqzFb6pzgYY4lodQlcX5gexbCzGBVDHvDCyH2JZnSYGcWznn1g/7DPBRVVCtcQkJsbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334209; c=relaxed/simple;
	bh=6JV6iijCVKWK12xOisbku7kPcAUn8AtYsjIJ5OCWPFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsZRqSsQsJeSbnuRLsZAziV70qdN/6LUfvBxGfL52uDYBJZXwGjpn65AfLYa7N+/zPqT81QyBBtKP2W9ldKJkHFWhPojvARATn/NjjPSCrbn5KDLQUEzKlmhhS0vhLbxusHAjoieUN5St/Kaqz95/EYPmLfv57zzyUjvRgoJ234=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccsDX/ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XA80tFHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54YgFD4012465
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr/wxR5o/dgbV3wh8KKr+sf9R0I5j0Vgjg2foUPt36M=; b=ccsDX/ahHOAU9SIv
	k3oUU+hyAQAwcC8vJfmonKiSpfSdySdaktnVMMAOnhqz8JtoRLtCwUL/HmatQITz
	aBuEQkq86E9l7fdcXBB8z1HKLrc8JR6z98Y09b9BhdDckuAWbATQt6GRHS413PNM
	IDvOU4limZzAZLQW0vJo3HZPoe9qx8gIyNi6fJhPIN5fKnehNRXY3R5mHgljikgk
	ilRbSQCNTxJgROm+Sa5dF+uXFRxNBuvS22vCocC7GhElp14chhS3MFx51rNasCQR
	sHNFCO9L0Am/8S4G9M33MaUHpevKP9lu9MIhNcedN/g6Lw+NFEvJW6j+03Y4Vc7R
	lkPq0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwrq23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:16:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso2918261a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334206; x=1762939006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr/wxR5o/dgbV3wh8KKr+sf9R0I5j0Vgjg2foUPt36M=;
        b=XA80tFHlUKQevg11jRpdq5xPLgHxMAocgf6eKG5XYHFJaB8mXZqahm1sgQJwAlwd9A
         pmSCbdevpf93HuEcWMuAExYHgN2n4omUZKL8EmGHeSERYE0xOTfUvVxo/KHPkai5s7Fe
         HfM+cYQnVdG1oU0Sj7m6PEz8FeMBq90a2jevJ67trP9vZLXBKr4GhbK1hXQmVwxTWnkg
         U7jsa45xpPa2FEIvqDG2RIkiWpq7JSpFQWrAad3JNfOI11SMr3n9Pyn3v5ZlmUYfsdNX
         qv6kO0cHDcwDm4lXxmg1VuvzZUq6WBo1LgBCM+CqxjFf+htaoDf2rDSQ68CnT2dypC8H
         gZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334206; x=1762939006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr/wxR5o/dgbV3wh8KKr+sf9R0I5j0Vgjg2foUPt36M=;
        b=DDVXDcX5w1yBCmLJzvPe7HlhSczKtpu126daz2riGDh9/3W4AvMUL14991X1cKZgSb
         Fh1Yic3T8HqLzjW1LBS4+goY7dw5Av6uaOoyWWx4E+1o241cVtIM4TwIDOEK1weGxOjK
         hTVExnS4E28jydl7XRyVzvOa+Xl+Af945KD8DVGCq/egNEOjyQZTBWCAJEKLa3qCtcNz
         PqFQZLwAwGdSZXro1v19Ms4rspiygKVcmyIbnTn1uYLsnjNa7apUAh5DTVvRcSBO6/YL
         bprFbeOk4n7yLbj7XF3pLodntYDMXNnJosxZBnDJL8cb4N0WE0lpX5nn2R3SOuIOeSJA
         aeXw==
X-Forwarded-Encrypted: i=1; AJvYcCWB1hP/VcC+3xoVDdoK1oL5vsB1ViNaHnwVY9rNET72ynp49dqMPvcXnqyKtyCpsktIBB7wCk7VHpE4Zrd3@vger.kernel.org
X-Gm-Message-State: AOJu0YzTAGhAUXbPV8NPtI/laX29WaQklustQVGPQptXdrnsaDeciSYU
	Jb5NCqr7CMpbIJfjbqmDm4c3NyLQJrbS38JMzeghtMo3IBNamezP3Y+fuoKD+lIMqSceETL8lVw
	c3hQRtXEQ492DUCI9dkbSS0M5Y4vFz3sGl+C+5AdDZMlF8vj5JnGA72vNjSrqekK7rSbO
X-Gm-Gg: ASbGnctArUPz1Qj+eHkT4+ZEt+G8FOan0wyNiSf8Oexzy8k+/zWNYYn/VEljDsGx9QQ
	iWuZqtmYTfvN/a/XT2neuBTPN8IvVgSrswXmJhm5Lrt7MWDgYfFdNfOMH2LG0xoeoNR0v9rANtm
	81Ga83QJEbmlYdU2WNavEBUH40V8W6M+kyPdqwP1y1lEjLc1sHvILIUWjAihApKUVkMn20FJyot
	8qHg+VwHj1n3/PgHpBEva2hI1af+b1dH/xSlQtb7GrBT/j6Ork2sPLVQw90JFbyFsYmvxpP5cvb
	NEpvb2FQ9lwQpF8PanM6cYjdphbbfFLP/AqiaSjXFSTeAB+VQTa9OuP0BquLbOjF42TrozCtHey
	mApnf3IuEbeme/oan5MWknizg54gM
X-Received: by 2002:a17:90b:48ca:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-341a6ded3a8mr3020695a91.28.1762334205643;
        Wed, 05 Nov 2025 01:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKwsvUGdrfKTQhaqiwzEypp+iS5QzZH09d6n929jY+N764lQ1Gt7nCYOFdvWBtf2B+FDuBSw==
X-Received: by 2002:a17:90b:48ca:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-341a6ded3a8mr3020664a91.28.1762334205088;
        Wed, 05 Nov 2025 01:16:45 -0800 (PST)
Received: from [192.168.1.102] ([120.60.68.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417a385563sm2274249a91.0.2025.11.05.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:16:44 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 14:45:50 +0530
Subject: [PATCH 2/4] PCI/pwrctrl: Add support for handling PCIe M.2
 connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-pci-m2-v1-2-84b5f1f1e5e8@oss.qualcomm.com>
References: <20251105-pci-m2-v1-0-84b5f1f1e5e8@oss.qualcomm.com>
In-Reply-To: <20251105-pci-m2-v1-0-84b5f1f1e5e8@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3917;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=6JV6iijCVKWK12xOisbku7kPcAUn8AtYsjIJ5OCWPFI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpCxXoCyTIkkKmbRofz4BXOgj+hgIcJiMyJzFHE
 6fXLle3+wmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQsV6AAKCRBVnxHm/pHO
 9SofB/97Zy40OYNFyPILHV9/VogbBFLuszEaspIiN624N2tKtZSWiU/fsRJB7et/oc+uBk8YhVY
 JnIO5xFZSpLLIn1wV5J9V5qxSp9rXKUaPIaVnhPYyrM6xOBowoL9vCNQEAwQkTi4DUyJFVawRfG
 bpoLxDWiV4f1I+EglDR0L8yr3zsIBzBv3r/H7+0MgvegB8IOi34Yi7Z9xzyXVB5ZJuDD7G9U1rD
 r5BOseJOjqhHqzd9uSNttgb16/CF2W1ailQJxwUGmNnBT17mU1QbtOHGMJc3FS3CqrXNSUT8po9
 l6SAIlGuRIbWRhvk+dNukITDyeAvd1drTpvjgXMM8j/ZPsZj
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfXyxNvt0JnqC2L
 L5aBNCq4ahYgGy5UfWykI5jU2RUWZ4rmYEmPsPBQ2PaSiduhjxKSYopLKPDuzYnu5GXs9BXznwz
 RVlyqw/wTfrBW8STzSYZE6rG7CMDFz9A2apK4IEfA6JnU3sBzh/s/iB0QfGFc4YMHvBtTSVCosw
 POJF403q4U7FIvwnpytaGdKKi63sHKL4onIMfB6AeuKi3TUiryB7UXBGMKX8dF7x8wTVJR1GdEz
 2T3BsmbeeQYtpVXBknXr3iaqQBVodmDC9chWp5+JNNsU7/4dH//+i1ByE0kNHTp57JdgHPluKkc
 5yjwB1p/DBvcxO12t6smorxBfhFdNYQjepm+76iNklL5gjXLgMCyva+4X3UxaB+D5QDlEM4oY+3
 DQ29FsnPNyLJqnq+FivtXFt5INCT0Q==
X-Proofpoint-ORIG-GUID: 6I6x4vmoEZb_1dXa-_kqgyBzOoCTq13p
X-Proofpoint-GUID: 6I6x4vmoEZb_1dXa-_kqgyBzOoCTq13p
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b15fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=adoi+G5QptZiRYWGMQz2cA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=T-2iuOupZRtFYbKAKI8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050068

Add support for handling the PCIe M.2 connectors as Power Sequencing
devices. These connectors are exposed as the Power Sequencing devices
as they often support multiple interfaces like PCIe/SATA, USB/UART to the
host machine and each interfaces could be driven by different client
drivers at the same time.

This driver handles the PCIe interface of these connectors. It first checks
for the presence of the graph port in the Root Port node with the help of
of_graph_is_present() API, if present, it acquires/poweres ON the
corresponding pwrseq device.

Once the pwrseq device is powered ON, the driver will skip parsing the Root
Port/Slot resources and registers with the pwrctrl framework.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/Kconfig |  1 +
 drivers/pci/pwrctrl/slot.c  | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 6956c18548114ce12247b560f1ef159eb7e90b10..9a195cb7e117465625c68301534af22000dfca8d 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -13,6 +13,7 @@ config PCI_PWRCTRL_PWRSEQ
 
 config PCI_PWRCTRL_SLOT
 	tristate "PCI Power Control driver for PCI slots"
+	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 	help
 	  Say Y here to enable the PCI Power Control driver to control the power
diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 3320494b62d890ffbae6f125e2704167ebccf7b9..d46c2365208ac87c4e83ba8d69ac1914d9bf9088 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -8,8 +8,10 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/pci-pwrctrl.h>
 #include <linux/platform_device.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -17,12 +19,18 @@ struct pci_pwrctrl_slot_data {
 	struct pci_pwrctrl ctx;
 	struct regulator_bulk_data *supplies;
 	int num_supplies;
+	struct pwrseq_desc *pwrseq;
 };
 
 static void devm_pci_pwrctrl_slot_power_off(void *data)
 {
 	struct pci_pwrctrl_slot_data *slot = data;
 
+	if (slot->pwrseq) {
+		pwrseq_power_off(slot->pwrseq);
+		return;
+	}
+
 	regulator_bulk_disable(slot->num_supplies, slot->supplies);
 	regulator_bulk_free(slot->num_supplies, slot->supplies);
 }
@@ -38,6 +46,20 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 	if (!slot)
 		return -ENOMEM;
 
+	if (of_graph_is_present(dev_of_node(dev))) {
+		slot->pwrseq = devm_pwrseq_get(dev, "pcie");
+		if (IS_ERR(slot->pwrseq))
+			return dev_err_probe(dev, PTR_ERR(slot->pwrseq),
+				     "Failed to get the power sequencer\n");
+
+		ret = pwrseq_power_on(slot->pwrseq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+				     "Failed to power-on the device\n");
+
+		goto skip_resources;
+	}
+
 	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
 					&slot->supplies);
 	if (ret < 0) {
@@ -53,17 +75,20 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
-				       slot);
-	if (ret)
-		return ret;
-
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
+		regulator_bulk_disable(slot->num_supplies, slot->supplies);
+		regulator_bulk_free(slot->num_supplies, slot->supplies);
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "Failed to enable slot clock\n");
 	}
 
+skip_resources:
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
+				       slot);
+	if (ret)
+		return ret;
+
 	pci_pwrctrl_init(&slot->ctx, dev);
 
 	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);

-- 
2.48.1


