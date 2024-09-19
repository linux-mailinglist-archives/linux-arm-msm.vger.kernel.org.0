Return-Path: <linux-arm-msm+bounces-31994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39997C4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 09:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6982822B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 07:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61636194C8B;
	Thu, 19 Sep 2024 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="no/+XjaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DEC194AD5;
	Thu, 19 Sep 2024 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726731157; cv=none; b=TokYLoj4lFkFTxW2+WPhyPveRvMZs/EXGOdhNv5WAPA+pd7GAydWkeg/vV1B9xS/5HShNAaIgi2NxkVv6hycUq43O8Ffe3uYtnkDNPmMw3UjtpYaMr6i/7b57Neo5Hl/WdPjMOzcs9COvdsvxODEs559FOLI5q2S8kvEPWuJ0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726731157; c=relaxed/simple;
	bh=fTuLbwCpZMYE0rE2NjNmDQS8HrqTnHzpGmc+c/zd5mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l/t4GsBtgH44K1MZJJwOvjgVQ1bWXke5cyr/TFoPG2l77zItiR2URcNcxSVqB5Muxu2gGt8weMe42C42cJ/n5/hcwDtCJ/JsBoHYRAJUbmUgIirbOLdS/6AhizU96ckxi/fQpVUpuDA8UWR0BRk8MyhvKn9GbeF0/854qYyHHs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=no/+XjaH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IMifrV027840;
	Thu, 19 Sep 2024 07:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPvH3GSsV/v5gnBOkXejqJvAaOxuIqPZZDkTR0SldL4=; b=no/+XjaHNWzjPk/i
	+FKmLOPf59ySox51KqgWWQ7nCY6aeJDXf2kVpSRTcZOml079CVdVzeCe1UqCI3rc
	350wbuqKZYvvdQiwZdomAVCTGouziq3GcOVlK+GYLWHW6tAxKu0+p3yA6XGaO1YB
	yEZeG8pfdcToKkXWy2qBE+5ORcFTbvLG+DnVkLUzqUMdJ0hvcuknumF8ioLYsatI
	awfkgf85fVyMpFUrycNPyY1n6ytWMmJ0I4JRf5CXvJdsu9L99gKu//yxaHNkTcVg
	KJLzdlesRNa3tAdPjRrc6xy2lQ1y1VGc6fBQHuFyLHyt30QZyzjGT3sS3EZ9yK6e
	Bx5HUA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jevhs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 07:32:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J7WSO6011984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 07:32:28 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 00:32:24 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 19 Sep 2024 13:02:15 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240919-qcs615-clock-driver-v1-1-51c0cc92e3a2@quicinc.com>
References: <20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com>
In-Reply-To: <20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PtPIEqHMwT299RttU6JT3GLp1vrYeiSJ
X-Proofpoint-GUID: PtPIEqHMwT299RttU6JT3GLp1vrYeiSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=727 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409190046

Add bindings and update documentation for clock rpmh driver on QCS615
SoCs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c..58ed4a1aa727 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-rpmh-clk
+      - qcom,qcs615-rpmh-clk
       - qcom,sa8775p-rpmh-clk
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk

-- 
2.45.2


