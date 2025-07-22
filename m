Return-Path: <linux-arm-msm+bounces-66004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8CB0D2EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469323ADC46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95942D372F;
	Tue, 22 Jul 2025 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb2lJZoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6E2DAFC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169023; cv=none; b=jQOoyX6/SDC2cvJulmq7r0kMMA3ToA1RtL7qgtGnMzn8g/yJSHyR39Div1hrOduJrzlQ7rDhftd+scvCsYkF4qwC+3iThtObPt/gkx5eYeuazkOIg0oPW6M+siA+qKRaCrl13/NDgTYb0tMAuPlxMoUk28cq1stUTB7ZKg540tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169023; c=relaxed/simple;
	bh=IqNy2UOlnRxZPX6+c35gyiwHyCJKZ2vyWBvAK40oYUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEEvpw7Qa5M1rdJl22lp/0puDiLRbRM0hOP3i1oaMgyPtIfbsQjGkYLU9i9og3w8nuhO6MPqKBQF/lUwdwHYZd2sDrt3P3lH+27hnVSu4LiWjf3S6MoNHt5T61q0nSSGheWx6fdHnhH5zJUChQuOTqrzogpz9OqOG9zefLrK1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb2lJZoK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2mgjC017547
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6T5LoZlt4M2Nfb5X+7vfdX4LAsIOmzT/JE+HlobZE30=; b=Nb2lJZoKQUj0tLuH
	eRFnlJbO4HBHeUIrBulW0/dZjwGRnZ6w5pOhm4JWHajPfwLFKMZJIfBodb2Wkm8a
	WrAj0g51s5ii0drQgY0tVfrqg54VZziMNKT+gpWe5D8o10Ik/s1dWGLnuGpJRUD1
	ssVpJH2CIyvOxBgTwMWhthE6MxTnvPXsmLxRi5pb1jWOuJdhMb4tEIDXGr9SQx/0
	vxputu7C0op/3W17gMHHTqtT6R9Z2XC/h+2IE1MLyM9cxiyXAhoHWCIWdHAKyENd
	/HXSlfxyAXuseIYGBMpY9uoj2QeCeKBmPaJrVAAUz9sWBISvkqILHf7laILObGzk
	PeqkjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s0hu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31c459ccd56so1117215a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169019; x=1753773819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T5LoZlt4M2Nfb5X+7vfdX4LAsIOmzT/JE+HlobZE30=;
        b=FwUz3129dHudV0POnIOWMqTCsL4jm3MMOWzpKiB0XNa6XhH7Mb4UPj9drO1DOLBWGS
         3qUxs3sGRhh7uCgmQSbRFgrGQQLZRGaREtkoOGzLlU44g/5FB4fQRjB9bKBwe+1kTFZM
         izoly37tNpVoHT6EntnaTrt/8yE7jXDuPOoWaWVe7LtbwJq7vxLgYS6ljGKAPv3hOpVQ
         qfjh/yjNkb8X6MrO1wWe8ytxQnp10YfF4wJAwEM0CHZm0zFbLjC3OXQ5AJAKtqBmbVPR
         NmAl6MMgxfHRVJEMklR7LmJfY34KugPXe8tUqpRXAr6B6VJ04YpPcACJPD5sE4TdC4jh
         t2jw==
X-Gm-Message-State: AOJu0YwWz0DqoD6TCY/TC6M+GPFfb+vw4aQ2kdjuOwqo8CIALdcVo6AF
	UH10x6hA9nDjtmR99v5NzCNXnjP/T4YMIovu0IU0iIs4nJg7+oqhWpZHBpPCnpawp/09fXBRgyo
	H+90ReW5oawex5laJig/x6UlTNM2D8OhcAGyesnTllPo/WNyKfBBXHTYklSZgbzGPD5vR
