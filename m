Return-Path: <linux-arm-msm+bounces-28116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA3994AFDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A65E28260B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 18:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76308144D27;
	Wed,  7 Aug 2024 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LUi7s/Jj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F714375D;
	Wed,  7 Aug 2024 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055566; cv=none; b=OyyWPoIV3hazmAS2LDiLpN/F9e3B092DNk/krkMF32HlsPsp93PrukVKbTHEf6+sLbjuxrz2jb0IsruN6KAr/ofocctYi6DYXU+9i5sLzGAjucGp44rKDcOwDbMS2gLnEoTuUX8Zlp+jrqtqYBAGTkGl3s2BR5eet/bcLZ6uuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055566; c=relaxed/simple;
	bh=WWFu1FF0bUdKaiaOQ1N9TiJ99KW5x0QxJ/gGNgFTXWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JuK7ZgFCP7EGp7vHNAYtDhDCazRXN8k0KpX4UefzNKBUvmJm3HNmnQclHjpYiQNv4U31o/NbqToHNeISMY4vdr2h1eID4e3Kbu1od1Bo0ComhgQGSigAb0DBRwhJa3IrAVFaWSkJ7emAMJI77T/qB1tPLvc2jCAn3Njgdc09mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LUi7s/Jj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477I4Pqv007104;
	Wed, 7 Aug 2024 18:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Xbc8EW66wgoddU1As2J16hl0xa6ayyXZv68acF6LLc=; b=LUi7s/Jj8vpKKhYq
	kPZjtO83oG5b4e/TgvO+FWA8kjF3iNhUT9D4tUFt31QGRwX8lguxxpTInP4UM80q
	e6K0Bqsu9rLgGFup6Y1LzZH14D5x3nD5QUPYPvm2mkZhfmFMLdoqgwaNOLcZnpZ4
	GigLimJOFsrFdUNN0zZ8AF9lhBDLBVVBYqNoeZRSyOnzvU2tPwzeVNa/tpQrssGg
	dZg7PCBXLQznDnPGa2gM6OhHNp3joJFCqKHxq9AJ2EK4wqYVr63b+84XX8xBRzq9
	ekru4f0o0up9/iywDXbed8nXBa1cJe6pMzKHuKlPd3KOtmzV7nHy70yWA0qFL2Ug
	tDGLvA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6ur5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 18:32:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477IWd5l020502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 18:32:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 11:32:38 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v1 2/3] usb: misc: qcom_eud: Access mode manager through secure calls
Date: Wed, 7 Aug 2024 11:32:03 -0700
Message-ID: <20240807183205.803847-3-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807183205.803847-1-quic_molvera@quicinc.com>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dln-m1TTaEhHfBiIpKsLtVKcYWX1fTXm
X-Proofpoint-GUID: Dln-m1TTaEhHfBiIpKsLtVKcYWX1fTXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070129

On many SoCs, the EUD mode manager needs to be accessed through
calls to the secure monitor, so add a compatible string and a config
to assess how the mode manager must be accessed and change behavior
accordingly.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/usb/misc/qcom_eud.c | 53 ++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 19906301a4eb..77ef089a3ebf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/err.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -35,18 +36,31 @@ struct eud_chip {
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr_phys;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 };
 
+struct eud_cfg {
+	bool secure_eud_en;
+};
+
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+	if (priv->mode_mgr_phys && !priv->mode_mgr) {
+		ret = qcom_scm_io_writel(priv->mode_mgr_phys + EUD_REG_EUD_EN2, 1);
+		if (ret)
+			return ret;
+	} else {
+		writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+	}
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
@@ -54,7 +68,10 @@ static int enable_eud(struct eud_chip *priv)
 static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	if (priv->mode_mgr_phys && !priv->mode_mgr)
+		qcom_scm_io_writel(priv->mode_mgr_phys + EUD_REG_EUD_EN2, 0);
+	else
+		writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +195,8 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
+	const struct eud_cfg *cfg;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +219,22 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	cfg = of_device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -EINVAL;
+
+	if (cfg->secure_eud_en) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (!res)
+			return -ENODEV;
+		chip->mode_mgr_phys = res->start;
+		chip->mode_mgr = NULL;
+	} else {
+		chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(chip->mode_mgr))
+			return PTR_ERR(chip->mode_mgr);
+		chip->mode_mgr_phys = 0;
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
@@ -231,8 +263,17 @@ static void eud_remove(struct platform_device *pdev)
 	disable_irq_wake(chip->irq);
 }
 
+static const struct eud_cfg nonsecure_eud = {
+	.secure_eud_en = false,
+};
+
+static const struct eud_cfg secure_eud = {
+	.secure_eud_en = true,
+};
+
 static const struct of_device_id eud_dt_match[] = {
-	{ .compatible = "qcom,eud" },
+	{ .compatible = "qcom,eud", .data = &nonsecure_eud },
+	{ .compatible = "qcom,secure-eud", .data = &secure_eud },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, eud_dt_match);
-- 
2.45.2


