Return-Path: <linux-arm-msm+bounces-56034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6933AA042F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA461A850A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C38527510D;
	Tue, 29 Apr 2025 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I1XQ9n0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467C7494;
	Tue, 29 Apr 2025 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911147; cv=none; b=UqjRxA2JPTwbI+tS9sbrr93ljbX23SGyO8cODJZFfe6FCR5saFkuaSGBNcsdaLwZ3dV99KhEgBu8ksFTwoGnL7ztQ7MxKvSrzwKCObrn3Upoti4pgmgcdkZXXU0zSi3oKtNgWbwXPUAEen8/ooYdKKDkbhiIlnkSCuC6QgVG9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911147; c=relaxed/simple;
	bh=vHxUBM/7su46OU5rwX5Nb+kggJsfgjyPjrcIlzCErgY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6nBtp107PxHUyUH2jPsqu/OFpvjI9uDn3Gco4enlzep+B2khnGVarMJeU5GLwXNkXwbzVUmVy/kn82J658Crw2nUpZXHWpHuZhgq1GyflR7Rtkhqq93SIDzK0Jj5i1H3pbd2z0/JwSjsEdom65y0jtvX2d6u4l+tMUBrTuBRb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I1XQ9n0d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq1V8011775;
	Tue, 29 Apr 2025 07:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGfDnt2RpSVk3eRpNWO+uLZHNJaM/FjckCS92PZo3/c=; b=I1XQ9n0dGMbJZxiL
	tca5Q2GQFS4JshLCDQlcnAqq2txhb8x797ti5JMcZ8K4F+G81vRJxsjBr2rppA77
	h4paACl25baiUliPACfbw5ZkvM483/bYYyoh8E3SjG/7CWPAD0i6BLNnF2YQSa/X
	D2raNlZNgjMStRJGzJKvJWo3P6ebMayg/C4vmEvuOEDs7tMtkSXEPl+sldpP+TBD
	UKotgA9+4EOJSe69Se3Or6tji/3eWUoa4Jc38Q+UduA3EHQ7e6sEfIU8StigBdnB
	rv4gO91rX5wnzpRJGaKmrrQ0CB3hekRX02aQhvkNsRPck0DcwqdmKSDakGH930E1
	SgkF8g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9bnut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T7IrNq021988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:53 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 00:18:52 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Date: Tue, 29 Apr 2025 00:18:40 -0700
Message-ID: <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=68107d5e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dfIf10x7IYRJwkeVStEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Wwcdzx4he_werBQBzcyrClQ6eQJvrhdv
X-Proofpoint-GUID: Wwcdzx4he_werBQBzcyrClQ6eQJvrhdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1NCBTYWx0ZWRfX/pBjtR70BqhT 9sEFTed6xo7CfRyXJTZBHBnBEmmfCSROqCw1VBa9SAWjdGH1vFfgjG/TsjUbQn73H65oD2ZamLZ eZvRDCM6kBrAy4W7lRl/CYCvJ0hFFbk9z5Y/1ONU8rusyfEPH+1+EWHh1Mz8tno0lZLnfo5iLhQ
 2C2pN33V7rm4+EzB4SjP00l/ymxHrCoyRiNF2TeeExeL3e2+3z1Fz9biXQnuNONbqAu0oa49lN2 RJyQ1D14IOU4VOX01iXP5rPNfWDIQ7zMWAXdNirTKf0NZRiXDkFsdTu/sBoTkMhZLEJksCm3PEc g7q8uO04cxpIRQX3a55efGrBtfnIugEzNHebD5Xpf3qgUla0Y97x18kLr7CM/9EbbLNIZS5Jyp5
 E7jbnjkAuD8pQHw7DNpnSuWx1l9oXa4ak4nQpYWfRhMMIyxjByXhodWhsk4kjD4caEE4fAYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=846 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290054

Add Qualcomm extended CTI support in CTI binding file. Qualcomm
extended CTI supports up to 128 triggers.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..1aa27461f5bc 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -84,7 +84,9 @@ properties:
           - const: arm,coresight-cti
           - const: arm,primecell
       - items:
-          - const: arm,coresight-cti-v8-arch
+          - enum:
+              - arm,coresight-cti-v8-arch
+              - qcom,coresight-cti-extended
           - const: arm,coresight-cti
           - const: arm,primecell
 
-- 
2.25.1


