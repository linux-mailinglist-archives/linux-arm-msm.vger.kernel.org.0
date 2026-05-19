Return-Path: <linux-arm-msm+bounces-108603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGhnDnXCDGqJlgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCF584759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3753A30942EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4173A3BB9F3;
	Tue, 19 May 2026 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLu1jdGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRzb33bX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9A3B992E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221036; cv=none; b=eCa3zIcVp6cRarm3joPqm7FPjh7pL/oDu0ZLXQgGVHMxoqvLojyXMXkqS/8Sa6VwHIXFMpxwLBVEAQ8Qz20CWc6WbYObdeuN+u33OWtGLmJFC/rLQwFubI5DPSUfNV1EkUVEtD/+BhGXhoDPM2KJcCG+0pX9eBPbrsuKn7U5ujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221036; c=relaxed/simple;
	bh=kH1E0yOCfv8A4tsoQ88g4hFit1daNXlye+KSvBBfJds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBvawCtuwglAQFtiimeA6eMQvdy93sg0R/zyO63Qsexk9ySfwfYxo+UxggMliXVFfVw5vafARLFgsHHXJaH53rU8cp3jxg9gICOHypztoW0R4cHUAHViP0GJXyxHwrqpVY/QocWJetsofDy0oNwmZS4EQXGnDD8hYTEr0u6oyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLu1jdGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRzb33bX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExFGm1237838
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSbBZ3BwAYUcEgXqfoZ6S/QTWv2PnMSP7E1mGCzbAk8=; b=WLu1jdGh5SpXwr/y
	XOY/4kT+1VKREbTH+U9vJDiFmxmt0WkqUX0xM9TNWfxrFjmrKk1fTr7+9TMN/FmC
	NUNoZruv3CaQinmJm1IZ6UFBdpe9f0Ca6zMGgrHVNefiY/LJXwSgLnyqLxe+D3mC
	A+1Ua7TGfbVrV2Uc+eOCZ+cz2sCa2nsiTpzP+lSYD17hb9K/oFd++bSLctKUMoug
	ndDLKnmckx0x2HLDxljCw5lB0913+PIgSQASVFJfwT2oKXamRfnn3MSu0hEwe0Lw
	WQiFg/ctDLHvRgR1vh8HPBikJYlchUt/u99O9CE70a+3vv1uIGrWNWOGnkZ+Mqzl
	jTYSUg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3ss9dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:53 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56fab6d9242so11026102e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221032; x=1779825832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSbBZ3BwAYUcEgXqfoZ6S/QTWv2PnMSP7E1mGCzbAk8=;
        b=dRzb33bX7lR3U0H4XTqm6aITnPlv0spnUB7PuDGO7qZEBzz02/ng2sN2eNIgQVNxNu
         GrCUw/j53gU+4jfeJ7nRHcfqcMAaBiet2q/EG/GZF4xj0dNwbtxSHeBR/goeBAAMfRaW
         mXKqcIES9HOPGUBzLpPom4BPVeX3oySra3B5OZTo0OVGlpZto0sVlvKKT/EfHH+bcXhs
         xv9bbQfDLTIwteTMnW5KeqItEMpx0InGx1Oq5pMHcMP+iNHjUTHzntRUaukZgID1OeKm
         2pUVXyUSJb6lZNevU90xS6suIFLs/qrxbC72hTJ9yfj6oMcp9PJA357nUnG42U6gVV+g
         VUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221032; x=1779825832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSbBZ3BwAYUcEgXqfoZ6S/QTWv2PnMSP7E1mGCzbAk8=;
        b=JCwORmFF2JPAucFaxPGE/gSAYOTBw3F2Gtl3DZQXuJ2dFUZ707z4/ihlfFQBBMlDwR
         kH6n3UZt29C45hmyEZS/MDpcnlB3eeY5tn00Lf5wNAwNjorjyQ85Kw5p0hty1FNGZJdr
         gXweeXIgdmQhJc286j+TYzgqYweGV/3PfecqKl0kNiTRAT9XIDtXsHEqYlHlEDhYTBzZ
         A6pRHaB7kJJ7ecM0jAn3FO6t9WZAyNBLHC3GrLdPDGNawHRQsSva08o7c6nYfpvljhyZ
         1iJ6u62YYYLtuEq+vT88QVi/jt5oKE92ISlSl8bCGl0kTuvVbgz1ccs2TnI6IVbvibWD
         5eWA==
