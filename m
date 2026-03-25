Return-Path: <linux-arm-msm+bounces-99957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGB4CTpgxGkuywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:22:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD232CDC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24BB9300C7FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B1933B6C2;
	Wed, 25 Mar 2026 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="VYtyKf84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1BB30EF84;
	Wed, 25 Mar 2026 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477225; cv=pass; b=WNsQzgrnkMAbgpUHsLxkt8nKOo6uBnSJFRFjN2WGJZpJqNFGSSaNJfcDjbTFf84ERwOEoSkAYUco3mqKjBOSFnRkFal8d3GkyjrtqnsdTv2fJlQnD1Wbl9OdPRBdlzoDlatrjAkV7mwAac1zaTez2GwiN+RiTI658D6LIFhjO2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477225; c=relaxed/simple;
	bh=nJbv4Uv7vv3VstTMSXBfyR9c+4pxEc0DD1EnJ4GOiVQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Sp5FQV4UY3Rie2M4Q3PQuuYO0NA/TSanKQJqF2aMu72ryPQU99FOtvInkwOqlQqFegHn5ppGtL/5ITDYFCrKcIT3BHckroA+JsYxz1Jus+nzjuO25dOHf/hYrqxZBV0DinLatZ9THHNFGEgzT/QlYHotohKmEyyWNABk7T8Xgsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=VYtyKf84; arc=pass smtp.client-ip=23.83.222.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 05AFB401DE1;
	Wed, 25 Mar 2026 21:02:47 +0000 (UTC)
Received: from fr-int-smtpout25.hostinger.io (100-96-3-148.trex-nlb.outbound.svc.cluster.local [100.96.3.148])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BFF234022D1;
	Wed, 25 Mar 2026 21:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774472565;
	b=gyyaBMjzjlb9IQAAr3ppxC78TiHyLWg5MLvuPcWkR0WNpagQKWxMrd6Qimi5c70xKbCZo0
	LHRMo478dWh81OnDNbz8/rlygQ5Qe0SJ7JeJdDGwE95FIv+jU6/M76Otps8CWM7d2GFWIk
	rEcqk7gMFQ0yY0i6yp8U96DCgVinUiGEzgAB923k2f2fBbHxQv4sDFktzw0F1Lhkg108d1
	ebbpQndqC21cyGGm7OSH2RODgCxhRFrz1P0L+dWi2/GZqX2AHaiEH1k3agBxkhZiF0pdZh
	tWAT69PepK17LAOInQ3/NsPfLhCGdTNKf7hwZQefI05ZG+Kzj2DvBnJq3WkDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774472565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=lm0BxjCjfCkRl1JbPIp6Z4LxVXg7sLgdMNJO9XHpTAg=;
	b=7gxHuyyGxI9hjhUQo/22kBYtD+I0kFw/2As0UzcrE+D8wI3Do8ZIU5JqSnqw+L0qeaTPUE
	/ZPdDpkgbQ5V2ZbGFayqmRfQ7Cb+kMeMdAATNWeDGUsLBSHxTKBOzODhmW/R3hK0BGSASR
	mAN382YDZ5KyKDQeH5Swc0kTO7XN52K2QEqflroG7dagQYGjXeurkxvZjEIzUh5+BnKUw+
	7oCuscZsR1/25ymRYRbqlAc+r5kKI772gsVnGoryPIgqD2HPE778hP2vsExipbxQyOLGME
	xhgDaKBKGn0sKDyR8uWLjGquhDTyobPCYBDrErD1lzKhhlmeSpmqmBaqZhdpVQ==
ARC-Authentication-Results: i=1;
	rspamd-db964497c-jpd75;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Whispering-Belong: 7c605ef37447ce8c_1774472566727_2979167319
