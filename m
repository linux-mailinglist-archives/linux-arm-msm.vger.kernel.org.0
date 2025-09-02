Return-Path: <linux-arm-msm+bounces-71669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DFB40B00
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B146E16D7B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6F134166D;
	Tue,  2 Sep 2025 16:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MhP3sRmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472122FAFD;
	Tue,  2 Sep 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831774; cv=none; b=GuJcq3y4ILCWtUOijtPz4ERlmEBDUsY8IccjfkJFjffahMSNZKaNmLjYW5R7i7Ih7VdBJTvGdvXYolzoqGfBcTBIeFlcHDdpGUUldRrnyWJkuWtCcCLjHeOb6tTloOnd6EecEQyJednvUdsJNBLCOPf4Cl1PczbTSIJBX13BZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831774; c=relaxed/simple;
	bh=AizIutXkM8wP3NY9keRnNbAuJdvdp4wHMR0Lv6gurUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKm6ut82f5x7E9HbBQ5+PzYGZMh6tFnTA5xj/NDZQc1Vc2vn+FPksAN6rMWUckH1ym5ufvuK2kcd7ICMnpjTOoqWuu+k3/sf/yHzq6PAxHZWyB3ScehZUFg6YTSxVQaObzQ88/Mkk0qnfzwAcMDnXbfVyjM/3xusgqIupTeg1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MhP3sRmJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqBWO023436;
	Tue, 2 Sep 2025 16:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GkLmec44QHBef0TwY6dmVfw+h38KJl50H379H9EgwA=; b=MhP3sRmJ0ohLGW05
	EKRqQCYAWafhEYEHV2JdtOEwRQFEXfhDp00qXYiS51K5Tvoy+lv8SWA9koOnyQ8g
	D76j6TGh21lWJYk+XNQcF+Smvd4CPLj+nyMrGBISc8HM0lk9dXfpZ58tavRc5FGp
	k/Vf4wmyBzU/25BpgKqWRABg9vPTWmIqjtQDS+D9iX76nUyCrm7A2X4ntHTNEbts
	GXgYgUFGa2xFOBer8Du2wZCQeDQquBjvKGO1RrzZ8XW0RKVlhuhh5k8JHyM0PgR3
	MsTS+XHTTUtjUilFspmRZReDT4eUTBGxwwAp0HVip2SEqMHB5C+1FxHWfNdeE3Sb
	Jg4btg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8rtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:49:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GnIJu031584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:49:18 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 09:49:14 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V5 1/4] ufs: dt-bindings: Document gear and rate limit properties
Date: Tue, 2 Sep 2025 22:18:57 +0530
Message-ID: <20250902164900.21685-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oE1zU7fGiJTNalUzN5MsbyzTa7UtP8Xs
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7200f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Umu3u8L3Ayb6iz0Wi2cA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oE1zU7fGiJTNalUzN5MsbyzTa7UtP8Xs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6BEhM16vobSR
 sZvB02NXsoe9nwxVaGxb/IMzvFP5abc1WyGeu0MMF8//xZc/ao2lLtAaEdxov4/77keB50iO7aG
 oyEoefsDfyMKki17ZZxNXRNIGGPLO4TAG/uJZPDZcQF4DNLUUIXup2T2vco3WdTR7Jm9dKGZIu5
 xQzXsjxnqgjZBUqlQUCNiJyt8JQi+ON6pviC0xn0futCj183djQT+JFoze92ERoqYbRiQXXTe6R
 31CfnpK4yzgiH1NcEbPz05Eg1kZYCBf3tqWWwTbQ8KhXps1FF6azOI/4t04uQYSJSCqQX6QcFRW
 JIDr0/rHj2eR/qt4+XY/EgUT7/e53cot2rtWKdRHmTLGH7rU0w8tPEwfj8SYM7WO/HLrdEvlh6s
 HpqbdCpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Add optional "limit-hs-gear" and "limit-rate" properties to the
UFS controller common binding. These properties allow limiting
the maximum HS gear and rate.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..8ffed71c5f6a 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,22 @@ properties:
 
   msi-parent: true
 
+  limit-hs-gear:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 6
+    default: 6
+    description:
+      Restricts the maximum HS gear used in both TX and RX directions.
+
+  limit-rate:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [rate-a, rate-b]
+    default: rate-b
+    description:
+      Restricts the UFS controller to rate-a or rate-b for both TX and
+      RX directions.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
-- 
2.50.1


