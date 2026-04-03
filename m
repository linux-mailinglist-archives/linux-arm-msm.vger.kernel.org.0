Return-Path: <linux-arm-msm+bounces-101620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHhKEESKz2mmxAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 11:37:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CE392DA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 11:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46451301C96F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 09:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4D82F99B8;
	Fri,  3 Apr 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="KTeGR0XA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE030FC27;
	Fri,  3 Apr 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208791; cv=pass; b=SYDCs2g1D3ogxqIYipdfTtN3sJWmlur5FyoX/WxQnmKmQB6wsYSiBdsJMK4dCt3MUB5lSg49FlzAP1KfOIs51UElHQWWhr0+hRB6QF3bAq5UBKZPCxj7qEvYGJX4JQDCurn/e+yGUKLeKYBkdBOKK29Fzev2rWgWTGbcgbMxNyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208791; c=relaxed/simple;
	bh=NQXiLdLmDCoMNO3Sl1Uu25i/2uUDrDKoD8Rqp/Z63aQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=LZDR4zV1E/9Iu+LgThbb0rRLXTK5j/ZpFSADSEw38nYFoOKXkNahEHjm4N5PO3N1ffR5AR3ewIgSWEUPFKJcFiHenCfLoGIdCCzar022WX0onv9A9t1+Vw5aMPMP/G4UcvwMweA7uLMoTIymJ20swe8LTMTxeY3gmlFd0MYh6xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=KTeGR0XA; arc=pass smtp.client-ip=23.83.212.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5E324401627;
	Fri, 03 Apr 2026 09:23:29 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-96-234-227.trex-nlb.outbound.svc.cluster.local [100.96.234.227])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 593474011C7;
	Fri, 03 Apr 2026 09:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775208207;
	b=lYNja0+FmbiEOjpGvUQRbC/dzOsUsJvrg67oti7IC3Ewbap7apvfFgvFEGV4qPyT2XHmXt
	XyrPfM6eEhCFcWSk6pp8U3xpsYpEeJqN2Q68FlEhCYzNdFTT9AaTf4qVae67oaILoaKsjU
	gwHiUBEersdRm0XqLjqPkh7x2cUNn2jWWzxUNCeYPylVIjlnLE05FvJz/X9r0xnlwPb2yH
	8dzMVlfvtSKgNHsWcmUzTM+PLlypWannWP6/ohOElxIO2gNv7vk10SbsAPhqA7sBOf8KTN
	AR50appS44UzhP1+TNYBKYAe0Xp4R3JHO47lqbgtvKiX+1bKRIUNobclW2W4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775208207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=moCbtDjr4jk52jpEjStHpX5elRFhGe9yWCKpleCbKfA=;
	b=Rbcsdvh29UBCrv46PBoMBGjBMx6cw9Olx9ylNR+tg1E/Wdjm25Hb96lsLVa8WOxE5bV927
	WrjTaTpaVdmOdJTJ8pNpFYoPAHWhZUBDD+qvEGHbcnKC+YSrtnQoxi5E5/927r7si/fPCS
	U0Y1J3LXl9mLn3kSZ6PN9d0GcKQgZvBX3E1fygXlXuU+OAsFLEcga57tRWkP4CEyUEcboB
	BbQg0kOOW9SRO/vWrNiL3+W7h8HTUiB+/qthIbabZoXPNv2/aUR2UhBeLxpEmb8XAs9fAc
	HLV3hzdl6im9wwhgCo9XJ35e4NbqMj0Dl4fJ3/gR9nyaSDsj/NoD7gutfS7eSg==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-fqg8r;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Rock-Bubble: 6b96ab4b71f1be28_1775208209141_3266784317
X-MC-Loop-Signature: 1775208209141:4058839875
X-MC-Ingress-Time: 1775208209141
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.234.227 (trex/7.1.5);
	Fri, 03 Apr 2026 09:23:29 +0000
Received: from [172.17.0.2] (unknown [180.253.47.239])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fnCv70sv0z3wpl;
	Fri,  3 Apr 2026 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775208198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moCbtDjr4jk52jpEjStHpX5elRFhGe9yWCKpleCbKfA=;
	b=KTeGR0XAtIrPmUQzSJFIF1WrAtmj3o3/qybQpcwZ2KV8png2w2ttEXXu8fk6yjuRallu8f
	3nyyELrUSFabkHDuuEqWeYsXKipunvNh0Etbfy4VJtz7zdxM1612pH/XRH0k3u+5kW8zxt
	Cq4fOrIFYqkxznCsVUqP66sqsTrNnuPG0dgPMrA96PSU2lmCwzKtCOKhuu27Azr5er/KYQ
	UtIYaEPa1q7V0lNqNwz9x75hFOtoowhkB+jHA0DyKJKXR5nxori7RbVJg3PQMC8yp0Lf6/
	Okr5YCphwlismZN5avRW0wC59ihRJ2WkD6QFLckYx6BfYoQz8u1uqR86Aji+jg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 1/3] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775208191; l=1857;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=NQXiLdLmDCoMNO3Sl1Uu25i/2uUDrDKoD8Rqp/Z63aQ=;
 b=6mMeAln7zNa2Z6ct3gEXWSdyD+MQZrQpQDc5mIuTSBj2PHPX/VLQmrEDJRrVTCRgFgN4xoDAi
 PttA13cKMEXAAkJLbklcnq23sctDG3vR5V3OlyJmQp6lchFvXIPNcBR
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri,  3 Apr 2026 09:23:14 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69cf8706 a=EXl8KfDnlL3m3zOSb15mOw==:117 a=EXl8KfDnlL3m3zOSb15mOw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=rt3x4hDEALvJiYIjBx4A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfLO8RNLQa70s9U7AObuf4XuGV0DIKZjkaOd7PDu3F/95Vjp1bNm/LF6rcf+Fs1QD289FuX3PIQzvSTc1htNm9W8VJVZlWLsCtvVv8kjFCR+OpocOdhZ1 TEgUdp6zy7n7cL8gSOmLmW6jETTK0FETvsUSPk1oO6p1rdvCQU+6HiS9ig2gmeMJm8phnDaMZxFEikPhvcFasV+1WuQsiZO6xysUV0bb/TyuqU8WK5Ad/s6c 0Dba5bVCWbenF89MMpYr6W1TvAbc7K6o27a0LqeD1ZV4bnAxK5AXmAiIHITVzXuT4hSjHdrDU1dOh77jlkY0AtPJij//zQCJHXg477xzDq9RqAE0Ycn8DFHX a09K7kleeEcs7w0vABaSkdYOFVvhQEyahk2ew/bQl6Z1wA+d5H/tVAYaXplij0wJmjfcbpOqIIZECOhHAk1EnO4QsfTKnl+Xg0bS20kgd3Iw5Bic6pfgQQyp 3HTROLtBMHf/mzr0nZlNfoL/0sEvYxCoCD31G9//nCpoVft09UtBPjAHw5vGkRBlSkL7IfhwJuSHemgN04fBnhm/+WTyCNlCkDOMfvoGD7dlMjmFfNPlVqw2 +smF3GV0/huQq2cOGEbjrf+w8Y/+g+/13uuQt5UFK4/J8+miGJWl8jrO7ooTqULBIwyIumvSAEF3cI9KZkncpwLQVpvPZ+q8ULoNbA3hehZcGA==
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101620-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 334CE392DA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
device tree. This allows userspace and drivers to identify channels by
name rather than relying on datasheet name.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


