Return-Path: <linux-arm-msm+bounces-99452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPyrNhbMwWm4WwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:26:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 844552FEEF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B2D930E3643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827F53845C6;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOTA1YA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DC381AE2;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308044; cv=none; b=eyBN2OtlhNfhLYgVrwQfzWaEdpWGVQVN4f97lO0W3Fn6Yu5Qj/96aoknYqTXiId85vcoNVSVhZin0/p/OC3QtBc5z3xijhUT9/rkavHRR3ko+/15M+PYZirDEIJDT1W5wLYl/AYhV6vv5OpdvsSp1BiluJWlWbF+EaXcF2iIxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308044; c=relaxed/simple;
	bh=bxP1A6IybLUW2ZFmHnbweKo79KZkq8k1hEfaTmqbHXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT9Ku+Z9VO9EtlKUuNWm7RV3Qmjtxz0nmxY4zHln0G7UJmPe6P9T/4Kg5+tqof11VJo3tQMrMgKqxpRGSQ7XpzF/PnTL3qMtyRCB74m05+91jUkDJ2eMJkDMnfzfisINxFT7PEp3SUlTYvXm2J4BG0s1gajHja8p/fAsqvEWT6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOTA1YA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0944DC2BCB0;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774308044;
	bh=bxP1A6IybLUW2ZFmHnbweKo79KZkq8k1hEfaTmqbHXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aOTA1YA0VasBnYqLJtwZL8dggl1bQMM4F7ZjiJptbmWZPg4jP9tpBhEJ0JEX53Vhm
	 S4hfelq3Y6i3t/UTEOhANTD14q0ME056Sl3zgCZv3+iQvsuHJzGHv4LI1ocIyiyY6V
	 /4CzqYz+oSp0tSzQSC0EDLGS+lzXdjya+PDFm2CdwU3vIBDMBMOZT1YyuQXemYp3FR
	 dphKVB+lH4ny1ODBk12dsHaSLoRDCqNjbBDHlK/tNmr5rhmyh1lPj35yUnyRUAJAQY
	 XoUk0jkxI6lqvsZDDIY+OexfhSWJEOm90AJVD8sOFf/+lm9RnA3Remi0zKesRiEYWx
	 Pc5RlsLzKTjTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1AEF4613F;
	Mon, 23 Mar 2026 23:20:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 24 Mar 2026 00:20:39 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-oneplus-nfc-v2-1-3eef052c9bc6@ixit.cz>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
In-Reply-To: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mZudGkYZcNaSxQ/CeRT/N/ZTIKwpfDRvjxNRkrrFQYc=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGnBysqjzT3RZ4hWQlBtNfrWQuJv4l7WBFalj4taBGlUe1iVb
 YkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJpwcrKAAoJEGACP8TTSSByqFAP/jvb
 Yb8rdRg+E54QdbNUHrZwwcXYfToCR6H0dAblSOa9Fx+wutG+wpP0tSEGNviuh9IbEafhF444Kh+
 Ul7SlfaC3lPkZCeyvyUK/0UxqNZRQtoTWdOlKbKy8U/r6HbhRe1IL4X67n9JcH1he2j1P6z4kda
 RlsVVH4ZD4qKnGf8cuxqxBZ4vDSUgLQ3Wk2f0cx/FeGS4Hs39/7HDToPYd2TTbV98+7LvqwjFlh
 /JTAG+EF+Jmvqd9aP6pvOPb+gnW4DCciFSgmQWdcehqxapuE8NDDUq7VAua4Wu6fyT3IbneImTm
 6Z7UXjgWfS/GiS+W5fh0e/04jW4v7pdJL7XkVdfZ7gCBixssu6DnvORo+RlCnHyY7EqNxVl9b68
 rIrKJ9W0zFHZi50JcQabD51QB8WMbPzJH0eamdFyDyktUffTDdlgg1zNMwo7ZtTIsonuerJDjHW
 UoXxkRcaYOCQiM9ssziqN7EiGJnm3BBjw8/WUBpgc1oRvkG+95pDwVkduN6SOnfC5VEDvvCubsg
 gjqCikdk595D5aJ6BlIA1+B1brxwNbF151BNWlJDJY5AJsiaC/AA5JfF1ZlIql4ygLz7oYdQBfg
 vYACWWZlBfGP19niXbT1SObsC5j61GB1ZC9xIM8fteqyZqp7wAwh41yYCTTy7QkD0JzwyNUahFB
 YUiN4
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99452-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,0.0.0.28:email]
X-Rspamd-Queue-Id: 844552FEEF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: biemster <l.j.beemster@gmail.com>

Enable NFC controller NXP PN553, which is part of the package NXP NQ330
(NFC + eSE).

Signed-off-by: biemster <l.j.beemster@gmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5b121ea5520f5..4fbce4233a773 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -392,6 +392,25 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn553", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -594,6 +613,11 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qup_i2c3_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;
@@ -926,6 +950,13 @@ speaker_default: speaker-default-state {
 		bias-pull-up;
 		output-high;
 	};
+
+	nfc_default: nfc-default-state {
+		pins = "gpio12", "gpio62", "gpio63";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
 };
 
 &venus {

-- 
2.53.0



