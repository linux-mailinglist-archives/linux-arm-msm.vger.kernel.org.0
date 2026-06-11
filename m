Return-Path: <linux-arm-msm+bounces-112596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gyxyN/5CKmp3lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530D66E66A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U6YfKaWV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JIAid2Ki;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112596-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112596-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6588B304967E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D4437B41A;
	Thu, 11 Jun 2026 05:00:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52863383329
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154032; cv=none; b=OBwjMIsGDy94h7YMYI6eW+nfGaGmsQP8ilGXrQwfLiFbi15GHopIgBg3oEsdz25PQKRxoXEcMV+bJUx5+Q6rpeK4Yj6wgWL1rPKOkVuZc+IJuwi1Nix3fgkZeQiRGyIRfWd53SsO5Ul/T4sKJhhgAG5lvkVhLHLuz1xYWLYzzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154032; c=relaxed/simple;
	bh=tNZSB7ttTGLRExjkoXKtLnSqMi09OL11vseaCxqJ4Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiMh2fNfxHy0c47ChNvBFPcWbPHI1PrEDMVqB1aQxtnYZaoVnM7V8mhLytywZgX4IDQNJK/hU9St+tX5zBhLqafGG4DPVn65ehHstN/n1ZwRtjCa/nZudV5pYPbm1ChaIdfA5n18fJGAIwLeTe8C5BfTX7Ft7spyfLEeKyfNHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6YfKaWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIAid2Ki; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nv5a3203231
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=; b=U6YfKaWV29k0rhDa
	7ykC/5vuE/oO5YhRW9E/DE3HU98x1LH+TtWKBJwLbYQJOj1jyoFhW2nY38A2b4Kl
	lFBEUD/uYgQB7tsLxFBObLA7G7g6FpxZC9TCm2xgYE6M6QtztYzW5dyX4PdwvyOG
	T9HZ/ra9KqLnUim37rzKJcxFSYlRdrJR7l8V1T3rWzhp4IzHdokM56FoBkBK25kD
	g6t4WAbH84hYv0rXoHpoDI+TkP8SP33coBufsqFyDVVc0f8zcDtTA3Exu+ZH+jrt
	UGNL5YXlFIFdFVtrvwM80dDWM6g1rXiMhO4pE1vU7Y7YMX+ggN/45kJa8O+Rgrll
	Uz6RJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thpbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32faa62so133381265ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154020; x=1781758820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=;
        b=JIAid2Kiy53aQCIX2CQxm2XIscw9M2rt65xvWFzlplxS1p/PjpcKXe0ToYDBQhCtk6
         EF0fjvNq6myjSbfC2wPfp1c21oWBwpO/8qdNfBsxDiZk4FxJA9cYions3v9FDC+clc+C
         yZJcPh7M56uRuPCjivc3mCkQVm+X2hiqdUY4u1sWqKcNMLB/pMjEFnqXFxXQXM+fSwoN
         riiK9CHl5/bbE+mRmLP0/uX9qmuYbSX8SAqrBCnULxxjWLO6Q1dAuQKt9D913VlLg+Qx
         lIb9fc0Y03TaYT1+i8ZhjFMT2baJsxPcbMkZa+Bx7zq21CDEkxq3G1DIUWs6QSXa6g7b
         SFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154020; x=1781758820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=;
        b=WiGyPwRlDIe1sct/LVztjCkyREbxYsJ5KPSfP+GEIzwW4xmI7wAQ/ALGKQmZQKiTdg
         jr624RQCmcgxbKtUtAbuqh02gQI6ahDRRp+9S4m0LdhSsUUDDRpatk49OftJ2ggzbSAU
         g97kcG1m4y0JNdTIU0yLjjSFJukmwdaHAHUg8kUb9ujR58FSy6KM2s7a7ANTWxj6GAHF
         T3uXdNXSnZLuo3vRz2GsySMJyDVPaeznpN++1sPRXufZqGYjeSyTDDClL0iTXA65EEpv
         Lqoa0EnxxSPgs50MYdUZUfSrJL8MYFKT6LFPp0sar55DGLQSf2Mlg5ecmpD5UDjkDXsU
         dAHg==
X-Gm-Message-State: AOJu0Yzecf+YhROszsoXuY0zYWMlPHW8MjQGsvyZ2LNyfzZff7vKbYd0
	gFIhvHFmHhEmXOuP9kpFUBLF8Dz8co05wML3IQbK2xUsJMP3X7eVkxSw5SqGeHPjRum2KmRIxz6
	jmnOagUHHSytlNDykFXxoLQhRCYmEZ9XPuyB4m6RHiLelJjJsJOdhhOvet/vgUVuku3PWdBmP38
	6C
