Return-Path: <linux-arm-msm+bounces-118922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t3muAWnCVWoRsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B16EA750F7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g1y6JH1T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CWLgc8bV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118922-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118922-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CB973046D6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9822F5A06;
	Tue, 14 Jul 2026 04:59:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313C2EAD15
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005196; cv=none; b=dzIFOV8cc+I6rZNl0+J/M7dNMM3RJhUBnsFLAngivWI7CoNObUvuZAS0Ajz5XeAFYDfdJdv5uqyTmrRzy8DcY1AqbPwerjq2ekKkXO5ISa200jlci4KHCW4YE6xe9JtlTg/zWEwUrX8huNO4RS5XN4bNoLGKAcwVRWxqSY3qmtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005196; c=relaxed/simple;
	bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqiEuD2jgItwWGQ7dCnr72nA2vOwTTd5oD+cWDgSw6ouqsFcbAWG0GsmOmWVEywLJ2+ORB0FPxfR7JAvHvylBHl7lltcQoyslY+K9FZMjp/YyZU6wU2eDjTUHA3ibRr021+Ts6+5Suo+Fubooxuqig3hGilqriYYEb3HR2P/Bh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1y6JH1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWLgc8bV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E383N83466061
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=; b=g1y6JH1T6DfjzNF6
	BaerBrMsvlAy9iKUNiWhxq1pTw21/asu3EKKt6xD6zkOXK00gmn+Bj2FpiGbVNGT
	xUadMmgzdCSf/RayBktt7iLrdPVoMCaImbRO6HFFwe9JYyNX9Cv8HWpWpyb4ZpXy
	hHebozuIijuySV20hRiuSCCo0N4YY/ILuEXMOplRbG9VlBXmB94xnY4h6SKkPrEO
	xBhyzK7i90MKeva8FaOY0NTQ4wABXfTkWJnB/Pkw4gcZnoAonjm5ZTYu5Cs4lcyb
	JJehPMvmjh6yLO7pf1AqUKRyHsidlEsS+wNdsoN/oYnFMUPpOdbX0KNaO6qUvMcl
	FPAXKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavuw4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384419c6c74so5288317a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005193; x=1784609993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=CWLgc8bV0DXk+CwV2TsVy4TyUq/geqeg7Vz1BvW7Ppn9jrIQCG9uVIFIv7evHI1peu
         VR2x3edpFOrKLtHstVc5dpvz/2zRGVgH78kopdDhRTSIdWMaV4W6umYn/9PLx0NKdQmj
         BXn5IYZg/mpVVzXwMPHzNDXxHGCAga/YL3FEfWyd0s7vc8zJIWqBm0p78hmwLeeoUg+2
         xqAN8skXn+VFwjR+jW8Jktgv5FIMWciASSEwWNIb1NSKMkLdWzt7+OEBixmNY1U0IGZA
         zVBBco3/1OcJJRc+bN3kA7Tdn3g+06tM410Q+SfywHxqZTQgrDD3nb3FhLUNB/pas4B3
         SUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005193; x=1784609993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=nkkbbpyaMXoLKckjydNU0WEw5QFBH7uTxv0EUg/vfyxyfwYlPmVLENo5nQce/Zm8zJ
         Xgr9eYD9XhcjwueOacoxXWk3QYYWTRGcXnSgVOskwG4AT+NQJF8YyzvoeE+mhXl8ZRP1
         kKEwboQF47lXAYPg/EzdUOcAxkaC+JrS5R+qTiZ7XOCVkIpGAmiYhb8HBIj7rqx6W+VG
         GiH1EWgdkyMuHYnemntkmTp5W+0rbLUe+7fZ9fln4AE0li0IBLZO5F+bajADx9e5IAct
         gpwUJ+oRWk2Yr32GELamzfFI/W4pDXrU8mwYvrde1wpbq1yPTWRTXcmM7+ujF6yEd4RX
         BKEw==
X-Gm-Message-State: AOJu0YxH8mBHOLpv4rpsfWBKY1zucQBxxSBhnRsGAyyAAzWJm+pwod6f
	cyr0LY9468IGDp/7Ty+RRpylHuJHft1kdZtHGEnsI9crLFwLIaBMTSg+Kua90tKAugExOIjqIVU
	9kY+1wjQM1yOHky45hqV/T6LtSTHLGPFbAo6m52jCR0s0MSPaS2dVmNFfXfn1/xF6k68c
X-Gm-Gg: AfdE7cn7PqORwRI273JwbGVmKbofebEU1Y6OZ5nFcMr1ahpitzq89QB5d7fx30pCQ23
	p2+L7tFcUBIHN0rI5FxIgCIKF9kc8EzrLzgTrKFtwpMGVIhM7hD9ZRSggQC7HKh3UBKIHBw1rNX
	r/4xnAJbsylLGYsVXqqERzrknaR9vJ72lPhZZ6Edrm+WyP6OjUBM4fAz+5qGpyRcCP1A9aZZYh9
	Iq2YQW6+slcyMo+ilkYOiiE4KG3z2+ptqRqrsv5ouB/KsXMmv/ffnntlsSAe0H/75tmnB76bscK
	Nku9iHOc2LXA9UVN56PgZ7S1jo3/PMUPWEgPClPWxEN0lLQCWuUrGSTOtd1PE06Y+je5ZsVqMFr
	5CQGFYhXgF5CHAR/oKOk7aGW3fwAsBSZyt/bbMm3WQeFSDF/67t8VuSBZdQ==
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713084a91.38.1784005192905;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713061a91.38.1784005192490;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:37 -0700
Subject: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1880;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
 b=P8t+Vk9j0quvabeBmT1OdSoFANC9FVLIAbuJevQ1qm4wbN2sJdQmDvyRxiniMg6PzlT4XgYcq
 TRLkHILtCrhAx7A84t/1I5FRIVZ121m3BHONU9+3jxPhK7UVaGD2dLD
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 8qH1JTMVdqUPYz910inQlplbuwTTaDQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX0ItfsW0FHEYR
 GVsOWzyPGjFZT6pjP4s7z8JSxeQ/B1Tbg5lOYxHYQ/sjYAafkebdXKc+KotoZfhsgch01K489gG
 oOVQ7DXpuqEzLVnWqQ3WhGlff2aMowBOp9dpM5T1O6KtlFG8Yte1RzIAj2WFK6SJUnxQOQ0ZBgt
 82dHy35vO6+umuwxQq+7K0s0uWqAjUVKUP0AdQ2/o02p+QirQrraugRSkBB0sNKbXvMd3RWEwEm
 aifrNSp5h9YKtb1ARgmQLZa0CeHC4TLuRpdvUhCUvWrkU4B3jYdNl1VyCs4EPiMKwyRuYXFXc2z
 HmwD1EQzqPJ9SWaNoyox94iTiX5R4wrWALFjpi/Rdy/fA7Vg5x7ip25AFPGvSYNmx67uFLWdJ6L
 zRtLa9m5xCf54wFpg+vfayvzRizyUZtMLB1nLBXsMnVAwKgFLumX1RuDu3e9uMuisb5DuaLpWZX
 3HGS7Vzg2yj9M3gdaOw==
X-Proofpoint-ORIG-GUID: 8qH1JTMVdqUPYz910inQlplbuwTTaDQ3
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a55c249 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX4Uu4hQCl3XKF
 UfE1PP2uVdUaFPuqu//DvP0qGxArShshCmveEs+d8D9iLa49ksppnEnraxTqD/eV/Imf0JC5Gtu
 Yt/00xtyPqv5LsASPA+UqbQaSDRvARo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118922-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B16EA750F7E

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1


