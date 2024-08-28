Return-Path: <linux-arm-msm+bounces-29696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF95961BB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9532855A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C112CD8B;
	Wed, 28 Aug 2024 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OJ37bsPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E332C8B;
	Wed, 28 Aug 2024 02:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810574; cv=none; b=Bl33hJ2b5cx154GIo1JZQppVw8wGpcXU9ZsEZvnG+XLVDF+V6VvE9zQXtsw8WT5GI4vfEFNnUkBMRsXYJU8vgyNvTOcTaeUVKFSnSmJRlSs44SqZ7OquKoFW0iycsRSNo/4NPX1Wnw7O1KsOGA6wSp6lRwUnJA4W0KVfTYY2U60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810574; c=relaxed/simple;
	bh=Xb20JuA8vDOMmnWNE/CYb0aZ2LdbrtBAcOTHv4u4R0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pCMYA3lhE5FJeirE33lNfgGSJl5vq7Y4bTmc8tKdYx6Jg58sOKbxq223Do75u4tK3uViKiTPYDvKUzhKZpv9IZW9wElY+F6QlBT+9FsFbKVjH796Z2L0EtSJ4UEWM43Sol8mWxd0wG9jRLQVLMJiTSRyB4M2YS+DVu1gkkL35EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OJ37bsPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLb2S8005522;
	Wed, 28 Aug 2024 02:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OeAWIL9y+SK0Md5Y+CLndTL0Z+g9urBV9yS/yjdWNeM=; b=OJ37bsPanOUkLmtr
	5PS7Fy5jwlyinHg/iJuEnTQVGG9omF0ZWnDfhgefDB6hc3AOj7IRr3piUQ9vcVKl
	iySyJeYR7cwP/qegFBVWITIMIbVegA0c7NzS+52+fMjBkeGa08s0lY79WSJKZTAo
	sSabFxsoD64DiuthxhkJeez+T2tRnugQIdVcePBiZzMz7dpVIQAlw5d3Q1Vomhgm
	n5QRTMskwbgL/0Epokt5ZHXCX/4SffDOunAUjcikxWDDZDHb2+0nFfi/WNLeJkik
	rKPVHAppxD+efPKjHQcXc3Ue+CIu3fSwv1J/pIAqqjvmRP3ecoE2HcmU/ChfNcL3
	mucnCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puu8dd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22cI0024348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:38 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:33 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:11 +0800
Subject: [PATCH 1/6] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-1-5599869ea10f@quicinc.com>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=804;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Xb20JuA8vDOMmnWNE/CYb0aZ2LdbrtBAcOTHv4u4R0U=;
 b=C/WNF0da5NJeAKzeW51koN3ROSgDXPAhn0jDTqG3WDOBHXUs22METbNJzs9p1VPm3QTZn/beV
 GKG6Smrss2yCfve9dP5ZDFiCAmqqkuDox4Om5lXfRK02No/NaoHbDDH
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sJ-a4FmyJHiXg_fiJxQC3LuLcV-iwLTm
X-Proofpoint-ORIG-GUID: sJ-a4FmyJHiXg_fiJxQC3LuLcV-iwLTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=674 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add a compatible for the Power Domain Controller on QCS615 platforms.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..5e234e845cb8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc

-- 
2.46.0


