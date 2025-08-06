Return-Path: <linux-arm-msm+bounces-67930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE6B1C924
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5439F72496D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66A62989BF;
	Wed,  6 Aug 2025 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LtQNasrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE12957BA;
	Wed,  6 Aug 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495048; cv=none; b=sCHlLGnXykPGfLUt0norpAGE0aaCn3llZcf3+plC7V2dDXtKTo0VY5DTCGQkNkPoYSudByUGiU4kccH1iK1yzRCY+4KztYJ0Z8n8AQLe1bFFTxYbtp06GmUoHMGxX00zuGi1aEbsULYVxVWdZXY2bQ6LUQC5tOnqUsnNhrX3o2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495048; c=relaxed/simple;
	bh=hiVvPnlUoDJv8y3YvQWQe0w/UHLvZIgAQ2BmGgHUWr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzQ5bqxkhPRwo5elTpt1RF9xZp0PX9JZ6BL8GBAGhWskcpuHShv91HHuz69T6BdXF+tZ4bbdP5wtupMBTGK9I6oKqPhT5HiYXcULm8M1xSYJ8aSVq1gjkXid+vx8KheOGs/vulUA2J5+7yLVkwpoVs2PbMbwS12nC9mLKPFljYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LtQNasrt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576C6Hqa025397;
	Wed, 6 Aug 2025 15:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+z4Dv1rIbSn
	o3/QJyTK16zE5TdC68aFCLduPh7Pp9Cs=; b=LtQNasrtOXWV8aGN2wTmbOCWMKO
	cg5BOKmeAr+Vb5L6q6DvvmHTszQo/J6dHElRoyy2OAD0ObfxrVYJeRyYndw87KXl
	KD01gA7wtJ8q4/oi8VeQZTDkluk7vo9ewtrvvzpwxOVDF2+dbPV8hbKmZbp9afrE
	cPOce+O6TK8BiTv5jUO2l6SzyNfWJaD/yt6A5C0Gdn5nmmSolKC5qsSrDfixD5Bu
	in4arYj3dGt8z4md4A0+66ZpUVgwjH00+sQhFTFzNXff3xkbBGhR/FQJsmJoW2N/
	mQszE7UKNFrONqUV0ddi68oRAN09pfJQYxk1/74TDJ1PM17uwgmyXev9BQQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyubgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 15:43:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 576Fhi0v022942;
	Wed, 6 Aug 2025 15:43:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 489brkx9uc-1;
	Wed, 06 Aug 2025 15:43:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 576FhhfW022934;
	Wed, 6 Aug 2025 15:43:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 576Fhhel022931;
	Wed, 06 Aug 2025 15:43:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 367AC571922; Wed,  6 Aug 2025 21:13:43 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 1/4] dt-bindings: phy: Add max-microamp properties for PHY and PLL supplies
Date: Wed,  6 Aug 2025 21:13:37 +0530
Message-ID: <20250806154340.20122-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: 57_GQ1A3fNl3838E02W_MQHJUy_UGByA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXylC3LIACHqsA
 EKCE59814cWRvWxVvFH7Inkq4qb47Vh99ok5km/ZLG66tTWnoOC0KGW2WFzJfdhrB+UMs+Roq1i
 NxiQ6oMdc3uD8pclgdue8/kj++8zdQpw9uIiwZgdi5mcg9geDzwp/95GNZ8vdQS/qfuYKCnnOFX
 BBDrXepOPGUXiKpapudjE4w54yXPM4Q4oLpOt5ZiN20R9D8mKuB+4TQVVLbumECQNk9T5W2r3JC
 tP9DpuETi1O5fZ/M+/G1n2yl8tRVqvnVa0Myu1uU7ZWLvix00hTgHJBQ8pi74X743ybXXcvv5jx
 QyDRJiWn6O/spRa28VTWZ4f89YkoEkrwqSaDxPECDbotgMqv6/uaK/kwgtP6mnIigjYBLpqq0UF
 9I0Zt8qy
X-Proofpoint-ORIG-GUID: 57_GQ1A3fNl3838E02W_MQHJUy_UGByA
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68937833 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=WuqA9S0JYpAbhd1HrewA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add two new optional properties to the SC8280XP QMP UFS PHY
device tree binding:

- `vdda-phy-max-microamp`: Specifies the maximum current (in microamps)
			   that can be drawn from the PHY supply.
- `vdda-pll-max-microamp`: Specifies the maximum current (in microamps)
			   that can be drawn from the PLL supply.

These additions help define power requirements more precisely for
regulators supplying the PHY and PLL blocks and ensuring the regulators
is kept in correct mode based on the client load requirements.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index a58370a6a5d3..4648642dc974 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -71,6 +71,16 @@ properties:
 
   vdda-pll-supply: true
 
+  vdda-phy-max-microamp:
+    maxItems: 1
+    description:
+      Specifies max. load that can be drawn from phy supply.
+
+  vdda-pll-max-microamp:
+    maxItems: 1
+    description:
+      Specifies max. load that can be drawn from pll supply.
+
   "#clock-cells":
     const: 1
 
-- 
2.48.1


