Return-Path: <linux-arm-msm+bounces-74774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DEB9CAB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5ED132818D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F55F2BF011;
	Wed, 24 Sep 2025 23:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hbhv7AT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A952BD5AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757192; cv=none; b=a6DFMmJfarrzMvPqISCbQ2a2mVcLHWX+MMV4eLSKwBuenulhDRpUdkCytbIbsb3w84J29p97SAR4BYB+yORq7WZoBLc14Xb9oQY+pg5lvvmgTncm4IVyys4nnrnUYkiKuaUk77MkpmEjHYfIDufIGCyGtwJm75znPTS9KGfYKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757192; c=relaxed/simple;
	bh=w8ApOzB1Gr9aw+7jn1mSl8XSjjHxtf0wT1EwGWRkKGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzvry7lxDUiAW6nhhis0pzWlwTcxUh8Q/7ENW8qa6FL3TIVfAVMVS9dJdJJOuN86KU0srQYjRjC0XyqAc/2Qpk4V/1Q9NZyWN2o4UpOZP2Rx6lOrQHpQXLy6sbVYZUMBNSxVcf2DPF/aTkr8y+AT+RcdEM5k9yQO3Xz8nymYhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hbhv7AT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD7UDu018382
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaTaU6dnj9Z5K5hZ4O4XIOwohFdkjeE6Nh6GZtU8H1A=; b=Hbhv7AT5G07I3Q+c
	pQ0o0b6cNJrJNx2W+OBQN3gHPt3iwWQtPLM+8r15k5nhV6r32o/pwPWBeitwPgng
	D52MndLo6lRWYcfr/wJQ+nxYwbWBlTecv6tw5WwQ4ogzCR7uu0ggtrEL2p+tSbQc
	RKrd0NZBxWWJacVLCbD0hBVS2cdz4spZHxcw6G8SrsT6eNiFirCH/tazYwOKfk82
	kZRJL3j6ccSOahN1mDElC/DHH2njuIrso72FzFw4yFyIe0K1+n30S7D5+5yQ7uh9
	Jg+YlCmsLlAPYCz1wX1OS2PU0B1XifF4CZ64HYqqUBGwmEXWocJbR+IBkRP+W++X
	6XVyuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka12y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26985173d8eso5145335ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757187; x=1759361987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaTaU6dnj9Z5K5hZ4O4XIOwohFdkjeE6Nh6GZtU8H1A=;
        b=DI3l52qYskAE//rXj/KZGm0wQfaOyOtSqT4MWNITO7KF6lBbx+U7NH6XIfwXZLGsDC
         77l5SZ0/RjXn0ZSJO/mRxQEs6hNNOXEj85Wc2jpjsanpZflfeSbDaYi0gTZlNfhgT3xD
         8HuMrqfo6GCnrmEJm+aHfRwsakVoVPrkFwNhqdBxmhzvKnKwqynJeDCPaDbP1rXhIvlr
         L+DQ/ZWz3NNPOaT8yI0Y/VkMgP/A2Ibabzjv9Wr3YhAvt1Y54V/cHQKa+aWtLYCtA6I0
         1yLlKz4LyyUzG/6M4QtRhoYNq1Z3a44X2IUh0cfM0MvoJQCkDMK7TX1cC/XRf5E/Hep/
         rgOw==
X-Gm-Message-State: AOJu0YwOgwnsxb+jqFF+vbKxVis8299AIiiUxoaOC+/II+UFpu1ze089
	j3V9HVCM54cgXixpM73iVHKzlw0lhQXNB4QeoIXvzQuQTGE0APfB7dtxzycrQbLcgztJeBkE3/J
	SsbQ+HrSLcv/xxmABxK0n9qpFgWREqKTPl9yZfTdd50ejTaQLtUT3FH3CC1agFY9/s3Jp
X-Gm-Gg: ASbGncuILX5mMYX40t7XYzMNGft81rXd10U7W7EN+9rkhAnfNE01BsRpvC2HR7y9tWC
	k4FaU4p1AW6Ux23M8qjPzIJFedDfxITvDZCOMQkE4hv8gF3U849pTxdiZenbyleWRc4owzRrISx
	4ucYlclGbHUbgc67QE3mc0BZGE75xEOXhZXPFJaU6Omvd0zhgRaxTebl8c8+AIG9JFSBxZNz/m9
	P0cGyrxCKgfclxxUpF8qbbFD/EHMBaqfF0Js8bcDgWJu2OXUI8sLPiBlYxSTDbaGvgXnXxzK7zG
	dsy27mX0mF+JnGau43NebyJYM17lOSuvvU1gmkRcmdSDOqi+JKgJksnhLzFN3XGuZMCt37tUcQg
	u3PIM3nMi/SjBy5M=
