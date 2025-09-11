Return-Path: <linux-arm-msm+bounces-73155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F1B53698
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D987C16B816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D7A34AB0E;
	Thu, 11 Sep 2025 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHffhLmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8534AAE8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602572; cv=none; b=TqTPk/6mOsO79kY1eCEmM5T1xwVyM3fn7tyRm1DBb87gWkOFF0CMf+NWNT2f8twsVyAc2AYlHPu4b7+bpxvbg68fPGC662AdJKNPaIBBUuwVGacWYaNosDngbah0tWF7kAFNGy25k3i2NSHbFUDbm4y1dRLCI3l7HFCfUFCPW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602572; c=relaxed/simple;
	bh=Ka68iZ0YAPLqx39F2bkX9DO9L1BfCDXGkrO3CFDr1Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqvHeo9QCmz25gxLSroePzwVNEV4HShUX7s8IUzY/X127zG81VBmgh2l7+lZqJcRSYy9/a7cTDKjlSmoYyPeKKCN+/aINIVq3G0xBJzOgx52B+aNPZRXKyb1KBJvnNfAsPYg/GV4FEZXZfg9eg5vL2NaMEtHl/OFCKCDdkjZQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHffhLmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEkbm030862
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qf33+rpkqechNWLDM2iiocmjqpmdnUS1R/bV4PaBr7I=; b=IHffhLmg2Kp2S1GF
	7NUgB/aDIyENtgUzLBLy8UoNfDSsBtPFix49uLYfl6TVmX/cHQf0YsRk3X73Lhz1
	vcv/Ep/kjrtWH2iT/mUGrjm9LwrbSnjXsrftCu7HtCblXHGjoUHm0UHN/ciuWde8
	CMlON4E42Rz8WJFdB/ZrszPDwJ5LGpOox+3gVo/gPKPUCSQ/GywSj92C2rHaVJfB
	/evQ1AM+dOT5rdzFm8HoUwrLxjaOJDB+VEpBjJ1VylR6vaExAJbwCn3vR2ewTRdY
	HTF7gSyZYah0cR12KyO9S191LjFqkbYyvKo8QH4gs+kM8HBb9JrsU/bNlR7hrhCy
	XuWrZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7xm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5228e3fee5so38448a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602568; x=1758207368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qf33+rpkqechNWLDM2iiocmjqpmdnUS1R/bV4PaBr7I=;
        b=qLlpBZIJGgRaU7xIX9Bzj4sAllFK0ZpIpQmuHUCMBNIzp1sofii5I/1l60YzJs2atg
         XYgwg73Fdr2ZXgKgA+gO08OJB1eunyu0i58PNQiFhJ7Sg9tolyTj3BiqrHK+kJAvHZ+U
         WvFnOdZlHkPvxhcxg3Kp11t9K6g3sUrErD7S6BRE3Eebq2AqNiRbaVWIT2+ZEFDc7pRk
         KrVnOMXamasyHZa58Q5pQF+JTdJSbt5IuqonSkJbY9YfivJmlVP9FOkokS165uWRl6wU
         /IDO0Y2ZlslwEkMHXHpvWofpnBnG5+jDNTPDDbaVfR9/pJOaHjSm/wnXAksc941hDM0T
         sDJg==
X-Gm-Message-State: AOJu0Yxcjhj6cX6U/kQm3pxJ3HBkr55I1EgtI/VBb0/v/4TPQCBS1r7T
	o7TXff7ILdzwCYjWGIeNV8FMQ2xgFSlZRTnkottc7+Dc/CJvaMjUq6whTpA9u7PpL+PiJEQp/QA
	tASvpo2arGWRNw1C4kvajW8ofO0dcitkI0ooowxV0TyGeEweBe777MuTEYE+bp8Sy5Wl8uCIJlR
	z7
X-Gm-Gg: ASbGnctWDBzMhOEDKoEaHbKQQxQ6jfvAe3mH7QpRtU/ZsmrthyltrB4ZUxYwTiM7uDJ
	yNpX+vG8kOy4IcqV3Yd3l7vvl3tP58ZaFHcRSjQ5F63+9hlnXjPqzHxlUWBZ+O1whou2HcMQZRb
	mYEqMMEBLfn59tOjd5xDuoupektXljZagdJrRGl8tuhiahe6KRcY3COfSMYLsjcUOhNby0/lesC
	Cf+XH5eTyt3c5v+mgtdvCOXC5VWFDCxnCYlpTPeTk5Gb6n5GDNE/wHKQK4dx3UBvEOv7XJ94Cxi
	Lr1Qebf/ZfwfTUEsD9rDP2VMoxOmd03J34moS5HQx0mZoAkoyxRbtnmCexh90H/xTe40jlGxaO/
	mblxxuizQeOlEtyfZoIzNMibMJagX04F+Fyi6OQVXcME1AGMSzyIvoi3a
