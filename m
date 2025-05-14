Return-Path: <linux-arm-msm+bounces-57830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA78AB6A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D997D3BA352
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AE027A450;
	Wed, 14 May 2025 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhTitBZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDB127A130
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222656; cv=none; b=oFPffxfZVAvp+afki53o7RttfAGh/5KfXawtundEJ8WiueP2p8or/BHDdZLSaK1BrCbgpXWo0FYpHuDx2m0DM0pCwaC+YX8ndRmn06iM31Ku8xrF8N065kPtHzbOxTn+Rnmp4Sh7RmtLgbd5SkPxrqHOcN5h4nYiOmDcYrncBTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222656; c=relaxed/simple;
	bh=uzen6Ng/v2BITz7jwC3XuGTzN7eqisBIWb7fDr1caWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfeL1ZsfGoEmcMGCUWvkyPOEHrLRqp1YYo/4Qcfgvdyv2yNNqHCWCbREjVYRkGdAE8mLzDiyJWu07RY9nRplDE1o044jDwRgnq5+DcGc1H2oyJiOBdCT8ByC49IVJ16WgszRWvXpEW2MW6LQzkAWLu4o2rPlHbAgzDqgj0n4URk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhTitBZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw1c015993
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NE3nENNbgV22Ph1JMC8Akt7MvA+95loyFI9VpKGLt0=; b=HhTitBZPSQGBEDy2
	3NwI4yFF7Q7bAah3cmFeWdZq1tLQHGMwtPV39kNIyS4B2VDm9SxZ0hnRPYsq1AjQ
	OPNBEjRIFL9sKGe+IWbhcloQVH+hu4QDNX5ig6qkLhF4Qc6abcs7i7M+rrMpG7M4
	aFyX7x2mzzEHfcEdGN2GOP+DprHwwkfuIXELUWoGmdzAcVAJvmeUwBv2hRkHVaNm
	Xq6V99vK/5AqajJJ4+o0tBVS4SKHbC/q4Z3sY3gW1AeIdMIBKCNwjZ/29wsDr+Bv
	79UFVrbNLy10lo5mPpnqvWFa9Vq7zpQIuzKmsepcb3yzrTtGm414uE4iWJWI/vZu
	LShCCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmthp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425ba8300aso3118497b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 04:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222652; x=1747827452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NE3nENNbgV22Ph1JMC8Akt7MvA+95loyFI9VpKGLt0=;
        b=kUsOwgM7znD9UASyShJIQgSrmfDI3HbsKrWefhAWdOw9jlNI9BMTXf/Qw5BLQyAZxh
         uqM2bqM2xlxVb0vTvPOkx69tPPhB/d1/BRXhcAuESlAmrGaRMbuMp+6jHdM9HIzeLj5Z
         3ZBryZ/Qz4IPecjaPbojv9wpaPRkVdvPdb8ZYwG1setNQ6WB3ZX1SDuhlwytlAjzrY6f
         I2G7pwkIbldka2i/1HUsMwRwXDRaGmoPw3tK5NDH0F4UCeLzs/e+net751PJwQsCFFZq
         zjr+4bpHKKQpimAg1eAuEMJvQ+m0J+tscirO+9gqAcGJyjVGt/5D+yE2EcFg6261tiJN
         PxGA==
X-Forwarded-Encrypted: i=1; AJvYcCXJCrTNhCK9YGEyjIN4tCEB/HwuVji3zpKKEVdDDifcca4T+d4GXVq+li+NYKlqp+vJsLNG1WW/5YmR4BXX@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHxq7/zLXzOEtzwa6Cb4mpleL8bgJOkz+AaGP1d6kiBSegL42
	flzYcshZUdSWvUrIGGPwMQ5kR1CAV5dxpxHNzyF4hwIr06sLhlUFa1F2+ubNqbaUt8uX7SLR/WH
	opHW00QW5zttp3UtKt/w2iCAggm56/mY2XNWveeHcpGeNj1lsBoLNhKFentYf9NKl
