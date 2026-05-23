Return-Path: <linux-arm-msm+bounces-109472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMxHKNNrEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD35BE0BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C51A302D943
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17DE37FF65;
	Sat, 23 May 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjMl1UO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYmPttDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F93803F4
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526525; cv=none; b=tnJRo8Xg4LVWKhYHl6DKLgXG3+5D0zDUSFhsxhDtwOTcGKkku9kfqVN+gESJObN1d+L3gZF6gQPNQuKGXmwZ7p9L0DAwD1dtrQkWbVJJWpLbwictb/XBNViWS5ZhogSGcye/TepUd35vy74Ay0/FZl7AyGsYX2X4GHsNzBcGqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526525; c=relaxed/simple;
	bh=DGIj2GYDkot8puf3FcE+/w7IPaWQUlBilG1+iCjOjGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVHWhKh6aqpau8URaj6oxyXqBgeifF/wFa8Vq16oCkL/4LAtxgYDKfSG79UjCXQ2VN2urv4jFZGsrY9m3dj+ggtF9gSFZSx3znPernQwlcTJzQr2JQMpZb7jintQMtwj0m/qkibxe3O38xXfWTjMkFI0jeZGlP2eit2fdEhXfxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjMl1UO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYmPttDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N3Z95v4027498
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UesMeb0m4oi
	qpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=; b=hjMl1UO/cZ/P4idsczMoxV/aF40
	VN672IUHXpN0IGD7hxGsBjpBJkwvxoKcmFgPHpnzaYsROq7xc0bdodI+SVzILUmO
	8tLOXqLxM1+JFU87JeRZDeRpHRUmzE5zEwCxfRgMAhW48w7ZXKprNAGjO0N17E0G
	MbztmrfOPx/eB99GI9b7y2iPAtFoC/yXemZM3PtuR6Zt/wIkLj4HP8P1I8DwZJY4
	x2OoRcIPbwXxwo6JR33cetc2xkPmKs7s86Y1KO6L98noyAnt6ZzOeBfI7WZDKSZt
	2flIavtpEmpCFpLDPxVqswpbPhxxDZcgg1lvrsPZvr6OkOVumvCbkipzfmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f38hgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so55622855ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526523; x=1780131323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UesMeb0m4oiqpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=;
        b=eYmPttDT0s+nMbwqVC4WOA2j/h90vQhaRyu5mojmM0tBtoY3sM45yTAbF7b7RWi5b1
         Eb5VpS+2wO2EsFpQivSlGExbOJYOCgVP6GeJ1K0sQrJV2LBwTn8kcgI2FcuNt5q0rLWw
         tjtKIHJw6SH5AnmMqM3GlQxl6Gk3y32/o0M5mKa/F32310czWQ177DqDlh1C489l7klJ
         wNshDe1oCaN6a672TYzwGDknGOhG+6qsmgxbD/XhqSQISBzq2+F/Y19nshIBhimBVP1T
         DIcJYMbVPZmzxmnwXVP02IIrfHmmY9tWuy5u5glbb8kEhk08ZKsNsZWkQr2bea+1VLZR
         CDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526523; x=1780131323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UesMeb0m4oiqpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=;
        b=LIwm5pEzwKTmdILwtv8rgeKNFou3gBRIPDfaiI64VpXYefwceXmzUTSWYF7Jkb+7vt
         D5OWGkcH8P6kpmJX7kFJ1hp9f7Gy0w/gZDFGfbCveg1PqbweIx13CxJwMQP1QKD6Lupa
         jSn5bNcW+sJk1BZlLHsAjlu+gKBhlzNgttbC5o0AIMSe6Bn5ywgO09IODNF0CALtuBGH
         aZBqxlOhGHRla6U1mHRGyrtEELJXV0pdNdQ1sLJjt8+/kVs5q/VgtB26h6eBIMI8zNst
         IVBnwyy1CASfTOenYSzkKCt4eofmDc34XTSFelakq8pgvlE7yh6Rq95hUS/02pInLKNK
         VyQA==
