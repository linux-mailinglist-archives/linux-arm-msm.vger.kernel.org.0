Return-Path: <linux-arm-msm+bounces-119167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 37gaDfwyV2oMHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:13:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D75975B532
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:12:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GhMpDZVr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jDQbC77B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 337A2301CD0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0268F385519;
	Wed, 15 Jul 2026 07:12:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E1384CF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099543; cv=none; b=q3fxjjLdEKi8BV3sUMXS0WtOE97v/XygyM1/BEGq6ZglGl6O0+u2YU8Cq+koggWAC8m7zHFj4c1qsm+QKN1ai21/bmom98+E3ueGDY/Ihle+vcOu8L9+UlvRnp27W2bOkI4tm4j7/etDW+hfp4ydHzcQrcArV3mbkS6xM5XhPt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099543; c=relaxed/simple;
	bh=eCREh5g4ZSOmf9z9zczdSL9UnWZK5pubueFObAt3bic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BR5H/AGOL9qBZlsT/zywNE7T3b0BqUoW3OwVnYH0PChse73xFuVyLVngtnZ9MQxJqs6rgPZVmMizOulN6v1YDRpAmuJwVVPvdv20ExX5KV5h3b7bD05UuSwAZ1nIcxLM6LCQRUNYFTQUJ10sK7LshN5ZzwtlhzQ6ukrotJ5EjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhMpDZVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDQbC77B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lCoE2624006
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e1agyZbVyUiaHr+cxo64vYvBVmV3DDswQbe08Tv+fI=; b=GhMpDZVrMWY2SkiQ
	bykOYX7czIF+7p0cZUWBhojfiRh+39AoZmp/yIAI3jYdDTQuWbmJehJzzTIA0iW3
	GKRw3eBaRLzqvDMIanzWLM7Orqfw57Rq+eeSfivOyRTSTRm88Hrx2I3Fu9DyLx9q
	pFd9RjyQ/7FnRvlFAfyRtXwBi4pYQ5tfP+jGCn/rXdtiCvdcENDQJJQMC9a79YJ/
	MNTiJK76RaWM1TmcZIjw+sJUMt3omi+Xpjc8IVMjqAc3uR6TghYVLX7z4YRyD2qp
	XevqgT14INaTHfjc3r7y1VNE6Wup78bMRqzMvoXwnIlfRBHBHjopY69GHeZovByM
	pLcpHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnquhhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1863869a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099539; x=1784704339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8e1agyZbVyUiaHr+cxo64vYvBVmV3DDswQbe08Tv+fI=;
        b=jDQbC77BGcEXNQFVqkTZ7HU00H9QVC5uZOiqYBt5kXR2KrPpMlLY1b08y3BnFAxPZv
         nqy1T45dz4A6acwvSxBJ9kkClYfirRYql4C8hSJD6UfiQZ05v+xky5QtexZKJXKjSDg8
         OtW1IiVEOvI2kUri68YedW5QAZcPRd1/K0LoJiIY70gGEg8d72LA7JuEPrvaJvwZSLCY
         upgy6PttcRxoOwNjLz+Cd5/ydobeq/cN7TpBQt/BdPJrejqWCwNJ3OSDR+pDG6n53gsh
         hULkbLV481SWrBjKKj9nNaOTz7HdPEVV65lSONIbsKfnQnH4jXUmHZU0489o4maD8S4Y
         PDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099539; x=1784704339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8e1agyZbVyUiaHr+cxo64vYvBVmV3DDswQbe08Tv+fI=;
        b=EO8FQI7eOlCcRJ5o04yPrxrB0NIlgBxAPfCt1Ln+9VPbSs1JQ49fk2tF2HBq2OoxZl
         FOyR1qSc3ONjFCKdPmNRGLP1fhwjmkhoZgHjii8WZzbSJy8pSvdAqC58wI9Rz+f/fGK1
         NKpAiGypzCNZ5t0Zm6UHaYCBK3YwG7vM+mSrOU5AGrZVkDmBnbkAko3CpHKIkCyZah60
         iDFzelFZGGpclgx27yhokpGqHgmEt+fWP6FbyNv/4kSKN5f85l4kadlHjPY42lFiuNuQ
         dNIpR7MQAKUAvre/oDjbGxjF1MKA1l75xp5ir5Pkcy0xWeeJ2GDbvvOrrs7tc9JeOiXD
         1W2w==
X-Gm-Message-State: AOJu0YzoE3xz2rnmihZr/pPuYZH/cU6X0ESHYNcEXgIx+d+BpGP7GSFR
	MoujFA4dhXWJo4KZ3BGSuJLHR2FAIx6qmSvzMe8xkdT3BHJEaIY3lUY8Uc6QMkXWlHqNa50NO5I
	5O6wBWLIqa/vud94FxIK14i7IKBiXAUCyjpMtz03LNQ7jYauzVITTsrCAKAPrN7xs+byI
