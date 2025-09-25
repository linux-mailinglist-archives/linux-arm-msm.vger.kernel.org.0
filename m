Return-Path: <linux-arm-msm+bounces-74878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5EB9D2D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D34167BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869352EA470;
	Thu, 25 Sep 2025 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ny6c6cdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786F2E9ECC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767349; cv=none; b=eF6VXjDC6RdjjUwrkGTTBUn23raZ7GboDiZrvm7hwQ3DO4m4P+6g7Sc+zlbTslvGZjR+ZRBwAvJROC2cfpR7a+4z1ehZ3lsXusemKLN3veauXSVNfODOcx4ldBnid30qZpVlSivXcii9HYWLeKXtfwqS7P2k2LkvUHeh8uqzOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767349; c=relaxed/simple;
	bh=M+F1RTYsdhi0rwmQX4k0i167PbTsajPmpAbDo8wgkQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZTMkDNxSzL3tddKuxqRk7fOdkE+GEu3u4PqeDsDpGmqLitFUgXOEOYx61nzl3Mxcss6F2okSEdjFhMMFzo6dmHgqdj9CYzbE/qU8OP8SeB5KKMvDUB/qlbdn/N0+HxLaADY4P3qA5U3+czNti1j4gcrSyJbyTCGzK+Ed+qBEnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ny6c6cdi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0rXVW025092
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KWO/lwkQpV4
	tpn3eYXJvjW6U2FC2nJcaxiJwg7mxNEY=; b=ny6c6cdi3Gjh8Xp0UHx766rWP/R
	3bxTmgP6GJTZ/E+ECMIEcDN1jJz/ZY1PdrgLfLcQPHN9VbihtHKF3C2AaI/naMWW
	eu3dRd1qt/6qKXkbOzJ16tIgvnWil1toAMIQDsHN5MSJex2W3e0oKipaBnVLz5cy
	A0wweVRM8boY9NbavmWvpO0C34sruRNDIa45vuk8qTgtMnz/l+DehMtcJOHNndt7
	04Y/DWgHUerbFJEWtTiFC+eiK77HbSieXi/UF0cpUjptD4Ww+gIijPEZQnPnvYST
	g2ScmNs0REYts0JSuB9V1l3Vf543a6IHboQt+FqkHhfSG3v/NtlTQeDBuRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexrnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3234811cab3so453879a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767345; x=1759372145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWO/lwkQpV4tpn3eYXJvjW6U2FC2nJcaxiJwg7mxNEY=;
        b=CQXWwjqyEQzp7md7gHh1joGCT0XcK+WQC+v843Z00XORuy+IlQmuqbj9wW/H/dYcM/
         NIGfVj7JlOZmrQc17w+cXfrUXcs4r5r9u2lE6SCYMOUFD3yWeC1BHHn0u7m/RvCbde2e
         IyiXWl/GeXMaWdf0VnCr1t/oOFK5Zk2G0Vp/TVPSSWRdEs1e7zdpnQACOTVPoJMixQRY
         n/xYxDQLlamZAt/u/UacQnBFvLkN3oNqSeTE0AxK5BY0jjCVRoMp1cf+dW+cergWGPwk
         48Zd30T/hRc7RND9zTTSdPLfbaT6BNQPnk3NtHl9lRkjxabq+CPmcmbwpVQFi6zwvU8K
         NHnA==
X-Gm-Message-State: AOJu0YzZnoFvt70/deSkLoRDZE0LPhFxW9fg2xWNmCY8rckNd36WYYeG
	YREQ+V2UvCY59NGKzfZJ1ZMlSpdB6eOvIYoMJDIhAt7nguVBFc5BoUj+lbcjhjJNyLQA2x95Ad7
	DcGOkHvRXMGpFwlcDWOJKSPEEdgMqEcgcatOYKVUcZ1wmHvqGTeOn3LtDgua/RV86hBYA
X-Gm-Gg: ASbGncv/ZNP5OpZxbcGg8jl7CZv1COlUKo1gzl9kwcVp9WZvuBwxHyzAhWsuXHUdu6q
	RR6pi+C5O5u2151ML/zLu/Mh2EQ8mbfmoh3/ImSQRtXjUWRguPaE4oOpBbVtpPeDcXVoIeXJWCp
	grgzWq4vV+vY0SA228qIKqMfZUHLbUaB5p7uOU7gQsU8ICqO6YT1SJxb0h38HHef9oQ9v0Bjnca
	ywYMHnDT5U5MX0ex+ue4pOOFD6C2rJOqCmg4+YVG0caNvrq4xrzkwAUAvhid+GelSCPeA1zYj4S
	DpZMlEm54jls7VTRd5LU5n8pOg5fTS2A/kWr2eRYbIU1yWwa7LA5dlhk4PHg3gY99DIGRioT+Ob
	UwH6ztgzVeqPzgeub
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr2199732a91.10.1758767345092;
        Wed, 24 Sep 2025 19:29:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEZSTZEVQERX1hC29GXTHQcxwN+fwcyRY5juVn5dn1T4X2kCMoQGR3Sd5Oj9HhEhd76WTvfA==
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr2199694a91.10.1758767344407;
        Wed, 24 Sep 2025 19:29:04 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:03 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
