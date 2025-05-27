Return-Path: <linux-arm-msm+bounces-59626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B1AC5BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316801BA80E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDBB217666;
	Tue, 27 May 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwgKDGsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4152153D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379905; cv=none; b=qMpfDH5MSZ8qaMVK21Ll+nPRLoz+Zr6xMGMW4DPNiFqyZoHXaFNWLA0CTaxKi5sqeJe7oiO35Puj+/5+5lVr44PHmpPRBvSJSfnHEhQmzpHGOIPmTb8uxt2ycmxr574pzvN/tnujweHavsUWH1d1OD+oiPzOwxngKXba8Ys2Wtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379905; c=relaxed/simple;
	bh=J0tw8GGO4wL9xTL2953azTtC4i28XE8iFK6L9NmPDPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMlbduzMZjflw0Gs4JenmIeqtTeEelSb+1zG9h8mfBZu0MRnsVyYQ0qDcMYa65UqiT8CFrxmeF6+0Ca5Yjp2gBcBqJrV7r1poYs7Bl379ryPoKJ0+LE9pNwjYf1f/yIu4vfPf8BOtpCRz4bufeLCDXVlNU3afY+l3Nvqvj0uJE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwgKDGsF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIHswi003733
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwsiqMrHhXwWSHFVyW3ahl2aL/W4hpaHEh0uYCGybzA=; b=NwgKDGsFjaRMbiDS
	ENiHHkn1S3fTRz0U2vlVPkF4r4HiGczud07k4S9qtAObgXHdC7lELuzZb8stp+EP
	6sSR01hzFT1aF5YV/LnDpbmrLK/yc0wD6PqVBt6jnq0MHgc3JUrUqEF8qX2m5rDs
	9CC/fEpv1/3JXkSQaWFmZ/LTFyoyQ0uN0704pLNjLkxERtMAPjOd1acTVQh03mhS
	HkZbyKVy3GuQ7VN0uiyUvrXD6+v5tfWt4YeoicKE73RnwErznMasJ/l2TJJ6Rlxt
	3MG5RDzA5U5eGo/bbkU/fCdTj9J+h3mGtutk90BXdChwN/PMqwYcQRIW49x2OIVr
	7ZhC8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wgf54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742a091d290so2604441b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379900; x=1748984700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwsiqMrHhXwWSHFVyW3ahl2aL/W4hpaHEh0uYCGybzA=;
        b=wrLjGRlX9Xn2Kk6TiaQoKlyNzsfgxBVOVdbEFvhR1V54ktMPNF/PwpCX+xF64xwa9G
         WGpgJL3LuTU01NaVqSMmdD8+sbUW71l3NXe4rCNKiwPoH7V99ipnGkuJRGdx3x+InlCT
         d2FBGyQd/AsSTdZ+bMtdLpJIn7STPDYToxi2+0YwmsCZxo7mVhyAnDXs0N6uW67+bVcO
         XIZOGnSxHvqIYq1DpjvOM7HN8SlmGJEJux8YL/qruGAGZJAJIIvj9BLKD29ff6L/PAIr
         jufrw17B792jzu664IhDkhXIJhOzRuIczeBDLgA5Fnkok+QKWFHN+XCnaz/G2LfNqcav
         jmyA==
X-Gm-Message-State: AOJu0YwUsSAoyZBS+s1JTj0SsmHhrvcGRqjo8PunNkxLjjLATsb/yF1g
	MpAScbaJXCi3x8L+zIJCV2vjJLP+D0gNtPMEixZsAUGyl3rFe3l3sweYHsCXIBkWZ4PThrJePVK
	S+qD5FYcjj/fdNLohIIh6m5ZyuMNuhdbhelaB76ABeAyd0Q18kEnnYMqNMjK3ns/jCqvT
X-Gm-Gg: ASbGncsGAOurr++2dGAoww8TuKHiipMU5+rbKOYp4Xf3qdGeCG0ErFNAEdezbIXqvQt
	zQRmnYqt2EhGVEEnds8rPC2wryyF8CTG7YNM7I2p1Z5uc+n9h+piZc4u3O5c7wx94Epji6Huc3j
	0D0yGLaluMgdjCngxUmq6EHJNmWEoCn2fKsOLuMrcAeCqsUgzMwcXXBXIBwy1qNIrwd+ApKoWBI
	+F6w39Rny8Ip9zzmpjJJMNeOAr4YZtSC94LXHdm1Qs49bE3TgwdanBMFnnfCn5YuJEJSWEM272g
	KcOvNJLSLuEmgYh0xqBYm7PsU8a2MzxEuN4LTfq4odQmFRgeq+YZ9cL4UW/Kae1OPp0=
