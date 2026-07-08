Return-Path: <linux-arm-msm+bounces-117652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id idL5E5tdTmppLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:24:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6387274B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:24:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S5QHnqcE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gw5t7lW5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60419308AA6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AE0478E27;
	Wed,  8 Jul 2026 14:19:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2586F477E23
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520349; cv=none; b=sn36xaq+JQLuriXM+DebGaKSPKQjRKrxZslarCHXzQ+kGttrikWFnCMGDPuDBSKE2lhwQ/IE1aiiodHw8mXDszgntP+vqheJHjKNEdjtDETfRcYVmDcEEtXcswfZYKHQcbTr6cMZEP2M4/TUaksV+6StO928Z1IETraljijJ2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520349; c=relaxed/simple;
	bh=YewreDPcb9R6Fd6Lq9sZCitjEsz2xapkn3qNod8LQQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B156amaSC3eFH8vyS3O7Rxjl21NG839cACDSIiWgH7wXi7aHGPHvcNxWSGvomJHVew7SBWzb6KNIPqU9U0TPlY+J8opqduY6D+frsYY9LEfHZzYdCTBQ55/X+u/1TKY5Uq/iBOoSOxLwdk5KVP/of2tx2lfJRZRVYVMVJCbVn9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5QHnqcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw5t7lW5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3vCk2751621
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=; b=S5QHnqcEgEPQtkjD
	McqmjVZKR06kK3BIfvHx1lqeHmAeJ/CudXj7b6jqAmKOsO0Y8Ix6EZzna0+PkfxH
	Nwrtkl+KA69fsBVKJPXMZSoHtRckciZVMv9C86iIvPQxeJps5zotLDsz6xjicnjl
	YLOoBnieVR387ghH6MMe8H6QSIjyi0I3XuSIhuRDCroBvyn15HRD325l6fKhIJZm
	xDeS656Yb0edS8lSQpzNPrwlcj7mi6Y26LOqKXtDvMHNCnbITkYuQmMJq3AtI2E+
	5Cj/RPgx3xqwtufdQaUFl3e5Tw2xfjC4Pz0H79qJaRxPSXdCAUtkLtHneFqHItI/
	toAr+w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstu1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:19:06 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9692df7e2feso182044241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520345; x=1784125145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=;
        b=gw5t7lW59vSB7JBQ2kqiB9rzG477JAjZCHNhYkyU7J9IS50vRus2A52tXG4hZC1uCT
         YtBZZybvskpWors0iO/J0hdNyPxh9ccTH3Oe7ajFfRwNmCQxXebRNa1/EmQ/sKdgK1o6
         NLJ085ihkxgRcUBaFb+QPDJykldixnOrDwd7J+m1GCHSdSl/Hr3+cT1nmmSWUa5/4HTT
         cHvm92aWQeBpUBWrlhEgWKdBgc+4FYXOdjO6mI72HXHumWwRQhC/j52sHJg9RWrOftuM
         UG0wlmU1aDoWD78tEl/tygkeSYpgR9ZokectvrZTBerE6jR8an9+eSiv7eRqWS46YAt+
         2LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520345; x=1784125145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAZndPAw45cJsqtMkZT/+l/usaUKqi+xP1wvmZN57/A=;
        b=J+yO4Oia6hBHCQXxAFZvV8zHgyH69wdZZHFIMvbIJY79cAkE9jaWK7HSBaUpOXB0zf
         ceoaZctBaebHEUILdYGDw9Vw8U+Mch5J43dnG2KsnDeJUCUK0cMTPLi9og5LKfOuGJFX
         aaNj/IgoTUD1AVoOdKIJoa1dx/9yKaH3QnN9Dg+ItY7/bv5wHWdmo8H3D9kJ2HjXESNS
         5H0jeoNvvW/FRYA4T6nakBP7DHpt0+sF4OiyhPlEe7m+5Njeq5anQDVIkVdRk0youIpK
         ONFTog5/bdODJIBiJK+PbjGUdG6JrQU1tM1cpb2/Ttp+GkDnKlAVyyEEny2AVDgjWOJY
         WFkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsSdMRN9dJ4bRxumXutSFM71FRKhHtjsb5w+lVb06Mfbm3os5R7E4xXILAm/cPIEsvnf0EvidWsHt2UYiY@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwGBgD3OZo8Bbvh97ms6A4G+o+djTCuWV7xiwSEB1w17uGk6L
	byh0h+zqh4d6atomuSk/2c+7FGC+Jp7MVF9qMbSHPtduSXYNO+W6FJPywGyrMVfLqPVgCqLX4DE
	1Boi4KuJlVjcZmFiiZxnDERI9whIu2rAf2C4ybx5W6j1RIHL2hQSkWYbh6MtdLSAyQOrc
