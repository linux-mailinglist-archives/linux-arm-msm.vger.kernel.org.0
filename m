Return-Path: <linux-arm-msm+bounces-118726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XU50Epq9VGrBqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307C749CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n5AL2xmN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HFr6Kkuq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D84BD3017B80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA5C3EDAD5;
	Mon, 13 Jul 2026 10:26:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB23EB7F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938395; cv=none; b=LFPJDrApqblUcu2WJ3pOgzs+3hlSk4+OWKpp3Yxg3TWuChoit8yunJl2Uf4MzbZTlTNPQrcrmVi7SQ6+rOXSY7w2GxHYm2HbWj+Cwc8Tt0lg+M1OiGsrnQ3u1Fj1MSnwDnjU5yy8tp+FMVJ3QYxbBP0AG4zu0wJX6HvZbd9V9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938395; c=relaxed/simple;
	bh=2JVNmg8ERK2BGVPTSHAPHLvYfTD0fCwZvcabhmjqLu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMAIaFz9jxbQLulietx0yu9lKzryUw1Q4ixNIar6wHC2dqO0x/wxUjw3LMaeNXJRA2CHlV+DIITWEUvWeQPf1R7UOiQuenoRljrB//0mnMZoyo5ehU3+AVuePeCdlwUJaIMn/jyyXhhaEZBd0WUznq2DLxX7BQ/RHeAGwrXFWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5AL2xmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFr6Kkuq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dVGS952909
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5gUUKRH/pO6kearH513iezNDNI81H2iSY5nq07W0Zo=; b=n5AL2xmNY34wj/nC
	8LY2iAtGkKajNWAFkMdLjrenR78jMrY7k6Il5gORcz9zJz/Pmx73MB9esvLhZc74
	sWfD7wLUETDcFnhfSdOQVTtcuqIh+dK+EiWVH8mDZx5zlJIzKZgKVYnnRVJgFno7
	rS7D4p52HTAV9ntw+kpIVgr1qMaupyUEBJHoH0y2UwrxwpeoSY+AgtSs5tisXg0D
	eO4GWKfAo0aYMP7KRol+C94waEx6fDCLBRH5pPpoM5rJFLeV3XSsG1yhdZl8heLE
	kIAKvLKjEA8rd49sS6alDVJhZvonrQEZNxAReARd34jXPPHCoTtSdHkGXVOPxHFZ
	8tKr2g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g5fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84859a64079so5570834b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938387; x=1784543187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5gUUKRH/pO6kearH513iezNDNI81H2iSY5nq07W0Zo=;
        b=HFr6KkuqNEaFPppGoz6cQze1xanttl/bbwVFTVhBecC+oXC1zlL6mOkTwArWFe4neT
         I3XN7Moc2RX8UcLIfPy7TRyaLasEEwIPqOhYB1XC4CgVzkg7B1VH+BsfpPkSf1pwNGRP
         lPZSoszycvp2IdrCTI6oBn+k97wj05eUWnn+PxtUjItktjifNiMioQ+y3+P7SUAjuIIa
         myjFJmIkTllJ3MsoVAvc+x2qgG+NCshMWSZwLtDi7m9AZ1oYg0bIPFmus/JyrRMbrRJH
         lErBnI4Pgx5TdGSCttvm5u+G4f9y9zKplrn6MMbfFpcPU5FE3gGkU1TqCPctqO0h9LPd
         H6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938387; x=1784543187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5gUUKRH/pO6kearH513iezNDNI81H2iSY5nq07W0Zo=;
        b=dZagf8ax8g3R0SIih7XxrxDaJSUkeRUdFnmPvkPUVK+G4ufWYXaKyvpQRyFe1GdNJP
         0btNwXKRVWP+IUGvLTpj3qkSuL2vr1tBia5aRKpN4LC77V/fEYvLTgGSWBMqoqLcBFBD
         dYZQrXz2EN1WloDCoJnagLYew8cPKbJMsUbOn4lRb7pqL59sxX4rwAZj+EbxjxV4sh6/
         fwppGjgGYkaG/cTvCgK23UMk4Z312EiPJu0mil8G3U74TunAj3qvYo6oMfhhcb6O9BPh
         LVQSxmJp3NI0dZ06vhj/zEsfOaEmZH6YXbR1tiuMpE+/9n6mkEVp4D4OZaiMLPk+fzjF
         D69Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDGyLwsKDUXiFwY4uMsvSp6rbOHui/7i3gh1eF/dJYxfRpmGVijSd/spi3TuUcFKGwTl6Gw87wkfgRvxJE@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZ+3Y6ohZmNAppzqTrFdu1ZJSMmq1IWOawh1e6v6WXlDL2MC7
	oGvmxs1UBHkEjj3AQXNNa/uhJpD75/ObjonWqayhS6IAkZFZE1z8RPNajyRZuCs3bI4KbfDPd6z
	nw3VEsPh1HspfP4FIJqlxLYH8yxg0ByUEtC1uQzX2W9pXTQzxmyYAp+r0oa5ibhsRL0Hd
