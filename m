Return-Path: <linux-arm-msm+bounces-63304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3448AF0722
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 02:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7734E183B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 00:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2993209;
	Wed,  2 Jul 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pBvDHmEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2179211F;
	Wed,  2 Jul 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751414494; cv=none; b=FlAvoZdnKfWKRHN4e869m5tPnlc/3eLVrvkpMvZ2IUogIfrakO9eKucQEkAjWpKQtMzvoyc9ZrIpTquqd1ZOLERYvpMo2ED6NSwLtEJEB5a5OsrGKrksDZwHNS9/Q6kRgzKxLjeRH1cjroGTbQGHr8JX5v88xJu6uv7s9LKKRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751414494; c=relaxed/simple;
	bh=pD4OTUqghxRArnBO2knbUT5nhZJ3EFvqSsTKGMB67GY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ojCotdp8k9GOI5jgUgC+wr7sS+ELwsfp+nXb0cpDb6tKhq9u1PhWI/rcA0VH9SUKp/4aQcRPoLwWiekfBf2xh7rOzPlsFthEVGC8+edToN+4ezLjzaZERQHEv325Ah7JnTsGUh+nduobfyPgToOikP6RzgxJ/5b5SidfaxJ2Fm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pBvDHmEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561J0mZS024884;
	Wed, 2 Jul 2025 00:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YP5vTTaT3fk211edh/xCkRbAzSkKQJHAUc+
	t2nVRi2Y=; b=pBvDHmEdv3XPL5m2veKbMn0eesG/bjOagDP75UnvlZ1EuwleLst
	u/kZlPoLB3AfcyoQSJnStnOOfwbPD0mYC1WpZ0GvetbNSsa+MogdqTXXqIf/AFYd
	BWtSLxnbDpbi7pVgOalW2Z0dBwAZwYlNVkZ5IHYb9XUaq0HlIlcMKjhC9yfwWbs6
	mZf9AdeBMHGdd4uMicr902OohVycqoxnr5HnC0SA4V4GNvMTmkMnAFWu3ONGrFzN
	7fc25yKVkkRQaD2eXU8aQZxp3d9iZd/LQmIUnfdUHyKN6ymykEWshQAwIDrvc32T
	uFvkKmj+vRTppqqjO/3N+cvay/1acMif10Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8022fpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 00:01:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56201PAB027811;
	Wed, 2 Jul 2025 00:01:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47m1bxcmje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 00:01:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56201P26027806;
	Wed, 2 Jul 2025 00:01:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56201OO0027805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 00:01:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id C00CA4AB; Wed,  2 Jul 2025 05:31:23 +0530 (+0530)
From: Pushpendra Singh <quic_pussin@quicinc.com>
To: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pushpendra Singh <quic_pussin@quicinc.com>, kernel@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add support for two additional DDR frequencies
Date: Wed,  2 Jul 2025 05:31:20 +0530
Message-Id: <20250702000120.2902158-1-quic_pussin@quicinc.com>
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
X-Proofpoint-GUID: eWtuExH8pFXpE8KAd5k84KBsuKLMc4h9
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686476d8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Wdr-PkFzvk_Id5NoAFEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eWtuExH8pFXpE8KAd5k84KBsuKLMc4h9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE3NSBTYWx0ZWRfXzKa0hwpCZOQo
 HTLmnab580CQhGdXdq7vAE2ZZi2g9ORGEjvEnjkekCjsUGl2piVAynCz3ykxt2XKAIGs/at9GEI
 O4Dlbw7EfK440gNj/8G/BtjcIgNHyCmxlCJyvG4E8O+ae+aLnURjLvn1H9NqyKO0oNs3TvmTyBb
 uBhyNSJeldp3+y10m98y/7ecT6DFliJ/6on4kFOV1sGy5IJvaVL0mWcBpJglFdneH9hrDjYUe7X
 qIQAagN/V/r8RXoXnP/NR6QIrU400Rewd6g3Kro3eofjj6yjmwJZqyNThBwZIhQ+itea7s3zloa
 FUxQlgoQ6d6SACzfSMd7mTitVeiteo+pYW87Ip+jry9kRAjo1aCbJkkryq/qak3oQg93hs67vGE
 j8hn+1W4021KahAS8fTJoqPyIFBovarioQKyaYRe+jXtVOSxY/H3p1MM/2bJM57VPdrX4cSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010175

The SC7280 SoC now supports two additional frequencies. This patch
add those frequencies to the BWMON OPP table and updates the frequency
mapping table accordingly.

These changes do not impact existing platforms, as the updated mapping
only affects the highest OPP. On any given platform, this will continue
to vote for the maximum available OPP.

Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
---

	changes in v2:
	Fixed the commit message [removed cc and change id]
	Link to v1: https://lore.kernel.org/all/20250701074334.1782967-1-quic_pussin@quicinc.com/

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..cb945abf0475 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -620,12 +620,12 @@ cpu4_opp_2208mhz: opp-2208000000 {
 
 		cpu4_opp_2400mhz: opp-2400000000 {
 			opp-hz = /bits/ 64 <2400000000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 
 		cpu4_opp_2611mhz: opp-2611200000 {
 			opp-hz = /bits/ 64 <2611200000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 	};
 
@@ -685,22 +685,22 @@ cpu7_opp_2381mhz: opp-2380800000 {
 
 		cpu7_opp_2400mhz: opp-2400000000 {
 			opp-hz = /bits/ 64 <2400000000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 
 		cpu7_opp_2515mhz: opp-2515200000 {
 			opp-hz = /bits/ 64 <2515200000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 
 		cpu7_opp_2707mhz: opp-2707200000 {
 			opp-hz = /bits/ 64 <2707200000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 
 		cpu7_opp_3014mhz: opp-3014400000 {
 			opp-hz = /bits/ 64 <3014400000>;
-			opp-peak-kBps = <8532000 48537600>;
+			opp-peak-kBps = <12787200 48537600>;
 		};
 	};
 
@@ -4013,6 +4013,12 @@ opp-6 {
 				opp-7 {
 					opp-peak-kBps = <8532000>;
 				};
+				opp-8 {
+					opp-peak-kBps = <10944000>;
+				};
+				opp-9 {
+					opp-peak-kBps = <12787200>;
+				};
 			};
 		};
 
-- 
2.34.1


