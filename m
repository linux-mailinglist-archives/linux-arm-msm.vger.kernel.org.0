Return-Path: <linux-arm-msm+bounces-25657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AF92BBD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03C8BB260C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F7017D8A5;
	Tue,  9 Jul 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LsWsh/7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2171850AB;
	Tue,  9 Jul 2024 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532934; cv=none; b=nBo0pWYX7zv3YLVEhlKA77QCM+CwtsExtB6JvPDOCkZDHP3KE2tVuh8+yFPYQrqaaVmfB1q45e3L4HN/AdgrGhGpcY/6Ayn7iEgiLCIyziTU8OcMDTp58oonNQTejw8E2LGLIg7GQw3XE/4oGuJ9LlFb6hQ1vhwVtyhmQq8Std0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532934; c=relaxed/simple;
	bh=NaIsI/L8OK790aYO+UdgIwcvr7nmYZ8ft1YP2RSUKF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QfUu0rlh4fd8Rcl3q+dKItdSSKzfaKY490cvZMLHabDsWwLJ0if0io6mUbsDv3JXp4ajPoAj6OHNlwlZAzajg/uE141w1xtT2doeSBIFwb6xJlLALjnzaAORCKBDrcgRBulTdTBnf4W5bqvSmpXHoYjF/iKkk04c1jLnCUcE0e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LsWsh/7Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BUOKp023826;
	Tue, 9 Jul 2024 13:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwCxETancVtBkiHY3JLPn1i+sMYt9QfFI7eDzvmq74U=; b=LsWsh/7Z/+5UOSpu
	xcswHLBDYbl070K6paSItKvzdoLxXebnBaBb+m6a3ZrEK88PqTmhya0xidln/s/3
	MAtKyvb6jOdRbeCibkzilxMO8ND+HA/i5g0Nxsgx9QoHjSYiv6R1xpswiHVV3wy7
	fhqOR6ha5r4hJFelxYW0NREyMb6aFC1kJSIc8ZeywevuG2rYl1N9SAFSsFNu4476
	bRcH+BAf+8Sfnh0FRvs5WQWt2GF4JSB5XHEkgaoBQGSZTXk7kRJOM6zOx5gkcOmJ
	aUOmiwuw2o5lNnL6ODUzzzkIHTM29MrxBGxaNqC+VeSLr/Jf+RpwWdT8DJMtEWOk
	ZM5sKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwpjkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:48:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469DmaZS025683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:48:36 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:48:31 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:48:14 +0800
Subject: [PATCH v2 2/2] phy: qcom-qmp-ufs: Add QCS9100 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-2-e7f8f71bc334@quicinc.com>
References: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-0-e7f8f71bc334@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-0-e7f8f71bc334@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720532905; l=1140;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=NaIsI/L8OK790aYO+UdgIwcvr7nmYZ8ft1YP2RSUKF0=;
 b=ndurFlWsb65HStNLE6MKkelNrFOWnwfdH8jeY4iHRSaN9lSZY/PVk2yxH8yWWb+2VfdaowhNy
 vCQMYCxnqspBCMtgpBt4fEnGGHwkaM6CksioGJaW+BxkG3KSeqr99Rd
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e4Aoaw8OGiAAy8bGL-7p7JILO7_tDrJX
X-Proofpoint-ORIG-GUID: e4Aoaw8OGiAAy8bGL-7p7JILO7_tDrJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=967 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090088

Add the tables and constants for init sequences for UFS QMP phy found in
QCS9100 SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-qmp-ufs-phy" to the UFS QMP
device match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a57e8a4657f4..cb72843218cc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -2010,6 +2010,9 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8998-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,qcs9100-qmp-ufs-phy",
+		.data = &sa8775p_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-ufs-phy",
 		.data = &sa8775p_ufsphy_cfg,

-- 
2.25.1


