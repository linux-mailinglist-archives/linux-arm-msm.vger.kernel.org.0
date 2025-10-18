Return-Path: <linux-arm-msm+bounces-77855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328FBEC3DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 03:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15C404E69D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 01:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EB9223DD4;
	Sat, 18 Oct 2025 01:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5n/i9yd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87131220687
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760751237; cv=none; b=hGIOGNuYrPK+eTCNSi4qv8o1oc6U3DAD9m5hFoRnThJl5AuTeuSH5jsp+vUWvTFsHj0LvK9QNtGPQsxs4JXUiRJhvpZhQCAPosexLLIKQFwbR04n+nza2XLeuOy8J2uSfKUxMlcEtgiIe6XCk0vDcc6pMnMVr5XlCs5AkUVOTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760751237; c=relaxed/simple;
	bh=FpDxHLlqUZ+XGHyViui56XmvYboqFqBaLMsyLmHrEjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dibLKleyHLJQYAS6BbZzhPUWKUmFagF0JnA0zDaWpZMgcQFGPeNPRrRw4MkQCAarxbimm4FLrv0Blh7ftBney4K//Ijfyd63FUKUbu99nVXOhINvllZk60VGO1f6bhhxpopYf5ktdTBtSXWMAE8Qc3X1H2YyiLuXhvUd5qlsccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5n/i9yd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJG8L1016798
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ul01yB/PmIF5rsEoiQYYpJP41+BqBJ4MU+FjnMDvYVQ=; b=b5n/i9ydwyPNRF4C
	mNwPiE/afJxNHr9XdkDxHnofotjPRlipfBXq30EbfqHwJ09tz3WMhUYDSn62HFLA
	sCSziuYYsXqdjFp55VSyb9yka5e1hPTsX5O2onngANc9DS6HHtQOluJHFUPvnBlx
	Dn3uY3cSl/TY7VjJyOphQPGfFXnJ/I/joYP5nY/k7GFcphWNGrWvQD0cGJMHIRlG
	HICjWA6cFIZY0v1S9ltoBmlgh4oHolmPbnLrGtHA7aidNU94BtqjhTv5g6V7HlT1
	gQhB+xjR7xct1E9FV5lmlcOwONY27TWOoLRP3xT51RGhV1Yf2jG/dyjUgCR0e1ON
	W6YyTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkp5hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so2168774a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760751233; x=1761356033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ul01yB/PmIF5rsEoiQYYpJP41+BqBJ4MU+FjnMDvYVQ=;
        b=WwacQxksOl7KNVpNVnP6GLWh8V0QcoJJTv9ERYT6sqkktdPzPQlCw4A6N5cTzqgL60
         ppKtHS+HoUBXrlDVm62o1zPT6RnCY3d9WJl37Cl0xvpyi/enH8I3Fn4cmSHTz1QMsGEr
         IKwWSgPFUMa6wRAL220dAgjKyOEaZM55Q4IArqCuFL1qLPpOb5+Gwf7iJCTWyZ8VmSLR
         N2B+tZ9txPIGln62+8lx2v//8ultISDk8metAMMHyzkDai0yEMkT0jK25A0EmWEEyULu
         XlQd647Z2ZxDuv29Q1xt8fbnt0YKbaCGPW8EBndEtxZIfppZebRcTWlS4RM/VjLvkNKs
         sfxA==
X-Gm-Message-State: AOJu0YxpxQSxtbyNbnRZY02IIhOXGE2dcHII/RMPtKRDemiLCTxEXxRt
	A5GUkC7Ig/ckGG0CEfYRhSHDVtLCW0lkZMJpoub4Qn1n5tftvpIjWE86F1Kwqs0GqEn8/O4iFUn
	xN3+A2cS3TVwZ6OEoZfPM/iOD9JiK+u10IM5hcq1kH5wGgfWT7WXVrKCQmEOoqp2aPUjn
