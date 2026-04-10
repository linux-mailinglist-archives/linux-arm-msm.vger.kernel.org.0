Return-Path: <linux-arm-msm+bounces-102569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD3/LB5q2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F63D1B6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7339D3037484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB502FD1C2;
	Fri, 10 Apr 2026 03:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDRH7TSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA847Ytn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44331282C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790571; cv=none; b=mzg9frKMkB1SCz9T5bjUKz/cERLXPSaE7h0pvxwkOO2/HUtr880K1BjQ7qTsT9xd9QosmWuytCiIU68ggj/ixJj4u2tNrcz2UKsFWA68uR/6785CtQczIsc4MKecZ2pVefJPE2JunIlFFlR4+GMwubZCa9fk2IzFEJQNjLwJe3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790571; c=relaxed/simple;
	bh=hx4lFDUd9I7ChVhIcE2XnwA9jea02etEG3c8v2Tm4Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgb7CDAbXcsCo6feKGaRTGZMNVmIaSUzA3j8FCutJcQYhQy/5nHGc1bVTBUOknkbrPU3e87Sitq/aOUNmLMK5gh+h8AB/zd2JN/RuAvwZMWF+iutNWYOe7H01cbmM+gjSDYfdYEtMTleXbgx4xiUIJS6JSvdl/nS5AX1Pz2ji4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDRH7TSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jA847Ytn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639ICju6780150
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=; b=gDRH7TSQCkCs4Cqv
	q5KG4gcSDidRuXI3Cfqcq0Rrbfh0Qlr8Jx5JliYaR+XgBNOC7//kNzCIS1KVEL2o
	koiCh1HOO9Z2/Nmp56WAVhPGbxGnO+VvfP3ec0EwTg1D+VvZVmT8ponlSKqub3UN
	IFsq11ObU6ySupjGbchpoacoE20sF6FOlLQbx0cpJqwAZIBiedhYXqr9sHUKj8eN
	ubwuAToBh4h5Q9E1+BCrx8aXbB0qkREfnZIeV4RhYMfCBIUUsMLCQKjh5gL+uoYH
	1ArpD1m1tB1oWw+kqhSl2rwuTw6mbqelmChlCkivwum4m4mmvlXyQzmyAoH4M8hy
	tIvo5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8htqkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso959002a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790568; x=1776395368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=;
        b=jA847YtnntdgMPMIs6z0X+GGAVducoNdDA6OR8QqM2El5F/VJz6lgFHrETqU116HEL
         6uuKOccURmVIufZCfMSVV7ZkgPcacauN+isVwS4cwoKLMZCTryBc8EnAy8PZBTh4GDRX
         FFOuOl041btiGZvNtwhkRPkr/bQ7CKSFjm1HKZ63nsYro4FUm0U+fkv0Q0kETYP2f68x
         GRnm4nTLsLE4OEyTFCJYB9c2EnnRxGscp3JoFL59O5knb7VkVoM2atql0b7XNMc34eon
         4CMsPXgbdkSCbyWMm9Gsw4N1tzz4YvmfHuXoJcFGKgy9mcA6oG5bP6YRR+6UY40eC9pE
         vXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790568; x=1776395368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=;
        b=CqqmsdLlYkeqEiuXhbTqUMsRFZo6IQNqEY8LxN82Z0k7+YvhscCZeoN2c+k7xG3G+C
         Tbi9cE0Pjr8e48v7TWsw7FZAdKrlf6zZiUM7/+EcChxoSKBxf4aRfstfR/3w8liRVBTJ
         rCnRA6K5V0f2eWn9K8L3c5kmtclhSg+j3c22PK/Z7cjlMlSt13D81lgp9kgVYbtwGy93
         e3oXE0PVmGp3ZLyVSmHJChLRLrbrI5I1zyWSb6j033xOFJFyCTaaBWkPZL+0fKR+3P7q
         7wiTHnu1XIQu1i7kq/Sw+68Aw0DHqqwWcL7KqY8jRIEw9xOqYOB1sIMJLIE2RNmOrjtv
         w3ZA==
X-Gm-Message-State: AOJu0Yyx+5ZXZiLT1FLLae9vt3lZZPRb6BC4YWXDSgV7AkG4k1VKx27y
	XucHUd0QK9P2aV/CkqkA9RvgIg1EJ3gSlfTS9LqgyQ6uF70MNskbSHMZqmcMKyy7L7tWbkhukml
	C4VNHerDtL+JQutTqgcfl228NCN5FpTybUJJeEwtCIILsVFsZZ2YAnLnGuwwEe5MoKJqw
