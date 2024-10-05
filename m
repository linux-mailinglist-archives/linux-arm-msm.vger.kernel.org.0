Return-Path: <linux-arm-msm+bounces-33192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76760991973
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 20:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD361F21EA9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E1E15ADBB;
	Sat,  5 Oct 2024 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W8MXfGy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA2158DC2;
	Sat,  5 Oct 2024 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728152621; cv=none; b=OCgmAmMG7Qmp9YzfQi4NH4s6ViOwkJJ0Dh4b72jJCPSlJddVqPCvsNzg1AxJWkSvqlEp6auMDmqao2PhYmwvN9VxFSZQGsKsfo3lpk/BmgeSocCpm9wk//J18dNn4QhXWS+Etm2uvxN7eoDmtlvaKtM+5LSoVy+Vfw5SF/95SMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728152621; c=relaxed/simple;
	bh=8Umxx5gLIxiTRF3NSCdjR929jOM2tcJ+Er4QIho86ls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXbvMAIqGboVujzhHG0BCvsLp0rhf22e4TvZjCO+74prF+66hHscoWaEbaDgs9EaQ6nGz9hZDGdR71uYCzjtYzchdHvniGJLMam9KANL6Msn9h56Dqw1PuVd8Ja7mpR2mAjiCUsrhJWTpjO0K9iivdBvezYa/TunU0r6H0Wqv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W8MXfGy+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495GiBKw028737;
	Sat, 5 Oct 2024 18:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0sOykzmwybQiFnJ1dD1F7N6jvd3UorkOv1Ly2QNVIo=; b=W8MXfGy+u/XaeZUU
	h/dgz314Weica52+uqEfwBGElV0Y38D9SszMpa21UCnwLyfThpDc2HjqSfAGE8xh
	7+v2vtFIoyprujMFpx8757br23MoU5Z97Ax8Rme+zWeTtQC5TRvPgTzlszpHQ3RB
	n9Lcv8B14cHeomcHuOkbrruMs/JArJsL/pEI3btiWz/9OK+2M9qhqWbvwaUeBhbI
	wImr46eeV9JI9jAXjIRmmBnez65hq4ueyz/5Oe2MSclPcRNO3KWUPphJIaQV5DsH
	OBZCacq+3a0JbMJuhPFpP6yQNGNoJQWSPNiduWebyQ1KpsIWaPvgjEqzycdIl7Xl
	TFhM2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs80xh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 18:23:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495INLSm015470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 18:23:21 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 11:23:17 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH V2 1/2] dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
Date: Sat, 5 Oct 2024 23:52:49 +0530
Message-ID: <20241005182250.788272-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005182250.788272-1-quic_sibis@quicinc.com>
References: <20241005182250.788272-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2EZeivso-iaoxi9E5YSRMxU_fDmzt1DP
X-Proofpoint-ORIG-GUID: 2EZeivso-iaoxi9E5YSRMxU_fDmzt1DP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050135

X1E001DE is the speed binned variant of X1E80100 that supports turbo
boost up to 4.3 GHz.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

v2:
* Fix Ghz -> GHz  [Jeff]
* Pick up Ab tag from Rob.

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..6a8fc031e51f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1049,6 +1049,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - qcom,x1e001de-devkit
+          - const: qcom,x1e001de
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s
-- 
2.34.1


