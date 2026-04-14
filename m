Return-Path: <linux-arm-msm+bounces-103129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BgYFsMn3mltoQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C583F9790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB854308DD7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6E43DD510;
	Tue, 14 Apr 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsSHzyYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiVVu2pJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84C3DC4B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166616; cv=none; b=oihIORrKrFG1R4hZF3dFy9B71z4AUF1RqFnRtz7LonCAFkLDmA73Zr7hkF4Mk46ECYIb4/ygpETgIRB0yvMoQ//wM5IwZ7yVxJkqoNarSgHkiHZFK9XoGExJVaAOJRLmxqhPB7Z9tybwm4yyMLvFzUMTnROwQYQBUCFX25P4haY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166616; c=relaxed/simple;
	bh=cDITcqJjO3tfGvy29MPareL3ooXDu2ND/xMVYRrrqYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCCIalA+Gxu6jHWT1qY/YJsgyhrwyK8/2zQhu5gtf7c7X3ByNwOLBz0MT3nDlOw5dEAH2gYw7NQd0cvo9QP3+Y2H0U2vYdVR+eIpwgVuHKTDvW+YrvgNZDNxtI3BQ6ZmjIIPEU1tyQcWdDLnBWfLYSEuTrczf4kTwt614+46ixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsSHzyYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiVVu2pJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EB7JOd3681501
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=; b=XsSHzyYvGu7C/PUB
	KaT1m++4x7TrG7EgtTSRRXBqWGxASWn+OlFZYma/st5fLckdnqLfBBN0duEFO5Ts
	ZxJJp2ElR+yzIuxI1JdxDynXRF7ZvvIovz2in8g/HCJ2TIUV6ZBDnMdzBuyJsAHz
	TgMMD7OiEOcAM9Ha3PA7QKg/Ni4vXAe7CbaDP1ilKAy/KROG2LHljKrKyYQnv60T
	F6W+FfBjpGOxNjgEQaUSdYEcvuIF2y6JgEF2n4Zh9/lj4d4+4Yshd+c2J3Lo3D39
	A7xEoLIgqPTFJ6TEp5T0DxkCFO6bc1yZschDi1xSqI0tTuwq+Xu9FTwdVLvp98Ls
	sp/WXA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d2gm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso11924050a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166613; x=1776771413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=;
        b=PiVVu2pJ4gMuF+4astzNO8pqCnBWc/8Damb3MC8oIXnfHJjeOlseoQGxpUSbpzp4rF
         M7fDXmUL0VeF0hyng4za/z+XCBt1AizLFryKVosRxyWRp1o8qz7rkaDmqqHHwbowaf26
         8QzW5rY8BBr7An74a/Jv3NDgLtdEj+gfZ4xL8Ys0tdp7GDWS/r5gU6cxFA1cuDDbnWda
         3grHunSyvYz28g3RKdTWG4QLLKBkbYs+cg0b3fRNyqyckVTAcM9NIdP+KHVKVVgm+asR
         VXrbnhsK0iHmCmW2hHB62bDro6wnoXrW42//7mpMOOZnMo2ywy08EwJjPgnzXdxxKaGW
         VaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166613; x=1776771413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=;
        b=o19R4z5hr7R/WOgGl0y/IeqFsg2ibRpMETvnQ+baGPqWq0r3jEPk+euJSeC9IXoxzF
         M0oq8n0aHWj9v2QxzCBzL7tnRPyiwHDi2jIwwI9unccJujVZaJdVu2r0b5GzH/NFfmBl
         iiTqMA10+8EHKnrkq5OqPnp9Q/VN8OWrN+FArvo8LdROdXiagdA85kDMeubsW1wZZz6G
         y9NAaZd1vP7STaFQeMjPk5wYz/4AsJ5w+2xH3G0Nw0FtH5aBpheq0R4yDW+67m4k2Cea
         BgsVtaluuD3fHZwBr1YtNkEybtL+Hghg6wHsHVkNAv9ksOnqA1ZZj3FrQujrCZ2d+dBv
         oU7w==
X-Gm-Message-State: AOJu0YxPmWZTmB9GCpbCgqfiLG60YVcNd1lRBR0/914y6gwKucU7OpDd
	dDBS/Yd6OaS3vVcPjCVpY+7vguZ0oVPz2wWi+MDjP8dptEH1oxkvUTateQnfS0j+o7GADBiCRgR
	JnMA2YBDng3nQ84ZgoyQGlGkpGbDFNpGVhMrGZx5/pC0OZJzCQCrqJa7pqR11MZTUc65b
