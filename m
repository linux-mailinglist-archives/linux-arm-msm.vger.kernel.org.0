Return-Path: <linux-arm-msm+bounces-89479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F90D389CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FD3C30F9598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6F330DED8;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LESjgGBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efx8bcmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907D31B800
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=Jdp5tDE5CuIK9edezZ1ncxy648oD7cIUr9udDgXD54ITc3qwh5yv+knejC7RhxntEAYJClcLJRPcOXoXGll/MLJZxoQxOW2k+l3yKqT2gcL8CJ6zoXn0R9Uz9YOBRpissk5o27CB55TOOOoJxMDvoaM6gpd7HA7ohiWthCr+Tfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=8QuxfXdYRJcE3fyNR6NyT4XaseLCItGHgJZH0P+Yloc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lf6ZMye/9DLUu5LjOdcKr6zRK3rQp6PnO56ds8MVr2hZchrmT3QydEAXztykeWQWsuu3nqBB7H9BNV+BeZFgKdqhZ0da2EkOtnIWrr8GJ7IvezyyyCnbqKbMbjlMZnOxpAeQozXH/C9wrGqNMIBKm6cCcWAi8NKlcvRTwO0Vzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LESjgGBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efx8bcmg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDTVR3384617
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VKaYciJerw3
	mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=; b=LESjgGBP0pE9vVf52fp90RjyhCW
	O6kYko17U4C/ld6zZfgoF8vrFbt6EQE00tglK7nQeMDuzc5xfgROjcQEjS0CJRwY
	0FrVBVvJ0Zmr/keyabSVifr2YNaakqwbnZMqa2JAZYL5HRDq/Eb2FoniearXERcx
	DrJuf93gel1dBDWnlxSgfr3aFsFomj/m29yFUZKja88arriPa/vE3b/Dgvdj4jdE
	07qiReXSajxmwJ0bAgf5xdnTNAhjJtnlH1uerZOI3+/oPEcYYG1AlYNmul6P/zSe
	AK6F1vY0Gck6GdVdHX+tt96zml+sPG/NO481dEG3m5AVH3ORd6TxdRaN21g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvj58aau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1233893db9fso2730130c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605671; x=1769210471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=efx8bcmglPgVIQ7+yCUOk36fdpSZD9zeGEvbolxXxbI7fXJGw/d28eWvZuQQpDHKpu
         QcDcjPLKofFl4GkRy7m6/r0WpzSFl+C4tCHMJtZ62frGvhvYqqAdWOadhVaLlqNo3/un
         iQQJyAL3YlLByK1ryHSw+0zwI3Fx/Lx4D88TX4k3DWrdJXnuzCQ0fLJJmb4y748F3w/O
         VPaWDvQPHpGC2D3LAvrk3V2Zn7+gPWLMWff24HSImWqRR2l+H72XGCr8+8q+c2Wugc/q
         HcSkHcPyw8SCKqP9IbfOjSvdnJvtP5+rJCJODjrSM3Gy44RmeUP3SuyMD52qRyaTzfGI
         r8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605671; x=1769210471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=WcGu3X5mnj7Sdy9vqDZ7UKo4XYtpdbenKAOL6UYm+F0KKSyNtH8X2Gv5vG4t2wuSL7
         NigZKbiRZkh+lW7h0EuB+HDh05LAwWy9ga1sMxxOA8R2pTlGI0oUfKa6ec4SwjeXbQaC
         BlY9i5OfR8afR7bQTl2f3gPDRfLPpwt6VGUxTnOfCAEMdlHwdVwp3Nt59auzRNFoCPV2
         eDiNpdUVVy6VXVWqOOWtAdMZBX8hirZnLq1rQ97Bu3wfR5EL/8dDtX21AoH9AvVfzkFq
         j9RJIQOuofxBf4crDHPpmX7oPY7a62RlX4NebWfC7L5dsQqRp6B9KQfuv8jVpY+ZBz4P
         yZfw==
X-Gm-Message-State: AOJu0Ywkf0Lj0xn5Aabcz3LdQBdwG6++9hG5Nb0MUHhtBq2/FhzlbanG
	jmFPQN6dfpoaEwVuidWqzYQIUurAK4kr/UBoiwpUmyhpnORvuC3AuJcIIgUYWbsB1hqexH81h93
	l8GeVDlVtXKYgtvHKGm2eoyoohRlnTP6wU3dRN2KzOLavXZqcFAgfYvIgCVTh3B+3tmKO
