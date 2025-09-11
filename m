Return-Path: <linux-arm-msm+bounces-73154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F26B5368A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B206BA079B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C85345737;
	Thu, 11 Sep 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msj5SvD0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13F32A3C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602566; cv=none; b=S1vH5Dw1kINL3rXGAwjng1orEC141mwr88zbLkbJ+C1z+k29X0VQrHvFxG1BTmkKcOyWutISAkFXbGiB0wk0pwyE2rm+5bE4xRhE2hiVcZd11WeULPYD+Ltv9NH+jWF+MoR1qpWu6yFR5WWXFKQNtfetNEatz1EmPiNpthaB0C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602566; c=relaxed/simple;
	bh=IRVPgoUXyANCNGRPiPsQa/uGGl1547F/NtoWdkxg/Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgAKxDuwX0mzh/Gbt8bN10M94vHfmZuvWe2zYherkP3hRCEXeAUkHAQxoA1++Feav/HIxpI+e446gCqtfKqDOznrg3QMxsLlHGKdwwjG8UdGXZ82xXgUHj3kGqsrwOZTp9NFE/seC/6dtnVLq76bODXkMZoWQfVRuIVu+d8iEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msj5SvD0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAGgmM002518
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLDYWZTCHqHFbgDMUl2J40aPsuz4Axbq7E8Axxnnj1g=; b=msj5SvD0oSApnrzo
	d5ju5LPjCKnh61zA6dU0+wJVYdVJ+AD1N+c/h+rS/fwtDYK40TxlCpqi0ofkcIcd
	Psq6MnJ1EwK22U4ZStrgNRrFGjt2UECNvw6Pb2UPYpUk0ZhHSV9isO1s0VzP1RYS
	M6Ix7H21iGKGxwhgscfOcKGoyiH7aaLv1mXUjntNiqyiiaWWgdo2lV6EfhCUOKuK
	Q0NPvaJ+lqJqlpyolxadqQlpi2sLE2rM3QYfymzhfrEyIWOtOAN+XKEuuXfB5bet
	o7v4g9KNK1pO0uA2oXUv4xFzMR4xrzlmTatixhryklXx0QdXeJaO5VwjJSd+Hxsa
	nupXaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8r772-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329976ff73cso214074a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602561; x=1758207361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLDYWZTCHqHFbgDMUl2J40aPsuz4Axbq7E8Axxnnj1g=;
        b=M8V/QYYbdEzqBpsw50YX4SCvjR4nxoDXRQbWFBhqgFFKXO/hTIynJsMUnwK/w9X4DQ
         sl0SHhQz/ehGHzVDxUaEbxb9NVE/+BiomnygCwtrdzPGpwN/+OKk9uWvjVGxpbXS4QvL
         Z33odKxismYRgBUCXpp0JwH165hNywRWhQlgUTyw+6rgnOfeg17BxRZvfm6Jv6lvQ4Qc
         MKe2pTYsHSiUDGE+uwomuFOGu1nNBfw82RddEvSKoNOGqLx3QMup74GsY8qQRnGT6P1x
         TRkb6wYcACCyB+odCQYnCjU4c8CyCCet18QUMfs2HAdati5zxctdmDYmx4W1oe3bfO0V
         EHPg==
X-Gm-Message-State: AOJu0YzyF9qzvIjISd5X53mG9GQCobnfi9exdbJz070tVoR0gWiGVJN0
	knVU3xtyeRI9G2deZW9iy3jJ1djEYTX995GpDNHjYYitaJSl4XoLD3ZejyVxPsP7E0qimn2aOLa
	V/yHbVJPYg1fqWsa2bdfDqsW6eoo4yIS0mq+rtApOyTRc5R/dqHwKURnmHPBgl4PXoxSZ342gZD
	kW
