Return-Path: <linux-arm-msm+bounces-62048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B84AE3DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E873169610
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACB71E3DCD;
	Mon, 23 Jun 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GmvTf2wl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127DB17F7;
	Mon, 23 Jun 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678369; cv=none; b=p+/WOO2cCw5xrCbgV4QGsyHt+5wS4fPs7ipchQb4xEi/ojSQipQv12PlxjshO4N46AMz0DNagSGvjXIdiqlIenvrzXHiVGKmdb0IeQLDOsuT3TxaT7U8NmNEfAGy5xynZ5znkSfSAqt695TwCEYnkauZR703j/97xtPXT6kNAMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678369; c=relaxed/simple;
	bh=gYoRQ8riTOcFQIClbe2l7AMLjvfVEj5/44JdTR8TbrU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HkbjAlEw600sPf+8amgSV0Qeuhw5spWTE40FAt9/8nEnRdiZ/C3SUKI+S7+nOGhFTgxKmCZiY3tFHbIDv0BCq9QfCB73eCuAQb8qlAW2NZtJjgRFvRpTxTrvUPnPVFnzqNSFPDhpkhMnskeMBUkr+U0UedEcqAwy/yHhh24dZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GmvTf2wl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NA072x016508;
	Mon, 23 Jun 2025 11:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U/qscSYLQkkcXhMBNze7IH
	vYw5xXXh+LksiNPwoHDig=; b=GmvTf2wlNuqVQUqcpkfN/aOxOUsb3+4Lw4o8hX
	zWeddL8Crt4a4cZ8bvumFmQ+aJ8aZlcMKspVp1rd/8P8NxEvs/8iAPIWC2Ii9MTu
	a+LJZOF/9NJOPMrkvQrMTnJAUXRmqWI7AoiVki/hrDVRQlhQlXO45xXWQtlOGt8W
	ztPaLd7Wed4w96UvrgPWcqRbeuzLOuqOerOQMPz0Fsce/g6o9+S4coPSQhj2pQYh
	8gOWmGr8YRtk2oUUXV15hngk7FC9I62f1nmYBoJitQP4f3jh5BHHTCbHugWy+Kba
	XeAf2R/Y4llfl43j8l//+3F9sJmEM3lxczvOXznp6X77ZWKA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdjjgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 11:32:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55NBWhDE006259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 11:32:43 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Jun 2025 04:32:40 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_varada@quicinc.com>,
        <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max voltages
Date: Mon, 23 Jun 2025 17:02:27 +0530
Message-ID: <20250623113227.1754156-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=68593b5c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=J2FsxmtKjVhLwy8KIqgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aaTlNzGNGsMDq1hgoKSph5IPRMtLV8hb
X-Proofpoint-ORIG-GUID: aaTlNzGNGsMDq1hgoKSph5IPRMtLV8hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OSBTYWx0ZWRfX+96LGOXiRW1f
 Riltanxo1iTYUSKeoefgRzEmgNrpRm4jnUPan/lvO5NHxbd/KmUkI1nOC4pqhE9TLLkV5a5VYxe
 xgnX2r22phbaD7ZEPRfHkc32uO7zgbfDNMchoMhMO2DixLWReI+G8UWgNrlaqBgWBAGMDeg/J/O
 D/8gDT79ewll+ukSUaoWUP3RmcWzsvuKJOoLT5e2UES9wo1MudJpk22kt24AQUnRNqiqOZvL1+M
 6gtEdAHZ18GMkpfaD7xWJCo48PeMRmCAGG1ib92lpjE0c+HzkYjo7e9en1rknEpcJ8vo9qjF3i6
 Lzkueme4qZ+nEGrWJus4HQVAWL0eAPj36l7NpJJBtD+ZU0P6O+EacKTmygDPAVF0grFkmRhtBd7
 JDejYrdmColqcgu6oOGCM+4RZNb5D0zoeTQ9mmhvCWMAVKXG2GbZvgUPoDjYkLa8s8bM2evV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 mlxlogscore=624 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230069

The min and max voltages on l2 regulator is 850000uV. This was
incorrectly set at 1800000uV earlier and that affected the
stability of the networking subsystem.

Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..21b04a2c629d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -106,8 +106,8 @@ ipq9574_s1: s1 {
 		};
 
 		mp5496_l2: l2 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+			regulator-min-microvolt = <850000>;
+			regulator-max-microvolt = <850000>;
 			regulator-always-on;
 			regulator-boot-on;
 		};

base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.34.1