X-Gm-Gg: AfdE7ckx7R3BsToq/fAWpn45F2z+BHG74oNmdW+jGuozINfhGWH2ZQIu7FhFJ/JIEJa
	EcxKiaiVG2skVLtqOrRJGdALCxUmTkgUOqjM8+EiNi1RWzA5ohLNvD4FcsHF6IQ6CnuQ/BK+2gx
	kKBW0ADoyYAacWzUtyJmL1EebZBSgKIWXAZX+rIptYFxA9IHs0MusCcFfRfZRo54FOxpYZrN1IN
	HQgXC45nwz9nqW1u7almIk7yThRHFSaNKSt0D+ka8m9BMd48xvlJ8ddfclHD5tgD4Cuip5HHxGv
	nDY2H0sQWjTqGXMtWNUU5ulR/VuXLoNf1lc/WyLOvypnZBm3Ld8kBkypnO8pEiaLotCsBdQ4eo6
	ZfslRoghGjmn/IjY+86N5TzvAJdxOF74qWJO/MIMQ3cRWF+y3F0t9b9gk2srH5PxX9cJJnI2q+8
	uJnNxIFA6U771LrkuGnS4dcdPIb8Ftw2LOx0BWYGz5OoYUMxdIuKvWPOyW8+H3bJTvaNjlCBWHT
	so888HFK+7CiXymXEpP
X-Received: by 2002:a05:6102:50a1:b0:729:65e:f08c with SMTP id ada2fe7eead31-744df44ca17mr1357910137.0.1783520345285;
        Wed, 08 Jul 2026 07:19:05 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:729:65e:f08c with SMTP id ada2fe7eead31-744df44ca17mr1357876137.0.1783520344722;
        Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:00 +0200
Subject: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e5c5a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX+smuGc2PY7r8
 75/shqCIZqValjV+MC5MfxZAnYZakldSVwOROzS3GK4FJn2PjJ+VnU5Htlso144C08p5TecZkG+
 w7wLNRgjZqm+iiyfdYOJDRexh0rTnPbtBwGtKHxTa5hnnYTCHDdunaL4+GyBVj+Pcq3tc3xPFCJ
 fADhuY10/AxdwVKh1ZhVruyKraeckcL9nGsUfNoITzNeou2gx3E6zz5wquom4fLp7zMJ2NnnkD7
 D8hMcd6YePMFVc0sf+qT/Lf+GYbA1tDnqeIpOWLw4xUTmyt+TlqeCw0mCaR/ehzTbchAYN6FXoj
 rjYeLHZG41JI3SXMocNL+YuaSV6Mu2puViGawo4k81UYP/rsoO4AojkVyMNCeTGgedjybEANAxr
 Bc2m5S5+lAOMUqCRbeAO4b1MnAhVNTpzxRclyB7TORxAtMaHLPz155moOKlDGT5trRA2ndDutAC
 DqVNq3/rjlw+kPQ9gFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX8q46AGfyF2OG
 735QrO25M58cAkVd2v1EMpcPd+ibGfCEONdVRHdjANFnN7ZJQMNm7/BxhHhZ46pJk535vREVrCA
 9W6CeLX3XTKh5YwWPwk4BauLYxN0UqY=
X-Proofpoint-GUID: g_raNK16T4u8dvWzPhxSDYwkye-C3hcB
X-Proofpoint-ORIG-GUID: g_raNK16T4u8dvWzPhxSDYwkye-C3hcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF6387274B2

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

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