X-Gm-Gg: AfdE7ckLa6SdnK7oprERafKXI9MJEYxTgfowz0OA5UqiJABwsjPL2LfBDnbKS+aRzKK
	iSnYOSxi64baH7sOyC4L1O8zML5FR1nGyTE3x96lPF0DbqRDvjPFbG0lxTJGaQDFwRflkeMjwGJ
	rpwdCfS/UgXH4+LdSbhge3rlCcZhEOXZdY4WxPb5gNEtLYLIZGHUlSGdTM5qsfK8kzozhNkPho/
	KELfm6fbmQAEFMNhHcx/3gbYobr16QKFbz2jRagOH+ajgANsfG+ZpdEZE5UliNGSq53ZB1SpX/S
	kXiKpjqyPz5hmgeQC15/gHC5eZTVj8O1gSoo4vkXTcc65BlL7MCG3CHoLLb6oT1hWs7OLk8eXvJ
	JkDRxwY9lrYe8Q8jGXUsPgJHGEKg0wkckzH14dg==
X-Received: by 2002:a05:6a21:8905:b0:3c1:279c:526c with SMTP id adf61e73a8af0-3c1279c538amr5133125637.63.1783938386694;
        Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:8905:b0:3c1:279c:526c with SMTP id adf61e73a8af0-3c1279c538amr5133108637.63.1783938386332;
        Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:08 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-3-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=3606;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cAZ+cNhNsHZ/9bcWTlMxSFNMdDaM4PheOKCXO/zwGI0=;
 b=9itYsQowI5E9qrqNh5D4BtniCN8YdaJpjKfxiwVyylAevlHgVJeP8523dYcbfoE6rLojpXqEh
 XLCm6N0/N54BC52QZZegdXlUEm00jmsOSoRkRkvHZ60g7KrzydiOTcb
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: C7zzChaSaWIEmQaahPek_CMXW0pnGslU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2mgpNpsn0wcY
 lsmE1lpEMlxbASkO7CkSzE5Fd1ANAeF8pSANPYzA0FapgsOIZILrS2+6aJGEH6/ZvODzBHBS2Nm
 QW2pCyPHzaCjjeyhGZEqXovVJZDcOkU=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bd53 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzqap/F4GL86b
 G/9+7swW47Ab8DqQUKNLHtDlAgaxHan1bLfksFWI4fBXj1YB0Vg7rbNiiPfUQMXDJB7A77bXOm2
 ymmSuQPhgJE4FyJ+wpEnsB/e/CNhM/5oPZFBB3Bl1dPZyERZb8YKqpICmuzfy25/TSE5BkTxaMt
 gbeMvf2G4Odcat0DkvvdttOPu5YBSuLMxpdkKxR3dku+FMtYUC71qk1dHGdCS3ojIAr8IiSdWRi
 eIzFW8Xn8SE73aMfiQF6Q25MC1YC8e5S0J6LweRegvTssgz2k5wzuFJPXg3LjrusKqohDZPEciX
 zgREhfLxnEos4zSw+0zHovaO1WofnDvmY+uKpU6EAUeNmuNuyG/zfogWCvPOM/A6gYIT+QOJBbb
 gtLy4SbQkgiqfZxQ4NnXbtfWAjL9+RKKF8GSpyeeOfzuXkhoX0wuNKGVB64zk/ShJEKXmKHtFfF
 99SzB90kWF4fJJXtkVg==
X-Proofpoint-GUID: C7zzChaSaWIEmQaahPek_CMXW0pnGslU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118726-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1307C749CE6

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm
Shikra CQM EVK board and add the DLC0697 MIPI DSI display
panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..0418774bcad8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,31 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +85,53 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +167,52 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


