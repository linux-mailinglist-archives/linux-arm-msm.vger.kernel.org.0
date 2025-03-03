Return-Path: <linux-arm-msm+bounces-50251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F6A4EA04
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F483189398F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECBA27C86A;
	Tue,  4 Mar 2025 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ocnUXlce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658E20E6E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109176; cv=pass; b=PbWduVDRd4axNKKLPbk9s29zvLIcMw8s/2EPKuvV5bH7b/ixdzpuI9W2bUR7oWNBsONpWmxwmlSpcJJiR/F8qZm33tYjBUQKvNHioEs28sQMathof5wvlWnuV0vqOUiboQm4vz1QLWFkg0oHkS9gNll7K8gQnyoMW27j1CxJokk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109176; c=relaxed/simple;
	bh=Ga6GFweHOtTnn56R1/QNU2fziTaVnQURE0NFf7Zw8tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=NcMkTH412nzeFZVo1JC1N5KStY0RwkcMyBdUUXRBlQEVefwi4YIfX1pY5/+Y+86JInbT69YR751NTxNsF0qiUSUlH6eLncPWINELx2mm6c2ylmgD2dsKltNrZjDEL6dT7vNFgpP0ILvPtLynDcic/1Que6jsMpuOVRxarYGn+O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocnUXlce; arc=none smtp.client-ip=205.220.168.131; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 61CF6408B5FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:26:13 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocnUXlce
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dgX345YzFx43
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:42:16 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 7844A42721; Tue,  4 Mar 2025 17:42:09 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocnUXlce
X-Envelope-From: <linux-kernel+bounces-541484-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocnUXlce
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 2AED541FDF
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:09:23 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id BBD74305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:09:22 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698203AC6C2
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E54E1F4631;
	Mon,  3 Mar 2025 11:01:52 +0000 (UTC)
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
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dgX345YzFx43
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741713861.51961@ezV3bPaCFYUcosT4YHOsKQ
X-ITU-MailScanner-SpamCheck: not spam

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



