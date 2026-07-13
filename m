Return-Path: <linux-arm-msm+bounces-118766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pjsQKvXYVGojfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB074AE8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EHM8era9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cHHOkg+t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BB7330AD78D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D43F409624;
	Mon, 13 Jul 2026 12:18:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780D409615
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945125; cv=none; b=B/w/5fgd+CdecT8xxNI720uUVV69Yis25LyvboalEiQgep3vk1jqnHG2omlCEYLWCTki/5ZVzfdjFTTKcn+hkMQfwphCY7tQBfQi4uT4R/oH99Hp+GKaWsGAHfdEeqtzLYBBzXZ5iQZPQ4I3le3E+5b9mxDgCJj0wuq/7qx+7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945125; c=relaxed/simple;
	bh=uaTQGCsGiEk/QpyKbH+2uQSuBpGwydTLCaCHQMwIaSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTczhxB7ztnMBk5sNYsvqBUZEFTHjbQDH9NDYDyQBD6JNlXfDvhQ1xJ3fEEuNV3yV3Wt4beUTM5+9tGYu6Y/uMktI6CSM5Q0HrqsynUHCDlAh+kQ3bbEi1tm3lVXnBwLj5Dn+d3gJkLHvuGHhVPR8RBJ5bmOe7eGQefrGNdRTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHM8era9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHHOkg+t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEMxJ1333558
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1Lby6+bG4N
	ugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=; b=EHM8era9vulCfox+CoPs55sv34m
	B+LpM4+GYVPwQhg44LierbzRxQI978g+4utP9T6cZdvwMLcgwfzRnbF06MKEIN1c
	zcGeDiKSROaNmPL21cxrY59FG9lBEJAEqGFUvd4+fkOaQehKoqL5M2Vw++SZRIvv
	/ZKpLImKi+Yie/QERC2smECtFU+stgPX72wp0E2oy1DMPgFXuqSXtwMWFrqgDGsP
	U8TWh1DM7TtrW733Orvf0BMsEs16xv2jRe+r0p173VTZfdn2uUxgvojvZNf+0dZ5
	thCXH+Tq3Oyy94bas8Ts9j8w8UbmV8Gk8gCxj6WmYzvFsOZ0StW5pIR6sSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8heh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8483e038efeso3425480b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945122; x=1784549922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Lby6+bG4Nugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=;
        b=cHHOkg+t93OGeK+ZtH+zeW8O9xdQwU8hqOvWvzy2BvYcdW80+PmN2afFABDxyTbsJi
         IGQN8dA4g8D2bA71TMmTEhvHpulBMvKudUy/QRl7+MhYx3CWq4cpQKkW2rm7jrsb9WqP
         +DFCG29MKx486cVWlyBNB6p6ppW62j3wTDVIjwZr5K7orMUYcQwPcdBrLtbSf65WSnQQ
         1KGjfQm1++eirTTNcRAjaYervx2Nyk1J11YWAFoXKuP9p6NH2vblfVfUPrWx2fNX/+Wd
         3IcfZDtq2YbHet9VgMIbNwj3V2TW+y1ylDhiJeRvIC4U/SH4JmQqyEwo86cUWy3XEZ79
         hyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945122; x=1784549922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1Lby6+bG4Nugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=;
        b=kuYCIUOCxF809wjvXw7nnSOwXCnUYiwkLgcgWVe25paMkdiKCKRt3pxUfGYUpkyrtg
         44CQc0b1fHOPOOQry0lrhGv3Kv6OZaJEwJsY/sUf4rSzK0wx22KFfhz/1OtHD8cSxu3e
         YnSbxygEzn6Sutjg0DzRuvJdNQch5I0JXB18hMlZTl8hbtEtQpatuF9KAqmsD7Lk3KUE
         ape5QHMCIU7xhzJFBWSw0pT6vqHs9MyOW5JpF0CsmubMDQPdaOs0hxFhzWCn/5K3/zOd
         gk5efjRhcKHDZQyA6nEwq06f8yHmrynA7vs7gIQSZqxiLiFBQCXnztZAwQ2kTf1/2Gp2
         bDag==
