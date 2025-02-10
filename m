Return-Path: <linux-arm-msm+bounces-47355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6AA2E426
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 991D91885D97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 06:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788D21A23BE;
	Mon, 10 Feb 2025 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HyO4Dh6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AE61990CD;
	Mon, 10 Feb 2025 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168994; cv=none; b=rEyvp0BDT/c64jYgVjCbFqqmsAxeXvjzBQLO+KgT8bZBt0upSGH9ROVVrC09iQkXw7oq8E1cvOqjpzzfL+klv6LhrrE5HcZqkM72JcDx3N/lTTTxsuFeYYZcZ0g6TujuPh98syCeF08I3k9xy/cbFeMNQmKY2amdkcMlTkOO6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168994; c=relaxed/simple;
	bh=jDdaplvpsPXh59zGC3I3dvjHoc79VwYUNg/tFIxg5Gk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+Ha3ZoQbwamzNT/3+gPDCZiwi4QgezBRJlYsiMDGJwFA4JoIRRj+BQIbVD7HJhVqT3SisVaHp0BzHjPBSVdnZdqZsAcjJSuHZVdxldA8rqsZMAIC4KNVPulxl9lIUvauPjQhWdwDmB2PbW6miBm9W7DIn5OQ+QGf/7jdgi0nhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HyO4Dh6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MGw8s015468;
	Mon, 10 Feb 2025 06:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtjSJQTeeJvPToF0iWo2JOztQM73hbLCGJfJeolxEn8=; b=HyO4Dh6R0lBm0n5S
	NDHBjUjK0lvYCRKxrcPFfHWNTjYDLOPPFd7q7EB2O0Vg/xP+kPePgWz44C7+kvr5
	5Yuy2NX261wB4EE6jaElLaSp66dw4uzIhhGfSr4127HaZDUTzTxFQHlUG/gBLUyd
	vbpTPp0YBrrraTk9sdyAT1VXq9wlM5vbOpBNqCyD5GNyE1a357Eq3pdqzt8kJEbV
	mdlxvFeS1v830WwkSyaB3PEFL5jcL2fH6TY6iErgag64TbEYaL8NawAG1Bf7H+s3
	v5nmAnOHOqzuybLA3Wyur0HCkATrroDCOSQFJnAefw1i4lx7s9teZBw0XgJxwnq5
	7pGr0g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dqb9fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:29:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A6Tnxg018972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:29:49 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 22:29:46 -0800
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
Date: Mon, 10 Feb 2025 14:29:09 +0800
Message-ID: <20250210062910.3618336-2-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210062910.3618336-1-quic_stonez@quicinc.com>
References: <20250210062910.3618336-1-quic_stonez@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3-QrvjDNpmHSQeXR1bXKbdoeBPj8rv2A
X-Proofpoint-ORIG-GUID: 3-QrvjDNpmHSQeXR1bXKbdoeBPj8rv2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxlogscore=888 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100052

Add an original PCIe port for WLAN. This port will be
referenced and supplemented by specific WLAN devices.

Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index cfdb091be32f..9f02503d61e0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -844,6 +844,15 @@ opp-32000000 {
 					opp-peak-kBps = <3938000 1>;
 				};
 			};
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c04000 {
-- 
2.45.2


