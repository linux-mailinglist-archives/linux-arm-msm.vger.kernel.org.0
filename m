Return-Path: <linux-arm-msm+bounces-78775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FEC087AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D793B851E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3896F220F37;
	Sat, 25 Oct 2025 00:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjsThEkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FB21ABDD
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353291; cv=none; b=XfjZxe2JwxdjDzyOZVCk8MUGh4wUy/QqFjhNou130klpsX6sI5Q95PXU8YLt9n0cvmuvfp0oOHcYtgVR5q4gfP1TvKmWw0dVa+t/Rb1y93qLLS95BQDpB8NC1wkLHxbAqx0C7gy4gIkXQMS0mc0Y8xCxi725dW5fIKmhESPYgIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353291; c=relaxed/simple;
	bh=Wvz5FcQWKO9LPuh+2MAzkxwUM0tYdoxQ+ILXK50+JJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8MiJ7gd1Sx1Bk4AkjTtighu7lAcTuYkpjbR00Me34iWCWRtb0iIL8yLICFVSLSqM9YLerZtwiTSWkfb5UAUtULs3RMsSk7rpjCNMfCvA6eYmIZUUTYBkfuqi3WppXa2EUEApvdtY7h4HWsLwhMW/p5MOHDeyCT0gVp7WMCje4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjsThEkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P0lq1c006725
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w54MP6DWU2D29M3PSjuDo2rHQWTbHhKIJuDpTNCMzws=; b=jjsThEkwnwcqrnsf
	fH1aMlvnWW+W2TMc9k5bkS90QI0HbUIxDeWuafKaI/X1T6Xkm6yxOLKXycACVyRK
	s0PI4C8ZAs9Sy/ZF/kSVsrdef3uCH+Okydu9nmVRbVnxaRD2vuoifkCeCg7WMOE3
	YJ9t83d0YKcyFNrPHLIYKL+4Vtc/bRLO4Ym9c07hEyhVwS3DuF+sHFBdrIAEnfT7
	8nlMEp2ewzALhYVnCkpKhEQyWjgfvIZo0Sqwas5LcagqYJ6sz8F3q/Uuq0jiyuTT
	BYmT8jGkHXwuvcYKM5mssGZr6mrZUajFaYCode9/BwehguUVarzLkKsfwNbs/6rn
	peZniQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0kwn015v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bba464b08so2461022a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353284; x=1761958084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w54MP6DWU2D29M3PSjuDo2rHQWTbHhKIJuDpTNCMzws=;
        b=CdWFE6R5/l0Djk6o43nLGZAGJt1h+rICeecGq/G26nzEL38kDrJAbUSu//ph+za+4E
         pzC8pti4WJNj3S40JwOgG7WXJ2xHzhnyYK/s9T2F3LwEtTH9UP5li3XDsOIJ6Ntc6j/p
         m3lC3BTxXl/8Ni2BQXs7Dq0SHYf6hIOG0hn0xtRgWtEChJC+Or553MovmtZaHk/UYa1J
         o4fqYbl8/vygfcng2fsX2fomfL9BgAhg+EUi+Kkh6LXX+SLPzxnoAJlaY3xV+njBrGiy
         OUrSNRwWfoMTII+Q+vFllFanh8X7RlgDlOOG097plmAYmA15NI04ScRfetAn8gcMUsTH
         zNaQ==
X-Gm-Message-State: AOJu0Yw0L4JRV0FQPkf1nzBS7cFPlE59Cg2W2p30zg4FRq9jjnmFvQQh
	OBLqVXkRa+lcenm45SGpxJVLgarxXCuY9qx5auvaRWo/Lt9vwFDcLmCijTSYVmmmZ8WitvH3yp/
	RVTjWzz82rOhvEX35m89lS8x0tzkjHa8dow+5SIYBBML6Tk9/8oeJTnlPp/Ihjzfwh2U3
X-Gm-Gg: ASbGnctg4UENEa0f5K/zzURItPvjKIoCdFKSEuSUJKbcHAq94p1gKg85SL8VkSahwOi
	MATTwigOHpD2+Pygq2sxLtYDDEbORddG8eh7lZSi5ojW66zHh77YVqmcvA0w70pToj9jYLs9O3O
	DA9TT4SrB8tsezsDolIgequ23fuGohpIRsi+J158+4oLf3GfvU3Yz4yRgMiVmUod97Tioweo3Oh
	KbFfJyQaMgk/3rEz2XEDFmewdmg5ZWCufZpCccUMi95a9PdJBoGLWUD4zA+um4oHDuC/xhwFNF8
	dD+CMK43YIBaReW9Nf7p+W/Ry9H4mF5KA60XeGaUpamyzMYnlp4HgzaLVGeCPBATBku3aWdyCO5
	7VfUdxSryJgZNDsyGD1+BLh381JSOHUieojsggOIT2jGcDXS+Uiw=
X-Received: by 2002:a17:90b:5111:b0:33b:c5ce:3cb0 with SMTP id 98e67ed59e1d1-33bcf8e4560mr41039681a91.20.1761353283027;
        Fri, 24 Oct 2025 17:48:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGF47Gr3fo7bLLUfPl6vLVJ8f4+2rBe2suDFpfdnjUwfWYzQux5joKSrdlExQjiQ1mIUyspg==
X-Received: by 2002:a17:90b:5111:b0:33b:c5ce:3cb0 with SMTP id 98e67ed59e1d1-33bcf8e4560mr41039631a91.20.1761353282093;
        Fri, 24 Oct 2025 17:48:02 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:48:01 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:47:44 -0700
Subject: [PATCH v6 6/8] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-glymur_usb-v6-6-471fa39ff857@oss.qualcomm.com>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
In-Reply-To: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=MJ1tWcZl c=1 sm=1 tr=0 ts=68fc1e45 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nE-6qLORNptjhdMLsvQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: n6zy8CcXx6TLGyYOfF7Q93NZcc5Q6exc
X-Proofpoint-ORIG-GUID: n6zy8CcXx6TLGyYOfF7Q93NZcc5Q6exc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX0lKu9WHa2q/r
 IGECtezpvob3a+uAoeZ+KR/fqvH4rYbMHV3EgHas8hApo3FE01wBoVtlhgI3qr7uDz2Ie9m8kBd
 RLMpmlGvrOBnC97cvuzURTgRBSEOhcwLE5Iz+5rfIMuGpqQc+VMWjI6DJJMzY1ssJmDNt8UrDXT
 kLRoR4EgPPWHSW80IdVqP9jrUHY6R2KbFK7O6D3OBVbW4lYP93DcSlDVbCmv6ZZAlNw8rkGpBUq
 znyXktjbk6Qj5KVdhnR+CV9jNm/WfI7Ie9kmYc77hDPyUXOIJxrTSuzL4D/K2+6rmHhxS8E73E7
 lEwbZH1/BTMjNsRxD9mSh1s7yl7aYbYJMYeyqXLF6AmtkKEQNEPzld3zPrFl1MKmpFly4OzAOYL
 s2uRuI1BdAh1rkYfYiYKCC2ifejNPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510250001

For SuperSpeed USB to work properly, there is a set of HW settings that
need to be programmed into the USB blocks within the QMP PHY.  Ensure that
these settings follow the latest settings mentioned in the HW programming
guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
new ways to define certain registers, such as the replacement of TXA/RXA
and TXB/RXB register sets.  This was replaced with the LALB register set.

There are also some PHY init updates to modify the PCS MISC register space.
Without these, the QMP PHY PLL locking fails.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 288 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
 .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
 7 files changed, 1215 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1caa1fb6a8c7..d1534ed7200b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -30,9 +30,11 @@
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-aon-v6.h"
+#include "phy-qcom-qmp-pcs-aon-v8.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-misc-v5.h"
+#include "phy-qcom-qmp-pcs-misc-v8.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
@@ -46,6 +48,8 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 
+#include "phy-qcom-qmp-usb43-pcs-v8.h"
+
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
 #define SW_DPPHY_RESET				BIT(0)
@@ -97,6 +101,7 @@ enum qphy_reg_layout {
 	QPHY_TX_HIGHZ_DRVR_EN,
 	QPHY_TX_TRANSCEIVER_BIAS_EN,
 
+	QPHY_AON_TOGGLE_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -259,6 +264,236 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
 };
 