X-Gm-Gg: Acq92OHqD0XkQb9iZQOm4ukWJLE7b7gTbuXN166Q+52GbtuqFsSXv1WNyxYV5IjhEjz
	jSzCvKbH6UNgSxTG/RMI7XwWBph14xDOCkWvmcuNIaXZpGlrQ0fcAGkZYNjyu6CgCHunz/bKwMi
	zanzJmdLVl2x8ma3ferhl1NJGHsspyGPiphlqcyqZyRpqghsW+hvYu480FeM3wm6WlLr04ilrb0
	hwgKMtHKDa+gJ2RGasnev6TiwNJ+12FCFNfArTFbwilLN3Q72GAiUtFe6aWyZWAJuuWGpgXHmV1
	jmq9Kjxr+v+dKobauF/hyqfW0GRtq4fZlvToZOjPL3d8Cqt4ZprqPrPH7vkjGcizg3yUAUHodXo
	s8opWXx1KBYykpbwOyhokFxZDaEEvzrwId6v226iDsEHdQcGJH4aFnw5EpLGRtM2rLx0=
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14328405ad.9.1781154014857;
        Wed, 10 Jun 2026 22:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14324635ad.9.1781154010732;
        Wed, 10 Jun 2026 22:00:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:55 +0530
Subject: [PATCH v2 19/37] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-19-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4233;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tNZSB7ttTGLRExjkoXKtLnSqMi09OL11vseaCxqJ4Jg=;
 b=JhyRZJABmVcn6gBaSRHhJPWozg8/PBD+mhP32b2q4BNebJTj8bROjQyaPDSYEutyGNzFZ5Z8k
 HCV/nsCWse7BcqBCx5I06hD5OPynwMK8Y36IWRyCnKtAGcoCqRw8UY+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7VCloe0W5cJ6
 jlLBbEQlL/M96dn4T3j0fuKRDkOuk341IX515IxNq7JvlS1GZ24klfW4vGR+D7bc4qhNaZFnBLb
 980/493yJckbRNmqEtxeGdjhaHPbEYMdjK5g+qb2uckydK+kkmp52idkn31ddmr8306TlT1HSmO
 CH6ATaiVGt64BXIPPkgyqh3vflUZa61GiOjS7E/4XqISwZOGbwVNAGhnEPjB2II5zShflS0yiLt
 swi2uLkDCelU3o+6traBPSArWLQoY1pamgn45yZSCZAVQmjWgnN5/PvmOpvAdX65+n4gkAiGEWU
 XAOEl/5JYbYfsH46Z0rHyiqrZjFgypFSicbUyT0eSrOh+ddk/jFPoYyf/7hAG6D+MqJVyRLKfmS
 IKGSVSmLKXfJoX3SsNn+PiZPc2kCr9XjuF9lN/wFdPAr3p6uXj8OQSXKt9hhpk6VIY7xttUaRrF
 /7pWCUsiCYMQbJ+/UMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8dOmVkt3ZIg/
 HrOZSDdBJo+0JGUVvo9JOE8ebx96vbECQRnhLh2AM+6NC3ot1me4g+Pe7d7VQfKLDIBOuTN+fNL
 gPrOSDQW99DKvEMGj99oyTMAMR3oY0Q=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a40e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JsWMq0r1082Yio6m23QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2OJAGxepvQTB8s6E24no4qIezIPtIIP4
X-Proofpoint-GUID: 2OJAGxepvQTB8s6E24no4qIezIPtIIP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5530D66E66A

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcieport0 and
pcieport1. Add the missing pcieport1 label to the pcie1 root port
node to allow board-level overrides. Move perst-gpios/wake-gpios from
the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
&pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 12 +++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index fe9a2cd325d4..f492a294ee5b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -702,15 +702,17 @@ &mdss0_dp1_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -719,15 +721,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport1 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 3a6d73b485a9..d6c5a8b49fa5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -853,25 +853,29 @@ wake-pins {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcieport1 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..48d50a0dc05f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -8678,9 +8678,6 @@ pcie0: pcie@1c00000 {
 
 		power-domains = <&gcc PCIE_0_GDSC>;
 
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-
 		eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 		eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -8691,6 +8688,8 @@ pcieport0: pcie@0 {
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
 
+			phys = <&pcie0_phy>;
+
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
@@ -8851,19 +8850,18 @@ pcie1: pcie@1c10000 {
 
 		power-domains = <&gcc PCIE_1_GDSC>;
 
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-
 		eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 		eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
 		status = "disabled";
 
-		pcie@0 {
+		pcieport1: pcie@0 {
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
 
+			phys = <&pcie1_phy>;
+
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;

-- 
2.34.1


