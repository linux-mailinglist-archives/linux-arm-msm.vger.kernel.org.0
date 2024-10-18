Return-Path: <linux-arm-msm+bounces-34853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2529A34EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F551F24DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B469180A80;
	Fri, 18 Oct 2024 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dW7QnvPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47B17E8F7;
	Fri, 18 Oct 2024 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231095; cv=none; b=aQcx8KoiNMQ7hi9/A6fHu9ieWuMj3Y28l+clePHTVLDV8m0oUOPnEBmTlJiKZtaVgBPdNPy+MeHwyg4B6+ud9Ee5Xc+KKeugZQ/p4+ECYmrzsH5IrThiEbM0yFJ17X6e4rod0qAggY2i158uAxbDksLM5vmDrZYSjhwRiW1L25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231095; c=relaxed/simple;
	bh=oEJh1xlSB22HJCS1ZKkQmKnfjZlVSf3lq14Jvj0fp1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=k1BhpQvRXHJV+TRU+7QaBIFsWBkBD9ilu97D/85iTR705y5bZwcv5Dyf662wZxKuMdOqOM7JUdwE9Sks9mQbmkbxuedMrZt3DuIRgW9Qv+tU4MeOWM9YJA1HLCmU8yp0SZJgorzkMq9hI2hyh83tn720aAPmJ0nm3KGtdFeu+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dW7QnvPA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5EMkk029274;
	Fri, 18 Oct 2024 05:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p/JHAqoSPPM2jV7PdOuSa/
	5iBcBdFdh3+wTD2LiVbeU=; b=dW7QnvPAKDVFcqF8OvSjFwVuwm+dZR8oPu956t
	qSPs7e61eK8bwaw4F9GHZHHzOyieni3VfXAogFXen0t53XI1vP+TMbhM/FuZ9Iu8
	mVMGEgEG5XzcxpuJAdpomuegfH1ovSnK2qgkxtvxpR5wzFEbju/d/3Lb177bPrpV
	BbGN7jvx5eI8sFDvVxwPVn85bS6LCq+/8uSLaPqTjDR0x5ObisfpWOmUZDLW/EZp
	+WKmqJEuL2oi78TfFIEkUdqEVpv6Ou54jh2SQLNBNtanhl2FANAi2YyAL7heQoot
	ZazCd8TGIRDG8bczIPs/+gcWpWYBG9/OJ6KTbgvi4rXQUIPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbq83e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:58:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I5w8di030884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:58:08 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 22:58:04 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Fri, 18 Oct 2024 13:57:50 +0800
Subject: [PATCH v4] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-qcs8300_ufs_phy_binding-v4-1-261c7c5fb8ff@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAN34EWcC/3XOzWrDMAzA8VcpPs9Dsl1i79T3GCP4K41gc9I4N
 Q0h794kh9FSevwL9JNmluNAMbOvw8yGWChTl9ZQHwfmW5vOkVNYmwkQCgE1v/isJUB9bXLdt1P
 tKAVKZ26dVFJXRlbOsnW7H2JDt13+/lm7pTx2w7QfKrhNdxMMqH+TEo1kf+swZuIFOfAA0RrbB
 A9QnS5X8pT8p+/+2EYW8cAgvn2tCI7ca0ArgqisVq+SfJDE8b0kNwmjO3pppAPzLC3LcgeZ8vN
 aUQEAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu <quic_liuxin@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729231084; l=1925;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=cIzsS7WtAgG8RrKLAxp0haNwd4XREYe1ge3YjdcH9XA=;
 b=c7Uik0Z95t6IvSIP83Hw8odE2Dd07OVzfMe3IMRCwCIKIojOhFGlQ6iq+mxGIH04QCYdwuUyT
 To71V+deLaNCGHk0SZsaIGfsB2tIo6vIzbzsm6YxMog5A9fPPTkjsoL
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GuLA74vhDjOqofX165Tgo8Wj6vEB9Dyl
X-Proofpoint-GUID: GuLA74vhDjOqofX165Tgo8Wj6vEB9Dyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=990 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180035

From: Xin Liu <quic_liuxin@quicinc.com>

Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
on the SA8775P.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v4:
- rebase on phy/next
- Link to v3: https://lore.kernel.org/r/20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com

Changes in v3:
- remove redundant compatible.
- Link to v2: https://lore.kernel.org/r/20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com

Changes in v2:
- decoupled from the original series.
- Use fallback to indicate compatibility with SA8775P.
- typo fixup
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index a93d64d1c55b..72bed2933b03 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -20,6 +20,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-ufs-phy
+          - const: qcom,sa8775p-qmp-ufs-phy
       - enum:
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy

---
base-commit: 26ac85e3adb4775df42d94b310276b06c0898d3d
change-id: 20241018-qcs8300_ufs_phy_binding-ab34387937ba

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


