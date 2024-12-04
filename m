Return-Path: <linux-arm-msm+bounces-40409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48D9E482C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C1D1880179
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6E01F03F8;
	Wed,  4 Dec 2024 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iP/8hB6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65E2391AD;
	Wed,  4 Dec 2024 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733352843; cv=none; b=PxUSKhGSsDRAqBEMRtMwGmNuyzY84qOOs/PlW1AnaHuRiRwV0vfvTVkmCh/9EKxaPMspKj34L/tdZve5PQTg3SiBC1DuVKXhh2zt3QGdwR8fjlbBu/aZ8PCsMHF9NjyAmHcLw0v+it9hqGDlbE2XmzStn6pcYoQkQZl7JXuKcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733352843; c=relaxed/simple;
	bh=phBG4qPWzZ0qStQD5GB5kfJM1TvRh39dWaqrGwY+E64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=rqG14DWh+CvrHyNv6Dh2byjlW9x7oxpnvr3REx6b6EnZlcpgWjqzZtY6Nl6YqY5IGshqD1Nrct+it6Idn9Fpd61Nua/7vkqGUJVuwLHx1h7Nd2xcVHlLeKeIueMkcpJAkGy0UbyZDXucMhRtWTDqrfojCCc+BjcZ4eesT1xd1bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iP/8hB6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4MfLcS026173;
	Wed, 4 Dec 2024 22:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Q+3VnkjXBFaSuC92/iafg
	3bdPqJUT22HKrS5ADna5o=; b=iP/8hB6x86ighS1gD4YgJj6pmJ/AnX7rAo+qtE
	TDWnq2xLHZiwlY0TEqaqjCEPeHY00abtg4ufi9q2NMgO30KZJSSLKlJbvLCThT/P
	2FXQ51qn24HPjomaph+/h3i+pdyZfnvdsPCKPfiSq+q9ZzB14i9CnXQto8YUzdzc
	YXPaJJqFEE0+r9RW+JUUeCyf3GaV2jbBImEfxe2JKj5S/tJWnAuy+tUp112p3IZ9
	4apqrcSuNzw/NszZ7Yn9S/j8PDY88hEKfKPDm4t3lHf+0itk2EXsU4BCxgzsCpFk
	FxY8cfvoocEK2PBHdn85+F3iq7hjxS/10QzBj0YRxphY2vRw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9n4s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 22:53:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4MrjlI000790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 22:53:45 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 14:53:45 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 14:53:37 -0800
Subject: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM8750 PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_pdc-v1-1-3a06cb62a28f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHDdUGcC/0XMPQ+CMBSF4b9C7mzJ7QeCTg6yOuhoDGnKRZpYi
 i0SE8J/t7o4Pic57wKRgqUI+2yBQLON1g8JfJOB6fVwJ2bbZBAoFBeoWHRVWWDjdJwoNGNrmCg
 LKjSiJDKQfmOgzr5/zSuc60t9OsIt7V3wjk19IP0vouBCopK7XGylUBUyzp4vaxrnHzMFffjCD
 iY33sG6fgDA978GrwAAAA==
X-Change-ID: 20241204-sm8750_master_pdc-275e5a003eec
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733352825; l=1221;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=phBG4qPWzZ0qStQD5GB5kfJM1TvRh39dWaqrGwY+E64=;
 b=iiXf6Qjb/hsHC45eAXMlOWfmC2zrz5+cqteIPU35vh9zkc/MpPRJr9Et2Ong94e/ZQuifgREA
 cMuxRmoT3k5DiGwzBRFRUKFQoQP9yxI6XKecvnB4+7KSJe99HBF10fA
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G8oFa1XUxzk6P31GiSuHHsJrRSYElQ_Z
X-Proofpoint-GUID: G8oFa1XUxzk6P31GiSuHHsJrRSYElQ_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=712 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040175

Document the PDC block on the SM8750 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Resending in case this fell through the cracks.
Original:
https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index a54da66a89e73212f7b965997dc487d9f0d421b0..5d4a22322c45528a1a8b9a41cc9d4c88387b5a0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -47,6 +47,7 @@ properties:
           - qcom,sm8450-pdc
           - qcom,sm8550-pdc
           - qcom,sm8650-pdc
+          - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
       - const: qcom,pdc
 

---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241204-sm8750_master_pdc-275e5a003eec

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