+static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V6_N4_PCS_SW_RESET,
+	[QPHY_START_CTRL]			= QPHY_V6_N4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]			= QPHY_V6_N4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_N4_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]	= QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE,
+
+	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V6_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]		= QSERDES_V6_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_N4_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_N4_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]		= QSERDES_V6_N4_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_N4_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_N4_TX_TRANSCEIVER_BIAS_EN,
+};
+
+static const struct qmp_phy_init_tbl glymur_usb43dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE1, 0xe1),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE1, 0x4d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x95),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0xe1),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0x4d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_EN_CENTER, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x76),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_SPARE_FOR_ECO, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_3, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PSM_CAL_EN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xaf),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl glymur_usb43dp_lalb_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x81),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL3, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL4, 0x8D),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_4, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_VREF_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_VREF_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B0, 0xa4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B1, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B2, 0x6e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B3, 0x51),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B5, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B6, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE_0_1_B7, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B0, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B1, 0xc4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B2, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B3, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B5, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B6, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_MODE_RATE2_B7, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE1, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE1, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE2, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE2, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_INIT_RATE_0_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_INIT_RATE_2_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE2, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE1, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE2, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CODE_OVRD_RATE_2_3, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_SUMMER_CAL_SPD_MODE_RATE_0123, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CTRL2, 0x85),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_CAL_CTRL3, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CNTRL, 0xa3),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_LVL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_SIGDET_CAL_TRIM, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE2, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE_01, 0x76),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE_23, 0x67),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE_0_1, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE_2_3, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE_0_1, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE_2_3, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE_0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE_2_3, 0x51),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_FLL_DIV_RATIO_RATE_0123, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CAP_CODE_RATE_0123, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_TYPE_CONFIG, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_EN_LOWFREQ, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_LOOP_FUNC_CTRL, 0xd0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_GM_CAL_EN, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_GM_CAL_RES_RATE0_1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_GM_CAL_RES_RATE2_3, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_AUX_CLK_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_EOM_CTRL1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL3, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CTLE_POST_CAL_OFFSET_RATE_0_1_2, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VGA_CAL_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE0_1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE2_3, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP1_DAC_ENABLE, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP2_DAC_ENABLE, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP345_DAC_ENABLE, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DFE_TAP67_DAC_ENABLE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_MAN_INDEX, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_IQTUNE_DIV2_CTRL_RATE0123, 0x1C),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CDR_VCO_CAP_CODE_OVRD_MUXES, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_DIG_BKUP_CTRL16, 0x37),
+};
+
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -1667,6 +1902,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
 	{ .name = "vdda-pll", .enable_load = 36000 },
 };
 
+static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+	{ .name = "refgen", .enable_load = 3270 },
+};
+
 static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
 	{ 0x00, 0x0c, 0x15, 0x1a },
 	{ 0x02, 0x0e, 0x16, 0xff },
@@ -1791,6 +2032,8 @@ struct qmp_phy_cfg {
 	int pcs_tbl_num;
 	const struct qmp_phy_init_tbl *pcs_usb_tbl;
 	int pcs_usb_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_misc_tbl;
+	int pcs_misc_tbl_num;
 
 	const struct qmp_phy_init_tbl *dp_serdes_tbl;
 	int dp_serdes_tbl_num;
@@ -1984,6 +2227,19 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
+	.com		= 0x0000,
+	.usb3_pcs_aon	= 0x0100,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1400,
+	.usb3_pcs	= 0x1600,
+	.usb3_pcs_usb	= 0x1900,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2400,
+	.txa		= 0x4000,
+	.txb		= 0x5000,
+};
+
 static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -2528,6 +2784,27 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 };
 
+static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_usb43dp_offsets_v8,
+
+	.serdes_tbl		= glymur_usb43dp_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
+	.tx_tbl			= glymur_usb43dp_lalb_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
+	.pcs_tbl		= glymur_usb43dp_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
+	.pcs_usb_tbl		= glymur_usb43dp_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
+	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
+	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
+
+	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_refgen,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3024,6 +3301,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
+	void __iomem *pcs_aon = qmp->pcs_aon;
 	int ret;
 	u32 val;
 
