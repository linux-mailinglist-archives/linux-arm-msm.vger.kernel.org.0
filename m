Return-Path: <linux-arm-msm+bounces-83033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EBEC7FDD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA4B3A687C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DD52F99B8;
	Mon, 24 Nov 2025 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLE7c1F6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgdEAFi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BD271A71
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979962; cv=none; b=YUqvWyDKQBQTcFPNIB70xqb2vPJaStaLa4IzX/2ZXZklZyyAuM1lflbfj+S5DYoKJB97gS/RkY7obfHon0zMXfRZnWCI7DXEttv6shgbqQgYkSyYBDy2QXv5TBtbfSEfeOgAUGWk1kRGJEKCPW+MC5i4ESUzvYYlyPFhYWQ0n8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979962; c=relaxed/simple;
	bh=DMyrxN6zxkwuIu9tcvyVruPaU8b9DSq9n3Sg3itKewQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VEraPxsANG0DJ5dzNQ76dPv2KFD5Zri6ZP8ZmKp5eaOFsi+SmdyJmoUz+RTcwv3fThk0/t6XxO+V0z9NdBjBcqyatinMv55TxuH2q5yoT3qnAt2uoHgMIX3h3JfYnOlD0pZhbqFyfeMIgHT9UP5bxh1fmOeiffeK2YTlb8NeM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLE7c1F6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgdEAFi1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7TELs3112066
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/hMwykfqDmJcojkU+Aegd5sgEW6VKZtTzabtZT75W8=; b=pLE7c1F62ZCsCAPD
	e4ZhxKU3A92fvQkDQjrrITxIfM7qawUWye2m7Mh6sLlnrRvOJR2nQHpi7es8OSKf
	aKkJj6vXNu3jXTnEHHI8Y3gVZ9VrCMwXLgR1tU26OXA1++A9kAz8rMDw+SLmx7tl
	CKW8VdSeXwfOuKN4PvkiIJW1twb2vkwDXGczdD0B/66B0WckHZw7FzISkCkyteGd
	mznoqWSjJMkQ5PhjMtYI8XSD1EczEwDRCh4RlnvF5W3Smgbe9Km61P+YLRB2B2fz
	mX9mFTf3zu6tWnuVbvHoeTQocoxp57w1uq0Miex0jKQDC4HzQUnGxIeJkBeAy9BL
	HlAWyA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10ghrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b21dfe94dso5110853c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763979959; x=1764584759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/hMwykfqDmJcojkU+Aegd5sgEW6VKZtTzabtZT75W8=;
        b=IgdEAFi1tDbhWqSNuZifZVSXLllpOduF+aAwKu001G7oiYFLVCQBiAnJ595VR6q4gX
         7Nzofv0hL3jALc4HcaDjLQ7oYvTU0XXRnKiB96UU7FaYyZym5bTOv2iZtPpavb/AH/ap
         tKNJk8Xfz+qqzTwrpbjcjQRaNMYW7GppvhXsC93A1oZyLP4Q8dTSAfqWxwCViS2Iv5DH
         ZqoGK4tkb0ZkmOAgxs5/QiKI1PtHo2ocNDSknqxfkrQ3t0to9GLiz3QTpuZXgn3S8th+
         tcN8ug7xZVzU4+XvbDY/aQEDEl7OUzts18nhz7td+7CKhXyCCs3kyQjSS1xJKXBOzXTR
         U31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979959; x=1764584759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/hMwykfqDmJcojkU+Aegd5sgEW6VKZtTzabtZT75W8=;
        b=aM1gZQwu5GjQovNhsblN0NQUns2UvN2wENqW7N/f8fl6kSgLOnnAC9jAbECxPzgZDE
         YR5mkmpQgnnlvlVb2N2soS0cdyRVQiMrEbK+ruHQ3zmD+8QWPqiHcnAIZZPGwjqF8I/H
         f85VDEP5W2J+ySnvivLF14qhMSUCc+AMkTGgo0Qflmy+4Cb6MMExPpH382MEy+PyeM1T
         gyo/sLLbU8MOnvMkW30nRe5O61WHMRTJbxToCqnuWs4xdeI79jTWV8wNuvvLK400dJf8
         o+w46P3hcYjFc5XaB0btdsiByYJ1S3FpfPi5viK9c6DSl4TttHOomuoUq8Tf9GYixai/
         PjUA==
