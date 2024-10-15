Return-Path: <linux-arm-msm+bounces-34398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A854999E0A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D990F1C21C58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BEF1D14FF;
	Tue, 15 Oct 2024 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RiZInj5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97921C68AA;
	Tue, 15 Oct 2024 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980198; cv=none; b=jYWxll5UKd6WLOiJTd5ckoGE7WgzAmQzBEsw8+WWen9A0bt0zUPVsHqI6kWaD9jYuWRKRFlpMD/pqpHICQPDjsXMXv7DqAuQZD3TLvr7dID6SQ3Z7va909636c9mPDZWT1nrXxSBt4MA3EzVXXnC7mVz1AY3s4auPIVHuZ6R48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980198; c=relaxed/simple;
	bh=cO2Jb6e2HoeMnJ/Y8Q+BRlNDpKTNw03Gmsqc0PTfJeM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c85PC3duoZV6zjbLHCry5abGpI31Mk31uRZxBtu+3GuVGZCUhz2puyOpdNnvq3vns/qB5w0uo6v/XntS36eaCD7JaE6x6XQKPa9g4JeoKZvorXCEkAeJqo0RPZvC4uB8q23hx8S2ok1+8aMgMou8i/WEqABReWfDuRGeeFTgiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RiZInj5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ENi2m6009437;
	Tue, 15 Oct 2024 08:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQlxf0kx/yjNgGYohmnOIsBL
	E0wjRBFkB5Z0oCuONLo=; b=RiZInj5mC9TxVNLKUh7QKoUyeItagqWjP1p8gtCm
	sUgZzPMNRAddv79T+Jl0WWa8dd9H7BFYQgXLjtS4ZagNnyK+eP79GF1tlvFdHXNz
	nQr2DKmuHbWQGpp3Myue080boGUvHUbVh+JdS7qexMaief7vS0TTy8p+xOgwqD4C
	yf5sGmZ+DMUz8zBLfQIjaicZGe9VNecxEk+aYSjggx6E8BCJ4DluI6fg3Fck/FZ5
	5uLcLPG/jdnnxk7Az5+J1nyaZqqm4jp6hS1OYejlBoSRg+B+LNctqSspUJyLAO5s
	NbTmjUjyNXCfP6Sby48nS68yavt14dTPq6gieFxLoq2MHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd8xt60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F8GRO4018129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:27 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 01:16:23 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: document QCS615 SCM
Date: Tue, 15 Oct 2024 13:46:00 +0530
Message-ID: <20241015081603.30643-2-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aDS8R0cjFw396bRKVPo-sgfl94CK0B6A
X-Proofpoint-ORIG-GUID: aDS8R0cjFw396bRKVPo-sgfl94CK0B6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150054

Add the compatible for Qualcomm QCS615 SCM.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..2a94d02f11a1 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qcm2290
+          - qcom,scm-qcs615
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
           - qcom,scm-sc7180
-- 
2.17.1


