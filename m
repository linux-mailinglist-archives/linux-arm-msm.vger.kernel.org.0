Return-Path: <linux-arm-msm+bounces-80200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E3C2F148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401511890854
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7127F017;
	Tue,  4 Nov 2025 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+AoTgC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1UutRFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265D26E175
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225706; cv=none; b=cDA24rYxP9dj/XVvbGzuu99RqOgCalxf1ncUMeDj5LxzC73ZXWspsG6bN4RsuVs3MzdNlNVSsSjyZ6IERggrYpOr7NoYCnopgUCg2gL95DhB3r/k7rvs17U5URHd0BpFAMY9wmSACWxs7ZP+fBC7QJ7CnHQ4Qp743vk3D7vxTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225706; c=relaxed/simple;
	bh=T9q1inJlwTfg/gPd7Q+2RMAg+x2qnIVhHI3ir28H+W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSh/9kr9unfmwatm+kZQXNyY6iPH2lk06UnzumL9kGNpwR4In6WQAwvNpRfKwshwCP93uguQLLhm07vRRvJoGEei3n3s3UrtbbhbZWt9LoqZHQxiIBdy5ziS9/NDbd/IofNf4nlH1KqJo4ryNrEcoMqaUGex/PUU6+JPrQMHoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+AoTgC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1UutRFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H45WI3667769
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjl88K7Ikw8V3LFOUdPS89IWYvnp87gV7OPjhtKIs8w=; b=o+AoTgC0Em7pBt85
	TqASbFS5eHz3KOtOsoVsaJoJuclthU7btFkHixs3LHTGLGYrFG6A0+9duaSQ6vw5
	BXALAoLNonW+PzxwjBBf5XFhlh/yldBKtNIB6v9fz0vwfh8UpR1NuMB7Y/HMrjRl
	ot0qJ+DcG0xs/ljguML1lxrJBB85yhBBG1Vee84+SrzGYMyGhMv+LGC0i5oGO6fS
	P0swqz4SFKLMooHCP8RMLZe/6XhZjE/ievaBZtLOtVXYqmCvqsAyftb72J07ooe+
	3Ba+KR5DtsRCXUCAmDDrKVWJ04uIcKQax+ScS6VcVW4soUgwv7ER8L3qv5QanXwT
	UPL4SA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffhf35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:08:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so4089034a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762225703; x=1762830503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjl88K7Ikw8V3LFOUdPS89IWYvnp87gV7OPjhtKIs8w=;
        b=d1UutRFkbnduyhnnRwPBGuMoR8ZV3g/k0CQLwI85Nb4WzupuVaC5Syebf59P9oLQ2A
         oyHZsX3ER/5fZbCgLuygBn3DHrAkNoV6QHtddU8JMgK2GFHiEpb39mKGvN/zlhISh8bR
         EYQPy1f4qsYkuTHf/JVbd1EstvivXftwTBCLRbAqFnA7SNRWI/ynz6cejvZlcEHO+Z4h
         N/BVpS2DIE9En0Yjv06YwIbDdK1aBci+reaAmSmcO+cmxgEXGSDWVcjb5KYlxDbxM86d
         dfUCwb/J0Icsm9T3hBOenJDza61cM1/oYO9/ks2QpkZENgBRD1P5zttx3DcyHlLA/OTG
         /0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762225703; x=1762830503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjl88K7Ikw8V3LFOUdPS89IWYvnp87gV7OPjhtKIs8w=;
        b=LIwjpWCweqBGkRIiJw9/i44MnkoRS+ljGpT08PrH3Dlhj2CvDH+S+AogSq7hwscPYj
         PBwD+CZO52KCE0HySEAai8vR1Nct9iyimJlKM6PzEAo2cG/6n15l6GT+RzkfD+AZpDGP
         icR0BO8MBeC7bBVTyeMDN2x2g1CArtH0IoHQimMBWyzjRDD7rr1TN8bkkwtdmsBHtyDd
         jkTemKKZ8ZNHj1yFiOVXBPmAFWOKWdc8Xk5HvFcg637avVwPK17M24NprWTPAeekE+nv
         kOMboM/j0/yQyc9QyIwsbG1K6Ew/OOD1Vl9DXBc1BC9hFSBAV+45CgtJ0GdAYO2uqXGb
         Qegg==
X-Gm-Message-State: AOJu0YxXt0YJAHWkyVO7ko77xuPAIt9tH63r5VzaLuMWzA/eFOVS55u0
	/0fIsehCmv7uT4f7Ya0UxAR2Ik1ymMdi5xzsS3WS7aKAIuk6s/Mn+h/QDUzUGMlhx2G9KybfJ+z
	Nzwh/IHHJ4qi2+btOV5NTMKVXfPEsZ6jQNBZj0c2ZNWPWS+tMfjTia/1Fu7qXxyFKWJpl
X-Gm-Gg: ASbGncvhF16R5aXJ7EudpDUjDpaglqVUDcoojLhKmjO1ajv3UDHSHnUuqBRU77LV5C2
	OSrdiJyZ3/T7D7S9xmcgrwkbYYsCZcamRULqv4PPL6N8pGe7FcCfOkmO9UCAAmxeYaaWJ51qbjd
	hTnH4SHUchGb2tSo2kBvNfV75Dk6w7RhfYyvs0d7jFyqRd9DknXTaAIzMzDVA25SdiStPvvjfrq
	xYL2tIeqMuPrXKxndMXPabZ7vMCSdQSXFhZF0rLbajCffkfP2duCYo5onqNY7vvCEG/SzD44ulr
	DzcWXwrbRaeX0NT51WXmpvdEivb1d8g1WFJGY5hszgdsFL6Xc2ETDSdQ2mtIvf/TjftWicsbsaw
	U3UpCPMUi9Sd6rFQwO6wAARrRETUdXvSjznaRxmjZ9a4GrQ==
