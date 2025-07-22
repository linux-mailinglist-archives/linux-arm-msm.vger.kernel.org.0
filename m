Return-Path: <linux-arm-msm+bounces-66003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16430B0D2DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE0B5188C1C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979052DAFD9;
	Tue, 22 Jul 2025 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBt+M+UI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DEF2C15B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169016; cv=none; b=EN5LT1df6ro34tbyU9f5G6i+Me/alpCmDmVBTO5/gOPpZH5z1T/8x1h9DHMC3PWZ9TCnNc0ZzqTe+i9mPvHk4eWz/LyHyMiL5/om4ue/nnKh1qv9aEOPEk1qu72W3cLAHhS0AbUkR3wyBn370uC7tI6s+4yI2oH5MzxjuhCFtjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169016; c=relaxed/simple;
	bh=x52wj5u+rb6dbB9m5Z9EVaM2Qq3LqnWRHa5RdOZnzXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYpSrCIEdWBs3uApcpOtyVHkSxUgPnPEHRuVi2tzglrlN9zM6WW0irfYUCP7gMMMdGi1rV7Y5gCV9E1pm0atRi3S7R6G+em4m2DOt1C+zzyv5iCo2/jiXJad5Xz/r4aXEEQqMKynRuAlnide9hD70lBoSqJwkCjikfXRjsFmXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBt+M+UI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2Oqw4016582
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=; b=cBt+M+UIJuLQzsUe
	WWeUa0SdQ6edqvThTF2bTw/Wu+iMg3JtCyK29PyhTe/DP7aeq/IIpbOwmleTHBBL
	c4bAwVXhZ23icfbCpFeqVmDRRHZ5oTUuE+Q8Z3WRi3BhZFjI+9t/mHao5p7Utp2t
	CR06uTWPKapPTfLAbLKTsIOLxWbGmZX1foQAgVYgRA7aGimYPnXiI7qXYomGPhut
	BYbLL3C5f4rlfK4a76Z5L71bn/yuldDJ+e3YQFZ9tK7Isv1L/ekoujcZxk26Nx6a
	6pOVw008CXEatIHEknT25levLSKz7JzqeKKPOECWxD9r5IulLAKR3ykKPmz+OMoF
	Cf6wbg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s0htj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c0c961cso1553478a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169013; x=1753773813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=;
        b=kMmNMyhRPwCLqN5Q3PCXN3lqVb/Cf+5Lu/SibuHpeUPJZGjzxXDAaZ4BfXeGRIkzVS
         qCLbpMMDGTcPd5SYJNOuCm5yIzCgMpxFpRq7lOaVY98x/FPYMQJxN/S7acjGWbDSfyFd
         YcEUndODhnLWoUQfF1f+baecUmav1NsJf5Vx+GbLMhJwH5yJcESi+zAY17HUKcEAHT6o
         UpaNsfV2rXTMz0yY0v9rwpwLcAHChkuYD4gK1303xOhvO/I7c3k5prO7LGLc8bx6+h24
         jGB1DFc/uMgqHnH9ePdrLw5JRG1l6xCRh+gogeslNOjJon+ZofG54K1RIhnzqjpD/pr+
         mMiw==
X-Gm-Message-State: AOJu0Yw65vjKJFvHxY5r/jYlOt0CDB3XWHGhIuuhNcCSWUGHq9+2GEO+
	t7/2BYKQjnpv/xSdjIuCqQnxLf6IR3WEjIxlUqmuezk3yRCQT1hkEgYBiba60xL/n4NuS8xm6GV
	gsFSEA/oPWxGuRRgqVizSWGI7mLnKE9snpd+XxDA62+t6aN48q/MQWcyKvv7DXnNPukrh
X-Gm-Gg: ASbGnct5beNamZ6EmoaSCLqezl/eaVkPrJcl3ZqwAvftt2jiBVwOwnuaG1FL3q3bdeE
	8av7VDZ7ljphxCrVgO7+Cn+jxERMCuag0ynt1eBakw3KRH7tGytgCK+sUStPQNfjezbi74ruLOP
	trcr/MiZlcDBrAtJNo/3S6nejs562QQ3PVcDMOjD6FpVUZaphzosTqmJWvSxvxb7skTlo0/Iaar
	EORhisVd490cp7vhb13M1a5kDf6MPTwxb/Hkp5fTbWM1/M9iZgAfSrCSj0neC7knIJNMRrQHu51
	Ibhwy2DXvXIKi+aF45mX+ma2Ps2716UypiwGZfEhWGL5GwkBOSw8JD+3C/O+WOtO5czMmiju2A5
	SI16NAIPNNDE+uQxvTy9C1D6jzM5aDj+FjZSHjATfOzRni+RyzCRKNFLg
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id 98e67ed59e1d1-31c9e76ae7amr13793090a91.3.1753169012528;
        Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFko6zdDLS9yGWBWKIKCenAy/9fb0yFHvW+++dTlsCyxV/jrbgXYH4ktmzFN6HzFm/3zlSHSw==
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id 98e67ed59e1d1-31c9e76ae7amr13793061a91.3.1753169012023;
        Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:23:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:11 +0800