X-Gm-Message-State: AOJu0YwMExQAsksgnJPX3T2Hpgbg75XJrLcPaHv2rG/6q1i1dxkYNNPB
	9qt6T0B9IObS4nUbP23bwkJ6JU3sh3fBvYLNHy/bKufwK7WOpElNGepmi6KFSYKh0UlCYQebQng
	obG1GRLhRneEaAL2uh1BjX4lE2oZ3xq7W0RrKKbvEBgXax9mefyRTnvJEVmbTsbbiBNit
X-Gm-Gg: Acq92OFClVDfHMF7jP3w43Bww30a/KxQDcjncvZWoLP3VP1GP6f4jVZgrnh9Lcjkfve
	Re//A7otYnnltm7dkipL3lgEfrCrLAdVOsNZ+XpyFWALaBgqeyCF6UNTD07E1BSql+nkABUugUI
	wgQ217Fm6laO4Pnb42WQpj4R4kYiY8BpA5qddb1Q15izXJThHixiZnHKZyQVPpQWVSvwFTlyYEd
	/RRXm43A0c8nPXCvvPoTMfAS0PheyleG00vVvDhpXx4jD0hu7aEgJkdIWBCdWepCqbjOtMgh6VA
	iqbt84leMbru6LRhboU9ZqomhtsdnEEKuJ7/7DFNcjyd5P8XnIia3GNubtZmOpRL3p8+eWrYWE6
	EvHR+AHQhGGfzQA9jumXR/F0sZ1+Str8ykTEHb0AIUyjb
X-Received: by 2002:a05:6122:2881:b0:56f:6b46:28be with SMTP id 71dfb90a1353d-5760bfc8fadmr12044232e0c.8.1779221031851;
        Tue, 19 May 2026 13:03:51 -0700 (PDT)
X-Received: by 2002:a05:6122:2881:b0:56f:6b46:28be with SMTP id 71dfb90a1353d-5760bfc8fadmr12044190e0c.8.1779221031371;
        Tue, 19 May 2026 13:03:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:03:20 +0200
Subject: [PATCH 3/3] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-3-005d29d261ae@oss.qualcomm.com>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10108;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kH1E0yOCfv8A4tsoQ88g4hFit1daNXlye+KSvBBfJds=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIcZNm5mcwuqWuKWVbNIBU5mqfbLE3UU4evA
 G9QcEsW3w+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCHAAKCRDBN2bmhouD
 1zV/EACL6H6Ua8NrWAQjTyQM2XZM8aDgGEzr/2u4wknqJAe5E5rNMBicPYiwVZ4AI/DaIMyfGz1
 bEf2CCd9CEJh9QFTyrdYkvjkYcs4jawzZXd0IR3/F+/Baw5x8hBYErxJHPmQRZjqcBtQOxXRp45
 6qZYibgLAGiQAbfg4Oj05L4djfqK7wTmoOkTaDgJJTCqheBCsnKOhgypx/WVS/mzSC9I5Q+k7ex
 Kz6vEL4rGD73CQQdJuzuBFZ/p13eDTvY5CZecaKW/znd7UXqbU34Wehr7JAq8Oo9oSdixHWj2uW
 oHobLBCf8cWDGj53N2DW+CjswksQLAxf+8thqIQXEC5iS0QjgLvjP5bmof6CBLO1ttfknxJqpmQ
 ZxhsxvUMtZ/aIgYVCiB7gWRu4CEPvb6JT6o+P0Y+UwT7BsaUvGZjgENZ5paGOnqHR6E8CTZw2K+
 dUSoLe7ulA7nj1TPyB09c9TncJeMEPiP9aVid9kcWvL0234Me+qj7MWxy7s2nQdILC9XhYY1oz4
 sX2tvyNfs9my5AcA0nLcMdcU2SOGT9tetiJVdo07HPRpt/RoLr9laVAxhrjriGY+M5yt10yOj3n
 WkwOseyGKmklWcZle0bdZ7W3OmOe9OsRBEjocq207rpqLxaAuU+UH3S+6/NsrQnWasYoLPXyF+a
 V+m+xRD1CVY5Y/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Qn4Xe_M6QRxBIr87PRVeI1JAhoiwZbmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfX/8RVXZBWF3Xk
 EoFwsOOv3dK0a2GHU4fMP17VjFzkyOcvY6ANJHgH2xjOjxC/FAeOkwlo1VmzDJsq91xDHhOBFHL
 4gbsll/fKJINLf44in9vkOYEl3cbUnGGuDg4m30A8jWZxLP1Q8gbwPBS8+XlsSOkCaeEL9owxIf
 TJEG9zw4sPgtJ3ZEGpc4wtjxE8AFLy2Zix+pq6hvMexcRlTcLpiCaYP++IV7mqF8d+jugFmJkOp
 syYwHnTDoQcbgorln5kO+lvhEZFaQVKiDTrXMEHLdWZwBclwdtGIZlc6j4OrlO2uzhMZw8gUcmf
 eQ4/wRuxz3yrn7Ht8dy+MuCEdxy7K665VO08E/OojN+US4uZcm+GjBuMqpIo1mP5DK/Bu+94Udl
 ORpfp046bxhsy2xFE6tbHtvPSor0opLvA+koZJiHiJgkan5P4fCAKYHnnDG06fuGEA2qgpGfzm6
 wZ0lweaGe14kIOT7xCA==
