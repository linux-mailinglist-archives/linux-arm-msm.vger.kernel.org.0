Return-Path: <linux-arm-msm+bounces-69927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40BB2D8B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654685C7BA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA52E11DC;
	Wed, 20 Aug 2025 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEBx/f7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C32E173B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682559; cv=none; b=UR9EZIPPJQJnnwW6SqSZ1wz/44sYInCzVArAoSj8XpKjrHAq8wHQVx9PWahwNN0JH31DiGXOLRxyypASePvrJl82kYAc5mKbbEGP/dxK6+nT+gnTCZ43yIm+PG30F3bqGCv+9ipjuwRh0T3/TfIKbF47emvWFCY05Tf84LrDavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682559; c=relaxed/simple;
	bh=iBT4igeHspL9hgxnK6l3In281lZLVL/IRtCY/kLzQbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rc+JnHrW36eM6WbeioJVmW1g67so7IFBqOB6drmYSv0EpFJiclM0xuF6JMw6+vRZY23W5vSJuBLKQmSVHu+gjUB1TakNS062NN7vKRDwMRmb/5q/4ceXdwooNfgMHnxPQv/u+g0D82sgGXip2k5b96HyVUpORVl75Z9Xgjm0tuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEBx/f7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1owQ5002743
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KremxR/fdj+4yZkCD6l4YcPqvbUwj0XC7MX02usfcFo=; b=OEBx/f7dojKoO2YA
	fmETBW6HDsxPTnSI5c8CEK+WT7o0wm5viNrzr6Ehf3a8l1wYK+wzVe2eeN4XwGhd
	Qvu4ynm8XgYRBzCZxjBkmS44On+f05EtFlvsnV4sanvVwqkY50BCvEAL+JLi0xHF
	Jt7HSMyonQOikejr028W1jcwBKNBkHi3eKRJvaFJPYDLQOFRxEwaK/GMJG9YF9TF
	Aj54tGShz0o2ueJplP3P4OtF2ahP77Js5RTgdOhnvpVexEwF4YkHPDQhu5ZvcXeC
	XCbYXQdD0cQIfyXFnIeI30meBW0a9tY3scpsdQtdPRifHPj9RqRLkRZ/aM9YmJiZ
	i+VA1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s6sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f53ef3so12891935ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682555; x=1756287355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KremxR/fdj+4yZkCD6l4YcPqvbUwj0XC7MX02usfcFo=;
        b=HR5+QnPH1oTrFoPPpGPAWl8aeqjJjM2G3bslzwxKYUM8zLHuUJAZgxVAkCOC2cmjzn
         ykOxFpJPjj0/N8LDocGbc/rggm2KzzAM7HbwoQvBbfN5ei+UZO2dzJFba/74xWDQL1H3
         NYBvw88csw1Vn0uJLYR35F3THq4iYeKYGCK8AEegBo1v6LMRnbt5i/7Zd8bboAvqE2ag
         Yf9ww8nZ8xNrJy7xJJ/rIGCPRgJMPOKAE5GOXRzCf505KOGD9rbuz3wrvLXAnAp7cbSQ
         Xw5NjrGt4YhE3sQResRCVG5VRsuU1SKdtpgWlbjhQ0Cd3230uiptiURXg+s5CGdjlMMH
         YbyQ==
X-Gm-Message-State: AOJu0Yx3FFWMMZCGqlnvli/imW5piPiq5bQLWPKvsaIW6z20rOLNIavs
	WUMN2PwtfvHZNgwWYjfFQZub6bL+2H3EWknZzOuaypiyCkF1opyjmnNwoxjrl5mj7nxQZ6A07D5
	cicOG9fc04oOC9UoM6bqIKbS3j7yWBn1SrxzGhSYA4ppGaQR7dNHqayWkqdKSOIIbg0+P
X-Gm-Gg: ASbGncs9s7jBpaqCVqrjaD1Kt8KEwaFicRjOmAXpR8ZC6+YSvByRB2cDkrmNQw7bRG6
	+NvGE0tCbCi1fML2M5P9ePpENVC6isx3tGXa1dJ6toU7dxSYTzgTEyfy2/ypqbLwsoJds6/dayv
	2V3zT9F5bcVSLl0XVaKb2bn4yU2E7nML0vSceE1s6kIfrG7ND5zDLW04mRPN+bicglkmnqvgzmP
	ZEvGTAgeb9vZLTOGSdxC5Ptn6rGI4hKZi/b41qFsJ4gy3UWXciWm1O9UXXuoSA8XjJF+S/W0q+a
	3EXUZa/uu7GykLdHIvscxE+MRJV1Hwf9EKJHWuvCr05WqAWohlswhMsThsPPP2KQ75n8R08mih3
	z3hnRmqZBqxRovZEmModKL+TlYl9L2iix8MEXl+tuge2ZadaqEV1XvMkg
X-Received: by 2002:a17:902:db07:b0:240:8717:e393 with SMTP id d9443c01a7336-245ef1b11a1mr13338395ad.5.1755682555522;
        Wed, 20 Aug 2025 02:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOuhWktbrcrDHeFOfst5iEN/rJ7sUVUpNSLrTofNGaNjn7vDoRdUzbp4Tc22bjyNQhKT6XXg==
