Return-Path: <linux-arm-msm+bounces-27440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21119422C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38691C21DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFEF1917EB;
	Tue, 30 Jul 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poj6jI4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33A190051;
	Tue, 30 Jul 2024 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378290; cv=none; b=cY+yyYz83Z5iKp6rt3KPbS0A/P3IfhUWb2eDB+bZ+4vQwa4fgXXW+oW1Ydt9hYdhBNdG7e/GC1A8DuaDYPsuuDbXbuFeSsXtfadCbvyn7rAMlyqUpd62iim8W/1b42BPJ8iduSj81Ccz12S8zraOlJPlYef4h+M7hZoZPgLVs1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378290; c=relaxed/simple;
	bh=oQAfwHCHHOVhJ5D5IJ5I/0AuRBYBQtkUMa4Mtzibu8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lGFLHn0wSxLrgvQRK5SkLnFnkER/lgxJVfiZJ9hZLCUETzOxFWh+WNqVRs3at4GyNX442Dva7aG5x8H4vDTyeF43b8IXjSFysGRrI5D+pYpgY91npV0sVcr0R1S/3GjQoafygbrvexrVrDOIuGrrb/Sb/RYFNy4Qm4SmQB+z+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poj6jI4C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UH0d3H031664;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=OrJLyX/yyLxz1RJk4qCWauetKvoaHHn0EfGsoxZ+jU4=; b=po
	j6jI4CSVpG+rhaJrgSNYryecDaQWIB5xzyM87T74lJjuczlxsXUCWnq0y0La5giE
	x5VUHeBYIzJYDMZtluuDW1k/3MYDbhtJEaz/dpnXTTaO8FC1ITdnTz7xaOjG5h0m
	s04LCjtph/Loy8YJpLqNrIjkwWGsWhSpQFISNwusE2ZYzkngjbenk1PeJAe+uPi7
	DbJEiq8HUGd5gSnqQyX9WlvCJzaAdgjadVzwaoDg6Ig/9D8aM9XaxSaTW3HMHg4C
	CmJIzTG9imIPYPNAWn8Gvy5t/f1x1k+yhazzw74uuw6DDE4jyn0lXaJMwhDtuDBS
	5jI4WTf2o5OSH/qW+g/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96s6v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMO8Zm000584;
	Tue, 30 Jul 2024 22:24:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 40petpw351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMKxoZ029327;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 46UMOf6m003283;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id AC75750018E; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 2/8] dt-bindings: soc: qcom: eud: Add usb role switch property
Date: Tue, 30 Jul 2024 15:24:33 -0700
Message-Id: <20240730222439.3469-3-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7j6_I92iAjPZovQmsHAq9SNpnP7zWl8p
X-Proofpoint-GUID: 7j6_I92iAjPZovQmsHAq9SNpnP7zWl8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=961 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

EUD hub is physically present in between the USB connector and the
USB controller. So the role switch notifications originating from
the connector should route through EUD. Hence to interpret the usb
role assigned by the connector, role switch property is needed.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index fca5b608ec63..0fa4608568d0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -37,6 +37,10 @@ properties:
     items:
       - const: usb2-phy
 
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
-- 
2.17.1


