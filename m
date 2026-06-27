Return-Path: <linux-arm-msm+bounces-114726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J8CgIcmfP2qoVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBF6D1B59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ExLY6PBZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XUlS4eRQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 187883026AEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2D539FCB5;
	Sat, 27 Jun 2026 10:02:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4D3A16BA
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554540; cv=none; b=RUGzS39t7PHVphnkQI5aG2HoAJJhe1y3Tz0t8w/61ll3VmymdsFRpyo3YDSeTfqj9VLqH+VEnZwK9Jtcf8QNirG8FvGsEKMcM9eat9cTfjSn0lDvoYAAwBX0dNkqCG2xPmchA8FzzWx1a/DoPc1N7f6trX1BnMay0HAVwA5eWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554540; c=relaxed/simple;
	bh=ye+VNGZrRhLHrf+yT8SMRC1yqGdDg7QfD9UlZF+Jdz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmfxt2exbdf6dCAwXgE6nIR7GUMCY4e7OGEJHbNJrdy0yUXb992DGVqEegjNUoZZP5NsKZYv9Dt6FKJwmq76e66ZFGNuKr0rXq6MpklYrzZN3Wb9DuQ/3Ao+JfZutzMyae0MoPPUnY1QjUhXgCs1qcd2w4IIpW5rM4R9d4JYV48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExLY6PBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUlS4eRQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZkU2696158
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=; b=ExLY6PBZXWQQUXW7
	co76HxNnxuPPkFz7Ppyjn4+AOYR6HIe4Syv7ut9SjVlj9kkAkX2tIsKs2SFng8hg
	Ave7A9BlGlna27+50r+9KMhTAv01MVIpQ7AVtJaC7Hr+Z88motNFwJQke/PqTrPa
	KShK5VoBbss4BaMS2qNNNQJchb5EkdSu76+oTXtLokloqD8KIMMClrSk2j0LnQtK
	iQ7m6zk5M3xW9IjqCG7wn10ey+t7xdgzMiKeBMM2BVPF/XYG9ts1X6p5K87iHGEA
	VB1NaSmS73mrdH3dHEi1ofCEjgvOkDRD6Lnk6uGqURbYojwVkT9SU9suAQQDDACH
	LIdjMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27348j59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ca3374c6aso3817526eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554537; x=1783159337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=;
        b=XUlS4eRQYRW2lrmBgionbZRrHhhy6FwNiPjTcJAEUAwZEvlfU/lqYmrIRROGkXF4Pe
         6OB3JemX7mRto3evDSg9dZcPFNtUhdTDdMbWaD/go4gN+c6Qprfr6L2ahlNs5Hb/iKXH
         H023izXAU8I+3YCi8BtI3Z6M3x46iFpouz+J9NFqnHQP0k452frgDwvT6AqduWhviW23
         /qdIcSX7BlhS/W1oeWdqe2qxYk3M+0y4TzfVlqr6VKPQ0utPfJuf8CDVNVp3epJGnVNj
         avMJSmfOaW9Y8c3MPwTrQR8N70Q4OXfTdVhOSulCDMzJmAGxY+Ah9eB+Jm5+PrKyX1y8
         YN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554537; x=1783159337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=;
        b=AmimCsTx7/Rg91frvilSnb4OP8nsKk6tAPeNQCoN891ColeWehYqPMpVdWfFoOBIaq
         tq/Cly1p5w5gZ2vFu2RjFDURw8b3T6KnNubkEoRZfq8I52YUUJK1ymPCgD5olVDw03Ej
         oAmLB/D3cfo3sLKZHpkA0tpRy1qg2Zqvp4A8p+rcTpxL6EWCL3qTx29Zy4r892KEJx8r
         p4Xar53oEPfVst+qDwoT2H4wyfNvocL+qhC8ErHgu2glKXwo1pGE0rZ7K+OdTFFXn0Rg
         znkeNOtiA/GaxZGhG61xgSUsbbWZrnqSCsA64z0D16p9HbBEABRQIYM7XHYDg1uL0N1Y
         PP6A==