X-Gm-Message-State: AOJu0YyNg2KeIrBjhvYy0030CBvoTOqDrLQjmcmFG25IuY0clH2ZKv0t
	ttoRSHUduFkn9NPeUu1R3WzQ2yiN4SUiBhJjXNoH78FyJb5nS22FROVbKYFBDXehoajxOJUb38C
	7lS/BHGy5c9BZ0Sc+v2YLm8ucDiLhj6almtbAFd8g6EGoBghF3AD6OCeMKfH9DXgMcutC
X-Gm-Gg: AfdE7ck4Q7B2enmmK8ChG2YdQESJ9eyA+35kRTk1OkUVb0/7AKf7S/RXx5Dgu9Q9P/n
	EHH36HxEjzogMP8AotUWqOuh0e4R66znXOpYgSFM+/3haj+rGxyNmdT4n6432qEN1dlFbANJGfh
	QXLaAhTrLYi5pNhTY1wOqCL1bqUZpNd4ZuuUaEROXWvFCYaBHms0kQ3yBYuBHlnRSovvaH9DIs2
	6tle/ZIZS1/SGNR0rBVlNEDlTz2ozEleSaUBneGSOTrG/9Y003R6IOyLLhaHsxCQr34n6TerT2y
	V4aIzgQLBK/KyjacOYiQv9EwTNcwZFAPJ8nVx3uOwTDrjbWAEU/UXMG5HsbWq9mMHB+89d104tw
	gjre12nXCT8m6BmaMos4t4nB8+Ebz4KPwDvxa6XSa
X-Received: by 2002:a05:6a00:13a6:b0:848:2a2c:8528 with SMTP id d2e1a72fcca58-848896bb053mr8408962b3a.44.1783945122204;
        Mon, 13 Jul 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a6:b0:848:2a2c:8528 with SMTP id d2e1a72fcca58-848896bb053mr8408916b3a.44.1783945121731;
        Mon, 13 Jul 2026 05:18:41 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4375340b3a.16.2026.07.13.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:18:40 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Mon, 13 Jul 2026 17:48:16 +0530
Message-Id: <20260713121816.2728888-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d85YQU37GF7YnAumKlivUxNlTtXw2zv2
X-Proofpoint-ORIG-GUID: d85YQU37GF7YnAumKlivUxNlTtXw2zv2
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54d7a2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RpnahtGIwcQnnQdoyywA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXxykQF0q4CGUf
 C+hZc3mlcvYqUXT7czTz4L97uKB3MIl7Dh33R8L/GJsMBaPffcMfhm9+Z1wi2b2PjLFVKumMbEL
 MHG+Ts2sI7R+eLpdYGyTdPMtSvR7P8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX4/ojcqW3bb7Z
 fXwetrVF3xwan3h0ukwWPR8X5rO3NtoQ/8nygYdtn8kprIuVlHSTFVEDKFyyvv24hp/x7mpdkhf
 kU0WtCGtC3+GNd6pvguyRgVXSJJ/LWJGkoBQ/lizFTrA8gmA/mdoYfcFKigCaoJNo6XQDg/1nij
 Qqb+QSLEYVhgayxbGgyhi9r9kwAVL3qfNVWQOqLGadfRNJTEJQyyzGXKCO4L9Yz4Xgf30/uwK1R
 txI8907hjfrju0S8EOdt4WRtJeMb6CAaw4QM7evYIN85oM8wQU97+ZfTRtY20LMTHljZP3nDVYq
 SjiN6nETwDZCSPA1cDsjaEpyS03wqrCiJ4ZWXgvjcl7oVeW2d3tELZFlpvbg9UDSY50V+VWcZqe
 CBltsdfyGiGzKbp9gyJEXlvZmeF0h14yTnYUjZ67ovBpcfaYeIE1dIGg4uPvAB/A8/H8PWMNlsI
 KoR4uLdATQWMUF+LM5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118766-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06CB074AE8D

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..74d8c860f970 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,160 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+		regulator-boot-on;
+	};
+};
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
 };
-- 
2.34.1


