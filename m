Return-Path: <linux-arm-msm+bounces-66142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD615B0E15D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E07895610BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6678E27C17E;
	Tue, 22 Jul 2025 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ap4WzVCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE427BF80;
	Tue, 22 Jul 2025 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200706; cv=none; b=C5HJZbi93y2R00JDk4+horDfCatZs6XnsftGoqhASBFuNPqh8Mk8RnJZeQO/f3nGxddA9J0WzCPp6QmdGUS+xaRiqzVsrCzO3EJzIwiaeSkK+DgAAyKb0KuYYnJbWWPn7oybOiJPs/3xfezN3OYq+L6nYVromBqCpvKu5NM5wpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200706; c=relaxed/simple;
	bh=aX5s8hkdNnKkRMEcw5RDk7sDoLGcvyfOHko7K8W3grY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VELUKndzJCnEZSlw5eaIoc84cPuXuitkp3QmQKvPM1tE0N/XQm4GCK9FlbRnuMyG2cZR8wEuYZIPB5pkjq9ejL6gWTDYNsFXGoR8DzhYvmkGo2jciONnUdplJOW0b2XFPsjb5n9xYyv8OCsiULsQkGzOWcOSEBKiP8MqwgCX0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ap4WzVCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEilKa008298;
	Tue, 22 Jul 2025 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTzY2Is+uf3IobJy9waLpzw1fRa+IgoNm3d8lpMilyA=; b=Ap4WzVCUS155aGf/
	r4VlfoyccLrcTMaPCvVRsOB91BQfvx/Skdudg7fIwhCZLyh3gzt+4e6bOwRNwFrD
	KALdjri5Unu+Nf10RKLysS/kw6QliOqBaFRHF/aicETg5EqfkJhdUUnkcZ9qBcQM
	vEeenGYjfpAG1u8vhnNVlqsCRrup+ZOqG05/AXb8u0IncrY9B0h1C6isDKZrYUDF
	yE6hnyJfkAeSbECV/wOL7cjPNk+tDUNOjiCEkbP8bKJ+f5uxvZMSbM1/K3gYE0If
	ouRm8XSftzI3nVI/cxLAf823IE9d24M9aXeqZpVuEYKvYaJ9lPxKmHYwNGv7O25M
	x5wrKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w0g3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56MGBXOZ003915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:33 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 09:11:29 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate limit properties
Date: Tue, 22 Jul 2025 21:41:03 +0530
Message-ID: <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fb836 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=A2HBsxAHFAN4gkXXrmIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xS0_VpD-3VJnVwtvQDngthv8CEtyytmK
X-Proofpoint-ORIG-GUID: xS0_VpD-3VJnVwtvQDngthv8CEtyytmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNSBTYWx0ZWRfX1Kt3kxevFPjg
 72UYJt4spFGA90D4zNTg8BJnqW5xIebJiT89K25fq4tpUF9z0KEd5Rp9POnbuZ/rcfiOMgI20wS
 qG5l5gBEiS2DIaQNNUK3gB7h8flNFbJgMFkQ7lQJ47QVbWwPqYWc5P2yKEeIKWyLHxOpItZHA5I
 47AsvVPyG4D8LdnroztmzL6O/fZqT/4vSRsD3vfrNCheRS2GYOzUssr2bJQa136klm2b9zDcEND
 KjRfvwbLRi4ioFuudfHhOAZodtKGbiyExWmF8v2+ikaC+GMgFC/e1PmmIoZvwfst0r7f6VNWGcW
 SmhjB+z/vKdmOphHiTkQe8rjSqAwTLvqOIPbj/w/d179/kRFTqQJbb7sIU7W+zXLXKYqbDG+eB0
 nIhaQ/zluPPAVoI7F3OXvnw6g5FKdN2PuEHqCCBhRH7ZrqWYtmibLK63kh4vR8yFJd8PPei/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220135

Add documentation for two new optional properties:
  - limit-hs-gear
  - limit-rate

These properties allow platforms to restrict the maximum high-speed
gear and rate used by the UFS controller. This is required for
certain automotive platforms with hardware constraints.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 6c6043d9809e..9dedd09df9e0 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -111,6 +111,16 @@ properties:
     description:
       GPIO connected to the RESET pin of the UFS memory device.
 
+  limit-hs-gear:
+    maxItems: 1
+    description:
+      Limit max phy hs gear
+
+  limit-rate:
+    maxItems: 1
+    description:
+      Limit max phy hs rate
+
 required:
   - compatible
   - reg
-- 
2.50.1


