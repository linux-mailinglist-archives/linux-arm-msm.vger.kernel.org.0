Return-Path: <linux-arm-msm+bounces-74198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1EDB89EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C903B6EEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5FC30DD33;
	Fri, 19 Sep 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD2udnOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168B313D75
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291921; cv=none; b=nBEezP+8sI+ySTBIrmX+bmkueyGuZqS4o//AN7ZXziYALf+1mBI63+OzGjCWGDvuj5oY96d1Q65Shsmt4g1HVmKHLT/+ShoQFCdttLZRgC+CqgM+h298xPih7yHuSNw1EvjeK8Q6F2OXon/+7cQ7hQD7nclluyZ3r1IFry9PvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291921; c=relaxed/simple;
	bh=0c1kjfygm3Igs/lmvv1odqP5mBi6xk6AIpYhTadaHr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRX+7IsxksEPED+/t/6niRrnEZu19OOVY6mfAVUVhO9bFuOFf16IlOJ31lk8mnAmRrWNGub8gUOllAV+auvkH0YcktDzKx0HaHVWdZm48jtNo83hcXwWQOMjhs/Ikd11I0LLIUYaEJkD/J3CN4Z83FUp4G5QxXvh/TBKyLD/8y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VD2udnOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JA4OJB007100
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDnnPZbDY0CeogNvXqz1T50BX7PocujidnNTMym7C0k=; b=VD2udnOhvv6eemCS
	OcFB1cZWR8WOYzZO3UPBnY6beD0dzmf3/08mP/P1uKg2wXrpccRFX3J3TAhuW727
	zRelRX8IpgvZdARCCJheg8B3m/EexcACQdmwgW9MfFdPmYX+7R7iJ0pUAmq7+IiT
	WfmXR8zbc3NHh6NmmNsS5cd3n9AO/T37OEzZhah6M4zr/nZjzhaAT007DcVkmlGv
	psnrEmEFJYVuHE3j05Xi2uuqOMnFPp26OBKa13/9ELdgzTgAUXidIzieEs8ojbQb
	kKtECC1T65OKuumGuGJD4TaXamEwGzTsRT2TUMhg9CgXmChni/A9dD4L6iTMLQjJ
	V7kLHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebew6sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26970768df5so4465265ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291918; x=1758896718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDnnPZbDY0CeogNvXqz1T50BX7PocujidnNTMym7C0k=;
        b=nyx9nZuTeScsp10F+f761CoUTgEBRUUiPRv+uR8ZdZYRqyqCssO1OISSBvlbbdn5R1
         Iwm0/DD0IbE8mWoBdeOlSpwrp6lu0S0cSD+DZ6Z19TVk4uSxRarSseUeYvU67q4S2MRR
         w9Putfz7J1SDHQSwO8roLf7gVWjO6G0UrWO5KnKwQP099hBPSxuMW6wCTZ1cX0voSKVM
         RoYrOpjhPBFOSCZ03OrKqmxZdOJHAaGfIpKvwzXxsWzd90/yrXmP/qpIews2rtq8WffL
         jsoqL3qx2H6Uu4Th+1OtoXntqy2PI+SsIYg4OW4v9RY+BW3kyOgIK5Xxo45Xp4+XoCcq
         j24g==
X-Gm-Message-State: AOJu0YzEHnyivfAgRKi8L5I3V5lC0xFn0ibH0UAyTVjsO7u6tD8VB5il
	klAZtR1dzX/JyAfGb2qfkJj5ZsF9Myhooy9RdGYABHZoBkeVcJqyHZRiBJ84bN6Oo5j5UPxrZcC
	8gAVxQzaIt0ztJq7AHt3ssheecuV7nyHWHhfAgPppVqhgJ+ALQhF2WKYHkVEr9wP3zayZ
X-Gm-Gg: ASbGncsviy/NuSxAKXcMjvMh5VccnC+5IvdAuCCv/aMvXiv5KwNL3KCbTnpngEGvr2Z
	qSZhpFRTY6pRjmQDnawp7zq5yJ/0v3BA+hYkspNQKv0Xzu2YDRCa11hORFKJG20zdBlTQkPBjs/
	KjbjE2cqmEEWYSdMnv8g2WggE8u+kE5sHWkVXmyi74SZ30IwOX60Fh+KzEPmesfipL0tmWxxEKR
	/S/wBRsm5Ph6Z+jOkWGILehXN9f2m5BvIkeFehfFBGcCGOEvHXG3etPa61FkDxVSrbPBbzfi/Zx
	H+tLO6YBQBSN6YqN4Nre5+4Z3Q7rir9wgswpeVsVQv5ygUELE8YF3GWCn564XspmVi+jFbbRinw
	Y7ZB16BFN3nAioQ==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id d9443c01a7336-269ba5443fbmr17909315ad.10.1758291917835;
        Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhYXF8gNayfDtVMAZtu5Cj2ejeBC3UGhLNP/r+xkffm7Fj8xDpKbRIE8ZT/eufoKRWOwTbqQ==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id d9443c01a7336-269ba5443fbmr17908955ad.10.1758291917325;
        Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:19 +0800
