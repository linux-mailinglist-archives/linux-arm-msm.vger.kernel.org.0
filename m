Return-Path: <linux-arm-msm+bounces-101255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CONEAizPzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AE37656E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DF3F30D2D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5880390993;
	Wed,  1 Apr 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="LN5Eyjhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073CF38E121
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028851; cv=none; b=dYo0x/Kl3jxBp93A1gpWnHtwoTdZ8CPp928z2BVpbdHQbVeXpyxrsMbcSbTJVKtppxz1Ac/h368IhyA1K8l8zUqHjvgioHuKiMmtyxD7BmjUxdQnRREJopB8K5/D+/2NbABs8BpR2MMvaBQuSMpIm+1AGnF7WpxbNmDVlyrNJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028851; c=relaxed/simple;
	bh=9sjSmF37Jj1/yKIEQuiZkUqQJHlqS7e8NQWGB6S5478=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kqs3UU/igNAOVZ8isc7O07ADFdOBWvMQqo8OyWNUJRCrUvlV0ByXnwCfQMhdyAm4Nbaes2F+g+c6ZOgQx5up2oHjgjfe+u8AwTC6HN5Dr1ZpMfluuBVnJWljw09pihwsJtwemIbGGkfVMEQ85GCtwSWVGW2u0LlGvlNkCroyYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=fail smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=LN5Eyjhv; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775028834; x=1775288034;
	bh=TcQPmkPisSS3l4yiWGk1b3+vCnrbkgc767xf1rlFq9c=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LN5EyjhvQKDoij7n+z5A8aQ9nRLdv92fnyCKc5RUTwGl67iTfBnRUb+e+QzTZmHO6
	 t9aAQ2zT5EoYKr/iscBwxUUa1mTxxQ/P92nRgxDFZQZSrjPJNmdm8k6lrlDHDXVqy1
	 jXu7p4TfkVIoiFKEuzDq2xQKEVcPt5/6WiUp8i78D/fcn/Bxr14CEwQKrtAYHNi/P5
	 n4lD9AtR3sE65yHoU10qXrnbsWs2m1I7f9IzDd6yhpC1E+IGi4HGfzyZDg+BsRxvUr
	 R/v31VCG8EaYxQ5hQzB6MUbXk0L3aypWClPwrZuQpoAICCXwuKTKIUYoE8qOH7HSFl
	 1QvILCzD0EqOA==
X-Pm-Submission-Id: 4flxYs3pRQz1DDLK
gpg: Signature made Wed 01 Apr 2026 09:30:46 AM CEST
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 01 Apr 2026 09:33:12 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for pmk8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=9sjSmF37Jj1/yKIEQuiZkUqQJHlqS7e8NQWGB6S5478=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJlnTkW/DT72l8v3+Pl8N4VtmaUubBvM5bv3e6Se8tjLq
 +CYH8PSUcrCIMbFICumyNL952ta16K5axmua3yDmcPKBDKEgYtTACaSKczIMEP0YWbAncM9PR0J
 3zKOX1Rx4tNT3SkyVY+9THhSn4XGD4b/ATmC0mZhe+3/JK8992Hat4yESPWkT2dOJeqfdtqX+8y
 CCQA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101255-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.35.40:email,0.0.23.212:email,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 000AE37656E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
Register address of 0x9000 matches example schema for spmi-adc5-gen3.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be472badea502a916cdbc9477e9f2b..58c0dd3ccca70bce3424f83bfd5a52b1fef35c2e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -218,6 +218,17 @@ pon_resin: resin {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.53.0


