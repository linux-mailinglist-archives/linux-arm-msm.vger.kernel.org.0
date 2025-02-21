Return-Path: <linux-arm-msm+bounces-48824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255CA3EF39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8891A1883074
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC6E20124E;
	Fri, 21 Feb 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="psktk0M5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97F200B99;
	Fri, 21 Feb 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740128091; cv=none; b=KTAKwLPm/7YJS3OKy3VigJj6ypHhqfsGGri6n4exAXZGPYEHf+TTLXM1RkwbIhgRDdws8Zx2EhDx4ZORh7d16r/pciwxopfjYznqZzOt2ADD9cZ+q9mLPnSW0FaGUcunIftRsQ98/GXhazFo6w4KARO9M9fhm+55GO55uZprOPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740128091; c=relaxed/simple;
	bh=KtMiSHce4lRjUTepH2etKp94BCq34faigpGqneDuHcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shTKRSZZs36FLIO5ywhIgKIrPg1i5lavZ7ffIPHdqtE7GR3zOw7Y3Nb/GpbkcuvLxbfxgaie/rcRN2DWUhDKKPW9P5OVrXQiNyjcY4wUJ52cdf6yBXwumtJ/5s7i/CN+BaqR6Y1pnu4vccws6IBhgGV+czrMcxerU/oiCpnkuqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=psktk0M5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L56ClB012255;
	Fri, 21 Feb 2025 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=snK73cHucFzq9FphM3O4awcD8yaZJ6wAMZ6
	VahdBckE=; b=psktk0M5cDq92WxkFH/tAXFaEV4PTjcpZSbOMpOYAqr72UlPYIx
	5Yigzd8hHnlu+bQPoazEVnqr+U0On9XDNEDv95LecNKogtrT9BBL9ytp2qItT0KN
	HPwCXkVTTNh5k84jfqfsydSnYxsLvgJL4YTpJpyVIEGmeqQocZFsuBmR9Z/bSzYt
	IgwjsJIwTHer0GPgBc3sbO9xTKQdXAsXH7ETYmkPzySjJHPSvqpe2uwTTmTVmr70
	JV00hAv7GIm1d6jpDQ/5DCo6SQp95LOJZTUe4zkXLlGB/f0Hlf0d3sKYSxmsy9aM
	FURVg7lyMbj0J9WsPxbTD8cLkAW6MkoqcZw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1s9xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 08:54:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8sggq002983;
	Fri, 21 Feb 2025 08:54:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44tm0mfmar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 08:54:42 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51L8sgYO002977;
	Fri, 21 Feb 2025 08:54:42 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 51L8sgX5002975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 08:54:42 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 77D7E4D4; Fri, 21 Feb 2025 14:24:41 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] dt-bindings: qcom: geni-se: Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml
Date: Fri, 21 Feb 2025 14:24:39 +0530
Message-Id: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6tjWtUfD2351y2LNYwKQmNu76TTt4OXD
X-Proofpoint-ORIG-GUID: 6tjWtUfD2351y2LNYwKQmNu76TTt4OXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=866 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210067

The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
(QUP) wrapper and the common entities required by QUP to run any Serial
Engine (SE) as I2C, SPI, UART, or I3C protocol.

Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
association with QUP (Qualcomm Universal Peripheral) and the compatible
string.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se-qup.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
rename to Documentation/devicetree/bindings/soc/qcom/qcom,geni-se-qup.yaml
index 7b031ef09669..26f806fd627a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se-qup.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
+$id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se-qup.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GENI Serial Engine QUP Wrapper Controller
-- 
2.34.1


