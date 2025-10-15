Return-Path: <linux-arm-msm+bounces-77360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4EFBDE009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FFD3AFFA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1B4320CAC;
	Wed, 15 Oct 2025 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/dQEzAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40C31E0FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524079; cv=none; b=WZ8YV9EYjMnPVdgdN8Y+N0O56blBAKmvPo5UuiK5b6ChYpQI1UfgiEOevABD3Dnx2WiveGn//ofKUTcWk4KYNmlfdnv3XelFWxPXYiust5zBCQWhTwgXRbSZmW2CXyqhRMLEgWr0vUpOOTwqkpvPj2BtWgMuWW+Pzc324/s/uHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524079; c=relaxed/simple;
	bh=HMFF1M7phmpCK7VuGZ58TK+uqqRS30P/iFvqeTQ1RsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOEgsRaVE7P90jDUFTBO+6zyTwqGqVrChhQKtsL0mmOLmwtJJguy2aa3kCTl4yS1KqbiG9CDHCaX17HT63SDpASkvkNZKUHLFhAaTIiwFjLhjVvb4o1VLRb3OHFq7S8fN5+qwn+Gq9FVYRRBieLuoqj9fofwImpQMSUnhniDrUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/dQEzAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sSMR004236
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6IliQChOlmblwVDFbtSfuQYWXFl9im/RWm0ERKAi38=; b=R/dQEzAt4Xqdeoq8
	xw38DDauh4kCVTWSYD/oLKwUHDQScWBjtn98i6o6nKW0gZHowTn+Y1S4yDR91BIO
	3SiDS0wXU2ftqs0RhDHLg0kcJYk1mFIw8NywButXZn2/da+b3w13bbyLlOJhnW3v
	6dyfzFROwgCmHYx6bNzCmxsJWPSso2D+vxm0tAGcaUpMvVAVsMldtFtyWL8BVb43
	DiuWJKMT+xtL0Xa8wHja/ffwpQiKjQ/b4cey1ZgAsP0eVCscpFftxUrTvH0hQGoF
	lPk0MlAUTC9fhX5RTprK3ipWu1PQjYjVBrIJH/YuqE/wOKqztqJ9OXz0LRJ0SbQZ
	UINGLw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwpbm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7811a602576so13590086b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524074; x=1761128874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6IliQChOlmblwVDFbtSfuQYWXFl9im/RWm0ERKAi38=;
        b=NQ6wIUADHLHaylqhY6+qGVg+iTvarIGfBi0g0wAw89aWbSapM0lv63E7Xbt0Fe9bBu
         4WE7zPvIwflSDCkZ0f8gGwdtt/T4/R28tv/oCpjiwRgCmfwrVKZ44P84PiLf5DCzH7p8
         oe/ZciXfiHuwXlMRRq2HWOQc41QUG7WvgHG0KUjDJXbppgys6Sg+x4upl3RfR1O2DXta
         /97RV288dIdVe7D5iAT3b1GmGUxa8mo6TjzEohvW+HKkeNlE6aoKXQ2srns0A2LqX026
         /fCtJhY7jjq0RbRpSCvXlYuBx73ZWAQRJ03iChdCD2mX5f+pSGkad+8vrbx/VYhTsvlR
         wSCg==
X-Gm-Message-State: AOJu0Yy12QWHtetOnJAO3D4UBNAVGmhPn0LG+Zz9O1bO04gryUC+tJOr
	i7KeGmj1ZTnpRbEctz5Si/0UxzAl5SzKRfsQdgcPivTKuowLr7dQJ53LaLYHu6R6OVVotfQYkpC
	TufrRDN+lVYi3c2jujJWANHjSpAKIwhKeJRhRhpTj7xSDGrurMg7UhiD5Bspz0Y15hnkV
X-Gm-Gg: ASbGnctKVVIgepV9IBH3DUjTGi5+I3wzGUkm/F7T1/1cG654TNweDPT6aklQQ+K34pz
	bR59UPoXjbVIIPNxVFwHRlXJI92o49EDkAmcq71qo0CNXCO0ndN+fr/Q2bNsupc1cVLakYfcJY+
	Z1Budz88jz+dpq7yOjNiEI6F5MPcLqwHE5VPOfyiBzk84Ik9nIZhRoZKGSR8EXGE1dIOOyKxUDL
	Ir2xMp5mUBsDk40UQuyfOgCjnY8A1nuNQAp45RcDuf6NL+vrtdUoDpTiWVAY60O8PAyOFAHeJQe
	krx0ZoTT2yDn7IDUWpuWC7Up7w7M1DCxLLyvLiQvOfLay8fa3TEgnJoePLv0Rsg/gECpkZAGqZx
	AsYrg6UFhURQ=
X-Received: by 2002:a05:6a20:3ca7:b0:2c6:2c4c:fb17 with SMTP id adf61e73a8af0-32da84ede62mr37207140637.57.1760524074320;
        Wed, 15 Oct 2025 03:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4JCelp+011Ip98BEbGt8jqpaLETJWAuyVdsHyqRspz2NSnlH10BJ6AW2W0/1jtOKXv9JPYw==
X-Received: by 2002:a05:6a20:3ca7:b0:2c6:2c4c:fb17 with SMTP id adf61e73a8af0-32da84ede62mr37207098637.57.1760524073799;
        Wed, 15 Oct 2025 03:27:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787a1a7sm1993574a91.18.2025.10.15.03.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:27:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 03:27:36 -0700