X-Gm-Gg: AeBDiesw2WDw4wLeKR5hd9JoZJntAUYU12NML9ebT31eknqS3oSXJhoH+j4HkLZvGrz
	Q14FFqeaSuMi5Q2IhIncKmugtxjeTF7q5jCT12CbygThqaQcK09hl9XOiyieeC7iegptlx/ZaxX
	cfv7ZL+dYfu1gDzA4YX38cVJNpbJqNL2E2y11T/I0aUK4cRKeoIV8sSqVSBiTph8SLOEBUj6UlI
	yeVGrRCyJtqI4BvGKrxqZFbV4aXtSw5zJ8SS7RcHjrjjPTpw+Q4fLeemIPceG46pkdxWAcqR0XL
	nRT56I5FKWKbBej31KixrIkQFt6MsRlxlPvl6PcpECV0FJDbSYCrWeMRC6RLMlT+i3bCiyuuyTr
	V5w5seXNTwtRfH1mMD8ZIRYc0v50qnB3MkrrVk98whkSn5skznh6yceJQV68NJpnKwQgYoRk4/w
	grGjJaqcgI
X-Received: by 2002:a05:6a00:234c:b0:81f:3eda:9d69 with SMTP id d2e1a72fcca58-82f0c2220a4mr1700752b3a.22.1775790568175;
        Thu, 09 Apr 2026 20:09:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:234c:b0:81f:3eda:9d69 with SMTP id d2e1a72fcca58-82f0c2220a4mr1700714b3a.22.1775790567604;
        Thu, 09 Apr 2026 20:09:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:46 +0800
Subject: [PATCH 3/7] arm64: dts: qcom: monaco: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=6124;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hx4lFDUd9I7ChVhIcE2XnwA9jea02etEG3c8v2Tm4Sc=;
 b=1QNuKigcR9qZYHhlbzN6H9JmhbRk4Q1ul07Hx8KzOhzPF76alrCHyC8a/D6ARyWNbru6ABg4K
 kyr1oaI0oHXAWI1ymAZ/ixdLB0v9+Af+ENO5YBKiKqBCY5KQ/RGIdHv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d869e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=swnd-9OQR8il28cGCz4A:9 a=l9Vmz6SG5_cKeK-2:21
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6PDP-pNmJ3gI-VALH06uKVa20ijPX2IQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX4uEjgUqOYw9B
 50jfojuJw+AKkE/WJJjZJ82TE6sGJG9q5VHivkxh5lktEbduwVa9VTGemXeFN2T7smQdYYxyruR
 5YEVNNUJ09ftClIOq9dg7zGcTIWMijFJbSBkKsqIFVNhYlJtmVWxO8nIW2OGERCqq3tjXnmZ/Bb
 N7gHgijJ5ze7pHPr3k4y74VVw6JKP6TXG8lUyc9G7NtSbSSvPj6QyroPPhn9E8IyK826r0Dw+Ic
 /LjPv1sdEpWO/AFn7DKaTT5BSsT77VoH+YTpBvzHKuZk7ZLvx2OfiGaYA+7uoXKPEWl9gUJ4rCP
 C/n2R8OPtev+Zqx3h/dhr0/qFdsMv26PJ0qhPNzbO8twh+v4LtI8pGNzVtKsSjHCvvBA0p5Zwb0
 5Whw7VY40SNxskmsgk6vcO1FPev61DA4GA2yPYmjTq4v+TJPH3njjdG0HLn5qWDCvPDk69TBDi2
 9/X+w4DJgcpnZ3ZZ2WA==
X-Proofpoint-GUID: 6PDP-pNmJ3gI-VALH06uKVa20ijPX2IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102569-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 520F63D1B6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the monaco device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..3e076a1df1b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3045,6 +3045,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3307,6 +3308,7 @@ tpdm@4841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3326,6 +3328,7 @@ tpdm@4850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3347,6 +3350,7 @@ tpdm@4860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_ch_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3440,6 +3444,7 @@ tpdm@4980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3483,6 +3488,7 @@ tpdm@4ac0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mmnoc_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3555,6 +3561,7 @@ tpdm@4ad0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlct";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3807,6 +3814,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3826,6 +3834,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3845,6 +3854,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3864,6 +3874,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3883,6 +3894,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3902,6 +3914,7 @@ cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		tpdm@4b80000 {
@@ -3910,6 +3923,7 @@ tpdm@4b80000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3977,6 +3991,7 @@ cti@4b8b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_1";
 		};
 
 		tpdm@4c40000 {
@@ -3985,6 +4000,7 @@ tpdm@4c40000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gpdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4078,6 +4094,7 @@ tpdm@4c50000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4150,6 +4167,7 @@ tpdm@4e00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4240,6 +4258,7 @@ tpdm@4e10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4283,6 +4302,7 @@ tpdm@4e20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4608,6 +4628,7 @@ cti@682b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		tpdm@6860000 {
@@ -4616,6 +4637,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4635,6 +4657,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4715,6 +4738,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4734,6 +4758,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4753,6 +4778,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ext_dsb";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4772,6 +4798,7 @@ cti@68e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_gold";
 		};
 
 		cti@68f0000 {
@@ -4780,6 +4807,7 @@ cti@68f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_silver";
 		};
 
 		cti@6900000 {
@@ -4788,6 +4816,7 @@ cti@6900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ext_dsb";
 		};
 
 		sdhc_1: mmc@87c4000 {

-- 
2.34.1


