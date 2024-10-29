Return-Path: <linux-arm-msm+bounces-36255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E689B40E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 04:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371231C21D8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D205320102F;
	Tue, 29 Oct 2024 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HijA2jIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51E22003D8;
	Tue, 29 Oct 2024 03:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171611; cv=none; b=KNUtDS+9biXYZjC/08cAGPxxICuo6g0ckVo5EoosP5JcmHTEWFWEtlawFDWT9gM9vAOhZ5s+Pk3A9xDkOsveepdYqfcXuNZxXYBTGw3nDX+s9p+1p5Di7zfaOkMwueX/X/2ZlUZwbvwe3fi258d1CyyIoUGweDkTLiiYb3dq8xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171611; c=relaxed/simple;
	bh=WtH/AOLyIefJgIAKyQQxmk4EQtRLGA5Wgd3LL6Qs8P0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSJ0ngw44KQQolrx4oPXH4t3RcJatuz2fMGLi3NEU2fB8ueL0/E9Ytyolqtl6Ct+57axI33KS3S7zoyb0vku2RYSRI6RvEoER5W9a2u7KzCheXtwa3nRzGOVNLH1vNS1fm9NLRpgOj3LGwrlIkEy68pYXS/Q2yJnXA2MyGjq5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HijA2jIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SMXEWc002147;
	Tue, 29 Oct 2024 03:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uv2ct2JHe+QZqcpCM9oG+MFjV4JAzM+z/RYkVHIh1lw=; b=HijA2jIpxv1lHoBR
	di/LNNlnvUyAMF4rCmRUONaoJr4epFS2xWeeG8/BjF48efXb0poeKQoV5hU82mZ5
	JsfBezl9KYjNehTrxFFkC3dzpNXlzIXlJSw/ohFDD2SARr/rxhr9uMSewCRABnIg
	MU33g9sVaJx4AyFupCtmLPqQrVOa0FEZMD26hKqgDPdI/ym0GufAskEwBs3dkgCS
	uMjuEHQ6CFDwm4BBuSXJSdpEHFBYGJ1TU03YmLXOL8KwKf+xPqLye5bcRXI9aFlR
	OawJ3G9w/LY+rwmcLpYOz/hy7bPEi4WtIa0IkVOIZSQC7SSvGvYUYblRYZ6ed530
	wDN/+w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x6yg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3DPHg031738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:25 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:13:18 -0700
From: Xin Liu <quic_liuxin@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
Subject: [PATCH v1 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
Date: Tue, 29 Oct 2024 11:12:22 +0800
Message-ID: <20241029031222.1653123-4-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
References: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HtTGqQOVXBYSDK7rK4-S994CO67n6_eo
X-Proofpoint-GUID: HtTGqQOVXBYSDK7rK4-S994CO67n6_eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=944 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290023

Add watchdog clock on the Qualcomm QCS615 Ride platform.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c3..bcdc97b4097d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -265,3 +265,7 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l5a>;
 	status = "okay";
 };
+
+&watchdog {
+	clocks = <&sleep_clk>;
+};
-- 
2.34.1


