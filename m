Return-Path: <linux-arm-msm+bounces-31454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9E974B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 863381F2793F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F7413D502;
	Wed, 11 Sep 2024 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5ncbsKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0587127E18;
	Wed, 11 Sep 2024 07:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040095; cv=none; b=ZkzzImRxroZTROSgs79MLzeOjYkJT10zOtTCzgqgUga21Zv00ZeB+5b+rC9aMoImUXh7myKDaKdDVcHotd8xhW1sermEycHpwVNKAKKj5Y5CGvYSTOfH3uY7R+bZtXNQ+SjCquMs7TOM5OdZI5hWZEG6ytbKE4xRx/04j/nz5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040095; c=relaxed/simple;
	bh=lpEKEg/lxND+dIm4tWPsyltC6bYOxkCcnbu8PisjEfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=KUZeO7aX+oY+1ogZnlbYw4I7jKImk8YNEz48pjpJ3kpigMXE/qGV9gRUQekLJeIvAd7BmtV/jL0hztM52MIHKJqa8yHwJCTFv2T+GcVFPHvbd7X9595q7eMIjYV5apkUlJNzs7DxlnavvTE1pH4B1n66SDm+zRisOYzFO6NDcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5ncbsKY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3N1Rh024795;
	Wed, 11 Sep 2024 07:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=txI5nFzil8u6z/VyvEjwqN
	Fh460nNjYFGuyzh8X79jY=; b=S5ncbsKYKcJUOQMxGbnBJLbVNhOwBH4fX74V0D
	bDyk7zweLf+RNUp+9f8Tml18fM+7dpCvpmXPEHoalE1NxC2EKmpkjWF7NgG1ZyHF
	JnFumRCw8wk7ObYzMw7s0RhUI1bEh//i3YRXIkQOouXO9Z2YMFeL0VplkA3Bwcr6
	gT5QCRVn3hI3eA6jtNTo/Mrtq5z/l3WScYhvH3ICkMEVgljD1XDZqOs6j1t/gxbn
	zDkecaih5ORUXGdPqowmC9PlZTpU8UtTkDyNXnhd3YXMc6dK7nqY719uCFNJy7C8
	DvzsWgYPzn0hMRVT87L7SDYaYGekF4t0osPEgub+abF/Br/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rgp66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B7YmBD007258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:48 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 00:34:45 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 15:34:33 +0800
Subject: [PATCH v2] dt-bindings: nvmem: qfprom: Add compatible for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAlI4WYC/z2NWw6CMBQFt0LutzW3gKn1y30YQkofcBNtoUWiI
 ezdSoyfM8mZs0KykWyCS7FCtAslCj5DeShAD8r3lpHJDCWWNUrO2aTTuUJsJzfG8Gg78oZ8z9R
 JCdnZygkpII/HaB299vCtyTxQmkN87z8L/9pfEut/kjzNpO6tmROxhTNkBq2SyhmNKK7TkzR5f
 dThAc22bR/hJ7h3vAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726040085; l=1208;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=lpEKEg/lxND+dIm4tWPsyltC6bYOxkCcnbu8PisjEfo=;
 b=VvV9pQcnAtp54NLSKKDHtBQoioMN8eSJisaxRlgZ58HervPvCvfSY8wMZx+zaWZ0BxWr2bbAO
 BmYFHUvXuSyBspyzWv+9jhZCnxg3FS66MEsNZgfm4DUeaqpABW5dJZ2
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SHz_W7_l6xZYn3wopzuCimqMHmE_0vnW
X-Proofpoint-ORIG-GUID: SHz_W7_l6xZYn3wopzuCimqMHmE_0vnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=761 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110056

Document QFPROM compatible for Qualcomm QCS8300. It provides access
functions for QFPROM data to rest of the drivers via nvmem interface.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae4..fcd71f023808 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,msm8998-qfprom
           - qcom,qcm2290-qfprom
           - qcom,qcs404-qfprom
+          - qcom,qcs8300-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
           - qcom,sc8280xp-qfprom

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_qfprom_binding-a5a79be3f797

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


