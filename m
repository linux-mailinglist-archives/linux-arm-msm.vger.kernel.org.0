Return-Path: <linux-arm-msm+bounces-104561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xXrdKj107mlquAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:23:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8546B0C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39793012E8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 20:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54D0390221;
	Sun, 26 Apr 2026 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="M2DcZfD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bird.elm.relay.mailchannels.net (bird.elm.relay.mailchannels.net [23.83.212.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC5F2E0B71;
	Sun, 26 Apr 2026 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777234495; cv=pass; b=jse5QEIbo4MD1pwKpUZ6G2jOFZkXQWsyGEYpvgel2HSb+zwdSl130+eIPDsLxesBXNjW9aWN8PNhsyJhL8ihpejs5ZVtAHBnX1ViTGiObKr6ZUAplqQEdQYalU/Ocm+WpJ/xs8PyNTKjKSMIx5XqAO+fyZLCCOHwdOVGJc4Tiio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777234495; c=relaxed/simple;
	bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=s6KYoqSQJSw3Ixmuh1+a9DV7U4YSEa+4Ic3TXN/qWgpLAR9IBNh2JF+vc+TM4pOjFWX16wnvn0QiZ8m+oExWTQnSJxWAaczsOPbRaBimsT78EPkaNTW91l5A9NNQb+E1dopnN5ZTynPTv2IMs47DdibcRvDJZ8/aCnIytek0CSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=M2DcZfD8; arc=pass smtp.client-ip=23.83.212.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3BE134E1BD1;
	Sun, 26 Apr 2026 20:14:53 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.96.22.203])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3FED54E1010;
	Sun, 26 Apr 2026 20:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777234491;
	b=MFGFpg1iCQZ3jsXxd2xkVUpe8OA+rQCz3JHbKRdKzKPMM2jkKQlhopiVO41YxO4SydrmVy
	rNRoOeWBejHs3fVtgtjQC8CdoyuEyYSuswqlcilQQdnX1iy+4bLe8gUTXNALUalQ1wx004
	hglyMjLrWZ3HS/D0ld0LwesLVm1jJQzFFH0nBWZGdS1UJ6yluc0s47OhVMVXkrZIWTeMzo
	FDZPhh24d5kqm1/eumEbGs4daMZBiPqe0HgQ7HZtnfUAlKb01kCKSD1jUYquHXjhzQ6NIo
	2+OiVzz/6fUsI7590DJPjksmouzesniEQpDAxaqkOSZ+SML19cgoVYUsEDXKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777234491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=W41vQWiufKcZ0AiCtL04UMQruqzIa9qiMxLLIx02wiTFgrGjIjtYPVQHpVcl/3cmas/05A
	9gmgTXzxlaCxGLTOT2Q/O0RPpf4c4xe624FjZU8A0nYxKYoQxKM5AQUJSI3Axz4HSXuW3O
	kbeKF48cUaWVy98tBfO9Ot+g94M9RgfHOUBUUaKoOxYOy8cRqh5NvjeWRXGTDmo/cEJ9nK
	gdpfWo9uocSb8UH2cyNCDgsoh1iWhMeF1hhuIvc41Z5Q/FeaqcnXNSlu2CDwlfo4LpbqxJ
	qS5oXCTiYKso1iYr5338H/tuBfWsCm6M9yVrH7O9GHTRrDMizp97Utt2tsEOiQ==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-shvgc;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Hysterical-Sponge: 27dc178739188ef6_1777234493138_4263450223
X-MC-Loop-Signature: 1777234493138:4284458491
X-MC-Ingress-Time: 1777234493138
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.22.203 (trex/7.1.5);
	Sun, 26 Apr 2026 20:14:53 +0000
