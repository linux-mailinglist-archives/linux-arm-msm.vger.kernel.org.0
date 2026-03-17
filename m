Return-Path: <linux-arm-msm+bounces-98272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEEwGuXRuWnuOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D44EC2B2FBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004FF30783A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 22:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7A435AC0B;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK2Frx8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A52C11CF;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785555; cv=none; b=Zeyiu6B1yvIdoYWyjBXfcYv2tToz72A6HXOHPsM03DmQiatILT4H2ljqkfnDYIM5W+UHT2vD/p9gSdWjfaBevWNxV2b2ahUgdOu715aeGaGkmEdJwdUQDQt8f7eUGidJER4Y4euHgZ9QYU9sxmp8tXWUe7fSDS1jFWN8njze7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785555; c=relaxed/simple;
	bh=CVEkaoGx0ekmMxMLvFp6JCug4ttN7GX5WgoeEx0P+jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9AXY7oXQsEW5bj4XAjOSfeogElwA6OOgHvh8yVB+cWZ/+GsYFOLNCLfdhRwucuE1j+ddf8M1K0eFoyL60K6aBHHIqwgOePeIWUNiAE/kKPoOKHRI0hCRMR8+b1GAgrlJYE5Ka2F0zgMxR2gNz+ngXaoSFl0dTQfHs96DMSG/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK2Frx8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDB61C2BCB0;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773785555;
	bh=CVEkaoGx0ekmMxMLvFp6JCug4ttN7GX5WgoeEx0P+jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WK2Frx8rLGCdp3JH/YmxhGqtviHYo+gS4FjOt69qJL3wGgtpKnwj4nhVppZFDGx2q
	 KBgJVICS8npleL4LzUB9bccEa9YkR7wG6nh5XKM70XOrADnu2n0eFtn+eyAOw/USE4
	 0P8h0E+O5D/sGCg9CuV+Em+9TzebgPMKbqYy9M4d30CBU6s9qpj/al1YagmUKKi88+
	 kRezBKY9mTuPz4mJ8bLSg341I5wh3URj8PrkfsmyUwwi27OeJnaGpNarcutSTkEmdH
	 loVH6BIFVPNej0kR8A0wx2U3FrytmYR/DbibcHXb9XEEly6tYs0TT57VEc1vh1LR1u
	 W34KHnNLnd3Fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4002FF6E8C;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 17 Mar 2026 23:12:31 +0100
Subject: [PATCH v2 1/5] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
In-Reply-To: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=aBIkL87wWUcWlDR+ZE8iL72LYcdYRCKY1o3iHR+l8wY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpudHQlvN1ADBZ3DT2mCEvHMpnoid8nzZid/Q86
 7f5RN5azeOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabnR0AAKCRBgAj/E00kg
 coTrEACfP2nwQrJ8aAFTHbRP0sIm0Ptb4P0AoN/M2q1jMe+OO7b9e4+yWmTxikPHzAUzK89tGRf
 2WLJZgoUYX2RlNf46OA6DVhvsbVF9bYnc/hYcFaTbSwCiuXLeCLlOcqks16tmBr6mzGvwZb/Xt1
 mM67QDFtEjk1Fck74RCquk5/gUju9N50D3YiwfmYRlEKkzPd6yrl61n5H1q/jM/YGEjkV9dP1T3
 efVQnFo7q1B4CS/vbIrba0DsbuytQO1iVlDe1bft1DQtHu2n3S2H85n/DJfdHLxkBEbMSiAALPE
 iCT8XKcr0KFmbGN6sY1Xj7JEMO4u8pMemwBuLH9z0Hj4LcPpJpv5vlPamQ46l77RqO0i06xjIo5
 MpDDISb4pPvewwetOgf9UUFwe7gDXaaNbyTKB7Ozcmhjvcwh2I7msR78Isa460lHUZKbmwLHZaJ
 aLc654E0mj6ITPwOMjOh4PQfyc5EPpjVDARutT0c9lXufSeqncXjzi9gjeRAX+gM0V5KK3a10+J
 WVPxGClgtz3ech3KMYACwba6NUEC3SkgPEnyT5QTM1CCYUh4hOhsCzBzahYXVIHusx2jr802PCS
 joT1UAYN0ItwahCRg0KSn5S690e6avReEJI3aBDmAYmbvYyz5Gn0zASero0Whqaj49bu8/VpEgI
 17du+yzG6ppBVcQ==
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
	TAGGED_FROM(0.00)[bounces-98272-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,protonmail.com:email]
X-Rspamd-Queue-Id: D44EC2B2FBD
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
index 01b570d0880d6..b928100f6464b 100644
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
+		framebuffer: framebuffer-0 {
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



