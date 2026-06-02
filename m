Return-Path: <linux-arm-msm+bounces-110774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DIlL1SgHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:20:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57162B4EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94AD8310B99F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC783D3326;
	Tue,  2 Jun 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4FyJKhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gikU9Spe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DB63D1712
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391438; cv=none; b=uPcBlq+UdE2vhtZ5x/AXr8/6fDSiJvHcmXO1yVGPuV0BMDCl8fUYk9jX3sPCnA7nJEIrSa2AZLVf4fsarVApT31qnF2S1ONr1VQ51HWXJAtgBxXjtu7/6Z5jbc4RNaX1YHmjSyp8StpXSzm6sXA8+i4DlizJrlOT47rGJVLa8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391438; c=relaxed/simple;
	bh=hIXFjGJV9u8Y9/EO0hd2TJprDVSZw9D57cwSKf776LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mL+w4BBo4iJz+G3aCm3yoZYS4Tl30kLLKnam2YexxAaZSZPl4tX1IjE2c5hsoHfU5kPTNTF/eZ15dyH1Xoye0/JAc7M8UC7CCytbK5hC6niztd/0tlmj+WepHAM/JODYCcli0SOT8iiN9VwS+ec3sD4Aud6qRspoMdvEr5G5+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4FyJKhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gikU9Spe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525ioE81316241
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76/HZ1EhWAZgqo/BOit8cbAJgvhjbjJhA+ZnDoCtuOc=; b=d4FyJKhmo5hJCNal
	kO+LnMjiweO0IrXQ5bmFD+SiA6OJPNNI5+1ZRMyvJfQsmMCNWFF0o2A7hM2fftJc
	rksv0KT9w/SohsEeW5fZ30/7tC7JLjhXJX4yasYqedSvBLtfEqmNilmvhWaeMz2m
	DKjjJaBjWq6ADUURBtbEcatqhsAiB94N6nhH3oWOW8kIm4J9v5Lhanuwzem2tmAq
	m216Hg0xeSBzb7lbpu5p0uo7csWCxyUSg7kpILaQ9ltLEdG0v4BZFUhCPbXB6Yln
	4cZnGDoeKdIRaKVEwYvjAMCFeHwgtkAHsSHeEtliAJiHzaoFartF/Qc3boIZFYsX
	+1kxYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vru7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:10:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c20f7581so26268895ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391433; x=1780996233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76/HZ1EhWAZgqo/BOit8cbAJgvhjbjJhA+ZnDoCtuOc=;
        b=gikU9Speavwyz4LNLsrIoUeJuXB/1kDziVBWpSN/LuNrn8ORtZsxKkYwCnBriTkO1W
         y9LnQtsKilv7xQLi0eZWCynYbiQarbNaIqqvJxyI76fPKsr7HyH9sKDVSoP8Dv8DDhre
         P/R/R6GJFj1Mtaj0507sLZPM0pVZEF1dHi6J/bfJ5oZlnXNFL7ifEp5WXXq88vNUWuir
         oLH+rM+EauKJEd/XhO9yeF9fE0LeBAaVCqCRAJxHJkVmQQfcxbPvnADlAGgmrNAVzyNl
         YXxY1e7K5bDEDGIF0eJbdYINswS3H/IL3kC7H9lzG+X63TuQniVSX565wiRzrGTjcJ1s
         v6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391433; x=1780996233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=76/HZ1EhWAZgqo/BOit8cbAJgvhjbjJhA+ZnDoCtuOc=;
        b=da/fqnoxWIVXqileeBPTqKISFrmjm6QXFm9Uw2EDHj0nMCToo85qdSEZHfa8OOJUxU
         +H5jKz+2Dj4Tbo7MpT+AcGHfnRej4Yw+Q/1ffVFVHiXN2tcjVXaOa8xgOmIOZAiMBav5
         umuZ35N2AO9ZwRZ75j93Hkba910kxFny7MhXGMwuDy6mghGRrleULdv0VcTEQAhOxKwt
         xS2fYbt7DYpaVWbI1oIvCwRzZm9/rgbxoOPWXXZSTEUyzb++Rcq5v+3rwbIR8t2eiHfE
         TpFCJcUOMXcp4LkUY7xwD7PFjEefvEvSPc+bsvky6C1ykl4uqxat8baG7JFXnQFL/8Q8
         UukQ==
X-Gm-Message-State: AOJu0YzzLWggOToNpCYGfgN74OGzsFLU4M+PA9rM7daiuH8qRDNXB9R4
	aypsXDqarcDYUQGZhnJ3qJLJcW2HnjXIw9hwOnh2FgesdzBdELYkC+hxYZ4JVxo8LgAPo3BLQtt
	8VYdOlcKcjdErFbalb5TpH/y6AFr8l/kFf4khVPy/zF/puZGwKxBDZyq6JmVUv+/whYxl