Received: from [172.17.0.2] (unknown [125.163.204.171])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g3dGC1HzFzyZP;
	Sun, 26 Apr 2026 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777234486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdqPNcyC8p5DZ1G2D9ueEdeo+CXG8qVsYjxRxYoj6so=;
	b=M2DcZfD8E6QCDONwLkt2j0zx30PYvXkhLW56KMKu6IPkN1wL8H88Jqr4ROznM43bsEc5wD
	Re+p8GdG4BN+BLH+9dewO21PGyHEh0+4Lu7tlnqZfuXYqrc1K3qTPD/3ntWqKt7T8m7Y/w
	qbx4Q3tTXB0hAVO460CQQ7zfShzjoS9J1URS0rTrCg7dYd+UvWi+owlE2BS2+ntEMX0Ad8
	4dg+xR1IUXU4q//FuisxWelHN+ErvmxovL77xp78wmaKVJkbmoXqzvrrtV9urkaGCnoVCR
	LYcWAmaZhtLCRN0ekKdNhKKZ/qLWGOavSFWdfdyFGyP5sraUTSakRWA51GBIEg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v5 1/3] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pm8xxx-xoadc-label-v5-1-9e7b5a53ef99@smankusors.com>
References: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
In-Reply-To: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777234478; l=1868;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=uUqaV12seEtPtVIXeUjLaxEeEhA5OYLznkygmUrFoug=;
 b=Q49jnUDZsGIzQDGrJ46uj31/P3jZSdHPxpSiNaY9yuQZhAon0vIrc/ZY741woZFPgQeocDUGx
 2N7pAIMFFAXCUsODhqYIznwQEKCFfPqaW4pXOj5k/vl2Z7WNp3hw6Zs
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 26 Apr 2026 20:14:42 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69ee7236 a=x8mjGQfUP7wLEdXozly9Ug==:117 a=x8mjGQfUP7wLEdXozly9Ug==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=6KmzlaTv6ROrj-tHFqgA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfL+VrNLayOqx+kNlhKX5oPJXW+4UH6HcuAk00GO7mIYBaHw6+f1gQNqfUOYf8uDUBahOR3G3YWQB3N1Q9j/Jn4Digeqd2r6hpTBmdSxc97V8e0hLkzOi 11KVp41rASdT8/OXh0tMLbhGyI9kNVI84fsWehY7oueZbcAy68lR87EsxhxpJof6YuqsMIDKG2KrPloqIF4H1Y49rFzlRQ5a5Z2QJ+QYA3Y3q3+pafJFmkaL qYc0x947ogZ+VaSS6brsB0rpGqUiByJmFuG8LTKv4qcba0xC69EAvBCUkCeDOTFUyoDvtUoTrpd1GU8xLI/J7WhNcNJKOuRXKh0x6jLE2G6oTRzwWvMUlB/f E6Zy+i58Cc5XPGxEb5/AHRDKTxu7F4AoHvDzjxxeA855C4GhJ5soViBNIpAnS3wDqEJWmCD/VLnfX13NqZGmD6ER9OZzP0nBEzEKbdTI4m65LI6LoysHnAom PdaH2Zs9TpYp1oyVf+YBtL3xKDDZfpk0Ti7eEka5fSZgCp6/kFg0ar9BNTbpvKs0uZoM+7c5iSoe+MrhtiJm6CzPBHaKAIKeNrneI8gvW43gl1FUXsM3lMqd XFXhU0E9a9JhBXKvujYblYGWVVDZmsmJiZFoKiOtrnjrlq0HldIzm/xn/OxlIwX4tzfTfLPw6aAZIDH2UJVqb7FOpv0fKhDKBh5H6iResokY6yM3gH+gFf+E c00DC8ZqPVbh46BvZO4Y/HDWgW9LPpMJWLTUX/Tmdb5OUchkDIku/A==
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 0EA8546B0C2
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
	TAGGED_FROM(0.00)[bounces-104561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	R_DKIM_ALLOW(0.00)[smankusors.com:s=hostingermail-a];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.907];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
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


