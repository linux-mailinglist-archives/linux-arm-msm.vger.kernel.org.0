Return-Path: <linux-arm-msm+bounces-66000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9CB0D2D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCCCC3ADA6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8422D6619;
	Tue, 22 Jul 2025 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzj58o4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9672D5A0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168996; cv=none; b=BSyZc9TXAgyYH0tHvVcoOlh1zFWvOqr8hJKf3yJFdH1LNbNYS0RyJ4BHVW59vJhYAQoLXWh1IH+YYZ5BseKMIpO1nYUPaslGQxrBbsa5sN0DUDRSo30g33TGrlfnSQPSB9nk93CEaJObPayYuH40qXWqpJNjHy0vqyDEoOhRtAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168996; c=relaxed/simple;
	bh=qNbe8OPGDdUMep/3XWLUqrKYp08jEHqdWv1AWzkSpPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t07AH/sHYqBtMgov46AuDqNIinh4cA90stvRypbwUny2y74C8j4LP/XRzAi4c3zi2czxiOeSigXfw5m7vq5h0Jp6b/uhg2vzlbKYvnT6JqBRnMzGjHeQx8vGxDnU1kHbCPUycFDh86yrd55lZDx9zhZTK/D7ZIr1MD0/ZZwtpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzj58o4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4ahrS000902
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2G0T0WOtKiIKh+NEO4I9svxY1jp+Mn9eSha/YD/ULrM=; b=lzj58o4qSN3Bvcja
	5CK/7ha4r9D51wHIQcg9jocmNQgDkmnONq9rhYvhnRgynWdOhL9fHJGl5n+kTn75
	MW0vsI8S7giPC5ec75BrDP1ddGZmIvxllx3mwDhLBi0mLqBDFa1UGU7NcmcAIFNs
	JkeWpil+kw1Vc0FDdjeBozZ2wUuEYJ1HgW/1G79XlLRqJ5jSqwnJAvQrkRZlJFey
	xq71ZNtpb1RNRi2NeLWtyXGqh3GiH5STv1+M5LWBniacht5cf2X4MoBQqwG2b3jI
	q006IKzfb/KSJRw12aNHGuaajFi5NVmVEMOTh9gFOBaN147m6dg8s/i7h9AGIDUt
	pktAgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgcfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3130b8246c8so1569563a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168992; x=1753773792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G0T0WOtKiIKh+NEO4I9svxY1jp+Mn9eSha/YD/ULrM=;
        b=v8MU1JBV/MNns0NJDYqWbG1n3tZS57537oYxyX/o7rH1X3qDiJLNkz0J61xDzPzy3i
         X1TqsvVC4yaIXbAhVmAXWpyBSW+ufiFGOp27bTPasjZRJIHumSroJ1AN50NQqaYJtsHg
         bW82YQhEEP5qOnO/bVE4upd4IpSNcL+6ac9YzCk0iA7hujohyaJ7QVn5pjoTq1nQajYQ
         Ju5JVmTdr09/5CxIfjEcF4BRqXk8NMcOlaitkxmSLSbawqB3oWKSVO0s+G08iTt0dZNF
         7LdEzdjTmsj72c9DcHjKBuP9nHaH3tHxF7+7Yxedy3+sGgtH9Os81celYGlHnyWJXIoJ
         7OAA==
X-Gm-Message-State: AOJu0YyIXBnPta07ec6vKLk9cL4ekFBCBN8aGX7H/9kHfnWBWZtK5cf/
	QIngL91a+7B2QFSsG9M0voKsMtU8/I+5RXkDRe5fVl2yuMEiRnaay2x7rDw9C9EgQz3d6XJNTRO
	P2TxIGz9TwSbtQwRUEVCYvEoIOQaVPsr+CJBVhC8An0zUT9yRKLiO4ySxwy4wqIk1ofRS
X-Gm-Gg: ASbGnctplolC5nctP5NdeD4PRWR4rFBEtNW3oeoWNOay77Ovua+6YJDzLZkIxvZ851c
	atAttHCEs4ZNmo5q83AZCCasHyuaROM+M6Ytd9jsl3ZlPwi4SFURBoWDcNGftKtjrXyvAYYfWxZ
	nR2aQ9VzIw6LB1zmFrH2JOy8pXPET50tmqPz9J9iQttHlNMWQCmWJ4SvksNW2+PzmWKtFzVKPdh
	RFQoOZHIJjE9CiAi7TE88JzJ9p0StlnET3j7dbJgY95Fv1EF/xxHPipCXnYlAO8U4gS80CLZScs
	bxm9g+eRlMM6AYwUAFGt0jHR5ewPhrArhZ4lb7ZIWcB1d9rpL/RLCIgSOHPL9QyMVbbsyl09eIc
	QsAAZwpFGXxTiOCnlvsqYcUjpFhC9xYHQ7zBUDcVRyEATUMHt8sckt606
X-Received: by 2002:a17:90b:520a:b0:312:25dd:1c8b with SMTP id 98e67ed59e1d1-31c9e6ec82dmr13017099a91.2.1753168992098;
        Tue, 22 Jul 2025 00:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoj4lcyXjswUxdZF8/u2FWJg6raQtP1rmh1s3qmXvAnSh709kLnNrV1BVHUQMrwWxUCjwP+A==
