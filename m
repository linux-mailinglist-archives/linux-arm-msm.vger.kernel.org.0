Return-Path: <linux-arm-msm+bounces-106757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA8XO+Ny/mmhqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:33:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB444FCCA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8976307AE7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B272A3644C1;
	Fri,  8 May 2026 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icIVKM0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBLy+zLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96DA364EA5
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283093; cv=none; b=JPVQKMlbdjyAdhPCRcOan8+xcsQiuTDaNZ+iu6VId5gdJswhgeLGk+W4ewwnXiyMON7Fi0EYVf7LM4YoPvGjWu2ll8BkGWNMHxyUh2jLNawWJesK58JjFPnMMTUJVOHOnhnGGxpGiUx6L/+6goWV3GXMf8GauH/OpOJpmFxrIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283093; c=relaxed/simple;
	bh=vfLZQA0CCbl1QXldfy6CoH4yZcYAenCkW3y8IH9Sbb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atOq1sB293uKsIobjqegKJBNmoV9/xKEgz9FvelZmzht6BLMV0Osc5L9SM8G9pU+6ZSCOsXr4H+6JDKxYbDTx3e+YLLcWgs0xk/71ZL/ZlkVYSpSJ1g2nAvQLLZdL+mwbH6LhPG55tyh9cCaXxXDgdJnpw8nSMbTYfE15RPpkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icIVKM0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBLy+zLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GU0w0145541
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=; b=icIVKM0jpMTPynEE
	/0/QWh64sskgsZiSjtXRuhVEeO0v7IHN88FBHAWUijTNDZ5Y7/71NtCTFZSPDb4M
	0/FkGtSGTihXGwxsxCVxDxWxlgZyCVuXrvcWUySAw3Ktp1U2Sp4EETgeamLdJr0L
	kiVVh2/tV3yHcHM6yZN68fQvXz0DXL0KF3KXNWdiJWUHiir0OFxyCMkM31lQ9dmO
	Iz7DMke9fETF4oku2kFFcCizJCLNMBw9ONi05fwbaHjwhBmKC0VnSieJViuKhMys
	f5uZ4YAGDgR5dXqHiV9T1mHlBtAF0bffj/Agd8GQnqL8gVIT9v1FvFV0dENxTnZc
	vHGmOQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc16q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so3631615eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283089; x=1778887889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=;
        b=GBLy+zLWre8omSp1HMPS304zSfMNBmsIFlFTo9SLZW5LqYWA6Suh7mbMbYLVowyzia
         yHcMOq6nuAmc4+7IRNZttiaq3xbv1lNmbqQeuFUCLQUnkbDIhTvQL3plaZ6zbJywjgXd
         ZyaeyCjKGLye4NtzGN5ejYMRRbPir/sfqpdP6pS1Cx8CZb1p8mrXStSLlirJTSce1AWp
         5j+6xvzsC7S73+4j6QVnPDA1NJrN0I05+rPm3QRP5nBNfNt013nvNJ/xuh4ohosdeuOn
         enqGkRV31FgDI7tQtx7OZIO245iQO4rqOokE0c3BhpvOydhbQSPOEXV25vQsHfuFaghS
         E78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283089; x=1778887889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=;
        b=QlJVcQ2G7dqZQ81VW65R/RBkAHtfRvZEKlJuf6vrATGUl/7/HglK2IrUlgCsKAF1Gi
         Qur8AIfzeMGL6w2lkYhw4AXr85LR7qv2CVRUW9w4Q3uBcwwjSp9YAdj4ed6bMVWZGX9a
         XPmpuzIZQERwLlLgbg9AlN8DAnyXHX7eFGx6tNu/7tbf2yXqHRSHp+uIcIZnj50fqrSS
         WuQbDU+9ewMsOf5heaykxhAnE5ADTYlmpHFSrexX9nY9OAgHSBzcK+NoaupAgRvny3ZL
         88e4LCEAFnFzWtjJLMQFJ5mrVCow5quE7tYya8DiMz6v7yIIO970YCRITcXpu6u2Ha7m
         lG0g==
