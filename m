Return-Path: <linux-arm-msm+bounces-89103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E2D22980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48F41308C8C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA842DE70B;
	Thu, 15 Jan 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8kqZTw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1qxB4Cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA442DC781
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459389; cv=none; b=O93jEvyAk/nKFUZjy9Y8VMTkg8StILGPa8r9nBVbdK6zSO+CWKMy/V10hljr0/NV3nR8JWrSddr2BfvYuYM9Zes7T7R8vGdocbAZ2XQav4E8WtG5I2MA3ZLCMDuGy9JFQmkQhLgrHJ09vvC1xS6DZhQK2qY7IKICQgIyJxb67O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459389; c=relaxed/simple;
	bh=cuUwUuj4xccTZJ0uZTOAJPjw+SrCAbNU0A1nzSPt3rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NG2EicHElpCahEl/xA/ey6qYw+hGd8m2SWWfbN1umc0GJaDzW15YnL5qgw8r7Y5Lic+nevAAtfJTflLlCt00LmyIPKc5Q80Xy2/dcFZcNAv1sit/gJL8fwDF4bymmxjz3gmpftb/l/9ZRizCkMkT4LpiCH6kTW6HJtWZ5qyZ5Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8kqZTw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1qxB4Cf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g5261692832
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=; b=U8kqZTw7MWyB6yc3
	+i6MAuRpHEkLEiDTyhqlyPwKfkuposT1nweB2xsrYqXMSUEER5qrlzehpR+wepqK
	5dwkeK3hakhnlvFWPEN9dZuEtSk1ErGjQTMsqScW9mAnPI6uDPdYxdnUhUB2MPXk
	+lD5DHeL3ZYXuOlo51T2Vl49gY95MlxAwOHad4RcTnuM6SEwRBSDOGAupFmV5Zu2
	7sOPHs6YVFLtGiXW1t/wgHfX/DhzgnaF3ypVznwsnMuCcl4mcpQ781tZ/p1jcITb
	8I6rATosk9BKUt6gm7aGVHzwgAlsvQhnvJSFRqnZA2w68O9Dki5Wie49wsN+bG7S
	XBQEdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931kkkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b062c1aa44so2032111eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459387; x=1769064187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=;
        b=X1qxB4CfvSIS+qQtrpghwZgyzC2RPQjc5U+kCfpqHLtzYdo6hK6+61kkvwDZW2sKnO
         HVmw47Ch+DO8gng+SI88Hjct54/6eh0KYAKNqsGA3qch+Jo0mvH5XwPzFWQ5n8tu6jV4
         1LzmWHs/9Yv3RKzYTIGjR+GbSoguQVjJU24HYTNDBo6gglVC2f++RfHXSuP96bPYDxqo
         QIkwuMohB8vqlV1ztFXaPcrGjx4cUf5PygbFjiGo9auojbCze/8OJeU41n9LK+vOuNFT
         IO07h6wHiJe0S1RfJHuCtOufA3bFhBxwrF4loYY2rVsJXYin0dIKNO+gnaNDIdsJNrVn
         O6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459387; x=1769064187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=;
        b=aYimnWvuydKz+0gwDDDj9ACvGmHXjisDOVUFJNhrynlR8VJKblnGLuF8f4W9O00/rP
         K+wj6Z920hNCjy5uBWK9cJwrwkwbse8bIkF2Z+U9iANrkGJuVhPW4nU/U+JKFF2vu7St
         t2odU+GHsXg6n3GbrJQUExc+qxrG/CwDUHnK0PR3qXrXvKx7vDsPWaThXbhLma4WDAZE
         ePH4ZsUEmLCP6cQ+CdL4ZEBe8UVdEgg2a3CtZ7TP+DS1UhrjDirmbHLHYIx1KBcSeOuB
         GLm7h1d4ntzSVajDLSzMsTMFtuRfkY750DfeQwULJ+S0ODo3JUl8U133HOQhyQUCwlV7
         EPsA==
