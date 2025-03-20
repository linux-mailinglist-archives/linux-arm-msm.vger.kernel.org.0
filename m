Return-Path: <linux-arm-msm+bounces-52047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CFA69F92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 06:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF97F464003
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 05:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE36E1EF388;
	Thu, 20 Mar 2025 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CGJRsWxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E01EDA3A;
	Thu, 20 Mar 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742450128; cv=none; b=lfved45gEUdTruPNd0bbU93pxBkq5O5YmQW5ffd8iGgpMlbtV/KLr2hFuKrzbOiTlfCK+OFP+rjpu39mfYYLBrurY5WMhKYpv4L5tDknyOnCsEG5Ikcx7RpFp2IAuPMahdGXuAktVA3NbMJ7siGgWwuF3+mVEwkkMMcziCPzRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742450128; c=relaxed/simple;
	bh=270XmT+sWIEocJ32wxkNaQ9PlQLYKGbpR3mFank1eyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=on7XBkecY+if5V5zpXlPSENKY4MhgfXYuBBUa9gECeJUyweteXhQ8JRUKJFtchGSmD+KBGE5jNZurdqzGjTWzyHzwpJO+k1LXTAvPEmIxwThl0hvvCCw4qZ4+ZgJVFiUU8V3QDmtxHLOQguUXKj/fgrNrzK48nMSkieaX1BBk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CGJRsWxk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K3cEg9004571;
	Thu, 20 Mar 2025 05:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+cXLpACZT
	fy8CnVDyuxcD9fWiz60B2yzBDwXStl0U=; b=CGJRsWxkXpHTSH5mp6nfJRL3S01
	+ukRZKr4xe+tnNYG9dVH9snGC1BlqpI5OzKhXCCUqV5s9mjCosxPrZkLekFZ3oXX
	FnP9gX0Td6crQCboC5RXX26wg7GjnxQm6zzno+fBpWjkj71dNkH46xSyt16/T1OW
	6SVGKhMhWRz29N6REIdAgccLs7NjPYbq/RjJ6KZwUklgZpQPmyUnDh7gffxhUkql
	vHjhsQdR6/psrvzmkicGTL1EYUNOxF2Y+KAFD/0M5WxG4TiTTgL/HyK62iD99tpy
	OmQzSJvraebf71BRvMCnDAGY4ju+cDJpMAWUDSKb3S//HC0fajWpoeWaZzQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx7p7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5tATa014368;
	Thu, 20 Mar 2025 05:55:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 45dk529f4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5t8tc014233;
	Thu, 20 Mar 2025 05:55:10 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 52K5t9BY014360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id DAC8740BF4; Thu, 20 Mar 2025 13:55:08 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
Date: Thu, 20 Mar 2025 13:55:01 +0800
Message-Id: <20250320055502.274849-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jAJmnuebdXgPMRuQ7AEFghltwy0xoHkP
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67dbadc0 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=R2ixBC5xtkv2JAc71vkA:9 a=sagSQ8oKcmm4XqVqbL8I:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jAJmnuebdXgPMRuQ7AEFghltwy0xoHkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=945 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200035

From: Qiang Yu <quic_qianyu@quicinc.com>

Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
voltage rails can be described under this node in the board's dts.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce9..32e8d400a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3287,6 +3287,16 @@ opp-128000000 {
 					opp-peak-kBps = <15753000 1>;
 				};
 			};
+			pcie3port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3_phy: phy@1be0000 {
-- 
2.34.1