X-Received: by 2002:a05:6a20:3c8e:b0:249:ba7b:e358 with SMTP id adf61e73a8af0-253466f7f0dmr16784912637.7.1757602568313;
        Thu, 11 Sep 2025 07:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzOKHmMadDOEhXme38l/SgVEjQSf03G6ln8D6mZepsc9zXZZEmfprR+eGiQM7vxndfPtt00Q==
X-Received: by 2002:a05:6a20:3c8e:b0:249:ba7b:e358 with SMTP id adf61e73a8af0-253466f7f0dmr16784879637.7.1757602567620;
        Thu, 11 Sep 2025 07:56:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:56:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:02 +0800
Subject: [PATCH v4 05/13] phy: qcom: qmp-usbc: Add regulator init_load
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=5710;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=Ka68iZ0YAPLqx39F2bkX9DO9L1BfCDXGkrO3CFDr1Y4=;
 b=/ZWVMXETRYCmYdA8o6t2MnLwpgwvcWgvtvLKQLXtulERXXssTrM8ZB2ekpiJCe6sF3eIQ5bs8
 k1596YGMfx3AcWiYQkCCQAZUjlVIOjpNMsbccZosgJojGzZ/aSeLQ9J
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 7Gvn0UrGhlhfoXfUA-bmnKdPL0bQD6Dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX6+HzwZdyTVQI
 /xTIBeEz/ZxrZPBHBJsJ6a3pDjyk9CBbvxZ+rX9cuZVFoE4fpaIi/p3g6anbjFoEUmRCpcB501C
 nvQMjrvKi2CIEjNbgiB/+qmAsNdnPMIQFyr9tj6TTj9IvDjy3sYeGW7IrU4TAuRYBtckA0yYS/6
 Bzk4OkMRJcQlkUcKiNf3f/Z/irL93ciCcE6yHXaI+UBfJaE0WzzafxYEYMnI4HkcpDv5L4JeAP1
 5TS19+bqHysABtL7GHKzcnOQI4KAFiVCiPv1jC06+0/LGw3PJvhaXBQSR/Hx5aL5A7H32RL1g+t
 JyF+f/nwkG3uqLYIwEzjmHxG6xVk6H8bPWtKZoXPMtT8zWcryVkq9o/9Koc1rgySc0+Dzy/le37
 cArwhDk/
X-Proofpoint-GUID: 7Gvn0UrGhlhfoXfUA-bmnKdPL0bQD6Dc
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2e309 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RNflNDmReaz8n2eeux8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

QMP USBC PHY drivers previously did not set init_load_uA for regulators,
which could result in incorrect vote levels. This patch introduces
regulator definitions with proper init_load_uA values based on each
chip's power grid design.

QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
regulator requirements differ. A new qcs615_usb3phy_cfg is added to
reflect the correct settings.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 +++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 791c7d86c51769bc9c7c5e1c73603c87fc71a820..23a0efa7fc4418f379ac4c02fd92080c7755dead 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -416,7 +416,7 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -508,9 +508,19 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 68600 },
+	{ .supply = "vdda-pll", .init_load_uA = 14200 },
+};
+
+static const struct regulator_bulk_data qmp_phy_sm2290_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 66100 },
+	{ .supply = "vdda-pll", .init_load_uA = 13300 },
+};
+
+static const struct regulator_bulk_data qmp_phy_qcs615_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 50000 },
+	{ .supply = "vdda-pll", .init_load_uA = 20000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -562,8 +572,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list              = qmp_phy_msm8998_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -578,8 +588,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_sm2290_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -594,8 +604,24 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_msm8998_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+};
+
+static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -627,6 +653,8 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
 
 static int qmp_usbc_com_init(struct phy *phy)
@@ -911,23 +939,6 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
 			      const char *const *reset_list,
 			      int num_resets)
@@ -1235,7 +1246,8 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(qmp->dev, qmp->cfg->num_vregs,
+					 qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 
@@ -1304,7 +1316,7 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 		.data =  &qcs615_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,

-- 
2.34.1


