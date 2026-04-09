Return-Path: <linux-arm-msm+bounces-102549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABx9G4wR2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9503CFA1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C50CF30252AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3A83431E3;
	Thu,  9 Apr 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHF+F5Lz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtSH0i1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D233FE09
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767904; cv=none; b=V4QKUP/42ZhIYyXSvO+B3lI44fmVLCwQsDf2ncNFRhJzn50xI2KaB5KOiqBd6Y8j9swIV09MncIPI92pzEehOh/+1vdMFzD8Q1zNgX55qAmy3ttL3f44uw/YGVHJpdrpAjv/FLTJUcwyYQcsjapxCMfA4CnZUGqH+A+oNmKqHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767904; c=relaxed/simple;
	bh=kw5p604sbjJFeAivMXaikZg9U9dbYF+grAyPdCKJAL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DE4S545ugUngoaYsLc2+ImWwTkSOOJ0tG3VFVziHcWKpYWpT23HgcSgSmLzKtfwlntbh5d2So1IfCQukAeUp09aZFn36kiVK+vrFfiaoehhHOALG7XA35bMc9kSFJ/c79Ypq9MnzlBfDgh1o1qpV3lEtUE69MorYow+fVz+okps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHF+F5Lz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtSH0i1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DbuvD3934972
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=; b=jHF+F5LzuamBqyxZ
	Te9qE/PXcVLCfpQApZ4glQmFVp0DA5oFliJHyWCNOzuyP/tCqEt4veZ+cTqCDuvB
	9e4SLH2M2MuPhCXT58sL8MpW7uytB3M5B/ucRdmgnrFHfuGuEml67KTOYZTDpLv5
	EqycJ+Lu0l9lcMTKIksHMRv+q/dYFDZibBvVnYe3U3ig464b4cnLgv625Mkj7V2u
	dPwgwJd5pGh/lDwsH6w9acItRMyBh1SyhOUoNLqsq3W+VjJSfRPpnRF4uZhrWjx3
	WwIyj1Ldayy6f1eS+q5wKACqsXx0759VURFQhkBJOxxRzWYrFGDYPj5ANP+6b9tb
	VAqtRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s9g3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d3a617ad90so3810369eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767901; x=1776372701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=;
        b=UtSH0i1lZ0l1AmRZ8kUmfQsqOhIRAT7eVm2yuHKU7/9zURJp7jqgyuYJ8JppkdzyyY
         9M1wMSB8CLjgLChqRCOAshFemSTfHmmIA0MJPY5OaU1mXTPaUYVOAv909nrMdeUVXJ7l
         II+5tSExozAp7+w+pMhBSAeCb5JSR1ahCCQVTERvo2oka05CiVPsoKVRFUFVwT62x5uV
         UedtNVEQIGdA8Nl2EyzT/mvu5+aZ3/T2xlMKYAcdkMv8WdonL7kHeFT5ms1PtTd7Dp4e
         U2yLjZ5o+tTiR4m5dRUdsfsYD41Zbi7Hmph99xT3j4qvV6IxmsHFTroPLagXnUttWuFY
         +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767901; x=1776372701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=;
        b=Q2R2jyGwxxFruew+uoRfSXnwWBAvktxldvnc1y6VzGW502n6wVa2eIRdfk+A03X1pV
         WmhstoBVKNUM5X/4DbusAVzJahpQ728tab1hpAnue737i+XwETaE/0oWH+FKoIlSozIe
         DP7cqSpYgBJOyLQDo4D4Cp8IlW2xoA0+NCa013Gzwxs0BrUyqnhulmmNtkh+FDuAyPuY
         Ko7XbNuYaAuyATe9EVjb4OGXBrnqjij2GkBwfXsmfeKSPHSf6wjTGF5S9ZBW9dLD1yfq
         ArySUXQ1bKTcEUsKdZDv/Xz8tjHJvwuFTHsTTYc6VJv+e6hPBafKAePbfKZ/53V7ZF8l
         B/iA==