X-MC-Loop-Signature: 1774472566727:1219778712
X-MC-Ingress-Time: 1774472566726
Received: from fr-int-smtpout25.hostinger.io (fr-int-smtpout25.hostinger.io
 [148.222.54.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.3.148 (trex/7.1.5);
	Wed, 25 Mar 2026 21:02:46 +0000
Received: from [172.17.0.2] (unknown [180.253.44.220])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fgzrG17MFz1xms;
	Wed, 25 Mar 2026 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1774472561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lm0BxjCjfCkRl1JbPIp6Z4LxVXg7sLgdMNJO9XHpTAg=;
	b=VYtyKf843P7EVGIShIRpS4ELubeLGe+TwHyENeZSfe2WYxGOXqF4FDQ5Ln7S+wqLeR+Peh
	eQEnNBr4rrXFGjwSbiRema6yrz/8u7Osq+fz4ZDvaShB8/Bj+Yt5arRfo6aoDNcz0FC+wi
	X6VlG4hJJZwghVGcpu6orij8wcbDV2qTcuFY7qrH8V1QZq5cDqIOyg+Bn9pql+lX9jwxlZ
	siIToRMP3i72e0jtfttPuekSLZePursDsq8L7CtrmFfZYSWOlvmLCbsKJhnPT+xtQYsT7u
	IYzgCzoPYyMrLU1lr7FiDn/bj20Qn5mt7MN4juvMskGW6zAuxhxXqI64Ngks6w==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 1/2] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pm8xxx-xoadc-label-v1-1-027805dad4db@smankusors.com>
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
In-Reply-To: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774472553; l=1799;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=nJbv4Uv7vv3VstTMSXBfyR9c+4pxEc0DD1EnJ4GOiVQ=;
 b=4atxdDVRyt//kBzSeYlAOxvHGqp+6XZPjDgeiKNvK+eUy6qgsFBKXxEoY0SoiCaxoWUj1b865
 YBwOrXwFClyA7f5cCBQf8rppvuGPBSX+jtsKA9qUwWsOZtctnOtgqzM
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 25 Mar 2026 21:02:37 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69c44d71 a=9XgiG0qChrIWxZZBWkq1Wg==:117 a=9XgiG0qChrIWxZZBWkq1Wg==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=rt3x4hDEALvJiYIjBx4A:9 a=QEXdDO2ut3YA:10 a=A2jKFiM6YE6-xbDe-2e4:22 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfPgPRraqBYvL/4a+NiP2k4Jb3qXBKE25GbkM3H+WWm4CQ4pT9tayRkhYvAD57xxqu8ht5CTi15Ud70V4IpSiYBFj0cdbL35Ait8tSe4mZSEHF2DdPG/w bHfxuiRRUkUfDH0drJ+tWROfntIZFNHVLNDvQk5ErUO9C0huS/EeUKBOMygxoRyAXj+n6O6iqQlWu7SBTTQ0UvyWp13PEgH5keFPQj0Jd3DQO1WHH61zjk+u DcKzkxTOccS8Zmmb0azcjp67o+PMhpcuZXJOYpdZ5CWRqgLAQCcO3a7UcdPavSLim1t0ujvbHZmexuTgaxaB8QhVnZh2sgKZnD6nevDo6h/8pr7RA2DeJiUc XbDEHEQJbw3t/E5zvjlar0wbuXK/cRrqrnKZZNDYjv15iSkq2jv/T0u1kRdza0mkXPgzsrFtT5ORogUkqBewJyimTABwUuTFbKpqMEk0i9bUtR5mZz0yHtWE X6k7sOD6rZ1MGlcwCl+zkaLvmlzJOkfee9fxmShnQeGag0WBkn2Cb7101kFcHOPSUhIMa1Op1LUsMPRA1Os3UFUpowfCNPq/p22ltP1gta8J6LLaownqZ6uk CncMnh6VH48KIA5y4AT+ey1FJbkvlPZB6M/FYY23sRIXmvuHY3QQc/Kt3AnEMMOkLP8=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99957-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26DD232CDC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
device tree. This allows userspace and drivers to identify channels by
name rather than relying on datasheet name.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 535cb6a2543f69bc30abc89bff4e14a19147ce38..15246f4bd2672ccd4fc3359b66541d53d4da88b4 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -75,50 +75,62 @@ pm8921_xoadc: xoadc@197 {
 
 			vcoin: adc-channel@0 {
 				reg = <0x00 0x00>;
+				label = "vcoin";
 			};
 
 			vbat: adc-channel@1 {
 				reg = <0x00 0x01>;
+				label = "vbat";
 			};
 
 			dcin: adc-channel@2 {
 				reg = <0x00 0x02>;
+				label = "dcin";
 			};
 
 			vph_pwr: adc-channel@4 {
 				reg = <0x00 0x04>;
+				label = "vph_pwr";
 			};
 
 			batt_therm: adc-channel@8 {
 				reg = <0x00 0x08>;
+				label = "batt_therm";
 			};
 
 			batt_id: adc-channel@9 {
 				reg = <0x00 0x09>;
+				label = "batt_id";
 			};
 
 			usb_vbus: adc-channel@a {
 				reg = <0x00 0x0a>;
+				label = "usb_vbus";
 			};
 
 			die_temp: adc-channel@b {
 				reg = <0x00 0x0b>;
+				label = "die_temp";
 			};
 
 			ref_625mv: adc-channel@c {
 				reg = <0x00 0x0c>;
+				label = "ref_625mv";
 			};
 
 			ref_1250mv: adc-channel@d {
 				reg = <0x00 0x0d>;
+				label = "ref_1250mv";
 			};
 
 			chg_temp: adc-channel@e {
 				reg = <0x00 0x0e>;
+				label = "chg_temp";
 			};
 
 			ref_muxoff: adc-channel@f {
 				reg = <0x00 0x0f>;
+				label = "ref_muxoff";
 			};
 		};
 	};

-- 
2.34.1