X-Gm-Gg: ASbGnct1t/V5Z/Q47h5XCSNfIDEi59xz3LsntHx5aDqXFA413zmRMajm8PxjgvQe2UP
	bxj31RJZbnSP/uNAbGO0w3Zo4G2KN2UnX+662QGH94JLMtLJ0iJ0yzLrbVSJncI2CKsvId45Mmx
	kEnTf6OVN2Y7NHCqQ0R1q/hkZMrY1VtJnvp9okS0rEOiEuGp3ikjtSIqa2I8CH74D8iRqv6YR3t
	5Aq2+6TojrX/VbX0ygrvuxUCeVkoy5lNV25lf3F+LQyWhj5dr0RKmzpf6xvHequsDMcfhGxuuKZ
	vhxiPp/Sf+6lFmFDX9Ru194m0DcWWejeqCbN
X-Received: by 2002:a05:6a21:7a8e:b0:215:d25d:fd1b with SMTP id adf61e73a8af0-215ff0d8fb4mr4522764637.14.1747222651895;
        Wed, 14 May 2025 04:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNJuc3RXG7m7YbFEzBLofS/pkp0EO8RpN4H/L4C3p/AJoJGQ0To7Cb7tCVrsOmj9eS8NF1sA==
X-Received: by 2002:a05:6a21:7a8e:b0:215:d25d:fd1b with SMTP id adf61e73a8af0-215ff0d8fb4mr4522712637.14.1747222651353;
        Wed, 14 May 2025 04:37:31 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349ec78c3sm8652783a12.31.2025.05.14.04.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:37:30 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Wed, 14 May 2025 17:07:12 +0530
Subject: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
In-Reply-To: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747222639; l=14792;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=vqAqShyk3tqr6NG3BIwVxL93G2RInb/ZupUPYginZfE=;
 b=f702slpzx5yxfRFyN10Xl1Rojhp1IYnV+HJ7I7G8trmUcbQ75PC34ZLlKnm+HW3CnY8L9LXAy
 glqHuLz1f7IAedRu2qibqZTg3v2IRJKiVV8S0HKRwN2QV28fhENz1JP
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: KoddFwPh7oEmB08Erb44hvXGCI0-XTne
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824807c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=5DODS05Qq6CApmbB4pQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KoddFwPh7oEmB08Erb44hvXGCI0-XTne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEwMSBTYWx0ZWRfX0/gkuePMvEvX
 k6i/7Jpqlb2TrDlAduK3fDhcv/nrMtUp8RGyTpmMSPVZYR7MMVFhJ/zD2bU2WJ7axmM8StpwWLJ
 KTMA3UoIOKpoj2RwbkCsRH5ZsNZfxt1jFxzeGvkGsp7hqmqrxa9y30sobdVI+RTmNDJ7pt88JRG
 TWZ9Cwr3w7UH3Vm1/ZC8a6aG0zBmhcUsFeTCxjKKjq6K87es7x4RdXzw3UVU6RQHrSc2hM7G9dX
 2t8A2HxH1QdDLC0BlCLWcuPOPcUXk84Bgmxl9/Y3t8McxG4DNNSa+hxC1OvAGQSwpcipUrJYKHT
 hdQDaceTn3RwLbZvPukge4wKnjJ9df86pmMdP+WxMBe4tUDIqKPcM067Eo0+EkxC9EUlSLI+MWU
 7Ah7tfQyiAiCLZLRvfKvJOxGLruWYEjpXV/5tYFOTpLucpbEait/J8JkWxIXesdXnF5X0l3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140101

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

Make changes to update the PHY settings to align with the latest
PCIe PHY Hardware Programming Guide for both PCIe controllers
on the SA8775P platform.

Add the ln_shrd region for SA8775P, incorporating new register
writes as specified in the updated Hardware Programming Guide.