Subject: [PATCH v2 6/6] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-kaanapali-pcie-upstream-v2-6-84fa7ea638a1@oss.qualcomm.com>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760524063; l=12299;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HMFF1M7phmpCK7VuGZ58TK+uqqRS30P/iFvqeTQ1RsE=;
 b=vlf6QZjtydmLu+RAQC0xFXSWoy1R2KuQkyx8CHX33Wv73YgBiJytqDSuX0yIBITCcM88kPDXK
 4iNAwm6Zx2JCsYAikpHwQzUI0A8v8V3sPctDQgdX+rTG6hDytbLIUgw
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX5yZJOqEV8bi6
 oW8x/OERgatb3uRmZ2OPjszrfkiG/yz0Arv7FIGSrqHSRhRRglsexcXFFwMVPC3AYkH9Iezh8My
 eWNnqZeKLzRb9Opft8S9Rjvo4ze1elO2n9YiAfmo/awa6NXL10xxglfCLHWC5V6NberJ+coQUWp
 WPqyE3nCas1ZpnBBz0XSCOss57wcY/FtYfiQvf2oTLw1l4y7Iy/o4o/Bzmadw/UH/8Qd5TPauWX
 lMEH5dcWVKZl7RJzAn+clTVU7hVbIRqfLy5JdeROIMMM6xWdK6S9MxHd7GKnkdKzRNEN0JWv28j
 ueEpryYIu6eLuACdyx+pR3cfEsWF/uPWou68q9cX2h0TYMwpH5d31nH9AGwI6ZKvbIbGRcSV9GL
 fsAL8SDvW5t85JQ8mAPahyYbjREPBA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef772b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0FVVrbj2krFBHOIXHEsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: UnnzD0KIcA_zGI-Ov-9S9kvbOkKNVrBj
X-Proofpoint-ORIG-GUID: UnnzD0KIcA_zGI-Ov-9S9kvbOkKNVrBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

Add QMP PCIe PHY support for the Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 62b1c845b6275d924fa501ac64e69db5f58844aa..6218824b4b81afd97f6497a089204a49f6336a49 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -37,6 +37,9 @@
 #include "phy-qcom-qmp-pcs-pcie-v6_30.h"
 #include "phy-qcom-qmp-pcs-v6_30.h"
 #include "phy-qcom-qmp-pcie-qhp.h"
+#include "phy-qcom-qmp-qserdes-com-v8.h"
+#include "phy-qcom-qmp-pcs-pcie-v8.h"
+#include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
@@ -100,6 +103,13 @@ static const unsigned int pciephy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v8_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]                 = QPHY_V8_PCS_SW_RESET,
+	[QPHY_START_CTRL]               = QPHY_V8_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]               = QPHY_V8_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V8_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3061,6 +3071,149 @@ static const struct qmp_phy_init_tbl sar2130p_qmp_gen3x2_pcie_ep_pcs_misc_tbl[]
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
 };
 
+static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x01),
+
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_EN, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CORE_CLK_EN, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_MISC_1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_MODE, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_DC_LEVEL_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_SPARE_FOR_ECO, 0x02),
+};
+
+static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_TX, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_RX, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_LANE_MODE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_LANE_MODE_2, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_LANE_MODE_3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_TRAN_DRVR_EMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_TX_BAND0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_TX_BAND1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_SEL_10B_8B, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_SEL_20B_10B, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_PARRATE_REC_DETECT_IDLE_EN, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH2, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE3, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE4, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_TX_PHPRE_CTRL, 0x20),
+};
+
+static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_FO_GAIN_RATE4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE4, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_PI_CONTROLS, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_VGA_CAL_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_VGA_CAL_MAN_VAL, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_EQU_ADAPTOR_CNTRL4, 0x2d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_SIGDET_LVL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RXCLK_DIV2_CTRL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_BAND_CTRL0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_SVS_MODE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_PI_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_PI_CTRL2, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_SB2_THRESH2_RATE3, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN1_RATE3, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN2_RATE3, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B0, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B1, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B7, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B0, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B1, 0x63),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B2, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B4, 0x67),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B0, 0xa4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B1, 0xa4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B2, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B3, 0x9f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B4, 0x48),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B5, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE4, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_MSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE23, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE4, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE4, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_PCIE_RX_GM_CAL, 0x0d),
+};
+
+static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G3S2_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_RX_SIGDET_LVL, 0xcc),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_ELECIDLE_DLY_SEL, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG1, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_PCS_TX_RX_CONFIG2, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_EQ_CONFIG4, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_EQ_CONFIG5, 0x22),
+};
+
+static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_TX_RX_CONFIG, 0xc0),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_EQ_CONFIG1, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G4_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G4_EQ_CONFIG5, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G4_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG3, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_RX_MARGINING_CONFIG5, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G3_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_G4_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG6, 0x1f),
+};
+
 struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -3356,6 +3509,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1400,
+	.pcs_misc	= 0x1800,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4412,6 +4575,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
 	.phy_status             = PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v8_0,
+
+	.tbls = {
+		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
+		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
+		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
+		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v8_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5177,6 +5368,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
 		.data = &ipq9574_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
+		.data = &qmp_v8_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-pcie-phy",
 		.data = &msm8998_pciephy_cfg,

-- 
2.34.1