X-Gm-Gg: AfdE7cnLpOdyCl0PFDcBPb1aSfyLFL2XRrdOAR/1PsrlSOKUqK+xwnetulgd5v228v3
	npQ9wiYh5HbTaD6L0GXnDlqwGbZXCWV2BTqGUX/GdDlf2wPpdJJ2Ww+nmy2G79zxzeqfC+FMqRj
	gbeAR1POnAVc0t1ob4z2CANF4d6U1L9YCLq9qeFiq6bUYNeYLEJxaZ9IaUtlWfJtVNC52BXsyd/
	L0j1HAqMarEdtCMffyweHPnEo3rXNkUIMrZx+E+EJNvQbBGF5c4wm/oORkj4lOqL0p96K2eeBiJ
	eIhHflsafd6f7xV4mDRG1IXZI7qSLDaos7YtNLL40UUe24PakKHHz02QNuAx05siG08MmWUsspV
	qnkWsKBFVXRBrGwIa0r+CJjvSSKSzB1gmPOHtoZjgPGz6QifuZnX3ozvaLiKmVmH0noc9z9bF5w
	Xz4A6yDqaJomerT67zrkwwPsez41KpQF1DoOMPNr+9
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr15915607a91.13.1784099539080;
        Wed, 15 Jul 2026 00:12:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr15915578a91.13.1784099538550;
        Wed, 15 Jul 2026 00:12:18 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm80216146eec.9.2026.07.15.00.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:12:18 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:41:39 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX14UG7waX9PtX
 cF/cMCeMsQmLgv+7esP6mxYPBVZvVdTEViOLc/zrgZr9Ta5cLc/rL1LmsZ99GZFXNfdyT7llADJ
 HxUVpr9/YedUCD9RO6XcJu0xP1z36z6q6G4kuZYQ8dkJjmZ/kZ8SUjbufhmfT1j4iVNIZWKggzJ
 9lHyFaWPmv/7CKCI2yRIGfHLBraMgGBqJZ6Tw8YzWu0nkGTIjP1CWLNkHKBRyiJ9Fsqs5Q8YyUI
 KtHfYhKNfLs3foPxd22TqNwZQMV8v0MLalzpXccrou2DCIFR1fuyBFmBsw1QJheAE09CwnvTunk
 YhA611Kahn8cleiAxiFFfuGItc2m30NnzPLZBHTbttjrqDnMa1AQyQvmR3q45E+4rfb4Pt0muoA
 45FPKe99x+m2FJozP/ZpyC9Khj6oUUMH95K34+9bsoMgMT4u26UPUE3SZRja1chzH7qS5aLACI9
 wSxhW3T0HninSV9iXMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX3YJMNIbrVi15
 4c2epp3YCw4JEmO5XWu+v0v6vtT//GYJcCS76jb9uQJXsnhuImlk8OMOaI7rvwj8xtnDaxkkjbe
 VJJN9GCXtbuwGot3O6hs9WIJvrPf7kY=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a5732d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L-oS5-zLtgPf8eA3vCsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: J2n0Aczl1MzMDKbAxg1HAxMSJ87UrhE0
