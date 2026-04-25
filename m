Return-Path: <linux-arm-msm+bounces-104542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hrheBtIo7Wk0gQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 22:49:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567C467AA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 22:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D1723002D53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECED30EF77;
	Sat, 25 Apr 2026 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="TnTR83oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bird.elm.relay.mailchannels.net (bird.elm.relay.mailchannels.net [23.83.212.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432B4A07;
	Sat, 25 Apr 2026 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777149572; cv=pass; b=pA1eD1m+FDu6nDYpYYBVNOaAdUJn6dFfQqJxxPsVFUl6NdER0OVaJyzk7WTu5NCVvNF7HrlUSM7quzmHVgE7AnH/uXzmsYQGMiY/gBiMtSng8yj68m7SSxPhuhPa+mhnIqQ+tTjECrchtRodba3TN6muFdXn+ImbohHieNx2b6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777149572; c=relaxed/simple;
	bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=t3mOZWKexhG0uG1LYetmRggz4BTvHhj9HHWPTU/08d6nirQh9KeWFf4ThJYCdxq5MEaRZIXdIzBTESrmWGKJ0KKAnf0vIVXUHrxl07ikNGGbKeTiv1xbByg7rhh8IhSEK2kAz1SqVnvPh97qPUFHZB6xwPPzrNzPETRE09jJa8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=TnTR83oy; arc=pass smtp.client-ip=23.83.212.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BE0D9401CD9;
	Sat, 25 Apr 2026 20:39:23 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.96.10.251])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3602A401DA7;
	Sat, 25 Apr 2026 20:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777149561;
	b=e2arGKDLyK/WFXEUsRwAFZBiGi1Z0RuGMPFfhoWuwnANJk6/HGDO415Iksrt1bTfzyVb4X
	mt3+hxPHRIPhLhKehaR2U7Iq0hhP2tMuTDkEMAz1OoSf7cXsMHBzAvG44rurrHYcDv6wn9
	mSQQHyfGA31h3DD8bxQFdT1aC7KwSOy1Ih9p2O69eyUZYuYqQhwZY+rcV829RGPVPH2JAe
	V644KawYvYWc038A5cNE3MJJcogOHRXFJ0vLiYa+8Sdsh6x33cw7JGuUCNUOKSk7SDiBAG
	zVccPlinK3tdGIDkProMspe6iLahvtq2CXxbrPIDzvEKdeazP8u3+xBESaCPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777149561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=ZZe/G1ZeV4z6n6u15BA6J9IqP88Wkq7N2XcnYL1kDIJZNyp4Cic9bitmCpxqSlvMKuB0j9
	Q4mTxHWjZVDcqfeU4+aBEmZdtm3DIeNX/rjKW68Hz44BBmqKu3payzchfM5gY1rq0KV+WU
	SO+30h/GYEEn8QAY510gWvTfto8HMtLJsZ8Ud48hP+eCK/rYBZF8L8/KdxL4jBMe4/BNcU
	VqX/T62WQv4fvdyvonkISDLR0X9EObxuOaqOwr1iuQNRvGGRqMZgIIHq02Fn0mY166kl7Q
	yr4ayoX8QK2ZdxxAWg1/6nhnWkbT1Y8S1udhbGMiharcHM+Hobi2Ab2rYoNHNg==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-8wftt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Shoe: 542da13c796eb997_1777149563686_213841609
X-MC-Loop-Signature: 1777149563686:2640551659
X-MC-Ingress-Time: 1777149563685
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.10.251 (trex/7.1.5);
	Sat, 25 Apr 2026 20:39:23 +0000
Received: from [172.17.0.2] (unknown [36.79.100.152])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g31rx0f8Zz3wkN;
	Sat, 25 Apr 2026 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777149556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=TnTR83oyHnvowu6nJMPIkXeNaTEW81baa9IOhnCnPfYeYzga3NRqWWxNqVVR/sSZvuVJoE
	d0Tba723UnMEMjO5hjWu1ZWJqbC26nWPO1Y1J4/0uaOH7ZUuY4B54Qna4bowrVGfNdcUhU
	byHruyJouEXjfHcDsOjLeRsmyHKWcct/j+KbCkQxkhu2hg6DsdEJzF+nPEwPV1yxPb8wV3
	6y1RRjL2lyyXqx8offLb2EBOUC2wSq9wskWLmK5LjWwPNElqrRhLvvva04zYNWrWbq9s4u
	VGQRbEpPfvS+zS2kin5CrpMLJ8N6KF9/B3psVpZQJUlA2r9C0xsYoGUbk4P1BQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v4 1/4] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-pm8xxx-xoadc-label-v4-1-0ec782362615@smankusors.com>
References: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
In-Reply-To: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777149546; l=1868;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
 b=qt5Dyoo+Rg3XHPIYLJ/rqje98OwQ8RV8H5yCmsXC+FYwhAz5ifn23OpcxT4imRlxwFRlDFNBe
 EygE97TCY77CGKXRax0pE8ydb5MyGxWi7E6+P0fBEujI/WF1mlDSrt4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 25 Apr 2026 20:39:12 +0000 (UTC)
X-CM-Envelope: MS4xfJgz0AQ+Pl7DPZeQMahIxHt4cGnxUKaRLpK4VqkxY7wbi7LvsVb0IGYgvOrXe7H2OTDLDCkSv5uljcn8364OgB2unG8BqgezA2tt3gdh/a7kJyyd9+v7 peFieGLEnpV5QYoRXxVfgyjxiZxf8llPIJ195JmxHSG3VUs7VVSOz9gWcWf/GbBtTjcuWT9ontb/JmYjXSedxbmjcjKTrJRh4BQnFXNxMyHAy4EPCaiPa+11 /Zq+/7WEe//diLM43TlTw0ayc+cCiL0YNRiAQvnSOQuAeh5Zsi5z0/FJdLOlttNB2TSqFcR0IaFYCx0/yJRIlpb8oHZfkAqx4vS/veJKcXGn2PP2juxqaBMU cEd4ORk7FGBec2JpfmTBDXvIe0MTyr9gYumYjyiTCdkJk07iQlBXVMatpsFvzpmhoYBGgvvRjb5fwKE4mIBZyE3CZmvGGg0MPpaKdEFVbAGQgP49QSCa9XUX RrgB5arNSl2CTGnl22NkfvpBylsclK3Nt4tz+5Vyao7Tm+PXM4YXk49aLLGo3TibOeG0G2IRekPskEbWU4KLxuRWev3IiiCcyaVsUDHh2gxP2pCbyBfGFo1n xhRlR0WnvidCnHbRlVE21rYv92l+KlygudO84rT2r2f7mpsVNuHJiqgZGjZRt+zEOO+dQZahsG/V0hAAKegbi21Oitx3opViB/bmH9xCqT4ZDU9GttXi3/fM EZTNOYZXPg8e7UkAUAMIsukmHtgl4/V+WI2i8xtCIFaUxvuOTLvLgQ==
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69ed2674 a=ivwHvKELjomHP5eB21RdOw==:117 a=ivwHvKELjomHP5eB21RdOw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=6KmzlaTv6ROrj-tHFqgA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 6567C467AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[smankusors.com,none];
	TAGGED_FROM(0.00)[bounces-104542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	R_DKIM_ALLOW(0.00)[smankusors.com:s=hostingermail-a];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
device tree. This allows userspace and drivers to identify channels by
name rather than relying on datasheet name.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 535cb6a2543f..15246f4bd267 100644
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


