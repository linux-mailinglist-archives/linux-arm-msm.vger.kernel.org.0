Return-Path: <linux-arm-msm+bounces-80198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F6C2F181
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4414F4F8407
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560C32749E0;
	Tue,  4 Nov 2025 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPVPMFD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efxTw1yr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C526E175
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225704; cv=none; b=b0iQ+vET8AVjuHEnN1l8oQtMGGH8elJGVyUqTvifghcMADMfdcHUoSXLriarh1jLErrcWR1BIC7Ubtz71v3Zv4zUqiAVeUQfHLNR4wjMrt2deYiKMC0K+FOEXf9Fg+oaVmqwwd7517qWVWqZXw3GTu4UfSJC3pgs3si2p1Rl5Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225704; c=relaxed/simple;
	bh=IAHLCq1unJtd5LiilYFr79f645gxD9ry6SK9tlt4gwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDv2QHY/lz2rOgR0UBbZe1O/sO5VoQCaD2cAVZRAUweH6duJaXkk3nf3U4Kr6w7y+p+KALRa4xkCTp0Kja2Qxzs2ktfmnbAa7n9lQ0kLocKSp6BmvZyRA4e5CKiOkPuaSEEXaoT18KhW33STGYQy6omcVIZ8xj3aEZhCtqHIpnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPVPMFD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efxTw1yr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42s4q63734234
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7UTngfQb7OiWwCXME1AuL5HWLJvZN0I6tRHBZbitkqc=; b=VPVPMFD24KutKE4n
	ocTaZCSLpX4W+I7tEUyguu6rY/CfOMIYyvnSbtCpcTZt/bh5AlnU/4cC9H3VyfB4
	jZmIVCH3bIp+Tqcm3zv0z7oX9f+yzioOzJ/GmLPtAsMY6xlLdW0crp67EYMSnIY4
	J7aDLAIYN2Gx0OawZIKX0Pk4F0dxEhZ2zBy4nlBy2Dw5HjAoL57bStgzarRlMbG6
	KVnnM6JSnGSbFu7BcQOfZ2JjuSGAr2HVEyfBz7cbL4g/ZhZQ85CCBqjdYuPRUCqQ
	QCbRPkC0I+j4mxm/pl49+j0crfocZfFEWbiCZRAxmQaf0t+8lylZpR0pbHzAC+ZE
	N6yN+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86jtpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:08:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29555415c09so32251065ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762225700; x=1762830500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UTngfQb7OiWwCXME1AuL5HWLJvZN0I6tRHBZbitkqc=;
        b=efxTw1yriAACQNhPr9mUWOQegiUVl8iKR0XnMnhpqu6lQPFVBti32vRDRsqWioAnN9
         pOzAJ1pL9gt8pawRwN+d2wSgE9v0NyHacGGCiXe8Ouw5pI0GMKKonuzb07JniqEiHnGh
         F1wJZlKwbL5ZvrEs7vrc/cq9yuKpGZKsFYqmP1YfPlTMf4jzkHZrsRZLvK5/5oR34Fhj
         TZGiRMmcVfB3QCG7b1GeRZMUixYpRnezIOr1UPHr3BFfWSoP4uTKdWqZrALVyLaiOqmf
         M/ndkDn5l4N88tXlHssMmbNv2zDnTRtwHBfzspOsl7ec6Fd2CviQMd8RrDAy8FzjzfTv
         FBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762225700; x=1762830500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UTngfQb7OiWwCXME1AuL5HWLJvZN0I6tRHBZbitkqc=;
        b=AHzU3nwVMznmCXOZt5+CiyUsLHBwbLBqSiUu1Dm3t/V7adWbMY+8IaYBkbrD3aEkPh
         LAnOP7H3o27yJY8d7ygbY3bXFvlvRS18lQjeEkxyeNGVItegNB5B3mUe/W+iEVcU/5JL
         SWWiZeDPjpwMjimyHFd0Kkojjj3IgOni5TAnVcxY5983cGBsrcTlblymo6yEQ5z9SvMk
         aRhDcr54qe8FgPhqCQclV0ky8d1due1/ziOifQMq6pjKYp9FuMNTax/AfREGNAUtA/FR
         RzO2WUdTxTjL8t2bvRjOAVgtYo7K8sOBhtBD7eae0j8QqrY2Uy6eTc2X1fdhvPq6nNHM
         EWBg==
