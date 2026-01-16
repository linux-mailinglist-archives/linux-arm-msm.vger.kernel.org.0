Return-Path: <linux-arm-msm+bounces-89476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE27D389C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40D5730A7C22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A447E314D24;
	Fri, 16 Jan 2026 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pqv/pDis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC2TXA9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075B318EF2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605679; cv=none; b=R3/ecAn49cly5D6lTRrfW8Twrg+sZwozJDuSCJgbNOy9lAfxCypGgi0f2XPGfY42l52lDNNJt48U9V9Ac4A7ZeBxgom4THe89ceogN+nLWwQUhhtemOdRIR6ulYTynhla+nXBQOkm3Mz3eT264ieamZV8/yb4xeVGblHMk2/dVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605679; c=relaxed/simple;
	bh=+qzYM1fSYiL2reWeLe70I04JP20oO8KwkaJWiYnJk+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yb8eviVty32yfP0HIFgD2bgmva9sElaf+79e6It1Lwg2xkogH1bmZ/RASSsNvGvRC3lRRXsnox4Q/GoJ/0OtXaysxpneK28+lc3asOZY4tj9jzL1UcMym/uy+k1CYMIxFbdXCuBPZ+CwKgjiwB8xfI0swZLbA7RGgKJdo77UINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pqv/pDis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC2TXA9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDBRq2958517
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pYVx2yqGuzZ
	kNj+rwFw3NTUEKnrn19cGogpfRYgclkU=; b=Pqv/pDisoQFyfOw22jvYuuv6wOZ
	Er7TtYMqwfsRAIKHqkY1QAvNZ/KUkSpVkZdObqgEzgWtiVQykPcnPLMFcgfO6oOR
	eC0e4SRm9p2dcONKLMrna0oBGqX64q9Ev0hSRdSQOBIwlYPHpBvq6xCjqO7QUgKl
	uDo5jdg/9ihFkNYqkCviAoBH5uK43F+jbhu1tO/GEzS20cHUUIkvB4pet125kLlz
	RRZefEtQS5Tfhs3Ty+6S0YbYkeAqgOMLX69ggaqIhPLwtdTMf4MXQvNg8Zj67w8K
	TsQbxk8TBL5tGd5Be4AdBiaYoB/h/hxNmA8cwVT0Pn0b1eAZrFYVDAYwfvg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhh8ahm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1233893db9fso2730093c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605670; x=1769210470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYVx2yqGuzZkNj+rwFw3NTUEKnrn19cGogpfRYgclkU=;
        b=LC2TXA9+8Rv1/4oEFw3/D78xE37qBw6i49wqqNJw8OFNA9Txb9+TTFFGIWL3Fxj46R
         YhUFoBMMLsC4y1nsLFpWdwTt7FCCCQeWOs3ySggqbn3i5RWobD4Mvo1Lh7FrgAeeuBaX
         v5HVDq5xEKoHZdYS9Y2odUxvzq4okU+XJ/WXZXiZnihjrF/nzMuIPe7DMM+Att4OE8X1
         PVtkNDW+YZLZbvBBL5Y9ZtUHlZYw0U5qMMX6P42tdw5AVzRPOZDfUy4xA5QSqlV/fKqZ
         1JeY9DK8qmw0RlfWfKKDqxq6pfa6vo/j1bouEB6A3ySug7EAMhPsaSsNOf7kP4IzVYwy
         Vr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605670; x=1769210470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pYVx2yqGuzZkNj+rwFw3NTUEKnrn19cGogpfRYgclkU=;
        b=xBEJHOpFLdp4U3MEK4j5iQ5RHNyI+AALs8Zjg0AKAGEieNiSrf4kWC17ZsRAXx7Y5b
         Xzahe9w05KwuMQUUZeI4y/4GhSLrPOyvcgxiqZp5k+/HwpV4vdH/k4PmezWo1UlGxTNN
         sIi+E1TP4mRpgq8o+NIR0hQhMWXmBgkXDzZbW9LdgJltiSVC8P7EgzRq1DdMG7zFYMpe
         Wdq9x4flHkCu4B4SPrYSwNyqLRlDj7ymbdZB3o8XQx/VC7Akq+8ZkiHlEIqgBAe9bkiB
         ti36g8IsUANdArsHRJOnB3m6nAHxXK9POja4yRcfCy8YhloehuCnvv0/AC+BfW9U4ocG
         3Q8w==
X-Gm-Message-State: AOJu0Ywq0Ti/RZiM7P4JSrdaMH6YuIwfQdJpAUR7y4FiQ4LgevXHLwJC
	8SgMqHBxN2QAPUvq9c2x4/yPHoClbpobkp8VK4zrkfVhERojSJA9EeMmYUHR2WBtTS1k62kwAkF
	G+QicxVZ5+pNwhT3dZ4cTW5GW0x53pu+53PSQYGqCXMMGan6j69/gRlbda5+nxxXlwkiE
