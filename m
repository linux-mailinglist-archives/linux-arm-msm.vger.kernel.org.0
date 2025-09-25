Return-Path: <linux-arm-msm+bounces-74988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EAB9DCD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28A44229BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841242EBBA1;
	Thu, 25 Sep 2025 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIIQHdeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622212EBBA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784008; cv=none; b=A5g3O9BOTOfVNt5cBcSx+f9h0G2S8Dq1ymQnF5K5wVqTD5CtmDdSmVcnTCUQ3sngG74SAjCdrpjAGUneaQm0+rLMFBe4HkrIryF5TFzwpYj6GBnY+WkUXiQVIO/wh4+Ne7lgdJ2QQA4U8huw+91b9t2DIIVnni3mB0W7mFOZu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784008; c=relaxed/simple;
	bh=VIZJdNuCX4SBnNGr2JhB21QyKavphQzYHQrIztxMA0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zj9ogyEH7XwW6nr/WWhECZ1vkv0IE9ONGM5/Kg4q7olLt1MYzadnF7IBp6PZhOL9aNkZAZLfGaqHZRHdpj7hmlS90Mi5SwMY++Ag/hF/yUnxQxJHGD3qXFCthcAZ+KUxfB7H0d0iB1FyUSHdnHkQph5UeO3AUbu6/1/leCcwKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIIQHdeL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONr98C027915
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nq7tHe/K3BXRwm28LNF3Z7zbn25bSpCYEiHNgaH9VVc=; b=eIIQHdeLm+0bA26V
	RZXwXmFXoIEvX0rJoKX8gI73N/iFqRcKGTsLup2UeHLb1L3fcGr11+uowmxhAjuV
	tVSMsqI7h/sCOYHstmy/YGVYPkOJwD+jUjQeylvGl3MPiREmTR2hUT7ln9svGG+0
	ryJ0wFqmzDFzz5yHYAHzjJq/+0gskBofJx4CJq8bTYCKcLoBWtGi/AMnt1H5qW1s
	NqrcgD13wfEPppxeMgCp/Bm/3GKTOen7JaKUGHDK2ODUjLUD6ctYBEJUC98yGDg/
	UdKuLnvEEtqEY42j0F1bG3svk8l3jTtHACNhotUHH/cKAZai5zgmo4isME6Ee/VM
	kiLQIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnygb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3308c669152so189539a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784004; x=1759388804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nq7tHe/K3BXRwm28LNF3Z7zbn25bSpCYEiHNgaH9VVc=;
        b=hIegkRhohz+tegdgqJkWVgH7zZiBpJ5Prh3c9TMcsTxXNbV7X49sviLb2hTBACs60K
         L4JQj5wNsnzu4eYKVfBaG7SKwDiGO2ZEEW6Yk31QEUeCTDDgVVbMo2GAkCdLm0BomyYK
         igAjy0VDAT3aDnhDC9Loj3BD/lo8aEVMcPzgRik20sjCZ5ONXpv5KDl7WlpS2vuugVVV
         AP47kbVvHNC7mdb9Jq+yVkTiOM2Cnh4xWq+OORVpUfFhZR/uljQHOXxa91PDpNGBBOLE
         30lYsLclkuYgFurASIBpcqKSX9V8geciEyJK6stVsxZOQwuMCq5zTk9VK/eUYxmh5pQN
         nIQA==
X-Gm-Message-State: AOJu0Yz7EsFkkd/p6J87g2arp5DHDRwV5LrfKFaB/JOmCjolzLHnw9Ph
	01yCn9hfwLsgrc35NHbT0jnPXsUdxZqJAYfxtHq03laPOhevrE5VLf74pj3G4CvVbSUGAYrEFuX
	G7FoE5+weW7byMjtabRrItBWxWZCU2ZA3rBk4hy89d5XJDySftEeOJJuXN1h9PMuA2aiA
X-Gm-Gg: ASbGncslaWW4z7jWo/8N/1ZqK3XPlHWbX05ZELCxcdJhbedtXHke8Q8NdUIe/USDlbR
	Qwj+riuwQ/ohBZkK+w8fLkspx6THLE+VEHhi+fgOGRDkt2qg4AsabogAtFiONc/uuNAyimiRl4j
	b9leWd7326UalpdICVEUxik1HzOmUVTP7xFvEu4ir0SkIdRvrsvLoyDbb58r55I8ZmU9f8+MAhv
	WOd0/HeNPDnFz7ibsNmux3oMOatJDTG4WH7q8kxwY48ixuYpeOQnVv8UO47n0Jzeo7Q9Lktq/05
	Ie7Hjj/tGYxpLSMPWSo9eaf4NJNPowhT/NnUtgwGIh8qRE+kRDtNKcGAiwGnq6DWqJ5N8TQr7B+
	4w+TyY69j1T0GNSQBKHFuE0nCLxGWsBqmoT7rTD6iSMSo/3cGOY1VEMDx