X-Received: by 2002:a17:903:2f8f:b0:249:3efa:3c99 with SMTP id d9443c01a7336-2951a600e39mr210169765ad.61.1762225703460;
        Mon, 03 Nov 2025 19:08:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnkUDpGTd4QUiumCjswd33SMHOlxSzlev0yXQnnPpUu0uiZwOjQMLokv3J1leiSGBWgY0gAQ==
X-Received: by 2002:a17:903:2f8f:b0:249:3efa:3c99 with SMTP id d9443c01a7336-2951a600e39mr210169285ad.61.1762225702739;
        Mon, 03 Nov 2025 19:08:22 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998da3sm7357365ad.27.2025.11.03.19.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 19:08:22 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 19:08:16 -0800
Subject: [PATCH v3 4/5] phy: qcom-qmp: qserdes-com: Add some more v8
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-kaanapali-pcie-phy-v3-4-18b0f27c7e96@oss.qualcomm.com>
References: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
In-Reply-To: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762225695; l=2673;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=T9q1inJlwTfg/gPd7Q+2RMAg+x2qnIVhHI3ir28H+W8=;
 b=UTstli92U/T/Fgz9RrJoWXssPeux14rrF3Dtzo9nuQqzrXsJDRkqTA1xxfy6aRip4SnkTSksy
 ChnRVjicU1LCdegugCAXjzFYi4UNwNrqTwQmFLR1UG45IfV3cpL2UCr
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=69096e28 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GjIj-kmtzo1uPuhiLq4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ayl5WTVaaIBkOR720GOdD5RWJ8xEW_Wx
X-Proofpoint-ORIG-GUID: ayl5WTVaaIBkOR720GOdD5RWJ8xEW_Wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNCBTYWx0ZWRfX7og6ZD0G/H0c
 07ah3XBGSKFJ8qUuL7Mk1HCLr3Tq19pr6gJxBPnlvmIjgzgV67+BS3sZtxi+KPh8o+CgDB6MJsF
 fAAsF2d89PBp/AhU4i9YGLDliu7Q8DcpyEIDnoHtwDVkPRBsp/9qmTiu+/O4uw1OTHqUxp9T648
 PDJKj0b4v0ikH5BMS9e0Zlp9l3GyJOPNMW0TiSx2PoWFWVGkof5U8K/tBNMw65vt7QKBIuky6tY
 3FveFRzaHmrP4bCNbwAUDDvX026kYiXja4xhctwRn9E4DCm9TuEPM5VcpzW81qQf27GdbmXbTGg
 bdKInMmkF2TQTyo0l7Yriis5exaz+y7Kh4TcFj0gaBB6KBkt3MsgDqp8sQ93Ne7zLK/KX2WHFLF
 vU9OKxl5zMQ3fbFK3fNiX5CXPo9CBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040024

Some qserdes-com register offsets for the v8 PHY were previously omitted,
as they were not needed by earlier v8 PHY initialization sequences. Add
these missing v8 register offsets now required to support PCIe QMP PHY on
Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
index d3b2292257bc521cb66562a5b6bfae8dc8c92cc1..d8ac4c4a2c31615fa7edff2cd4aca86f4f77de66 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
@@ -33,6 +33,7 @@
 #define QSERDES_V8_COM_CP_CTRL_MODE0			0x070
 #define QSERDES_V8_COM_PLL_RCTRL_MODE0			0x074
 #define QSERDES_V8_COM_PLL_CCTRL_MODE0			0x078
+#define QSERDES_V8_COM_CORECLK_DIV_MODE0			0x07c
 #define QSERDES_V8_COM_LOCK_CMP1_MODE0			0x080
 #define QSERDES_V8_COM_LOCK_CMP2_MODE0			0x084
 #define QSERDES_V8_COM_DEC_START_MODE0			0x088
@@ -40,6 +41,7 @@
 #define QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
 #define QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
 #define QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1		0x09c
 #define QSERDES_V8_COM_VCO_TUNE1_MODE0			0x0a8
 #define QSERDES_V8_COM_VCO_TUNE2_MODE0			0x0ac
 #define QSERDES_V8_COM_BG_TIMER				0x0bc
@@ -47,13 +49,22 @@
 #define QSERDES_V8_COM_SSC_PER1				0x0cc
 #define QSERDES_V8_COM_SSC_PER2				0x0d0
 #define QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define QSERDES_V8_COM_CLK_ENABLE1		0x0e0
+#define QSERDES_V8_COM_SYS_CLK_CTRL		0x0e4
+#define QSERDES_V8_COM_PLL_IVCO		0x0f4
 #define QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
 #define QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
 #define QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define QSERDES_V8_COM_LOCK_CMP_EN			0x120
 #define QSERDES_V8_COM_LOCK_CMP_CFG			0x124
 #define QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V8_COM_CLK_SELECT			0x164
 #define QSERDES_V8_COM_CORE_CLK_EN			0x170
 #define QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V8_COM_CMN_MISC_1			0x184
+#define QSERDES_V8_COM_CMN_MODE			0x188
+#define QSERDES_V8_COM_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V8_COM_PLL_SPARE_FOR_ECO			0x2b4
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_1		0x1a4
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_2		0x1a8
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_3		0x1ac

-- 
2.34.1


