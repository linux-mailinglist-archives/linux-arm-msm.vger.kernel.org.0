Return-Path: <linux-arm-msm+bounces-70126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 574B9B2F50A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 625597B1B57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83E02F5329;
	Thu, 21 Aug 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KslYxRKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138C2F5321;
	Thu, 21 Aug 2025 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771409; cv=none; b=XhPWSCYtOP8BBfjWc/z5zcO9M7s9N+IuClGVPUK+JOoYjQS4NEwCw20Byuz9oM/rmkB795rCXVXW+e8+4YiOorGatia7qAFlkufxMlGBN+un/+2BDs4HCVTgWPOPUZUZEPFMvCh9PzYHGHS7n39GoiE1nlKFoAgdiNIv66jzhF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771409; c=relaxed/simple;
	bh=qGdffQAYDy9Zpli6nIsjxsdzWi2FjO9LzS7NsecWZ2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGBvwGgLprKphATFvIN9W/wLF3TQ7QwVivIcDQ+TwM6/aWJn1xywiA3QlG2JXWznmtTRQvM6C6ZQhkm0T33EcjBsMD+gAv+vtfOx5I85RP4HCF44aL+gMMWTwMeT7Ia+SyUd2HxmM7J7TqDiFtwZEZp76UVP+zqCnsZ1W7PUiok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KslYxRKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7Xk012751;
	Thu, 21 Aug 2025 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJsgyT6vX12WTbaENXwAw3xS/mnFPEHbGVUHjVavjL0=; b=KslYxRKF1ba1wwWY
	Ht18+BM7dSENHKms6xj9/bNDWu/TbFeLLii7FGq7l55fUwb236hmsZmQJIc13R1Y
	gt7o7lAaMHryXg5OcGz5R6JFNC8xP5GmsErunoRK1ab3HP7+wVzXuA8R+9krMl8r
	M0Vq01NlNzZ5MAj94PpGzHQIK5LxjivkB6awMO6iWZhAZMs+uV/mA1phC7bFMav3
	yKiM3rZp7LmtDdbkvKNJWSjPdlCBQcTqkpMgd4DvxlzOg4CgmmZiZc6u3Dzl13Hb
	m1EJt5c7amfClu0gyQ1IrRnBEx76lNJBgJGzLWA8U23nWDIK1D4+xmDDQ51vLmCc
	fP4J0Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8au8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAGYb0019000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:34 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:16:29 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/4] ufs: dt-bindings: Document gear and rate limit properties
Date: Thu, 21 Aug 2025 15:46:06 +0530
Message-ID: <20250821101609.20235-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
References: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX3I4bgCzF7P4p
 P0ESeOmhG6PULMFNHfXj9WIUVlulmTgp5Dx13PuEXPsXld7wLwSnB7lYxbx1D5c1fVVEEqL7XdF
 VC5AAfiTGiqHtZCIpwmK7GTIQCZflZUgtfn5N9CVv044ZScm2V6cEaRr421WheCwRhVbQnuD3uP
 DOg1dB5CM2M1HINmw40fWL0eVgRehZTSD7DyoxtjUdGjLVTngs2hoD6TFjCOdbf939jqjJc1hQF
 Lpx90OnGdy8XrtNrah2d8Uc2MOygdAfpTbjX8NANrNINJ9dCQo7F+gJpUjHHuNJUZzw0PDc78QQ
 P7QkVwGPCPkYPm55Al/42ERjn6zYvH/szGr8O3u+c3/kqWgho24e8Cg8vLNg/zBzAjIp89zLcWb
 TjLABGtk0Tifn5SOAE/bvgPvgWy49g==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6f203 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Umu3u8L3Ayb6iz0Wi2cA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: FMqCkDbGLT7rzz4OHU_kS7ofYTS6aPQ6
X-Proofpoint-ORIG-GUID: FMqCkDbGLT7rzz4OHU_kS7ofYTS6aPQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

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
index 31fe7f30ff5b..baa978389ec7 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,22 @@ properties:
 
   msi-parent: true
 
+  limit-hs-gear:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 5
+    description:
+      Restricts the maximum HS gear used in both TX and RX directions,
+      typically for hardware or power constraints in automotive use cases.
+
+  limit-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
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


