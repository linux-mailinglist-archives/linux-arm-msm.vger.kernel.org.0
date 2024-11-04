Return-Path: <linux-arm-msm+bounces-36892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68049BAF42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6024DB20B44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762691AF0C7;
	Mon,  4 Nov 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dY/hzezf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF671ADFF6;
	Mon,  4 Nov 2024 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711458; cv=none; b=dE6cZpVgijhqoTRpakVexprN0GUylRYlJIlaQt/uM0B5/aVIqX9IK8UwWzFDE1GwjlpqWKGbbDXVhJRkLibkEQ3Ci3wOQ0qkCvoeBlT2rpil4srw1EamVyOSz7My0Tm0CDsGSST21TBSLY3AGwV2/RPeODhDANTMseyawo2nKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711458; c=relaxed/simple;
	bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qpgctM2im2piEWZDdJX56PdPINl9yVF+spIu+p7UqICKV3Bp7TC2RWbaJkJ4GzeZsDR+zd29FwHYvR2xrZVcFKKrbSswZhLyfV6F3YHo0XSVjLcMKkKacWWTh9JEZY2T/gPUBSbvpIdgtxHpFcJ6KodPi1LUIBSmD34XF6UsK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dY/hzezf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3LRwl8019485;
	Mon, 4 Nov 2024 09:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zY6WwSnWBK+sJbMEG9WnEhZquIYMOfDGtRU22+UrV6w=; b=dY/hzezfoGfjPOpj
	eECoPqTs3cEVN1QmcJT4vYeoF7eWKq/PK15ScMdg6TR2orMXu1TlVWILVCPI/ccu
	TY4V7fNdGL7DZP4Ktb8SoualgVzwmXRdPJGF3sqZwRwJBhVje31aE5Zi9lYKv5vs
	JhhgSRnB7yK+lryYZi4vvAHmGDJqNRWLcJcaeYxwhIeGyBXDQXqMcqtePd8UdSZE
	CCmdSvXK/B8hxKfxGmMWQGRsSwddxyZjlpie/YZhaAlwp1dM3wH96QaRZrOp8UWz
	EQxXpK84I4qrnZfQ7caZ7ATJeI6Th6vLjwioedianXF+nuEasOwkTllaTmHFxY83
	LzMl7A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11umht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49Aakr022322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:36 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:30 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:09 +0800
Subject: [PATCH v5 2/5] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=871;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
 b=g7nFHEm47uNAEqE10bJFTwWVt8wSW9DRVjVPxXY7rI92zn3yeb9PH7mbaRyOt9Li5xwrOME7R
 CZEXBs8tqgcDaehzl8hJZfq6Q52vzWiPmkGbwraxllfvumjXjWdpTMm
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DInw8SBv3YmR9wUKPOy6ve_lI9PC9jHk
X-Proofpoint-ORIG-GUID: DInw8SBv3YmR9wUKPOy6ve_lI9PC9jHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=810
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0..ac7ccd989441 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc

-- 
2.46.0


