Return-Path: <linux-arm-msm+bounces-31459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF4974C0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91BBB1F22894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A3C14EC7D;
	Wed, 11 Sep 2024 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o4wOUnpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F114D456;
	Wed, 11 Sep 2024 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041841; cv=none; b=e6aQiFuOz/le3NMxAyEGaB8+/GYodfpNVtAJDPamsM9JPmhDy8lFLBUHVTN42LzRxNysDz2PIZhjBsXx9vg7pl7OxLvRXeN+y0PnwRf0FlV2/xuisRYPSkMdWhtUtPKoxbhrUOCH3zGKSdPUeI5g98jvk89C+qhmOm3jbcKn1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041841; c=relaxed/simple;
	bh=EcJjNZDCH2OLT7ulyfVd2+3RgHqZJGJTlyG4BhEbLzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KL0GFHcNDcUwaTM/zmpVFfYZNv858cJML01zqhVfDP/W57Ojnn3oWX4UwPDayuR2uPtCIVMc4H23BeB4IqSQxUPgTcyXCo5c/gH8OyvYxzJXJ6YszE/mn52b3mapy4g+sGrmAT5XwY7LXdShwTh1Eloyg7M6MOxThv4jaScJyvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o4wOUnpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3UXFv020599;
	Wed, 11 Sep 2024 08:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVznHm3y4WAKUPHegX0d2LTO0tO9lxV79YVD5cCgs9w=; b=o4wOUnpHHbnOGUXY
	kWdhl/igXU76D6bIEsk+JX8AlbPWHxghDtCUVFN7n4AH3yVmBpIMpdFtHCq+DXyO
	olLDzge1YqrP7+ICShoYvWHcUlYVd9Ig9/Q2fIHAJP4EanAI4MKXshsZIjHERwVL
	fi5jjaOoldvVUzBjnTD9ejixHwP9z4cZHmal8w++9kgFxn5yLrmIw6UF2/sOoZOr
	45iwkhHjjjh2NmrvfsMusetoP/S6khshSIp/pBBOjxgqBo36U3YzQkL37aE8YrwA
	vKvVgIhQ6Oj+RP287qxe4Q9jvks9hJTgMGk/EeIWATsGC5+99bBZqyIjJp0Lo09g
	dlu/8g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e01c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B83jO0032276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:45 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 01:03:41 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 11 Sep 2024 16:03:15 +0800
Subject: [PATCH v2 1/4] dt-bindings: qcom,pdc: document QCS8300 Power
 Domain Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
In-Reply-To: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726041816; l=943;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=EcJjNZDCH2OLT7ulyfVd2+3RgHqZJGJTlyG4BhEbLzk=;
 b=xpBkMqmz0u7igyJ7q7t/DxVj6ZEgVhkt1OJKozGmtwgLrNJ27o6LPFJJfUF0XcRs3hRjLBpwg
 OAJnSzF580lALiPgrr8/3ySwcnYPZOh2P3FBNH+nu6yqKq3duGljXuk
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1746JJMzA8g0ha5EDruQDGWvLnbHGOoG
X-Proofpoint-GUID: 1746JJMzA8g0ha5EDruQDGWvLnbHGOoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=624 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110060

Document Power Domain Controller for Qualcomm QCS8300. PDC is included
in QCS8300 SoC. This controller acts as an interrupt controller, enabling
the detection of interrupts when the GIC is non-operational.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..acd6341e9f90 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc

-- 
2.25.1


