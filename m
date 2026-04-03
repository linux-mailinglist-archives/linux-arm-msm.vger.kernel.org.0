Return-Path: <linux-arm-msm+bounces-101657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPnSEVXIz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:01:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C209E394E28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03DA33013897
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495893ACF18;
	Fri,  3 Apr 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zzcx1kmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BFA330B0E;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=ieFmZzz6snYZCR+sW0sAqYxoba1i1CFvd/SRTctiXoriF2SMedU5U9ma0VeJ5or5sWrBojnw58x3eARcoK/sRlD7+WGwcoSBmXG6xzmLtB15zuLJFqVDTK+zqQeHh/QvifGlUiC0L3onjbgLpf5ghMMbeZeqhtEhkz7CHT+LPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=lZ/Jdqhu/D5fzSK65stiDbxUGT/qsPhk0sKr0RAYSL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEMzBfkHqMw6JKiaB1jkRfVo9LeP2crv22JQYnpkLAiMg4+5Za9NFn9EfQDXTxDzxxi9ZDZxkIrumOwXoGOm5mC0jcGxVNvuunfSOXifMFu/i8TSXysRmkGhWx7sy7O3LpRh2C07oHTT6Nnsw3xpwvbYYMmyaYPucl6rSPNXTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zzcx1kmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFF81C2BCB1;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224734;
	bh=lZ/Jdqhu/D5fzSK65stiDbxUGT/qsPhk0sKr0RAYSL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zzcx1kmQkt2IiL8gCWe48RluJCzNGPcHMOu51rYjnFlpAK1hg673TbuKcATzCz+zu
	 b4jaZK7MQCOQoveJceid+ZMDRtl/0zF+9CdL3lJzQprHKKYLGXNZRzBNo/bi0/9D6Q
	 fEucPEpohHaF8RAk3zghdTc7mSid5z0h1f/kaYDAD3B+DWzXHRv8BfU2bysZ1raxnf
	 63rZXInxFjMlLp8xjEU5+V/kzD81UFwuwxEOilHvZRWBGNKn336F05sr7OntVz5Pd+
	 85xR8PUdSkLDmoCcm3CHNgiKwHa8KSjbpvtnViOyKcdP9Me5ppCK/6qZqVWVfJvufr
	 2gObt/F73giHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62B0E85373;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 15:58:48 +0200
Subject: [PATCH v3 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Correct
 touchscreen sleep state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
In-Reply-To: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3p89nuzWMcLg3xFnxiidibI8l/wXleSjVbWxGiy6epA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8ebx4SmbawhVTwGcmD5aeTpVlKAwXUN9BFhw
 il9hg1v4WmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmwAKCRBgAj/E00kg
 crlbEACv+62mnegW2bXxUSY6S+Ho+OdsRXU58kz9iSpMeQv7uSoNdUP7YYhA7cRxEd1OVR5OGu5
 zEvo/0FEtb97tsjc6aYz2Adz86uNyju5Zdg8tgB/vc74/RwizMIL5FJm1YYkxV8GvEqR1aybDQ8
 Fpjwgo1/Q8aoCVVtaET6cHHw31oQzdO4m7A6QfokYx/ymPOa4RM8NifKareBSAFor8roSUX01ru
 W08+RRSXBX28zCA8+cHldHHDHTljhpBZJm4OJUL4F4m38nm9rdW9JrnxwrEAxaFZiGtb+bOdyUF
 i2ZTC4bhO6Dx1dXCJ0iIim5P2ciCqNBdma/goSc7QTdcCjwMCkdOi8MzlgbSSJmrxvXxyQy3f8E
 81MlFwEQVWOcbtrbJU67cmTmNhpHUKvmI0sMs07//8uBv7H6p2kr+0Fi3WvmZiMnxZLPpCDUS8H
 VADfUNFT7Wyu88YAWx+nbMh4NpPLRGBhTN/MGjdDE+MRm8KA6YJmLhhK2C3U5NpRLiZN9mORYlA
 E9sqCJnKdxW943hRlytLJcmf8x5BNtB72FRrCr3TaoY0M3gatG6uE1SICcpaVgUwWrMjPpKAkFb
 XiAc2pwnM58TZty4ummFQBD3p9bY+VW1aYs4yordJxM7ZIqevkFXwMlBWYRCbzxOIBlQ0tX2eS1
 jqi5Vb6OP1PTl/A==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101657-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: C209E394E28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

There is no suspend state in the mainline kernel, use the sleep state
intended for this purpose.

Fixes: 45882459159d ("arm64: dts: qcom: sdm845: add device tree for SHIFT6mq")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 740eb22550724..783d66cf5b0f8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -446,7 +446,7 @@ touchscreen@38 {
 
 		pinctrl-0 = <&ts_int_active &ts_reset_active>;
 		pinctrl-1 = <&ts_int_suspend &ts_reset_suspend>;
-		pinctrl-names = "default", "suspend";
+		pinctrl-names = "default", "sleep";
 
 		touchscreen-size-x = <1080>;
 		touchscreen-size-y = <2160>;

-- 
2.53.0



