Return-Path: <linux-arm-msm+bounces-27446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7459422DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3949B286310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10641A4B26;
	Tue, 30 Jul 2024 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ljotRODX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09919149E;
	Tue, 30 Jul 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378292; cv=none; b=GCX+CEyShhi1mtSSf25IXX0fvKRAgWMXUyrhh/nxptK91PrrNfsVZ4ZnzYuwd3iEKpMERnqB+GyM5vLJVpgwwfFRutlTA33ftTGJ/TEKdZmNeHw4VAxNA5jtQ4hxJ8idN2hHmAt7l9gzC7ddyrbLvRNGAYwRh/qQCiRnqsTid5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378292; c=relaxed/simple;
	bh=pS6Ey9bhNKiQA3t32Zsli8Caeal+MQPTqL4xfGMznJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=t+PpvJews2zWSuFwtsI2iSdmbu/EguwHqNyZVBYdNsWclZf0gFw1fXAF5A1wrfKfrm9jjdACnauLG/OloAH0x6co+gY3c5+t3RFiTeeIrMOZg06DRPId2NY69xUF/Xrc8brUAbkibiO2JBdG8hlka2hUln6+2b9X8KTgzkcoplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ljotRODX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGNOKQ024782;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=ixibcXR9BhrUG9gq4/lt98K3QjbAREWv2QumpQoSWlA=; b=lj
	otRODXJArtXlZsQId/yUDqkcezQGJfu6ilu2A1bfIqZDAzoudVo53irsj70zubdK
	Pj4ymSXeb9+TMFIFILL+EZkAwxlvrCT/xFq4Ag7SnukWr+KC6xAJjvJ/DldE+h65
	VsIBagvkXrapcdxmlZlF+KFp4GjTGlYD14I50sSzmBHLVKHbfHgx8oOwuhTKb/A/
	K6YYEZobZZ7IJ+bByFO7uSbI6zd0XQu6jblgD/X8zC2TUY08gmgYyLfWiqgaYCXh
	Dz4/56p9sNdPtiFX98vOFJYVyJm1k8QlyoVPXcVAJk/6sIWE7fq0FT3AKtNPTWGR
	eql8JFghbVfGwywzJrWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw452bww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMKRov028627;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 40petpw353-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMK1Rw028111;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 46UMOg9a003287;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id B5039500197; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 5/8] arm64: dts: qcom: Enable EUD on sm8450 hdk
Date: Tue, 30 Jul 2024 15:24:36 -0700
Message-Id: <20240730222439.3469-6-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 64iy_pY49jrc0wdWVWeJfXAz6jPaf87b
X-Proofpoint-ORIG-GUID: 64iy_pY49jrc0wdWVWeJfXAz6jPaf87b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=599 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Enable EUD on sm8450 hdk and route the role switch endpoints
accordingly.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index a754b8fe9167..21a63ad81aac 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -111,7 +111,7 @@
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1102,9 +1102,22 @@
 };
 
 &usb_1_dwc3_hs {
+	remote-endpoint = <&eud_ep>;
+};
+
+&eud {
+	status = "okay";
+	usb-role-switch;
+};
+
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
+&eud_ep {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
-- 
2.17.1


