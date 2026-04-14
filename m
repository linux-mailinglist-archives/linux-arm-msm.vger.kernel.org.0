Return-Path: <linux-arm-msm+bounces-103128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMGyDu8m3mk7oQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA83F96E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB26D301A756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13BE3DBD7E;
	Tue, 14 Apr 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLZqwxYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2Sq/WQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8253DCDB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166612; cv=none; b=qR+BELhyOv091KMfxZOt4fS8RD5qr9/Y88dTquauWRlFqehmWAiZrlx6c2QmYpOcVqieNCntal9P1j733LOxsRtOdl5AotNaqOaWwqxIf+rLrHppc2ZP/j6xAGQ/0RqlGG/xbRi4cyWMcSmB1C08c869DgUM90gVjNrrIpQXFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166612; c=relaxed/simple;
	bh=ZL+3nFFqLPdeNWxfeHBY/I4r3+jRGOT+dpDhom9JEv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biJn5zUF+sU8AZHf9vc9AdegsvGgwZUVAU0KfaweQ/p7uG64uWecOqoQPN8YTwefWSaeUWZkM3Ihv9rB6aF2tTbM4KnWHxqQITAzU8qkbWzOmG0C43A9QCNTwv5CrdjbHNBozaFoBkh5LCzHqCr8SUtpo/iLkn4mCQmauST+9tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLZqwxYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2Sq/WQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6VNTP3157277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=; b=aLZqwxYxzmTLOOFk
	jvLZH/nFuRGDash7sh5ReJ5sjWK0KSwVykHVHZqzUd+jybgZDLVT+RgUbAWvRVbe
	KBq3WNmJzONpYgVdOXJzVm9OOUEoZia49ArtUWqnYVuTC/ekBkWEFLWlsDLAFJ0I
	Byu3dYxHe3R5vnwzjh6eNIorSGp/357xCuK3SHCRl2hwlS5Po2ddEdn0GwE8rycc
	oOIwGE42EXAY8JxG2vdvES9BKWdCkoATOmzgicqKhTpfdmtj0ZluZpHI/ZgLqL+3
	heqeSBOI73afmoetrZywu8+mB8FnmkiM8O9PGumkTyo6HP9/hI3jDIbL+YrexpYx
	mfbaVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bafsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2754237a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166609; x=1776771409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=;
        b=F2Sq/WQLFic5gMR/wayrXKqD2BE0glbagJRMacaBugaqto0EukmkIDpuNY+PVzxQyl
         Ez90P/Y8c5US1WJxfo5t7XdbMGajr+E52y+UbiRPkrAwjph9r/Ld4w7MFVCVjI9oWzUH
         s8eAZFS2v+gpJfZqffGZWjSThbYzT4dlXiZk8icHR9JyfTD9yGefOiTUcJm4AH7M2cBq
         DnFY+MYM9RO2j6JMvT8qNuAq/d1L+trbCj3sgQD3oJBW4UTCdcp2GQQOlcwGZSc8ORQK
         nfuoZtR1tzbnle9hAHGvhs+xlHv2f3/FVUbQPY0v8VJ81rxXQNGtRRAoa+230B14ZRis
         XqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166609; x=1776771409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=;
        b=nAVVfnv2wcV6AkRygUywd5/ejjWfv9vmeJzyWgS/7iXzqIv01MwG/bhwneaaPMt8Dk
         NBNlWzp+2GVcEgftLuUVBS7rxNIrO/K2cYqjXCdb53//kcRpIfBXWx++58saKHlpkD4r
         gdsBBbeeax5xvOi67fnZkxc7rQkd9rNKjKS5Xkk+rDQZZMHwSTASPD5pxRoamJ1A3LkD
         fZv4v/LSGjHqhIgpbaij90ODddUAe3H3Zo4r6n/Ad7CYooSxHRkdwpKYJP8oi0r+2WoJ
         g4q6/4UamfJ7s55eQrebQyL9CVq7iI2cnG7YcBwjwCak5/xFyqM8Fp2NnEoJU22M2rl7
         2AUA==
X-Gm-Message-State: AOJu0Yy9r9UnZcBQzeUT6V9O+5fWrEm0zD9+8cbJL5QnKv8spDC0qjhp
	X1ovKWQpi0MqwTIYEdeU8f/c/1M3A/t/RBXDXmjDJpOHqggSuiYxi2KRa/9/JpOHaHWO4n2IGu+
	0TnSQfUaswB+FGUFmZNqy2yFBLbNAeVDxt8waPYehMT67StZXPQB9hABSo1HuMuk/T0rA
