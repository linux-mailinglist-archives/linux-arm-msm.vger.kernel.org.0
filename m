Return-Path: <linux-arm-msm+bounces-95730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBCwAnKUqmksUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0221D4F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DED030902F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77FB37A498;
	Fri,  6 Mar 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G58vDAB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmCSr/Nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51E3793DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786686; cv=none; b=AyJOXc2o2mjtyPTWVGd41eAE9SfLPEYBIKKLjC91Rge00btyeo7NdxOqveUFf/8BF+kqljpgt4lC/FFzIZpjPo6nIY5TdYwMw7wKjMWsTpWQQ1CY09eTDUyW3R5jPzyZamf6RU/GTHYa4QZ8bZGOaVjXUx6vbfnsuxqb4m5RizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786686; c=relaxed/simple;
	bh=w21jMDaZrGB02auvZr5ohZpYlh3pe5ze+V3Lti5Q+Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V655+A6tgjAN2ScpaUNJVMNccI0PLO/mnfJLCHBmZ3TW75xY7JNSy0tAEW2NDGsDHqYtOjLbPmNN4gvtote9mS9OPOPnEnGlYexGI3nYkDthW218d9qtdNlB284kW8efYe2ZWmcP1cn5RKkMP5sv8g3/H7SlgGGXl9CiZL/sTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G58vDAB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmCSr/Nv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264affc3298147
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=; b=G58vDAB3GNO9zRaA
	x7S7W0hfmImcHIrRt+Rtbm1KXF6iTsK7Rq05POkA9j57fc+eD3+QubVbMiBh9Z+d
	Yds7QwHiKVuW0OOpj4O8GkUn0isdwEM3xIvqYBJbPd2Yq0kqIiu+iZ3bjQGKjtYp
	1JpZ2nwasAeKQ9Wxk93M/Y2m8RBTzd14pAC5UMJOowVqi/9Q/j6JMhM9VQF8YOmJ
	85Ig6OcI+7M2ksOvbvEL2Jd2vZ6LLSAJ5yrnX880c0VdDkQn1VaKceyZcUQ2aF9b
	yIUeBluBulREUT74H2YmJ06xwRDOeDcntRJPIj7pCiF1RINtRTd6wEIht+NLSbH7
	mQGQyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdryya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:44:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7381a95fffso1442730a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786683; x=1773391483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=;
        b=CmCSr/NvIQKeC+hTFjE+D3ej1TwKSY0STFwo0SPC2y9E+gYWN72qfU/v8LDO4wdj8w
         pIE03wIa6e9BbzY0gpr6jvarcGPxFRyH95hPer1Ex7oheZDZflZEH1AfrWVzOzOfEJJR
         KDb1PHChxUuLqR+cM23FG/LdoE1Ba1biF5zK0+cPUBleaGZFP7+Wzka6Tc1oOQl0TdiI
         fOrtVr7zwokjlGfHRCrVGghp9o0cQKQ/GP7TVHj4CN1HFUNwtd/jwHM5pqHfAPJa6+SF
         8IiVopmY06KUblDeytfEOggd1aIe7MZH/yPiaoC2WOr3e/kdYYqfTqDbN4BQOzIGfwqO
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786683; x=1773391483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=;
        b=JZmhK2PDDwutng21NIb8yiSW/KPKqNqg0atvoMJ/jacj2PdcTAwlBvnHl3eYW60AKo
         cdUp21Nq25gfm73hfe3qvVyqJ/u1edkxp894eVJfDYt5mGouJ6qVcfqHqbpmQHn0AAml
         T6H9dN0AprZdefIC29JIx6ed3XulZAARsBy9Lipbuim4Ad2aM+YAvEa4FvQ4Vzg9IRHM
         B0S/aZP7A12yTIyq7s/vPe/BXdcZAVNYbLi3FZ0/SZRWhvsJRPqcCXbJSXz0mgiidJgY
         NHT6TPe55bEzVI5k3rbdrtuMBNxHVbGLVjkj7X25k8eGtK9gD3ciXE+9eEr1a8pvTuXW
         O56A==
