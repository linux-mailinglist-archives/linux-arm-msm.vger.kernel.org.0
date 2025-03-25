Return-Path: <linux-arm-msm+bounces-52429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EBA6EAE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B64D3B2B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A428B254846;
	Tue, 25 Mar 2025 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q07dV7hV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD42F3B;
	Tue, 25 Mar 2025 07:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889238; cv=none; b=Up2UAiRXkd1Z6pKHDnzp+5/Y3UfyZ+v+1F8HdDfoertKVjjihmtmIvzN1jsYIeY/y5t7hhN5Ht+xCUpVSpG2dav6bwQUZbambFLfNTwdvyqzqyeIGCVmyxns/wjY/vPWd0nvLwEZ6F9jbISfOcU3bz7H7Tw7BdduWXXpi46AECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889238; c=relaxed/simple;
	bh=GUdM2I3a5jFquHvSB0PilIbK7n40zbd2PZR2eZV8t+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFZa3ieOry1Nl4/rs78k4B9XjkPAfMdC+IB4ZpUoIT3iuY189Y4cuQVuR5GkXF0wtW78EFffZ5WiFfEr1mFiMPo7MubbQO4+iEbuPzKdNixBm/zyqTbwVXjyifDrfdUerdqbmm2fJYGaWtZdTVHhWPo4MyEvBP1bOeMJBC7UDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q07dV7hV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vVtS002241;
	Tue, 25 Mar 2025 07:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NKVm0et57Vv9wNNEEBx9R9lX4cARvAda2xThQanUsk=; b=Q07dV7hVd8bwRCHG
	Zg4u09lEeJXVuKs/JdDmvitrqEUwhJHH+ZM1vH2/HMNJ5CXSNnJTzsMLFLl5SqmP
	wVXPuMCx8O7CuXyvIPtnLNfisznyhFGjgHB600JJlNYx+/LKSFVwJxnDZJz+0Rod
	YtaQUeSn168v15S2iPdzmTrSno6iDiKEB0weMLMmeMdbBucjLDbIClr37GoT0E8k
	X/N4k5T9w+a/tpWY6tfOMA0y1XyNyCuG5jStZxZpbhO+i7VxNdL3k2rJTOUEvqjx
	RJcRMv4PvgwTxJdoU/+uIUWOoX28F1XWcpRaOyhwKDr5nX2WHizbq3TGFeuKbiGo
	0w+uIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wex3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:53:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P7rq1K026297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:53:52 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Mar 2025 00:53:49 -0700
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
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
Date: Tue, 25 Mar 2025 15:53:30 +0800
Message-ID: <20250325075331.1662306-2-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325075331.1662306-1-quic_stonez@quicinc.com>
References: <20250325075331.1662306-1-quic_stonez@quicinc.com>
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
X-Proofpoint-GUID: nLIKqwWD3aVZ-zlW1759mL8CWUkKo6Yn
X-Proofpoint-ORIG-GUID: nLIKqwWD3aVZ-zlW1759mL8CWUkKo6Yn
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e26111 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=nl4eYnlUYfJmc7KBqTcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=936
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250054

Add an original PCIe port for WLAN. This port will be
referenced and supplemented by specific WLAN devices.

Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8c141f0b414c..05b6c1a43b67 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2091,6 +2091,15 @@ opp-32000000 {
 					opp-peak-kBps = <3938000 1>;
 				};
 			};
+
+			pcie0_port0: pcie@0 {
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
2.34.1


