Return-Path: <linux-arm-msm+bounces-114727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y7kAAh6gP2rWVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF836D1B82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jOpN5XtI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KFyZ0xgi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37B1D307C3FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C0439E9AC;
	Sat, 27 Jun 2026 10:02:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D403A2543
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554545; cv=none; b=UE/ikJV0lHeCTS82df5QbjVNz3TVc0Voqp4Bz52PaUGvlaf4kcmk7nY0fHKxsgiNS07lqoxuCnqAM5yJD7ZKkgNhBbn0NTIf4iqZ+sk1KRkYMEEVlUBNmJf2UnnfFpGCqen38ghjm/J1NJxgk1VQbZpKouzPbSshJ3iRdSN28mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554545; c=relaxed/simple;
	bh=UeK4KDV2zCJzlI5/32AXknd3k1RL9pZDuToVAxaLaNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeqHkYa42h4uGuA1G2t/S1lK9LwXzGEIWiC2eVtu5uRk0DQ0+NjBD72VfIovpxdPKmgiw8CVz0k7XQJKjKr3myAbgWWDT7EZcwIBqBKq/0VmsNa92Di7gamiv3bkkY7SUn9BAKOyk1iRA+pQ9qkl1rW+MIhqSmu3KFOBR1XIKzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOpN5XtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFyZ0xgi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZnSh719799
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=; b=jOpN5XtI8GITkjB3
	ef69bG+iVRTgSMT4Wv4EscjoOhBlFsaedZebEN8dF2MfGpXiUQuDch0QtwAWAD7K
	fPN5jriLRvRajI/yQoYlpUTl9zxQPpIBTjHGoXcg4DnZwPlVKxkB1c5XH5Hf3sxx
	VhiRqUGXmOASPuLhRYqNpdfeglwCcHp5LNEk4Pr1emU0B81cVCfcvwoPYxx3XkHH
	xvWGTllXcJmURQaPIco84xezyQVy1AS4kqzUaGs2anA0ECZqpBotWtm/GmKF7HIm
	qbyE7FaaA+6X1dkqlN1aDU9rnXaRnWO8R9+1eV/9T9+/s8lod0FB2faA/sMoXkKo
	e+QqTw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8gk2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f3465368so433578c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554541; x=1783159341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=;
        b=KFyZ0xgif8CuW/M86jSQ1LDmcmQgIy7nqLEa+NoCYOrOPjexgr/gO9sr3FNO55R7z6
         AoNzPjUdS9z9nll/cUlKs227JyrwaBcw0BhDmGFatE+w+ovveBgTg6QIIpLHXx5capjV
         JRP7Mhn1gOTYiYDBfpxExbmFo9mZgCqXkwtBNkB/573O/geZmAfutFbfcvYudgYluIxu
         t7OxoVFUlJ3jesEDyw4EknGJwuqM7HyadTXqz/quL86AfiD8dI58544wh0+weAdj3lom
         FKNdP5ed3XHe83wkUpXcok/jvm+S46z4FojuZ98QRb3BM8ZncBCehKZuL7K4qGGCl12j
         BHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554541; x=1783159341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=;
        b=j+0gve6nJeyUkb0dm681ndFCIy3+fK7Z1CfZ4rKL3mUaSDqKl/NiTGCHuXdHypvJPX
         R2MQvnCWWOcEGUYy1iBrDD5sD/N5Y9y0pufFbxUcaovdhPR/YuHAAOcWdSpi2BlaD7GZ
         kZ5dKsOFb/hdwu2I/L79CGnlmkvyJiBJViSR2JV+MQgY/SWLQB1T71Wdi4rfF1iCpgRV
         Es6t4FLdmwXnXMAaJHrvb4xDsSEit3H1lJtGK6GHyW579gchjKvXJNeu5dHJp3XO36ZI
         5Gc2cgQHZhSMlRbtuXIHyZH+v3fm21R2wBk3U1qM6FYGeEuzt8pmN4sWX/B0Onq+Lq+Q
         SDEw==
X-Gm-Message-State: AOJu0YwArg3ZZock2TDz0hUdTD7YmMnOm5mffqG0ADyKCMr5rQjLTyWL
	NwD2XfsWkhmc4cwCqFdTEjyGlEjqO7ZT89IWF/rpR1fBwybAwnBq6QwPiz6Hv4PG21XCvuz202P
	pZTUOjtzfhhwnBFTInkCJ1dUX/43jYhpiYxyTpW3hA2WTLUQoQXBoZT9xBTKppiv7QHkm
