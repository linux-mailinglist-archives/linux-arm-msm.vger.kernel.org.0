Return-Path: <linux-arm-msm+bounces-102777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEsPKO0d2mmdyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:09:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D93DF3B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 278AA300C330
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1F633A02B;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdBtLj1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E792DEA89;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902186; cv=none; b=bGpJxpt0JxVEU0uaGPkGvE4FG70g9+kt2eWUferjo6jfgSLGMbGbHjxFc1jyJobea6QoRiy2FkP3oBVuR8hlasKEEZ0wDY7zQ3634tYkIvRoGMzxEdvbmoZjQrqvOLlJMjnYglHEuKxzamo9FoaFITJ/uR5EEJkXQN+opZvEMoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902186; c=relaxed/simple;
	bh=aHkag2bgGWJuetbIYmA97ncXylKETCgO8fdrXNb+DrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+4XodStejH8r1FbUQU81gjx/MpdGkE64ROx5mUp4ca9YF2ZAToOPdrm/ahoTaW2ConrylRiv22wzaUjMaQ56Om1TDjkpPmJP9euxvO37+FICBQiWXtAvNTyF/T7U8ziu0u6KR7k/Hr4E1vZJPKNd7TZIWBowN+Oxc23ogElZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdBtLj1j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F4C6C2BC9E;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902186;
	bh=aHkag2bgGWJuetbIYmA97ncXylKETCgO8fdrXNb+DrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DdBtLj1j0iUHnMRzBQBDqhfYUB43gnkVzkijWt9JjvF/GLx8iiQU52WI1rcyp+Bzp
	 czfasXqhqspHz2xL/8FmN8boODeiE/J8K5pxRP5VvLvqsbZyt74XT9fpPNZcge+3Kv
	 zvqCELISp4/l8S/UncN0sU1FRXM0Sb/fPCgXSBo5/BRUijJ0cPCD8xpCBqD+L9Zxc4
	 Y9UfewtgNfJJjucNwOrkGaGVEqCuU6IOBEjU2QE7sIKbkXxKFPsyOwBPljup/3muLZ
	 at8IqGpzr4TVtiYS+c/EJWTse3H5xRIKTkuBZrJwpjoLjqC242jAWAUH33iQRwaio3
	 coWVFKC3z7vGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11225F44879;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 11 Apr 2026 12:09:42 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998 camera
 flash LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-pixel3-camera-v1-2-2757606515b6@ixit.cz>
References: <20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz>
In-Reply-To: <20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oHm5gtJSD89tJ1iKZHr8Xq3et+1+samike+C1B2jGmY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp2h3oq4IMTLAc/PJcUwxGj3JyjDtnXbhTJHmGQ
 iR0OqwcdPOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadod6AAKCRBgAj/E00kg
 cnI+D/0emBL5iXqIrTA1BWpgqCf2aZ38y4Goa5MEEibIwJAk48Iz09pfK1lpxOlIY/OHT0Nr5mL
 sLMCP40ZPb+HBk+IY81w78LSTJoYzKYiKiTF4gONsHVl1AZr18pj5i2qA9UhRG27Zchja6j9zOF
 uvhoak2wLVm6dHDGIBVnKi/IYa7i2MiQrbc8dtE+1hZqyObED6bccjF3Zzig/iIpt9eyVc0QyHY
 Uvye+Btk71UfIEim+JsbOVEd2dFuljRNa7jUR9rWb6qy8vNoAbzPPTy6Ow1Fds0AxCZJy8SLWlb
 39+c91uLyoG3y7J4ICQy/AgvOE1FwzokoZTvR1AU2OWBEDhOKwqSqyrhBEKwKRIdBf7XepCgMD7
 ZS1wSQ8PXW+7fb3p1/b1kYY+kYV/PYd8KDP0cE7X5DIpOwp35p8mWuYiclJKQJSh9MCuRawEY/E
 cwb+gYNEyp6FmhIIAFDKwfJ/a9ezPYVuxQkfFGbEXwD2ka6VGt+SYgTs4Q3GAASvyYh7RB86rMJ
 E46tdsnaeAZXCLF3hGjIGcZigVwjuS7WSY4Si3lfY+T3a1AMB0hUzdxPYreCSXZcRuGHZRoRzkp
 kFrGeDp1Bnh6+pEcqyTOvSL5A+PqPZeUdNtgUa2nJAm+FtiAqfgnM6+O/v5MYC2w2WTI4SDkSXt
 Olc9ItiTrrhTKBg==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102777-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 219D93DF3B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe the white flash LED
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 084058a597c10..3aa164c34f43f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -590,6 +590,19 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <750000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0



