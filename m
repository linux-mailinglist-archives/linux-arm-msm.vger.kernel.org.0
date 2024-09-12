Return-Path: <linux-arm-msm+bounces-31541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A916E975F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 04:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E159285856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 02:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D5A126BF4;
	Thu, 12 Sep 2024 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HjPrl+mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56720524D7;
	Thu, 12 Sep 2024 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726109473; cv=none; b=diQyKvBWWclVkdE/TUGCfMh5SHreJiiTFMAMXfAllT6qUnpe3H1VBR007SjzpOIzQv8m4BpHjlypnqfcRzGomzHdSKIUaASa48gW3s8qr+fCtVvmJJW4/hR0QuUvt5sf/jf1vxxT7lFuPw2aS/bl9cwxgIAq2iN3YJtVGpQkWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726109473; c=relaxed/simple;
	bh=y/uLkUWBQOLP7TPOb5+vS1X6nVhCEjLZ5TdYFfVh6iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=d3IdaQNSs+weCM2i24bH/k9X3esrY3Wav0s30ojTWH5qKtzLsk/hzcC+otmDXgKZFVGRDsZ38aKk1dgSYC2D/+LNglUwFHh7W1X/+JQDHB8B7Lbq6zSYmYhDqJvQGONtxs6Lj89x8vj22e40UDJG2wpNbd/4t9n4iCh7da1qL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HjPrl+mn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2Ku8e006373;
	Thu, 12 Sep 2024 02:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CJ5sZMWil1t8FAGnOVtcPM
	tKd3t9USG+iO6mzn5nstQ=; b=HjPrl+mnowHzddBQMEpmsdQ3goMSEqCBfAhecY
	WjBKQu/5s+kPdflZ6JdKOZ5MBWmnAGtRtI0E2Xw3EQBL0KT5fuUTn6aPxJJuCMkJ
	9HlvlNWPqDPfKb+gPnzfHmbCyV8lQ8G2wWSvjG1HnRUIyZztFznwiBF4mRPXwhf/
	wfAcM8n0wOsgZ4688Z8+hPTmkYjugyJw1RrHltPIchFu3ZfrF/AqHB3JaLL7hMTH
	IROgL1gzLQaO6yWA/kEfLqh7x+hZS6yN0YhVNVB/57SObJMYjE9CXoyWDi8Fl5Yk
	IE21JM5EASCQ5Tfg+mh2V1iUsqH2yxqZxJWB7NHKcPdPYPyg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pbm92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:51:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C2p7Kj024918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:51:07 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 19:51:02 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Sep 2024 10:50:39 +0800
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAP5W4mYC/42NQQ6CMBBFr2JmbU0HioAr72FIQ4dWJlEKLRIN4
 e5WTuDy/fy8t0K0gW2Ey2GFYBeO7IcEeDwA9e1wt4K7xJDJTMkaUbRdp2eKQZN/ju3M5mG180F
 PFM9YCKfI5K6opKoIkmQM1vF7D9yaxD3H2YfP3lvwt/6tXlCgKGuZF9IYUnl5nV5MPNAp/aHZt
 u0LO1egvM4AAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726109462; l=1050;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=y/uLkUWBQOLP7TPOb5+vS1X6nVhCEjLZ5TdYFfVh6iE=;
 b=73IyChFMtwCDIKLXJwOV7JY5Up7bZJBdk7btNSOxwra4ijtU+Kvsm1Fh3zjDkDiVJSzQPZuGr
 YBFraVvofhMBR2p2owPwyvmNJyiI3pDEvGVp4kp6V5DTA/zjiic8tMW
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v_50T28R2Lhg9M1e7fjzWi6mSKcoxIdk
X-Proofpoint-GUID: v_50T28R2Lhg9M1e7fjzWi6mSKcoxIdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=693 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120020

Document the qcom,qcs615-tcsr compatible.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Document the qcom,qcs615-tcsr compatible, tcsr will provide various
control and status functions for their peripherals.
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index c6bd14ec5aa0..1b09a57fc633 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8998-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
+          - qcom,qcs615-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
           - qcom,sc8280xp-tcsr

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-add_tcsr_compatible_for_qcs615-f4cb3f58048c

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


