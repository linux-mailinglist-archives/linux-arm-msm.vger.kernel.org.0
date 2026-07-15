Return-Path: <linux-arm-msm+bounces-119275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pXVnJleRV2rVXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:55:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9871875F091
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VJPD0S2W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RCS1P3sT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B78E1303FD11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEC33093D3;
	Wed, 15 Jul 2026 13:44:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BA301486
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123076; cv=none; b=WKJO2oTp0j4EfMf+ftLwDin9SVItGXTyT4pO8G5SROI+/qoKoY7/O4P2RMf660zxPaQD5xDfcx40GwMZI+HRuPmH+7tBQbv6lHnPdA6IUlSycLMlDCYi+9AwKcVQQH9VTo8ha0uP1F7HroEwHPwjugEqNcWdwUODilESQQW3HKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123076; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hu/FhBsJpvb92a1zE04DzPPcyu/54mLLkzv1svRmcdPIk5KwnoFieYGTVYcWRNO0AVPa2bp6JBmBaNYk/lJSRpuc+cDiPR3AxVuh2Kjtb2otEuoeasUc1du40h4oJoS0ATsZosJaGzdzPK/kjZ8Tlr4cN9Pkp5soDjIMuP1MI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJPD0S2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCS1P3sT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcmQD3479766
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=VJPD0S2WgvKoSp0f
	NOPU7hKtxqB1SCLlH6kEHbm1LEyQLwC5hVhkseY3MqVLkddMnsGouSLjNWr7Ki2c
	c5feWSAH6e7louySA0PZykTWf6IOtxAcRbgbFf6OnwTkZdgf0A8qxPN4EnAi7Uq5
	xD63++FLlUHgjY/tWmu6RT1DyzMeUBLHw4Ihu95XDiK7Aaqi2xI3YWcdfnZvYW1r
	q3SEK6RUg191O0Nwpr/3fUWOovInmy6RVYpPKxH5/+0gSFSYRqmKqNV1Q/W3yRhp
	Lz/PQjV4M622m66xrsWduwHOGhw5HQJ5Yjp0HqF+T8ukUI19vCD/SWe46qXYxmkK
	g9oKlA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3vw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so91709361cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123072; x=1784727872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=RCS1P3sTDAMaIrSOMSF9HjOSiDR8K8vsnDuKBnvhW7G3eOUskg0eAQ9Ym1kT6+P0yd
         pI1BkgxS/ZhGuRStcvQTs6hATDK0wplUxSibHVM43nrlXD3KPbumxUe0StB+fo008cxw
         W/azoKezvYQ68yGyQTHlxTvmXD76QXpwcdHCupKdiQE+fwCnR2FuUl0/MoGa8896Ue9S
         XHc2xdvsaIHon2j8CLzlpi5vrELUWiJzzBHIB0rH7rAXmumhgmAXiRZ8/kPcR9b2Cbqi
         qNk8D7GiDJgIgHcExF6O9EbDvySHA/JuGaky6d61tsN1r69o9vVEt1pm7oDFwjx9KRS7
         njuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123072; x=1784727872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=f2s/gJZI5GKY9+atD8GI30clJcwijuAj3bZWJd8SsivQpVGx837E257L2Zq4CkQXK5
         DhzNAy35pzdr+e/MLWP64XjUZelJrjFYz7B5FvlqfEduEM0AG6DV1up0VE6QAAoL7n2i
         OTs2ThguCfE5mWB2OiQny5WhuZNGPGkFkhJozvK9Q3oDCEuLEwd/zVT1NLam5BxD04jQ
         CVxvyB32mYVBxhdTVLf0NyH5Rm0sbZaBuSiGIMKk1UeCN8S0bMibkGK3jnwCzacyRCPO
         yZrVal+XA0AokSlT86ZCvdkbkTqeqKQkpps7AVYO1cTGL/RSO6spKo5c+vCXGBLaA4FF
         fnBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8bxgrfpeygpz6ro3EE5QGA/e9bIvX0ixoFgx1dBSKZhC7kYpDrCSDQzD2ujF6HJyfkLIWkxaRydPTKd2R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1tBiIM9Wtas7uYu2LKQkjMCbzqUCO3836T9N9ua1IMi0WbEtc
	gnaXBBBO49oaQeVSWkdVJ7zV3Uo9skGknt79N23NUM1qmaKjke/vcJacw3vvs0Th/QfuCsN/IFI
	pJZ0kx5rBArs/vSk22ofQHSSue9fRkUlLV8nqtxLkpJyD2xguqu+PdLFlqe68MS7bSSOH
