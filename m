Return-Path: <linux-arm-msm+bounces-20308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B278CD381
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 15:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BFB1C20D05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3777A14A62D;
	Thu, 23 May 2024 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CsPp0LI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79114A60C;
	Thu, 23 May 2024 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470155; cv=none; b=BmEtGfAKzHrshPoDdADCeo78bLkvEA51CXNYrOOQCPTSuSk9Hv2oEUlhmcK0M4hgHg1VL6Iz8x2qo78+fW/aN/5gFeLtS8BZyYT1+a+Bu10rHs+MoO9e6okAKFqxYt0eCb/Ot9pY86vG/ZbMCsegu9893ZDcwaFJKkUbcp7rQC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470155; c=relaxed/simple;
	bh=Ux+x518pl7/uep26zN3pHNo6TJlFmAenHd5rKrgkXkY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AOkwLfuiurkTLQBafkYVTFDkREYbm9ohyCxaszhKJObgR3iULV7nOD7N0no0Fqlmz+HML7JUaRXcRJp7lAGzrdUOqhs24G6xunPOGTUxMsRMbpQHmklKfiQsVG2eUK3/lC8fMGjgrhre3YtNwWlgRHH4/vSuqHmy0K+wNBVaIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CsPp0LI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NCjM4H016562;
	Thu, 23 May 2024 13:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=10591ahE1WkTed7Dc8TeF5
	gdlCW9JVXi5D/o2l11h90=; b=CsPp0LI5+qMyZ4K5+GQK5NKFak0EpHZG2nLXY7
	pAcKldGi0g8WXpRvRVcnG9ZGAg9X70c1T3FLcSfANZjAvXB/xyRjE+AXEW+18wId
	Mp3u+w03MtNQKW0zkuzfkLMldOTrnIm+nobd3ycEwL6aM840iWTTvW6Hjthsd1ib
	fw0EaUF5xAeQvo0v3KQIF5+sbQKudEuwe+NW/2UsXtDFe8PDPXptpAQV5tincWqT
	b9JR3XrlLsale48LbTSYyy20wUotfAzgySYOnmTSxCoM6i8sDmBLtZXlrFVPeyiR
	z4KZMUzFJ3tzlhNtGZe4QLcNTTWjCtn4sNim8h8QJPE7O0QQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y04s5vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:15:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NDFj2o004185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:15:45 GMT
Received: from hu-uchheda-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 06:15:41 -0700
From: Umang Chheda <quic_uchheda@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_uchheda@quicinc.com>, <quic_kamalw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable PMK8350 RTC module
Date: Thu, 23 May 2024 18:45:28 +0530
Message-ID: <20240523131528.3454431-1-quic_uchheda@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: YI5QQNDMSc4tyFl8BLXQeBJ73NLUh6a7
X-Proofpoint-ORIG-GUID: YI5QQNDMSc4tyFl8BLXQeBJ73NLUh6a7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_08,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=676 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230091

Enable PMK8350 RTC module that is found on qcs6490-rb3gen2.

Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a085ff5b5fb2..5cc259c5b262 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -602,6 +602,10 @@ &mdss_edp_phy {
 	status = "okay";
 };
 
+&pmk8350_rtc {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.25.1


