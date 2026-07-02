Return-Path: <linux-arm-msm+bounces-115852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K6cmE4wVRmoqJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:38:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D863B6F4453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uqt+DPBq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ccmGrHiL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115852-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115852-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABDB830000BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0019C39B97B;
	Thu,  2 Jul 2026 07:36:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79532397689
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:36:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977780; cv=none; b=nu4OJeq+finLZKx/rzfJwKAKo2naq/rggwuwhIbgePuGFyYczRt3RhoqTInNCF/Ol03yjv4qhoEwbqFQPiNu/UgRQdhpER/NL5dfrq/4xEckXBUwPUmYuDVvu07ezdjS1VDOF9Zcsh7RpTVz9Gh5BorXLJTVmSpVOaqiljRqlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977780; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1ePDtN8ULFH2mfvKyHqfdZMn+6BbzpqfcpuoYHWdufl/hMkeplIUrGnJO3h1K8p32EVfPOImZ4xl29ntA/g33rfxBLMzxUzHinoGdWjZvB2xxrlU99BdwiLDKb650mvsb0g2XRqYf4gCraPGY8uiSXAbG27wOUIt4T++1amq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uqt+DPBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccmGrHiL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KYBr2917613
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=Uqt+DPBqPVjQg8Rh
	O1c92CKhiIB1D31zY5kMDb+gysPIpFIzQYvUicrjJX6YFkkcQFdUyEvYTAVZX+d+
	xMMJ/lnhEzPXZs6/hKyfbxOtY54STqaRSmSOREu//e1BxW/KGaBGbZJMdY2r5FeT
	FY7D1cA24uGcjkZLnO7BdQXvWLRzmPydSgrsPWFZqhqo7v1pGlB9Luy/5cDmnkq3
	nPEqGTI25fLDAlGmj6VTfDq8fXbyqe0rcPlDCFxDQhhgyyWSwLEY2c3DznuMO9LW
	cWEbrGZ+QXqPaXWupkeHJFWrKsRCT6JhOtEXA2xjbZQiyaxEnEwRxG8GeuseA4H9
	BB66Xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0bpdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:36:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso2381395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977778; x=1783582578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=ccmGrHiLSZa83X4+Qo41pRR9tDo77hT/bhqKEFKK2K8D2jGQkPadqBszmSLhuV/8to
         x3239opp8W1amyYhDLpiSWABtkIj47r2ASnRdxklDv0gBeIZYnpWoiHFSuHxcCZHIOsT
         SEHLSCrlADl8qndYukpLNaf1wsAhis+hLARkVKtrRvMZ0seS8yBirf3hNJduFCQgOmdG
         gyYzvIMs+QyVpH4U7vddoI2YBOyA/qVnXTSxca4hzlv0vnqKO3uxAzs4ElNrygYa5UsJ
         SjXLgWqqFp1y0Qbq+7s32gv3OC8tFui42ZOHZQurDqd6tzQcxRFQ4keEZ9KgAqXE+3Pp
         luOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977778; x=1783582578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=PJVdzZ5SYS2zj8+XuWU7bJ3D6BDm/GnQT/tPprIW1P7RmzXXDCJe/u+PWYoM8h7Wvs
         AIdnHzOKnwoN7iByb0YKeOt/w3OCqQcYBe/iAX2ra3ElFkB1bRSHZ8ZP8VynbJXux7qW
         GJkXNEXosyqyGyb+jcSwXTsZfFKOvKooZTKZnZtBSrBWSc7k4BuW+7t7qHYnrRboeHEL
         fFVjdy5XpU1hv3QONO5rjfwpA77aMn2rlOnGzpELCeMsidT8mEx23r0ulwTNhHEE8r7L
         ucSsFNMw/EQiaCixfJifREt6LuO1JELrZKg9ecuXJwYG8AXxK3Pcbz+wtz28PB7Vk4oX
         lPjw==
X-Gm-Message-State: AOJu0Ywts5wrokKx/pAkfRuXTTmmqQ5VRwHY+iqhQtQxEJAqUp02p8FP
	JLbBqA2VEGQNv0USr1+cmhnzlI95Eg65DSs0AT0AlVI7hu+F4odpYO6/tJ3Il4srX/H9knbd3vX
	RrFjM8PQIEsNY+v8EngXawfaEsyx/TvI//0MLpoLBjqCVVkgFZWj/lDt3l3x0mRxaa9mF
X-Gm-Gg: AfdE7cmTEqiWnL2vMohBB0tSvndVsaYokg1qTwkIwg5eTb0kZa0PlEKu7ml3luNgyDA
	4NBKzImVUlk/WEuGvAOnKzBKvfK+87HZIMEy0t/6IFpPpNvhClUU5tY9sqv7F6Zg/rR3EqStd0f
	XqxwZ6snBgWPUt63vxvgJqR8HRUQUmAgXWyrw9DNZMXBl6X3qL4o/sxoz0e/3eeO8StgCQtbYz+
	ACq6OOe7Bkd99koepaiT+alvJxOWX5vm4j0CYh1U4wQgvx71nZwlE+UuDoSSahoyovIu60EqlsD
	ylGUMOyHf5T/z6jz3xZQ3NsbcfPufhOfjM99/M6mcyKslJ04erUdSQRSnJLKQ4zASW7EWoIjRSf
	g/vXrDKg056rmx6VX8+1V4jHZ+3zT3i1YSNMgirMSBOL0KyjHLcw+ptyGQA==
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874855ad.7.1782977777924;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2ca7e6996ffmr39874595ad.7.1782977777321;
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:12 -0700
Subject: [PATCH v7 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-2-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977772; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=7wmyaXZcZxqklH289+3yUAWAyBTcA/URY/dEc6HP983ynw686PNOtey+Nci3MJoHFab2d2rnr
 XRG24QenDklAdmc2Pg3dXtg72hvMVytRSKUbakMu7hSQ6RhIGWGC7l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4614f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: BRH58YSSPCoBa4dMnqypvbwjOAJbcN38
X-Proofpoint-GUID: BRH58YSSPCoBa4dMnqypvbwjOAJbcN38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX/oiY532pbIy2
 n2txfinKrwUqC89myi4zPv3BDQRxP6D35+r1CtO4okG63k6/fJW9E4l0yphblCBw63nXw+pNR3F
 o2UnSiUIy9Jj7mJJIZZ0iw4/Jg1c7KBf6Vy6Ach07JEtMKSKHQFYtAeE+nsnkZ/BTL0NFgdwzUI
 FBIxvzcCd+1UEHZkPwRGYrgm8MbxJOrGZkLrnVDr6ATSnckD5/fSEouI4wWqDoUbM4yGNrJiTpo
 GxMuC32wRD+1mQio70SEA+Bp7O40LOBowG0h0yRbXBQEs/bXguX3aknNJzevfriypycOZclxcnQ
 Ta8FFW4bx7PETM4f1rNDHCQMghyWrE26xq4BXOZAZ0oAk/xVUh6bphbczv/qkH/8lk+wSoZMpRz
 +j1+xTj+F++HcO8sQK29DywRzIXk1/8EtNs9T4EHTlkU95gRUdwfbgbh3PZsCl/lKsOtJETz1A4
 uW8The+8xnKkr4vjWkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX+4zFZBVKghGo
 F1uHpzb3JVFNcpji24SRlb4c0vu3rvcIqyO3TPcdOmcPx0I/D/LHEpcx/g+6gJr/WY+d/7TfBGy
 qQs7QSFSYcwHJ7uUT2CweXP5viSa3og=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: D863B6F4453

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

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


