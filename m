Return-Path: <linux-arm-msm+bounces-31455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB2974BB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8DA28A25C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4140513B580;
	Wed, 11 Sep 2024 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aOrLs44Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D21DA5E;
	Wed, 11 Sep 2024 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040687; cv=none; b=Ioa4mRmRDXWbmJ8igmgMNjwCmCzHACZOxUSQvpOvTUlg/A/8cJ0JJgxbdPrnDR7Hfd9LEdBb2qAYL0cIj2wwbo5iCRcjWNRQaJIBzOg/aHZ0v+FMczhQlBpeP63OJbwB7o3tz1ffURTYLg431aVsfVY+QcNNtqnQnnRLTCp/8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040687; c=relaxed/simple;
	bh=/ByURgzDkiYWWe8cunyhxYwoHLxzGchkIS5/MeZUXyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ksRAJ4DZK69zlr5ZP7oZmTVl4N/yn+8hBXp13V0syJ3VWPL5AV8NNF9bQ3juKveN/86D5ebrAcxFrGRqjLPntaNiyL/rEni52PmqjS46NVuasZm/Yfx87NgHsyxFuP8c0Y9G/kgFII2MznuLipQFHhSyI3OneZ6PKCFaaahTtMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aOrLs44Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AKtg5U031248;
	Wed, 11 Sep 2024 07:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CvP+B36YlFJyLHilcMyIXA
	Cs0bLuJyHbnAWAHpZXx8k=; b=aOrLs44Y/6ylf+sKl2nU1nIQCqxGCLNedb71t4
	jqdZ56lHvjep7PXiJp/Miccj2NRy2WvwKWEcisvQHDkEruyTLlJ0e1bEnW4eM6fR
	439hpHO4EoZf0y88gX4LfSC4MkwQqYl4C6nquocrFGdZjmH07XHN4jeIpHWs9hDS
	M38RT1QkYNzZySgCnPpyLKO8lFJmsFJR99vqmNr0i0H05nDUusPHIsQzEdqIxgVc
	z6iDLFJOyw585ekBn5ZcJIEjD8dbh67+iralT0NhQB/RETnyuTqabwk6ZiFE2QqD
	JK0TjgZ26bvlawKuXyUhUqtUSaGZgnicwGQ+2tgatmJMC27Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gmw0fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:44:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B7igBn016685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:44:42 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 00:44:39 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 15:44:25 +0800
Subject: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFlK4WYC/z2NQQ6CMBBFr2Jmbc0Uq4Ir72EIKe0UJtEibSUaw
 t2txLh8L/nvzxApMEU4b2YINHHkwWcothswvfYdCbaZocBCYSWlGE0s94hNMjE0LXvLvhPata6
 0B8KjUpCnj0COX2v2WmfuOaYhvNeXSX7tL4jqH2TPifWtsSmymKRAYZF0pZ01iKfL+GTD3uzMc
 Id6WZYPkGOh1LoAAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726040679; l=1155;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=/ByURgzDkiYWWe8cunyhxYwoHLxzGchkIS5/MeZUXyY=;
 b=EbHCHjGXxX7bFW16r1WCWBjHTVkU+ix8LDT011K32cb0hLyWF7XvFKOa2YDRgSGxmBok/y37F
 ctngXBkb/tED7Z2ZxUxnMbYRshHR6GLP4lXhYiXWjm+ODZb/130ORxC
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fea7R4BKtiX9fTiSBU-zc6S1oP_G6fpl
X-Proofpoint-GUID: fea7R4BKtiX9fTiSBU-zc6S1oP_G6fpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=958 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110057

Document the qcom,qcs8300-tcsr compatible, tcsr will provide various
control and status functions for their peripherals.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index c6bd14ec5aa0..0edc7810d8ef 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8998-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
+          - qcom,qcs8300-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
           - qcom,sc8280xp-tcsr

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_tcsr_binding-afbf8d5e0644

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