X-Gm-Message-State: AOJu0YzVd6PBzC55JeJDpHxCtGsCeUHlT5vqM6uBlbXnEVLH9DrO+Pvy
	YBrROQzlgGwwLAOLRJbYyPS8aZ45soQ/8w5lQP1QCSarQ5w1ksotY9rKdrl4ZJwnn66KzLtynQT
	K+3+Y3ks9bIo3kXzm7RsX92+NVQfWAiYhVbvc1AY3Zzld+a8wqTDLAnCnpQLAAMuZpF9q
X-Gm-Gg: ASbGncvYXOnZFR0dJU1TbTzZOsBBeiQSgGla6fGliwZAN/2/4GMFNOYh/5dGHXQYrfk
	1MO1opjLFrDAj4bYrGih6lBy8/93X+FQ/a2hUhS3qMZmVTdNdf9Tli/l1L8Ifr2QIL6YY/rnNkN
	dQlP5pbtSx0A4LCuLQVZPdWFu6l/pUCrZOPJmyYgZay5yL05NOnBqRadwXTjLxpeUBE+BhoVHxc
	vFsX+lKhAZSOlHo/fdVuNIZ8wb0Nwyzw9yd/ziZ0olMWBq/YjCm4n1S150OfXrUeQZohEudC8NA
	Gi9somKwTgTbw0h2961TAfPsEia35GiHQkf1UBXgFTOSgHM4YLW/Z3m7hib230JdUtYwv/3lsD4
	OSblf9vNlucoAMadNSOsqeZIM84GxA/ylfc3XCHq6wM2nug==
X-Received: by 2002:a17:903:1ac4:b0:296:217:33ff with SMTP id d9443c01a7336-296021735abmr13096155ad.48.1762225700240;
        Mon, 03 Nov 2025 19:08:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoBy9xeqM+w9pbf8kkbaxnk9EfLbWsrjPpujaMoET2BweXfyp3FMZqYAikiF+5qUH18gB8CQ==
X-Received: by 2002:a17:903:1ac4:b0:296:217:33ff with SMTP id d9443c01a7336-296021735abmr13095665ad.48.1762225699686;
        Mon, 03 Nov 2025 19:08:19 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998da3sm7357365ad.27.2025.11.03.19.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 19:08:19 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 19:08:14 -0800
Subject: [PATCH v3 2/5] phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe
 PHY v8 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-kaanapali-pcie-phy-v3-2-18b0f27c7e96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762225695; l=4502;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IAHLCq1unJtd5LiilYFr79f645gxD9ry6SK9tlt4gwo=;
 b=+geqzEglYYNIOHPbx1JCBiTT7R52dh6jKroVW3Bk2Ips8w3XI6Df3D3GayoIeZPkScLDh88Dz
 hNZPZbA10GUDKXnj0L3SbcoiU0rIs9BVLH9wQRH0GNJafnyaz3hJTb7
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNCBTYWx0ZWRfX1enR41sgKrlE
 EtQ2IpAFAWzoLPwB03xNOsDnIoINXJDI7VKDgpom3hELYOhwLIjLcVJqmZLnSrpgkF0cw65H7Ck
 efCUVrZVqYSYUPSAPmIRjYQL1x78m7kUXsWFEidvrfYWFhJ970BdRhqBQGmV8TCm1kl4MsQmh+m
 jHhf4dk6y9mgPvvnyb7HsUNFDooFTle/rXNHSRY4U/xy+PGqSUXJEPTE+2WuTWHXqa5FWOW0cQk
 50AA0SdV5zpNAE4XbbiKjq51B+VokPKdYjrePhABb8xG7OjGMQM4drgiNtJxGQxLDVY6qqs2QkV
 zvmFbC9s5a7tmC4cyzQweYsa8yNTxklasdFuuVr45/3NLsRwzbADV3qMAy0JFus9EyJjxHpqBrD
 JwI5Xa3ht/R089QSUceXHNVEecikIw==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69096e25 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AMX_CUzcla2ZGstc20cA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: GTRDXVRUlK-OC9hoshhE7nejco2s4F5L
