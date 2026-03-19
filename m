Return-Path: <linux-arm-msm+bounces-98682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIizNLTAu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:24:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9402C88C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 661EE3013941
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18503B47E9;
	Thu, 19 Mar 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQ1xrd8d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUeiJU88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDA363C46
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912236; cv=none; b=In88nYZLsMrxQuuDUS0lsAb95KsjPzclrAMet8KWruj68OnSnSPuZbC24n5VdWPw4gVzDWJRKuULXyFRBWpxFmGau1Iy56GxQXpZQmtePkfbA8qZmgrHT70uPQGf0IxS23TirpK0hVX6KX1ky+CsU9rn5mOqRfaVOa2xj7/3HwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912236; c=relaxed/simple;
	bh=J2U48Qz0EdjobPQXNWWjAmcCWfCQTGM0xRFisL//p30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jseyn9dbjWWtGeSK5zsG5MqGSfaOsSSTxZqhsWiY/5FDeHnQYWobzeOgNrPJqpH4aBadpBjLylQxbjuJXqJf0pceq6ImALrP4pAS69DVmYYHWOq39Qwx70f5k7q+KNBfLM49ThPvdWXm5fcXgDCRubOvMqfVaIpVtfxa5oufpC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQ1xrd8d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUeiJU88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74Ala1999448
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTz
	PbB+Kr7U=; b=dQ1xrd8dwUkD0jDrJ51zoFlCmOXKxapFzNrSdrsvgA8d0uKsXsP
	cxgWzrq84oE44I7h0tWxQn+s6VqQQ63oGhLN0pOENusKE9wP1snRqeyo9TQFyIVd
	ihO84tcgv64+oFA3ZgHXOyEIEQfaWJ66A7Oo3I/s5+lDNFf00a9aKVTY129SYoCJ
	2Ak5pSxRQer4hv798mZjdwVC6MtnXkx4xqB1k77tQUAiIG5dlMZF0Aw85UDh+XVR
	+ipWuA2+Tui9FuKJZZZRal670sPBZj+pkQq7LBUaQhj0QZyeXy1yqxV0fTjhtKcJ
	CDMO0EQYsnvvxqzOcc7Ba72b9slmD3bkyAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb4dym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:23:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b19111fso41161131cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912233; x=1774517033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTzPbB+Kr7U=;
        b=DUeiJU88vrjJF9rMoD/G5+CtR+DSH9br7ekEu8nX0qrg3tRJK//5afm86cq5j2djnT
         /gNtALzACeJTfeG1l6HrBmAWSD9mCsRS3I/g2c+MhWn8kv3UqYKPQb++5h3NJTydOX9N
         AMRotBhrKqrwgrcE4aFwTVEG4yONMrF+Z+ZrhIWR2Zmf+7g5PjUx1qib4uXwC0M1grYa
         kTVUAT3SfgFL7wG3JcmjHNoWuF/Q/ur9Wtldavtl+nCKcXa0d2Djimg90CJ+ilyaCE8J
         ddQ7eEpaU6N17gGJDspWw0JCi3s9j2V4E1Ipe7pVwxj5PSoNI4NHm6HTLpccUgCjHGKI
         x1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912233; x=1774517033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTzPbB+Kr7U=;
        b=s7AXPAS6dBmOCos/tYkOlkx40agLmmvz9XA75UqD05FoYiTewlvrzRZkAPj6G8gBWu
         zyzjeflK9iPQ54DRFoKK5U0dt1XOU/TAo8p7i4EA/DulZqewyG/DNvvI93NXZe3lNHNT
         lFubIc3QOjY24a1ZoN5yZkGFukveW9L0av+iGO3tLobYSPJJ/2g5EqZcA/LlBqjdyLEp
         PREyd92XC+aO/XzD56dYZ13P7QJYlbpLVidpluvK2bk0nW/UKLgZXq+3edfIcHlaMFGp
         jfro9yaK4lf26gzAEad5+uW83bXl1W9uY0Z756J0hZu/y93iPF4eSn1I9TSmJIf+FJSe
         izCg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4ijLEc1LrYP3fW/9qS7TSWpsnaXSHoWWRXymbgC6rObyRBy0SewKZNK3I+KpGCgxPF8sZrt5J5W7TGFS@vger.kernel.org
X-Gm-Message-State: AOJu0YxYXpU4oR84jFO1YEAjty8+Ien9CSliWEco70v2vtqHEACB9SUw
	p3EQOQUCH5b+XkMPXbdweGpHrqLHWRpSUQf7i8ZEwe4ecB+1s6i2oVL0CJ7BvOZj8fXg9ctiIGz
	WEBR1NEChQhDwcK7FvufFvnkjHs0jbsK4Kn+gp3rP4/X2rLCcYsNIFj9jmpVI90OFD/BP
X-Gm-Gg: ATEYQzxvSwf2COHw1kEAHZEwR04VTKMjtqMG4HPx9JTUHvORnm7rXOy4h5K2rX4EACL
	DKYBv2hgnQ32ry1Fw780p0abFtjCiBT1FqSIUjtPKsqbqTpWJ8y8bp3TT3tF75lEhIYZ5PK1aOb
	AnEIDB3QwSerOlJORt9Ek18n+oF2RNR7QpAz1ZwBM+XAt9xo2SkGTxJObX11fQXGnAVAgcjvo6H
	AkmTgUMZIGjBKsxbllbvDttV9oGG1r+3lEFx/pCiHzLTiRzz1EwRImXVbubmcAbOA2K4UkdYvsG
	IF5CVLNZgs31Mc/jLXR+s8XpCyku3btuGJTeSCvRAPqFz8/2G/sQ0JM6T1eJSxjZeRC99M3qvwx
	MgSgd0gOFT5Lbc7Hg979S/UY46qfs35KvGtuj