X-Gm-Gg: AeBDieukdloKWpEidiDCAhPb6VPsJsPxGU8JH11DhCOoXKnt6J9j7UHoYSnFYvpw97k
	uvQIWMvIRCYOzBthe2RaYcbtXEIV01CNYAeehKJS3J2urpQjF9UD76PLgFFva/rxlnfqrOoZ7AI
	5vdJstyhv8C1YYm7Nf93frWszN4XiI82rr0Xi5gY6lr/QEs1MDt8xhaeLLTk9G9t2JXDogwOOFw
	ULx85p0EDBIb0cU80116AwelfqQaVlvTRQ5c/KrnhxP9sWWSU18O29Yn364uYDWCFE6Vm7T8Qq9
	yP4og3zoSa2xS/j3+SbvHCZ7p+g+u30rcm29XRPonBml9RZvhKdWYCmKNA8+Nqa8iacMfruxRvR
	tyYK37qpetCL4zJbX9cuBM9VcBHAfvYRTyiGIp9xfahlEzMT2hhdxhNO2RBE3bDd+TockwHRmEv
	yxC0Yt/IH1
X-Received: by 2002:a05:6a20:2444:b0:398:9243:2ae0 with SMTP id adf61e73a8af0-39fc928ca32mr20603180637.5.1776166609165;
        Tue, 14 Apr 2026 04:36:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:2444:b0:398:9243:2ae0 with SMTP id adf61e73a8af0-39fc928ca32mr20603156637.5.1776166608564;
        Tue, 14 Apr 2026 04:36:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:04 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=5593;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ZL+3nFFqLPdeNWxfeHBY/I4r3+jRGOT+dpDhom9JEv0=;
 b=schOHLJUx/FjGMsYnYB2Q9KukybZd8tNTo3fUCHQ+N2PbFhI/Ye1z/FyDHiY3lc/Et5gPy9GS
 db9bYZEI9g9B4KWnLFehEoDOGhp08kV6A/CsbxpnA5DJHa74aJIF4gH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX+SdIPdvGvHvW
 rWc/Q+XyhEvvGLaL1UP8zCtmC/Uz9aoIg2Qdaxj3NpyCdM2WBljBs7s5ren+8wg0r+3UHAE+LPR
 Qy1IlsvRJE0nMBN5D34N9TXTXM/HUPNFokeLzS/8nPc8usO6G+h9nXwDTsI3WCf80SOp5gQFlua
 aUCKr8hQjhQZAFQjVfT93Z4ug9lQYg+YZftNgL2pMSUXrgfSjnR6dpyXGXoUASPhHaOMo8kDmDD
 5tGBBu5xzlaUpEOR8JjLroG4/A2kYPoGGuFka9LiBUXTFBqx1Wuj3+kk3v2fuNWGFj9YD7FZH7R
 4GwZ5qQlRaIl71ayR15huTvpdaczWYyoCxgKj7jHUQG8Q0xt139dLbst5PfBn2NaWTBKwAvVWj/
 AD4oZtuv5Jdqy+7Rz0Uy0FgQl+am26l+vwzu3FUlrwVRJc2YN5MjCJHCaZ8KmLWEm7ccMXborjp
 lN8dQD5XPCndrXbICtA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de26d2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M9WVcT1Q7LBHNZIDZtsA:9 a=_B6xl75RZ7udhtdn:21
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: _VIRziJ31k81HfKvV5w48alN6b57PB_c
X-Proofpoint-GUID: _VIRziJ31k81HfKvV5w48alN6b57PB_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103128-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCEA83F96E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the sm8750 device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..fee7f28e44e4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4112,6 +4112,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4176,6 +4177,7 @@ tpdm@10800000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4256,6 +4258,7 @@ cti@1080b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_mss_qdsp6";
 		};
 
 		tpdm@1082c000 {
@@ -4264,6 +4267,7 @@ tpdm@1082c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4282,6 +4286,7 @@ tpdm@10841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4300,6 +4305,7 @@ tpdm@1084e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_bcv";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4319,6 +4325,7 @@ tpdm@1084f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_lmh";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4338,6 +4345,7 @@ tpdm@10850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_dpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4402,6 +4410,7 @@ tpdm@10980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4490,6 +4499,7 @@ cti@1098b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_qdsp";
 		};
 
 		tpdm@109a3000 {
@@ -4498,6 +4508,7 @@ tpdm@109a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,cmb-msrs-num = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4517,6 +4528,7 @@ tpdm@109a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4535,6 +4547,7 @@ tpdm@109a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4553,6 +4566,7 @@ tpdm@109a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4571,6 +4585,7 @@ tpdm@109a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4589,6 +4604,7 @@ tpdm@109a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb0";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4607,6 +4623,7 @@ tpdm@109a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb1";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4625,6 +4642,7 @@ tpdm@109aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb2";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4776,6 +4794,7 @@ tpdm@109d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4909,6 +4928,7 @@ tpdm@10b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4928,6 +4948,7 @@ tpdm@10b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4947,6 +4968,7 @@ tpdm@10b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4966,6 +4988,7 @@ tpdm@10b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4985,6 +5008,7 @@ tpdm@10b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -6801,6 +6825,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
 		qcom,dsb-element-bits = <32>;
 
 		out-ports {

-- 
2.34.1


