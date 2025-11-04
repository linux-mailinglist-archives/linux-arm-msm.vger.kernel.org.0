Return-Path: <linux-arm-msm+bounces-80256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB96C2FBD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C4314F3F9E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456A5311954;
	Tue,  4 Nov 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ux5VKHro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIA2Rwx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B631079B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242995; cv=none; b=oR40XxUvL+cY4UH+qePycJXY4oFG/bOtOIKqObeSnc5rFWagf4mYR4hTvX7Y+tdnKdHns5AajN68j/YbRRqltFHe6cvfmvhZ0ySMkOU/KuenVH1mDrrYY5L9tLdlEBNtHJCharS4Zr/982Np0mmhayVAmkbnM0IzYDXosVRpizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242995; c=relaxed/simple;
	bh=zt/h1GPrcku6VfCD1Z2xF2fCFX7fT2M31PCFfCnbMWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzDS6fVQW6on2F3ABqap/y7C7F4QlspZWxqMad38/NloMimGJLrejGukY0TTrbMgdmDzR5dmSlHLh5qlbIdHJCAL7sT4upbdsiSqMcAezOAlePs9J/Ef2qXmSAw/2qzEL+DNPGc0k3q6kigSYYqBkF3XWwh8tA8dffJ2rg0o3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ux5VKHro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIA2Rwx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A45HD7e1061186
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36rRRJsb8die6TTtLLHxpI3oG8UeacOGLRFgDPbnS9E=; b=Ux5VKHrowjSzFGVd
	8RbnKGrH08ze39srzgQOVAcXVsirjiq6VDbXmFF2rqFkSGxt7MMo3BYnTpSFA4Sj
	FSeDGlzAAYALT6nxLzNV05F1TNs2Uim/sr0tEmVya9ZuQlL3Tx+For52DVUvl4I8
	ZRavsHyaC9O61y31OY3zNSRL/6y9ws0qMbOfO8XpCHXB0AN1WPGP9bJqMUgjiJTI
	l4VFumi09iGGPFK19wqLVjJcNvOCDVfXBdPENht9MF0KTMcz3sMiWhVrtqttxYKG
	0VnxJdvvfwFyUiPNizxTMMTt20zuUmIpzPTeZZCZL8cjg3ZtCJN7ZehgHjmXYZzS
	Dvz5nA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7b6prdf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:56:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9939dc50e7so1897183a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762242992; x=1762847792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36rRRJsb8die6TTtLLHxpI3oG8UeacOGLRFgDPbnS9E=;
        b=MIA2Rwx+zZ7DdxTpD9lMCKevZt3ruRFYLoynlpBO8l14Ns3SvoJrQLV9qnTW3Sm0G9
         hfEDFXTIVP3/EdbZ6DaH1pCrOc7UdARpKR0uzed3hUa5HcJQzGj6vIIJYCKq9ts7c+8n
         lieF8FE3nTZPRsu8wNaHB6s53iR4l6WUgNgzERJyqMBYZGbrWpLvmsRF/lWsmv/b5ufD
         V4EswxIl6Ita8ffvqsizip6GY1pf0ea78UK8+10rAJItb1LIkKH4dGkdXJNsRHgFMLI9
         VQ/6gPhADIHXRCb6fTsK55E2d89dKM+3KufufsPvEtwXJWJFJj2AobFGltfVrPxmt65z
         e2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762242992; x=1762847792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36rRRJsb8die6TTtLLHxpI3oG8UeacOGLRFgDPbnS9E=;
        b=pnqcNOUcdvfiQH8FWOQiN9JD2lmVwngXjaYHl0a5qdDhzhCg4TL9jkS4vzs4CGhWrC
         44HC+z8In3PcLk/QRKcqJnIgvTBit/U3rFKWVAy53GGqtSCfV4GS2h7C3/6XgQH4jsSg
         3LYrtnPSSymsXqCNNRYH/htoSRFuE0P77wNVnQk00zRr1t9tcQbku3l8fUNZFzAERNI9
         beCazfBh2/FXtIpSttFfy/Pjydjyup20tn7Tm08pp9dEsIsopwUvLVWtKgYCMJskxoz1
         frqe0+aNtxnduxYvumQy5Tk/24uSCXfNfLAvqAyNIfq+bbV4iIYYnZAHLkYTWDTBpPYF
         QhMQ==
X-Gm-Message-State: AOJu0Yx+rMAPJHtTTkN9o2xipp+2zybi9Ux9VPgTiOj0ff96/y3B1BYK
	TCKPIe9q7IajrUYwX9xAt8Icr9BmuDuHpD6nu7H2P+u5uBUc9JADDIBram64c1jeMSmqJ97ZG19
	cON3+Cc7F9FcFkgNQ7olivAYXHLcRPHaYhQdypfVC+7us9hUyhSrnXt3YHd1uLfhoQPVJ