X-Proofpoint-ORIG-GUID: Qn4Xe_M6QRxBIr87PRVeI1JAhoiwZbmE
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0cc229 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jA2l_eq6Qs303fORPCoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7DCF584759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Fixing this and applying schema for nodes with fallbacks is
not trivial, because obvious solution like:

  minItems: 1
  items:
    - oneOf:
        - pattern: ...
        - pattern: ...
    - {}
    - {}

is not allowed by dtschema.  The binding should also skip root nodes,
which have SoC-based fallback, but completely random front compatibles.

Solve this all by:
1. Extending the select pattern to match all nodes except root node.
2. Apply schema to all items of "compatible" property, which means it
   will be evaluating also all sorts of generic compatibles like
   "syscon".  List them all and let's hope that fallback list will not
   grow too much, because generic compatible fallbacks are discouraged.

The benefit is that this schema is finally very specific and evaluates
all nodes for desired naming.

Diff is a bit obfuscated, due to indentation change so briefly
explaining:
1. None of the patterns are changed (neither in "Preferred naming style"
   group nor in "Legacy namings").
2. None of the enums with "Legacy namings" and "Legacy compatibles with
   wild-cards" are changed.
3. Add pattern for sound cards.
4. Add list with all used generic fallbacks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml          | 182 ++++++++++++++++-----
 1 file changed, 137 insertions(+), 45 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d7d64e0e146b..e27701261509 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -22,58 +22,150 @@ description: |
 
 select:
   properties:
+    # Select all nodes which have SoC-based compatibles, but not the root
+    # "/" node, because its front compatibles do not follow any SoC patterns
+    $nodename:
+      pattern: "[^/]"
     compatible:
-      oneOf:
-        - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"
+      contains:
+        oneOf:
+          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"
   required:
     - compatible
 
 properties:
   compatible:
-    oneOf:
-      # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$"
+    # SoC specific compatibles can appear alone or be followed by another SoC
+    # specific compatible or generic fallbacks, therefore check for compatible
+    # should use ideally:
+    #
+    #   minItems: 1
+    #   items:
+    #     - oneOf:
+    #         - pattern: ...
+    #         - pattern: ...
+    #     - {}
+    #     - {}
+    #
+    # but that is not allowed by dtschema ("oneOf" cannot be used as an item
+    # for a compatible).  Work around this by defining schema for all items,
+    # but drawback is that we need also to list all known generic fallbacks
+    # like "syscon" etc.
+    minItems: 1
+    maxItems: 4
+    items:
+      # Use anyOf, because soundcards will match few patterns
+      anyOf:
+        # Preferred naming style for compatibles of SoC components:
+        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
+        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
+        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$"
 