X-Gm-Gg: ASbGncuXvqcz2s5Cids8WCsER95UEyTL6Tpu5MmWtd8FZSQjqPFXoY0zUm7P8qfOo3t
	xloZva9u4ElhgEDyHyk1c16jCe0dSfDJe1OPpZzpK+5VFRYR9gRBkE/uVsmrDBdlFpYhTcEDnbJ
	6q6m007FvaA0Kajbpf+nOJKQinJOICW8DUVH1BIPDYrJETcFewDc5DzrcTlf9urB+Q2HU7WDrZR
	8zfz0ZGq6I46lFnR705/XBzpqqeRUGQvBmtlDPMR7kI04mtqrF7N7h3wFvl4ZL7UV/grGovznS3
	7zucZG34vfSzwIxbQ++wA50VrnTIrf9Qf8yJrxrx6ucs+4xOJR2Zoqs1Va/94LjV1kup1YKw0mx
	eI4Ztpn+8lbpsySTlEWy92gAEFzval7Ndfo8IPRizpSHsLFrl7JoB1lUp
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id 98e67ed59e1d1-31c9e75ef95mr12583149a91.3.1753169019026;
        Tue, 22 Jul 2025 00:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUBkompgYp4NsbDBV07hVcCo1eE/2e6MRN+tw1ZOzoeY3VNs+3v9W92tzFmCZwxBRf2BDv7A==
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id 98e67ed59e1d1-31c9e75ef95mr12583132a91.3.1753169018485;
        Tue, 22 Jul 2025 00:23:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:23:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:12 +0800
Subject: [PATCH v2 11/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-11-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=1803;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=IqNy2UOlnRxZPX6+c35gyiwHyCJKZ2vyWBvAK40oYUw=;
 b=chI1sTIkkoEQ34btM+a8bsvY7GDpzMDyBcI0I765ZtJRv43IghZ0xyFcN8ZZvoqA0o1cTqVom
 /JIMtAyXyYsBWSgRb/wbBdHsI+7fA5OjpN64gKTST3z1uBj7gp9RO1t
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX8Cs3jh4yUZWX
 pZ1wGiI/cc5X5vHrgtd3bLujRNh0pCYtx2g5y1+omY2N9b4VJPs7vlxBZwgYOhEbnE3dagwsAOZ
 MLjImtEPke+HrCKXsKU/rGqBGp3O6dsWBF8Lae4FSGgS/pd8cvvhCXU605JE3ecG4Qxy+qxV09H
 ztY4nBCoQXnVFvU4COScncVOfx6Enkg8bj7w5ovTXDX5NKPYhHfQi4Z8JlYDs4v98/uyAV7kSrn
 hBVounVHQ6TohnNaoJh5uVLQPHQlkzrdDiuMdkvAr/HHms+PG0fhHgeQDuF5ecmzh/jP2pmWCQK
 Mdygb6N9qwpd1wftG+ljbsdlmH84HzvgKMS6OCOlXhrKJ2fwv04cBIXJrwv98yrX8qoLnYA8nPz
 xBH3Qsoa5P1QlbiJPi1yL3DyC/8zed5Fn2jcwRvRqd2GEPbtKbP/uwzZgg1taveL6W3NjjXt
X-Proofpoint-ORIG-GUID: gsDuWeZiRcrbWVNIJeF2aQul2sLiZtNl
X-Proofpoint-GUID: gsDuWeZiRcrbWVNIJeF2aQul2sLiZtNl
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f3c7c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CWFEUPHrMG6v4K5r7EwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

Register the QCS615 DP PHY via device tree by adding its compatible
string and associating it with the full DP PHY configuration.

With this change, the DP PHY driver for QCS615 is fully integrated:
- All required ops and flow are implemented
- Platform-specific configuration and init data are in place
- Compatible handling is aligned with USB3.0 PHY via type-based
  dispatch
- Supports coexistence with USB3.0 PHY through mutual exclusion based
  on shared TCSR region

This enables end-to-end support for DP PHY mode on QCS615 platforms.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e97a206a10554b2d157d1fadd66d66386eec6c40..35fecf78736f7a6b9c3af6a89c71fd3ad9a87496 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -699,6 +699,11 @@ static const struct qmp_phy_cfg sdm660_phy_usb3_cfg = {
 	.cfg = &sdm660_usb3phy_cfg,
 };
 
+static const struct qmp_phy_cfg qcs615_phy_dp_cfg = {
+	.type = QMP_PHY_USBC_DP,
+	.cfg = &qcs615_dpphy_cfg,
+};
+
 #define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
 #define to_dp_cfg(x) ((struct qmp_phy_dp_cfg *)((x)->cfg))
 #define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
@@ -2204,6 +2209,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_phy_usb3_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-dp-phy",
+		.data =  &qcs615_phy_dp_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
 		.data = &qcm2290_phy_usb3_cfg,

-- 
2.34.1


