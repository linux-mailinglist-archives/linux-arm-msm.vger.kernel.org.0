Return-Path: <linux-arm-msm+bounces-25687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFF92BDEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E856B2BF55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0842A19CD18;
	Tue,  9 Jul 2024 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PM4RsgVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A318FDBD;
	Tue,  9 Jul 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537535; cv=none; b=o2GCFX7OpEr6KEyXmxxvgzLWKDU32x+u/8EnmR5AT5WGW99qgqu3Nl4gXMf2qpul3HtyMtoHzbeofTtVlrvM9DcSd+KqW1jsl6z2bwuz6HiYBJXZ8xBFlm7V3qB9hK7oVBnUw/PzyaCmTLdapz4VxuFkVVu3OLkbv/tDwa+yIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537535; c=relaxed/simple;
	bh=XP9FQoEiY1PMvBceItTwxb7yJDOmRScik8HW4tJKoMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Day3MSC59oCh+8BzTLlS7vDlk9dWg+REpKzna0KhhCACu0EbKS6lUoQ9QxY1x4V69hPgBZK4ZaSgUD3M1u5nD8YAQmJaBjiaox45hCGR6JrCHctkNYJg/0kNKf3qSlanW2wPEDVS7A9diHqKB6u4mvCk6s4JSnwDsY7dfd5BWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PM4RsgVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BpAgn006130;
	Tue, 9 Jul 2024 15:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F56bbU4FAxbKIxHdSEWInjuA6bZTyrLhpH7ENSBE/5g=; b=PM4RsgVFogh/esNy
	d83koIFUqCXgr2F7teAqgLsxnHEX8LoAwEMlJ8A8rpoDiKmoetHrZJAHgNThl8UF
	G6Rtjz2HlM/CjNVAwMqgSBmm4y2xGm1j1xKLIW7KIK23kXSzCc6D69iBiYoJnOx8
	4XCaW6TbTWCZvkrri608WCAWSi3ehz4oN8wYmbkyfCAkM4zEVRk+KeIzQe6Wx1yX
	pu855T2cCtPqN3LHOp9eZau2HGtcr9syys2ZkgsgFo7IwD3ff8wnfTQJDBk8guAu
	PNZP34umTG/noD+ph3w5Llr9Bokmkh6pem42iTcf11K4+SiNW82A0zA6k4DnF84E
	fze+zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66qnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:05:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469F59Zi030543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:05:09 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:05:04 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:04:44 +0800
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Add QCS9100
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_llcc_compatible-v2-1-99d203616eed@quicinc.com>
References: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537501; l=1256;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=XP9FQoEiY1PMvBceItTwxb7yJDOmRScik8HW4tJKoMQ=;
 b=pluo/EgCQPcJHvm0pCBNu2SmNlhaTEFPgIBCAQdis+wWWk99QaTn66gwgLB8NiEZMcSlssvfT
 +DCR1sADjhBAJORLpkWfDR+UQ3t9oITpb1PfuGnoyOU2aNT7/uU3S1G
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 09LSOZGNslt8X5oHyrz2qxFs2I6fYEgm
X-Proofpoint-ORIG-GUID: 09LSOZGNslt8X5oHyrz2qxFs2I6fYEgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=806
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099

Add the cache controller compatible and register region descriptions for
QCS9100 platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-llcc" to describe non-SCMI
based LLCC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f..a38c8b99099e 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-llcc
+      - qcom,qcs9100-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
@@ -85,6 +86,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs9100-llcc
               - qcom,sa8775p-llcc
     then:
       properties:

-- 
2.25.1


