Return-Path: <linux-arm-msm+bounces-54230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACFFA87FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212C9188AF7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B31C29AAFC;
	Mon, 14 Apr 2025 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTkFxhfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE029CB4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631581; cv=none; b=SibCaFEjo64amaNFvoZWNHhLM6UScIurndRSAhvBj6r71E3zzQjepga2IWOYlZJ5ySNnLHIn+3aLuaA+t+JOZgBBcVCm0CH2ZPbIgttvXxPoqxvXNdpJhQVWJNjFiGJFALlF0wvV0HVqBC6Z3mVPOJnWNWEeituhxlwLe9sxmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631581; c=relaxed/simple;
	bh=6yw3TIsSk+fi4n/Vx0e4/+C/cuCzBTjdJ6X1LsUILcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuuPHNqYrxOWotRWOlamHirhvm9mO98JtmRUJyjF097kuIA+G9bzOA+aXtsla1Q1huHMTNyQa8yBr94glO5aUG0qNyWlEuqBaqXRnYwVNn+gZ626P5z4//N/Nw0AKThiowTKovYfzBY3uQl37WEp/v2TzxNRmQTffDZzeDioxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTkFxhfU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qH6011401
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4eQZ+dFk+f8kp4GW5geWITsRLjJdQNXKTH3mNGn2Jk=; b=mTkFxhfUZmQv+Ha2
	xGxq9rz+GrL/Uut9a67pe4Rwea1aMZqbVA7SUr0/oNSKT+TSm0yKh4GKNe5ium4n
	fJ5gGWs6IRWlmovKIoxywN8RW9LCaR1GrFCTdUAOCdiPLqMUxLrM8yQnC8GHz1uN
	WKMLXlId4KzpusmU33QyQo8Gspy4zo60FdE27iKCGYS1k8SW5hUjLjDgECpZTCdq
	5MRp4Q3J1NgfP3R1n7+fysgbd8Z1dFbSI0YdwsKE45EkplITABo7fFzh8eN48v+j
	U3HiZddGdumtTlpTEiAZsHJsTFbiVteeJvSBfZ+ZeP5UGfhm2ynpudjyOTlwyI+Z
	EIwZtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wcd7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a960f9cso38991115ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631577; x=1745236377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4eQZ+dFk+f8kp4GW5geWITsRLjJdQNXKTH3mNGn2Jk=;
        b=ZjvZNqRgdJYIIiAj595rW7GIv1lxJf8lBFBETcvN8LBgDjfNjuS2zJh5hs9Ft4jrt7
         arYM0GyaIwvyq95cbGUH1Zfza60AAeDG+sM3u7sHvLHvTrc9PC0PePZXrBxjHJQm6iFy
         Hf34aIa5SYUqRwh10iBA5uk37zMnEF6ojvlpo+Z/m4qBR6hrbmWE9mLJ9AbI3nrWeN00
         rSxtl5XKRxFrwSg0ue+lQWoY+/w6BvtZzMtwRYd6Kxb0LZ08qFQmaT4skVjV5aQSWEig
         XuIZH28GHLQG1hDUzZt5GSjT9DqgVDCt3vnm+yAXAbiXvksQCZVazsSi1OmwkRc3b1mT
         vz3Q==
X-Gm-Message-State: AOJu0YxVPrwAeVKMGi42ZSW98rsSay5NzQbkg2Tqpc+5XixtNpKDMG6m
	Xk4Ljw6MVH/J7lWHB7UBgS1+udvpmbaNEOLqfMQb5G0uLomr+1Wf5HXWpX2WSJ1PtTQ2sBRLQsH
	zNc+hA30z8aosfapTN/tvYL7lsRS+7dPCXibgOpFxidmXhu0936L2IcYSSTFuxb3D
X-Gm-Gg: ASbGnctieDNJPA28ePnNhiVnuCcTtLf0Fq+MDUGPqQgt3XZPDMTQ+gVMm6RlExzDxU4
	r7xNHU9jkbB7aMUm9xA7sb5UAJyxDZmgftavUyKCkLm+Kgtr0nGqyDjbc3PMuJQmWij/xUKqzQU
	MrnZFT2Em2b/D5sY1o7BdrfukSolLR8Yczy3w+dnbwIZ8BRWWkKElSOlFkFiHijMThp1fH/UUAq
	zhb+dSnlr1XhiimXSmuQXnDrQuvro9NfAdcYlrOuAFgv0auAvhSeRkaXJq4BmSgP1xg5fygVjhw
	kjzuY0UjxfVq9NZ6BxPDQwH0We6VAA8tdtCgFpwwXc9kAgHq08C4tMP2wamKHvPrKMd+wrnMB+v
	NkLRWIuWCntdG1UBZT4hVFWg39oUlvuQtEtKI1ujCCZyfMjk=
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr182958535ad.12.1744631576773;
        Mon, 14 Apr 2025 04:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHsHPFfgUQeWJLdBCHGOe9nTEe4mD33k4b5yyMFUTnsr1hKZT/8yXc+mGOgsW1hkr/LRWb1A==
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr182958245ad.12.1744631576441;
        Mon, 14 Apr 2025 04:52:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 17:22:49 +0530
Subject: [PATCH v2 1/2] Revert "phy: qcom-qusb2: add QUSB2 support for
 IPQ5424"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-revert_hs_phy_settings-v2-1-25086e20a3a3@oss.qualcomm.com>
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=2743;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6yw3TIsSk+fi4n/Vx0e4/+C/cuCzBTjdJ6X1LsUILcw=;
 b=E0yilhCU1zZvO9ftjOqRNoWih3UVAMwNo7/Nyz2O4KrVW0ZDLa2oMYE+Ao9NUH68MFShy98ck
 /MEmkscH1aUAk7KUB0wthNN6D+ow9navIrnig8fkvvEQB1iP3AeWENk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcf71a cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pdtzJwMO8baX11e5YFsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ygDCAZHKLHkUKQNACeIjM8jwPtCjN4Bo
X-Proofpoint-GUID: ygDCAZHKLHkUKQNACeIjM8jwPtCjN4Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140086

With the current settings, complaince tests especially eye diagram
(Host High-speed Signal Quality) tests are failing. Design team
requested to reuse the IPQ6018 settings to overcome this issue.

So revert the change which introduced the new settings and reuse the
IPQ6018 settings in the subsequent patch.

Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1f5f7df14d5a2ff041fe15aaeb6ec5ce52ab2a81..81b9e9349c3ebb4d303cb040b5c913336bb6b6d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -151,21 +151,6 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
 };
 
-static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc3),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
-};
-
 static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
@@ -359,16 +344,6 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.autoresume_en   = BIT(0),
 };
 
-static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
-	.tbl            = ipq5424_init_tbl,
-	.tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
-	.regs           = ipq6018_regs_layout,
-
-	.disable_ctrl   = POWER_DOWN,
-	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en   = BIT(0),
-};
-
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
@@ -954,9 +929,6 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
-		.compatible	= "qcom,ipq5424-qusb2-phy",
-		.data		= &ipq5424_phy_cfg,
-	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1


