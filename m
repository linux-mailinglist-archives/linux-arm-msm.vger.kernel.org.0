Return-Path: <linux-arm-msm+bounces-27443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C59422D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8161C20EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D6219538D;
	Tue, 30 Jul 2024 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O8WL9ryN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A0157466;
	Tue, 30 Jul 2024 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378291; cv=none; b=hQBDxBeRFGjtzmNDoysLOcjmhVjjrm58g5d3zmfiKW/nu+ptYv0TL3N8OPqK/tmwW97ICFc9bdoSgizbvA5M8XoRlc/F2PVWdcX1ON6z6u/bnNEc7rlcCsa/ebVNpUTPLx+FC6FBZ05BglC+5lzH9ibJFVDIu+byCLyaqvSOu/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378291; c=relaxed/simple;
	bh=cgKpC5gceDzHXryELU7gyFb/x+B2k7f+8I9m9mwJdsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RqsHKLB9drRp8rn3/7MOMhmpYEPm54PPhaoBgKh49z5HysNWQBdvUzmbARfEnzX2g2GGqy7Ap6nYnNl2US3vIwYG2aNqlIorbxudVVbx9WpvmF410zVT9AX+w3cM0SiH8ObZtwNEAQ+mr6Twn2noGeXCfrz9p4IwQq/N2yDEGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O8WL9ryN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UIl8Wg029972;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=fDcRXbX1oAJ5Si1mvyx2NNu5udd1uv3kIU89beFnAIg=; b=O8
	WL9ryNXRyOybRpFfAjZ+UXzr+sTBd4aFFU5L52wErJQYoZpnn8mz1xGea/+yH+nd
	2zQVupTOfOPeTClDF+FaUN/OXJne4W975pkzJ9o4+fgLG3xH3X/jjOt6Lju10oOe
	94aWa6R37zRN5X6E9V5+0Om8IxGW+fZjIN3bqZs+h05F/zQ597AEtwpnihUydUsU
	yRT/VwFJokh7wIOUDGYoHidGMHqk2MWNn0lHbcPhCofXWj5FUYyYCG1BakBlXElG
	KzlRywu5hg+H7eZahcL5ddLTyVM5W5p6qggxvqyBCviuCPw3/uuXFl+8ZkPexc3r
	Q1jTxr5Ng2PSvfhMdbJg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq5237ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMOgCB024878;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 40pfs7cjpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMGpPO012780;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 46UMOg38024864;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id BB34250019E; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 7/8] usb: misc: eud: Handle usb role switch notifications
Date: Tue, 30 Jul 2024 15:24:38 -0700
Message-Id: <20240730222439.3469-8-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: inWyBpmZbT2Ihr2501lAwyLuAjCm_CUm
X-Proofpoint-ORIG-GUID: inWyBpmZbT2Ihr2501lAwyLuAjCm_CUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=922
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Since EUD is physically present between the USB connector and
the USB controller, it should relay the usb role notifications
from the connector. Hence register a role switch handler to
process and relay these roles to the USB controller. This results
in a common framework to send both connector related events
and eud attach/detach events to the USB controller.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 drivers/usb/misc/qcom_eud.c | 91 ++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3de7d465912c..9a49c934e8cf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -10,6 +10,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -35,12 +36,16 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	struct phy			*usb2_phy;
+
+	/* mode lock */
+	struct mutex			mutex;
 	void __iomem			*base;
 	void __iomem			*mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	enum usb_role			current_role;
 };
 
 static int eud_phy_enable(struct eud_chip *chip)
@@ -64,6 +69,38 @@ static void eud_phy_disable(struct eud_chip *chip)
 	phy_exit(chip->usb2_phy);
 }
 
+static int eud_usb_role_set(struct eud_chip *chip, enum usb_role role)
+{
+	struct usb_role_switch *sw;
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+
+	/* Avoid duplicate role handling */
+	if (role == chip->current_role)
+		goto err;
+
+	sw = usb_role_switch_get(chip->dev);
+	if (IS_ERR_OR_NULL(sw)) {
+		dev_err(chip->dev, "failed to get usb switch\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = usb_role_switch_set_role(sw, role);
+	usb_role_switch_put(sw);
+
+	if (ret) {
+		dev_err(chip->dev, "failed to set role\n");
+		goto err;
+	}
+	chip->current_role = role;
+err:
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
@@ -77,7 +114,7 @@ static int enable_eud(struct eud_chip *priv)
 			priv->base + EUD_REG_INT1_EN_MASK);
 	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return ret;
 }
 
 static void disable_eud(struct eud_chip *priv)
@@ -106,15 +143,20 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* EUD enable is applicable only in DEVICE mode */
+	if (enable && chip->current_role != USB_ROLE_DEVICE)
+		return -EINVAL;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return count;
+		}
 	} else {
 		disable_eud(chip);
 	}
+	chip->enabled = enable;
 
 	return count;
 }
@@ -185,11 +227,9 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	int ret;
 
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = eud_usb_role_set(chip, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
-	if (ret)
-		dev_err(chip->dev, "failed to set role switch\n");
+		ret = eud_usb_role_set(chip, USB_ROLE_HOST);
 
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
@@ -198,16 +238,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_usb_role_switch_set(struct usb_role_switch *sw,
+				   enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_chip *chip = usb_role_switch_get_drvdata(sw);
 
-	usb_role_switch_put(chip->role_sw);
+	return eud_usb_role_set(chip, role);
 }
 
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct usb_role_switch_desc eud_role_switch = {NULL};
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -221,16 +263,6 @@ static int eud_probe(struct platform_device *pdev)
 		return dev_err_probe(chip->dev, PTR_ERR(chip->usb2_phy),
 				     "no usb2 phy configured\n");
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return dev_err_probe(chip->dev, ret,
-				"failed to add role switch release action\n");
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -248,6 +280,18 @@ static int eud_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(chip->dev, ret, "failed to allocate irq\n");
 
+	eud_role_switch.fwnode = dev_fwnode(chip->dev);
+	eud_role_switch.set = eud_usb_role_switch_set;
+	eud_role_switch.get = NULL;
+	eud_role_switch.driver_data = chip;
+	chip->role_sw = usb_role_switch_register(chip->dev, &eud_role_switch);
+
+	if (IS_ERR(chip->role_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
+				"failed to register role switch\n");
+
+	mutex_init(&chip->mutex);
+
 	enable_irq_wake(chip->irq);
 
 	platform_set_drvdata(pdev, chip);
@@ -262,6 +306,9 @@ static void eud_remove(struct platform_device *pdev)
 	if (chip->enabled)
 		disable_eud(chip);
 
+	if (chip->role_sw)
+		usb_role_switch_unregister(chip->role_sw);
+
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
 }
-- 
2.17.1


