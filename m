Return-Path: <linux-arm-msm+bounces-30459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D1969395
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DB8284E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB521D461A;
	Tue,  3 Sep 2024 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQxA8XrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF7E1D1726;
	Tue,  3 Sep 2024 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344534; cv=none; b=cv/n49k927EHk9ZSBybcLgvsdPM0ud97dVVMMXiRx+YJEopkEPQdOu7upnWQ38IwaPGNOIUBYNaWuBeB1ZG1Xr+P+d+gix9XhowCYBa94Db5vL8WbXFD9G2dAnXfGi1EN5s1HsExA/K7+LDiox65UnheWkGKkxOSdA9PCWXNy8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344534; c=relaxed/simple;
	bh=3ZmTJf4af4mjm3K+ueESa1icZQLJOQp2HB3BpaR1um8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kHguJQ66zPHSLwzZ97B4IWni12PFj+I5b0DYSG06HWQxsd9oRzhNOTXRrRIvqzKP2WxwR3ls4/dT/3ZnlbquwNMqkhIJo9bej3sgitirl0DhV0GL++9vs/40KczkHdbIXc1Poj6Zk/VZHqCRok19BNludlxtKcFMLk3JwO3mdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQxA8XrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4830dPrm017528;
	Tue, 3 Sep 2024 06:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHhNiNdzqEJ4IIy1IrWvkgHwqek/h3PwT67oP++Beyw=; b=dQxA8XrSELB6Tnq9
	0gls9t/Y34GaYyfP4bCcEN20wpHhFWTb0q78C+A1TBrp8h/fE5tytSELXbZoYql9
	5+wm8LesKoJGXdn+YOMPI6eM5Jp2o4NTQOB1QDkXC+Nv+uwu2gg85bkRa0JQ/oW4
	Zr+QBlZSKN83AJQb1e9lSQm0nz3nVuaL6fDE3QF1gTLq8yrCv3so8pmth151OJyD
	Z4BY1qicXO6hLSiloWxvI7qaf53i/98hjZIo2D9qIwLF6EIwrtLIeZoDmMR4bzDD
	uwHokp7h0xxsy0/MGucLJf3CJ0jtrtaj0DHrNNVelnSPLx08p0VcxAgUmzBbIcuy
	yw61fQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxp9qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:21:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836LvZm015156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:21:57 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:21:54 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Sep 2024 14:21:30 +0800
Subject: [PATCH 2/4] dt-bindings: cache: qcom,llcc: Document the QCS8300
 LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240903-qcs8300_llcc_driver-v1-2-228659bdf067@quicinc.com>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725344509; l=950;
 i=quic_jingyw@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=3ZmTJf4af4mjm3K+ueESa1icZQLJOQp2HB3BpaR1um8=;
 b=SZDMzDnG32Om+UuQf4TM5Wm+mulSG44cItLzPy6Oist0mGl6LrXEBIhrGL2jPXMvvhhRoWgLe
 Fb6PnRfMGKABKXa+z7RaRJ+4+mImfFrFLM2EPdKE1CLHlmaw2rJMuzS
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=3tHAHZsIl3cClXtU9HGR1okpPOs9Xyy1M0jzHw6A/qs=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HolvcbetzWq1NW4-IVmdJHItj0ybbr2T
X-Proofpoint-ORIG-GUID: HolvcbetzWq1NW4-IVmdJHItj0ybbr2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=771 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030049

Document the Last Level Cache Controller on QCS8300 platform.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 03241b719c98..69d9bcc5614c 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
@@ -170,6 +171,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-llcc
               - qcom,sdm845-llcc
               - qcom,sm8150-llcc
               - qcom,sm8250-llcc

-- 
2.25.1


