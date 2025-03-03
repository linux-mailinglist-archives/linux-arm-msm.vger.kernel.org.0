Return-Path: <linux-arm-msm+bounces-49983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84CA4BD60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 12:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1DA416488B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9D21F1526;
	Mon,  3 Mar 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ocnUXlce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1601F1921;
	Mon,  3 Mar 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999709; cv=none; b=YzedWdGCSmG28pOTfcbaszhjV0Oyf4X0u3CCcz5x9HGCDJrfRiFm6pJRAyI/1LY+29tavw4srr9ztDD167jFKHeEjIsCYDETVn/Qwwx0LL4fI2/2d9fzJzqZ3bPxSaNWYTeAqUIEVTZzoA0/3nYsb+JKkXg87F1gPJSuvEteNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999709; c=relaxed/simple;
	bh=Ga6GFweHOtTnn56R1/QNU2fziTaVnQURE0NFf7Zw8tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mqV0pzMjzM5RodXuUe5f/J2hn+tGX6WUabOFG2N+LU1H2xUWU3LMoWftPgDWrczoPJp+GKuS9HdB5tyKIY+a3BOHyBD0ZKvGCcnCGoeU7IfEt1VSUfqV5A/s2FTY8CLwpT9u2WZ+e7YN9e/hg4JU3xzYz72qqkQdQyXjj1e3AaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocnUXlce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AaRUc016148;
	Mon, 3 Mar 2025 11:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uAvC6pWrqVX+r4YoVIlWhm
	DuCdaEkH0XJXwuhCpB/s8=; b=ocnUXlceq5RmpszQThhDm8nnRmBOa1N1D+zGd9
	y5A/sKDjVdi4W2jCeDpFvItoyZA01JtbNVqrkJhzRLlonDUzFSThC8BNwetoDtxJ
	uhyFDVB67Dq/DATW+7z1/RnhzmPTwQ7sDxzY4bffzcDIvaN9/tfzYBbWhhHU0TWU
	MnzxDI0Xgxcuz5pg040axFgIkwmS1OoZtZzjTaYNoIBtmAVlBWUIp+HC7V0OQkup
	TMLAZYNmZmfiSk5HmA9cg360d0PuR3TQIIz+iHAhbzAd1mLI9KysVELzjDfDU/Xx
	Av0WP2AWwqsfjj2Lw4lu+czld9eoUsKl8MXx5Y7tiksjetQw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453udgvck8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 11:01:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523B1hxw004102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 11:01:43 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 03:01:40 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 3 Mar 2025 16:31:16 +0530
Subject: [PATCH] arm64: dts: qcom: sc7280: drop video decoder and encoder
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250303-b4-media-v1-1-ddc5c81cc2b3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPuLxWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNj3SQT3dzUlMxEXXPLtDQDc2OLJMvkNCWg8oKi1LTMCrBR0bG1tQC
 66C5nWgAAAA==
X-Change-ID: 20250303-b4-media-79ff0738b9cf
To: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740999700; l=1011;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=Ga6GFweHOtTnn56R1/QNU2fziTaVnQURE0NFf7Zw8tk=;
 b=Qvf0eMgJygcYPtaCv3tONFp1gRMVG+jri29Z1lO6DY8H1UHOQFxljlNVbwqcYTDz4gs/cetY8
 bmySnjXJD5VDFRbT3/7HBo2Gdc9HLvQnQdS0kYE8TS7KjvG8zXM+vgW
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d3ToDk6ffYYqtrJICS0MM5zkiR_R06ZS
X-Proofpoint-ORIG-GUID: d3ToDk6ffYYqtrJICS0MM5zkiR_R06ZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_04,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=537 priorityscore=1501 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030084

Decoder and encoder nodes are already deprecated from bindings. Update
the venus node to align with bindings.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..31abb2b9555f37ecc9c7753509e95acd57acf015 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4301,14 +4301,6 @@ venus: video-codec@aa00000 {
 
 			status = "disabled";
 
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20250303-b4-media-79ff0738b9cf

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