X-Gm-Gg: ASbGnctC/RUqQS/7/s9TlAFMcTNJmfrdkAH7F4dKESrtDn6cz99NgZHf0V3gqJLJVeI
	6roNgAWyTMxs+bNWeNkTNN2R2x9Wci/p10/Sndf8ot0ly7qpiQGnfbvdAf8KQD5/Ut8nHMAIFWv
	wARjqfBPVbZyApzQZIhwfyUCmbwjqLI9t76BvnwXNqfzPntXjJHKw6MnX9Yamx7qh2c6EOl+QTu
	s73ydMir2UPc/y0NaMPPugoLlhHjPj3VWY65OPt2/cu59fZQrjh9Pa9exFB5fA7cIT5SsEm6JoN
	aOg1CxV3n0mfeUAeml3xpaA1kenpVT4wrGkPxYbdZSEY1SJciq5dOgj0NV4L4FZJqMPqUW3c4Qa
	SqCgmKvWnU2Mq/k4Vg8R3/3pJUDc+WgIjoVjwiFDnNQ6Qsg==
X-Received: by 2002:a17:90b:4fc6:b0:330:6d5e:f17e with SMTP id 98e67ed59e1d1-33bcf8faaeamr7027715a91.24.1760751233331;
        Fri, 17 Oct 2025 18:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhgd8h+gjYCRAgJsNizEhdpEKTIJOJyi7ZEUs7pkgwCNS/nw/yoWOt3jimgW+A8TBDaTv9cQ==
X-Received: by 2002:a17:90b:4fc6:b0:330:6d5e:f17e with SMTP id 98e67ed59e1d1-33bcf8faaeamr7027679a91.24.1760751232945;
        Fri, 17 Oct 2025 18:33:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf16bcsm791695a91.4.2025.10.17.18.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 18:33:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 18:33:43 -0700
Subject: [PATCH v5 6/6] phy: qcom: qmp-pcie: Add support for glymur PCIe
 Gen4 x2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-glymur_pcie-v5-6-82d0c4bd402b@oss.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
In-Reply-To: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Qiang Yu <quic_qianyu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760751221; l=2061;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=iLPr+Du4SVVY2HNyB1uA8pllKkcuQDXDVG2QxHgn67Y=;
 b=Efk0/KbSfZj/WjkKqRhvcxliPbFO58kqb9rWUzQCQX8ah7wkDvdoRXAx9aYAlPBHZxJEcO4eq
 PxKIJ6L3AIeCJUKTVCeC6B3F3Bfbvt0rn+CAF9ToLzzCsQA8i1HqlDa
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 5BE2k-EPPOx_LisTvIA_ZfeIEYH-NdsW
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f2ee82 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hii3Kp118aGdntTlwUgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5BE2k-EPPOx_LisTvIA_ZfeIEYH-NdsW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxxrFK4FoEhwu
 2zELjctWefK1U04M6tuj2DePiyQ7925JQ7SnEtoKiLSmS4QGrB0bzSpNJH2TvGtKX73vkPw/ma8
 RGaX2+CQp4JpehpEzZKEKXrKUB34Iw3qBhorr/qBMK3qcYfFKdwUDAbR6A1HCFC4sz+OLq+7lvk
 0jAGzjJ8fwwKfM7UI/sxGGWcxyEKCkKnlLxAXz0eBEoH//56S2+1PuRf9Cr+Ui2ygRYOvlO+Qiq
 DvZsVxba58Wl+R5MeW5Txb4imX5y6TwZEQrK4wKMClElq1ccbHD4jkAhuOtWRFQR3U8dv4ac5wP
 Hgh3NTMyizul8bxMlgTvgws+NlREHE9Phk6wbmsbtoXSiJ0veZ7X6uCqw5LCF2Ql+BTKx5NsRua
 2ubWJ4OVYid9ouujDGBbgMdKT3qy9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

From: Qiang Yu <quic_qianyu@quicinc.com>

Add support for Gen4 x2 PCIe QMP PHY found on Glymur platform.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..2747e71bf865907f139422a9ed33709c4a7ae7ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3363,6 +3363,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8 = {
+	.serdes     = 0x1000,
+	.pcs        = 0x1400,
+	.pcs_misc	= 0x1800,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.serdes     = 0x8000,
 	.pcs        = 0x9000,
@@ -4441,6 +4451,21 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v8,
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v6_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5192,6 +5217,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-gen4x2-pcie-phy",
+		.data = &glymur_qmp_gen4x2_pciephy_cfg,
+	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
 	}, {

-- 
2.34.1


