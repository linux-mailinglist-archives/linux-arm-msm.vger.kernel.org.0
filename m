Return-Path: <linux-arm-msm+bounces-101299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AFQKGr0zGl9YQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:33:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E83788F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58926311580E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8463E9F8E;
	Wed,  1 Apr 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqJATRwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkuYXwqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5793E95BF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039095; cv=none; b=IPqIQCdm/KL5C4l2mt9O90snHLe/4I69LfEoqOrkQBfNMxF4+gEuiVpxapcHHPdMfU6dbOdH1Wbhip3KGMHEiVBQLlWMZ3twAalpJRUNghY20ndZyjA3NPAXEr5JutkCm8jzTLAwNu0zxX2Z8oZEevIlEKan//ppagC4sm2TbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039095; c=relaxed/simple;
	bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmPV4Y8isiWjjGEA6owg7V4h9gvWMCemJyrgeoWqMWuQxU4F5nq/z6DFjG+8KY7Nizpv1D/o6SqTNwhAKZ8Y3dbBb2XT6zyuioLYwdLQwntRAV8VWM1S2X3q+LguszkW0iwtM/WyPU3MeFHuXkNx3gHMlkOE5V2CZ+aqAqkj9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqJATRwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkuYXwqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317WbLm3081358
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=; b=VqJATRwAxdzF3yDe
	odoh0jmmWacOiTiFNenFwX8Kkq3RBSvAZT06e9zXqVrHcV6FlWe5G4G/0qGJtzaM
	4wj+B4i80CBrm6xWEzFr7cpKwGHsDcJmIhohN0CCFkoqlJUj0QKGsBFFAQVtRFKI
	GTU/utYSh+0bRnyw7YPTobzU0ffE0UZcFt5ZgdQ51k1XgPB/+TBPZH/NZZCICra5
	+roz+1RGjLMkc46SvdcbLATK9FkFrdq27GeJ0WKUYdTVpQVI9FrcRb1lYJlp4kxp
	hjtf41RESL0AUldXEdIn72lo99bnygxh6TvIfdP+lDJtrl6rtXeBCMbfj9u1jCPq
	nUQQwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkujwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:24:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso4941599b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039093; x=1775643893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=hkuYXwqZa7s7OnklwsDVXyC1wbYYljsfvAQCX+Rcs+QJhN7z6UM8/gKz02s4fzZaI7
         FD8fn7UXqZMVd0fGw3TnpDzBmF0IpkvlQyv9JVvYRxn6pX0fu+uLff3TSvztUKNZb6Dn
         c6fmCt5rrWjU/EKGyWJGvYLaluLa8fdngWlPDL6432e1hUgvOnXaVv48WQPmwubWDa5n
         n0gJ8N92hvK5BH0w93qTMBRvfcuoG32xQ8aLIaKI+6+vBvZNcaxJgmeyQeGxBjfBTc/B
         1oY+4kjpwJxsmkyXB7gJ3bw1Y8QDoxIWQop66TXKIOc47JzdtKk1ZZU9vY6tkCU6SYz8
         HR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039093; x=1775643893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=ZNzUxwAqK9+Y7jXj44Ksii9209+8/sDejs+uAdqWH8DU7wmu6CEHlH25P5l6Cyyguw
         C1DfbygYfcZlEWFKE6k+6GwOIc0V11LcUAMpzbeGBTOFYlx3YPaZTOMccEpurp4XZFZ3
         RwNmc5s5hSeYr37RjlJpmBznmGITvckHl0qtd/6EGhg8ToN4UM+sVfTuTj2hszkW5LLW
         3oZBO2WXuSy3StPVKc5yUt4KRK7NlYv7WzewLiHIjXrO12yx/VJ5Q4RmnP/txiCY0ZD4
         Of1bvNR8UDXeOWEi/qbWd1DVTOnfey/yloGzOvK3JWJ4VD/0ADmd+3zlNSaC+imqqhEb
         JVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeZi1oSZk2wZhGt4iYj/UQdhrySiQsNExU9HS4B2XSfjqQ9hLJt1ujOTo8lH7JDoTVfU0ArpP5dxdxBsnG@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZx5VKD5hJfTYYqbmDQJ0SKyk477L4dFaW+5mKBlWf7EcLYRV
	DggX0r/sZbJcPV4NoXlXXJFI6P2HPAmnGapqIJS10s5qeAFOT/YHJx23JxztMCfhAbBc3qfX0q6
	5k27nFAVL0nmneUk9a36kP0X5jHz0bcLL7Kok1P0yDU6v/35Fgc3Dwnw80UVVnrp32He1