X-Gm-Message-State: AOJu0YyD5TBCfB3+wiuNojpfYsQPyaTbQl0hyct0anlXrfsDyJRD13yT
	b7yWhxlx42M89LSFTX/xSdf1Qf+pvgCgbUJTwt28VT9N/j58HCVW96z76yItHRZG8Vml7SHmqh+
	x3HKBCgqCJJBnUjbHdDLPc/QkZGyDrv+3+paKWAsMrwejEtmf5Bmqifut6VaX1rAmLPtD
X-Gm-Gg: Acq92OGCiXn/MPo+0KlfnzUl8o3rMYGV0OKmflhTeQiaQ4Q1ZNlHPCbV9kCGp9+JI0y
	PgpcRvj5IKRy0DtJ1fNk9DCNiptDEdJKa3stXsrHCVeqIiFxjlEjvMvhqhZ96hO9559+W4q9aco
	X9dJx0l8yedJ8GV9kozrciX38qR8OwnQV7f1JvIjUTMpXINeYz8BX570Xg3+HjmmA6od0HrEL2o
	QY/nNJTa4u7Jpf4iX8s5Mbu5/uKqLtLJLV5i2EjmEJiOIIU673G9ePe4kOuG04LB0Lnzj4ajLAb
	LDJUAYkl+40qqnA+WQRfoqbw1KPSTUVzHXy1K/6TP6UzcDAUr221spU5L6L8+QZ4zkQt/hFbkQV
	hi+p7zStyYbsabeNha6GdpaACY1cIgPATz80p86qREDsbVrZdnUdtuv9/mVJfREJcgmT5bF300a
	D/6IiofzxJgQLmHtDTN3dCcx+xE8e1uprjuWQS
X-Received: by 2002:a17:903:15c7:b0:2bd:8938:b811 with SMTP id d9443c01a7336-2beb0700897mr83310795ad.34.1779526522568;
        Sat, 23 May 2026 01:55:22 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:8938:b811 with SMTP id d9443c01a7336-2beb0700897mr83310475ad.34.1779526522008;
        Sat, 23 May 2026 01:55:22 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:21 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH V9 1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
Date: Sat, 23 May 2026 14:25:09 +0530
Message-Id: <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 38c10UM9iVCeD-YcU7vXM2MUSi6SWEWr
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a116b7b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BZ2PEOZbcBSxFJMT2ysA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NiBTYWx0ZWRfX47vyjPlK3Sf/
 geYPnkIJg8fjotYbmkQOvN9s8r6UoBRTaX/LBAmRcfcNtJPuQULGyx5l4peDTf/zIsBa9kFAOip
 2SYPJBejwT5z4d0z81MTK9IAKAhpnwXfQyTCxJAbyn1nteDWMuVzlfnV+VbHwFCIH48ug1T2RTp
 DaUS1WqIV2lACOkjex9mWJcMviLEBsHQUNp8PrTv17TRFt0aG2y8kd/o0X+Dy1Re1X4JfP0uQpE
 Y7FaV6EWsdG2FUYEvQcU+JM2k5ekY4jLd0l9WaLKStMaMFWx+0hUOngvDU51iJG9AeZtkGvRF6A
 IayIQDN1GykU6fUOAIR7k48i/oVssI7apYJzx9wZngcjk3g5nhRcWXpDNI/prQWDUUBP7FrhlmL
 4lld/dekzs7JYezVo8CQmNBg69gkKhTHrftNVafIuAffcpqAgrItam8AN9XRmy7oi9HH/kq6OTl
 BOVekox1iIY7PhtEVtQ==
X-Proofpoint-GUID: 38c10UM9iVCeD-YcU7vXM2MUSi6SWEWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230086
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-109472-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9DD35BE0BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
accommodate SoundWire controllers v3.1.0 with 17 data ports.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f371b5..8e6973fa229c 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -90,7 +90,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -101,7 +101,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval:
     $ref: /schemas/types.yaml#/definitions/uint16-array
@@ -112,7 +112,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -123,7 +123,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset2:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -134,7 +134,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-lane-control:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -145,7 +145,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -158,7 +158,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -175,7 +175,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -192,7 +192,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -208,7 +208,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
-- 
2.34.1