X-Received: by 2002:a05:622a:203:b0:509:1d55:635c with SMTP id d75a77b69052e-50b1485f324mr83804681cf.43.1773912232802;
        Thu, 19 Mar 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:a05:622a:203:b0:509:1d55:635c with SMTP id d75a77b69052e-50b1485f324mr83804491cf.43.1773912232374;
        Thu, 19 Mar 2026 02:23:52 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm16035462f8f.5.2026.03.19.02.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Add missing clock constraints
Date: Thu, 19 Mar 2026 10:23:49 +0100
Message-ID: <20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J2U48Qz0EdjobPQXNWWjAmcCWfCQTGM0xRFisL//p30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu8Ckuvx6Bdy8WDPpdQU+csJ6ihyxDO/3+BzBO
 S27/rWHzI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvApAAKCRDBN2bmhouD
 181aEACSnDj5bbd9nZB7yxUC+xgAlKoaKWIqioVoAsDE7gvkNy8nGl9FmlEqPEXylxt8ALYGKGE
 Tdk/A8qlIN/r9q9X0dBUJ6AudEcrKD+0FPGQv44Z39wEdGIP/EHIGioUrExKs+0EQSiPBhzY8nA
 GKnmcCRRjpkT2MhvikgXECoGhJRS8lJLaPA76F4ioRJO9lY8IqRf/I0ujRFvEkpgfBjuo9lHsUP
 qL/Qh1Va8LfwpZQfAvY/Pql82hOB+3Nv6U5i/o2GCuPryz8Sr7MSslPzL9nGRJchLMD7i458/Bd
 LAPV6iHvo8A+XvD0SJOiYxd4J6ND5iM2FEjY6yeY+P8UVRGUwGncJ6f1Ok6r3YWtyXFExHXJH39
 nhFgVuNAKeRtES5n/Q4I9nWdLYFRpnbWKZFkOV2Gwbyli+FWOsin1CBDTgPd9K/PemlAFJd2IZf
 pe+bgufFu/Mz2juhSJsr5RorWVD9NsYD/zxbniJXOTGT8HL0Foh6waXJU5lSnfseDgumV2Axk11
 6diiaSWSPp3hmtWhjnN6njmQ0cp8GruMwImXB3D61Imb51QjHkGNuWoRHGv9f+A8p7D8HxeZpy2
 eJz5oMbrEkxJH6hDysEUXWUZETmeQmvBoGdJkJtauAYRcgOlgPA12sDF75jcr+IUet/R15Ck2Ml 3XlIPg01UXotr+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EQorAJdMFvB65JYcByy6D-OFRuufYL96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX11B5VYe8sQv5
 oph/bDIYAVasWF41xOvznXn3m+jQk4/8ybQ5EMGhfaOnMmjnH79BsJ2SL94XUAeW+wRK17Nhz7n
 V/+BwWH6lqLh6WhqbAddBScY0GQK5u2Fkr0FQsJedJZrLDLb245YEzuBJWIOK8oKsnH93H5wOWL
 dhguTMdVPhGxZwInkbwnN8i+sE7gW2tXfdGZ0VHrZ3VdbKfy/tPX1Hr4ZAzyEmwFTUGzY/poe6i
 LoOyX91Fv9eVgd9Fd8poqFKfGYp2x2jpXJQgs8Sz09U5vWiLnoPOgqnZiAAnsUGa08T7YMGtJwA
 0n8Ykz472pDcRra2kWhc3CTxmbspYpV0n4K9g9ETG5vQE1NfGZQZKIoQuzRnndgiJ1N+neV61yF
 FUYEmHSFPBOHCH1eW8KXK0uZbDzfIvnEeomilc+Fnw3GMyPuwoqUiozEd1QWB1/6s0/KMMzWUQC
 LjasF4h6GRUB1QUV2aQ==
X-Proofpoint-GUID: EQorAJdMFvB65JYcByy6D-OFRuufYL96
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bbc0a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nKn_0JQ5aXeIdToyfSQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98682-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.981];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C9402C88C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level part defines variable number of clocks and each "if:then:"
block narrows them.  It however narrows only the maxItems leaving
minItems undefined, which then takes different values depending on
dtschema being used.

Recommended style is to avoid ambiguity in such case, thus if top-level
part has broad constraints, then each "if:then:" must specify both upper
and lower limits.

Add missing constraints, mostly minItems but also maxItems for one
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Apologies for sending two patches for the same file one after another as
independent work. I do drive-by fixes when doing reviews and usually
post such fix immediately.
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 2b6a0939d98d..cddc88e2bad2 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -173,6 +173,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -220,6 +221,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -262,6 +264,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -281,6 +284,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -301,6 +305,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:
@@ -361,6 +366,7 @@ allOf:
       properties:
         clocks:
           minItems: 6
+          maxItems: 6
         clock-names:
           items:
             - const: cfg_noc
@@ -402,6 +408,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
-- 
2.51.0


