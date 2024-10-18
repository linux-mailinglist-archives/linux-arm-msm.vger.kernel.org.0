Return-Path: <linux-arm-msm+bounces-34894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0709A3743
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE32C1C20848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553F18BC3B;
	Fri, 18 Oct 2024 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SJKEODKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99531189F30;
	Fri, 18 Oct 2024 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236870; cv=none; b=bJfm4iaaiTy9OHGUrzB2KJRyvEhNGnEceJUJB9hfe+5KgebMEImFtCwSsec174RgqMUKo2+QgyD9kuaCgrhTS6N7GG/neq0veRIt9GbZoj55du6aAYS9zgFRdotJ84tmBmRRgirYvIbLOeqGIxyETckhoilO4z5sRgPgX3y/3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236870; c=relaxed/simple;
	bh=Z6FkbQFv/JPhXbnRg503OEg2oDvGrA5GgTrSjI99dR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p01G7VtfUKvYS3Buaj24g9gSIu3KjNaqfPg4ZbSz3gtIEkMHo7G4Hkx4cwKnX8I4qdVqolbmsXdnPqeGy0nq9AUrlGEd5AuX9o+jVcE8sP0BiuMrOkbgNA+xl48UyJCB4+KMbuQYwAIgjDU+KqGnvIcI0vmFt7usv9BSwK5YS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SJKEODKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I3nxUT004533;
	Fri, 18 Oct 2024 07:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eRzFHZIhIhl
	6ahasrzL7Jfiq57JJSMIIaqR80Wu2HxE=; b=SJKEODKTG5aPFNHOCH0nEdC9nwn
	3FggnIJ2Ga1YGlGwvvk+1ZOUIiV0As6iIgtTlURZDB7C5t2ixmsvhor0RTbrjmrk
	rZc8tkTOiUKeZ6jGx+njQ6joI51aNoESyS7QXuqqe9EbhN+wFb04Z5FhzI6Iu+DN
	WGwHNe8HrurOCtfHSLYWcueD7Aeejzf9t+8UiWWhmX7cQTbpMeoQ/O+mvt/YDIBT
	IkpaFPOH3GXWjasNxQimZ8N+9hHFWgnlY3sK+754Rv1JVdosknLz6ekGpLY1mxjB
	b4G72LyC1pXb+m49DfYrVVZ1EdDTxdfXyJjiSDA7I7Jjt5Xv+7wfQEox2Tw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc46ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:24 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I7YLYs023253;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6m4a42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I7YLAf023244;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49I7YKUh023238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 47B8C21BA3; Fri, 18 Oct 2024 15:34:19 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, Kyle Deng <quic_chunkaid@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global: Document the qcs615 APSS
Date: Fri, 18 Oct 2024 15:34:15 +0800
Message-Id: <20241018073417.2338864-2-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-GUID: MrEKjkKadb83nflqZEr-TFU5141catK-
X-Proofpoint-ORIG-GUID: MrEKjkKadb83nflqZEr-TFU5141catK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180047

Add compatible for the Qualcomm qcs615 mailbox block.
QCS615 mailbox is compatible with SDM845 use fallback for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 982c741e6225..54deb5740d66 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -44,6 +44,7 @@ properties:
           - const: qcom,msm8994-apcs-kpss-global
       - items:
           - enum:
+              - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
               - qcom,sm8150-apss-shared
-- 
2.34.1


