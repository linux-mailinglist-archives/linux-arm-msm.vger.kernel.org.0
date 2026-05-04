Return-Path: <linux-arm-msm+bounces-105642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCsKAppB+GnCrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:50:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A007B4B9001
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A7693001859
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 06:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367AA23D7FF;
	Mon,  4 May 2026 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gd+8XP1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1Jolmrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF3194C95
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877395; cv=none; b=UyYg+OFwPQAAMwhTMVZcH4p9Yofo78W6hskoCBHx8La1uejxbv2SszuetRjXDf206fa5mmuqcuaj5kl/0ONCX3f40cKaHzqV4knU3UUX/ie9USILUW6y6wWmbDiJieWuEFikdlns3uVo1hzvtApoxCqI8cEuTd3IVOCP9qMbj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877395; c=relaxed/simple;
	bh=7RiyzX+zuh5Q9zvm7IyARRktAwMs7ElUM7tDz5Wv/bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bClP/vU7tohnJRN5Z8YiHmeo3JUoPn4rlZRqdJ7XfhA7kLzK9Yea+5DyjreEfs75SyoEiwhqiasDxStURpXuwk0RQwy9zb/0wsTGhKsiJumwzRcAAQ+o7ugjo//sNniQpQeL5uxCVfFGunPeLFDUw/6ERPK+MkBv5rsk/L70cL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gd+8XP1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1Jolmrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCSM4174294
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 06:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O
	29Yv9hMw=; b=gd+8XP1QQwumofoAFeptFe3Xo8Gthg3QAhRJhRGuv5urXRPfIU7
	7VAo0VOgErV5RoAZTfIBWS9xuz8Gji7EP5jexQnOg1blTjDayRWkZRGIPga7hlwj
	yimQfTcEqZT5AoNp6/RPa2Up2N02JkMFAbHz/OaUVdiAMBTeGGcKch9NWVW+ye2l
	uCi99nP0zMdM76iOx2or+R57PW8CUQvPLYmDv70AU67tQLIGeFx3xPKHqmtqnTse
	s57k1QnxARNCVlZxK12Mxw83vxrvqOHnQWkVa4YU8GmZVvj5UMr0h9jEonnSNAec
	JAqyOVCcOUs1wAwLKXXzxT34b42W7Fuc9CQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cha8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:49:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3005327b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777877385; x=1778482185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=A1Jolmrb1xTiwW6xpdsCL+ZAcsoo+8MIVg8NQm8G92zETOvnloJBPESwtYDynVBkdL
         8c3SaIFDVIHcXscBPXWM5Rm8JuLdV2YnWDQ33L95qyhdoiACp8O8n3/oFXEUyIMIBaGd
         PFTacgBwZIyS3jQHDppUy2tDaYZhoNqol8ww9P1G+IxVmo5eWe7Z/Dd51KkmkZBTC2RD
         i+88K0ixhcTsA4QDWSlrTolhDsFbmCTdNrAxFOJtvUCZIKgBSRRmHJSYhx+2Kk2Z9lMO
         ZZGB41gmc1l04kSOuljdeCADGR9Zv9mdnlRgyl5Y8bJgjgrEbZg/9T3kuO8Qp7gzNLOX
         KvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877385; x=1778482185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=PGqGMX5Dm3Pd/xDMjY9MxHCz/s4dVSqPC2iYg+DauH/aYbdmYP9893nKLucs/vwh4i
         OyR4v56/Pb6kWzpnQ24iq2E3rSsmFws9du30F//aJas4s1ICzXU5U5N4psUfQhArw14s
         XWWDBBMesVCylWKjI1+36Gki7sB0xSNHT1Ozo0/6qjL5GkSlgMj/Z/t1qNwZOLOna0VN
         4F7zcDOmvZCOupybJUZyI+n15BoUXssBKO/cyDaBCPtc0o75y8bRKxstGofjQ8tmcRHq
         +01X16+1IROgS9RWzK7Z66nI10bCVlEPyqVCG4q7DdxdOuWNuLAU5EHqHnxihwKdPk6E
         3zIQ==