X-Received: by 2002:a17:90a:e7c5:b0:32e:731c:4136 with SMTP id 98e67ed59e1d1-3342a2f27f2mr1344983a91.8.1758784003549;
        Thu, 25 Sep 2025 00:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHROaNOS5ze3mvteEdHf7VQzVPRDDOq72g58ePEbmibjvzo/7ewQP7Py4pwFmi5u/iYY9KIQ==
X-Received: by 2002:a17:90a:e7c5:b0:32e:731c:4136 with SMTP id 98e67ed59e1d1-3342a2f27f2mr1344950a91.8.1758784003042;
        Thu, 25 Sep 2025 00:06:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:06:42 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:58 +0800
Subject: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
 and DP mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783911; l=17013;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=VIZJdNuCX4SBnNGr2JhB21QyKavphQzYHQrIztxMA0I=;
 b=Q/z1O6uF4hIt/3z1nUWXVwzE46QgWx1SqHihikjtMMbe76eP4tDVkQTA9j0BIJuoXLsizcfip
 4QRMCapV7qlBcu+Lgcy2LS1WoxTRMt65A1bXaSVKjkEdpjuIgoF+r90
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4ea05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=shGh-05uZheFR9ghjlIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5Pd-13PjWyGpVmk4Y4xiS8wrgQXLpOlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXwTpg6oFgBoEC
 +0YMFvz2f74TfcjSRJNengAls206jkoSwiQzJJRpkDMR6zIhSExaVO3+/J2TJ5Dz/BaCQMULMWi
 ePR/OyTP9ETH246b4FAh+rFKNxm/Ham8sWuu0KAyEwtOI6kvSK48TB8HghX+liF3bwl+/ggviSq
 W6zWyUblzvS2EWqC2tBA8pDJnQO7gPzzTVG6bZ3PNX024orknLa59Kk/Rnfp655lUI10xXKnRD7
 9laB7Ic7NRvaubSZdZ7d4Hj2IEcIILEpiCURHRsYKKgi72uB4xrJJQ0QaVmzXR5VQ8ioc4wzele
 QnaxouxgBy3An6w+HU9hcFXcA7Ei2TmcVqkJ/aUwqIsJ2eC9kwhLOZCSdHkli1AcIjIf8RczGuV
 xOjrhshA
X-Proofpoint-GUID: 5Pd-13PjWyGpVmk4Y4xiS8wrgQXLpOlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Add QCS615-specific configuration for USB/DP PHY, including DP init
routines, voltage swing tables, and platform data. Add compatible
"qcs615-qmp-usb3-dp-phy".

Note: SW_PORTSELECT handling for orientation flip is not implemented
due to QCS615 fixed-orientation design and non-standard lane mapping.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
 1 file changed, 407 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index d84bf68940043bce13565503bb34796e653adbb7..488c3812d84aca927ce24064fb79c03817ad1a24 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -30,6 +30,7 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-dp-phy-v2.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define SW_PORTSELECT_VAL			BIT(0)
@@ -289,6 +290,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl[] = {
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
+static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),
+};
+
+static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qmp_v2_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TRANSCEIVER_BIAS_EN, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_INTERFACE_SELECT, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TRAN_DRVR_EMP_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_DRV_LVL, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
+};
+
 struct qmp_usbc_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -434,6 +515,10 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -459,6 +544,34 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 	.rx2		= 0x800,
 };
 
