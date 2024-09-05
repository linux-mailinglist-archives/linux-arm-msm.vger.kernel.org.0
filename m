Return-Path: <linux-arm-msm+bounces-31008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C397296E204
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790DA1F22222
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F129E143759;
	Thu,  5 Sep 2024 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HAn9v7zF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A08821;
	Thu,  5 Sep 2024 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725561043; cv=none; b=ujGbOPjp8ESizaUpTnbxgnQs+meZlkuEZFlqbK3Pw/ERMPC6VJPpIoTXc/V5q8PrOCNH67O6LxSrNWXLQhLXN+vUZu5nbzIAgoaCi76ssBVpNrwzxVSxiZ2EeAbuGE/pHGdzfl/l5/WgL+CTtm7xuyGWjbbvaIw7msd4EVIU21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725561043; c=relaxed/simple;
	bh=fxHMu2N5hdVBD9qAE8xGbq8KqtZLqQr+bI/uKSVf7QE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q8v/BvDCl/MgUe9KxIlJMswF9bhigkoa9VdUV1USpfF2BxT2ryfuFe+hUsK7TThL+UKWCWttmQiq69ELcEb5JDMVY2SZRJia4j4YHXkDSID9wSIOv7L14dsC/IyiKLTCfY3hq1vCnpTrmQ2K0qUF2BR6B1teew2YIH9Amjle57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HAn9v7zF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ3FF021768;
	Thu, 5 Sep 2024 18:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cCAWQgpWPzQfAzsGmKl+nr
	m4pjFAtmkpOTeM2++UzCA=; b=HAn9v7zF61X4xOZQf8HT4VPnOhZ1Iq/8FEbUr/
	4SFnQLozxfInT3NJOEukduFstTzlZgMM2E46QCc0783GflYA+YZigeACefc8fRtI
	y7ZZCQqd5XXzsN8sS40tWj+C6FhTynDGW7J7+eZUm8YXFH756hd3KYmJnzl1XJN9
	XWcb2YXddLv9NNo0S6M7A2BXmUruWU1ipqCcC5OzV7vTImRRWqlXk0jjO7U/8mbz
	xqGnBX5Yk9Um/m+duWetvsmEbNXptd0rWY6OaOkZSvYpWy/8Xi0PXdJSVXSeQgD1
	Lrc1RxmF8jAJ5beNJwDBOG8K35wFhaIkZh393H0ZOyFVvX9A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu0095-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:30:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485IUXpQ013997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:30:33 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 11:30:29 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: firmware: qcom,scm: document support for SA8255p
Date: Thu, 5 Sep 2024 11:30:16 -0700
Message-ID: <20240905183016.3742735-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B7Dwgm8y67CDJY-3F_OGYC_qOGpoikYf
X-Proofpoint-ORIG-GUID: B7Dwgm8y67CDJY-3F_OGYC_qOGpoikYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_12,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409050137

Add a compatible for the SA8255p platform's Secure Channel Manager
firmware interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]

Changes in v2:
	- Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..65057f5c8972 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,scm-msm8998
           - qcom,scm-qcm2290
           - qcom,scm-qdu1000
+          - qcom,scm-sa8255p
           - qcom,scm-sa8775p
           - qcom,scm-sc7180
           - qcom,scm-sc7280
@@ -204,6 +205,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-sa8255p
                 - qcom,scm-sa8775p
     then:
       properties:
-- 
2.34.1