X-Forwarded-Encrypted: i=1; AJvYcCWCc7DUaSeougZQAjf1kmqsFQAfIswCPTZSJDxH31DzubrhfYvFlQCJ8YP9n4zc851yHvbIpnz85Lt1DWB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yymbb5SuzDr8FAG9v/jiDWaSeOEKnSRCuYqpX8Kad3K9gK3C/It
	BtH9wM+KVP9e4Mqn9D2L/scDDlhQWOpTaILh2pju1QARX9/g+rSVBDDBJPH74Wijw+6x1JdGyLh
	8P6LkatMrPHVlkfVq5g0yz+NeFPrlydat5rhBxV7Nx94crDePZ2uQJLqyOKUsrHksnW0a
X-Gm-Gg: AY/fxX67Zqi22ge8Ya4s57DYrqkNSkZ6kb4VQ90ivvTi7wWR0GahkDWWzTp8er1Nj7g
	P22pu8M7/Uvkndk/AiyZYJYGZd0XckZpkHKDZX26CciVMaTmKrB5qiVXq560Bk9ZP8u00syRLk8
	znL1NQepxeN373WHhQ9cOJPiCCGUOq7vo0QX0Hw51tIkV9HQyMedJRopfhFyf7JsZs8tuHEyuqM
	GFszBBJ6z/HRVx+QEOltaH53zKZ50GeYmCw6EhWxXD7FwJG2BNvwpJELzlhwciSuW0oh08W5eZD
	XJgmrXtDl5XksAeSndmZW9y5wH41QbWBGIzVqZ60SGDs2Di7zfEp4KqVSxuRc7fuRowP7gALmB0
	hYtbWJgWpWLPleMiXPLxf/bP6/A4dor8kARNzOVaXM/l5xeONCkmW6k8SmJxX
X-Received: by 2002:a05:7300:dc10:b0:2ac:1b61:ae1 with SMTP id 5a478bee46e88-2b486f683bemr6989514eec.26.1768459386775;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a05:7300:dc10:b0:2ac:1b61:ae1 with SMTP id 5a478bee46e88-2b486f683bemr6989483eec.26.1768459386304;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18986471eec.29.2026.01.14.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:42:56 -0800
Subject: [PATCH v4 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-remoteproc-v4-2-fcf0b04d01af@oss.qualcomm.com>
References: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
In-Reply-To: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459382; l=1527;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=cuUwUuj4xccTZJ0uZTOAJPjw+SrCAbNU0A1nzSPt3rQ=;
 b=oSE10uGNIHg0R7f22M5hcNy+oPiqqcD8M/NjWiHhKXMF2y5SuNbtEZpXyAcJfrdIH7HcNKIDu
 m0F66Ey8IdwCz3tM//wn9/1pmECEuqegKUM9XeIAs1drfQJmz3+l75G
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=69688c7b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hjyC37SemgG_-JgD90gY5LA5hRgaOsfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX45LPxN8IxFwj
 RkNCpmBmK/9OBsWj0/CkHaTOJcUjEx+X2t/uVSnRg9iyvsN7LdTiJaJYYj5Z1hsrg1sQEiPX4w/
 YB1aGpYT36fyTs5GPD3+8hgmJjVHGNKTjG5wEaeBEv+iq6Msjeqb1d8kPS4/S4uGKebeiJRG/7Q
 Ze/DAvjWD8fE1nd+rcQhFMfKVatDrsn96qFnFAk+Hnhh+KGu4d/NdaTrZ501yYJcwTBnf2TTij9
 Hwrnwhcc597fVtzAN3QULbIuDlTSRoQOX20gJIC0cZIDmf9vn2Ecqs6E3ChmLjeNeNH1DVMmJCt
 T0duJvTFWPMkDyh5bZihr2ThEOCOfWpPdv8i4mGqIRXW3JG03x+uSxTnfOtMIVepdGh2RuP7qIL
 WA1qiQnTIUq/aUcQD4m4ZLVuRynBTgh7u2pbUJPaXUK2dbvRWM9MLIIroIRF5oIDs9wrRoPcoGK
 P9vAyt5oUpERTc8nCrg==
X-Proofpoint-GUID: hjyC37SemgG_-JgD90gY5LA5hRgaOsfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150042

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..1a216ea3b127 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -32,6 +32,10 @@ properties:
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