+static const struct qmp_usbc_offsets qmp_usbc_usb3dp_offsets_qcs615 = {
+	.serdes		= 0x0,
+	.pcs		= 0xc00,
+	.pcs_misc	= 0xa00,
+	.tx		= 0x200,
+	.rx		= 0x400,
+	.tx2		= 0x600,
+	.rx2		= 0x800,
+	.dp_serdes	= 0x1c00,
+	.dp_txa		= 0x1400,
+	.dp_txb		= 0x1800,
+	.dp_dp_phy	= 0x1000,
+};
+
+static const u8 qmp_v2_dp_pre_emphasis_hbr2_rbr[4][4] = {
+	{0x00, 0x0b, 0x12, 0xff},
+	{0x00, 0x0a, 0x12, 0xff},
+	{0x00, 0x0c, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
+static const u8 qmp_v2_dp_voltage_swing_hbr2_rbr[4][4] = {
+	{0x07, 0x0f, 0x14, 0xff},
+	{0x11, 0x1d, 0x1f, 0xff},
+	{0x18, 0x1f, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
 
@@ -531,6 +644,51 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static void qmp_v2_dp_aux_init(struct qmp_usbc *qmp);
+static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp);
+static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp);
+static int qmp_v2_calibrate_dp_phy(struct qmp_usbc *qmp);
+
+static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qmp_v2_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v2_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v2_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v2_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v2_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v2_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qmp_v2_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qmp_v2_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qmp_v2_dp_aux_init,
+	.configure_dp_tx	= qmp_v2_configure_dp_tx,
+	.configure_dp_phy	= qmp_v2_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v2_calibrate_dp_phy,
+
+	.reset_list		= usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
 static void qmp_usbc_set_phy_mode(struct qmp_usbc *qmp, bool is_dp)
 {
 	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
@@ -589,6 +747,244 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	return 0;
 }
 
+static void qmp_v2_dp_aux_init(struct qmp_usbc *qmp)
+{
+	writel(DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN,
+	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
+	qmp->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
+	unsigned int v_level = 0, p_level = 0;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	if (dp_opts->lanes > 4) {
+		dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (v_level > 4 || p_level > 4) {
+		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
+			v_level, p_level);
+		return -EINVAL;
+	}
+
+	voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
+	pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
+
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
+		return -EINVAL;
+
+	writel(voltage_swing_cfg, tx + QSERDES_V2_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, tx2 + QSERDES_V2_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx2 + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+static void qmp_usbc_configure_dp_mode(struct qmp_usbc *qmp)
+{
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	u32 val;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+
+	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	if (reverse)
+		writel(0xc9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
+	else
+		writel(0xd9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
+}
+
+static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	u32 phy_vco_div;
+	unsigned long pixel_freq;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		phy_vco_div = 0x1;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		phy_vco_div = 0x1;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		phy_vco_div = 0x2;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	default:
+		dev_err(qmp->dev, "link rate:%d not supported\n", dp_opts->link_rate);
+		return -EINVAL;
+	}
+	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_VCO_DIV);
+
+	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
+
+	return 0;
+}
+
+static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp)
+{
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
+
+	/* program default setting first */
+	writel(0x2a, tx + QSERDES_V2_TX_TX_DRV_LVL);
+	writel(0x20, tx + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+	writel(0x2a, tx2 + QSERDES_V2_TX_TX_DRV_LVL);
+	writel(0x20, tx2 + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+
+	qmp_v2_configure_dp_swing(qmp);
+}
+
+static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp)
+{
+	u32 status;
+	int ret;
+
+	qmp_usbc_configure_dp_mode(qmp);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp_usbc_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qmp->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_C_READY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)) {
+		dev_err(qmp->dev, "C_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "FREQ_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(0)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PHY_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
+	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
+
+	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
+			       status,
+			       ((status & BIT(1)) > 0),
+			       500,
+			       10000)){
+		dev_err(qmp->dev, "PHY_READY not ready\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int qmp_v2_calibrate_dp_phy(struct qmp_usbc *qmp)
+{
+	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
+	u8 val;
+
+	qmp->dp_aux_cfg++;
+	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qmp->dp_aux_cfg];
+
+	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -855,6 +1251,14 @@ static int qmp_usbc_dp_power_on(struct phy *phy)
 	void __iomem *tx = qmp->dp_tx;
 	void __iomem *tx2 = qmp->dp_tx2;
 
+	/*
+	 * FIXME: SW_PORTSELECT handling for DP orientation flip is not implemented.
+	 * Expected:
+	 * - For standard lane mapping: configure SW_PORTSELECT in QSERDES_DP_PHY_CFG_1.
+	 * - For non-standard mapping: pass orientation to dp_ctrl and handle flip
+	 *   via logical2physical lane remapping.
+	 */
+
 	mutex_lock(&qmp->phy_mutex);
 
 	qmp_usbc_dp_serdes_init(qmp);
@@ -1601,6 +2005,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-dp-phy",
+		.data =  &qcs615_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
 		.data = &qcs615_usb3phy_cfg,

-- 
2.34.1