Date: Wed, 24 Sep 2025 19:28:47 -0700
Message-Id: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B-uGZ8udbl5NhyrlGm0B8YdkYGZJ7N17
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4a8f2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nS7EEpYu-xNhaxMpzvMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX0fbAJQ+n78sg
 d1fCUKBGngoszEipy0RdfDvoh2/osOVuxgTjM1iDvGl+lYlEJrjd/ut1eA6pXwYnDBPZ/ZHV9/C
 Nqrg4onp2LRgX8oHYxM+XNHAvpQ7MGvNLkvM/nc7J1iivM02T833ujMbhdtFh2wGm3BitOl2hEi
 oxU0ucWuHjins0i5ofeOFDpAQHtKql9thDe23mt0BttQl6M9BoW9I3NmeRNEVlEUrVKG9RKWm/7
 kZ6QiSQpFKcLtndDynt/AO6TPDw47Uar+/DRrKnVhpjwtQZdx93rU1RCMqTf6eKjgy20TT3EAEc
 z6ojriC5Yh9uXwUxl7Ocmqkvj5d8CMuwIcd81FBNR4hw8OWPc2j/mk0OzVpdlQPfvmbay/haOAH
 nYaruI4S
X-Proofpoint-ORIG-GUID: B-uGZ8udbl5NhyrlGm0B8YdkYGZJ7N17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

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
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
 2 files changed, 314 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1caa1fb6a8c7..c972f88941f9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -30,6 +30,7 @@
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-aon-v6.h"
+#include "phy-qcom-qmp-pcs-aon-v8.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-misc-v5.h"
@@ -97,6 +98,7 @@ enum qphy_reg_layout {
 	QPHY_TX_HIGHZ_DRVR_EN,
 	QPHY_TX_TRANSCEIVER_BIAS_EN,
 
+	QPHY_AON_TOGGLE_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -259,6 +261,236 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
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
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
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
@@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
 	{ .name = "vdda-pll", .enable_load = 36000 },
 };
 
+static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+	{ .name = "refgen", .enable_load = 936 },
+};
+
 static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
 	{ 0x00, 0x0c, 0x15, 0x1a },
 	{ 0x02, 0x0e, 0x16, 0xff },
@@ -1791,6 +2029,8 @@ struct qmp_phy_cfg {
 	int pcs_tbl_num;
 	const struct qmp_phy_init_tbl *pcs_usb_tbl;
 	int pcs_usb_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_misc_tbl;
+	int pcs_misc_tbl_num;
 
 	const struct qmp_phy_init_tbl *dp_serdes_tbl;
 	int dp_serdes_tbl_num;
@@ -1925,7 +2165,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_combo_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "com_aux",
+	"aux", "cfg_ahb", "ref", "com_aux", "clkref",
 };
 
 /* list of resets */
@@ -1984,6 +2224,19 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
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
 
@@ -2528,6 +2781,51 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
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
+	.pcs_misc_tbl       	= glymur_usb43dp_pcs_misc_tbl,
+	.pcs_misc_tbl_num   	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_n4_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_n4_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_n4_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_n4_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_n4_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_n4_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
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
@@ -3024,6 +3322,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
+	void __iomem *pcs_aon = qmp->pcs_aon;
 	int ret;
 	u32 val;
 
@@ -3059,6 +3358,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
+	/* override hardware control for reset of qmp phy */
+	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
+		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+
 	/* Use software based port select and switch on typec orientation */
 	val = SW_PORTSELECT_MUX;
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
@@ -3236,6 +3539,8 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	qmp_configure_lane(qmp->dev, rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
 	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, qmp->pcs_misc, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
+
 
 	if (pcs_usb)
 		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
@@ -4258,6 +4563,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qmp_combo_of_match_table[] = {
+	{
+		.compatible = "qcom,glymur-qmp-usb3-dp-phy",
+		.data = &glymur_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index da2a7ad2cdcc..7211c71fe68c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -32,7 +32,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v7.h"
 
 #include "phy-qcom-qmp-qserdes-com-v8.h"
+#include "phy-qcom-qmp-usb43-qserdes-com-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
+#include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 
@@ -60,6 +62,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-usb43-pcs-v8.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