X-Gm-Message-State: AOJu0YzKq3p/RrGLTtSKx/DvZMwmLDTCu9ShpkvSmYXDKz5R16e1tbhh
	vALxXF52j41r38EeunS3MlhUZo08diL7ydNpdT5sDk1tWYYemImewOaTw4lsm8MosInKHIDjNS3
	sXTRK1erpKXiZrEWO542JHMdjtB3GFp20VnqOEYqJxEWzvxpB5f8vWKuMVPxkuVd15Bot
X-Gm-Gg: Acq92OHtl5dpDc3gya//iRUSEqpU/JdwbwTAvUXOUd5spsqPxKzZ5HhjDN+F/ENFfMj
	SikG2cYIyy6xPq/DD5sl6EL/yABmjDKSFCnXOT6xj7qbz9J/UyXfXrUoQLD9wq9k3+0fjUwNLW7
	PL0pT7RFPfVI+hjWPXZkfCss5ydLuofG+In1ymyOGkicIER8b2++cnS94ZXkFhvXzqg+rLTS9ex
	VI58u+BOsGx65uLONoLn6GVo2v5FLjb7sAUaIXLDyOGY9ClorcKFE2w5zbW1fC6HZIzyoLwzZ92
	MCqlyGXP3L5bmUTeK4a+QuAUKNmSKHpwoNaaXi1Pym2SSQ4cyp3+iuvBOpnuyPAk53oez5aGvH9
	51wy7/X4LOaSIwkmZwJOfjX1Z6KNaC4XkbVOAdR7anjWog7cVUjzmbK/61HQ=
X-Received: by 2002:a05:7300:724b:b0:2f8:1f2b:bb5d with SMTP id 5a478bee46e88-2fb4dc64acfmr72314eec.25.1778283089339;
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
X-Received: by 2002:a05:7300:724b:b0:2f8:1f2b:bb5d with SMTP id 5a478bee46e88-2fb4dc64acfmr72290eec.25.1778283088658;
        Fri, 08 May 2026 16:31:28 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:28 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:22 +0000
Subject: [PATCH 07/10] phy: qcom-qmp: qserdes-txrx: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-7-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=7004;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=vfLZQA0CCbl1QXldfy6CoH4yZcYAenCkW3y8IH9Sbb8=;
 b=bmvtUYIFshNewunoSVhSb6tAx1rE1/5kX2iA1qfTi3W7ZgACnNKSjABOatUqv0yJLGU1/zpmG
 3+44mZ7aNqmDz6nrgeGrJBaXZtYl6n2vsW6B4zDjsR0EXYs8kDTL2b8
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX/u6KIjJPTqIi
 T4CIqeXVxVAi/MOfyG+nZ2dAkoIgm2tWILW9kivbQkYcjQSdPpFLqpJG743ycC2PlpTJTnRUWoj
 kPMKG7Oa9CpZzhzIlf6HWo3ftNz+bcwt+2/lBO2LXcls8yfvZIAq3+EAzkqUz+Y7MwFLFamZzTf
 dzVB3OIjsbH97NYu1LdT63Vhk7ctBGtckEwJ7KEKU6HapqiNF4urk/0ieNRgesaj7Bc+cUEDyfb
 5OpeFhbbucUW7vUjGPGpaBb2fI4tZS64mtZKnOGXDE9vysJyVbtxBTtFbSpMfCnTw6i26wO00lz
 fXBFSQzOzgfjk6yZmVSWtgy8NL2lziPgw23XZIWBFjld/Xa11UYGoG2FIokgGBk+AeXt7foVchn
 5dc8TOGgzqjoi44l1PoEQijind2cZjVeEBjz9SsDdviNj07r4Gomcadb4qhbYSr9xwnLlPQz4pQ
 aQnxCnEmeClixA8TDHg==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe7252 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3YFJjVyaoLhYZoL7l5QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: InFjD6rXRk3rEnWz8sqabC9YFSdqMUS1