X-Proofpoint-ORIG-GUID: GTRDXVRUlK-OC9hoshhE7nejco2s4F5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040024

Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but requires
a completely unique qserdes-txrx register offsets compared to existing v8
offsets.

Hence, add a dedicated header file containing the FULL SET of qserdes-txrx
register definitions required for Kaanapali's PCIe PHY operation.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..181846e08c0f053c5cc7dbaa39a1d407ffdcbcdc
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
+
+#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_TX		0x030
+#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_RX		0x034
+#define QSERDES_V8_PCIE_TX_LANE_MODE_1		0x07c
+#define QSERDES_V8_PCIE_TX_LANE_MODE_2		0x080
+#define QSERDES_V8_PCIE_TX_LANE_MODE_3		0x084
+#define QSERDES_V8_PCIE_TX_TRAN_DRVR_EMP_EN		0x0b4
+#define QSERDES_V8_PCIE_TX_TX_BAND0		0x0e0
+#define QSERDES_V8_PCIE_TX_TX_BAND1		0x0e4
+#define QSERDES_V8_PCIE_TX_SEL_10B_8B		0x0f4
+#define QSERDES_V8_PCIE_TX_SEL_20B_10B		0x0f8
+#define QSERDES_V8_PCIE_TX_PARRATE_REC_DETECT_IDLE_EN		0x058
+#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH1		0x118
+#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH2		0x11c
+#define QSERDES_V8_PCIE_TX_PHPRE_CTRL		0x128
+#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE3		0x148
+#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE4		0x14c
+
+#define QSERDES_V8_PCIE_RX_UCDR_FO_GAIN_RATE4		0x0dc
+#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE3		0x0ec
+#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE4		0x0f0
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CONTROLS		0x0f4
+#define QSERDES_V8_PCIE_RX_VGA_CAL_CNTRL1		0x170
+#define QSERDES_V8_PCIE_RX_VGA_CAL_MAN_VAL		0x178
+#define QSERDES_V8_PCIE_RX_RX_EQU_ADAPTOR_CNTRL4		0x1b4
+#define QSERDES_V8_PCIE_RX_SIGDET_ENABLES			0x1d8
+#define QSERDES_V8_PCIE_RX_SIGDET_LVL			0x1e0
+#define QSERDES_V8_PCIE_RX_RXCLK_DIV2_CTRL			0x0b8
+#define QSERDES_V8_PCIE_RX_RX_BAND_CTRL0			0x0bc
+#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL0			0x0c4
+#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL1			0x0c8
+#define QSERDES_V8_PCIE_RX_SVS_MODE_CTRL			0x0b4
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL1			0x058
+#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL2			0x05c
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_THRESH2_RATE3			0x084
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN1_RATE3			0x098
+#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN2_RATE3			0x0ac
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B0			0x218
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B1			0x21c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B2			0x220
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B4			0x228
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B7			0x234
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B0			0x260
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B1			0x264
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B2			0x268
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B3			0x26c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B4			0x270
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B0			0x284
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B1			0x288
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B2			0x28c
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B3			0x290
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B4			0x294
+#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B5			0x298
+#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE32			0x31c
+#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE4			0x320
+#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_LSB			0x11c
+#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_MSB			0x120
+#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE23			0x108
+#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE4			0x10c
+#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE3			0x198
+#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE4			0x19c
+#define QSERDES_V8_PCIE_RX_GM_CAL			0x1a0
+
+#endif

-- 
2.34.1


