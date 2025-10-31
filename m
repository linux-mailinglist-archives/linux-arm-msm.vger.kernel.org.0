Return-Path: <linux-arm-msm+bounces-79828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F5C23FAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02AD4564096
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0072F328B70;
	Fri, 31 Oct 2025 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bZFRIJS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227622192F5;
	Fri, 31 Oct 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901072; cv=none; b=gzxBQg/7sAYqNtZXlISyTC6iU+dq42Aj5ImyDa6FazU3u46SFeMGkE8Lv+llGa7mnfK7KnHvdma6vJ0S25avnoHIBy0UkzfLc1UcnT72cz3rB9YMg8y7Od50Kb0SHZ5moTVnb8fCrqkYy2znSn9y8nBKcE1U8zec9+mp1vV7giM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901072; c=relaxed/simple;
	bh=OblESlGYezokDG4wTvUfoCcjTpWDWR2z7SAP9MnyZvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D65wW5dZweIObqb6u40tfInYClUQ1tctDyjstj7sQUfHtcUJDcuG6sI+A7Jb7xHswlnRTtW0hhbPuTuPU0Umgmou2n68AuRzzjw85/4nvNN/42P1+psFN/eK6GCQzjZ9893/R2ODra3WNZiGFNjxC8ucuvNYdJD74Y5drZYx55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bZFRIJS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1mftH1571314;
	Fri, 31 Oct 2025 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DZIfXIe/39mNuovU5gIFhs/geh2exX0Ivzf
	jKN3NG0g=; b=bZFRIJS1sMg2vJnjCEc3EV2N3x5SsAVHyVHXh/NbhY30fpCul6r
	HmHP7Qa/C6vPwiIepAn1255d55CP//IufOp4uqc5ox0xuyz6Y69RdekDgThiAIKv
	LH4ZPioQ7CuoK0BP7e1ptpMuVhxEm5jRfA6zEZRxFmUGpT2SGgA0nYzdUpwhzLsl
	FagLZNhyrrFxSiCi5zPW/4leA2n0JTrEUSGfhHew39GeDyVgsv66fn4GUQazTgid
	/iMFQrtEU42kHHe0GLDKZZ9yDhATd2KaTitWKtrlVYBpl1wZfBI1tAD2y9Yf4LGv
	Ztwxb+fowNDsqw3jL1/RcmvrabVDryD13Cw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc0yr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 08:57:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59V8vj8g020348;
	Fri, 31 Oct 2025 08:57:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a0qmnd54e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 08:57:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59V8vihd020342;
	Fri, 31 Oct 2025 08:57:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amitsi-hyd.qualcomm.com [10.213.97.115])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59V8viE5020341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 08:57:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4648853)
	id F03E25A3; Fri, 31 Oct 2025 14:27:43 +0530 (+0530)
From: Amit Singh <quic_amitsi@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Amit Singh <quic_amitsi@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot' function for hpd gpio
Date: Fri, 31 Oct 2025 14:27:39 +0530
Message-Id: <20251031085739.440153-1-quic_amitsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MCBTYWx0ZWRfXxi2gL9+4QlTJ
 OvNUW6Ny+u9gPOryEIZa9y3I7f1vG91w152HkQTsh2mdLF1cepMde9zseXQyRyN+lmMZWMFH61q
 8QOKbsNRdQP/2UxwEgiM6JMgv5sKz++Q+pCGilOXX0ejL4vW0dzjURpYrEWMp6s6Ff6i3k+ieEk
 XSnfzIV6MJZpKd4/Hm8FVOm4x7bUYm2xr/q32XsQ6Yu3xaiojUvxTE6WRV0dCd5lVfmYzxjetmt
 6LBHC6tM776AvzGh8CAq50x36esbmaUlQkR1Z/hbd7jSQnqrQRvhySGyIXdt+vMV1tYU10AGKla
 doTKAi4o0MRZ1dd450g9VMnslNFGIc+Vrj767ZTOed+EzKJwMcT8KV+3FpPcc4dAP0vCq5C/R0q
 Wc6Lkss2e5yFDhzPzyOEOZvgzy6s8Q==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69047a0b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=Xvp2RMERN6-GfUGbwf4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 47X2dEl6uX8kFIrbXbspnUS83SfkV42U
X-Proofpoint-GUID: 47X2dEl6uX8kFIrbXbspnUS83SfkV42U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310080

Currently, hpd gpio is configured as a general-purpose gpio, which does
not support interrupt generation. This change removes the generic
hpd-gpios property and assigns the edp_hot function to the pin,
enabling proper irq support.

Fixes: 756efb7cb7293 ("arm64: dts: qcom: qcs6490-rb3gen2: Add DP output")
Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index c146161e4bb4..caa0b6784df3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -49,8 +49,6 @@ dp-connector {
 		label = "DP";
 		type = "mini";
 
-		hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
-
 		port {
 			dp_connector_in: endpoint {
 				remote-endpoint = <&mdss_edp_out>;
@@ -1420,7 +1418,6 @@ &wifi {
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 &edp_hot_plug_det {
-	function = "gpio";
 	bias-disable;
 };
 
-- 
2.34.1