X-Gm-Gg: AeBDietkJ21JqLaQnjC5XfCKsWdEyzGOqWBFKZ8Lcx309s6dVvanFfb12QD58c3AeJh
	xV0V71WgJ3HkzCmV7JMVKmuO8Co2qMhWV4T+KWyqw3Z/niHRxxE4OjJ5GgKFSXzWCZnSUM/QwOR
	ilqSDZiTT1KVAyRiZMc8znDYY9pC/fdm+yhOpRvCbZKMLKFF/Omby3mfM+LEdnAUFYAhkbB9UX3
	i5/I3M/s2vUF++gvzPvr+ff8ITyQ9HGsvD+o/PQHutCLOCWqJHjZtEXJ0/DcpTHSDDr/jFvDSib
	SSr/Xp6UX9leuVS/SyLMfgAAf14fTZ2nXOdQLBELcW81omjrTdVS1HLeJ4M3yoFF8MCZf03ft9P
	8cN7o+34iSuMD6dV+hO2G2QR2R+yd7AXyoNpxWxtgTwwTqUCWjFusFOSo4TkTb0oF7rdCZezhY/
	3kZZ2RoRDw
X-Received: by 2002:a05:6a20:94c7:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39fe40573eemr19633250637.51.1776166612988;
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c7:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39fe40573eemr19633212637.51.1776166612428;
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:05 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-7-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166581; l=6600;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cDITcqJjO3tfGvy29MPareL3ooXDu2ND/xMVYRrrqYI=;
 b=mk2mBMcpDUOcltHTuKAB9vHydXuvHSv85WJ0zRPYbE7gAUUDAs+9GGhjmKB2qaNrwK2exR98J
 NIGN9Ceoh5nAEOczvxBc40WH+SfFNGy1t2FBSpeJmNhYH62+q5XVrCW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX4MrVg9YunAcQ
 zt2cHXxJftRZkTsFYv1FkDdi1vt73aEQ05gGZPuhLkt8jWWg4Kqd5Ksr49TeAGtYpvbvk7hRmSO
 C8HhTM2NRHMIGpCdlPWVTEelBUMCNiarzAtthwNj8h5sYZgyFTC0v/Q/Yuf4sFfQW60YRggtGps
 R8k4QYg3hzNAWZEmN8u9G+A7bqp2IisND0Xjb15LQlwfb7YyIX+f0GYredmasXtMSYjKKn4ByaK
 zpmFy0zYUt/p61qJwJtrCth+n8a99RBpW3bJX0o3dnJZ5w5cnRkP8twh0eQBc3sYsyZgJ2z596t
 gSHdqmSXUg2GRZroAYMMfrdI+0A1REMvZLpYCyghGazWnUXgvjOl2WVgtpWaH1A4tF+0fPi+UHs
 J2biIpu5R/j03wqzwTnrOiyXVQdW8bCYlCMMzcw3a+pzDI2xl3dFFBBgl8keDjDKQFsf5Jk+Osz
 UP16h2mInZSdP+B59+w==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de26d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eAkPLPy4D2IjGqfRhJEA:9 a=mIL_gL0YBkbNSaF1:21
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EBnboysxpmBk7N_GQjN4Ya7KiuzVELqE
X-Proofpoint-ORIG-GUID: EBnboysxpmBk7N_GQjN4Ya7KiuzVELqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103129-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7C583F9790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the hamoa device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..f10af9db8bd4 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6882,6 +6882,7 @@ tpdm@10003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -6939,6 +6940,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -7077,6 +7079,7 @@ tpdm@10800000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rpdm_mxa";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7096,6 +7099,7 @@ tpdm@1082c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7115,6 +7119,7 @@ tpdm@10841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -7134,6 +7139,7 @@ tpdm@10844000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_lpass";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7177,6 +7183,7 @@ cti@1098b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_cscti";
 		};
 
 		tpdm@109d0000 {
@@ -7185,6 +7192,7 @@ tpdm@109d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7205,6 +7213,7 @@ tpdm@10ac0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7225,6 +7234,7 @@ tpdm@10ac1000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7459,6 +7469,7 @@ tpdm@10b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7478,6 +7489,7 @@ tpdm@10b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7497,6 +7509,7 @@ tpdm@10b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7516,6 +7529,7 @@ tpdm@10b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7535,6 +7549,7 @@ tpdm@10b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7554,6 +7569,7 @@ tpdm@10b20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_lpi";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7624,6 +7640,7 @@ tpdm@10c08000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7672,6 +7689,7 @@ tpdm@10c28000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlct";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7691,6 +7709,7 @@ tpdm@10c29000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7824,6 +7843,7 @@ tpdm@10c38000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7843,6 +7863,7 @@ tpdm@10c39000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mx";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7939,6 +7960,7 @@ tpdm@10cc1000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_tmess_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -8043,6 +8065,7 @@ tpdm@10d08000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_0";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8062,6 +8085,7 @@ tpdm@10d09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_1";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8081,6 +8105,7 @@ tpdm@10d0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_2";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8100,6 +8125,7 @@ tpdm@10d0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_3";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8119,6 +8145,7 @@ tpdm@10d0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_4";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8138,6 +8165,7 @@ tpdm@10d0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_5";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8157,6 +8185,7 @@ tpdm@10d0e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_6";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8176,6 +8205,7 @@ tpdm@10d0f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_7";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;

-- 
2.34.1