X-Received: by 2002:a17:902:d585:b0:24c:82ad:a503 with SMTP id d9443c01a7336-27ed4a56da8mr15801545ad.41.1758757187471;
        Wed, 24 Sep 2025 16:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMHIzlLo2bXkmn1qg4WBil6XRgw2htBHHVbPkevjgBA+NeNjwX72HqENJe1CdZyKyTPR6gw==
X-Received: by 2002:a17:902:d585:b0:24c:82ad:a503 with SMTP id d9443c01a7336-27ed4a56da8mr15801305ad.41.1758757187062;
        Wed, 24 Sep 2025 16:39:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm4610045ad.20.2025.09.24.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:39:46 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:39:39 -0700
Subject: [PATCH 2/2] dmaengine: qcom: bam_dma: Add support for new crypto
 bam
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-bam-v1-2-c991273ddf63@oss.qualcomm.com>
References: <20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com>
In-Reply-To: <20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757183; l=2774;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GEdBdzdIAX8fGpq8ae3liMKSkAOrGReyvTCj0gbYkOg=;
 b=oyIIuK/uFfpSrn7d7x80OB4pBmcdGVi0jIxpYQ7ogx1CKsFzI2pq55U9UGIcHSwzgRAH8Uswm
 y1gmg5OcCY2At/vfZ4JCau0HTq5u9uvmEwUBoh4MESEUd2hTP+sx/K4
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Ot-R-FOYvWBW-AWlsYueZ3RFAY8DZ4h0
X-Proofpoint-ORIG-GUID: Ot-R-FOYvWBW-AWlsYueZ3RFAY8DZ4h0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX0z0FhZQMOtbu
 44mWEZiRSPhfxbk/mISgCTrex/GcXMaX32ehpW7XIsBf7+Oj9Pfqd4i+CZ4uHPlLfNuMexnk5TC
 HrBDTB4ho9B2l8MKgqxT6Y2gxslPleylFVJMuliKFg0G9VQRJJm9MdWccqGtD6Oxq7FCjy8aZUF
 0EIBWVY87UvYO9czKcLcyONbykq2JQyHD8VYxCRNdmxpVLvE6B9daxQV2r9r6nPDnBJjvzXF6oM
 AEnnlwu1xr/YSEVtmEqRTxr2Bs3tRGEo6e6lPTufUWH2kBq/9eNO0E3GZn/eSZlUh1UETsW2XGJ
 yYXFJFHmoqzCInBEwt9E46mhwcKhHduiruw3f4YjS8Dsz6q6fl9YHUPhs1swD2mjyJaT4Eie067
 Kh25qFDs
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d48144 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cFv7hCk4oO-93yei0aoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>

A new revision of the crypto BAM called changes offsets
of the EE specific registers. Add support of this through
a new compatible string and register set.

Since a generic BAM module is deprecated and this new revision
is tied to crypto, naming it as such.

Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..06530e76ebc3 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -198,6 +198,35 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct reg_offset_data bam_crypto_v6_reg_info[] = {
+	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
+	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
+	[BAM_NUM_PIPES]		= { 0x01008, 0x00, 0x00, 0x00 },
+	[BAM_DESC_CNT_TRSHLD]	= { 0x00008, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS]		= { 0x03010, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_MSK]	= { 0x03014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_UNMASKED]	= { 0x03018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_STTS]		= { 0x00014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_CLR]		= { 0x00018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_EN]		= { 0x0001C, 0x00, 0x00, 0x00 },
+	[BAM_CNFG_BITS]		= { 0x0007C, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_EE]	= { 0x03000, 0x00, 0x00, 0x1000 },
+	[BAM_IRQ_SRCS_MSK_EE]	= { 0x03004, 0x00, 0x00, 0x1000 },
+	[BAM_P_CTRL]		= { 0xC000, 0x1000, 0x00, 0x00 },
+	[BAM_P_RST]		= { 0xC004, 0x1000, 0x00, 0x00 },
+	[BAM_P_HALT]		= { 0xC008, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_STTS]	= { 0xC010, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_CLR]		= { 0xC014, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_EN]		= { 0xC018, 0x1000, 0x00, 0x00 },
+	[BAM_P_EVNT_DEST_ADDR]	= { 0xC82C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_REG]	= { 0xC818, 0x00, 0x1000, 0x00 },
+	[BAM_P_SW_OFSTS]	= { 0xC800, 0x00, 0x1000, 0x00 },
+	[BAM_P_DATA_FIFO_ADDR]	= { 0xC824, 0x00, 0x1000, 0x00 },
+	[BAM_P_DESC_FIFO_ADDR]	= { 0xC81C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_GEN_TRSHLD]	= { 0xC828, 0x00, 0x1000, 0x00 },
+	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -1228,6 +1257,7 @@ static const struct of_device_id bam_of_match[] = {
 	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
 	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
 	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-crypto-v6", .data = &bam_crypto_v6_reg_info },
 	{}
 };
 

-- 
2.25.1