X-Received: by 2002:a05:6a00:2385:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-745fe079dabmr22415766b3a.20.1748379899907;
        Tue, 27 May 2025 14:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNr6nLqUCy88efY8I90G9SAJJTj4IMIaxleVpD90RLAKlWPk+f90BoItsBGFbM4jwAXq7LKQ==
X-Received: by 2002:a05:6a00:2385:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-745fe079dabmr22415701b3a.20.1748379899345;
        Tue, 27 May 2025 14:04:59 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:58 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:40 -0700
Subject: [PATCH v6 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=24445;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=YThqfioeYZBJUrXEKMsbkrkjox9bIVbgzIu25TaOG04=;
 b=obz5koI+8QB3wOjMxzRYXFV1qu6+ZY2VRJInjtbg1LGgQ2p/FDhdTEeKPh4LlmM/v4kMkUVXF
 7FIlQzxoBXuATLB/v3U7K38meqMlfdXutb9EtqtmgiG1inpMAdz00Yi
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=683628fd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=UZBd9ZQXIvJYZa1OSmIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: k8kSS5s7sgWbO9_eY1mC-gBX466u5maV
X-Proofpoint-GUID: k8kSS5s7sgWbO9_eY1mC-gBX466u5maV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfXwyS/c/DtL45f
 E4+k2ckxwGdfnqilqVQO8hM2HNnoDkIUp3fchP2jiGwM9bp9NU81YgZj86jXo6bqPy8Duzb/stM
 V10NIfehh/QSXwq/8cO9GYFLPgENsHabHBJcHM/mIHIfCH3YN49BczOxTucoPTRYXYS/qQNwUa5
 wDLn8kY7rd1sV2Pj/ANUIJR9+04SBZfJtYdvro/bivCrjUNktn+0wVTq9vP4RB+rj6ICmx/FOfS
 YJiBGnhJ5W/iz/5VGzl9uS/8sydaxRkZ1ZB6z0e1ynxdnZ2eXQdzytN3R81PQv4tE8X+haQzUOV
 Dgoetq4GeqO6UPXs7mOu3k7BKrjVq70QFLL3O6Rbkq6wmtk9B+y+kgJ0Kr0jbZeMNeNpy3xBGzb
 CpxU5WQzXgtbJou7NHXmt0auOK1s1baQWdlshSIkOnUtPgTJSIkum2WjkOcbEdU6cC+WJpLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add new register offsets and PHY values for SM8750. Some of the previous
definitions can be leveraged from older PHY versions as offsets within
registers have not changed. This also adds the required PHY sequence that
is recommended after running hardware characterization.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 6 files changed, 428 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..8b9710a9654ab1acf8419e7f87188cbc98f8714a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -32,6 +32,7 @@
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
+#include "phy-qcom-qmp-pcs-usb-v8.h"
 
 #include "phy-qcom-qmp-dp-com-v3.h"
 
@@ -212,6 +213,28 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_N4_TX_TRANSCEIVER_BIAS_EN,
 };
 
+static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V8_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V8_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V8_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V8_PCS_USB_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V8_PCS_USB_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V8_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V8_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V8_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V8_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V8_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
+};
+
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -1471,6 +1494,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
 };
 
+static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START2_MODE1, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE1_MODE1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START2_MODE0, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE1_MODE0, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_BUF_ENABLE, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_ADDITIONAL_MISC, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_LANE_MODE_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_LANE_MODE_5, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V8_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V8_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_UCDR_SB2_GAIN2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_AUX_DATA_TCOARSE_TFINE, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_GM_CAL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_SIGDET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_00_HIGH3, 0xdf),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_00_HIGH4, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_01_LOW, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_01_HIGH2, 0x91),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_01_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_RX_MODE_01_HIGH4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_VTH_CODE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RCVR_DTCT_DLY_U3_H, 0x00),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
@@ -1781,6 +1937,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
+	.com		= 0x0000,
+	.txa		= 0x1400,
+	.rxa		= 0x1600,
+	.txb		= 0x1800,
+	.rxb		= 0x1a00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1c00,
+	.usb3_pcs	= 0x1e00,
+	.usb3_pcs_usb	= 0x2100,
+	.dp_serdes	= 0x3000,
+	.dp_txa		= 0x3400,
+	.dp_txb		= 0x3800,
+	.dp_dp_phy	= 0x3c00,
+};
+
 static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -2280,6 +2452,51 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 };
 