X-Gm-Gg: ASbGncuQTzDOZK/1XEsrqya7oF6RWK4EEvobu/PMeraI2j8iMgqD/X46642qx22i59F
	dBtMU6OWbCTw1R4zc67Ds+ulZIj4+NH/wsY0Obyv2lAsQlA9dXzfW94Tqq7fdVzgWvSGKcXNETu
	MkE9whL2+Ot/P1BYT2Y0TFSDX8IYQIyXC3Jm1H+riEgPOEbfgX4YQpZSMIaErZGds8CGu4oL+7l
	XdCn/h9fcmzoTvWwmLf8mGVDT+mHiCuMA4sP+C/WVRY7RaGSsisHDr5tay2v6O/TwSD9UHZebiq
	uP0+qo93RwD12AayabK5UrnSPLvaovui9aaLIBZYwrZtParL0UzX4RXwbe8RAyteCtrjsk9eFgt
	k66/Qfp3A0kgZkA+ZSXDupz0ASDQH5nyZUOE1xOi+T+Ja/Q==
X-Received: by 2002:a17:90b:3891:b0:340:c179:365a with SMTP id 98e67ed59e1d1-340c179451amr14114066a91.0.1762242991909;
        Mon, 03 Nov 2025 23:56:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETspjX1zfLO79dug+X80CLuKL5y0H5UZzcdJuKRXhbJn8V/01XyYLjgtnScFuA8LhmepwgcA==
X-Received: by 2002:a17:90b:3891:b0:340:c179:365a with SMTP id 98e67ed59e1d1-340c179451amr14114038a91.0.1762242991380;
        Mon, 03 Nov 2025 23:56:31 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a16652sm3627951a91.20.2025.11.03.23.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:56:31 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 23:56:26 -0800
Subject: [PATCH v6 3/3] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-glymur-pcie-upstream-v6-3-18a5e0a538dc@oss.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762242987; l=2929;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=3I4+Hh02UK/6hCXFAJiGGjbIJsRvaSQpVywV9Q7zV1c=;
 b=Yy0wCNKoMhHH5+bQwNBM44G+N0KLCCONobdst6FmOH8rDTGtsbP9m10SSMTJLjzkyWK7f3zOv
 ljg3VAf21cLByVHntHv+oCK2C7W0VY280ExOKcxYAjx+vJ8KHssX0cZ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NCBTYWx0ZWRfXwWW6TR651UHn
 mDYxrdSamu+tdgSS72/8o7CigpnKwFET27GmSqwexFFuWm8EXRjljwIjSp+mCWKL2wkKmkW5mwE
 uAkB3ohSSnqJVhezEDHbe/O3eV9temJAs4zykfCa4XLzWyEbV8hkFXXH+Q6eRK4WcC+DUQuHAJV
 D+/edLk2KZm+NuOAy3WD4//NTv0xwO3r3/3PlI/oYJMUTEzThoalJ56hY1J1VAxFlLrVmHdtjl+
 0drDpR2LbedJ/Oc9Kc3mOegY/3kjJhzXuSTZopnfFn4tpM0ZSZfDq/4ZZm5w9MPjO+LOe+6+bUV
 b5/EGXj9F90UJlIf7XqFUkLtLuA4q76JbuWUWls3TGQqxRSVgU2rqK33y5C2NIzN/F7xv3Fa2w3
 fkpArJmGkklVZAJSaJbK/zU8EWVFUA==
X-Proofpoint-GUID: gk_UM2v8kvUBILZavCE30t4CBm_Ky5FU
X-Proofpoint-ORIG-GUID: gk_UM2v8kvUBILZavCE30t4CBm_Ky5FU
X-Authority-Analysis: v=2.4 cv=Y4L1cxeN c=1 sm=1 tr=0 ts=6909b1b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=cXB1dxBGfnZZ65A63A0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040064

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 62b1c845b6275d924fa501ac64e69db5f58844aa..86b1b7e2da86a8675e3e48e90b782afb21cafd77 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -100,6 +100,12 @@ static const unsigned int pciephy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3072,6 +3078,7 @@ struct qmp_pcie_offsets {
 	u16 rx2;
 	u16 txz;
 	u16 rxz;
+	u16 txrxz;
 	u16 ln_shrd;
 };
 
@@ -3356,6 +3363,12 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
+	.serdes     = 0x8000,
+	.pcs        = 0x9000,
+	.txrxz      = 0xd000,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4412,6 +4425,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
 	.phy_status             = PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
+	.lanes = 4,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5163,6 +5192,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
+		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,
 	}, {

-- 
2.34.1