-      # Legacy namings - variations of existing patterns/compatibles are OK,
-      # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,apss-wdt with codenames
-      - pattern: "^qcom,apss-wdt-[a-z]+$"
-      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        # qcom,scm with codenames
-      - pattern: "^qcom,scm-[a-z]+$"
-      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
-      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-      - enum:
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,gpucc-sdm630
-          - qcom,gpucc-sdm660
-          - qcom,lcc-apq8064
-          - qcom,lcc-ipq8064
-          - qcom,lcc-mdm9615
-          - qcom,lcc-msm8960
-          - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
-          - qcom,usb-hs-ipq4019-phy
-          - qcom,vqmmc-ipq4019-regulator
+        # Legacy namings - variations of existing patterns/compatibles are OK,
+        # but do not add completely new entries to these:
+        - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,apss-wdt with codenames
+        - pattern: "^qcom,apss-wdt-[a-z]+$"
+        - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+        - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+          # qcom,scm with codenames
+        - pattern: "^qcom,scm-[a-z]+$"
+        - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+        - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
 
-      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
-      - enum:
-          - qcom,ipq806x-ahci
-          - qcom,ipq806x-gmac
-          - qcom,ipq806x-nand
-          - qcom,ipq806x-sata-phy
-          - qcom,ipq806x-usb-phy-ss
-          - qcom,ipq806x-usb-phy-hs
+        - enum:
+            - qcom,dsi-ctrl-6g-qcm2290
+            - qcom,gpucc-sdm630
+            - qcom,gpucc-sdm660
+            - qcom,lcc-apq8064
+            - qcom,lcc-ipq8064
+            - qcom,lcc-mdm9615
+            - qcom,lcc-msm8960
+            - qcom,lpass-cpu-apq8016
+            - qcom,usb-ss-ipq4019-phy
+            - qcom,usb-hs-ipq4019-phy
+            - qcom,vqmmc-ipq4019-regulator
+
+        # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+        - enum:
+            - qcom,ipq806x-ahci
+            - qcom,ipq806x-gmac
+            - qcom,ipq806x-nand
+            - qcom,ipq806x-sata-phy
+            - qcom,ipq806x-usb-phy-ss
+            - qcom,ipq806x-usb-phy-hs
+
+        # Schema matches also sound card nodes and its front compatibles can be anything
+        - pattern: "^.*,.*sndcard$"
+
+        # List all used generic fallbacks. The list can grow, but in practice
+        # it is not expected, because specific compatibles are preferred for
+        # fallbacks as well.
+        - enum:
+            - arm,gic-v3
+            - arm,mmu-500
+            - generic-ahci
+            - jedec,ufs-2.0
+            - mmio-sram
+            - qcom,adreno-smmu
+            - qcom,aoss-qmp
+            - qcom,cpr
+            - qcom,cpufreq-epss
+            - qcom,cpufreq-hw
+            - qcom,dcc
+            - qcom,dwc3
+            - qcom,epss-l3
+            - qcom,eud
+            - qcom,glink-smd-rpm
+            - qcom,inline-crypto-engine
+            - qcom,ipcc
+            - qcom,kpss-gcc
+            - qcom,kpss-timer
+            - qcom,kpss-wdt
+            - qcom,mdp5
+            - qcom,mdss-dsi-ctrl
+            - qcom,msm-iommu-v1
+            - qcom,msm-iommu-v2
+            - qcom,msm-timer
+            - qcom,osm-l3
+            - qcom,pcie2-phy
+            - qcom,pdc
+            - qcom,pmic-glink
+            - qcom,qce
+            - qcom,qfprom
+            - qcom,qspi-v1
+            - qcom,qusb2-v2-phy
+            - qcom,rpm-proc
+            - qcom,rpmh-rsc
+            - qcom,rpmcc
+            - qcom,saw2
+            - qcom,scm
+            - qcom,sdhci-msm-v4
+            - qcom,sdhci-msm-v5
+            - qcom,sec-qfprom
+            - qcom,smd-rpm
+            - qcom,smmu-500
+            - qcom,smmu-v2
+            - qcom,snps-dwc3
+            - qcom,ssc-block-bus
+            - qcom,tcsr-mutex
+            - qcom,trng
+            - qcom,tsens-v0_1
+            - qcom,tsens-v1
+            - qcom,tsens-v2
+            - qcom,ufshc
+            - qcom,usb-hs-phy
+            - qcom,usb-snps-hs-5nm-phy
+            - qcom,usb-snps-hs-7nm-phy
+            - simple-mfd
+            - snps,dwmac
+            - syscon
 
 additionalProperties: true

-- 
2.51.0


