Return-Path: <linux-arm-msm+bounces-35301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398B9A93D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 218A6B22DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEEC20721E;
	Mon, 21 Oct 2024 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mMYPnC2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D387205E21;
	Mon, 21 Oct 2024 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551886; cv=none; b=LHre44YtNUgz9omZOfM9zaM4mqd+3gYOEfEpVJKSs+4HIBy4iJcmefq3ealYvKmd+k1KsmIwGJ7DZ9JmPX6xHZEmBFFZIKdZb/ZVNNR8Y7w2sr9/L2ZKUW2YrnSr2nS1xD+3C/gcHrGz+0PtkMddp9Hc1wM2EW0hYxLtgEjUbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551886; c=relaxed/simple;
	bh=qKi7/YFXrn5PnfpxCI3baIb2sUgR5xU6866E350uYyE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuM5WQp0/Iqvbj2Fwv/GhgaZ8l3T9qlrtYcugdfaFxTBIYs0DzQYbMJV/iipPjXGSRdyK+rFer6UxTIcPFsMyPo/wc8SA57oSfLAa8TGopzs0+2uh4MSKQYFheOswE+zb6YMMpUvFG/KHyqF84OOthmWtI2zK4CseR5p/GwGQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mMYPnC2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LIE6pH001055;
	Mon, 21 Oct 2024 23:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ILQqeaBgMTs3fWpG5iSP2X
	PzLugmrwETcxlwBPRhcqA=; b=mMYPnC2B142xY7TbbLUHCQmNjmcwQy45lpGv2E
	a7nsEiLP893hmwMeclO2HJLetOncWge4WtFtQ6czbUvl7P/c9UPLZdpr04VqrDiK
	J/jkfqaBuHVAmxdMfFLKGlFOh9TBhzC7IgteVsZpkfhV1SQoBXMjeqzHtnkCHZrr
	6mkhLvGoCa9g4EZuMVVjMTP7oIT548PS/NKzvavTBB/Cp/+QurD3ZgoQfXmFSyaB
	Qcf/n4zfUqryx8xaRuftI+UTQwTavFThDAkJMB7YNQC/DgIySI+hGxLXzzRL9BRa
	NgpMUQ28aFl8YIgXYJ6M2bCfkH2FVS6LZlyfXsDL/RyRiYVg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj126nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LN4dwx028047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:04:39 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Marko
	<robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        "Trilok
 Soni" <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document sm8750 SCM
Date: Mon, 21 Oct 2024 16:04:27 -0700
Message-ID: <20241021230427.2632466-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3BtBD-gwNxymhirGItsZJ-hGJlRNzf43
X-Proofpoint-ORIG-GUID: 3BtBD-gwNxymhirGItsZJ-hGJlRNzf43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210163

Document the scm compatible for sm8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..d2c5e3f87cab 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -64,6 +64,7 @@ properties:
           - qcom,scm-sm8450
           - qcom,scm-sm8550
           - qcom,scm-sm8650
+          - qcom,scm-sm8750
           - qcom,scm-qcs404
           - qcom,scm-x1e80100
       - const: qcom,scm
@@ -195,6 +196,7 @@ allOf:
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650
+                - qcom,scm-sm8750
     then:
       properties:
         interrupts: false

base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.46.1