Update pcs table for QCS8300, since both QCS8300 and SA8775P are
closely related and share same pcs settings.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 5 files changed, 66 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ab90aafb313e6e759c0f88589013632bb6277807..cf7122a2b8bac3af591daceba01be1bb791c53cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2639,29 +2639,29 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rc_serdes_alt_tbl[]
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rx_alt_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xe4),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x29),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xfb),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xe4),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xec),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xb3),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xec),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf5),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x5e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x8d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x7e),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_PHPRE_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3, 0x37),
@@ -2680,12 +2680,12 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x7c),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_IDAC_SAOFFSET, 0x10),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_DAC_ENABLE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 };
@@ -2699,6 +2699,8 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V5_20_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V5_20_PCS_G4_RXEQEVAL_TIME, 0x27),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_EQ_CONFIG1, 0x16),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5, 0x02),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
@@ -2711,11 +2713,19 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl[] = {
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_pcs_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LOCK_DETECT_CONFIG1, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG2, 0x50),
+};
+
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_v5_LN_SHRD_UCDR_PI_CTRL2, 0x00),
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
@@ -2739,27 +2749,27 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xd2),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xb6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xd2),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xb3),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xee),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xe6),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x7e),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2, 0x0c),
@@ -2767,14 +2777,7 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
-};
-
-static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x06),
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl[] = {
@@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.rx		= 0x0200,
 	.tx2		= 0x0800,
 	.rx2		= 0x0a00,
+	.ln_shrd	= 0x0e00,
 };
 
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
@@ -3398,8 +3402,8 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx		= qcs8300_qmp_gen4x2_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x2_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
 		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 	},
@@ -4067,12 +4071,15 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx		= sa8775p_qmp_gen4x2_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
-		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 		.pcs_lane1	= sdx65_qmp_pcie_pcs_lane1_tbl,
 		.pcs_lane1_num	= ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
+		.ln_shrd		= sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl,
+		.ln_shrd_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl),
+
 	},
 
 	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
@@ -4112,8 +4119,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx			= sa8775p_qmp_gen4x4_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
 		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 	},
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
index 283d63c8159338b57a5026b6c2a86e3cce21097c..951de964dc1242a15efee135266ddeb10ce598df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
@@ -13,6 +13,8 @@
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
 #define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1			0x0a0
 #define QPHY_V5_20_PCS_PCIE_PRESET_P10_POST		0x0e0
+#define QPHY_PCIE_V5_20_PCS_G3_RXEQEVAL_TIME		0x0f0
+#define QPHY_PCIE_V5_20_PCS_G4_RXEQEVAL_TIME		0x0f4
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
 #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
index d3ad5b7f54259f27aa5e97991b9d7372e378cddb..bbee68df4e143b187ae02b5148be63ef7e37ef59 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
@@ -8,8 +8,12 @@
 
 #define QPHY_V5_20_PCS_INSIG_SW_CTRL7			0x060
 #define QPHY_V5_20_PCS_INSIG_MX_CTRL7			0x07c
+#define QPHY_V5_20_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V5_20_PCS_LOCK_DETECT_CONFIG2		0x0c8
 #define QPHY_V5_20_PCS_G3S2_PRE_GAIN			0x170
 #define QPHY_V5_20_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG1		0x1b8
+#define QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG2		0x1bc
 #define QPHY_V5_20_PCS_EQ_CONFIG2			0x1d8
 #define QPHY_V5_20_PCS_EQ_CONFIG4			0x1e0
 #define QPHY_V5_20_PCS_EQ_CONFIG5			0x1e4
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h
new file mode 100644
index 0000000000000000000000000000000000000000..68c38fdfc1d826f1ca986469932ef6c0835248db
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_LN_SHRD_V5_H_
+#define QCOM_PHY_QMP_QSERDES_LN_SHRD_V5_H_
+
+#define  QSERDES_v5_LN_SHRD_UCDR_PI_CTRL2		0x04c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index d0f41e4aaa855fc3ee088afc833b214277b7e2b0..6a7ae5199bba6f34d228ace15ab2b452fc0d50a9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -25,6 +25,7 @@
 #include "phy-qcom-qmp-qserdes-txrx-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_20.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_n4.h"
+#include "phy-qcom-qmp-qserdes-ln-shrd-v5.h"
 #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
 #include "phy-qcom-qmp-qserdes-com-v7.h"

-- 
2.25.1