X-Gm-Message-State: AOJu0YyyVZS0oGx5sDD2RXQ+L58LRW8mHVWOmbX79dxwwsLUSBN5MEmM
	kkpADIIEvvHmkytl+E+N80tW8hNMQiPsTnPcak7EvuvJewiX0BV9n03yFzdTaa8ZGkly95MzE72
	CVH8LspubARrJjkHb+X6lxGkgqRo0wtNFeQYJnaTSM2IfQm7hX5ldJBzK0ANKPFyqtQnx
X-Gm-Gg: AeBDievY3Bt0mZ5szXmIyCypoEbf78UvgPEfM0IOlTaBAOdvhDskobGPHe8+Ir2ORJo
	wQacL0GtIjkV0CI5TvjbVhjjBwxGbpqeof7smZEEPuXGCMFJ6y30+4AP6tg0zFnt2WSHXIYji5f
	Pp+Gls5XacdG8H+RofbSZPq4AMLev7+RoJCQ9oWx7OEOJh6D1apqlSLgo0YeLbNqz7w+CRyIMlt
	GmJ6YoQhAV6ec0LS0VOBYuiF1+mup31m17++OynajJBuCsG+UMo0kMHDP6p8HJ5IURe3S51QRJN
	AutA6ulmiWE34cVcw6ejQj84O6n6U61Vs5mvYOxvxVYUgi2A8NWV073d4sZXFrbI74aKsg43fyy
	CiOwv+tADX/+AEdgUbRtQn5iyrfvJy5hW4Hw+QSizF7aIjB89ToqtQ0epIWLOmOuFlw==
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7117001637.4.1777877384587;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7116989637.4.1777877384060;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba73e1sm8470681a12.1.2026.05.03.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:49:43 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Mon,  4 May 2026 12:19:36 +0530
Message-Id: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vTn1QIrOhS_Fj9rk2RWKCbI9OSqVP8t9
X-Proofpoint-ORIG-GUID: vTn1QIrOhS_Fj9rk2RWKCbI9OSqVP8t9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3MSBTYWx0ZWRfXw64B1br6jRMv
 1zypwo4/MVahF44lNv9YFEvsTaByZ4LYT745APVjVHChiJUddEb6oUmHNHIl617MXo0QtJ3qEPR
 2By8o6S2AKLY7lZ7G6XApHMjsyzbyeZiONzJZ9rDOmMAXlZNdnkZmkG1fOzYcJmT1aFSpTuy+Tw
 ocgJDVW5O3w8CUZeoBZZO1GFAWJ1FjYm4vLLnYPW46lGaKvUbdfHlDBmgZlpw8jMOvenP82mCVA
 AobuFxpsLmzFRXkvqgc/OWAVVf+lu5s1qpwJ4rDMwdC1f+OcRJfm4zJ8t0pAfSDTRadiomSzFvW
 +oaIC/O0TSlpQUnocsOII5mKoM2CDuxztfpLN11NtQhVu6+j6H3bB/CmEnGuTkoaGZGPDHXxrRj
 GTOLFApcXTk/Wfsp1wulrghXNRIEaBTyEquxnBCFtQtMv+pvic7OyXUJcx4iHkVIWn/kgDYeqcH
 jd5PyOnTEI58A8hbGjg==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f8418d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nYjtv9ulD0oZlCtruZkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040071
X-Rspamd-Queue-Id: A007B4B9001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105642-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specific
and applies to all TLMM controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
schema duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v3:
Move the gpio-hog patternProperties for qcom,ipq4019-pinctrl.yaml to
qcom,tlmm-common.yaml.

Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v2:
https://lore.kernel.org/all/20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml   | 5 -----
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
index cc5de9f77680..de9a3e67e1bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
@@ -36,11 +36,6 @@ patternProperties:
             $ref: "#/$defs/qcom-ipq4019-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-ipq4019-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1