X-Forwarded-Encrypted: i=1; AJvYcCVY4RK1SMlzTeub1dv3LGCXdVxi6a1XBIsAVarJXWiRZ5Oy82+5Ie23GFQ7Awc/mdRyogfgpw0GL7u37B58@vger.kernel.org
X-Gm-Message-State: AOJu0YxidGURwOjphW5iPuAco2NiX0ww7oE3BzRpUZZJHF+bGZ1WFZFL
	TtaaXMlKLz6x+TwZsLQZ0RDBuxwNEgn5P7RnSwqsKbxUwCHWo2OWu28Pc2WMt5xe8VXlKKRYc1f
	38DfGg5+4lohaopYOSYEFSxRUczGEzizIE950XRgNBXzfRMCUyjR9P2cwI5ZarRTGIpWA
X-Gm-Gg: ATEYQzxbckzSzdC/r4M/RSFefVn+5QAWw8Yx8vXs3KsOVF2tbDngUsPuDKKjGYa5/dn
	PMTiTnmLgnmqBugAfVr3t/ziQRgjzF8h5ZVRgWoOPdRpv1UAmy8ZVVWPcaRV1DXvC7hdwgN+Kfo
	Oi8olzFXU6h/+AaTrJloDRnlUhEB/0rj1J57GWUS88T58EPII/s+ogESqKSJvwzIIMCIe+P2GFN
	9stQg88biUvMhIDheHTYPPyRGSUu9wNSeIo5cHXiFoba47v7mIdlu0vK9En44AiVOt3OzwuLv08
	TYTlx10PtVu95joTUwzQU7lbMEAL23B+uVp/9xwQVy/khOqbvNSH4aW89fEJJnRWS1bWJZfpmcW
	Xag8oPgMbMeqS6PBiP4MOXPC9wuGFgvGooO/av4REXDkeVSjorwDSa1tqGxl6D9+O1S2qafY5H3
	xouYVcXHSUnMDuteMxECqb
X-Received: by 2002:a05:6a00:993:b0:829:86a5:d30f with SMTP id d2e1a72fcca58-829a2d81e40mr1412656b3a.11.1772786683444;
        Fri, 06 Mar 2026 00:44:43 -0800 (PST)
X-Received: by 2002:a05:6a00:993:b0:829:86a5:d30f with SMTP id d2e1a72fcca58-829a2d81e40mr1412635b3a.11.1772786682947;
        Fri, 06 Mar 2026 00:44:42 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:42 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:44:29 +0800
Subject: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=1851;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=w21jMDaZrGB02auvZr5ohZpYlh3pe5ze+V3Lti5Q+Ts=;
 b=S3bJBPfDcGsIIQXCEuO2+ooBXPVZeWngwbvMq074OUUvfGghNofGXvNpUApTpRBhV25Vr4ZvY
 ArASLdNP890CMkgetD8IHe7wNqgVkYVioFQdLg0NkHmY//F8GoS9EiD
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: dxViJ9UYA7yEQrCap5Ovlmf4Eomw1TiP
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aa93fc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BfjIKjrZkJso1lgBsdMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX26A/Qj5IihGI
 5MDe9PW1A4eI6TWpAnRoHqg7CjgQG4XxzPKoF+Nb5lUfEzu2Bgoxl42eryv+n7sqm/mJhlJTuVP
 Q3cWz4QxAqS2fqfP2YR1OlMrvt0xV1EfyPGvob7z9aGc4AO6p30eERRG4Gx+hRHX9J+5olrI2rl
 k/0xj9eX49O+n1Xc/tsMRw+b9GjsxIQp8Qw3kmVKpyGgvgzvqIFei+VsaMHb2DfS8CiWG41jEt1
 /mpkjS9V2ZFuYQ/6oDt0tt3nGKb07+jcnEfxqRslOA7Wb0YxQj0RQvC2O3ZjNf1B0WxT6phm01I
 I3V0yU9t/6d6mlMfaN4t0YnVBbZ+Av41MlgMxkd64iPEEgXuvYQvU/43prbEwGN00mR7LDev42P
 OdBU3eR52v1Q6ErHuXJFrB4+s3zgBgzS8H9yQOg9Ghz82h1dDEsm2DlSZDARL99+OW3LsYNqPcr
 IvcNT8XeutTGLNtbD9Q==
X-Proofpoint-GUID: dxViJ9UYA7yEQrCap5Ovlmf4Eomw1TiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: 5AC0221D4F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-95730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new compatible "qcom,x1p42100-iris", which is compatible
with SM8550 but adds an additional set of clocks. The BSE clock is
used to drive the Bin Stream Engine, which is a sub-block of the
video codec hardware responsible for bitstream-level processing.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


