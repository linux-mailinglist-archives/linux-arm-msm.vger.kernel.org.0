Return-Path: <linux-arm-msm+bounces-97062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM4rAdW4sWmTEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0A268D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2280731A476D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B66367F4A;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXm7xL4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9635230DD2F;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254671; cv=none; b=RdhU2ZSbpBwp/zRR51O30CZL5VrUklvX9oDoh+05dgQcM69e4+6hQ9P459zbo2W2OO1CsVM1LTOtXFkc5sip7A6/JdVCcKa31I4AOSUzUUkA2e9+VfyDWdo/aux8Vdb2OU0Shpfq9KCUUK+Yc2DGCrJsxM3NjI9TWanD2xnKkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254671; c=relaxed/simple;
	bh=1hwN9lB39gZMN/iMHPqeoGVh2gh5ZyKeriDbiYZU+jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGr1ynn1y18w+ixPd0Ugtgd7q/7w4ryfar/880+Vf7IkgoEvdnz24C9Q7JwRc6z/LR5FV5AWdpKO31W7lXrFZw0D+nsjf5tqzOU+rMmn3wdPTOIU0jWarrATVJb2tF2ulOLftucQRywdfPG0St/neNcRBBxF7qBafLlPjXqzhZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXm7xL4c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C86BC19425;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254671;
	bh=1hwN9lB39gZMN/iMHPqeoGVh2gh5ZyKeriDbiYZU+jE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QXm7xL4c9zphgE4VjSSEtRdN95S2W5ZmGMzRPSAp3t6OgHC/eBXkwxMAe+i6SQugk
	 23hI0xakdsWihG6Wk+vhv3hn5r5h4Q2uOBSWlibMikhdugUvIXnDUSsbzYALqauCFK
	 CSkRsOwGzXbMgcwA0yRN0ydPhpLc8m0QZWKwvU8AmOYHtvybuUwkEHsosq8bzlCfH4
	 HG74NtQrBTbwJPCEunTiUicDIQHpt7Bgw6AoHq4ZnDMeyYYfQvpdz7ABBM+l7f1uyp
	 alI+onguGhzpRx5jN2oyTRPUc+H0L1t34kZS+t1HRlWGu5I2KaTjkezFL03mkn/7aN
	 67+JRjSWJkDbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D7A1125866;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 11 Mar 2026 19:44:29 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce
 framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-beryllium-fb-v1-1-408a580d125e@ixit.cz>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
In-Reply-To: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=i+PpcsXJJ53DrxBp3ADnJsJTSeGIaZ45KNoGbwtVT7c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpsbgO+vyDUcHpIKz/T39SZ3iI42Y1qchdCybkd
 Sby9saxZLSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabG4DgAKCRBgAj/E00kg
 coi6D/9E4h6y/4CrOKrqkUzpAtAdVD47dHUZ3BnJEqDl2xqoJx0vCQlX97QkiNSKsJ64e/S2lUg
 naF0xH+f5hxXYfYYp7r6ZTxPNf6mdM8RPHAIlGhK3KFWNJz57joD1cRA7loPBLx4Aj7ZJxcmKG2
 uWsxos0zIkAE8tLRdLYhimr4QcJ+nLO0KQ0w23KVVWSg97uUdsD29Gp2FolsomQdlOUh9jL5xOZ
 +Cz4VfZKMQCqo9DELgoj+NRWUlA2VyR+7TYXNXj8Ec4EzBxI058/NMOYTN/W07KduTUcQesNaY+
 B0vXbR6qXSR0YwACGvTF0ogjwFQMLVA3lo5BXUmkYDgCgq26Krnnnh+5/m14allMiPs8KXqMNp9
 0OEFHlizKEe30Wb2EKl0LtgAZnW3H3k1G+6/86UYwhEblpCf1hYWffMSgeXAbEMFGZJcx+Pp5kq
 kq66KJchdxnoKu7NbefvqHa45UKFLhKnKEmLmWampYTuKefo+BQMOU0yT6meofeI9lHySARUYVt
 ichOBjeYYqjFbHXO/hFP/SKyGhSb3OhtQJl8m2jFyN9Snz0v/5yivMqFpHgkoApmtq8bl1IVCTe
 QzxYq4bm0letvP9zvOL3AwrpdQfawZWA/GDGWc5GktYK2INjQ0sUlgzQoFSm1J7ymjU3hYfmsp6
 z8s3lxaHQIU2YCQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97062-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,9d400000:email]
X-Rspamd-Queue-Id: 9CD0A268D81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Add framebuffer for early console and u-boot support.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 01b570d0880d6..bd6d7a3cfc0ac 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -39,6 +39,22 @@ aliases {
 		serial1 = &uart6;
 	};
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+
+			format = "a8r8g8b8";
+			stride = <(1080 * 4)>;
+			height = <2246>;
+			width = <1080>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;

-- 
2.53.0



