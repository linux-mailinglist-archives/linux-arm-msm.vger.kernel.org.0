Return-Path: <linux-arm-msm+bounces-64117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF6AFDF85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696CD4E1C34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B80626B0BC;
	Wed,  9 Jul 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V59s2lfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190023C1F;
	Wed,  9 Jul 2025 05:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040076; cv=none; b=dTCzDro6Cg1CbAnawdLN/+qRIJP3Eto12P2aNWzaksXDnmzYAukqVuHOgZQb9gswIV225qjtzpvpTMmdElDswkAApDaAjs+yQmFwvHVaENwtawkc9s39a2lhrvgKi661/yBDjIPpj+y4hmpSEIAJ0U50SEDUSXJNA61GMrPTyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040076; c=relaxed/simple;
	bh=m69eBpowmMuNvTB6Apw+JQZp8W3Cx09oDdHKlO4Ttzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KcHXzrdBswHW/uA1eie87QhsSUAzIC2EKTPzJMkvf58MvGbc+FXaiaULqrvBsS5VzL4MQxGMsQzH8qsQk7UfFATWPyuruVM6dhltpc70CMgXNhSquO7EQHpZ/0HINaBWQf8XP55dHKcY1sSujD1YsAKhG8KxV7ft4mYOUMOs860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V59s2lfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568IVCBF017096;
	Wed, 9 Jul 2025 05:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AliyRKzkx1UpYngLzabBdK8VVN1l5cX3s5tZAsft8Y=; b=V59s2lfexMVOLGgB
	qCE0mC/AFiFCnGRFHjzTOgsb9xcjZyW5EeyLPeVWSV6+M4becAFXoFwOXCyjv53W
	pBt5sD1lhKgQM1DCAB4WwiCsmD8sus3UR5NBqqU1wwQ9/kwUjDen0no9bS5uiPuX
	EZyR6JhmeYNo+/HClr6D2eYP3fcPvqwm8cFkxXUwecYmUwrGWcAkqglNA9QmwI++
	3jC6ZlLsz/SkNePrhGMG3Au8ffD0o36vcIwFpw+NYOvtqDGyP8e7EEJW2sXvnYsG
	YZkAWWURTzAXkWhBFolbERNtRfu9wVhQD6f3eyZ9mm4Kb9j7rTEoy39BlyUeUbn0
	8EZREw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtktnab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 05:47:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5695llTu010324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 05:47:47 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 22:47:44 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Wed, 9 Jul 2025 11:17:25 +0530
Message-ID: <20250709054728.1272480-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0OSBTYWx0ZWRfX0B5pYg47XcF1
 itNyEdnuKeKhZb4HS4t3UIWo6r6s9MOUJ09xPgvFQCN1wEMNmhYr6PZejS1AJGZ9oCMvj2kEO49
 oykf6aT5KU1EYpUS8KTqOIrG5DyiRWC7kWh2bsJN117hYUWH7IW7k5P+SMtn2nk7KNPDctdVj89
 UfjfnzaUWFX5+vC5zAFLmE7NbyleyTi6Dd18OKsUPhSmDIzITuj8X2cMK62B5EgWAhJrF0mjg+3
 TBbaayh1I1h+4pDkNLA+xyPWbUzJiriXERvHyRIv+5F/d7o3W9PYCLk9yMWO6+KzNEAHrmUUH1b
 Rilu4PE/RRcliDTlDBFSC0ZcTfB3b3ESemIlvNV77p0IvS2hInnPImK0jskehtqxzFJNrWKw8IP
 N5gefLFsPRzT/LmJI5VIVaX64Uyw3QTRrp2QkGFkv7s3sg5CpZM7uGZxbL3d7l1VeEPuTvCM
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686e0284 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=y9j2seIhk4up1NT0-iEA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3p9u4a8tH4DKb7i3L4064Q8XMCUWO2TH
X-Proofpoint-GUID: 3p9u4a8tH4DKb7i3L4064Q8XMCUWO2TH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090049

There are some products which support GDSP remoteprocs. GDSP is General
Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
fastrpc domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