X-Gm-Message-State: AOJu0YzGPcK535ZRG0iZ+XY/AJIAs9RVKAgUjguGSDIwhm/qHkguyb9v
	EAqC888MOyBoG9ycph9nMOdaphkFmHqTZxx8DILeEExnWD4wuxouLHFS8b7l4by8EHYZZnqHNvc
	CggtoPh1Lm/T9k9D9aWnzER/FWV66SajkKyHWb5FV+FRMQtKWb9LhBad9ec9B2mRYINyX
X-Gm-Gg: AeBDievI4OLehKm5o8ZOVgbTLSuf56nJVK1W/7sMaHw/QuJQ0fMpp7VdAEZPDl+CNQH
	57fB+MCrnyt+NAccT1jUQeQWSX0zn6rTpkjQgPWKZli/atF3dmoWOSNF150g0d16IxQ/wqB9W/c
	r1VdumVyiSIj+5loyVhijlF8LpjlYN9KrT4NNoCwFmDnforHOH2cFj+116B/Jspg1es/kUYr2/6
	cozJpnvgjeUlQgZ9/mnxQctHbV5jai1m0F1W6cI6huFKzikr6M0pLpCtoA61OAhVk2W3c14BK0d
	A2zwNUbgvVohKWA/foBp3kUSHxX03DY0Q8K/e2mcaxULyYbE7RbIwRH2DHgrywv0Ds7cYAfJmpp
	uxOdWAES5Ke3Rz1R9DJbJxcSbxjP4/PhEn8Artno+pZGSJzI42ch3CO0r4fvq5Hle1HtJAcp4NV
	EK
X-Received: by 2002:a05:7301:6788:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2d5873b3c6amr406681eec.8.1775767900755;
        Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
X-Received: by 2002:a05:7301:6788:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2d5873b3c6amr406661eec.8.1775767900210;
        Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:36 -0700
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2021;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=kw5p604sbjJFeAivMXaikZg9U9dbYF+grAyPdCKJAL8=;
 b=4pD13kccQfxd6jgzeZ0BBw7DCR4BkeKryU+4+rINs4J4HqwrxtVOldRrc7ns0eTDXI4fOB3bI
 M6kW/O5oumjAJOgZoi5a6x/Z4FMIFLk9nOoARb8W1soJCyOfAbb87+R
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: A4qthkcuHvOTpN92QefQ2WLVxqS_e-Cy
X-Proofpoint-GUID: A4qthkcuHvOTpN92QefQ2WLVxqS_e-Cy
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8115d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GhicybczBOgKxo7yvssA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX6eX8EQcQs4lN
 tvIZ0yQXHI2EdOcYLXHceOVzat7EUvKNoFVw6a4KRJewpSULAsKxjT+rdJXvmc70Ef7ipI7Unra
 YAxUV80DsYmRnyWo+TvVddNAB9LkQ3os7q3FvzfK2EgsCpjqCwMBcDxmBHhIzrCPJOiBLSm8qeg
 uMUxHS5uMYCbHVQCaUYgUzZaK4AeG+z1iui1wYWqGh0RZCK7OzGb5vuXamAouzsakrZXojdlsCf
 L1CuzkadzFvih44k7igahCncN27y1S8Yedak4VM6FzdeDMXwEk32ssfNTZboqG4EaHEvfo+0gGV
 IPhTfYh44ojOPOXSFNf94tnlRgoy4MFGDb462VXnmflXk7cn3G0buRrKH/wuqapJeXfE1BAYJCL
 FoIJ40RE+44Bktz16Cqv/KpGU0KbNOdZZKdEtZmYSaQObuH4Mf7Pbcxtq5ul9MryWjzSLBPniPB
 xH0OotEFG7UpxPpt96g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102549-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA9503CFA1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for TCSR clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8..bec3d8b4c70a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -27,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1


