Return-Path: <linux-arm-msm+bounces-25675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAAA92BD40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9EDCB27AD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A662C19D091;
	Tue,  9 Jul 2024 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nOy6mEAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0E19D071;
	Tue,  9 Jul 2024 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720536113; cv=none; b=u2tQg1aTD7cvvmFw02L3Eh6mIN9DRKbQcdFd12Wv94jAYQk4KhdYoQE9vmBhnrdpuP4ltjPTDwBdgBKjbBVkkomKyQ6Q+PG+oz2tNYdKIV81nqfi+0vQvEnSkQG+P2nxGv/Lcr4s3bC+4kUj58Kkph8GrJFk5dYc1ZRLyuINB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720536113; c=relaxed/simple;
	bh=DbeD2/9b/e6pW8pptf5a7p7oIN4vl77tUY4YGhuUCSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jpi9iOxM1JaUs+WnZFKWyH1foJaL8AjrCsPV74Hh/RJ3Kd25b5y0NSBX4pKTAJAuzGYXeWxEW/e1b+22hizYFkP+BavTYtt0gtDTq6oCefGEGx3fJ+7PXWnce72vVb857A+gStnRbgqv9IcsfbPm1TgR3jlIuyTZpp67GVXxQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nOy6mEAR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469ACP7f021168;
	Tue, 9 Jul 2024 14:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zF8jLTNVM2V+DrN02BJaLRUS3HUvWBScmefL+FSG2xY=; b=nOy6mEARXPPSBlfZ
	H0KV4MW0/JAWeMvsJSTzkR1MTCciVdYJkHP4OH0nu0O5xvt/gDZlCdGIbYuQyg9C
	6pwXpI/bj5vVUA1RoRQS3JjCm11hZdXUBNlDGcmTXROlSC1Iw6wuICT8UNVp5JCj
	l2yIpvYoR6FnosMFRUNl2+hVxD55l9yHd8RUkUiwLhIg0W5iSdWbLYvihA3gbLo3
	5FAvYhuuXA8/bRJywp7Iz0Vycm2ar1IG3EKKy9lN7dyTZXRGyC2l2J06Gfbz0KJd
	dWAEyBrvEst8kYQHBIQo7GYwiKdWy1ulxnq3xm3yEpc22ektpx43uR5UqFa25Via
	EdhaFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn6yd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:41:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EfkT8007610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:41:46 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:41:40 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:41:27 +0800
Subject: [PATCH v2 2/2] phy: qcpm-qmp-usb: Add support for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-2-e83b9fc7b280@quicinc.com>
References: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-0-e83b9fc7b280@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-0-e83b9fc7b280@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720536095; l=1115;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=DbeD2/9b/e6pW8pptf5a7p7oIN4vl77tUY4YGhuUCSw=;
 b=Os/BputCReEdMnyRbK4RjFpbee8gj4Qv3mSHUNESXb6kudIqX1fOXr06lxAY6ecWFpgxju05O
 jepRiwjJzyLC5KHT+MS5jwXXFTHqvWVpCL4fYioncSbHUJb6Aa4xO9k
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VTu_SkhgsXRFEdC5R7GEbz4A0DLO34Zq
X-Proofpoint-GUID: VTu_SkhgsXRFEdC5R7GEbz4A0DLO34Zq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=744 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090095

Add support for QCS9100 USB3 PHY.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-qmp-usb3-uni-phy" to the QMP
USB device match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 9b0eb87b1680..4ebfac113d86 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2246,6 +2246,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs9100-qmp-usb3-uni-phy",
+		.data = &sa8775p_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,qdu1000-qmp-usb3-uni-phy",
 		.data = &qdu1000_usb3_uniphy_cfg,

-- 
2.25.1