+static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v8,
+
+	.serdes_tbl		= sm8750_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8750_usb3_serdes_tbl),
+	.tx_tbl			= sm8750_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8750_usb3_tx_tbl),
+	.rx_tbl			= sm8750_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8750_usb3_rx_tbl),
+	.pcs_tbl		= sm8750_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8750_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8750_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8750_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
+
+	.regs			= qmp_v8_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3915,6 +4132,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sm8650-qmp-usb3-dp-phy",
 		.data = &sm8650_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sm8750-qmp-usb3-dp-phy",
+		.data = &sm8750_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,x1e80100-qmp-usb3-dp-phy",
 		.data = &x1e80100_usb3dpphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..89ace8024bc0bde55b5a590f67d906b893c197a1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V8_H_
+#define QCOM_PHY_QMP_PCS_USB_V8_H_
+
+#define QPHY_V8_PCS_USB_POWER_STATE_CONFIG1		0x00
+#define QPHY_V8_PCS_USB_AUTONOMOUS_MODE_STATUS		0x04
+#define QPHY_V8_PCS_USB_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V8_PCS_USB_AUTONOMOUS_MODE_CTRL2		0x0c
+#define QPHY_V8_PCS_USB_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x10
+#define QPHY_V8_PCS_USB_LFPS_RXTERM_IRQ_CLEAR		0x14
+#define QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL		0x18
+#define QPHY_V8_PCS_USB_LFPS_TX_ECSTART			0x1c
+#define QPHY_V8_PCS_USB_LFPS_PER_TIMER_VAL		0x20
+#define QPHY_V8_PCS_USB_LFPS_TX_END_CNT_U3_START	0x24
+#define QPHY_V8_PCS_USB_LFPS_CONFIG1			0x28
+#define QPHY_V8_PCS_USB_RXEQTRAINING_LOCK_TIME		0x2c
+#define QPHY_V8_PCS_USB_RXEQTRAINING_WAIT_TIME		0x30
+#define QPHY_V8_PCS_USB_RXEQTRAINING_CTLE_TIME		0x34
+#define QPHY_V8_PCS_USB_RXEQTRAINING_WAIT_TIME_S2	0x38
+#define QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V8_PCS_USB_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V8_PCS_USB_RCVR_DTCT_DLY_U3_H		0x44
+#define QPHY_V8_PCS_USB_ARCVR_DTCT_EN_PERIOD		0x48
+#define QPHY_V8_PCS_USB_ARCVR_DTCT_CM_DLY		0x4c
+#define QPHY_V8_PCS_USB_TXONESZEROS_RUN_LENGTH		0x50
+#define QPHY_V8_PCS_USB_ALFPS_DEGLITCH_VAL		0x54
+#define QPHY_V8_PCS_USB_SIGDET_STARTUP_TIMER_VAL	0x58
+#define QPHY_V8_PCS_USB_TEST_CONTROL			0x5c
+#define QPHY_V8_PCS_USB_RXTERMINATION_DLY_SEL		0x60
+#define QPHY_V8_PCS_USB_POWER_STATE_CONFIG2		0x64
+#define QPHY_V8_PCS_USB_POWER_STATE_CONFIG3		0x68
+#define QPHY_V8_PCS_USB_POWER_STATE_CONFIG4		0x6c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..169fd5de74747c8c9a833a629d8000875168a6ff
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V8_H_
+#define QCOM_PHY_QMP_PCS_V8_H_
+
+/* Only for QMP V8 PHY - USB/PCIe PCS registers */
+#define QPHY_V8_PCS_SW_RESET			0x000
+#define QPHY_V8_PCS_PCS_STATUS1			0x014
+#define QPHY_V8_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V8_PCS_START_CONTROL		0x044
+#define QPHY_V8_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V8_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V8_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V8_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V8_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V8_PCS_REFGEN_REQ_CONFIG1		0x0dc
+#define QPHY_V8_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V8_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
+#define QPHY_V8_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
+#define QPHY_V8_PCS_RATE_SLEW_CNTRL1		0x198
+#define QPHY_V8_PCS_CDR_RESET_TIME		0x1b0
+#define QPHY_V8_PCS_ALIGN_DETECT_CONFIG1	0x1c0
+#define QPHY_V8_PCS_ALIGN_DETECT_CONFIG2	0x1c4
+#define QPHY_V8_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V8_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_V8_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V8_PCS_EQ_CONFIG5			0x1ec
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..d3b2292257bc521cb66562a5b6bfae8dc8c92cc1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V8_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V8_H_
+
+/* Only for QMP V8 PHY - QSERDES COM registers */
+#define QSERDES_V8_COM_SSC_STEP_SIZE1_MODE1		0x000
+#define QSERDES_V8_COM_SSC_STEP_SIZE2_MODE1		0x004
+#define QSERDES_V8_COM_SSC_STEP_SIZE3_MODE1		0x008
+#define QSERDES_V8_COM_CP_CTRL_MODE1			0x010
+#define QSERDES_V8_COM_PLL_RCTRL_MODE1			0x014
+#define QSERDES_V8_COM_PLL_CCTRL_MODE1			0x018
+#define QSERDES_V8_COM_CORECLK_DIV_MODE1		0x01c
+#define QSERDES_V8_COM_LOCK_CMP1_MODE1			0x020
+#define QSERDES_V8_COM_LOCK_CMP2_MODE1			0x024
+#define QSERDES_V8_COM_DEC_START_MODE1			0x028
+#define QSERDES_V8_COM_DEC_START_MSB_MODE1		0x02c
+#define QSERDES_V8_COM_DIV_FRAC_START1_MODE1		0x030
+#define QSERDES_V8_COM_DIV_FRAC_START2_MODE1		0x034
+#define QSERDES_V8_COM_DIV_FRAC_START3_MODE1		0x038
+#define QSERDES_V8_COM_HSCLK_SEL_1			0x03c
+#define QSERDES_V8_COM_VCO_TUNE1_MODE1			0x048
+#define QSERDES_V8_COM_VCO_TUNE2_MODE1			0x04c
+#define QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x050
+#define QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x054
+#define QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
+#define QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define QSERDES_V8_COM_CP_CTRL_MODE0			0x070
+#define QSERDES_V8_COM_PLL_RCTRL_MODE0			0x074
+#define QSERDES_V8_COM_PLL_CCTRL_MODE0			0x078
+#define QSERDES_V8_COM_LOCK_CMP1_MODE0			0x080
+#define QSERDES_V8_COM_LOCK_CMP2_MODE0			0x084
+#define QSERDES_V8_COM_DEC_START_MODE0			0x088
+#define QSERDES_V8_COM_DEC_START_MSB_MODE0		0x08c
+#define QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
+#define QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
+#define QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define QSERDES_V8_COM_VCO_TUNE1_MODE0			0x0a8
+#define QSERDES_V8_COM_VCO_TUNE2_MODE0			0x0ac
+#define QSERDES_V8_COM_BG_TIMER				0x0bc
+#define QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
+#define QSERDES_V8_COM_SSC_PER1				0x0cc
+#define QSERDES_V8_COM_SSC_PER2				0x0d0
+#define QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
+#define QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define QSERDES_V8_COM_LOCK_CMP_CFG			0x124
+#define QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V8_COM_CORE_CLK_EN			0x170
+#define QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_1		0x1a4
+#define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_2		0x1a8
+#define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_3		0x1ac
+#define QSERDES_V8_COM_ADDITIONAL_MISC			0x1b4
+#define QSERDES_V8_COM_CMN_STATUS			0x2c8
+#define QSERDES_V8_COM_C_READY_STATUS			0x2f0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..4cb8b1708607ab35760fb15f3e524872334d9b40
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V8_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V8_H_
+
+#define QSERDES_V8_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V8_TX_TX_DRV_LVL			0x014
+#define QSERDES_V8_TX_RES_CODE_LANE_TX			0x034
+#define QSERDES_V8_TX_RES_CODE_LANE_RX			0x038
+#define QSERDES_V8_TX_RES_CODE_LANE_OFFSET_TX		0x03c
+#define QSERDES_V8_TX_RES_CODE_LANE_OFFSET_RX		0x040
+#define QSERDES_V8_TX_TRANSCEIVER_BIAS_EN		0x054
+#define QSERDES_V8_TX_HIGHZ_DRVR_EN			0x058
+#define QSERDES_V8_TX_TX_POL_INV			0x05c
+#define QSERDES_V8_TX_LANE_MODE_1			0x084
+#define QSERDES_V8_TX_LANE_MODE_2			0x088
+#define QSERDES_V8_TX_LANE_MODE_3			0x08c
+#define QSERDES_V8_TX_LANE_MODE_4			0x090
+#define QSERDES_V8_TX_LANE_MODE_5			0x094
+#define QSERDES_V8_TX_RCV_DETECT_LVL_2			0x0a4
+#define QSERDES_V8_TX_PI_QEC_CTRL			0x0e4
+
+#define QSERDES_V8_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V8_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V8_RX_UCDR_SVS_FO_GAIN			0x020
+#define QSERDES_V8_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V8_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V8_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V8_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V8_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V8_RX_UCDR_SB2_THRESH1			0x04c
+#define QSERDES_V8_RX_UCDR_SB2_THRESH2			0x050
+#define QSERDES_V8_RX_UCDR_SB2_GAIN1			0x054
+#define QSERDES_V8_RX_UCDR_SB2_GAIN2			0x058
+#define QSERDES_V8_RX_AUX_DATA_TCOARSE_TFINE		0x060
+#define QSERDES_V8_RX_VGA_CAL_CNTRL1			0x0d4
+#define QSERDES_V8_RX_VGA_CAL_CNTRL2			0x0d8
+#define QSERDES_V8_RX_GM_CAL				0x0dc
+#define QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
+#define QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
+#define QSERDES_V8_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
+#define QSERDES_V8_RX_RX_IDAC_TSETTLE_LOW		0x0f8
+#define QSERDES_V8_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
+#define QSERDES_V8_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
+#define QSERDES_V8_RX_SIGDET_ENABLES			0x118
+#define QSERDES_V8_RX_SIGDET_CNTRL			0x11c
+#define QSERDES_V8_RX_SIGDET_DEGLITCH_CNTRL		0x124
+#define QSERDES_V8_RX_RX_MODE_00_LOW			0x15c
+#define QSERDES_V8_RX_RX_MODE_00_HIGH			0x160
+#define QSERDES_V8_RX_RX_MODE_00_HIGH2			0x164
+#define QSERDES_V8_RX_RX_MODE_00_HIGH3			0x168
+#define QSERDES_V8_RX_RX_MODE_00_HIGH4			0x16c
+#define QSERDES_V8_RX_RX_MODE_01_LOW			0x170
+#define QSERDES_V8_RX_RX_MODE_01_HIGH			0x174
+#define QSERDES_V8_RX_RX_MODE_01_HIGH2			0x178
+#define QSERDES_V8_RX_RX_MODE_01_HIGH3			0x17c
+#define QSERDES_V8_RX_RX_MODE_01_HIGH4			0x180
+#define QSERDES_V8_RX_DFE_EN_TIMER			0x1a0
+#define QSERDES_V8_RX_DFE_CTLE_POST_CAL_OFFSET		0x1a4
+#define QSERDES_V8_RX_DCC_CTRL1				0x1a8
+#define QSERDES_V8_RX_VTH_CODE				0x1b0
+#define QSERDES_V8_RX_SIGDET_CAL_CTRL1			0x1e4
+#define QSERDES_V8_RX_SIGDET_CAL_TRIM			0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index d0f41e4aaa855fc3ee088afc833b214277b7e2b0..8148853ff275b0526cb47a158d332af1d74e0abf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -30,6 +30,9 @@
 #include "phy-qcom-qmp-qserdes-com-v7.h"
 #include "phy-qcom-qmp-qserdes-txrx-v7.h"
 
+#include "phy-qcom-qmp-qserdes-com-v8.h"
+#include "phy-qcom-qmp-qserdes-txrx-v8.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -52,6 +55,8 @@
 
 #include "phy-qcom-qmp-pcs-v7.h"
 
+#include "phy-qcom-qmp-pcs-v8.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.48.1