Subject: [PATCH v2 10/13] phy: qcom: qmp-usbc: Track PHYs for standalone
 DP/USB3.0 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-10-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=4083;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=x52wj5u+rb6dbB9m5Z9EVaM2Qq3LqnWRHa5RdOZnzXM=;
 b=htKC4pfBN+sR8v9mfOnbuVOX4GlHHUEvwakJuhy6tTezZjlR8N3uaHroW6IAc7yy0WQJgl5V7
 Q7hKjifp+bVBs2A+gPwSVkicyslpzb5ZWiQa7F77q4VpAWJJKTjDhlO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX3rQljs++8c+B
 OARIfDxQ2F11wUoRkQUp+g3dAhmcENXJENyHMGZ0nnaRwX2mOqtPi+Xp9GxthlDc+4asmwT9DQB
 OmFNOCCnWkq9lu5Nl3awxEh7QL/oPXaBDX1pO0yNzJYlEFSEcDN9xdnfc7d2rxgulbm1/TTMq5v
 SddVxI1RDM/qD9eBpjdudRP7xvuGODG3jymmVSyyRfc1VHeLnpIJ8H9LIbXVUdDHcOYftzaHwu+
 HGnNMNgkYaApONvaMPAJPEO1p2IRE9dOOshtGjVZhp05fFA9WU5OWIango7NkvMBZXPnGguU+PF
 vi/8MMAGRFAdJuqivTiYz6wtTtvI8NENEmlp1OP7dAfnlQPhehbyEJxvkhK7VHgrwG3cHtqtjYB
 WrWNS7alJT/dk9WHODBQOYariu6zzxfZ+fJszHXqAXdJs0r36S5o88gcJeY2+ZAq32Gx8PYh
X-Proofpoint-ORIG-GUID: rqwMVyZQ11sjdy4HsGbTxY_zVyCsVxAT
X-Proofpoint-GUID: rqwMVyZQ11sjdy4HsGbTxY_zVyCsVxAT
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f3c75 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vLThFRzmIc36aVVRt4AA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

Introduce a local list to track registered PHY instances, enabling
identification of standalone DP and USB3.0 PHYs that share the same TCSR
region.

This allows the driver to detect and manage mutually exclusive PHYs at
runtime, preventing configuration conflicts when both PHYs are present
on the same platform but operate independently.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 6291298904de9717283e59f1ca2a845b46146d52..e97a206a10554b2d157d1fadd66d66386eec6c40 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -514,8 +514,13 @@ struct qmp_usbc {
 	u32 dp_phy_mode_reg;
 
 	struct typec_switch_dev *sw;
+
+	struct list_head list;
 };
 
+static LIST_HEAD(phy_list);
+static DEFINE_MUTEX(phy_list_mutex);
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -1107,6 +1112,25 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp)
+{
+	struct qmp_usbc *mutex_qmp = NULL;
+
+	mutex_lock(&phy_list_mutex);
+	list_for_each_entry(mutex_qmp, &phy_list, list) {
+		if (qmp->type != mutex_qmp->type &&
+		    mutex_qmp->dp_phy_mode_reg == qmp->dp_phy_mode_reg &&
+		    mutex_qmp->init_count > 0) {
+			dev_info(qmp->dev, "Mutex phy busy!\n");
+			mutex_unlock(&phy_list_mutex);
+			return -EBUSY;
+		}
+	}
+	mutex_unlock(&phy_list_mutex);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1114,6 +1138,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -1166,6 +1194,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret) {
 		dev_err(qmp->dev, "type(%d) com_init fail\n", qmp->type);
@@ -1772,15 +1804,16 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
 	int ret;
 
-	/*  for backwards compatibility ignore if there is no property */
+	/*  for backwards compatibility ignore if there is 1 or no property */
 	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
 					       &tcsr_args);
+
 	if (ret == -ENOENT)
 		return 0;
 	else if (ret < 0)
@@ -1793,6 +1826,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
+					       &tcsr_args);
+	if (ret == -ENOENT)
+		return 0;
+
+	qmp->dp_phy_mode_reg = tcsr_args.args[0];
+
 	return 0;
 }
 
@@ -2051,6 +2091,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	mutex_init(&qmp->phy_mutex);
+	INIT_LIST_HEAD(&qmp->list);
 
 	qmp->type = data_cfg->type;
 	qmp->cfg = data_cfg->cfg;
@@ -2064,7 +2105,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (!qmp->layout)
 			return -ENOMEM;
 
-		ret = qmp_usbc_parse_vls_clamp(qmp);
+		ret = qmp_usbc_parse_usb_tcsr(qmp);
 		if (ret)
 			return ret;
 
@@ -2139,6 +2180,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		}
 	}
 
+	mutex_lock(&phy_list_mutex);
+	list_add_tail(&qmp->list, &phy_list);
+	mutex_unlock(&phy_list_mutex);
+
 	phy_set_drvdata(qmp->phy, qmp);
 
 	of_node_put(np);

-- 
2.34.1