X-Gm-Gg: AY/fxX67j00Vl9GOVJ/mfYbKxhxOwN37JOsRI250GCs43gxGlHwFJOLUe6Qzazt5OYn
	DEJIV6XDThYBjjy1xqwfVTQ6ppvbgSSZTzFFOtXTI328hoxjNb4JWZyqZ7tqM1yjLiQMP+uK34x
	KdacpPd7X+OeLCb8uf6EI9LB94rK7qNR4j+s7ROJohBtMOQnFOeooAOMAGDMIrDYH1C7nXmzqjH
	al0R4yRa8wbAC/rGR2UbFTHPoSEcHKimMmxp1PENd4X/lCWeGQl+bIdFPIvnTHEpovFySkLxOZH
	w7K1Xy6KyU3tano11NA+z/+PAPVhLNPBJnqZJyLLZdGLsQJyw/53dCf9va7j0jrn291hXQ2kT2g
	T/QTGSWEKt/yHQ+rGDUfTrVHvfwQ/ZSI3YoXcN4Pskl/XDOflRPVNU43LdQA/0gM=
X-Received: by 2002:a05:7022:2397:b0:119:e569:fba9 with SMTP id a92af1059eb24-1244a75ea44mr3688687c88.24.1768605671322;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:2397:b0:119:e569:fba9 with SMTP id a92af1059eb24-1244a75ea44mr3688672c88.24.1768605670731;
        Fri, 16 Jan 2026 15:21:10 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:10 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Fri, 16 Jan 2026 15:21:01 -0800
Message-Id: <20260116232106.2234978-5-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: 3w635EUJeBBhvQOKB8EjZ_A-Vo8TF4X8
X-Authority-Analysis: v=2.4 cv=J7inLQnS c=1 sm=1 tr=0 ts=696ac7e8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_OGk7KolV25BrENr9Q4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 3w635EUJeBBhvQOKB8EjZ_A-Vo8TF4X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX5Bby4HcN4UNo
 90uRH+lfnwZzdxfDgISHpaNk5D7HZoH3ZfRwehKj02MzqV0jYCu1gRokYxbRMfHTSKRwpN9BUHp
 50LorqakFbxR5H43tAbGiu6zAE51YVZJq4ZyOTrXZHYDPZX62w77dUhd97RB/+EzaQL5PiCjDfy
 eAlawoIsnY039kimluJUsPkHRz4TGn8VkS8m3g5GVxE+bqqpJsshHl/isG8codqGrl4hB62rpKA
 8hpjVmwFfIwiSSGiNojgllNoUm1XMP7Y0v4CwDEMce65p7imFCTuWbzFNcNIcly3N3462BDX+5H
 BnXrKU2cuowtBbdhfbcD9lLnNDDtGXJgQRBCqJBMJV9SfKTdPsNtzCeVBSJ72CvwulJWxsq/rIM
 CzrV2EfXA1b6b1g0mmWTLSTKk+s2Vn62dABdw7wnbvAWHDf0m8WFXecyMoWTPK+Cx1kJwg6Fj//
 lLG/JhLrOW8Ypphqg8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 80 ++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 5cebb64f4a67..a58022f50484 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -38,12 +38,15 @@
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -129,7 +132,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -287,15 +290,21 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+	if (!path || !path->controller_sw)
+		goto clear_irq;
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
+clear_irq:
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
 	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
@@ -303,15 +312,45 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
+
+	return 0;
+}
+
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
+	int i;
 
-	usb_role_switch_put(chip->role_sw);
+	for (i = 0; i < EUD_MAX_PORTS; i++) {
+		struct eud_path *path = chip->paths[i];
+
+		if (!path)
+			continue;
+
+		if (path->eud_sw)
+			usb_role_switch_unregister(path->eud_sw);
+		if (path->controller_sw)
+			usb_role_switch_put(path->controller_sw);
+	}
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {};
 	struct eud_path *path;
 	u32 path_num;
 	int ret;
@@ -342,6 +381,32 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 
 	chip->paths[path_num] = path;
 
+	path->curr_role = USB_ROLE_NONE;
+
+	if (!of_property_read_bool(np, "usb-role-switch"))
+		return 0;
+
+	/* Fetch the USB controller's role switch */
+	path->controller_sw = fwnode_usb_role_switch_get(of_fwnode_handle(np));
+	if (IS_ERR(path->controller_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(path->controller_sw),
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+
+	/* Create a role switch */
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		dev_err(chip->dev, "Failed to register EUD role switch for path %d: %ld\n",
+			path_num, PTR_ERR(path->eud_sw));
+		return PTR_ERR(path->eud_sw);
+	}
+
 	return 0;
 }
 
@@ -359,11 +424,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


