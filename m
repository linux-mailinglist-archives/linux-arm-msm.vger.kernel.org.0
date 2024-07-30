Return-Path: <linux-arm-msm+bounces-27438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D429422BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70BC285F37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862071917CC;
	Tue, 30 Jul 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l8dZ93u6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FA190070;
	Tue, 30 Jul 2024 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378290; cv=none; b=cqfWVc5r2iO08AQLU756lFzOhNBQAQ294pHtKPinfXv7t/vtgTDkSWypx4xdnMbH8BhieK2oVUfmbNzJ94Lrc9EVb7iFb6U/927ygGhrPgzLV0eHyN5KpeJa/kTEmP05W0bAexSUkKoOcvThTOut7zw0QJnCiswAz1x8xCBfBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378290; c=relaxed/simple;
	bh=8l4pBPQquRhwMwnmHwkyb672h240ETwBgX5y6K/wTLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mvtrRj8OPEsptgbfs4U0yiT6WX6uxtEUvxn3k44g+0E8UGNvgQB+HZQjuhixzvw96MzU5anhZh26e2LrajfaHCSkGb0QVOeoui7KMrqHRpyrfB/gHnqtfVovC7gsqjXASlgwHin7bGrKewfrnTjGKJH/Rc6uRFK0kGAV3Z1RZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l8dZ93u6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UIWqbp024039;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=bhbA5ahdZU1ATvTTG9MJalCJi7yPT3Xm50vK7mY+rys=; b=l8
	dZ93u6/h5et7ozKCkH7j0hXiMGivG62xpihRnXc37q4rE2Y/OSnC9lhr8cjOOYP9
	Qnu76zxjVk2aL2wW9UVpoBZuZ+814x8Ss6ihx/lb35beMdK4RxL120b6D1AEnH/a
	02RbWVs6qPl8cLp85ObDxRsw4niLe/53EkKP2YhQlaWTKxjrG+OtXSadpS9VVhyx
	6wWNnux3TAPfCGAo2txiqmnJxWvHAHUqDxHLsDXzrgeaje9Vwf5vF0GFKVZbJA8x
	kMzy5i42TDEPqaHszezI+7jqC7/TCEgTry3e9A1b3MVLy6pRx5gw6u/QvO5QoH5K
	HVskvIcfXTwNLhh5eONA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne8xhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMOg3g025870;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 40pghqm6yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMOgMH025850;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 46UMOgeQ025847;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id B7BD9500198; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 6/8] usb: misc: eud: Add High-Speed Phy control for EUD operations
Date: Tue, 30 Jul 2024 15:24:37 -0700
Message-Id: <20240730222439.3469-7-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z45UKuvCHbIpVLggytp-x-SX_p8_Vahy
X-Proofpoint-ORIG-GUID: Z45UKuvCHbIpVLggytp-x-SX_p8_Vahy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300154
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The Embedded USB Debugger(EUD) is a HS-USB on-chip hub to support the
debug and trace capabilities on Qualcomm devices. It is physically
present in between the usb connector and the usb controller. Being a
HS USB hub, it relies on HS Phy for its functionality. Add HS phy
support in the eud driver and control the phy during eud enable/disable
operations.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 drivers/usb/misc/qcom_eud.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 26e9b8749d8a..3de7d465912c 100644
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
@@ -33,6 +34,7 @@
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
+	struct phy			*usb2_phy;
 	void __iomem			*base;
 	void __iomem			*mode_mgr;
 	unsigned int			int_status;
@@ -41,8 +43,35 @@ struct eud_chip {
 	bool				usb_attached;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	int ret;
+
+	ret = phy_init(chip->usb2_phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(chip->usb2_phy);
+	if (ret)
+		phy_exit(chip->usb2_phy);
+
+	return ret;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	phy_power_off(chip->usb2_phy);
+	phy_exit(chip->usb2_phy);
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = eud_phy_enable(priv);
+	if (ret)
+		return ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -55,6 +84,7 @@ static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	eud_phy_disable(priv);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -186,6 +216,11 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	chip->usb2_phy = devm_phy_get(chip->dev, "usb2-phy");
+	if (IS_ERR(chip->usb2_phy))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->usb2_phy),
+				     "no usb2 phy configured\n");
+
 	chip->role_sw = usb_role_switch_get(&pdev->dev);
 	if (IS_ERR(chip->role_sw))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-- 
2.17.1


