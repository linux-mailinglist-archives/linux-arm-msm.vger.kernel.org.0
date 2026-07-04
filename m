Return-Path: <linux-arm-msm+bounces-116448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vfsbM3BXSGr4pAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:44:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D067064C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Hu/T42Tf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A2Kv6xkE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116448-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116448-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A55E63015185
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A050A2253EB;
	Sat,  4 Jul 2026 00:44:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4247080D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:44:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125864; cv=none; b=TNLjsxlb5KB6C9IN4kqkSu+fS7ufPdx7RS2DAbiHsOfgRzIpdPoWi/8O27CVrzvmOcac2KkgFJfL0q+fnv8x3DBCppwSQMkhIIfRMVkXy1kcObz3ZjOtBgkZ8+sH2DpfL+OBZQCVASFEjiXxg2/X9CT6KYT8c5d4c5vchmJaDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125864; c=relaxed/simple;
	bh=N7vEJ1clTit00fwCGUvWO2rua7WCCzdrl7Sy7uBSfow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txQB/lw8ERm71mQf7iHAvvDDOQL9+JXpYXoCuhAP51gBujRfiJwSb7OsMhOci7s/oNu8xc62m6CQ9vnE9p5u+qhIbmOcBVQ1gSx8HboCIdCXoq8Wvmr76LSAXZogQSunrrxnsIceZQ8dBm65LmVZO/FHUv36T9cQS5HqUaFWW0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hu/T42Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2Kv6xkE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPTfJ871792
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wy
	RzganFkw=; b=Hu/T42Tf42mZKimFyHzzcnPbS6U0Rf3moHsb5fboOsUT+be6+RI
	qThvCiukiyCgpCBrUZIq6cyE/7fcIgQ1nnxQt5q+hY1ykRnwX5wd+POx9UcbVefl
	K40mV+pZ+zxp2AKhU9TZ3wMBuTZ5/QRLYwN0DciSuqq1XXFPD73gPH1WKvte8Ek/
	D5u/UlXzWyXmwBfaDyVfIX5cMMDmwOrXe25rLiKW26tDtOtayRx/r3MvWUkmKFfx
	M/P5yf6RxPIzq7aA4sAt7jbtPLm6l3c80vU9BtIg/0E3ZEYZRfXhEHBh3eoRjBaE
	ep5HsFo7/5eCMYPjf4NYa8vljRMrwFuxfDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4dnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:44:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so759a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783125858; x=1783730658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wyRzganFkw=;
        b=A2Kv6xkE3w9bjDFueYtfroj5+C4aVmEbhDhEmVwGU493gBaOZiwdF/2bRJTHuEmGn4
         Iuj/UQ6ONW/laz1npvXKXX0YwDaFUejjxFV7CsuRVRipUGVJ4C5UIEV4GJKl4FiJwXw1
         yrQkLNzcAmJpeKknSNT/xil2flI1qLDGyb1UXHQdKTsihqXSn8jmkRWiapteBC/X6WVs
         YS2+LKwF+eLcxHsRme9zCiPuEM8SQhKowDQyMTIYHBS0sXCr9jyjrN2vqseWScBrqtIX
         PkSoxYDPbmOXpxRvl3oUBaFzI0GgumiLAZ8Ow4k0Iqw6G2CLkeVw8mbLKBBpINWKEv4Y
         Jjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783125858; x=1783730658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWLCWIdXV3P7AORzTQrp4L4mpwNnbz+F+wyRzganFkw=;
        b=PdwVZnrzOV2Z79oa9u1KjMmqA43VZFf/zptFwVzSly0CiHDn/UaKTewC0+vIoqkZI1
         677K/Vb6sVYPHqL7bt5FQwFVtkYIRt7TlK1hR5rTCcPjajrJlQDrZb5HfU0yQeyYmOCZ
         AIbgMvIeEOeE4PmwNDbHvG/EdLo7dGGSwv3YbWBD7dtLsgXLgKwphVgGHzLWg0Chwxlo
         KpF8zYlVWB7gl8iyT4r7yPj/RP7CQc9hW/GjwyNtkAx5tdwBdVz6tu80xYzFqFXreiG9
         OHADZxSTIeoeSGvT6Kr2Pn8q4WMHPRBptMei/S/uDmXDYUG3lf8f+RlqJnqfEnzqk5y9
         EXcA==