X-Gm-Gg: AfdE7cmawfJYhTCSnGzXnAF8Zw0zP5TMFdT5t/PAOoc0clwKlLzSPJ0a1jSfLNyCGlQ
	XJKu4cjz/oEaFDM1sxlMbOQx2oiVKFkV/YA0M7zFSXk3CqadUp98Wx7/DQ42eL+LRiUsrDeEX69
	JSCvASKTVlipqJBkD4zJrdrCXux5x22cffHIiDE75FaGPjH1AXHDWHeAIFXpWBIMK39NS+gOi7o
	V9KONqsd9otaTss6pdaeHMa00r1ZG0mLBzavBNLP7OEk6MhFitJo5TwpSo1Td6KBd9I72WZcsL8
	k5TG+UBhlsiEGZFAOyG7gXqunIG1r8toLouR24+T7sTBUvukyRUljYnFU5uW5gx30qXs9VyhEMU
	Va95v/jK0Tm1ry6A2mewdO5B16XdTSpTawY2/Yw==
X-Received: by 2002:a05:7022:5f08:b0:139:dfe0:bc03 with SMTP id a92af1059eb24-139dfe0bcadmr4906446c88.18.1782554541355;
        Sat, 27 Jun 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:7022:5f08:b0:139:dfe0:bc03 with SMTP id a92af1059eb24-139dfe0bcadmr4906421c88.18.1782554540716;
        Sat, 27 Jun 2026 03:02:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:39 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3322;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=PGNaUF4uPiP0kFTxpYA7DYuBi0F9EtUmDruUpYdKV8Q=;
 b=Hkgcgfdmf4agREu0MI+plJmhiT08tG6hvbN6NKGFQTG/u/S6uUa2Sp4UXCuozCPQHtG9tZGAW
 GDFWjfZLEKSAJh4aWf6iUi4mQjbi/gnC4MwCrv+pB1I2J0QbLB3+3wv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX/w70Pb4e26v5
 jmAjWeUorJIYTscgRSmsPC2hk7tMMSk4qQW3VEUfZMgXM7JI5bUKGqPdUn9eowRiRjAzVuBC6X7
 PdYHsrgCqPhzY5n31InT6MlQsFxHl/A=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a3f9fae cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oLo0L6-00J8s2reelZIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: SzoiFL8JKIK5dJ2qp7tHYqzF0uLr90DO
X-Proofpoint-ORIG-GUID: SzoiFL8JKIK5dJ2qp7tHYqzF0uLr90DO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXxMPnoXZsDTZz
 9ps4KHKWRTMTsjkSD8d9eGOSIVMnet8prAe8hJbZBKGRF2FfEl0/qfkQSmGS06dupaSLI06vdoV
 aCN4t9LSWciJLT17ntj/3EGKopDctUpulO6Dok0u9j8NbcH69ZyfLkCow+FUoqury49k3EpTU4N
 1V+iR67HfeJmXeL42geSgghkNHkMPI5tXmHW0sVb9Jux/PnpyqK9sYcDYhio5YuAXS5Jbifg9b2
 rszghTwh+XWHVAxnn/M2Q+H2sXvGOWDHPOXv01NA5oGSQRKv7Kxez5wjC3UBbPfneu4HaAg17oo
 2QcDLAURydMrYHiu4Unf394J71UjCOsfDQLHvOI0DpDTYXetTofceFogtCJg/tkE5dbsUbHpOmQ
 DpgljPBtUfC4k61ytr8NC3vdTZaQSqf1tDy0jodUIZw4hevxW3kucsMyNmDLq8YfyznNojzlmFK
 17jWJ0aDnzVEVEzKccA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086
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
	TAGGED_FROM(0.00)[bounces-114727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EF836D1B82

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Device tree changes to support lt9611uxd hdmi-dsi driver.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 ++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..9cc4a1c6e4ed 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,36 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_lt9611_vcc: regulator-lt9611-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_reg_en>;
+	};
+
+	vreg_lt9611_vdd: regulator-lt9611-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -68,6 +98,78 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vreg_lt9611_vcc>;
+		vdd-supply = <&vreg_lt9611_vdd>;
+		lontium,port-select = <1>; /* PORT_SELECT_B */
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+	status = "okay";
+
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	hdmi_reg_en: hdmi-reg-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +205,26 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		output-high;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