X-Gm-Gg: ASbGnctfsPBIxLreh8omaPLUbrSYSkt8DShbBSiVdy3EtqKkQjajL8hrJLRyt65kH6Y
	yWx4aDG4w4brLyEjpxqLm5RtVaXzisyj9/lpYus7LAtBWR4EpjzOVIdZhAgjJFRwhT7eb40DTE5
	UbPJRDLN7ot2LXuOLVK0P78qy9ooITLGCFet/1oxoFFG48dlJrlwOlCbWAX9Rg4J564vY4hsHyX
	zWG35e2GhtdvD4uVMRYAGPcHgG9mPuQMuRZGDrsa5M3E1ef9Vr2Ci95Imdkk3lGokrjxIQY1v/J
	n/PRVB4VRNxEVWGOms15pxNAdL4ayRTsddVqqStB1Tj0+Okujw6JXQZLN/NGNYolPPB4aKiaVP+
	A4OUlHYoBncTA+VvqI/t0Nt+PYJIWTcn8hSvCuwa1s8ZyzrPY6RC36VSB
X-Received: by 2002:a17:90b:3883:b0:32b:9416:312d with SMTP id 98e67ed59e1d1-32d440ceaa5mr13621034a91.8.1757602561379;
        Thu, 11 Sep 2025 07:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGKq6Cy4JgwDFCfo7tqFlLOxydUnRrRb/XRHELppsskv7K6NQb5v+NxObcBeWqffwR9btOnw==
X-Received: by 2002:a17:90b:3883:b0:32b:9416:312d with SMTP id 98e67ed59e1d1-32d440ceaa5mr13621014a91.8.1757602560827;
        Thu, 11 Sep 2025 07:56:00 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:56:00 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:01 +0800
Subject: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=7744;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=IRVPgoUXyANCNGRPiPsQa/uGGl1547F/NtoWdkxg/Dk=;
 b=OryWGMA9lihNDO6oIk5RfVncPUsTbvkuo1u4tDk2/tg/Wc7v7D077T46SKKI2a9Tan9MOrNTn
 J7q6UiOJ8LDBwROfm7HKyeiu35MF4RehURhh+8QozwmAxlu94j5pvvN
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXz5B25hIC+sDr
 nYsF4JXmdMz4TIH9hMxEbY42Uf3K4AZywljfOOl8COUa9iVa9wtwzcr4oEKguhAPGogTpoR+I1V
 McHikPowEA2216d2/XU1dgwKjE/rvbUdb/AlowDVJDxwQ/mxSHxkjAZr6HugLNk5sQKkH1ARbM/
 SCufcJeG3shti0WI64YCGUpU6k4jXrf7frOCZyFemfEAxXWEd8FFiv7Nx627+IMA+0BO44/mUhf
 BBBwhX7VRmV0wzB0laJJZ2qzHEAjD1wbTR8NU1vnLHB7I1N+CyV5obWpW2UXQRPoIv1VhM9nTQJ
 Kg+0N02wp3bjCz29GJbZ6kCJGQKlWVahXFd6p3SwThSogvfIawU7EkQfUUljsMRrrvTO7CbFvO2
 oRZSPeA+
X-Proofpoint-ORIG-GUID: ZrfuFNVrE8JjyJpUFQwVxnYRCoW5vAWc
X-Proofpoint-GUID: ZrfuFNVrE8JjyJpUFQwVxnYRCoW5vAWc
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2e303 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nm05dWPNFHrtWLP4wFMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Introduce QCS615 hardware-specific configuration for DP PHY mode,
including register offsets, initialization tables, voltage swing
and pre-emphasis settings.

Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
platform with its USB/DP switchable PHY configuration.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index de28c3464a40ea97740e16fe78cba4b927911d92..791c7d86c51769bc9c7c5e1c73603c87fc71a820 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -284,6 +284,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
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
 struct qmp_usbc_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -443,6 +523,34 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
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
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
 
@@ -491,6 +599,36 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
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
+};
+
 static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1161,6 +1299,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-dp-phy",
+		.data =  &qcs615_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1


