Return-Path: <linux-arm-msm+bounces-97415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGu3Isfns2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:32:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB412817B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6887303ABC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468112FDC28;
	Fri, 13 Mar 2026 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5RQfBbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjYX2+Zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D4370D5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397914; cv=none; b=GoF2AfffWoFDvxwtDSDvHt8ErrFngpEH8+3SsAHsXPFlSX2mM6FpaKL34UzfjHAonRXdsNVwirC0b04N/wlvIQeE+x6vAyZgbg7JzpEo4OM9RXAQMpfeIrzOm3pMzctVRyOu2apt/8l8SpZKGp8MjQyCiHb+HZv1ZO6PbHMos7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397914; c=relaxed/simple;
	bh=ioU0R5DvWAxH3BbtVQW71w1R9pFivjF1xgNCOqTS+Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emCwZNTNzfPLAH2BWjvnjb5XTl4LDNO5AQ/FkZzqbDyjWWQwuhN1o0NL91+hlYOi42EnverrZzv267OcEHK7OE+i2ShacByh6azVi1H5oeAVjHXx19nn9/XJsqqQQDBhHLVKfSjHn7I8ybcuRTvi0vVj4gb3Xxcq+xgCMM2KPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5RQfBbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjYX2+Zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8PA481447
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=; b=j5RQfBbCVBIxwVTi
	sC4swklYBDS5ka1kbFDUgR08DNZLssDAJ7s09tk1JIsimBPxJRzrtYRyd56P0qlK
	JArebeQIeTNPOYPxbpo/gIWxM/8NxXYKyHnngRW2+tj9H/gGlgIOb86aajkqqfvU
	pFWsjAZtPhGViS3n1O2+Al4Dwwb17s+RGvU+Eo89REIK+xUgkXCvTLMQkvUwXvrf
	DUaY8BIkCg5SviDM58/vbzCXPEd53kDcy0VvuHmB1cWWQ6GvAruVo42LhjHu8+69
	s2ciN7kk19wR5u8qdKxSo29l26uUuvJgmncnNVW7BXg4XTC4kEgg2v+vuj1iG6WN
	flW1EQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rbay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a1a752191so1410141a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397910; x=1774002710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=;
        b=NjYX2+ZhznnIWa1g/Lv1yzIGqN+LHm6PEOx/wSg5BnHJRkaZdX4Y1M2NVYX35bKYXo
         EEOIA9IOYCmLf7vwwIeSMbllQFLC00c0Jw1S1kV3SfqQH40/FLYACmrsvDF4pNOgJ4xP
         ybcywr2phLeAWOIRvocw1DogqDgFzt8LlbXp/0MqxtIte68jDBzn+PV/TeKR01W59ud+
         r7hq50cdX86MebN0tiPOItYhLZ8weT7FgpR9q7Qv00sdeqrxsR0yorKNVfjGaJM6v2mn
         hXbfnfBstGudxzuDz1ZqCbBuFnoe4olGdtNqurMyvABp0UmpgZxOoyZmgd0RUuGWHrHx
         5ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397910; x=1774002710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i9qisWVnXG0axSpKhRaWffp9loppOSeVL6k4KPV9VJM=;
        b=j5cx4UJ0FntcR2yZWtep78279Ty/wxDa4AXvfe2dWthFZRPs+2CTU/lPWkd3S+qSkX
         DeNUj11af+VcZQQlglzT4mAUL+mvICtrt42ib6xA6QQTE9VUycmY5ErH/WUWiZEdNqON
         sXghjjsgqPmZ9kHkyLzjuPzjHEairwF/VzlReqDmJnczY5LMjwsr6BjErjzYglmDDf/7
         G8v9UjzbAoDhJHfdxxpKay4GhRd2/M6agUrevh2btXRxYC3LsKvD1+eGwb9+5UliiHYf
         6L/F2e4L8X8j1Y1fQFua2EmSZT+8XkJHfFMt+wiBOc0pMRBQWpqz5OUO+QzlQTTUAYnA
         OZ3A==
