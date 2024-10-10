Return-Path: <linux-arm-msm+bounces-33757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03F997A67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C4601C23072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F408A1925AF;
	Thu, 10 Oct 2024 02:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IJ3N6W9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547919005D;
	Thu, 10 Oct 2024 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728525954; cv=none; b=A5gRujXga68HyjEOe8wwiIzAVrD8jJSuP/uhiEhiUxOVfZofWfM3Tz2/lXuMgn/lSOXgu03u8cEyZ0H6g7hBJdid9zSszZoMVgRHfj2/8VGOBiNEisSVUiUL8YNqKsG9ULCsd4gmqnv6F2vO9uI9IktB5dcmoo0wNKg3kxAapmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728525954; c=relaxed/simple;
	bh=xDOzq8vKFs/+SMggfeJ4oQ3ElEkJI5aj2UIzGLX2a1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SRwtDLvghtDEUPPMvWLfLvtsl/GzOnVt2wwCz/NTovZcC2dyLC7nBHMKBr8POEgtNhcXaZumZoCtDtXiHdaOI/qVNMiXXBLMr8CxUxPQtnL5x+s291s9DRBuMP4h0dlqcE8TgACJzua7jGuvM6dI1fEXjR+li6I5ShN97091MiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IJ3N6W9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bFGg005694;
	Thu, 10 Oct 2024 02:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMWB6PcATmbLPyC1cK3HP6Yj+b56f5C/ktZYBF11ToA=; b=IJ3N6W9dNP5sSNUP
	lzjfIgjIEQnn8GECnRxP1oygMQHdez13S5aJumqMaHr0iKoUO63A2VDr1r9JYNgl
	tMmlc7tM9gFsTMdRxW0rGZheSt1pRQJtVZc/ZWC84pq4du2LOsFt7//DvNEo+bCn
	AsH0x3Mdap0T1ewRrj+QjmYP8blwW1tv710+UnPWiPc+nL0+DNoIK2ohrT95a9p4
	sAWWRJsBrABZkWX0oG5JhyRTwyVLoJLKuFVs8GUPqA4LsaREmjcWG1M76greRVvQ
	nbSgYIHAOTZaASPFx9bMd8ckBoMU+m42IMWttovyimDk9gvVlo2ySp4n/XF8nqXP
	lTpOTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj06tpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A25f68007438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:41 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:05:36 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:03:45 +0800
Subject: [PATCH 3/3] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-schema-v1-3-98b2d0a2f7a2@quicinc.com>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
In-Reply-To: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728525917; l=942;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=xDOzq8vKFs/+SMggfeJ4oQ3ElEkJI5aj2UIzGLX2a1c=;
 b=1z1+gEQSdUNvVtWH1kgu0Wpf7p2NRFe4O2YM+HsztTu+HcMc2wDmNTYsfHcSS+5Eu0iJyRMHI
 SUuEsAMhH4iD7tvpvnA3onQ+/vnZO56Vkp7WCpF7rK0JNZwNMYlWypX
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J2urINyswDZo1cM6XNga2xnvPLfW8L3Q
X-Proofpoint-ORIG-GUID: J2urINyswDZo1cM6XNga2xnvPLfW8L3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=747 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100012

Add compatible for the MAC controller on qcs8300 platforms.
Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 8cf29493b822..3ee5367bdde1 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -23,6 +23,10 @@ properties:
           - enum:
               - qcom,qcs615-ethqos
           - const: qcom,sm8150-ethqos
+      - items:
+          - enum:
+              - qcom,qcs8300-ethqos
+          - const: qcom,sa8775p-ethqos
       - enum:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos

-- 
2.34.1


