Return-Path: <linux-arm-msm+bounces-25558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B692B0A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 08:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9587B1C20E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E66152E03;
	Tue,  9 Jul 2024 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XEgDIUuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFCD1527B1;
	Tue,  9 Jul 2024 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507834; cv=none; b=lK9NYaAhC84mjx7dcdyJxitft2Za/mcsN3Oy9DN9DwlIu5VZO2YFENH6F4I0/B6gIyG4vVicDXUKAxkInAwdbr4AZOodiwA7Q3QRoiqI42QBN7y+iI5Jf8KTSs7/pOQtdgHMgO/g8HKYjtW3qSqJdGgFiML5srr007x+nbxjg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507834; c=relaxed/simple;
	bh=vyiCg4OA5vtk16XHfxPS06sYmXJr8alKtPnAxMdY8lI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMDTMB6RMxAcytWTBTWxaqNNl6m+a6eN4+WfUwp8/6negvFC21qYaVmfXJerp2p/NaBe8bnhw/oGQhOMnqosa8B11TD1nHKaCJKvttrwvHU8X7f37CZu5FrDHudz8BaeU9CusAi2kdq4F5yR+74Hc1yxxCClcP4oDzUw4a+vV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XEgDIUuA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468M84uE016975;
	Tue, 9 Jul 2024 06:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YK1kPZKLRTwNe3RX5PiAf0/CTmCjBNPlc81MjsGd+1c=; b=XEgDIUuADiNT1qms
	aaDU5LufvxoYNcQJVPQSJ02Bl99MpkEKSnEDrrTqYumpE+X8WC5CtqUd0GMP1bD/
	cxqSgDM8V+IYMZAFJg76QpKftf2VujTdpPUXbobudXWWYd+ttfHJLFu2dAWUaHIv
	qSWIsMF7O4LU2aLDPX+A7cl/LJtl+plDUnHd8j2M5UwhQOsWbA+dfpE1s+70uJIt
	Gj4Ncv3k4bzT21Po0xMj4BHnM/pHfkMkMs41Yjx4ztAXw0p0oTLx+Oa+iKenvnUO
	dJ3CFGk5F2JVgy+i5KWdys4M6zPqz8VIVZp7uqye92eK4OE61onzvPThixYvZgB9
	uRsMVQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t5ryu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 06:50:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4696oFNJ006801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 06:50:15 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 23:50:11 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v4 3/5] arm64: dts: qcom: sdx75: update reserved memory regions for mpss
Date: Tue, 9 Jul 2024 12:19:22 +0530
Message-ID: <20240709064924.325478-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B21I3WKOdgBR3f7N5EhBRJDj6NGp5B8c
X-Proofpoint-ORIG-GUID: B21I3WKOdgBR3f7N5EhBRJDj6NGp5B8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=885 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090045

Rename qdss@88800000 memory region as qlink_logging memory region
and add qdss_mem memory region at address of 0x88500000,
qlink_logging is being added at the memory region at the address
of 0x88800000 as the region is being used by modem firmware.
Since different DSM region size is required for different modem
firmware, split mpss_dsmharq_mem region into 2 separate regions.
This would provide the flexibility to remove the region which is
not required for a particular platform. Based on the modem firmware
either both the regions have to be used or only mpss_dsm_mem has
to be used. Also, reduce the size of mpssadsp_mem region.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 9b93f6501d55..6f0abcc87a3b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -366,7 +366,12 @@ uefi_log_mem: uefi-log@87f75000 {
 			no-map;
 		};
 
-		qdss_mem: qdss@88800000 {
+		qdss_mem: qdss@88500000 {
+			reg = <0x0 0x88500000 0x0 0x300000>;
+			no-map;
+		};
+
+		qlink_logging_mem: qlink-logging@88800000 {
 			reg = <0x0 0x88800000 0x0 0x300000>;
 			no-map;
 		};
@@ -377,8 +382,13 @@ audio_heap_mem: audio-heap@88b00000 {
 			no-map;
 		};
 
-		mpss_dsmharq_mem: mpss-dsmharq@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x5080000>;
+		mpss_dsm_mem_2: mpss-dsm-2@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x2500000>;
+			no-map;
+		};
+
+		mpss_dsm_mem: mpss-dsm@8b400000 {
+			reg = <0x0 0x8b400000 0x0 0x2b80000>;
 			no-map;
 		};
 
@@ -388,7 +398,7 @@ q6_mpss_dtb_mem: q6-mpss-dtb@8df80000 {
 		};
 
 		mpssadsp_mem: mpssadsp@8e000000 {
-			reg = <0x0 0x8e000000 0x0 0xf400000>;
+			reg = <0x0 0x8e000000 0x0 0xf100000>;
 			no-map;
 		};
 
-- 
2.34.1


