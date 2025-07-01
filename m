Return-Path: <linux-arm-msm+bounces-63147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C065FAEEFF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448D93A75EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0854925EF81;
	Tue,  1 Jul 2025 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQqyL2jc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567714A0C;
	Tue,  1 Jul 2025 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355838; cv=none; b=I20RmTLYn3XF0KBNrJpxg8sYau3H60D4kyZVHJK7y8USOOHfZnxvxzot8HWUG3ael0ljcSLp+ycTjtpcQiJ5zUK53WCsqFJYndj2wC9LeIQ1NDNLxIGQBGiAMZRrOSP3ZhRsrhPzJboDmwYNMl8hZRuuShsRIUmq82CUQNIs7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355838; c=relaxed/simple;
	bh=yaxlHDl9w0t4PA2D/GvPYwB62GkGoklDetJPWB0Uc/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R8fVTJSyKMb23ZR2JnNWiVkYCdKU5HcvBkhXNFduA1Akcjy0XH0D/4Ni59trQnAjUsrFpA4JWWzOvc7bTytmmCBZkr9FKHLtBLd1blh6jLIyvuPMVBOfBeZlQ9EdzeAv0wiXHrQHh5F6ZktbxhFZhdO7z8Jz/iVHqXC4gdoO5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQqyL2jc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612vACE024827;
	Tue, 1 Jul 2025 07:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OxVs0RvgVnSeGVKbjAm9LqUGwZ2gkiBSa66
	AH7cqy20=; b=DQqyL2jcNiHsRqWKNgBevrlch7af4ngvkZt5Cx9fnAKdE1Yzdph
	dSPJwymHfXDZPgizvKKJgKKsIrKOptF7afapmQcGwU4cZY5bUrpMKqvzYtuGdcb+
	sIyOp1eQkmUwm7k/eYynivGglCDFYVkxKUzfN0QbHVl4MOZfMHe49jsC/4IscuTg
	kr/EiLT8jpg6UyUzPBeFx5bccpRiM9J5/86gqNY3Csns0OX/b26A47nQZNMVRqXV
	fv3dfRJ6z+DnI+t+tk5LgNRlIlXQZyNOJZyjjIZsi0DNa3c4dO5oruFRc4d1T4bg
	SSvVXjecus21QTz+OXgj9mSF9dPX4McfwMA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9fkrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:43:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5617hoO6024296;
	Tue, 1 Jul 2025 07:43:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fktyv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:43:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5617ho86024288;
	Tue, 1 Jul 2025 07:43:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5617hndT024286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:43:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id CF06D571; Tue,  1 Jul 2025 13:13:48 +0530 (+0530)
From: Pushpendra Singh <quic_pussin@quicinc.com>
To: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pushpendra Singh <quic_pussin@quicinc.com>, kernel@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sc7280: Add support for two additional DDR frequencies
Date: Tue,  1 Jul 2025 13:13:34 +0530
Message-Id: <20250701074334.1782967-1-quic_pussin@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686391b9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dDp98MX-VD6hcrkFVBUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tLB2TNKh-qLqNyTFMnL7qEt7JZ28V8Am
X-Proofpoint-GUID: tLB2TNKh-qLqNyTFMnL7qEt7JZ28V8Am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MyBTYWx0ZWRfXwgklkA9oVjQ2
 fSpxrfneP5MZ2p/FzbjvSE2c4f53EpXAx5sxVj4V4oyAd+YcrPfTdyG4jloOdQUP4wHcTWDCLvN
 l2rWResb02LaM3Ss3E0bnxqE+yZwLwBmp7m4IhaoKtLTWBIttHwdoVDL5I/UiZ6E05nT+n+5hvW
 g+IWNnVDdxzoPYrqy9Uk2UWT1pJB1uVdGtHYvJkg9XsXLlWGF9Jg65F2V4CyAprFz5Qt0MdGHUJ
 j25mAh1jYq7gYAxe1zzedCiKAHlCl3ASy10klGS9UMwiEabunczcoEzGgvjOyicQzluGqExGVlW
 C4cYAnqvhLYllTyvwvxATKmSbyz0yzI9M2c6pwtbcqy6avJMpYl3tqQMA6M/3zN32xTKlncBaoQ
 0CAVMTLdbUFVJQlsHXP+30qbuYQFNrhumlUCrSyxeOlbeGj9r9XCPCxUQsPX1mOzAFS3u14u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=973
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010043

Cc: kernel@quicinc.com, kernel@oss.qualcomm.com

The SC7280 SoC now supports two additional frequencies. This patch
add those frequencies to the BWMON OPP table and updates the frequency
mapping table accordingly.

These changes do not impact existing platforms, as the updated mapping
only affects the highest OPP. On any given platform, this will continue
to vote for the maximum available OPP.

Change-Id: Id3a91e065c49848d9af18e5c3edee0836cb693e5
Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
---
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