Subject: [PATCH v5 02/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-2-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=5530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=0c1kjfygm3Igs/lmvv1odqP5mBi6xk6AIpYhTadaHr0=;
 b=iEaixY+Ne5VldK2dSyyOJobPiv4QW8bTGDhzcVkwAPKnBFpxI/jJqkimVCIMCkzCIFn3oJdjs
 ZtHVYnVVWq9DnPasRPjImBrckaYYIsNEg5FRPT2sP9N61+lXZMKQmSO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: e5BzbQavzUJIfJXyKocoinV1-LaMmFkV
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd67ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TrVKeqC-PG4e-vJ_ulQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: e5BzbQavzUJIfJXyKocoinV1-LaMmFkV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX78qwygkIrOEj
 gvmkV6HXkXuF3ufiSRTuJLI0nngQ9CpTp9ZtxRl0/VFvT6pUsOfyp2kgDg5L1b1hkV8oLAB2vpf
 g/zPcHNW2KJK+BgKfkCvtt8R7fZF577dGH/jd0O6La1RKClvWmyJI9+Y56i/Vno/DcojdmhrGIc
 vpqJ+nW/nMV4WzNBQ/MlhS0FMldjSiPeW5kAk4gG88T+865/MgDXRVJcADnjrTH2DU/Y4+Ryjw4
 aTGs8eg2qFzst3B9VjFbKXFY2rUO82RbS6i58t4ghlJaZZ6GzpX47XQfS38oYZSkABG/bnkgvJV
 anDra6uzHDnmkz4FhcfAT5glFQpFWT2U7WNIWQQZiJPBD1UGxcYD5uurRXrtRZyhVWole1UyeJC
 G1A5HUXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

To support following DisplayPort (DP) mode over the Type-C PHY, rename
USB-specific functions and ops to clearly separate them from common or
DP-related logic.

This is a preparatory cleanup to enable USB + DP dual mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 55 ++++++++++++++++----------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..62920dd2aed39bbfddd54ba2682e3d45d65a09c8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -342,11 +342,10 @@ struct qmp_usbc {
 
 	struct mutex phy_mutex;
 
+	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct phy *phy;
-
 	struct clk_fixed_rate pipe_clk_fixed;
 
 	struct typec_switch_dev *sw;
@@ -454,7 +453,7 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static int qmp_usbc_init(struct phy *phy)
+static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -504,7 +503,7 @@ static int qmp_usbc_init(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_exit(struct phy *phy)
+static int qmp_usbc_com_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -518,7 +517,7 @@ static int qmp_usbc_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_power_on(struct phy *phy)
+static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -566,7 +565,7 @@ static int qmp_usbc_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_power_off(struct phy *phy)
+static int qmp_usbc_usb_power_off(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -587,20 +586,20 @@ static int qmp_usbc_power_off(struct phy *phy)
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
 
@@ -611,19 +610,19 @@ static int qmp_usbc_enable(struct phy *phy)
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
 
@@ -632,10 +631,10 @@ static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
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
 
@@ -690,7 +689,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -710,7 +709,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -865,11 +864,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->usb_init_count) {
-		qmp_usbc_power_off(qmp->phy);
-		qmp_usbc_exit(qmp->phy);
+		qmp_usbc_usb_power_off(qmp->usb_phy);
+		qmp_usbc_com_exit(qmp->usb_phy);
 
-		qmp_usbc_init(qmp->phy);
-		qmp_usbc_power_on(qmp->phy);
+		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -1097,14 +1096,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
+	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
+	if (IS_ERR(qmp->usb_phy)) {
+		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
 		goto err_node_put;
 	}
 
-	phy_set_drvdata(qmp->phy, qmp);
+	phy_set_drvdata(qmp->usb_phy, qmp);
 
 	of_node_put(np);
 

-- 
2.34.1