X-Proofpoint-ORIG-GUID: InFjD6rXRk3rEnWz8sqabC9YFSdqMUS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 5DB444FCCA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106757-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hawi SoC bumps the HW version of QMP phy to v10.60 for PCIe. Add the new
qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   1 +
 2 files changed, 110 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
new file mode 100644
index 000000000000..3150a494685e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_TX			0x034
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_RX			0x038
+#define QSERDES_V10_60_TXRX_LANE_MODE_1					0x080
+#define QSERDES_V10_60_TXRX_LANE_MODE_2					0x084
+#define QSERDES_V10_60_TXRX_LANE_MODE_3					0x088
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE1			0x0c8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE2			0x0cc
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE3			0x0d0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE4			0x0d4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE1			0x0e0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE2			0x0e4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE3			0x0e8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE4			0x0ec
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL1				0x12c
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL2				0x130
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL3				0x134
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL4				0x138
+#define QSERDES_V10_60_TXRX_SVS_MODE_CTRL				0x19c
+#define QSERDES_V10_60_TXRX_RXCLK_DIV2_CTRL				0x1a0
+#define QSERDES_V10_60_TXRX_RX_BAND_CTRL0				0x1a4
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL0				0x1ac
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL1				0x1b0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE1				0x1b8
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE2				0x1bc
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE3				0x1c0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE4				0x1c4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE1				0x1d0
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE2				0x1d4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE3				0x1d8
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE4				0x1dc
+#define QSERDES_V10_60_TXRX_UCDR_PI_CONTROLS				0x1e4
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE3				0x200
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE4				0x204
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_LSB			0x218
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_MSB			0x21c
+#define QSERDES_V10_60_TXRX_VGA_CAL_CNTRL1				0x280
+#define QSERDES_V10_60_TXRX_VGA_CAL_MAN_VAL				0x288
+#define QSERDES_V10_60_TXRX_GM_CAL					0x29c
+#define QSERDES_V10_60_TXRX_RX_EQU_ADAPTOR_CNTRL6			0x2b8
+#define QSERDES_V10_60_TXRX_SIGDET_ENABLES				0x2d4
+#define QSERDES_V10_60_TXRX_SIGDET_CNTRL				0x2d8
+#define QSERDES_V10_60_TXRX_SIGDET_LVL					0x2dc
+#define QSERDES_V10_60_TXRX_SIGDET_DEGLITCH_CNTRL			0x2e0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B0				0x314
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B1				0x318
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B2				0x31c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B3				0x320
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B4				0x324
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B5				0x328
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B6				0x32c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B7				0x330
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B8				0x334
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B9				0x338
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B10			0x33c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B0				0x340
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B1				0x344
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B2				0x348
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B3				0x34c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B4				0x350
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B5				0x354
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B6				0x358
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B7				0x35c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B8				0x360
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B9				0x364
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B10				0x368
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B0				0x36c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B1				0x370
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B2				0x374
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B3				0x378
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B4				0x37c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B5				0x380
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B6				0x384
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B7				0x388
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B8				0x38c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B9				0x390
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B10				0x394
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B0				0x398
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B1				0x39c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B2				0x3a0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B3				0x3a4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B4				0x3a8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B5				0x3ac
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B6				0x3b0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B7				0x3b4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B8				0x3b8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B9				0x3bc
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B10			0x3c0
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE32			0x478
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE45			0x47c
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL1				0x4c8
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL2				0x4cc
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_TRIM				0x4d0
+#define QSERDES_V10_60_TXRX_TX_BAND0					0x4e8
+#define QSERDES_V10_60_TXRX_TX_BAND1					0x4ec
+#define QSERDES_V10_60_TXRX_SEL_10B_8B					0x4f4
+#define QSERDES_V10_60_TXRX_SEL_20B_10B					0x4f8
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE3				0x53c
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE4				0x540
+#define QSERDES_V10_60_TXRX_PHPRE_CTRL					0x5e8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 85da2581ef90..e461a000da48 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -43,6 +43,7 @@
 #include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
 #include "phy-qcom-qmp-qserdes-com-v10_60.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10_60.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1


