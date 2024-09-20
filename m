Return-Path: <linux-arm-msm+bounces-32044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D508597D1B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 09:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFA128264A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 07:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D1338DE5;
	Fri, 20 Sep 2024 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I/80oSva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298820ED;
	Fri, 20 Sep 2024 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817191; cv=none; b=KwIwl5VWnogMGJFr1eARf487JcbFUBwEGvRrzsEydC1TUIKLyAtXeo7nhOjXrnQ33Pgvg8x32kK/uBMNWHkJDcNARyHwcj2mOMbxwVmShgVyJN4idc9v11zk/eEFRGT1cKKsJvZybA0vIyrZ6o89qV1iUfof5qKJ5MESr5RndF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817191; c=relaxed/simple;
	bh=v4qD2LzdHQxvvvs14S/SB1WeQes1Tb/4cKlo5Zj+e6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=V9wYwuljyYEaP9dAPL5afRVwvxn7cz8HVZ7DYnBTQqVhEgpjruNed+eQzEQWY7WfKl+14LMxRktoII8EN0Z7bd30HXuWNDIjUkL6OGSctPf74ZlRuxSZ3Kpq67SOrK0fFl8kt7w6dKLKhAlzdo46TwCExTEwr+VWvwoTE6pvjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I/80oSva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3sNj005788;
	Fri, 20 Sep 2024 07:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kw6dFYWBBHebVUmaYsgwQJ
	YlHh8GjmSyGYzeZdBjeNg=; b=I/80oSva4FZFckZyI0rhxNTx1M3XqzxomWbUDD
	wJmvlcf+6t6Z9eupXv3JiFZo5oC9xKhpaRY6eLugpgcZlr/z1Mc7vwcKfHsw9LvI
	Pubo5jEypJxUwsNxfKg9hFyNzKhQ08YkGi+BoATc0uV2LKQoMENjy1fQJ0yuYLz6
	bz1dOIqJpERdau6JFZ55ag+pQ5Di6wmaXMqY/qiU6dAhZLxoaPEDVT3JSxsOXjYw
	egygUfjhe/aIaa9AeqHFATLYE6jdOxi6mYuIE93uJhQKxjWJNv7UUMoMEqROpXOD
	WhwBRQY24X6dA+aGjjpgb9KLmjBfEFts6fkwJARA6r2JHxsg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jj08ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:26:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K7QOJc027264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:26:24 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 00:26:19 -0700
From: lijuang <quic_lijuang@quicinc.com>
Date: Fri, 20 Sep 2024 15:26:05 +0800
Subject: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIwj7WYC/4WNQQ6CMBBFr2JmbU2nARRX3sOQpnRamUQptEg0h
 LtbiXuX7+fnvQWSi+wSnHcLRDdz4tBnUPsd2M70NyeYMoOSqpC1ksIQ6cmmqG14DGbi9u60D1G
 PNlVYClmjMdXRo608ZMkQnefXFrg2mTtOU4jvrTfjd/2pUf1TzyhQlO2pJCqoUIYu45Mt9/aQ/
 9Cs6/oB/D1xeM4AAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726817178; l=1288;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=v4qD2LzdHQxvvvs14S/SB1WeQes1Tb/4cKlo5Zj+e6I=;
 b=JiL7oABRij1J8nybGMIGnVyb0D2pJHKqIvuUYpKFYBhbvnWYiceLUqgkc3R4BydiXy+WbPhpd
 B0/30Gs+vJrDc3oobS7LwXPFvmGFCyQoJP7hYzfWC5YzxERgVBdafuS
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z2ejSs9JvTD6Ch5z7E3Q62l7uzyxD7oa
X-Proofpoint-GUID: Z2ejSs9JvTD6Ch5z7E3Q62l7uzyxD7oa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200050

Document the qcom,qcs615-tcsr compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Document the qcom,qcs615-tcsr compatible, tcsr will provide various
control and status functions for their peripherals.
---
Changes in v2:
- Collected Acked-by
- Rebased patchset on top next-20240919
- Link to v1: https://lore.kernel.org/r/20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7d0b0b403150..6734a6c99f8f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8998-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
+          - qcom,qcs615-tcsr
           - qcom,sa8775p-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr

---
base-commit: 3621a2c9142bd490af0666c0c02d52d60ce0d2a5
change-id: 20240920-add_tcsr_compatible_for_qcs615-091aa67f1c6f

Best regards,
-- 
lijuang <quic_lijuang@quicinc.com>


