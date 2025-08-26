Return-Path: <linux-arm-msm+bounces-70907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F80B36D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966C88A752F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CE720CCE4;
	Tue, 26 Aug 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AwJxFSrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152C24B28;
	Tue, 26 Aug 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220972; cv=none; b=hPJpVRZiHeqWod8TTqcOTqctEM9IqVBtJRSYA9/jsqXqK2nGfecetQcp9md5FX7/B/sp2JySzatqar+Of5BvJzz3Ga+JPnaVsiX9lPAx5WtZFURTTBzWozYSAyR1wr0wXn80TXsHGKcCiVU4URu8UmQZpyS2oS2fOOBl0gYCMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220972; c=relaxed/simple;
	bh=7ZdxA6z+dRiEcmHeZg5iKKEsm4udUwtU5SapDF7/IWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkaTOh5bMCTld7xWw7lMzGu+G63A2V0ETe0QztqTTxM3UjcqD9ue2aLGFIUcFR58newkB7dKqh2Shgzm55553peHFqLqUSkB5TFo4Bjkw+h88uPKd7PIqh5Zun/ut1NkkP3keMHY7iVz6FHeUgF8gtulRANjl5hcSkMd0velfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AwJxFSrU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q7cpMC012095;
	Tue, 26 Aug 2025 15:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvAGBjNfng5BYKLbLURO4+ZtKujvQbBcaSig2u6t/vQ=; b=AwJxFSrUaaoKARil
	YtQ5ZFt1q+hbK4a41cJiPbWx8hcc6/NXWXVmmBO4szkiwnb5rxXWYnRx8d4d47c6
	ltViUzMMm8zTFfiQVe6KHrfAsgT87ZRdBr3jl6akhJVUb68Li+KOLCKapxK4/44q
	8BeUJV1D37Vfv/aYhQTxYMNttdDDdBnbo66d+Lfl5Aj6GPBkhBaxIhOoO9dq+iLk
	6UN8VH7dKB/MoiDTuU5L+OiEhuP7q0o2foZylTIJ2emAHjdBNvJ0bi9pCxrqQfJV
	zh0fqxwL0bCXHKrx1tBzJ27FVUWMHLL/PDj5L8Ir3V4Ec6y3aeqAGPfStvHMdaSO
	6TELcg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615h6s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QF9I2o031358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:18 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 08:09:13 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit properties
Date: Tue, 26 Aug 2025 20:38:52 +0530
Message-ID: <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX/EXUTSM5D7Fq
 KSAuUbdfSsDFdWdEmKlrBWYsIDSvrZWym0BnsvZpFiouCJ5PVXQtJc0CfRaVRKb1WM+aWZ44xBT
 l4pKQAGESGB1gawKMugj8kyBaHvBcwwrb1WRtvS/plIJCIo/0Yabx93M90DmAsHu25vDwDn5C0D
 HKtgdMR+5vjtzGaEtKIYjakXlqosdGa/u6fzuUyoQO4NP+DtiFN66uzX2QGv6ek2VzHaF7CQ9dN
 v60unHomxT6bqStUkbRnv8ywbIFuW/8akBPz5AgsAtGFvPYePkgNGZiR9X4CB67LbvwAqxXk3wa
 TPoXLoVkmAIBoKzfqaGNu9q7AQpTonnF/Z8aZKAv/gOYzeZGOQfdxYvUqXhp1Vxc8frWLsueiac
 0411PPzT
X-Proofpoint-GUID: wuAEuSC0QCdJF54ViJ5Zuoecd3UF-YRW
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68adce1f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Umu3u8L3Ayb6iz0Wi2cA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wuAEuSC0QCdJF54ViJ5Zuoecd3UF-YRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Add optional "limit-hs-gear" and "limit-rate" properties to the
UFS controller common binding. These properties allow limiting
the maximum HS gear and rate.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/ufs-common.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..1af658207901 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,24 @@ properties:
 
   msi-parent: true
 
+  limit-hs-gear:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 5
+    default: 5
+    description:
+      Restricts the maximum HS gear used in both TX and RX directions,
+      typically for hardware or power constraints in automotive use cases.
+
+  limit-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 2
+    description:
+      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
+      TX and RX directions, often required in automotive environments due
+      to hardware limitations.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
-- 
2.50.1


