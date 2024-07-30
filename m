Return-Path: <linux-arm-msm+bounces-27444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C976C9422D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A771F2523F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007D4195B27;
	Tue, 30 Jul 2024 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P/GNvv4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3901917C0;
	Tue, 30 Jul 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378291; cv=none; b=PYQ8Ns2uCe0bPH7PUvIrTLavtIidXt6NzCHiiujWjiO85i5NuZ2mEK58irttxw7Zp07rWFWK6ZRpLhov/de+RWmE0sPzymwSF0aHhxRhUrWMxjwgUxO1M+ufvLeVBYt43o9rAYMeBYM+IntIOzvjBcTEFczhsevJRLIyOeVFlss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378291; c=relaxed/simple;
	bh=AZr5ffaDneF15uoVixPL4LtPJAuTDH/1PKm6kQitv8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=f+daEOS3W4FyhaeOfifPz5GQ8+nSThIWy5Nq0scMir71iNfnaYzx0tCuOjB/ImNuA6IAJCZ99+G0chKfkm369OPtgUVQjrlQ/OF6JNaNjbYLSUVWo2CrqHcjgTHKCnHuV6l0TCgd9Hpl0fQns5/bJHon+6PDkyJF3DNpmdYRDSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P/GNvv4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGBWMr030779;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=hPn61MAodLvVLWgRo5fQExHIT5Eu+jew71DK288gyfw=; b=P/
	GNvv4ZUy4SF91LeezTqCSkn0mZrUccP9bR7rDS8vzBrE88xhpCIFcgdo5oS4PHtK
	j9iwecgPnqUxlAJeANGonXQe5K43fTxIVSZ10IqJgmXmuSwFVT5Xg0tBe/Erb9EQ
	+cg2caQFPdJdWjw09D5RLNsgqNb38YA8bmGpEDA5HIr7hByZXt+qmclh2OKPs4Ib
	nXAA9oMiAoeBZ+ZAGfEq08aomXtTETsKK0TtEnjKJIvENQ74Z0pIRAt2a+tkwpDJ
	pX3lDjCasuP6ahlWpsO4TfPM87+4yU4te/sfdM0je1GLTeJWLyML2Khsz4XCgzhB
	uLZ/ksn3lkntjwCFeJhA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mryu15qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMHGvm013207;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 40pfs7cjpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMOgxK024854;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 46UMOfB6024849;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id AF50A500195; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 3/8] dt-bindings: soc: qcom: eud: Add compatible for sm8450
Date: Tue, 30 Jul 2024 15:24:34 -0700
Message-Id: <20240730222439.3469-4-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TpmezGlfMmT-XTjapIxcOENtTIPlcrk9
X-Proofpoint-GUID: TpmezGlfMmT-XTjapIxcOENtTIPlcrk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=819
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Document the EUD compatible for sm8450 SoC.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 0fa4608568d0..d7a913bd5edb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8450-eud
       - const: qcom,eud
 
   reg:
-- 
2.17.1