X-Gm-Gg: Acq92OHyuztOGF7rG1/IAkF9nWdZgpEk30QACB00STfAuGc9ILmO0zmRF2JYfpuYGKV
	zeRdYyHRGY1O2jYy6aBgoD2L8sI71T5Y6qdLiNKXb+IBjHXOMdgnDgiD9IDZAB15u5jKJ1+tMd8
	nmiIW6gvGfs/KaEg6qYtFqSl5A+R+qJmBzqZXDLzRW4jRLqSPVY5g7FobUeLFeaGfWay/KYaR5K
	q+H+MC9/N0uCMHxSylQnyRR3Sijm7m4jkJVpDgcicW5NbafG0NLxYp23XPJZ1s+vhBS7Ube4Gz/
	PH52bWIVZN746DNnSRjID3BdGfdn0zuKDPrdPWHL1P05FjR51qVpdB0t/8lrEPUW6iublU8q/rU
	+4LcI63DTCfx3FU9Vnyw/sM0f5YpbTqhWgC3EqFsj1+oqXkJMSybB1aVb1ENOtha2lAawEBCTZk
	wO8EkxbVzzTZZKcuW7JCNC9vUcmHfmH6H6PyIxqpzh37DXfrfNfPe2jOV3ivPoN/SImik=
X-Received: by 2002:a17:902:ea0b:b0:2c0:d4b7:5d2e with SMTP id d9443c01a7336-2c0d4b75e40mr95726815ad.19.1780391433146;
        Tue, 02 Jun 2026 02:10:33 -0700 (PDT)
X-Received: by 2002:a17:902:ea0b:b0:2c0:d4b7:5d2e with SMTP id d9443c01a7336-2c0d4b75e40mr95726465ad.19.1780391432644;
        Tue, 02 Jun 2026 02:10:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm173007765ad.7.2026.06.02.02.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:10:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:40:18 +0530
Subject: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: EYH6DFhRQRq2llUmBqaUWJRAm8ToWbbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX7OjUNAVfZhqe
 FaPRSOxavqj1zFDRjwIL3Uk0qsa5+HRF4Fv41g0GP8Y2MVhFsc6w+4f+vW59RccEDLXuUstDH/t
 8P64cwp5q+7R+n0ZeGlCXOyD3hZqjxUAVXVq4xs5o1Ego3h0Lqekpryf6jRbijKYY2dJuJjDs3C
 3NnAJXBXeyAJ+Pe6ivPdanc5taTEXJHdlSDlfUkmtlBnrcM4oG+3W/ItbwjjPj3IgKJZ2712GUZ
 TupX9VgLliLcXLgqJs9hguawF+9Sq87aU04m11aoi0s8mEc+ZwCP6nWLcLGeANTUWvlMRm3eK9r
 fv2Vi7j6c8d8FIMyj3uOoDcrK+V9E/CXevcLjpE3DZX/tGxiaMSOXMHiyCdJXJTDFwPmW2sAedJ
 c7v/ILUpYYMAwyU0mYoc6/BX4anLrmBX6Ee5bj+0+WGFM1TCUnlnYqVKDDeT13dLfuBibfr5iS2
 9THc/fVA9PswnEaSzfg==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e9e0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SzMj-Qgm2C8wWq0MGEoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EYH6DFhRQRq2llUmBqaUWJRAm8ToWbbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
X-Rspamd-Queue-Id: 1C57162B4EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110774-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
1-lane PCIe controllers. The PHY instances also require the on-chip refgen
supply.

Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
refgen regulator supply.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 75afbd15aaf4..459e54c2b60d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -751,6 +751,152 @@ static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xb5),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_LSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_MSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_POST_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_MAIN_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x67),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x25),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0x77),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x1c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG2, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P2_P3_POST, 0x34),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE, 0x33),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_POST, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+};
+
 static const struct qmp_phy_init_tbl qcs615_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_ENABLE1, 0x10),
@@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static const char * const ipq9650_qmp_phy_vreg_l[] = {
+	"refgen",
+};
+
 static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
@@ -3421,6 +3571,14 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x1 = {
 	.rx		= 0x0400,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_9650_v4x1 = {
+	.serdes		= 0,
+	.pcs		= 0x0600,
+	.pcs_misc	= 0x0a00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x2 = {
 	.serdes		= 0,
 	.pcs		= 0x0a00,
@@ -3669,6 +3827,62 @@ static const struct qmp_phy_cfg ipq9574_gen3x2_pciephy_cfg = {
 	.pipe_clock_rate	= 250000000,
 };
 
+static const struct qmp_phy_cfg ipq9650_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_9650_v4x1,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
+static const struct qmp_phy_cfg ipq9650_gen3x2_pciephy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_pcie_offsets_v4x2,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg qcs615_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5419,6 +5633,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
 		.data = &ipq9574_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy",
+		.data = &ipq9650_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy",
+		.data = &ipq9650_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
 		.data = &qmp_v8_gen3x2_pciephy_cfg,

-- 
2.34.1