X-Received: by 2002:a17:90b:520a:b0:312:25dd:1c8b with SMTP id 98e67ed59e1d1-31c9e6ec82dmr13017083a91.2.1753168991511;
        Tue, 22 Jul 2025 00:23:11 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:23:11 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:08 +0800
Subject: [PATCH v2 07/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-7-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=8758;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=qNbe8OPGDdUMep/3XWLUqrKYp08jEHqdWv1AWzkSpPk=;
 b=mAlLNDIHo3v5PwuFwQE2/GRlhiiojVXyQZfsqkeI6HBKPdhdxnMxMIzZ3+JUuNGv3PXoDhjGY
 VF+cFQcDTtGCEBmuYvuqsYjDSCI83TjF/Hc8HP27QQGsVMlbY4lAF+A
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f3c61 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LsK-adbuWOzvq-IKUcoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: eqg12g2lU4QkMRVedipoQii-iVh0623M
X-Proofpoint-ORIG-GUID: eqg12g2lU4QkMRVedipoQii-iVh0623M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXzI9TiBKVKmWn
 vEhUqd1UoBJfUvunpvnVtmPpUVmjS1OhR9hfSZyaqCgr3RrkbHSrAXOlBnDEJWHMWwWC5hJzChC
 8EsqZBTg0zrivyp1s5/aLYuRbgEme+ZQIcXP0YaNaYwScDAsoPILzlbHdye1KP1bCb3OWFIVHu6
 Zica5t1oIBijtMSQQSzv8UYU2MGXzyt/mFNupb2ovnWmPKVNHVbq2cf9QuAVCPpY0oxM4aCO8tl
 p9U2DWWAkn37Uk5x3f3lOVmu7uB1q28S7eoQMDD1Ete2Hc1rgpYUs6lB9sYBZsZnKxGSV+890ac
 eL/Xw2lz6WIudUhhyuIxIRT7pNfCoL3isEmPzWK5R0LonoCRa3aLePD9ugTrp9KRq6ueLSsMn1F
 SecFHk5KexWPAjOHdQJQ2nYyNjNwtOzoZP2i1/vLAuV2HA/OW45jz0RaCMly2JeorTE+KeSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059

Introduce QCS615 hardware-specific configuration for DP PHY mode,
including register offsets, initialization tables, voltage swing
and pre-emphasis settings, and regulator definitions.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 148 +++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index bc0eaa7dba9cb84b54c7c5a264aac613f888cb99..aefcc520ee0bb3dd116e58222e5e035d1d750714 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -28,6 +28,9 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-dp-phy-v3.h"
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
@@ -286,6 +289,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x02),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc6),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
+};
+
 enum qmp_phy_usbc_type {
 	QMP_PHY_USBC_USB,
 	QMP_PHY_USBC_DP,
@@ -469,11 +552,20 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const dpphy_reset_l[] = {
+	"phy",
+};
+
 /* list of regulators */
 static const char * const qmp_phy_usb_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static struct qmp_regulator_data qmp_phy_dp_vreg_l[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+};
+
 static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290 = {
 	.serdes		= 0x0,
 	.pcs		= 0xc00,
@@ -484,6 +576,27 @@ static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290 = {
 	.rx2		= 0x800,
 };
 
+static const struct qmp_usbc_dp_offsets qmp_usbc_dp_offsets_qcs615 = {
+	.dp_serdes	= 0x0c00,
+	.dp_txa		= 0x0400,
+	.dp_txb		= 0x0800,
+	.dp_phy		= 0x0000,
+};
+
+static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] = {
+	{0x00, 0x0b, 0x12, 0xff},
+	{0x00, 0x0a, 0x12, 0xff},
+	{0x00, 0x0c, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
+static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] = {
+	{0x07, 0x0f, 0x14, 0xff},
+	{0x11, 0x1d, 0x1f, 0xff},
+	{0x18, 0x1f, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
 static const struct qmp_phy_usb_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_usb_offsets_v3_qcm2290,
 
@@ -532,6 +645,28 @@ static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static const struct qmp_phy_dp_cfg qcs615_dpphy_cfg = {
+	.offsets		= &qmp_usbc_dp_offsets_qcs615,
+
+	.dp_serdes_tbl		= qcs615_qmp_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_qmp_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_qmp_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_qmp_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_qmp_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_qmp_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+
+	.vreg_list		= qmp_phy_dp_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_dp_vreg_l),
+};
+
 static const struct qmp_phy_cfg msm8998_phy_usb3_cfg = {
 	.type = QMP_PHY_USBC_USB,
 	.cfg = &msm8998_usb3phy_cfg,
@@ -565,6 +700,10 @@ static int qmp_usbc_generic_init(struct phy *phy)
 
 		num_vregs = cfg->num_vregs;
 		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	} else {
+		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
 	}
 
 	ret = regulator_bulk_enable(num_vregs, qmp->vregs);
@@ -599,6 +738,9 @@ static int qmp_usbc_generic_init(struct phy *phy)
 
 		qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
 		writel(val, layout->pcs_misc);
+	} else {
+		if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+			regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 1);
 	}
 
 	return 0;
@@ -624,6 +766,12 @@ static int qmp_usbc_generic_exit(struct phy *phy)
 		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 
 		num_vregs = cfg->num_vregs;
+	} else {
+		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
+		if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+			regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);
 	}
 	regulator_bulk_disable(num_vregs, qmp->vregs);
 

-- 
2.34.1