X-Proofpoint-ORIG-GUID: J2n0Aczl1MzMDKbAxg1HAxMSJ87UrhE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D75975B532

Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use.

Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
Also describe the CPU OPP table and CPU cooling cells needed for CPU
frequency scaling and thermal throttling.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 616 +++++++++++++++++++++++++++++++++-
 1 file changed, 610 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 20e8b240642c..69f36ed38ea3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -4,7 +4,9 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,apss-ipq.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -28,36 +30,48 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		l2_0: l2-cache {
@@ -84,6 +98,40 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2-kryo-cpu";
+		opp-shared;
+		nvmem-cells = <&cpu_speed_bin>;
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-supported-hw = <0x1>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -130,6 +178,170 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		qusb_phy_0: phy@7b000 {
+			compatible = "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
+			reg = <0x0 0x0007b000 0x0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "cfg_ahb",
+				      "ref";
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+			status = "disabled";
+		};
+
+		ssphy_0: phy@7d000 {
+			compatible = "qcom,ipq5210-qmp-usb3-phy", "qcom,ipq9574-qmp-usb3-phy";
+			reg = <0x0 0x0007d000 0x0 0xa00>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				 <&xo_board>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB0_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "usb0_pipe_clk";
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@84000 {
+			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy";
+			reg = <0x0 0x00084000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE0_PHY_BCR>,
+				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie0_pipe_clk";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@f4000 {
+			compatible = "qcom,ipq5210-qmp-gen3x2-pcie-phy",
+				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000f4000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE1_PHY_BCR>,
+				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie1_pipe_clk";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		efuse@a4000 {
+			compatible = "qcom,ipq5210-qfprom", "qcom,qfprom";
+			reg = <0x0 0x000a4000 0x0 0x741>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpu_speed_bin: cpu-speed-bin@28 {
+				reg = <0x28 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_sens11_off: s11@3dd {
+				reg = <0x3dd 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens12_off: s12@3de {
+				reg = <0x3de 0x1>;
+				bits = <0 4>;
+			};
+
+			tsens_sens13_off: s13@3de {
+				reg = <0x3de 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens14_off: s14@3e5 {
+				reg = <0x3e5 0x2>;
+				bits = <7 4>;
+			};
+
+			tsens_sens15_off: s15@3e6 {
+				reg = <0x3e6 0x1>;
+				bits = <3 4>;
+			};
+
+			tsens_mode: mode@419 {
+				reg = <0x419 0x1>;
+				bits = <0 3>;
+			};
+
+			tsens_base0: base0@419 {
+				reg = <0x419 0x2>;
+				bits = <3 10>;
+			};
+
+			tsens_base1: base1@41a {
+				reg = <0x41a 0x2>;
+				bits = <5 10>;
+			};
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq5210-tsens", "qcom,ipq5332-tsens";
+			reg = <0x0 0x004a9000 0x0 0x1000>,
+			      <0x0 0x004a8000 0x0 0x1000>;
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base0>,
+				      <&tsens_base1>,
+				      <&tsens_sens11_off>,
+				      <&tsens_sens12_off>,
+				      <&tsens_sens13_off>,
+				      <&tsens_sens14_off>,
+				      <&tsens_sens15_off>;
+			nvmem-cell-names = "mode",
+					   "base0",
+					   "base1",
+					   "tsens_sens11_off",
+					   "tsens_sens12_off",
+					   "tsens_sens13_off",
+					   "tsens_sens14_off",
+					   "tsens_sens15_off";
+			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "combined";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <5>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;
@@ -146,8 +358,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x0 0x01800000 0x0 0x40000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;
@@ -205,6 +417,89 @@ sdhc: mmc@7804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x07984000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq5210-snand", "qcom,ipq9574-snand";
+			reg = <0x0 0x079b0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core",
+				      "aon",
+				      "iom";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx",
+				    "rx",
+				    "cmd";
+
+			status = "disabled";
+		};
+
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq5210-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x08a00000 0x0 0x200000>;
+
+			clocks = <&gcc GCC_CNOC_USB_CLK>,
+				 <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
+					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			resets = <&gcc GCC_USB_BCR>;
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
+			dr_mode = "host";
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
@@ -244,6 +539,24 @@ watchdog@b017000 {
 			clocks = <&sleep_clk>;
 		};
 
+		apcs_glb: mailbox@b111000 {
+			compatible = "qcom,ipq5210-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0x0 0x0b111000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&a53pll>, <&xo_board>, <&gcc GPLL0>;
+			clock-names = "pll", "xo", "gpll0";
+			#mbox-cells = <1>;
+		};
+
+		a53pll: clock@b116000 {
+			compatible = "qcom,ipq5210-a53pll";
+			reg = <0x0 0x0b116000 0x0 0x1000>;
+			#clock-cells = <0>;
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		timer@b120000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x0b120000 0x0 0x1000>;
@@ -307,6 +620,297 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		pcie1: pcie@50000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x50000000 0x0 0xf1c>,
+			      <0x0 0x50000f20 0x0 0xa8>,
+			      <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x000f0000 0x0 0x3000>,
+			      <0x0 0x50100000 0x0 0x1000>,
+			      <0x0 0x000f6000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x0 0x0 0x50200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x0 0x0 0x50300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE1_RCHNG_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
+				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_M_ARES>,
+				 <&gcc GCC_PCIE1_AUX_ARES>,
+				 <&gcc GCC_PCIE1_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
+					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0: pcie@70000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x70000000 0x0 0xf1c>,
+			      <0x0 0x70000f20 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x1000>,
+			      <0x0 0x00080000 0x0 0x3000>,
+			      <0x0 0x70100000 0x0 0x1000>,
+			      <0x0 0x00086000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x0 0x0 0x70200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x0 0x0 0x70300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE0_RCHNG_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+				 <&gcc GCC_PCIE0_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_M_ARES>,
+				 <&gcc GCC_PCIE0_AUX_ARES>,
+				 <&gcc GCC_PCIE0_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
+					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		ethphy-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 11>;
+
+			trips {
+				ethphy-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pon-uniphy-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 12>;
+
+			trips {
+				pon-uniphy-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nss-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 13>;
+
+			trips {
+				nss-top-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 14>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu0_thermal_alert: cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_thermal_alert>;
+					/* Set maximum frequency as 816 MHz */
+					cooling-device = <&cpu0 3 3>,
+							 <&cpu1 3 3>,
+							 <&cpu2 3 3>,
+							 <&cpu3 3 3>;
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens 15>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.34.1