X-Gm-Gg: AY/fxX59/fOYeZSU4sO+ViQ4QPG2fY+UMp1WvkmT0TdK7/hO4i34B8q8M3c7VJx8J5B
	nlxiHXeh/yIKINVD0Ug0/MvXLLUxS6tvk8AtCMEXg5HtWVRt75fkWl+YF9abfYFtla+ndkZYpp7
	BQIR79eo35YK70McEF69tFrRIco75m/cez3GCRlHL2kAVk0sPz0hE6BsviHZLiU4Fkb4r0Bfn8i
	uxSi2fp/uu6VxtiygK+qyYuOQavDVN4tmvmANjsBfDOSLnsLw9LV6W5LXXCq5u+IHeeGn8yDAdL
	hbQV+WJsBh7sjypqLuMQULhQ8Jkpghu0Qlvzpn9Vj5SOvUp9ddA7In6zYquPDmbixO3hPcybFo7
	SoKEHE2gOvWxWg6l/IzSK72jLYq16hzhEI17Y1mvdNZA4EwHUhyOM369e+/KXvSo=
X-Received: by 2002:a05:7022:924:b0:11b:ca88:c503 with SMTP id a92af1059eb24-1244a6fb234mr3574874c88.3.1768605670459;
        Fri, 16 Jan 2026 15:21:10 -0800 (PST)
X-Received: by 2002:a05:7022:924:b0:11b:ca88:c503 with SMTP id a92af1059eb24-1244a6fb234mr3574860c88.3.1768605669886;
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Fri, 16 Jan 2026 15:21:00 -0800
Message-Id: <20260116232106.2234978-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 59ixMMpL16GqaDHvP4Y243RXYijoBcCa
X-Proofpoint-ORIG-GUID: 59ixMMpL16GqaDHvP4Y243RXYijoBcCa
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=696ac7e7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wu0v9trazkx_CZjgA_kA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX49Oyz0R9zAHy
 zvsKdGisfYBowpuv8vSiK6o8DUgvpftRA2c2LHYbVxbCTCxe75/tEROeCqVQcnhf/ojDI34ILJY
 WBUwacuSyBER+9JN8n77XqVIVEjKVwC3diMDhNL4T7ueCbnrsIGvF1nDk+58CkvYDA44gMEIQoH
 ZdZ0O7C4pP8eFSRygjmlLMBJrS0f3w47fvSGD8cDtxh4QLL18To9s/GSOeLTkzL4wqykcwhW0nF
 Nupk4cOib0JvI4OFO9m9m2PwKzVVox6SHc9vI+5zYRo4EmKhR7z1LPKAf2FL973yLg6/cepVJ0S
 e2XhUGVcJX5YJaK4vDTkSt93emyTw0sjgIai5CRZ2V7mtETXoG6zV1zQ0a0NgJkMNJcQ0UY1pHP
 aiGS6iWH8hX1uBLDQ9xijw3sGVCk5ILFNIXbRR8+pTRXK7bDOCaLbS/PsHY5h1vvx9ASrBpbVKm
 bjqe1Aw5LpeElLg2/jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
enables debug and trace capabilities on Qualcomm devices. As a HS-USB
hub, the EUD requires High-Speed PHY support for proper operation.

EUD hardware can support more than one High-Speed USB path, each with
its own PHY. The active path is selected via the EUD_PORT_SEL register.
To support this multi-path capability, the driver needs to manage PHY
resources on a per-path basis, initializing and powering the PHY
corresponding to the currently selected port.

This patch restructures the driver to support per-path PHY management.
PHY resources are powered on/off based on which port is active. This
ensures the correct PHY is enabled when EUD is enabled.

This change requires path specifications and corresponding PHY references
to be added in device tree, breaking backward compatibility. However, this
is acceptable since EUD cannot be guaranteed to function without proper
PHY control.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 130 +++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 1a136f8f1ae5..5cebb64f4a67 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -34,26 +35,96 @@
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct eud_path *path;
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	path = chip->paths[chip->port_idx];
+	if (!path || !path->phy) {
+		dev_err(chip->dev, "No PHY configured for port %u\n", chip->port_idx);
+		return -ENODEV;
+	}
+
+	phy = path->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct eud_path *path;
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	path = chip->paths[chip->port_idx];
+	if (!path || !path->phy)
+		return;
+
+	phy = path->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -70,6 +141,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -132,6 +205,12 @@ static ssize_t port_store(struct device *dev,
 	if (port >= EUD_MAX_PORTS)
 		return -EINVAL;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port]) {
+		dev_err(chip->dev, "EUD not supported on selected port\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled) {
 		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
@@ -231,8 +310,45 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		dev_err(chip->dev, "Missing 'reg' property in path node\n");
+		return ret;
+	}
+
+	if (path_num >= EUD_MAX_PORTS) {
+		dev_err(chip->dev, "Invalid path number: %u (max %d)\n",
+			path_num, EUD_MAX_PORTS - 1);
+		return -EINVAL;
+	}
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	path->phy = devm_of_phy_get(chip->dev, np, NULL);
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "Failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -252,6 +368,18 @@ static int eud_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	for_each_child_of_node(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return -ENODEV;
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1


