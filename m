Return-Path: <linux-arm-msm+bounces-31460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECB974C0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A481C25C07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A4215383D;
	Wed, 11 Sep 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RAOvQmZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD091509B6;
	Wed, 11 Sep 2024 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041844; cv=none; b=OkY2yl97dFnIsCEy+bDHl9QSvSE5TMEUG9bMq6M93GoNec9MxqHdGcZeGy6y2w5M0/9GsLg9IHFX1OYv07adev8HfsBnDzugxJG7bXUXqUwGvdZvZSMs0rEI5o0HdTXhLKdh8iuZBms0pdIj/Qk1w4ot6Xr7EZIvHiaXa5JG51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041844; c=relaxed/simple;
	bh=JrL8WT1Q9pAW2CjQPpRzQQ52tzMTKy/UVMlfTLvOssE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aOpLcDoVvugH+R+O0HlRo/K7NAqAF0woMxWLLeJ0S2ta3aJbCkyw/AEwiMlgOfK+9T4wLi7yb02HlSDY/k41fAGHVGOzcZNVg4IzMmyrRegApINHFbTMbexVB+3MFq/gdx7Hv9RcmbAgH/QYU4eZ+yhRzxmepTuxrUiL1WWi7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RAOvQmZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B4LEKC020509;
	Wed, 11 Sep 2024 08:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZGKBBov2OdulKRA3na1bPDJfCTHPJZqw7HqH5S99Qw=; b=RAOvQmZhyJrULbPS
	cO/S9RTp2ttyhnZe55gHYX6evtuLVS5IoydERMzJZg6J/DNvm7zAC7k9RQBzyT7O
	dzyS8yPr0fl5ECEy7aCp3OSex0RZ0aDxcF7OIMEhFs8uxlvckPQ7AhkkqMgtXuSi
	sKPHzeWdM2xWcIXl79KsAOXy55riTg2MupgzedlwpvM7dsR+DmhOuo54yrj0gYjc
	I+5EwddkKqIa9GpAutxGcbYQO9dSWaqytLU42bWDSRAK/B7V8ArufF4dI7dJ0nQO
	xa6Uzh0bL/tftfWMZcSRhDOeEBZIbmlDP3QJiFmnHi7RMDVFCBwehmg8neFzTt+J
	imnZTQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5a0u5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B83maB012984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:48 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 01:03:45 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 16:03:16 +0800
Subject: [PATCH v2 2/4] dt-bindings: firmware: qcom,scm: document SCM on
 QCS8300 SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_binding-v2-2-de8641b3eaa1@quicinc.com>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
In-Reply-To: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726041817; l=894;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=oOjyKyCPAkxf2QlFwEWxkyEIm+KypVTv3qfEjIBKHVE=;
 b=xiKrO8dEHxsVwny0ktnUQ54YW9WUjfTHbey7TT6ohfTFjMulTqA3yT+2GtDIhibouYgTX0y25
 Vzyge7AQ8fADJuckSTrDEQ2BXNKTteGjtxFDSzXI8SA+W6dWAn5B8UB
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sqtQgDQDYXGAQFQHldo4qBt3_zldXKjU
X-Proofpoint-ORIG-GUID: sqtQgDQDYXGAQFQHldo4qBt3_zldXKjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=957 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110060

From: Zhenhua Huang <quic_zhenhuah@quicinc.com>

Document scm compatible for the Qualcomm QCS8300 SoC. It is an interface
to communicate to the secure firmware.

Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..f3ab819f812f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qcm2290
+          - qcom,scm-qcs8300
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
           - qcom,scm-sc7180

-- 
2.25.1