X-Gm-Gg: ATEYQzwgJ1aH9Dm+aO4hBpSGjpGQSCfC0pWy0cAmBFBjRJQwidV6E55Egx9O/FRCrM1
	2R11SIT6M0yJocc3zgGXxPa37iJsZ3zkVuKZqy5Qppp8Raan5anzowCbnZ/vmGm8yT+jCoaRpmy
	J3rh+W4tTRpWb4PS3JcwVBl6TGEfqRd3ApQwU2W9jmRPkKTaEXn2M1x/2CVuk5V81HhVVBuUJlp
	Gu1BxZmlNJtTR4zvTCwjfvDMYxA9ttU8umKoSYRttO4p0eahYA4q1yVfHztzCSEwCKFEKPJR6aO
	VGLLZ/cWSqEQTtA9qIX+doKTNoQii0a4IKSqwlyGw87bBna1xftBDIXqxhlzM3j05ittjAS2PzR
	zb6G1qra5S3ERk6mj5GGGZcTyyK6f+buJFmIOD8Nwtc/sXZXSDigTCwTPQiQ2b6A380vCcYFw0p
	hilTVmVue21qHnXrzMB7Vj
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121959b3a.34.1775039092518;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121937b3a.34.1775039092043;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:38 +0800
Subject: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=1967;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
 b=weYSLiClw9bp5DOxXhxNoqiLgoUPSSPwqaPJyYFKqFOSJ6O+B2N4DGzBFq0Wu10y7d0SdeqAR
 kM3REzlcMXkBDtR+PzkNOkhVU2tHthHMliflgXmCj4l7XwF7yz3+JZf
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfX96UAcJdPkenM
 ie3SEFx3kmuQJ7AMu7vR0flDw/kY2XvYYGYGKXTyw3VK2lN2IwPF5/HdIuBcCiwngYNls0vT5c+
 W6njUpm4UmWr6MI506Vnp3YWZuJjdYxiqvffjpqDug5bXzZRDDTKLFi2Sl9by1mWsShRdFsp1CR
 vJbQjFGowmUBo+ItY00m1vSVrIpz8jLamUo1a8v04z+1QZPlSRI1nygH2OqrE0EPrySLCPxGp3H
 bXvBThbChEIdtXF1Aw2a0gNQGN/K10l9PUvlrE0jGLTKAChnC3IxaEHuu/fEjlsmFyqKn+5POs8
 iMv8qA0C0nYC6+LHrDtdQCM81JROHoQuokctMX84r/pHSt0bv0RGJKhBiM+Pp/+i+BePwEuV7iG
 3DmEW78nhRL2jvYZhw3sZLavhePzo6pKAUz0gtvKAj9S4JvaDy64fKS18KN2ydNTraBdjGPII6i
 29ZmtiaUPMh2R4nAxNA==
X-Proofpoint-GUID: gRtriq7FEUH2I2cBRr7r0W_-e8ixiOov
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccf275 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZIxFtT3Z7BdGPi6TYWEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: gRtriq7FEUH2I2cBRr7r0W_-e8ixiOov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101299-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 076E83788F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatible string "qcom,x1p42100-iris".

The x1p42100 SoC integrates the same IRIS video hardware block as SM8550,
but represents a distinct hardware instance and therefore uses its own
compatible string.

The x1p42100 variant includes an additional Bitstream Engine (BSE) clock
that is not present on SM8550. This clock is described explicitly in the
binding.

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


