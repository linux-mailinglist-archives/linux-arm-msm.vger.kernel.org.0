Return-Path: <linux-arm-msm+bounces-62750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C787DAEB506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8759D171616
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 10:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5043229615D;
	Fri, 27 Jun 2025 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aq+W9Xnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52A253F00;
	Fri, 27 Jun 2025 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020438; cv=none; b=QCG0S+zhyCcQdpXuTdQOisQhN4UFh2go8LhOvh4Q5+6qrDkJCnupg47i9F2Dsoos1wThhkBuPnRWos7Ahlyo0tjThjZFhx1Eb71s0BmxDWTSipZNkfXoZxccv4WH6R9xJcmEvRPTzuvSnvkFJe2ikidbSqwBhyDYhYj6iittkvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020438; c=relaxed/simple;
	bh=O7/ez2o2qDWbcy8Jh4F5NSEIwwmPt1FcyxGH9Y9TGlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqcupgpzTjIuIGoe7C51kziggHEdCPbmX/w6g0L1cXZbPsplYUqtQ+ukRC6eB3QpthS11aZZZIre0mP6047nH4+IlN4pTSYDAE+w+6as/Qp6uzqbGbBEBfK1qPE6MsS0rihMs7Z+c8N0SJaIL3Ucg+JWYNGBI9fPJ5prI34FcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aq+W9Xnq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DBiY014502;
	Fri, 27 Jun 2025 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQnHw0H3V+R4slZhE/pwB4PzpL5RqMlwlF0P1XlfEJc=; b=aq+W9XnqtPa8Kj9c
	kR5s2DKbEjRXwGwacmEVlkQiVKz3UeE5eSbSJ4RJWvvNnBVAkZij7KWt5OXGKidR
	eVXOsJDgqNwaJ2swwoJ6gxNtozh2dpK35ixMKYIifcOkJYKLuih4sxQMSCdNL7YP
	f/BPmBwWJ2KJCHMIhL9J6uWOnaN/jkl6E3sWKL817D1eu4eGqGzqIs0cZhA/etOs
	LFHwWaCeU79l0yPv+Eh/vpiwrjTTdSYAnZZ2NnB0m50vIVlld5PpRr2Yl+wanN8V
	EbLZE9TKzc4Mx4RoYlfuGul9+niNc+q6WFv2o8L9tUMXMpp78xoct0H5+WbFfqOA
	UHGieQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm253pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:33:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAXnHN031945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:33:49 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:33:46 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Fri, 27 Jun 2025 16:03:16 +0530
Message-ID: <20250627103319.2883613-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e738e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GRIQVaEDZ677QwRh498A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dMiO9sBSuVS8av-mWGzNfBx5eTQ__Kgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NiBTYWx0ZWRfX2kRB8sP1+D37
 o60lWLiV8K9o0bOlbR/0m7bQ0Tav2RhFp/QdcTdcNqOZbaoWwVcMey+Xkj9AqqlXngC66pfL2Wh
 1T5B5s1zwQ26xKY2pKOfdofbLDFDWXXKhQ60YfnxxsXHMCnUVB+sEZCqgEp2QbG40ca/Y7Cpx++
 ol8sbI0AkimszZdo4g1rFV4GVT+GF1AFYupP4gnyziArr5pKw4YLsJAmUljuiRnf6HMP/+z3voB
 EiE5AEgu1ldjoJ0CHxnS52bIqWPFfCHM1l5H3ttKmuSI33R20OJr+ps5FH3ATYAKbfZoWefRf7t
 aslANNfJQp58wpePmDzSsDBvCVEJRdV5g9QpExYTxUT3zwlhkP0YfET/NCSLkATVJWSVEirsPGq
 p7myTeRNVlxqYosI4d8AjoWrah/fhbpH8cIeQ8jRPOS45C9YS8BfAzer+ZUfqXVt2qhQPSew
X-Proofpoint-ORIG-GUID: dMiO9sBSuVS8av-mWGzNfBx5eTQ__Kgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270086

Add "gdsp" as the new supported label for GDSP fastrpc domain.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 0840a3d92513..3f6199fc9ae6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - gdsp0
+      - gdsp1
 
   memory-region:
     maxItems: 1
-- 
2.34.1


