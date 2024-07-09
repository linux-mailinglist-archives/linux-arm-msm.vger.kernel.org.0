Return-Path: <linux-arm-msm+bounces-25656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA0D92BBCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6191C226D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A92187541;
	Tue,  9 Jul 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V8PrZNDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E16180A8B;
	Tue,  9 Jul 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532934; cv=none; b=U8RxSzRah2verpP0qZHkQPYEcYkspNTb/8s27TT2Z9RAj/o8nu/ZTIDsD5rOrNvbClM3kSchrfyUoKOElQX8Y+0YoHKifEGLxkmTsfGG/wdj7TeYRLd6XYb3IF/G4PX82XImpKQ2vvRIRALSbjrMSwTp8jqzqyJUwc+tngjmYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532934; c=relaxed/simple;
	bh=F1Y7BxXFMIKls+M7UZwELtYIuFm5DUTYJ/G6k7r+lV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hPpjWs4oxNSRh+FdRKHJhaMI+wOl0niHv7F7KjLrsUC5wboq/sdEj+j62bgEHw8pk3OyiGENXUKIYzvCuX3o3o3uRr7obVZff04Ec6jUfYg4ajS0sbbRlwscUFA8tJV2LNklSskc03bcBy8uduvexf3o1xbfDwqVUZc5oGvAdkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V8PrZNDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469CQllD026786;
	Tue, 9 Jul 2024 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXDyqH6Bo0b0djH6ah4qwD0y62XI3e35O06Nh/L4CvE=; b=V8PrZNDxzRjNgTms
	m0J1XwBBinKddzbT5WsYToCdaxzPotE+vOibjVZL4NWw4HfycayNG9USaa7oUIAr
	JDp26XuA2Tnp+4R5UNrGdXIhDNWvr039Ms67bkAP7i4KE+8CAieJNksHGzOD39As
	ThssWuLSrjNAoRg3nrCH7VUW9x7Inz1oOUVtWbDQbaCRas6/kRsQEyl6CEZMYJWg
	QTmOfZgbj48tpO+tNPaPwyqL/dB1g3UyyCCNyvO+1gE751uCKnrLPC8pZeILzc0J
	UuVuApEHPzGHft40o5ZqZ9Gu+Jf9m/HlfF47A3RoXBtwOrm5JXJ597dILKgdrT0Y
	vv8Byg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg3xs2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:48:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469DmXVH025658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:48:33 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:48:28 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:48:13 +0800
Subject: [PATCH v2 1/2] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-1-e7f8f71bc334@quicinc.com>
References: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-0-e7f8f71bc334@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_qmp_ufs_phy_compatible-v2-0-e7f8f71bc334@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720532905; l=1438;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=F1Y7BxXFMIKls+M7UZwELtYIuFm5DUTYJ/G6k7r+lV8=;
 b=rKO+ilZhfFcK+IBhMJ6Vadjc5hxmZClCvZzqRvDgzZDdrfuenomqB8KTC4ylUcdyCiSbOTmee
 42bs1oq7kaKBeI0CFrFeG9bb52D0SDP+sCKrhzPPtAwGJtkBdGxC3lv
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NNDcVmjjVKpZiPCE6Ec8UI9V3BZ2haQv
X-Proofpoint-GUID: NNDcVmjjVKpZiPCE6Ec8UI9V3BZ2haQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=747 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090088

Document the QMP UFS PHY compatible for QCS9100.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-qmp-ufs-phy" to describe
non-SCMI based UFS QMP phy.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f9cfbd0b2de6..f5c321a4a2f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,msm8996-qmp-ufs-phy
       - qcom,msm8998-qmp-ufs-phy
+      - qcom,qcs9100-qmp-ufs-phy
       - qcom,sa8775p-qmp-ufs-phy
       - qcom,sc7180-qmp-ufs-phy
       - qcom,sc7280-qmp-ufs-phy
@@ -85,6 +86,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-qmp-ufs-phy
+              - qcom,qcs9100-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7180-qmp-ufs-phy
               - qcom,sc7280-qmp-ufs-phy

-- 
2.25.1


