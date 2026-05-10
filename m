Return-Path: <linux-arm-msm+bounces-106793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S202FQ8vAGqSEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA75502E43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB7D300FC41
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 07:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3499359A6F;
	Sun, 10 May 2026 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="CxYCaZxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F187E0FF;
	Sun, 10 May 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778396939; cv=pass; b=AGEJ5Etzlr0ZUJYh6xuxM1ys+pxf5SJYSE1TN2cLRFiaf4C9YQ0XrlTPY0YfzoGBqUJA50Z+ruYPthpI7AxvH9U/tnCnJt6Aa8cIJTR+kLnYJo3OSjZgcTXq89lnvAxfCCFmkBm5MMF9UgSRKZjiKWsRzLZKgd9vEbjx+YQ2OiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778396939; c=relaxed/simple;
	bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Mc9gG9bwSqoLBgJiAzjyoiX7HWgaGPrla0mfUUHXkCGtehBbtf/C6Ojf4kRQKULZAIeVS4SABVBkN7ezHeh37HwM4yTLipBBcRRgXtroPJUzi3KBJDDjD2NHMLty+GweTlOaKn1Vr065hlzVmpgakc8fUGT+LauyqDOHqb+fML8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=CxYCaZxI; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A4290409A8;
	Sun, 10 May 2026 07:01:46 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.100.197.175])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 02F064092E;
	Sun, 10 May 2026 07:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778396506;
	b=rf3s3fN2i4SaSbNw/PDcrjFAN2poRgZEqezmTpwRuRmNc71p2WOwiV4PzP+RWEP3Uza2Ed
	CC3DZAVjDCVhJYGs7Y/YrzvvA7MPgQxoZ7Q42goBao05cqKNKiC1fhrhD823nWXKyo3iWW
	g9BVIX42CBEz2MenzWAiC10Y4qL8vLF5+XJdkqVn4TAD2wNKEEEovxk8h26voOX2lSaw9e
	s+xCyUvvoPs0zlmXxXR1k+JAQqK3zgWtHePhjMJCa9Q+5tRCFSEHfVaIn53Qich8Dgsheq
	HBGIvIGrKr6HxP6EgFTabx9ZWQ8tkdqQPgmRYzCyPj6Yg0j3y9Fk/xTeK+v4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778396506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=OF+gZtWvS3VK+X80OYKQMMeb492fc8uvdBKp0WrPZiP05hCqSXk88/LLuMs+E867FwvUw9
	mpzvP30WzB+/wH9yVV/fP+/Gg+qNAx5fLxu52/gDN42wOCjPG6+/6ERAURpTOx2DZcWaqc
	wpRXqIjRAQ+BDlfw5xJAGfysXOiG2OjvODNytPwEzvFjntGXNQFs1CMZQVh7PBEYoT9icJ
	NfMUpoCEd0qf74oeuwhHwsYRU2fYS1nEZgR4rMuDvj8Ue3nAxAKVymFgL3gZUa+xwN4pYa
	PM8id0QnNQ5ND1FjwBDHJfvt8tVa5zEm0GqCK/ogfMVpvxrzFP6pc2p8E3XOxA==
ARC-Authentication-Results: i=1;
	rspamd-79cfc4d687-4ctzm;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Macabre-Oafish: 0f1b1bd716a3c8d8_1778396506477_3978607614
X-MC-Loop-Signature: 1778396506477:1579005207
X-MC-Ingress-Time: 1778396506477
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.197.175 (trex/7.1.5);
	Sun, 10 May 2026 07:01:46 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCv0d4Rz4z409w;
	Sun, 10 May 2026 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778396501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=CxYCaZxIMvucNVGtisSyRlMbAJ3jc8f1RxNCLLN+27S6y7Ucd/T+N7sls27qD1+doaS0MY
	/9V9sfC92grcMO67yCKa9FxerMRX4E7ZEe7dy7NWrcJQDQrBoVDkA1yfJDoX6hituwdgMR
	/Ys5eqYno0EiXkH63RvHavXvn1cvURl7JTNIfw6bqIszY5V0o7QRTSyD5llAg33lowaZMy
	py3XA+ZNx7CrJNnT969cCwUBCKbkv6z7N+drFRJXLcQagLZ+Hv2TvnE2tOufcACMnzKKEs
	CnugRMr5tCTj72BoJv2T+e2bkbiA57d0zvZkmz4RNFIuySvXMnTkA2zNO/U/CQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v6 2/4] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pm8xxx-xoadc-label-v6-2-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778396489; l=1868;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
 b=YpvieAWbBlxthYULqYFawwT/Gp2x0bmdnJzX+eKg5yBm9iQzn5Zb8A1VQJI7ZK9WAI68+37Z+
 MD429gfm+OmC2FwM/VG87G0ebOd69xP8NdJn/j6dxkWlTQUP6M7ABkw
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 10 May 2026 07:01:37 +0000 (UTC)
X-CM-Envelope: MS4xfDK4Iw6rNShkpnfUtCy2M5CG+YzA/FpUD/19Nch57lLi1y99plHZ8pQhctN9zZsYmsoknmDKLiV47zRN/38ZXUSMV7eiYGdjRYWoU+qIyevMYm1SJ7hf xUAL6kj3EfgGPBUpNUxFB6c4YQghFIO1w+8gWA6Nh409kKnyEZagJN0dklvBmlSLrZETVc4lbz3RrDu1AIm4TBLgwXrAWzqtlvWwkWIS6W4lOCQB7hYAYK+r 4oNHENAASBerjr5LZZjWQWOVxpIcV2D2avBPmHUPh8eYayAxYaHRcEv0Z84l8Ed3i5RUXqABslvBvfl18cpQjexO1XFLAIVvQ3LTkoNdxTL73HLYWJ4yv4R7 gkLdRusvqPpP3ki34Ey8kwxiJfe6V/y4wxBMzhRPI6YDFQsrEfK2IEHlWnDL9Y3DCQX6Nu+hGS2EpGngHf4Dhr9cTOrZwTNmPnuG/CUrzw1KiTpd3doMSpFd zsqpB+xiSms+UhQnu997oZDbYTfqv1gJnB5XCRR8n/dqAsyhGgaMKFW9rkTZBFb9O9131Khx/mVD5ulHRKaVob6mc9OTp12nJv/N/vgmBBDdhpIo6M4woauA 6vRScpEHWhZIbzVMctI0r3waXRfhyncfOqxx63Imt6rncXqqXdt5JVdZrUEbYOK7PSD4e6BeZPq3XHo70V29qxn7ZybXBo+BGS4k9BbOlIBR2GkUWMBSFXXi suLODyRR9VDe8/zpsQ8Zof8+T40pV9Wmn7oi5DWRHBeZPZ3FxN6IPGmqVq6vDXnKroGUus4tI6k=
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=6a002d55 a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=6KmzlaTv6ROrj-tHFqgA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 9EA75502E43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106793-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


