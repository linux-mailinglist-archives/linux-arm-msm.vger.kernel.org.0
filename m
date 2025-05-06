Return-Path: <linux-arm-msm+bounces-56987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA740AACB35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F061C22C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560BA286409;
	Tue,  6 May 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nANSPQur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803EE283FC9;
	Tue,  6 May 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549470; cv=none; b=A20w4s5H43BUI+5Lv2xzIsRXmrjXaqSHyrIF17u4OE7LDIhePrEZQRjez0TWKr/OJosAQWbMjGU0VGniO2ehiAUrQiiviMmXNXXS792S/E6JVOiw2gTMM+19cD8UmYNWV3czmF72YhP7SRrBkxuUE1YRWB2VdzCQG5XG6LLg4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549470; c=relaxed/simple;
	bh=GqlNI9rwCDk5o+gWHh1kMkqw1K20G34MrlFAv+NqNI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKgSOsE13JDEe4R0BCTmT09iiOMBqdUCWsfm5sTb5xMjCuBfH4WxunJorkm70Yb1qreXRoOnsE4qx8lmn9JPLIS05xHi5kcFuGqannZRr8orUl7ZoCI6Tmtg/ilXQ4dPo4qzUCyEbBfYySSROPyIpROlLHMMwL+qjNIlyC1v7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nANSPQur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546964SL002574;
	Tue, 6 May 2025 16:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QW71RSDpipu
	RjnJxG36tgJata/JVHYLv8EUUyd3ynTc=; b=nANSPQurMmFUb8aNAqHyhAbXEws
	hBihVEQN3EgBbW+fkEP1vXpAHYnw7JdGGZTEad7GbfLzfD03n65ULdSahfICVNJJ
	F9D6El4jSnkppuK5b/6Pzpcn0DeRlX4Uab8swd12hgSyQ3st+sn8ipOAT6CzNlY4
	q0Xp0OotHsJjT4k2O2Alb2wRSOj/46Veonqod1UDJRA1dlcvbDjK1y8t12NBs4oI
	u8EfCfJY3nL/T9yYJ+uOP0Maja4PkKW26E8SjRa18ENpOE3Ru5Vb4L+Wm7oxVGsZ
	2Hk6f8UOtooOWHpp4V88QJuv9vut2fE+4TJKfTi2feBbOO4jDurn4sviM9Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3aw8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:37:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 546Gb9gl003118;
	Tue, 6 May 2025 16:37:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kx4m6-1;
	Tue, 06 May 2025 16:37:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 546Gb9bE003112;
	Tue, 6 May 2025 16:37:09 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 546Gb9rS003111;
	Tue, 06 May 2025 16:37:09 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8FB4A5015AC; Tue,  6 May 2025 22:07:08 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM property
Date: Tue,  6 May 2025 22:07:03 +0530
Message-ID: <20250506163705.31518-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1NyBTYWx0ZWRfX15SXF8kDf2DP
 YR3X2OXPCTnl3h6NuTNPS/zizkOeDf/VMtRYK5QQdlxcHsYVCdvGkGiKXGUpExzavJ/jF4BZJa6
 a1qCQsw3wm2ASuj9G5tP3oLngfOodyO97DLCbGnulQ0NHKUeBnGnnjQkfFoQJN/Fzk98XGV9GDr
 F30FXHqfi68zHX0JZfCDudzar1A7r4FY0Kf3LljK1DEFnrpFRjKFS4/pMiClPCn8kCBqvxPuwyj
 XSU8LiWOoBjomu1NuIRwcMC4dtsT2jkDGWdYQoSPrm1FTPkljJ27oYSMFMl1zpF6InLLSEL1LL6
 0EKoeaP5Dhmlct3eVXeM/4g2oYKpvoARmoNwYGvF9/pxjixt930vRkQzSkOr6OZKKt7J+GzNEGa
 DO+esOOctYvbVNEOGv3W2Kgx0crag9mVZ8BPjre2xST5KdnF4u0uwZFCRFxE4eVsquRErqbz
X-Proofpoint-GUID: MFxACo-HEU_6sW2CPlVhfIm5cMRDjDZX
X-Proofpoint-ORIG-GUID: MFxACo-HEU_6sW2CPlVhfIm5cMRDjDZX
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681a3ab8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bmo5lHaIWG-R3PfxNqQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060157

Disable UFS low power mode on emulation FPGA platforms or other platforms
where it is either unsupported or power efficiency is not a critical
requirement.

Document the UFS Disable LPM property for such platforms.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/ufs-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..eab28beb0e76 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,11 @@ properties:
 
   msi-parent: true
 
+  disable-lpm:
+    type: boolean
+    description:
+      Disable UFS LPM features.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
-- 
2.48.1


