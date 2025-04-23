Return-Path: <linux-arm-msm+bounces-55020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDEA97BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 02:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD5817F8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 00:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2965257423;
	Wed, 23 Apr 2025 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YQK08dS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531771F153A;
	Wed, 23 Apr 2025 00:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745369919; cv=none; b=Gw276l2VYuFTEsqgFqhGiBFbVR6DmUKfUvNlmQZ/X9k3E/EVMD9eCOhhymJEi7iLZERmI6a+rilkTBUd6Di1xWLuz71aRicv0/2Z9pn8rpNdI0ocmW+K35WsAeduh5IVl2eHIHe34gpnv6oVntR7Dp5Aj9v2dqrzfU4HPUN5518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745369919; c=relaxed/simple;
	bh=QD/951DXfIsapdv56c5XXqNjxOuGMA1nZZ5Px7DpvWQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZSAfY3W7jIbkXoiLGH59z8B7qT7LS7PzPsdpwfIo1o81gtYaeKypvnipZCRH8tisRoXeW1CpHRjepfT2Z6fjs7pGmPhIEjWF1+1Bi7MQiCPoAG7AigdEj+tS02hBHTEmAliQJPvSyGR0rwu0DBjUGRVAJRBOK2KYuDtALiLPpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YQK08dS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i7c7020392;
	Wed, 23 Apr 2025 00:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=83W0VPeGc5SyYnArV0JEVr
	ZRTV1S9xpB2QWW1QO/5J8=; b=YQK08dS+SDu1b4JUBoU9tkWeQme4izuvKw9TWP
	rP3HJY+IUjlJAkuBjjfFBPodrBM/iOu8QUWhhMOBWcv7lwvhZFlp/h0kRgdY0N/B
	XFSmsP29co5xxkqT6jsF1gIonFcM7fHVInDT++7gK7IA9J4CfNYH68f0NWAT8L7Z
	urMVomnchYO7Xfa/jqnJF4aKE/UcoMIw17JBAWeXXrpQ84zGr6YwvWhtX/hbz1/a
	76/+kmMvReNAxyg83VlQ+6Z1QWJLPqcWMJ9GmrohFEmkXvjh2SkPZLUC+FIoxfX4
	W91htnCK4/ODK2eRsNiRePNGrgXjoxDlccF7sBV6COycOHGw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh20dmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:58:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N0wU7D024503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:58:30 GMT
Received: from hu-djaggi-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 17:58:30 -0700
From: Deepti Jaggi <quic_djaggi@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ptalari@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_djaggi@quicinc.com>,
        <quic_shazhuss@quicinc.com>
Subject: [PATCH v5] dt-bindings: firmware: arm,scmi: allow multiple instances
Date: Tue, 22 Apr 2025 17:58:24 -0700
Message-ID: <20250423005824.3993256-1-quic_djaggi@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=68083b37 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8
 a=jixImWN2ZbPRd6SRAMsA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: LMfdflG8Att-BAjhZYWJgy_AC1rc2xtN
X-Proofpoint-ORIG-GUID: LMfdflG8Att-BAjhZYWJgy_AC1rc2xtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwMyBTYWx0ZWRfX5sSZrPr121Jm mTieecMZRRMnnX7FIizT93yI6xtOurbIXJxJIxn5acRLF3+jnaxQ2LT03MXH6nyPqiC4QsISQhZ r0H1zO3DS0O2STrF5P4vxdKyE0v2kP909Xkn4+yKNj00JXywfmsONEDhUKRH58HsJ3KpL8L2kJN
 0eCweurT4t/0gllwZBrLN9yVIN2joDPIN3Ttjhs2jFPsPAEcF4a8A1XQzf62HKh3rHSMOKy08id XTu1o1wUuRZbLe4w3MNZQysUkgHmC2T11SUpcmvCppmhXW408Uph3rWx7orG//69ftMfdU7m+r/ HdV3Sv/Oao8WLs/4N3M//d8BTHtBdbiBr2kCMKAwY2fEsagogRLxurF2MXS+BZI8WDzpQsVaxB7
 umWKIvCzr4tnWBikQs+hK4HT2YPDdZUlqXam7kmAVkHHPJfqQ29cPrB4m3V6npK8QVfZCsjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=970
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230003

From: Nikunj Kela <quic_nkela@quicinc.com>

This change extends scmi node name so as to allow multiple
SCMI instances.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
---
Changes in v5:
        - Added Reviewed-by tag

Changes in v4:
        - Dropped 'virtual' from subject and description

Changes in v3:
        - Added Reviewed-by tag
        - Removed the patch from original series[1]

Changes in v2:
        - Fixed scmi nodename pattern

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index abbd62f1fed0..be817fd9cc34 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -27,7 +27,7 @@ anyOf:
 
 properties:
   $nodename:
-    const: scmi
+    pattern: '^scmi(-[0-9]+)?$'
 
   compatible:
     oneOf:
-- 
2.25.1


