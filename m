Return-Path: <linux-arm-msm+bounces-100457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFycEfHmxmnrPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:22:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A046134ADF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B413161777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3342539F174;
	Fri, 27 Mar 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="olCB8/cg";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gYeaTt1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9339B94B;
	Fri, 27 Mar 2026 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642327; cv=none; b=bmJJOnbpSt9AGZtSFzEO6eCISl/EyGrY50jg6QKpu8L9a6k0n+aqF0o7eBLXPbSQrP+Z7ykLR1OPDUS6ScbMFdew8ZYz4ZdAseMf73Qh71tv19Frq0/T3LZnTQEgClWV4kYXSwQZtDy0ZsUUrihcQCQGsmlmqmT4XvK9bgriE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642327; c=relaxed/simple;
	bh=y1mn3EVsm3C324UB1u4AHBN0rMOZ6eh/+kyLEg7N29I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RozyCqXLNl79dz3JpJJjqKyp2p4NZZOeMbJUU8c5pOG4MRijSUeQnSUfmfnyQ+Z5HRpCc1z67jZNJGLIdmedGpl3A7WKspOcdvGr4uP04DEM2ZK/d0VR9b11AzIF/20xT9RDQ7Cdn0Oyg+BKsbDTU+kH14UvQBRg7bXDBPETqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=olCB8/cg; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gYeaTt1B; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642311; bh=KRsQoApENZsMtc8yEmzySDM
	5TGIXWnATSK6inbLlJXk=; b=olCB8/cgo7M5kY0HsjGcQqFwQua505/KgRTakRTgezznL+UaL0
	K35GuU7VcYXXziwNjw41b52zknMp6AFryqa126uLumnsB+Vj0yFf1l+/xjf2zYEAhp1/VWzJxX1
	bEvuQct6+PAk8k4eEJCbWBQhGQFZb1L45XGU+IuKFxaXixGoXgckWJNbfl4xs9/2HlCzJIPjWvY
	9dyf+9LzJFFDcInKHEaISevsABdtZcsOgLhkWmc+Ilc7sFcv7OZ83asT6UEieQn1dUkTV1Lciof
	6XeXJdT4XXRfYfshMo/gdjLW7uq1eczP9rMW42eIPjF4IVz3+vYGkSwWuNBoXQS3UWA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642311; bh=KRsQoApENZsMtc8yEmzySDM
	5TGIXWnATSK6inbLlJXk=; b=gYeaTt1Bm+EMicG/P+3MovXoSewdUjxjAvfS7kGf2skUEg5oTE
	WAm27lwyS7ms9G5CyDQLpJLZpMd20IBHZIBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 27 Mar 2026 21:11:47 +0100
Subject: [PATCH 5/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 SDM632
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-sdm632-rpmpd-v1-5-6098dc997d66@mainlining.org>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774642307; l=2467;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=y1mn3EVsm3C324UB1u4AHBN0rMOZ6eh/+kyLEg7N29I=;
 b=9wzkj99IhJQhMWauq14Ey5oDUrpypfou6ClNc2Od57WElbKGfM31i5/YJyvroaUAogegVT4P+
 pCjn2X8p5xQDGV+7W56lpv3NVFaXplsGjEETieXApLg7u/l3a9MnyRU
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100457-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Queue-Id: A046134ADF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SDM632 MSS is very similar for MSM8953 mss the difference is
mss-supply is a pm domain on SDM632, previously SDM632 MSS
was represented by MSM8953 MSS. Correct the bindings to
described it correctly.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 8c0ff4dfad10..9154d2b541e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,msm8940-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
+          - qcom,sdm632-mss-pil
 
       - const: qcom,q6v5-pil
         description: Deprecated, prefer using qcom,msm8916-mss-pil
@@ -79,14 +80,14 @@ properties:
                      (not valid for qcom,msm8226-mss-pil, qcom,msm8926-mss-pil
                      and qcom,msm8974-mss-pil)
       - description: MSS proxy power domain (control handed over after startup)
-                     (only valid for qcom,msm8953-mss-pil)
+                     (only valid for qcom,sdm632-mss-pil)
     minItems: 1
 
   power-domain-names:
     items:
       - const: cx
       - const: mx # not valid for qcom,msm8226-mss-pil, qcom-msm8926-mss-pil and qcom,msm8974-mss-pil
-      - const: mss # only valid for qcom,msm8953-mss-pil
+      - const: mss # only valid for qcom,sdm632-mss-pil
     minItems: 1
 
   pll-supply:
@@ -214,7 +215,7 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,msm8953-mss-pil
+          const: qcom,sdm632-mss-pil
     then:
       properties:
         power-domains:
@@ -236,6 +237,7 @@ allOf:
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
               - qcom,msm8940-mss-pil
+              - qcom,msm8953-mss-pil
     then:
       properties:
         power-domains:
@@ -282,6 +284,7 @@ allOf:
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
               - qcom,msm8940-mss-pil
+              - qcom,msm8953-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.53.0