X-Gm-Message-State: AOJu0Yw1TM3OxHJ1kwJH3SjcITlHngkpaeapjmn6PE6qY2svaXx9e1ck
	4prCKhWWYu0Y97yPslxekRlsuIzTTbftjisH+2Hxa/e+43Gac5cwWadpM1rb0gZnJCxYx0tMHhM
	RAxtyvWSVk359u57MbRjmdBhoe5PFW+1n8kdkTImqdVPIO4X0OqOtkYPeTuxG3HWUI9G4
X-Gm-Gg: ASbGncuHYy/rUYz5pU0sLYTZVVPeUY/MBjADPTTJK5n/WUFt/W+lbZyKcdiyzbRtJZd
	KHbQVIQnk5RRZNgzVSI/KIyfkgkIX7slb1zZ+GpW7I9uGPa/HXrQ0yxf0aeDHFyahzDRwFRXBxZ
	5LJwQQ5RhnNQOUdU1HOaX97q7ptuqCDnh8gZbNMypA0yZXpOaLo5oCt29tYKQ8xHDqDMgZXO8yd
	JlBiMyuoTXsuxIqtqVOJimhqJM9DUgk+BQbDzwPLsFoiMs+IYt/I9Ri/CDWQj1tI38h1bjKPrx3
	ulP51tCDyBfqTsL4MIxJURW3dja7wIoS1bIUFjffk1xphEx0qbMn4QDN8chef8uC0M08wKNGR3V
	FImAJdMiU3p4djE+94Npfxgj8Qm36xQeYttjA7ymGsL8Euoxt6DoP8Imb
X-Received: by 2002:a05:7022:258e:b0:119:e569:f86a with SMTP id a92af1059eb24-11c9c955bbdmr7216044c88.7.1763979958646;
        Mon, 24 Nov 2025 02:25:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGthYjAqXFcNn0P/z5iQGkCaVdROeTMnrGrxpMt+PRoQV9VJGpe0ff5LdZwq7kFCm8f9nw4Gw==
X-Received: by 2002:a05:7022:258e:b0:119:e569:f86a with SMTP id a92af1059eb24-11c9c955bbdmr7216019c88.7.1763979958054;
        Mon, 24 Nov 2025 02:25:58 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm46140627c88.4.2025.11.24.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:25:57 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 02:24:35 -0800
Subject: [PATCH v4 2/5] phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe
 PHY v8 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-kaanapali-pcie-phy-v4-2-d04ee9cca83b@oss.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763979955; l=4559;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=DMyrxN6zxkwuIu9tcvyVruPaU8b9DSq9n3Sg3itKewQ=;
 b=mHFHkNX7CUJhZUqILTQw76QAOoXGlU7bjT03UK9sM2hmMi/tKWxA/8QDBgZxPnYlYajw0Kyt1
 P51urhadpmIBJkgcdYJguq4mpy0h8uVZovdEV1usQ3FwXW0IjddX66k
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: J1r_HctciaqcTn5Vhk2kmYiemA5bwfWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MiBTYWx0ZWRfX+seaGlG7Nyun
 +aJ88cClYM8LgfwFXZAL3LlqNLlnG7C37p/DLZY28z4xcH9Pb6LsaGVHGQgwH/liljSoQB4b1Jq
 TPKEm5OE8gAmec65as+Ay0537G1gvjuvdm4Pi0V5knjCNZnkwDoegBXmYVtQZto508Vgm1BNr7D
 ujW3g3a65Tkwig5biDIXDgJ6aPtwEPGn5kUXOOdju83lp40Uzl/7xznrm1AmAul8oNu+F5sxLBz
 UG60pWPlBawfdXdz7SRnMmZ/Mwmsw4TCXgm++XY98ve9ZBHghJaKlApTXMVeRU2YeM7k7WuZUeZ
 JRtMkfkgWC2OSmMslyZdwLtHRiEHEyulk82XkA/KWKs3pUpA8ySX+4Dmf1uvJprwTKLPJ+cJrL9
 BepEQuoHI0ywdgMe88vmvkHw3E1t6g==
X-Proofpoint-ORIG-GUID: J1r_HctciaqcTn5Vhk2kmYiemA5bwfWo
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=692432b7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AMX_CUzcla2ZGstc20cA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240092

Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but requires
a completely unique qserdes-txrx register offsets compared to existing v8
offsets.

Hence, add a dedicated header file containing the FULL SET of qserdes-txrx
register definitions required for Kaanapali's PCIe PHY operation.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


