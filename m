Return-Path: <linux-arm-msm+bounces-45118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0015A121F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 12:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48CBA16B968
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA771204583;
	Wed, 15 Jan 2025 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SJeEdALV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162D61E98EE;
	Wed, 15 Jan 2025 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938926; cv=none; b=LMGGv1Qlp1+DbTvOCfOKOvYA4lDo9SU4NcxUOjngEZIsHTqm8u8BJQ76pcIFt9EL9+l/G1k8Ir9JOJsAnITA5665W4/5bs8jt0MsQpiA4Pn4q41GgKBP9jwsfZCKBHFBtvO5+NRJ2fRCHSULwA5HTuo+UOtRdDykQxUyq9ET5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938926; c=relaxed/simple;
	bh=CsmESyxROBbqsNTtaC+QBprFbUxxKYYA88zeL3ghUHo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rUyWTQjB1l/uA8fZ169Na339PkUYSM7aXPd8vZeCwn+nETVBHicQKC8+wPb0Mmk5t339Ns5uEpepnDo9O8vigIByKXulvu9Uow0co+f4SjgvIlgoVSX9Q7KYHPQWD+jJBlatFdGHNBdKIK5B/YojiK4Jj91BxHWDjsdgLVIV2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SJeEdALV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F8lSFm015786;
	Wed, 15 Jan 2025 11:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HCgZq0+rtEYUV1dT5WIcdx
	Mrj4bXy1evMCJ9sPUGCN0=; b=SJeEdALVMeu8x0Ui9EhLYvMQda4zYUppewSbf1
	hcl7UIlFgN1fXab0SNo93/yfK59SgGz4kTP5q45DEyOyXZyzUghrkbJ+PIogRJrl
	30b+91zSDvbaiRVvph6XGRhW9JKbvcm/YPRCU/3qUp17El52SYNx8rrlgLR3KC5G
	ubfyDpnT+zPWzdUQAhnLOctOQh8BHxmDrCpU2cAAmHRj4bIkJ0NjM3RUJS0U45sY
	GLeduNS8yxFR6NK4p5mOvx+8+VgHK7tCKUBi+NGB0JE9FuvZLxG/WU97whVU3hfA
	I4YWEAZGc1xxgXKup0E2UZxoz0CYIPtY4sZ9oDaIKPJDhcWw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4469tpray7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 11:02:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FB21dr031801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 11:02:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 03:01:58 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: ipq9574: enable fast mode for i2c3
Date: Wed, 15 Jan 2025 16:31:42 +0530
Message-ID: <20250115110142.3501140-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2nB2iBnjUwkUezpvoeyCQXv_P4JC987n
X-Proofpoint-ORIG-GUID: 2nB2iBnjUwkUezpvoeyCQXv_P4JC987n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=742 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150083

Configure the blsp1 i2c3 bus to operate at 400 kHz
for fast mode.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 942290028972..b35df590a794 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -621,6 +621,7 @@ blsp1_i2c3: i2c@78b8000 {
 			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			clock-frequency = <400000>;
 			assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
 			assigned-clock-rates = <50000000>;
 			dmas = <&blsp_dma 18>, <&blsp_dma 19>;
-- 
2.34.1


