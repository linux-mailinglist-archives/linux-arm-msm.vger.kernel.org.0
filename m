Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81187C5180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbjJKLTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346223AbjJKLTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:19:13 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EDE8F;
        Wed, 11 Oct 2023 04:19:11 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B7eN1T007541;
        Wed, 11 Oct 2023 11:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=Phnvs6QEKkgNQ5LA1nlWTwso20SPC3+GMVBI7QWqKPs=;
 b=VeumFlyP5fNc6b0MxJ9ztzcp+wTzIvzluJtHfrJryaw6znFEApH6RhxVims/1V1sQ05s
 CaJPU25fRMf6oW/cLZH0K0qxQvORqBv4+DvGLIdpTr7Osoe/WZca0PUDYxwzPa/+7QX8
 URKeK8ey579Bvd8qdzQfSdUhFQyGNI7aqYYBrZ+uYVU0SQgHGPrV6kJn7d9HMIEatiGX
 XxtYhttktxd0srmiWXHKO13hKV0hfFjoxU0tVFoE/9+H9QSX6sTf5t+y3q4L/DKxP0Jb
 kJm0DaRQHKyv1cA7Svv93g4AYJOwEo2r3n8Rro9aNM1jQFqlhFBEOwmRymO8G31lR/Nf LA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnqh1gfxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 11:18:45 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39BBIgSK011225;
        Wed, 11 Oct 2023 11:18:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3tk0dkmaxb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 11 Oct 2023 11:18:42 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39BBIg0L011218;
        Wed, 11 Oct 2023 11:18:42 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-msarkar-hyd.qualcomm.com [10.213.111.194])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 39BBIfuM011217;
        Wed, 11 Oct 2023 11:18:42 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3891782)
        id DCF0B43B8; Wed, 11 Oct 2023 16:48:40 +0530 (+0530)
From:   Mrinmay Sarkar <quic_msarkar@quicinc.com>
To:     agross@kernel.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, mani@kernel.org
Cc:     quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        dmitry.baryshkov@linaro.org, robh@kernel.org,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        quic_parass@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-phy@lists.infradead.org
Subject: [PATCH v2 2/4] phy: qcom-qmp-pcie: add endpoint support for sa8775p
Date:   Wed, 11 Oct 2023 16:48:27 +0530
Message-Id: <1697023109-23671-3-git-send-email-quic_msarkar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697023109-23671-1-git-send-email-quic_msarkar@quicinc.com>
References: <1697023109-23671-1-git-send-email-quic_msarkar@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K4ChyZQm2kzr8VT-1bgp-3wYfYRYfDk5
X-Proofpoint-ORIG-GUID: K4ChyZQm2kzr8VT-1bgp-3wYfYRYfDk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_09,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=984
 mlxscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110099
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for dual lane end point mode PHY found on sa8755p platform.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 41 ++++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index a63ca74..962b4a1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2147,6 +2147,38 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl[]
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_SELECT, 0x34),
 };
 
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BG_TIMER, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN0_MODE0, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN1_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN0_MODE1, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN1_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x28),
+};
+
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_INSIG_MX_CTRL7, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_INSIG_SW_CTRL7, 0x00),
+};
+
 struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -3043,6 +3075,15 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl),
+		.pcs		= sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl),
+	},
+
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
index 36cc80b..6ee1c33 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
@@ -11,6 +11,8 @@
 #define QPHY_V5_PCS_PCS_STATUS1				0x014
 #define QPHY_V5_PCS_POWER_DOWN_CONTROL			0x040
 #define QPHY_V5_PCS_START_CONTROL			0x044
+#define QPHY_V5_PCS_INSIG_SW_CTRL7			0x060
+#define QPHY_V5_PCS_INSIG_MX_CTRL7			0x07c
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG1			0x0c4
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG2			0x0c8
 #define QPHY_V5_PCS_LOCK_DETECT_CONFIG3			0x0cc
-- 
2.7.4