X-Gm-Message-State: AOJu0Yy64j738gmqtZ1FG4LBzw3FzC0LJyKr+bx+G76MQARCNOcaz++m
	8CwxBaUYWQymGId9oTnsW5rVPZpRPPiXxUK/W8vK76b8gT2xYZ3CvUYHa8pN+GsPS42eO0dhntL
	8Z16BK8Qtrh9srto0ekCBhM07HQZA7LZm8bVyuqwaxg/dr4DOAxZSuMQAUwXJIZcZvUnJ
X-Gm-Gg: AfdE7clXTG6w2d2+4gRKhM/T+rlfC6gS0c3odZaEZe7pwMSxFy9wEek7oS10RAvGKaD
	I9KQjaT2u0HELp9gh6Mopkc6PMye4nwHL9lGy7HQ+lGYOR1CMqp/LCawCRkfZXgzO71RmOxazNE
	q1gJkT0lv//ANnUDegQOduOf9KPGWR7HMX0o9k2sTc3qpOOuj8m/1la7oqWV7f89VCCqfnu5PtD
	dkSH8lS5nJf5CVdWHikVNMwUpfpRcszyMPbkTIXXz4rLqco9nA5dI7Zs9OppqaaSfghHtOkg4pr
	jeJFQFOD4KCVyJCYGvzOuassFsawjdFk2AEUkkUD1I8BvfrUfb/9WbM2lN7HxTAtlFK71SF7oi9
	Afc/QNVvTIJuGHk1KF7Rm5LFrAv536B3uHhEzfg==
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr9728336c88.18.1782554537008;
        Sat, 27 Jun 2026 03:02:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr9728310c88.18.1782554536412;
        Sat, 27 Jun 2026 03:02:16 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:38 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3059;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=86+3eXj8NPzawVKtOr8LhIxF7CWhGwdP0TYgQ+HH5fk=;
 b=fWO+HN8Yv3gLnum6chIiDnIRAPcXWA0J0GrIBhYZGw/QnO0BR1BN9SUoqOUvzhF1juwuJenKz
 E0HeGcq+cWmBzpVvBsrYX2SJSQSb3jkLiNBYcdrVovYwuKqT5Jh8RqM
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: jXsG7JS9r3IEEnYlcUGpqwT_7XztcmKP
X-Proofpoint-ORIG-GUID: jXsG7JS9r3IEEnYlcUGpqwT_7XztcmKP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX0OIPJlNY+/EB
 Z8i0ZNZF05zGF5qeIGRHrlVE0chhV8j7QLLrpz/JQUFZGgHk6yp9Tv/pl5aogZ/k8UPmdW34Eam
 WpPRwYvQQeEVOz7o/PX0sjLUlf613LA=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a3f9faa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=urnI3cEPUZYGKLcoOckA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXwiqH684IgvOi
 2/jnhfHPGXLYiCAHieo2rYvQG/PjjX/Q3uLHYJN4VC/8YQNmj0fz8fb3cvPKEFoHsxWP0Mu74ps
 hM9Mag2kwlvfa9Zco81mEAXJErd/0QH1BqgZvwAKagpPxPeFxqY7AKy8scPz13nvDkRkxZFrSjJ
 +qqHklJQ1q15Jevll1DbJ7reRdpDdmjNSYn+CBX5ouTrtBux1Jh4He8QAXOLNr4hfidr64lu1AT
 UZk40Np5idiBVfdPXg1p5AKwD2CUWZpn8QOO2Rf6N5AQvOpj+C30eYcKbcF+SQs71h+lYkk/nb6
 Kv0m1Iazn3PJvH0dgJnixKpbmRYE57YdBbNHLfKY95ppfkyZ7k9R1RgKPP4HD5JJ6KVUbceQzv+
 Bhbo8EWiAe0yWePqf7s7N33iTe01i+RUUBdEbVz9FpNhEgjKwdnTJZr26yL+CKF9yhAKDYh7s7t
 ZpJS0qU1eKh/oA8IMsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270086
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
	TAGGED_FROM(0.00)[bounces-114726-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CBF6D1B59

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..4ae47d72d4d4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pm4125_l17>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&lcd_bias>;
+		avee-supply = <&lcd_bias>;
+
+		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
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
 
@@ -116,3 +174,49 @@ &wifi {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
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
+};

-- 
2.34.1