X-Gm-Message-State: AOJu0YwIBhxeSf7CnkyX/mu2uixf6wxs1w0OP5HGV3BebhNIQ5hhXhXe
	s9IMKFylNt1v6WdQMF11sZnin24oIX4CSNn5V1i3EuU+Jtt9CnrJ0wYD79bdBUljBCXku9NOblu
	UHMem41ft3Flgd37D3ma4/l5iBt31WJijw4IUs/zCqHVwq/HnNlnNFIdX7OMr1PnFfQbp
X-Gm-Gg: ATEYQzz4ewTzfJWtysOp/ZBSROEYTCOszZZCcL8SaTxbp2MF9h6X6SRbcWIx0hLoLYf
	bzoBJ/9uy8yUT7ceUIn47mmbPoTpGUDs5VMU1xrL3wJKdOHUM6my0D5uvNYuHuCzl0xGt2gd7pe
	bJHl0yMxWVPUmM8QGINfjwUKrnTMuSW8G40T8FkQWI18XP4w4xS09/SRG6zv3I8Jw1/4oi2cPOK
	skCOBSl37FfIJz8p7E3dEvcIcCxAzi1fp/IICpps+TJCXdagide53D/8UGWaNs+LfTZDHtksgwk
	/8GPmN6G9MeugYb7SBCbETILjpW9W0La2UDU5awwtP7sY+v0sVGcFw0O3IE7rsvi10wTYwhqhOZ
	zwvorj1+o55hvM1mtFbVMEPZ7oOE4eVqoAu1x9Julncw1doaD598bNLdTrEnaP3BhH4F9+0gr5r
	XxzsAGqTI083hlXRuiOsDgyra9GtHUs844/w==
X-Received: by 2002:a17:90b:3e8c:b0:359:bb60:9b7e with SMTP id 98e67ed59e1d1-35a2200344dmr2521950a91.27.1773397909816;
        Fri, 13 Mar 2026 03:31:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8c:b0:359:bb60:9b7e with SMTP id 98e67ed59e1d1-35a2200344dmr2521907a91.27.1773397909300;
        Fri, 13 Mar 2026 03:31:49 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:48 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:54 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1323;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=MmynX+YUKCI48fsEMucxFayEj5jtotLLwXapIGwI67U=;
 b=Mp4Qx4HrGGfCTyYoK7rpV50UIVbEMWUtIiENNJVoqQI2UqgvOTMkzkgrIvvwypN/Nos6IzPY3
 pd+rOV/q41zAsRSClDmOmmE2FPbEgYlIbXWVVuE+oh3y5vk1q6EMWPY
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: elv8z3nYm4nKDyb4BPDCURFs80Qu51iG
X-Proofpoint-GUID: elv8z3nYm4nKDyb4BPDCURFs80Qu51iG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX69mOSq51vi+v
 rhBQwjCXLLZnxMGLLosgpdPxEtq3YnkhxaHoAGNHGQ+dFUqDDgCaKMdTofGV466Npib/nd5C3Ed
 y4QcXXOFzvoTMLRwq/FGC4IV//ZNt80jgkup04JeIh810J6okcaOEC2Y/G+lAGgaD1hFQkwhdZJ
 55sCTfRof16YPr5Kq0HZeSCYIaF9mI9bnfE4p7sRrwkp1AUSX4+A/oPVmeAWEQSF3XLTBAFCsg+
 CM89GXAp6tm2gicHicC6hLgAr66qjcIq36E2Gb51FN42glzC3J3iTm+SwdPKCEgksETV57Zy5ln
 aAY8GHexnkO84uGlIyq7qm25tnGy+uIze1DuPl1H1glpuImFIBxD8PCilZY+WKBFACCOEyB9dTG
 mYhDraYvVkKHjuGKujnRLma+L+Zzg0xZXDVAqGWyLhLl36Ld7gSXao6BtOYps/GT0NH5SJHbu5e
 GuF5hsGG1dWVfFDlCtA==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3e796 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97415-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,4f:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EB412817B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..d523e7cea3ec 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1485,6 +1495,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