X-Forwarded-Encrypted: i=1; AHgh+Ro83O1Fz23lvcpbgRNrBln4ZtZDi9O/VvNbiK9+0VgcG3NrBujEgE7tvDNsD97FH01BZNOCidDYHIycEKFb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0hxTGEYgq8RaChHv6vLMWfz6IDKqQ0NzFbHHSb7g1VyvUbjN
	r9D8/r2RbwDsnOxixXAwp8fBcFr8eXiQCbJiVbjShgmqil7h0//aL45AB6Rabtt4a+D0bnWefzm
	6gW3HxPonhWbS9U81R7Ts7dcfA9ckHrAQF4J0u3xyk/QSAXdMgNmS2YHsYGoTla7N2uYW
X-Gm-Gg: AfdE7cn+b93Ov7rIuychKyjR2L/k7aEiDN5RimL5mUwcXVNo4nlWIa54vFHKtBCIYLK
	gDFVCcHC602OPIF/aAkhPFgx/+STH3BtwYmWm3SfGDFyJXH7ADE/C1oZcKiCMFJcEabrEzM7Qlt
	XsFF/B3mcmsiZ/fSmy6Kn7HRXawBYfxvZBzb+mgOOIuPJpTUCWLvp3EMHPma0ddhVN0F1yMGT7E
	gHEECIUlfLZqIP5TlPat9ealZOmeVFpMcqaagaBmta2SD23Zfun6UIO6njTF9dcxWm1q2Q8A0c1
	9hP8wV453+7o5ovwjJ1Ie5b/zjZMVxQD6T5zb7YZRHzijePmuGRIi9ntRVnO+viQ+gNEES+u0TY
	NoRqhc2Gb5NjaM9h4SWuchJ+Bbe0PlKrs6zPpY16ish5pEa8L9Jgtg0OyGPnexZUcSCxozTc=
X-Received: by 2002:a17:90b:1e49:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-381120b2f0fmr7021894a91.6.1783125858203;
        Fri, 03 Jul 2026 17:44:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1e49:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-381120b2f0fmr7021860a91.6.1783125857678;
        Fri, 03 Jul 2026 17:44:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f44fba9a4sm862777eec.10.2026.07.03.17.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:44:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Sat,  4 Jul 2026 08:44:08 +0800
Message-ID: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNCBTYWx0ZWRfX0ks5CGDrPz2s
 PUA5aOlfVytJhiYw0MY5+wiI3MSlfkqjtWuFcGNTUiPRfxO7j4HIOj4fRQqBV+GA/MlrHDVLCd5
 q6UAwqKZyTJpg3sJMV0bvmp37u1qv9g=
X-Proofpoint-ORIG-GUID: VCXFeqEpZ4hMqEl6v9acdQF8BJjJoo6U
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a485763 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qu0NaVmkdm94GxaCK5wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VCXFeqEpZ4hMqEl6v9acdQF8BJjJoo6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNCBTYWx0ZWRfX/npFv7nDF7u5
 FGnoy+oCLruh3Mtb4kutEu2Sr2J4rXd/+zTeHk3MTTE3nUqFQcNH/IJqUrBnXGLkGTryFpIl1K+
 rZ8DeWn3hfGNkdGsARf5PzQ/kGTyiPESg6mfdyFokjF+7GE2vCwayStgvylI5u4tg+vMVpwkOGG
 0/y2HZ4O+MNVzQICqMi26BoQ/z70ym6vqWLUNWX9Hb1PuVE0lnhfkTTL7Ysn2NHWh/3eQ8h/tY/
 5odY6rrKmT1i4pteI3rePFgLw8c/j+GkGYQ67NBLyzkFU/lAKt5ZrR5cUkxwdRVUJ690ivN2dw/
 Oq/wmtr5HN8c1nhSVLBVbWbM4N1D6p3CF4nxZZ6PdZoPXKSxyrXlgW3Kks4oC2xIIg1nALmT7L4
 Xf8G/MvKMNYuDb3AQYr2WUOCZGFHlATpuRzXMmgqfbIXuwOreS9e/H7OKWFE7/83dLCEoXPuV2x
 XHSQ7yUs5BG+d6x8Dhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-116448-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4D067064C7

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
It was included in the Nord SA8797P DTS series [1] due to that
the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
Herbert as the dependency is gone now with 7.2-rc1.

[1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..d690eff2e86d 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -63,6 +64,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0