X-Gm-Gg: AfdE7ck2wyjxp1EEYWi0xgT6fWChVZG46ubvKtC9NW2yruY6H8aR2DXv6BQWD9ybZ6F
	L82VGmwDY1mpKt9JdEZzAiAJu/be46d8xvsBOG7s1YrORaPIoCFHUL4ZFmxtalj3UnZGboFYVqn
	YLh7t+41aKaujO8H8adoz/FkpjiwPMYD2xl2KVDGFm7CYC4qDszk6VZ1VlLKagyy8YsxSgizZNz
	yhePi75GiAJRqRg7Uqsy3oVBUOP1Twr/NmiWOx56cLd3FMB4OCwS7xsWb3GV30+8H2M5UfvGxvi
	VVkK1Hnauxdx038fO4Yi2i6V/4oqAToDmUxXM1K3y6uWmrr6VTxEqSjItrjeUMorugOG6R8ocCe
	MpM7A4GtVbFKjdtrmhmQRv7d6hyLpxHF7BhkO3sSpjUIBDw5pHukFTeLx0nDFQFEaY536Wywtfh
	kIlzHWPlL+2uTtI5ZnA03o2wXDHBGaKrIcIQLOzxLfx2Gfl6uGL7O9l1yZDmto2g==
X-Received: by 2002:a05:622a:558d:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51e424dd417mr61097061cf.66.1784123072388;
        Wed, 15 Jul 2026 06:44:32 -0700 (PDT)
X-Received: by 2002:a05:622a:558d:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51e424dd417mr61096801cf.66.1784123071961;
        Wed, 15 Jul 2026 06:44:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:27 +0200
Subject: [PATCH v6 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-1-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX1Nxt7m2nmdWf
 qrT9Gi9SWJqJXV3sP3lQ+5ljsVr6HG2meof7IfpvGnhXBKiJdRhjquWVn3DvYNg2U1nJQq639xM
 SDfW56WvBwENKtD1AVrwqBJqIH9CyBI=
X-Proofpoint-ORIG-GUID: YHQwMhZKhTvB7W_Ymn7GfrTVCm1_rNCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX8PDL20+P5GYs
 itPaNX+5R+LHVOgw0aqKu/TJnA2MwkidWpNP8RL83P7sPAGOsksWUD9mN5AcQSFDzLpI/BaS0rg
 gpxi7qAForDptidibddBUI2CZJLDauiqnld2sRPcngLKof3lLiuXyUdWGYaM21qHpvkWmTL8tFt
 O1bST4L71Iqqqzy066RXEmv6RxaShEeYcTQX6UKzszOAcXTvWRgjglpk2KjYvgvNdqJqTShp8nX
 jSzcmWTv7dh5NEaicqoJuddcGUTBqdFgmjO6HkPSnjkHX7p6BGWzuSH5mpZXj2uPOYmiDXWmwZB
 e1kHtHeo/yN99WFrBejSpAI/gseNiosCwXeN8xSv+aoyDtBCmH1BwZSK/3fX/wtJNJDJr5ATJnj
 x1hyh82ylLhvTkxblgQKeI5LcJp7sqkOo0iOVscmyCA/tgo7ExzIpfPjRZ6pENSuueOW589eaAX
 Awb9Jy2P5JQCC+GYvDw==
X-Proofpoint-GUID: YHQwMhZKhTvB7W_Ymn7GfrTVCm1_rNCb
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578ec1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119275-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9871875F091
X-Rspamd-Action: no action

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1


