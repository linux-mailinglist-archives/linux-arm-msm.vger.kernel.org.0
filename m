Return-Path: <linux-arm-msm+bounces-45682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AEA17D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A557A18860EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A771F1909;
	Tue, 21 Jan 2025 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fKlWM74Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941A1448D5;
	Tue, 21 Jan 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460500; cv=none; b=goTtcLw//Vi8MppGZ/N0xNGUZGhMMfKEspY1mlCYgo1HzQwhdqmqXf7LoZY3l4CAueLYtVxGiueUi0V12C0WcA0k/DuPx59TD/z7uW8HOJzfIoAtMGGxijUM6vmHZmyWry1ewmZ66v+3OYpCc45S5MFZVamrAAQlp75XZCCMirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460500; c=relaxed/simple;
	bh=2mm5GmT5ZiyKPvRlqvWZu7N+G0YK77Hs6NunCScBg1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsyFSbadIoxXMuf3L3e8P6yGiEEWxsDFl/74qG4+OD2tNwvnmlPgo5f6pHPiywemB5gd1MrnXN1S1J8S/nFaCoIYtrpStQlT4/514Bu7Q9MgW33ZgwCuHytF5bnotBe6YVpCMlfekKIisBi9EqJHFSICPnjM4QNRb390d3xOpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fKlWM74Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9HcMI006505;
	Tue, 21 Jan 2025 11:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ692yj6xzuHn+0BaUn+vVDyx7nP5L1BMsaeUmj/2e0=; b=fKlWM74Y1saDvLFW
	W5JEYB0793fy335J0x/mHB/SS7ki/zKDIkJUPq+F+BiGnMhlK6XDbvbRIc0LhSkP
	YELyZ0VhmPR4rEL8q6eNodsitWPWB7uRTLBQ4RmnBb0YDPvJELhg8uk28kNka3Dm
	mXsS1DjLmDQ3O7KpC9SvIzFR/wjkdxiCWRPk61VH2lUvXaulWx/e3VCgPeETPkZm
	rsWtvNRXNSkFiR8fdLzpM162u9a4T00IALnWkLXCn/W7E3tZsZgNiAN5nOT3jkin
	lypcxALCfGU707I3CbF1MjeW7cJnOCnqEYZivbn4DGhIOxT3aFnc0gjrbo6cyhq4
	FhflTw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a8tugjce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LBssKe024380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:54 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 03:54:48 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
Date: Tue, 21 Jan 2025 17:24:04 +0530
Message-ID: <a24385bf8e4c25228f853a14294902c483737c4f.1737459414.git.quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737459414.git.quic_lxu5@quicinc.com>
References: <cover.1737459414.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D_ejezDXzPg4FDty3oOG3rlitmFlk0dY
X-Proofpoint-ORIG-GUID: D_ejezDXzPg4FDty3oOG3rlitmFlk0dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=616 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210098

Need to remove the context bank compute-cb@10 because secure cdsp
uses the s2-only stream.

Acked-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 0aa27db21f3d..81b2fba94841 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4585,14 +4585,6 @@ compute-cb@9 {
 						dma-coherent;
 					};
 
-					compute-cb@10 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
-						iommus = <&apps_smmu 0x214a 0x04a0>,
-							 <&apps_smmu 0x218a 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
-- 
2.34.1


