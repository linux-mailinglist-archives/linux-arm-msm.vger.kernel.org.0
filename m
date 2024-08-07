Return-Path: <linux-arm-msm+bounces-28114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63E94AFD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4C92821FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 18:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C45F1419A1;
	Wed,  7 Aug 2024 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E/IVeeMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB613CA95;
	Wed,  7 Aug 2024 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055563; cv=none; b=PhNMgK12VtovUpy11guN6KVpUyrr/0ii+wwmHe3NBADPdxzjjElpM0itVk0L2/DvY8AkKO0iLvVtKNpNPeVwhjjH5bmk/YCciy3YWrdRLiWi4xmETPx7qLXSRffG1nv29m+grV83YYTdKni49SSN9RUvcby6JRsWEjxGwsLHtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055563; c=relaxed/simple;
	bh=HXAY37wpyh1ReUpRG1dqEfthPUubDUXpqjJW0qK773I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=os906DMAarjqCuvHGYL03w1t5P6NZ9vzYEF2Ut3n91Ing+kTR6myxPJznzTlj+ZhFIjQWLtVSk8Y8xi715moRWM+6FDoFgPwlN1R11FeKCJYrq/lVBQw+8qSjhL5SQteZy284uFQm5EMAxtMQKdYAGyldRlDD55SeWn/XfUXS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E/IVeeMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477I24rp015930;
	Wed, 7 Aug 2024 18:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHs8ShozR0PLyH3XbHdHRQ8WaBm0nJNP4sgraZIO5Rc=; b=E/IVeeMcbizl3CbD
	CshY2j0kcwnCbNtFv0c3ICRvsu3CGqHDPG19epPBGeauB2LJ46D5C0Z/TvZzBUvC
	e8yI9/1fdqnXEmxYLrCXz8nJEBJ4KiEc+gA1bwBMDsW8mGidb/QqgZU70bdC9ldz
	5khmM4QFVKidcy7XZwvcQ/B0LK6UmbCPvRUmXGEsGgzrc6o/oTtLWc5IacSQGAOu
	snmg2ZUeYmCcmoQZYki24RJt/1SWmkNBlt8weh3242CUl6lCLB0HFCRaIGUctrBX
	UXu8ZSbf/GpL7Kvs4pB5GvcTvFhhKEdcWwuBSbRLUUi2e0zflGU5926ql+mawbV4
	DCSnzw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vdupg25w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 18:32:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477IWbga020944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 18:32:37 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 11:32:36 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible strings for eud
Date: Wed, 7 Aug 2024 11:32:02 -0700
Message-ID: <20240807183205.803847-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807183205.803847-1-quic_molvera@quicinc.com>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
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
X-Proofpoint-ORIG-GUID: RTQ5svxgQnS2Ahwco3fwoLPPel1JGzn8
X-Proofpoint-GUID: RTQ5svxgQnS2Ahwco3fwoLPPel1JGzn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=736 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408070129

The EUD can more accurately be divided into two types; a secure type
which requires that certain registers be updated via scm call and a
nonsecure type which must access registers nonsecurely. Thus, change
the compatible strings to reflect secure and nonsecure eud usage.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..476f92768610 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,8 +17,8 @@ properties:
   compatible:
     items:
       - enum:
-          - qcom,sc7280-eud
-      - const: qcom,eud
+          - qcom,secure-eud
+          - qcom,eud
 
   reg:
     items:
@@ -55,7 +55,7 @@ additionalProperties: false
 examples:
   - |
     eud@88e0000 {
-           compatible = "qcom,sc7280-eud", "qcom,eud";
+           compatible = "qcom,eud";
            reg = <0x88e0000 0x2000>,
                  <0x88e2000 0x1000>;
 
-- 
2.45.2