X-Received: by 2002:a17:902:db07:b0:240:8717:e393 with SMTP id d9443c01a7336-245ef1b11a1mr13338105ad.5.1755682554931;
        Wed, 20 Aug 2025 02:35:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:35:54 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:45 +0800
Subject: [PATCH v3 03/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=5566;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=iBT4igeHspL9hgxnK6l3In281lZLVL/IRtCY/kLzQbg=;
 b=npOAsieBjEiQjezC1X2f6X8bACFkJXRiMeuFJLH8HY8b6LNRqTa6PRVHCn+z6BVwkY4ctBsbv
 BsHOfwvagVbA+x4hKtNIaBpCuXSlDN+5OWBQwrJgCCyMKqJZp20g46A
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a596fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1G2GM3MvUDnZ3pEch4IA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qTEGigO945x4a46_4XVZNyTZHBYxOebs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6EkwmlWU5CjQ
 TsaP3PBU+8tF1E+E4eDMyuK+/K6QReratOEndHgTzpwMf4dZUXqKjHmS9sX0JB8bKNCFUugVv6Q
 rMa0g3G7OdjUJgh92HM/J35V7JO3TKuIRHeRFdc5CQ58V5FDReZ10bW1nxrGWMlegR7vtCx/wVk
 JiMMjEb5AMyT1n5t4VW9s7zOGegO+l8loWYkFkoBiis0juFXxoeaFydEp6x3gt+FnUMYOX0GxcD
 NIGtJemGiK1R9bvpAlt8IajzXAvhZqhMQ2afAYG6ESGpUQkJ7bqoSy3nHCDnKy6z8qug7tBrW5G
 bdLnX55OrbtdUS9HGNKDUvM+yAP6xTLQztyccpl5y5rQWyKB0nXmCCUyqT236oyPZZQKPyNYBBD
 tdKZ3GQ1z+MczaODUAplQC99p4siWA==
X-Proofpoint-ORIG-GUID: qTEGigO945x4a46_4XVZNyTZHBYxOebs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

To support following DisplayPort (DP) mode over the Type-C PHY, rename
USB-specific functions and ops to clearly separate them from common or
DP-related logic.

This is a preparatory cleanup to enable USB + DP dual mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..e484caec2be20121cfe287c507b17af28fb9f211 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -454,7 +454,7 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static int qmp_usbc_init(struct phy *phy)
+static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -504,7 +504,7 @@ static int qmp_usbc_init(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_exit(struct phy *phy)
+static int qmp_usbc_com_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -518,7 +518,7 @@ static int qmp_usbc_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_power_on(struct phy *phy)
+static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -566,7 +566,7 @@ static int qmp_usbc_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_power_off(struct phy *phy)
+static int qmp_usbc_usb_power_off(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -587,20 +587,20 @@ static int qmp_usbc_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_enable(struct phy *phy)
+static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_init(phy);
+	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
 
-	ret = qmp_usbc_power_on(phy);
+	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
-		qmp_usbc_exit(phy);
+		qmp_usbc_com_exit(phy);
 		goto out_unlock;
 	}
 
@@ -611,19 +611,19 @@ static int qmp_usbc_enable(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_disable(struct phy *phy)
+static int qmp_usbc_usb_disable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	qmp->usb_init_count--;
-	ret = qmp_usbc_power_off(phy);
+	ret = qmp_usbc_usb_power_off(phy);
 	if (ret)
 		return ret;
-	return qmp_usbc_exit(phy);
+	return qmp_usbc_com_exit(phy);
 }
 
-static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 
@@ -632,10 +632,10 @@ static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	return 0;
 }
 
-static const struct phy_ops qmp_usbc_phy_ops = {
-	.init		= qmp_usbc_enable,
-	.exit		= qmp_usbc_disable,
-	.set_mode	= qmp_usbc_set_mode,
+static const struct phy_ops qmp_usbc_usb_phy_ops = {
+	.init		= qmp_usbc_usb_enable,
+	.exit		= qmp_usbc_usb_disable,
+	.set_mode	= qmp_usbc_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -865,11 +865,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->usb_init_count) {
-		qmp_usbc_power_off(qmp->phy);
-		qmp_usbc_exit(qmp->phy);
+		qmp_usbc_usb_power_off(qmp->phy);
+		qmp_usbc_com_exit(qmp->phy);
 
-		qmp_usbc_init(qmp->phy);
-		qmp_usbc_power_on(qmp->phy);
+		qmp_usbc_com_init(qmp->phy);
+		qmp_usbc_usb_power_on(qmp->phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -907,7 +907,7 @@ static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
 }
 #endif
 
-static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
+static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	struct device *dev = qmp->dev;
@@ -969,7 +969,7 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 	return 0;
 }
 
-static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1075,10 +1075,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	/* Check for legacy binding with child node. */
 	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {
-		ret = qmp_usbc_parse_dt_legacy(qmp, np);
+		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
 	} else {
 		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_dt(qmp);
+		ret = qmp_usbc_parse_usb_dt(qmp);
 	}
 	if (ret)
 		goto err_node_put;
@@ -1097,7 +1097,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_phy_ops);
+	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);

-- 
2.34.1


