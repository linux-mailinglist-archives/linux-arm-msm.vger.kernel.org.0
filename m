Return-Path: <linux-arm-msm+bounces-22826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5690A9BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67363282951
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20519194AC4;
	Mon, 17 Jun 2024 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nKOFsrMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD2194A6F;
	Mon, 17 Jun 2024 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616955; cv=none; b=uEwPRiFEVdgMzboVk6hOsYlqRMgg8lcwu0H/7IOV4pv00NIZElXRD0Z+2C/jGYSk/Ho1eOmC7QbvvCIqvnRtQWJCKcDsmDvtiqKRhRD8tB1Ppe2zQQK7FzGil4aFe5PsMLHjYfFlYTjj55s7tNJk1LenWTsme+GFQYwpJGNbaKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616955; c=relaxed/simple;
	bh=NPvJgk5EfHx/zaUqx7H2TCltbnf/4Ie01oormdiJNp0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9Ore9wpMHWIfR+vZ75SU16Rckv5GJwvGQwpqUYCRimz5PJbY6iwGaCeWuoE6qPyWt8IWGtXLt1ISSHfh1nrbmEFrShWD6zdpPZwnmn8zY1xim/VT6LFlvXmU16Ohbgjqpu2hNrVhRqeMK/NbobiCtVIrSCogkgaUOoxCpwdmWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nKOFsrMf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GNm4QB005069;
	Mon, 17 Jun 2024 09:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBa49JkaIHkVwTxgGQ1xIxH2Adq5t3pCBcOVACDeArw=; b=nKOFsrMf+Zwvzj9D
	MDcQk5Vq5lb1xQEyWbmIY3S2spI5vA/bbWOb3rA/kNRzfEnXFLGHCcu6/0VrQQ94
	O/yLt9XWBCEIewnUm66NEpSw4psSa9KRPLjreq4Eq5Ye1Zo32I7LLP5qqmIIImbj
	/vhdqEN3A3kHdZNB4razoox6VsUQG2gslLS414cPibwNWV7Zghm63fdsTeTdmxNY
	UZus8JrAoP7/q/Zjnk2L/b4Ad2jKQREU425TUlj3QxR5pITz+Rrp4NtEQRphTMdH
	Dwhyg32H3/j/3f9EEbzN5dB6B9mqsuaEA/jIbQ9SlqAZY6F9KgKoFzuWG2n0A/ba
	Awbdpg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0nfbgxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9Zn8Z014591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:49 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 02:35:45 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 3/5] arm64: dts: qcom: sdx75: add missing qlink_logging reserved memory for mpss
Date: Mon, 17 Jun 2024 15:04:26 +0530
Message-ID: <20240617093428.3616194-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zslwgCz-xshEdQU023IUjQhQotG69Nl8
X-Proofpoint-ORIG-GUID: zslwgCz-xshEdQU023IUjQhQotG69Nl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=864 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170073

The qlink_logging memory region is also used by the modem firmware,
add it to reserved memory regions.
Also split MPSS DSM region into 2 separate regions.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 9b93f6501d55..afe84270b84c 100644
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
@@ -377,18 +382,22 @@ audio_heap_mem: audio-heap@88b00000 {
 			no-map;
 		};
 
-		mpss_dsmharq_mem: mpss-dsmharq@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x5080000>;
+		mpss_dsm_mem_2: mpss-dsm-2@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x2500000>;
 			no-map;
 		};
 
+		mpss_dsm_mem: mpss-dsm@8b400000 {
+			reg = <0x0 0x8b400000 0x0 0x2b80000>;
+		};
+
 		q6_mpss_dtb_mem: q6-mpss-dtb@8df80000 {
 			reg = <0x0 0x8df80000 0x0 0x80000>;
 			no-map;
 		};
 
 		mpssadsp_mem: mpssadsp@8e000000 {
-			reg = <0x0 0x8e000000 0x0 0xf400000>;
+			reg = <0x0 0x8e000000 0x0 0xf100000>;
 			no-map;
 		};
 
-- 
2.34.1