@@ -3059,6 +3337,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
+	/* override hardware control for reset of qmp phy */
+	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
+		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+
 	/* Use software based port select and switch on typec orientation */
 	val = SW_PORTSELECT_MUX;
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
@@ -3236,6 +3518,8 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	qmp_configure_lane(qmp->dev, rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
 	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, qmp->pcs_misc, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
+
 
 	if (pcs_usb)
 		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
@@ -4258,6 +4542,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qmp_combo_of_match_table[] = {
+	{
+		.compatible = "qcom,glymur-qmp-usb3-dp-phy",
+		.data = &glymur_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
new file mode 100644
index 000000000000..f6a275c0938f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_AON_V8_H_
+#define QCOM_PHY_QMP_PCS_AON_V8_H_
+
+/* Only for QMP V8 PHY - PCS_AON registers */
+#define QPHY_V8_PCS_AON_USB3_AON_CLAMP_ENABLE     0x00
+#define QPHY_V8_PCS_AON_USB4_AON_CLAMP_ENABLE     0x04
+#define QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE    0x08
+#define QPHY_V8_PCS_AON_USB4_AON_TOGGLE_ENABLE    0x0c
+#define QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE      0x10
+#define QPHY_V8_PCS_AON_DUMMY_STATUS              0x14
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
new file mode 100644
index 000000000000..a93ef2faa894
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_MISC_V8_H_
+#define QCOM_PHY_QMP_PCS_MISC_V8_H_
+
+/* Only for QMP V8 PHY - PCS_MISC registers */
+#define QPHY_V8_PCS_MISC_PCS_MISC_CONFIG1		0x08
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
new file mode 100644
index 000000000000..60ba730620f8
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
@@ -0,0 +1,639 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_V8_LALBH_
+#define QCOM_PHY_QMP_QSERDES_V8_LALBH_
+
+#define QSERDES_V8_LALB_BIST_MODE_LANENO	0x0
+#define QSERDES_V8_LALB_BIST_INVERT	0x4
+#define QSERDES_V8_LALB_PERL_LENGTH1	0x8
+#define QSERDES_V8_LALB_PERL_LENGTH2	0xc
+#define QSERDES_V8_LALB_BIST_PATTERN1	0x10
+#define QSERDES_V8_LALB_BIST_PATTERN2	0x14
+#define QSERDES_V8_LALB_BIST_PATTERN3	0x18
+#define QSERDES_V8_LALB_BIST_PATTERN4	0x1c
+#define QSERDES_V8_LALB_BIST_PATTERN5	0x20
+#define QSERDES_V8_LALB_BIST_PATTERN6	0x24
+#define QSERDES_V8_LALB_BIST_PATTERN7	0x28
+#define QSERDES_V8_LALB_BIST_PATTERN8	0x2c
+#define QSERDES_V8_LALB_PRBS_SEED1	0x30
+#define QSERDES_V8_LALB_PRBS_SEED2	0x34
+#define QSERDES_V8_LALB_PRBS_SEED3	0x38
+#define QSERDES_V8_LALB_PRBS_SEED4	0x3c
+#define QSERDES_V8_LALB_PRBS_SEED5	0x40
+#define QSERDES_V8_LALB_PRBS_SEED6	0x44
+#define QSERDES_V8_LALB_PRBS_SEED7	0x48
+#define QSERDES_V8_LALB_SW_RESET_PWRDNB	0x4c
+#define QSERDES_V8_LALB_RESET_GEN	0x50
+#define QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL	0x54
+#define QSERDES_V8_LALB_CDR_EN_RXEQ_RESET	0x58
+#define QSERDES_V8_LALB_CLKBUF_ENABLE	0x5c
+#define QSERDES_V8_LALB_TX0_EMP_POST1_LVL	0x60
+#define QSERDES_V8_LALB_TX1_EMP_POST1_LVL	0x64
+#define QSERDES_V8_LALB_TX0_IDLE_CTRL	0x68
+#define QSERDES_V8_LALB_TX1_IDLE_CTRL	0x6c
+#define QSERDES_V8_LALB_TX0_DRV_LVL	0x70
+#define QSERDES_V8_LALB_TX0_DRV_LVL_OFFSET	0x74
+#define QSERDES_V8_LALB_TX1_DRV_LVL	0x78
+#define QSERDES_V8_LALB_TX1_DRV_LVL_OFFSET	0x7c
+#define QSERDES_V8_LALB_TRAN_DRVR_EMP_EN	0x80
+#define QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL	0x84
+#define QSERDES_V8_LALB_TX0_PRE1_EMPH	0x88
+#define QSERDES_V8_LALB_TX1_PRE1_EMPH	0x8c
+#define QSERDES_V8_LALB_TX0_PRE2_EMPH	0x90
+#define QSERDES_V8_LALB_TX1_PRE2_EMPH	0x94
+#define QSERDES_V8_LALB_STALL_LDO_BOOST_EN	0x98
+#define QSERDES_V8_LALB_PRE_EMPH_EN_CTRL	0x9c
+#define QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL1	0xa0
+#define QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL2	0xa4
+#define QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL3	0xa8
+#define QSERDES_V8_LALB_PCIE5_TOP_LDO_CODE_CTRL4	0xac
+#define QSERDES_V8_LALB_TRANSMITTER_EN_CTRL	0xb0
+#define QSERDES_V8_LALB_HIGHZ_DRVR_EN	0xb4
+#define QSERDES_V8_LALB_TX_MISC_CTRL1	0xb8
+#define QSERDES_V8_LALB_LPB_EN_CTRL1	0xbc
+#define QSERDES_V8_LALB_LBP_EN_CTRL2	0xc0
+#define QSERDES_V8_LALB_TX0_SERDES_BYP_CTRL	0xc4
+#define QSERDES_V8_LALB_TX1_SERDES_BYP_CTRL	0xc8
+#define QSERDES_V8_LALB_LANE_MODE_1	0xcc
+#define QSERDES_V8_LALB_LANE_MODE_2	0xd0
+#define QSERDES_V8_LALB_LANE_MODE_3	0xd4
+#define QSERDES_V8_LALB_LANE_MODE_4	0xd8
+#define QSERDES_V8_LALB_ATB_SEL1	0xdc
+#define QSERDES_V8_LALB_ATB_SEL2	0xe0
+#define QSERDES_V8_LALB_TX0_RES_CODE_LANE	0xe4
+#define QSERDES_V8_LALB_TX0_RESTRIM_ICAL_OVRD	0xe8
+#define QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL	0xec
+#define QSERDES_V8_LALB_TX0_RESTRIM_INIT_CODE	0xf0
+#define QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET	0xf4
+#define QSERDES_V8_LALB_TX1_RES_CODE_LANE	0xf8
+#define QSERDES_V8_LALB_TX1_RESTRIM_ICAL_OVRD	0xfc
+#define QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL	0x100
+#define QSERDES_V8_LALB_TX1_RESTRIM_INIT_CODE	0x104
+#define QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET	0x108
+#define QSERDES_V8_LALB_TX0_RESTRIM_VREF_SEL	0x10c
+#define QSERDES_V8_LALB_TX1_RESTRIM_VREF_SEL	0x110
+#define QSERDES_V8_LALB_VMODE_CTRL1	0x114
+#define QSERDES_V8_LALB_SLEW_CNTL_RATE01	0x118
+#define QSERDES_V8_LALB_SLEW_CNTL_RATE23	0x11c
+#define QSERDES_V8_LALB_SLEW_CNTL_RATE4	0x120
+#define QSERDES_V8_LALB_ANA_INTERFACE_SELECT1	0x124
+#define QSERDES_V8_LALB_ANA_INTERFACE_SELECT2	0x128
+#define QSERDES_V8_LALB_ANA_INTERFACE_SELECT3	0x12c
+#define QSERDES_V8_LALB_PCS_INTERFACE_SELECT1	0x130
+#define QSERDES_V8_LALB_PCS_INTERFACE_SELECT2	0x134
+#define QSERDES_V8_LALB_LDO_TIMER_CTRL	0x138
+#define QSERDES_V8_LALB_AC_JTAG_ENABLE	0x13c
+#define QSERDES_V8_LALB_AC_JTAG_INITP	0x140
+#define QSERDES_V8_LALB_AC_JTAG_INITN	0x144
+#define QSERDES_V8_LALB_AC_JTAG_LVL	0x148
+#define QSERDES_V8_LALB_AC_JTAG_MODE	0x14c
+#define QSERDES_V8_LALB_AC_JTAG_RESET	0x150
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B0	0x154
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B1	0x158
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B2	0x15c
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B3	0x160
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B4	0x164
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B5	0x168
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B6	0x16c
+#define QSERDES_V8_LALB_RX_MODE_RATE_0_1_B7	0x170
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B0	0x174
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B1	0x178
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B2	0x17c
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B3	0x180
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B4	0x184
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B5	0x188
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B6	0x18c
+#define QSERDES_V8_LALB_RX_MODE_RATE2_B7	0x190
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B0	0x194
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B1	0x198
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B2	0x19c
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B3	0x1a0
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B4	0x1a4
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B5	0x1a8
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B6	0x1ac
+#define QSERDES_V8_LALB_RX_MODE_RATE3_B7	0x1b0
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B0	0x1b4
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B1	0x1b8
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B2	0x1bc
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B3	0x1c0
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B4	0x1c4
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B5	0x1c8
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B6	0x1cc
+#define QSERDES_V8_LALB_RX_MODE_RATE4_B7	0x1d0
+#define QSERDES_V8_LALB_TX_DCC_ANA_CTRL1	0x1d4
+#define QSERDES_V8_LALB_TX_DCC_ANA_CTRL2	0x1d8
+#define QSERDES_V8_LALB_CMUX_DCC_CTRL1	0x1dc
+#define QSERDES_V8_LALB_CMUX_DCC_POSTCAL_OFFSET	0x1e0
+#define QSERDES_V8_LALB_CMUX_DCC_OVRD	0x1e4
+#define QSERDES_V8_LALB_TX_DCC_CTRL	0x1e8
+#define QSERDES_V8_LALB_TX0_CTUNE_DCC_CONFIG	0x1ec
+#define QSERDES_V8_LALB_TX0_CTUNE_DCC_POSTCAL_OFFSET	0x1f0
+#define QSERDES_V8_LALB_TX0_CTUNE_DCC_OVRD	0x1f4
+#define QSERDES_V8_LALB_TX0_FTUNE_MSB_DCC_CONFIG	0x1f8
+#define QSERDES_V8_LALB_TX0_FTUNE_MSB_DCC_OFFSET_AND_OVRD	0x1fc
+#define QSERDES_V8_LALB_TX0_FTUNE_LSB_DCC_CONFIG	0x200
+#define QSERDES_V8_LALB_TX0_FTUNE_LSB_DCC_OFFSET_AND_OVRD	0x204
+#define QSERDES_V8_LALB_TX1_CTUNE_DCC_CONFIG	0x208
+#define QSERDES_V8_LALB_TX1_CTUNE_DCC_POSTCAL_OFFSET	0x20c
+#define QSERDES_V8_LALB_TX1_CTUNE_DCC_OVRD	0x210
+#define QSERDES_V8_LALB_TX1_FTUNE_MSB_DCC_CONFIG	0x214
+#define QSERDES_V8_LALB_TX1_FTUNE_MSB_DCC_OFFSET_AND_OVRD	0x218
+#define QSERDES_V8_LALB_TX1_FTUNE_LSB_DCC_CONFIG	0x21c
+#define QSERDES_V8_LALB_TX1_FTUNE_LSB_DCC_OFFSET_AND_OVRD	0x220
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CTRL	0x224
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CODE_OVRD_RATE0	0x228
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CODE_OVRD_RATE1	0x22c
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CODE_OVRD_RATE2	0x230
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CODE_OVRD_RATE3	0x234
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_CODE_OVRD_RATE4	0x238
+#define QSERDES_V8_LALB_CDR_VCO_CAL_CTRL	0x23c
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE0	0x240
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE0	0x244
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE1	0x248
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE1	0x24c
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE2	0x250
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE2	0x254
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE3	0x258
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE3	0x25c
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT1_RATE4	0x260
+#define QSERDES_V8_LALB_CDR_VCO_CTUNE_MEAS_CNT2_RATE4	0x264
+#define QSERDES_V8_LALB_CDR_VCTRL_RATE_0_1	0x268
+#define QSERDES_V8_LALB_CDR_VCTRL_RATE_2_3	0x26c
+#define QSERDES_V8_LALB_CDR_VCTRL_RATE_4	0x270
+#define QSERDES_V8_LALB_KVCO_INIT_RATE_0_1	0x274
+#define QSERDES_V8_LALB_KVCO_INIT_RATE_2_3	0x278
+#define QSERDES_V8_LALB_KVCO_INIT_RATE_4	0x27c
+#define QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE0	0x280
+#define QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE1	0x284
+#define QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE2	0x288
+#define QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE3	0x28c
+#define QSERDES_V8_LALB_KVCO_CODE_OVRD_RATE4	0x290
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_HIGH_RATE_0_1	0x294
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_HIGH_RATE_2_3	0x298
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_HIGH_RATE_4	0x29c
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_LOW_RATE_0_1	0x2a0
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_LOW_RATE_2_3	0x2a4
+#define QSERDES_V8_LALB_KVCO_CAL_VCTRL_LOW_RATE_4	0x2a8
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE0	0x2ac
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE0	0x2b0
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE1	0x2b4
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE1	0x2b8
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE2	0x2bc
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE2	0x2c0
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE3	0x2c4
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE3	0x2c8
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF1_RATE4	0x2cc
+#define QSERDES_V8_LALB_KVCO_IDEAL_FREQ_DIFF2_RATE4	0x2d0
+#define QSERDES_V8_LALB_KP_CDR_UP_DN	0x2d4
+#define QSERDES_V8_LALB_KP_CODE_OVRD_RATE_0_1	0x2d8
+#define QSERDES_V8_LALB_KP_CODE_OVRD_RATE_2_3	0x2dc
+#define QSERDES_V8_LALB_KP_CODE_OVRD_RATE4	0x2e0
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE0	0x2e4
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE0	0x2e8
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE1	0x2ec
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE1	0x2f0
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE2	0x2f4
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE2	0x2f8
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE3	0x2fc
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE3	0x300
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND1_RATE4	0x304
+#define QSERDES_V8_LALB_KP_CAL_UPPER_FREQ_DIFF_BND2_RATE4	0x308
+#define QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE0	0x30c
+#define QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE1	0x310
+#define QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE2	0x314
+#define QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE3	0x318
+#define QSERDES_V8_LALB_KP_CAL_LOWER_FREQ_DIFF_BND_RATE4	0x31c
+#define QSERDES_V8_LALB_CDR_KVCO_KP_CAL_FREQ_MEAS_CTRL	0x320
+#define QSERDES_V8_LALB_PLLLOCK_CMP_DEBUG_CTRL	0x324
+#define QSERDES_V8_LALB_PLLLOCK_CMP_DEBUG_CNT1	0x328
+#define QSERDES_V8_LALB_PLLLOCK_CMP_DEBUG_CNT2	0x32c
+#define QSERDES_V8_LALB_PLLLOCK_CMP_DEBUG_CNT3	0x330
+#define QSERDES_V8_LALB_RX_SUMMER_CAL_SPD_MODE_RATE_0123	0x334
+#define QSERDES_V8_LALB_RX_SUMMER_CAL_SPD_MODE_RATE_4	0x338
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE0	0x33c
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE1	0x340
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE2	0x344
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE3	0x348
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CODE_OVERRIDE_RATE4	0x34c
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CTRL1	0x350
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CTRL2	0x354
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CTRL3	0x358
+#define QSERDES_V8_LALB_RX_IVCM_CAL_CTRL4	0x35c
+#define QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE0	0x360
+#define QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE1	0x364
+#define QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE2	0x368
+#define QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE3	0x36c
+#define QSERDES_V8_LALB_RX_IVCM_POSTCAL_OFFSET_RATE4	0x370
+#define QSERDES_V8_LALB_RX_IDAC_I0_DC_OFFSETS	0x374
+#define QSERDES_V8_LALB_RX_IDAC_I0BAR_DC_OFFSETS	0x378
+#define QSERDES_V8_LALB_RX_IDAC_I1_DC_OFFSETS	0x37c
+#define QSERDES_V8_LALB_RX_IDAC_I1BAR_DC_OFFSETS	0x380
+#define QSERDES_V8_LALB_RX_IDAC_Q_DC_OFFSETS	0x384
+#define QSERDES_V8_LALB_RX_IDAC_QBAR_DC_OFFSETS	0x388
+#define QSERDES_V8_LALB_RX_IDAC_A_DC_OFFSETS	0x38c
+#define QSERDES_V8_LALB_RX_IDAC_ABAR_DC_OFFSETS	0x390
+#define QSERDES_V8_LALB_RX_IDAC_EN	0x394
+#define QSERDES_V8_LALB_DATA_SLICER_INIT_TIMER_CTRL	0x398
+#define QSERDES_V8_LALB_RX_IDAC_ENABLES	0x39c
+#define QSERDES_V8_LALB_RX_IDAC_SIGN	0x3a0
+#define QSERDES_V8_LALB_RX_IDAC_TSETTLE	0x3a4
+#define QSERDES_V8_LALB_SIGDET_ENABLES	0x3a8
+#define QSERDES_V8_LALB_SIGDET_CNTRL	0x3ac
+#define QSERDES_V8_LALB_SIGDET_LVL	0x3b0
+#define QSERDES_V8_LALB_SIGDET_DEGLITCH_CNTRL	0x3b4
+#define QSERDES_V8_LALB_SIGDET_CAL_CTRL1	0x3b8
+#define QSERDES_V8_LALB_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE	0x3bc
+#define QSERDES_V8_LALB_SIGDET_CAL_TRIM	0x3c0
+#define QSERDES_V8_LALB_IA_OFFSET_CENTER_CAL_CTRL	0x3c4
+#define QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE0	0x3c8
+#define QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE1	0x3cc
+#define QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE2	0x3d0
+#define QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE3	0x3d4
+#define QSERDES_V8_LALB_FREQ_LOCK_DET_DLY_RATE4	0x3d8
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_RATE0	0x3dc
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_RATE1	0x3e0
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_RATE2	0x3e4
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_RATE3	0x3e8
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_RATE4	0x3ec
+#define QSERDES_V8_LALB_CDR_LOCK_CTRL	0x3f0
+#define QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE0	0x3f4
+#define QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE1	0x3f8
+#define QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE2	0x3fc
+#define QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE3	0x400
+#define QSERDES_V8_LALB_CDR_CP_CUR_FLL_RATE4	0x404
+#define QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE0	0x408
+#define QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE1	0x40c
+#define QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE2	0x410
+#define QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE3	0x414
+#define QSERDES_V8_LALB_CDR_CP_CUR_PLL_RATE4	0x418
+#define QSERDES_V8_LALB_CDR_FLL_DIV_RATIO_RATE_0123	0x41c
+#define QSERDES_V8_LALB_CDR_FLL_DIV_RATIO_RATE4	0x420
+#define QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE_01	0x424
+#define QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE_23	0x428
+#define QSERDES_V8_LALB_CDR_LOOP_CCODE_RATE4	0x42c
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE_0_1	0x430
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE_2_3	0x434
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FAST_RATE4	0x438
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE_0_1	0x43c
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE_2_3	0x440
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_FLL_RATE4	0x444
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE_0_1	0x448
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE_2_3	0x44c
+#define QSERDES_V8_LALB_CDR_LOOP_RCODE_PLL_RATE4	0x450
+#define QSERDES_V8_LALB_CDR_VCO_CAP_CODE_RATE_0123	0x454
+#define QSERDES_V8_LALB_CDR_VCO_CAP_CODE_RATE4	0x458
+#define QSERDES_V8_LALB_CDR_VCO_TYPE_CONFIG	0x45c
+#define QSERDES_V8_LALB_CDR_VCO_EN_LOWFREQ	0x460
+#define QSERDES_V8_LALB_CDR_FAST_SLOW_VCO_OVRD	0x464
+#define QSERDES_V8_LALB_CDR_LOOP_FUNC_CTRL	0x468
+#define QSERDES_V8_LALB_CDR_FAST_LOCK_EN_CTRL	0x46c
+#define QSERDES_V8_LALB_RX_RCVR_EN	0x470
+#define QSERDES_V8_LALB_LANE_RATE_CTRL	0x474
+#define QSERDES_V8_LALB_RX_TERM_RCVR_CTRL	0x478
+#define QSERDES_V8_LALB_REC_DETECT_CTRL	0x47c
+#define QSERDES_V8_LALB_RCV_DETECT_LVL	0x480
+#define QSERDES_V8_LALB_GM_CAL_EN	0x484
+#define QSERDES_V8_LALB_GM_CAL_RES_RATE0_1	0x488
+#define QSERDES_V8_LALB_GM_CAL_RES_RATE2_3	0x48c
+#define QSERDES_V8_LALB_GM_CAL_RES_RATE4	0x490
+#define QSERDES_V8_LALB_RX_TERM_BW_RATE_0123	0x494
+#define QSERDES_V8_LALB_RX_TERM_BW_RATE4	0x498
+#define QSERDES_V8_LALB_AUX_CLK_CTRL	0x49c
+#define QSERDES_V8_LALB_AUX_OFFSET_CONTROL	0x4a0
+#define QSERDES_V8_LALB_AUXDATA_TB	0x4a4
+#define QSERDES_V8_LALB_EOM_CTRL1	0x4a8
+#define QSERDES_V8_LALB_EOM_CTRL2	0x4ac
+#define QSERDES_V8_LALB_EOM_CTRL3	0x4b0
+#define QSERDES_V8_LALB_EOM_CTRL4	0x4b4
+#define QSERDES_V8_LALB_DFE_EN_TIMER	0x4b8
+#define QSERDES_V8_LALB_RX_EQ_OFFSET_LSB	0x4bc
+#define QSERDES_V8_LALB_RX_EQ_OFFSET_MSB	0x4c0
+#define QSERDES_V8_LALB_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x4c4
+#define QSERDES_V8_LALB_RX_OFFSET_ADAPTOR_CNTRL2	0x4c8
+#define QSERDES_V8_LALB_RX_OFFSET_ADAPTOR_CNTRL3	0x4cc
+#define QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL1	0x4d0
+#define QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL2	0x4d4
+#define QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL3	0x4d8
+#define QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL4	0x4dc
+#define QSERDES_V8_LALB_RX_EQU_ADAPTOR_CNTRL5	0x4e0
+#define QSERDES_V8_LALB_RX_EQU_KEQ_UP_LSB	0x4e4
+#define QSERDES_V8_LALB_RX_EQU_KEQ_UP_MSB	0x4e8
+#define QSERDES_V8_LALB_RX_EQU_KEQ_DN_LSB	0x4ec
+#define QSERDES_V8_LALB_RX_EQU_KEQ_DN_MSB	0x4f0
+#define QSERDES_V8_LALB_CTLE_ADP_RESET_INIT_CODE_RATE_0_1_2	0x4f4
+#define QSERDES_V8_LALB_CTLE_ADP_RESET_INIT_CODE_RATE_3_4	0x4f8
+#define QSERDES_V8_LALB_CTLE_POST_CAL_OFFSET_RATE_0_1_2	0x4fc
+#define QSERDES_V8_LALB_CTLE_POST_CAL_OFFSET_RATE_3_4	0x500
+#define QSERDES_V8_LALB_RX_VGA_GAIN2_BLK1	0x504
+#define QSERDES_V8_LALB_RX_VGA_GAIN2_BLK2	0x508
+#define QSERDES_V8_LALB_VGA_CAL_CNTRL1	0x50c
+#define QSERDES_V8_LALB_VGA_CAL_CNTRL2	0x510
+#define QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE0_1	0x514
+#define QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE2_3	0x518
+#define QSERDES_V8_LALB_VGA_CAL_MAN_VAL_RATE4	0x51c
+#define QSERDES_V8_LALB_KVGA_CTRL1	0x520
+#define QSERDES_V8_LALB_KVGA_CTRL2	0x524
+#define QSERDES_V8_LALB_VTHRESH_CAL_CNTRL1	0x528
+#define QSERDES_V8_LALB_VTHRESH_CAL_CNTRL2	0x52c
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE0	0x530
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE1	0x534
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE2	0x538
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE3	0x53c
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_VAL_RATE4	0x540
+#define QSERDES_V8_LALB_VTHRESH_CAL_MAN_CAL_PAM3	0x544
+#define QSERDES_V8_LALB_VTH_POST_CAL_OFFSET_RATE_0_1	0x548
+#define QSERDES_V8_LALB_VTH_POST_CAL_OFFSET_RATE_2_3	0x54c
+#define QSERDES_V8_LALB_VTH_POST_CAL_OFFSET_RATE4	0x550
+#define QSERDES_V8_LALB_DFE_TAP1_CTRL	0x554
+#define QSERDES_V8_LALB_DFE_TAP1_MANVAL_KTAP	0x558
+#define QSERDES_V8_LALB_DFE_TAP1_POST_CAL_OFFSET_RATE_0_1_2	0x55c
+#define QSERDES_V8_LALB_DFE_TAP1_POST_CAL_OFFSET_RATE_3_4	0x560
+#define QSERDES_V8_LALB_DFE_TAP2_CTRL	0x564
+#define QSERDES_V8_LALB_DFE_TAP2_MANVAL_KTAP	0x568
+#define QSERDES_V8_LALB_DFE_TAP3_CTRL	0x56c
+#define QSERDES_V8_LALB_DFE_TAP3_MANVAL_KTAP	0x570
+#define QSERDES_V8_LALB_DFE_TAP4_CTRL	0x574
+#define QSERDES_V8_LALB_DFE_TAP4_MANVAL_KTAP	0x578
+#define QSERDES_V8_LALB_DFE_TAP5_CTRL	0x57c
+#define QSERDES_V8_LALB_DFE_TAP5_MANVAL_KTAP	0x580
+#define QSERDES_V8_LALB_DFE_TAP6_CTRL	0x584
+#define QSERDES_V8_LALB_DFE_TAP6_MANVAL_KTAP	0x588
+#define QSERDES_V8_LALB_DFE_TAP7_CTRL	0x58c
+#define QSERDES_V8_LALB_DFE_TAP7_MANVAL_KTAP	0x590
+#define QSERDES_V8_LALB_DFE_TAP1_DAC_ENABLE	0x594
+#define QSERDES_V8_LALB_DFE_TAP2_DAC_ENABLE	0x598
+#define QSERDES_V8_LALB_DFE_TAP345_DAC_ENABLE	0x59c
+#define QSERDES_V8_LALB_DFE_TAP67_DAC_ENABLE	0x5a0
+#define QSERDES_V8_LALB_CDR_IQTUNE_CTRL	0x5a4
+#define QSERDES_V8_LALB_CDR_IQTUNE_GAIN	0x5a8
+#define QSERDES_V8_LALB_CDR_IQTUNE_MAN_INDEX	0x5ac
+#define QSERDES_V8_LALB_CDR_IQTUNE_FILTER_CAL_CTRL1	0x5b0
+#define QSERDES_V8_LALB_CDR_IQTUNE_FILTER_CAL_CTRL2	0x5b4
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK0_CAL_CODE_RATE0	0x5b8
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK0_CAL_CODE_RATE1	0x5bc
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK0_CAL_CODE_RATE2	0x5c0
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK0_CAL_CODE_RATE3	0x5c4
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK0_CAL_CODE_RATE4	0x5c8
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK90_CAL_CODE_RATE0	0x5cc
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK90_CAL_CODE_RATE1	0x5d0
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK90_CAL_CODE_RATE2	0x5d4
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK90_CAL_CODE_RATE3	0x5d8
+#define QSERDES_V8_LALB_CDR_IQTUNE_CLK90_CAL_CODE_RATE4	0x5dc
+#define QSERDES_V8_LALB_CDR_IQTUNE_ANA_CTRL	0x5e0
+#define QSERDES_V8_LALB_CDR_IQTUNE_VDCC_CTRL	0x5e4
+#define QSERDES_V8_LALB_CDR_IQTUNE_DIV2_CTRL_RATE0123	0x5e8
+#define QSERDES_V8_LALB_CDR_IQTUNE_DIV2_CTRL_RATE4	0x5ec
+#define QSERDES_V8_LALB_BLW_CTRL	0x5f0
+#define QSERDES_V8_LALB_BLW_ANA_VER_CTRL	0x5f4
+#define QSERDES_V8_LALB_BLW_GAIN_CAL_CTRL	0x5f8
+#define QSERDES_V8_LALB_BLW_GAIN_FORCE_CODE	0x5fc
+#define QSERDES_V8_LALB_BLW_MAN_VAL_RATE3	0x600
+#define QSERDES_V8_LALB_BLW_MAN_VAL_RATE4	0x604
+#define QSERDES_V8_LALB_IVTH_CAL_CTRL1	0x608
+#define QSERDES_V8_LALB_IVTH_CAL_CTRL2	0x60c
+#define QSERDES_V8_LALB_IVTH_CAL_CTRL3	0x610
+#define QSERDES_V8_LALB_VTH_I_UP_CNTRL_VAL	0x614
+#define QSERDES_V8_LALB_VTH_I_DN_CNTRL_VAL	0x618
+#define QSERDES_V8_LALB_NRZ_EYE_HEIGHT_SEL_VAL	0x61c
+#define QSERDES_V8_LALB_IVTH_CAL_VAL_OVRD_MUX	0x620
+#define QSERDES_V8_LALB_CDR_VCO_CAP_CODE_OVRD_MUXES	0x624
+#define QSERDES_V8_LALB_VCO_CTUNE_LOWER_BND_RATE0	0x628
+#define QSERDES_V8_LALB_VCO_CTUNE_LOWER_BND_RATE1	0x62c
+#define QSERDES_V8_LALB_VCO_CTUNE_LOWER_BND_RATE2	0x630
+#define QSERDES_V8_LALB_VCO_CTUNE_LOWER_BND_RATE3	0x634
+#define QSERDES_V8_LALB_VCO_CTUNE_LOWER_BND_RATE4	0x638
+#define QSERDES_V8_LALB_VCO_CTUNE_UPPER_BND_RATE0	0x63c
+#define QSERDES_V8_LALB_VCO_CTUNE_UPPER_BND_RATE1	0x640
+#define QSERDES_V8_LALB_VCO_CTUNE_UPPER_BND_RATE2	0x644
+#define QSERDES_V8_LALB_VCO_CTUNE_UPPER_BND_RATE3	0x648
+#define QSERDES_V8_LALB_VCO_CTUNE_UPPER_BND_RATE4	0x64c
+#define QSERDES_V8_LALB_CDR_LOCK_KVCO_OFFSET_RATE0	0x650
+#define QSERDES_V8_LALB_CDR_LOCK_KVCO_OFFSET_RATE1	0x654
+#define QSERDES_V8_LALB_CDR_LOCK_KVCO_OFFSET_RATE2	0x658
+#define QSERDES_V8_LALB_CDR_LOCK_KVCO_OFFSET_RATE3	0x65c
+#define QSERDES_V8_LALB_CDR_LOCK_KVCO_OFFSET_RATE4	0x660
+#define QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE0	0x664
+#define QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE1	0x668
+#define QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE2	0x66c
+#define QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE3	0x670
+#define QSERDES_V8_LALB_CDR_LOCK_KP_OFFSET_RATE4	0x674
+#define QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE0	0x678
+#define QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE1	0x67c
+#define QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE2	0x680
+#define QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE3	0x684
+#define QSERDES_V8_LALB_CDR_FASTLOCK_CP_CUR_PLL_RATE4	0x688
+#define QSERDES_V8_LALB_DEBUG_BUS_SEL	0x68c
+#define QSERDES_V8_LALB_BIST_STATUS	0x690
+#define QSERDES_V8_LALB_BIST_ERROR_COUNT1	0x694
+#define QSERDES_V8_LALB_BIST_ERROR_COUNT2	0x698
+#define QSERDES_V8_LALB_AC_JTAG_OUTP	0x69c
+#define QSERDES_V8_LALB_AC_JTAG_OUTN	0x6a0
+#define QSERDES_V8_LALB_DATA_SLICER_DEBUG_STATUS	0x6a4
+#define QSERDES_V8_LALB_DATA_SLICER_TIMER1_STATUS	0x6a8
+#define QSERDES_V8_LALB_DATA_SLICER_TIMER2_STATUS	0x6ac
+#define QSERDES_V8_LALB_TX0_RESTRIM_CODE_STATUS	0x6b0
+#define QSERDES_V8_LALB_TX0_RESTRIM_ICAL_CODE_STATUS	0x6b4
+#define QSERDES_V8_LALB_TX0_RESTRIM_CAL_STATUS	0x6b8
+#define QSERDES_V8_LALB_TX1_RESTRIM_CODE_STATUS	0x6bc
+#define QSERDES_V8_LALB_TX1_RESTRIM_ICAL_CODE_STATUS	0x6c0
+#define QSERDES_V8_LALB_TX1_RESTRIM_CAL_STATUS	0x6c4
+#define QSERDES_V8_LALB_CMUX_DCC_CAL_FSM_STATUS	0x6c8
+#define QSERDES_V8_LALB_CMUX_DCC_READCODE_STATUS	0x6cc
+#define QSERDES_V8_LALB_TX_DCC_CAL_ANA_STATUS	0x6d0
+#define QSERDES_V8_LALB_TX0_CTUNE_DCC_FSM_DEBUG_STATUS	0x6d4
+#define QSERDES_V8_LALB_TX0_COARSE_DCC_READCODE_STATUS	0x6d8
+#define QSERDES_V8_LALB_TX0_FTUNE_MSB_DCC_FSM_DEBUG_STATUS	0x6dc
+#define QSERDES_V8_LALB_TX0_FTUNE_LSB_DCC_FSM_DEBUG_STATUS	0x6e0
+#define QSERDES_V8_LALB_TX0_FINE_DCC_READCODE_STATUS	0x6e4
+#define QSERDES_V8_LALB_TX1_CTUNE_DCC_FSM_DEBUG_STATUS	0x6e8
+#define QSERDES_V8_LALB_TX1_COARSE_DCC_READCODE_STATUS	0x6ec
+#define QSERDES_V8_LALB_TX1_FTUNE_MSB_DCC_FSM_DEBUG_STATUS	0x6f0
+#define QSERDES_V8_LALB_TX1_FTUNE_LSB_DCC_FSM_DEBUG_STATUS	0x6f4
+#define QSERDES_V8_LALB_TX1_FINE_DCC_READCODE_STATUS	0x6f8
+#define QSERDES_V8_LALB_CDR_VCO_CAL_STATUS	0x6fc
+#define QSERDES_V8_LALB_CDR_VCTRL_STATUS	0x700
+#define QSERDES_V8_LALB_CDR_VCO_CAP_CODE_STATUS	0x704
+#define QSERDES_V8_LALB_KVCO_CAL_DEBUG1_STATUS	0x708
+#define QSERDES_V8_LALB_KVCO_CAL_DEBUG2_STATUS	0x70c
+#define QSERDES_V8_LALB_KP_CAL_DEBUG1_STATUS	0x710
+#define QSERDES_V8_LALB_KP_CAL_DEBUG2_STATUS	0x714
+#define QSERDES_V8_LALB_CDR_VCO_FREQ_DEBUG1_STATUS	0x718
+#define QSERDES_V8_LALB_CDR_VCO_FREQ_DEBUG2_STATUS	0x71c
+#define QSERDES_V8_LALB_CDR_VCO_FREQ_DEBUG3_STATUS	0x720
+#define QSERDES_V8_LALB_CDR_VCO_FREQ_DEBUG4_STATUS	0x724
+#define QSERDES_V8_LALB_IVCM_CAL_STATUS	0x728
+#define QSERDES_V8_LALB_IVCM_CAL_DEBUG_STATUS	0x72c
+#define QSERDES_V8_LALB_IDAC_STATUS_I0	0x730
+#define QSERDES_V8_LALB_IDAC_STATUS_I0BAR	0x734
+#define QSERDES_V8_LALB_IDAC_STATUS_I1	0x738
+#define QSERDES_V8_LALB_IDAC_STATUS_I1BAR	0x73c
+#define QSERDES_V8_LALB_IDAC_STATUS_Q	0x740
+#define QSERDES_V8_LALB_IDAC_STATUS_QBAR	0x744
+#define QSERDES_V8_LALB_IDAC_STATUS_A	0x748
+#define QSERDES_V8_LALB_IDAC_STATUS_ABAR	0x74c
+#define QSERDES_V8_LALB_IDAC_STATUS_SM_ON	0x750
+#define QSERDES_V8_LALB_IDAC_STATUS_SIGNERROR	0x754
+#define QSERDES_V8_LALB_RX_SIGDET_STATUS	0x758
+#define QSERDES_V8_LALB_SIGDET_CAL_CODE_STATUS	0x75c
+#define QSERDES_V8_LALB_SIGDET_CAL_FSM_DEBUG_STATUS	0x760
+#define QSERDES_V8_LALB_CDR_FREQ_LOCK_CNT_STATUS	0x764
+#define QSERDES_V8_LALB_CDR_PHASE_LOCK_CNT_STATUS	0x768
+#define QSERDES_V8_LALB_CDR_LOCK_DEBUG_STATUS	0x76c
+#define QSERDES_V8_LALB_IDATA_HIGH_STATUS1	0x770
+#define QSERDES_V8_LALB_IDATA_HIGH_STATUS2	0x774
+#define QSERDES_V8_LALB_IDATA_HIGH_STATUS3	0x778
+#define QSERDES_V8_LALB_IDATA_HIGH_STATUS4	0x77c
+#define QSERDES_V8_LALB_IDATA_LOW_STATUS1	0x780
+#define QSERDES_V8_LALB_IDATA_LOW_STATUS2	0x784
+#define QSERDES_V8_LALB_IDATA_LOW_STATUS3	0x788
+#define QSERDES_V8_LALB_IDATA_LOW_STATUS4	0x78c
+#define QSERDES_V8_LALB_QDATA_STATUS1	0x790
+#define QSERDES_V8_LALB_QDATA_STATUS2	0x794
+#define QSERDES_V8_LALB_QDATA_STATUS3	0x798
+#define QSERDES_V8_LALB_QDATA_STATUS4	0x79c
+#define QSERDES_V8_LALB_IA_ERROR_COUNTER_LOW	0x7a0
+#define QSERDES_V8_LALB_IA_ERROR_COUNTER_HIGH	0x7a4
+#define QSERDES_V8_LALB_EOM_ERR_CNT_LSB_STATUS	0x7a8
+#define QSERDES_V8_LALB_EOM_ERR_CNT_MSB_STATUS	0x7ac
+#define QSERDES_V8_LALB_EOM_OP_STATUS	0x7b0
+#define QSERDES_V8_LALB_AUX_MIXER_INDEX_STATUS	0x7b4
+#define QSERDES_V8_LALB_AUX_OFFSET_STATUS	0x7b8
+#define QSERDES_V8_LALB_AUXDATA_TB_STATUS	0x7bc
+#define QSERDES_V8_LALB_AUX_MIXER_CTRL_0_STATUS	0x7c0
+#define QSERDES_V8_LALB_AUX_MIXER_CTRL_90_STATUS	0x7c4
+#define QSERDES_V8_LALB_AUX_MIXER_CTRL_180_STATUS	0x7c8
+#define QSERDES_V8_LALB_IQ_MIXER_INDEX_STATUS	0x7cc
+#define QSERDES_V8_LALB_IQTUNE_FLTR_INDEX_STATUS	0x7d0
+#define QSERDES_V8_LALB_IQ_MIXER_CTRL_0_STATUS	0x7d4
+#define QSERDES_V8_LALB_IQ_MIXER_CTRL_90_STATUS	0x7d8
+#define QSERDES_V8_LALB_IQ_MIXER_CTRL_180_STATUS	0x7dc
+#define QSERDES_V8_LALB_READ_EQCODE	0x7e0
+#define QSERDES_V8_LALB_READ_OFFSETCODE	0x7e4
+#define QSERDES_V8_LALB_VGA_READ_CODE	0x7e8
+#define QSERDES_V8_LALB_VTHRESH_READ_CODE	0x7ec
+#define QSERDES_V8_LALB_DFE_TAP1_READ_CODE	0x7f0
+#define QSERDES_V8_LALB_DFE_TAP2_READ_CODE	0x7f4
+#define QSERDES_V8_LALB_DFE_TAP3_READ_CODE	0x7f8
+#define QSERDES_V8_LALB_DFE_TAP4_READ_CODE	0x7fc
+#define QSERDES_V8_LALB_DFE_TAP5_READ_CODE	0x800
+#define QSERDES_V8_LALB_DFE_TAP6_READ_CODE	0x804
+#define QSERDES_V8_LALB_DFE_TAP7_READ_CODE	0x808
+#define QSERDES_V8_LALB_CDR_IQTUNE_FILTER_BIN_CODE	0x80c
+#define QSERDES_V8_LALB_CDR_IQTUNE_FILTER_CLK0_CODE	0x810
+#define QSERDES_V8_LALB_CDR_IQTUNE_FILTER_CLK90_CODE	0x814
+#define QSERDES_V8_LALB_BLW_READ_CODE	0x818
+#define QSERDES_V8_LALB_IA_OFFSET_CAL_DEBUG_STATUS	0x81c
+#define QSERDES_V8_LALB_IA_OFFSET_CAL_STATUS	0x820
+#define QSERDES_V8_LALB_IVTH_CAL_STATUS	0x824
+#define QSERDES_V8_LALB_IVTH_NRZ_EYE_HEIGHT_STATUS	0x828
+#define QSERDES_V8_LALB_IVTH_UPPER_EYE_MAX_STATUS	0x82c
+#define QSERDES_V8_LALB_IVTH_UPPER_EYE_MIN_STATUS	0x830
+#define QSERDES_V8_LALB_IVTH_LOWER_EYE_MAX_STATUS	0x834
+#define QSERDES_V8_LALB_IVTH_LOWER_EYE_MIN_STATUS	0x838
+#define QSERDES_V8_LALB_IVTH_UP_INIT_CTR_STATUS	0x83c
+#define QSERDES_V8_LALB_VTH_I_UP_CNTRL_STATUS	0x840
+#define QSERDES_V8_LALB_VTH_I_DN_CNTRL_STATUS	0x844
+#define QSERDES_V8_LALB_NRZ_EYE_HEIGHT_SEL_STATUS	0x848
+#define QSERDES_V8_LALB_DEBUG_BUS0	0x84c
+#define QSERDES_V8_LALB_DEBUG_BUS1	0x850
+#define QSERDES_V8_LALB_DEBUG_BUS2	0x854
+#define QSERDES_V8_LALB_DEBUG_BUS3	0x858
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL1	0x85c
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL2	0x860
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL3	0x864
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL4	0x868
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL5	0x86c
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL6	0x870
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL7	0x874
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL8	0x878
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL9	0x87c
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL10	0x880
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL11	0x884
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL12	0x888
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL13	0x88c
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL14	0x890
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL15	0x894
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL16	0x898
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL17	0x89c
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL18	0x8a0
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL19	0x8a4
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL20	0x8a8
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL21	0x8ac
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL22	0x8b0
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL23	0x8b4
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL24	0x8b8
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL25	0x8bc
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL26	0x8c0
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL27	0x8c4
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL28	0x8c8
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL29	0x8cc
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL30	0x8d0
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL31	0x8d4
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL32	0x8d8
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL_V2_1	0x8dc
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL_V2_2	0x8e0
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL_V2_3	0x8e4
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL_V2_4	0x8e8
+#define QSERDES_V8_LALB_DIG_BKUP_CTRL_V2_5	0x8ec
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS1	0x8f0
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS2	0x8f4
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS3	0x8f8
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS4	0x8fc
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS5	0x900
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS6	0x904
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS7	0x908
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS8	0x90c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS9	0x910
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS10	0x914
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS11	0x918
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS12	0x91c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS13	0x920
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS14	0x924
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS15	0x928
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS16	0x92c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS17	0x930
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS18	0x934
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS19	0x938
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS20	0x93c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS21	0x940
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS22	0x944
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS23	0x948
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS24	0x94c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS25	0x950
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS26	0x954
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS27	0x958
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS28	0x95c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS29	0x960
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS30	0x964
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS31	0x968
+#define QSERDES_V8_LALB_DIG_BKUP_RO_BUS32	0x96c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS1	0x970
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS2	0x974
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS3	0x978
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS4	0x97c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS5	0x980
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS6	0x984
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS7	0x988
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS8	0x98c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS9	0x990
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS10	0x994
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS11	0x998
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS12	0x99c
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS13	0x9a0
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS14	0x9a4
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS15	0x9a8
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS16	0x9ac
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS17	0x9b0
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS18	0x9b4
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS19	0x9b8
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS20	0x9bc
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS21	0x9c0
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS22	0x9c4
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS23	0x9c8
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS24	0x9cc
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS25	0x9d0
+#define QSERDES_V8_LALB_DIG_BKUP_RO_V2_BUS26	0x9d4
+#endif /* QCOM_PHY_QMP_QSERDES_V8_LALBH_ */
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
new file mode 100644
index 000000000000..4f387c8ed9e5
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_USB43_PCS_V8_H_
+#define QCOM_PHY_QMP_USB43_PCS_V8_H_
+
+#define QPHY_V8_USB43_PCS_SW_RESET				0x000
+#define QPHY_V8_USB43_PCS_PCS_STATUS1				0x014
+#define QPHY_V8_USB43_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V8_USB43_PCS_START_CONTROL				0x044
+#define QPHY_V8_USB43_PCS_POWER_STATE_CONFIG1			0x090
+#define QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1			0x0c4
+#define QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2			0x0c8
+#define QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3			0x0cc
+#define QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6			0x0d8
+#define QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V8_USB43_PCS_RX_SIGDET_LVL				0x188
+#define QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L			0x190
+#define QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H			0x194
+#define QPHY_V8_USB43_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME			0x1ac
+#define QPHY_V8_USB43_PCS_RX_CONFIG				0x1b0
+#define QPHY_V8_USB43_PCS_TSYNC_DLY_TIME			0x1b4
+#define QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1			0x1c0
+#define QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2			0x1c4
+#define QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V8_USB43_PCS_EQ_CONFIG1				0x1dc
+#define QPHY_V8_USB43_PCS_EQ_CONFIG2				0x1e0
+#define QPHY_V8_USB43_PCS_EQ_CONFIG5				0x1ec
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
new file mode 100644
index 000000000000..e9c743fce9d1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
@@ -0,0 +1,224 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_USB43_QSERDES_COM_V8_H_
+#define QCOM_PHY_QMP_USB43_QSERDES_COM_V8_H_
+
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE1		0x000
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE1		0x004
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE3_MODE1		0x008
+#define QSERDES_V8_USB43_COM_CLK_EP_DIV_MODE1			0x00c
+#define QSERDES_V8_USB43_COM_CP_CTRL_MODE1			0x010
+#define QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1			0x014
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1			0x018
+#define QSERDES_V8_USB43_COM_CORECLK_DIV_MODE1			0x01c
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_MODE1			0x020
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_MODE1			0x024
+#define QSERDES_V8_USB43_COM_DEC_START_MODE1			0x028
+#define QSERDES_V8_USB43_COM_DEC_START_MSB_MODE1		0x02c
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE1		0x030
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE1		0x034
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE1		0x038
+#define QSERDES_V8_USB43_COM_HSCLK_SEL_1			0x03c
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE1		0x040
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN1_MODE1		0x044
+#define QSERDES_V8_USB43_COM_VCO_TUNE1_MODE1			0x048
+#define QSERDES_V8_USB43_COM_VCO_TUNE2_MODE1			0x04c
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x050
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE1		0x054
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0		0x058
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0		0x05c
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0		0x060
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE3_MODE0		0x068
+#define QSERDES_V8_USB43_COM_CLK_EP_DIV_MODE0			0x06c
+#define QSERDES_V8_USB43_COM_CP_CTRL_MODE0			0x070
+#define QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0			0x074
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0			0x078
+#define QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0			0x07c
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0			0x080
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0			0x084
+#define QSERDES_V8_USB43_COM_DEC_START_MODE0			0x088
+#define QSERDES_V8_USB43_COM_DEC_START_MSB_MODE0		0x08c
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0		0x090
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0		0x094
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0		0x098
+#define QSERDES_V8_USB43_COM_HSCLK_HS_SWITCH_SEL_1		0x09c
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
+#define QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0			0x0a8
+#define QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0			0x0ac
+#define QSERDES_V8_USB43_COM_ATB_SEL1				0x0b0
+#define QSERDES_V8_USB43_COM_ATB_SEL2				0x0b4
+#define QSERDES_V8_USB43_COM_FREQ_UPDATE			0x0b8
+#define QSERDES_V8_USB43_COM_BG_TIMER				0x0bc
+#define QSERDES_V8_USB43_COM_SSC_EN_CENTER			0x0c0
+#define QSERDES_V8_USB43_COM_SSC_ADJ_PER1			0x0c4
+#define QSERDES_V8_USB43_COM_SSC_ADJ_PER2			0x0c8
+#define QSERDES_V8_USB43_COM_SSC_PER1				0x0cc
+#define QSERDES_V8_USB43_COM_SSC_PER2				0x0d0
+#define QSERDES_V8_USB43_COM_POST_DIV				0x0d4
+#define QSERDES_V8_USB43_COM_POST_DIV_MUX			0x0d8
+#define QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define QSERDES_V8_USB43_COM_CLK_ENABLE1			0x0e0
+#define QSERDES_V8_USB43_COM_SYS_CLK_CTRL			0x0e4
+#define QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE			0x0e8
+#define QSERDES_V8_USB43_COM_PLL_EN				0x0ec
+#define QSERDES_V8_USB43_COM_DEBUG_BUS_OVRD			0x0f0
+#define QSERDES_V8_USB43_COM_PLL_IVCO				0x0f4
+#define QSERDES_V8_USB43_COM_PLL_IVCO_MODE1			0x0f8
+#define QSERDES_V8_USB43_COM_CMN_IETRIM				0x0fc
+#define QSERDES_V8_USB43_COM_CMN_IPTRIM				0x100
+#define QSERDES_V8_USB43_COM_EP_CLOCK_DETECT_CTRL		0x104
+#define QSERDES_V8_USB43_COM_PLL_CNTRL				0x108
+#define QSERDES_V8_USB43_COM_BIAS_EN_CTRL_BY_PSM		0x10c
+#define QSERDES_V8_USB43_COM_SYSCLK_EN_SEL			0x110
+#define QSERDES_V8_USB43_COM_CML_SYSCLK_SEL			0x114
+#define QSERDES_V8_USB43_COM_RESETSM_CNTRL			0x118
+#define QSERDES_V8_USB43_COM_RESETSM_CNTRL2			0x11c
+#define QSERDES_V8_USB43_COM_LOCK_CMP_EN			0x120
+#define QSERDES_V8_USB43_COM_LOCK_CMP_CFG			0x124
+#define QSERDES_V8_USB43_COM_INTEGLOOP_INITVAL			0x128
+#define QSERDES_V8_USB43_COM_INTEGLOOP_EN			0x12c
+#define QSERDES_V8_USB43_COM_INTEGLOOP_P_PATH_GAIN0		0x130
+#define QSERDES_V8_USB43_COM_INTEGLOOP_P_PATH_GAIN1		0x134
+#define QSERDES_V8_USB43_COM_VCOCAL_DEADMAN_CTRL		0x138
+#define QSERDES_V8_USB43_COM_VCO_TUNE_CTRL			0x13c
+#define QSERDES_V8_USB43_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V8_USB43_COM_VCO_TUNE_INITVAL1			0x144
+#define QSERDES_V8_USB43_COM_VCO_TUNE_INITVAL2			0x148
+#define QSERDES_V8_USB43_COM_VCO_TUNE_MINVAL1			0x14c
+#define QSERDES_V8_USB43_COM_VCO_TUNE_MINVAL2			0x150
+#define QSERDES_V8_USB43_COM_VCO_TUNE_MAXVAL1			0x154
+#define QSERDES_V8_USB43_COM_VCO_TUNE_MAXVAL2			0x158
+#define QSERDES_V8_USB43_COM_VCO_TUNE_TIMER1			0x15c
+#define QSERDES_V8_USB43_COM_VCO_TUNE_TIMER2			0x160
+#define QSERDES_V8_USB43_COM_CLK_SELECT				0x164
+#define QSERDES_V8_USB43_COM_PLL_ANALOG				0x168
+#define QSERDES_V8_USB43_COM_SW_RESET				0x16c
+#define QSERDES_V8_USB43_COM_CORE_CLK_EN			0x170
+#define QSERDES_V8_USB43_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V8_USB43_COM_CMN_CONFIG_3			0x178
+#define QSERDES_V8_USB43_COM_CMN_RATE_OVERRIDE			0x17c
+#define QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL			0x180
+#define QSERDES_V8_USB43_COM_DEBUG_BUS_SEL			0x184
+#define QSERDES_V8_USB43_COM_CMN_MISC1				0x188
+#define QSERDES_V8_USB43_COM_CMN_MODE				0x18c
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD			0x190
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD1			0x194
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD2			0x198
+#define QSERDES_V8_USB43_COM_VCO_DC_LEVEL_CTRL			0x19c
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1		0x1a0
+#define QSERDES_V8_USB43_COM_ADDITIONAL_CTRL_1			0x1a4
+#define QSERDES_V8_USB43_COM_AUTO_GAIN_ADJ_CTRL_1		0x1a8
+#define QSERDES_V8_USB43_COM_AUTO_GAIN_ADJ_CTRL_2		0x1ac
+#define QSERDES_V8_USB43_COM_AUTO_GAIN_ADJ_CTRL_3		0x1b0
+#define QSERDES_V8_USB43_COM_AUTO_GAIN_ADJ_CTRL_4		0x1b4
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC			0x1b8
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_2			0x1bc
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_3			0x1c0
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_4			0x1c4
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_5			0x1c8
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE2		0x1cc
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE2		0x1d0
+#define QSERDES_V8_USB43_COM_SSC_STEP_SIZE3_MODE2		0x1d4
+#define QSERDES_V8_USB43_COM_CLK_EP_DIV_MODE2			0x1d8
+#define QSERDES_V8_USB43_COM_CP_CTRL_MODE2			0x1dc
+#define QSERDES_V8_USB43_COM_PLL_RCTRL_MODE2			0x1e0
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_MODE2			0x1e4
+#define QSERDES_V8_USB43_COM_CORECLK_DIV_MODE2			0x1e8
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_MODE2			0x1ec
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_MODE2			0x1f0
+#define QSERDES_V8_USB43_COM_DEC_START_MODE2			0x1f4
+#define QSERDES_V8_USB43_COM_DEC_START_MSB_MODE2		0x1f8
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE2		0x1fc
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE2		0x200
+#define QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE2		0x204
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE2		0x208
+#define QSERDES_V8_USB43_COM_INTEGLOOP_GAIN1_MODE2		0x20c
+#define QSERDES_V8_USB43_COM_VCO_TUNE1_MODE2			0x210
+#define QSERDES_V8_USB43_COM_VCO_TUNE2_MODE2			0x214
+#define QSERDES_V8_USB43_COM_PLL_IVCO_MODE2			0x218
+#define QSERDES_V8_USB43_COM_HSCLK_SEL_2			0x21c
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE2		0x220
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE2		0x224
+#define QSERDES_V8_USB43_COM_HSCLK_HS_SWITCH_SEL_2		0x228
+#define QSERDES_V8_USB43_COM_CMN_CONFIG_2			0x22c
+#define QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_2		0x230
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_0			0x234
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_1			0x238
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_2			0x23c
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_3			0x240
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_4			0x244
+#define QSERDES_V8_USB43_COM_IVCOCAL_CONFIG_5			0x248
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_EARLY_MODE0		0x24c
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_EARLY_MODE0		0x250
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_EARLY_MODE1		0x254
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_EARLY_MODE1		0x258
+#define QSERDES_V8_USB43_COM_LOCK_CMP1_EARLY_MODE2		0x25c
+#define QSERDES_V8_USB43_COM_LOCK_CMP2_EARLY_MODE2		0x260
+#define QSERDES_V8_USB43_COM_EARLY_LOCK_CONFIG_0		0x264
+#define QSERDES_V8_USB43_COM_EARLY_LOCK_CONFIG_1		0x268
+#define QSERDES_V8_USB43_COM_ADAPTIVE_ANALOG_CONFIG		0x26c
+#define QSERDES_V8_USB43_COM_CP_CTRL_ADAPTIVE_MODE0		0x270
+#define QSERDES_V8_USB43_COM_PLL_RCCTRL_ADAPTIVE_MODE0		0x274
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_ADAPTIVE_MODE0		0x278
+#define QSERDES_V8_USB43_COM_CP_CTRL_ADAPTIVE_MODE1		0x27c
+#define QSERDES_V8_USB43_COM_PLL_RCCTRL_ADAPTIVE_MODE1		0x280
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_ADAPTIVE_MODE1		0x284
+#define QSERDES_V8_USB43_COM_CP_CTRL_ADAPTIVE_MODE2		0x288
+#define QSERDES_V8_USB43_COM_PLL_RCCTRL_ADAPTIVE_MODE2		0x28c
+#define QSERDES_V8_USB43_COM_PLL_CCTRL_ADAPTIVE_MODE2		0x290
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD3			0x294
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD4			0x298
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD5			0x29c
+#define QSERDES_V8_USB43_COM_CMN_MODE_CONTD6			0x2a0
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_6			0x2a4
+#define QSERDES_V8_USB43_COM_ADDITIONAL_MISC_7			0x2a8
+#define QSERDES_V8_USB43_COM_VCO_WAIT_CYCLES			0x2ac
+#define QSERDES_V8_USB43_COM_BIAS_WAIT_CYCLES			0x2b0
+#define QSERDES_V8_USB43_COM_AUX_CLK_PSM_ENABLE			0x2b4
+#define QSERDES_V8_USB43_COM_PLL_SPARE_FOR_ECO			0x2b8
+#define QSERDES_V8_USB43_COM_PLL_SPARE_FOR_ECO_1		0x2bc
+#define QSERDES_V8_USB43_COM_PLL_SPARE_FOR_ECO_2		0x2c0
+#define QSERDES_V8_USB43_COM_LDO_CAL_1				0x2c4
+#define QSERDES_V8_USB43_COM_LDO_CAL_2				0x2c8
+#define QSERDES_V8_USB43_COM_LDO_CAL_3				0x2cc
+#define QSERDES_V8_USB43_COM_LDO_CAL_4				0x2d0
+#define QSERDES_V8_USB43_COM_LDO_CAL_5				0x2d4
+#define QSERDES_V8_USB43_COM_DCC_CAL_1				0x2d8
+#define QSERDES_V8_USB43_COM_DCC_CAL_2				0x2dc
+#define QSERDES_V8_USB43_COM_DCC_CAL_3				0x2e0
+#define QSERDES_V8_USB43_COM_DCC_CAL_4				0x2e4
+#define QSERDES_V8_USB43_COM_DCC_CAL_5				0x2e8
+#define QSERDES_V8_USB43_COM_DCC_CAL_6				0x2ec
+#define QSERDES_V8_USB43_COM_PSM_CAL_EN				0x2f0
+#define QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1			0x2f4
+#define QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_2			0x2f8
+#define QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL			0x2fc
+#define QSERDES_V8_USB43_COM_DCC_CAL_7				0x300
+#define QSERDES_V8_USB43_COM_DCC_CAL_8				0x304
+#define QSERDES_V8_USB43_COM_DCC_CAL_9				0x308
+#define QSERDES_V8_USB43_COM_MODE_OPERATION_STATUS		0x30c
+#define QSERDES_V8_USB43_COM_SYSCLK_DET_COMP_STATUS		0x310
+#define QSERDES_V8_USB43_COM_CMN_STATUS				0x314
+#define QSERDES_V8_USB43_COM_RESET_SM_STATUS			0x318
+#define QSERDES_V8_USB43_COM_RESTRIM_CODE_STATUS		0x31c
+#define QSERDES_V8_USB43_COM_PLLCAL_CODE1_STATUS		0x320
+#define QSERDES_V8_USB43_COM_PLLCAL_CODE2_STATUS		0x324
+#define QSERDES_V8_USB43_COM_INTEGLOOP_BINCODE_STATUS		0x328
+#define QSERDES_V8_USB43_COM_DEBUG_BUS0				0x32c
+#define QSERDES_V8_USB43_COM_DEBUG_BUS1				0x330
+#define QSERDES_V8_USB43_COM_DEBUG_BUS2				0x334
+#define QSERDES_V8_USB43_COM_DEBUG_BUS3				0x338
+#define QSERDES_V8_USB43_COM_C_READY_STATUS			0x33c
+#define QSERDES_V8_USB43_COM_READ_DUMMY_1			0x340
+#define QSERDES_V8_USB43_COM_READ_DUMMY_2			0x344
+#define QSERDES_V8_USB43_COM_READ_DUMMY_3			0x348
+#define QSERDES_V8_USB43_COM_IVCO_CAL_CODE_STATUS		0x34c
+#define QSERDES_V8_USB43_COM_PLL_LDO_CAL_STATUS_2		0x350
+#define QSERDES_V8_USB43_COM_PLL_LDO_CAL_STATUS_3		0x354
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index da2a7ad2cdcc..e4060edc8138 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -32,7 +32,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v7.h"
 
 #include "phy-qcom-qmp-qserdes-com-v8.h"
+#include "phy-qcom-qmp-usb43-qserdes-com-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
+#include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1


