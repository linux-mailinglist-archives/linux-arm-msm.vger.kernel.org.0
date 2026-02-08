Return-Path: <linux-arm-msm+bounces-92141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F38IA/xh2l1fwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 03:12:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB091079FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 03:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D27F43003839
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 02:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA730B527;
	Sun,  8 Feb 2026 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwduCHpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFB254841;
	Sun,  8 Feb 2026 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770516746; cv=none; b=p0+nyKgdWjYEJI+30mUl32ydJj1rqzt4WM0ls2ubrGpBz8cmaTB/AAshCsJSLgHhJSeA6dxuJrX+R4Lz3d1SxaeMS83XC7+YAGIFCyCNjQx+T/ku60PNaYHF2xxncpiDYy3gHqnQw6kXT+VlRaGcZk56SGN2T8EEAyN3bN6cr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770516746; c=relaxed/simple;
	bh=pseOMYpaox9OqGgB5Zl4FY4LXRwaw1GKwWydCmwdG/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C6wF49u7vAONMEkAao7MYIo8UyiLbYSax+WO1L9In8zv3OGCpWCuOfzKHfgi2ZyetUc/5r7przWT1FYLLU5pF2gfcF81UlOzjTAgei/t9ZG3SD0DkASmZ3oecLYLj3ZvRvx9NGLOzgqnOGdB5GdaXkaMtSUwpMwfDTTV12cW5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwduCHpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EEC6C116D0;
	Sun,  8 Feb 2026 02:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770516745;
	bh=pseOMYpaox9OqGgB5Zl4FY4LXRwaw1GKwWydCmwdG/g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lwduCHpoPXqOT5AIbOXblaGvfONHl6868EUNf2pEWJwgg/aXm+Be9RkdzgriGvAQt
	 iPNxIAqT0DgSCWjiDhrph2HHgzvzuEISKS03ov97z76fPjQQbcPaOoTbHvWcSn/V6z
	 5HqDnJW2fwZ5lqCiNuULIxeALqQWA2adbZflkQoEKXZb0uu4Xpz5fPbEVYkQR/2lBW
	 hdkHs5rnZRsZJvynEd45mSjGynIAQsQHBrffQS9+dT8Me9HMVgtt3mzxgNwhOm3P2n
	 1u1ZhOvud1nLe86gBHmRAHLPh5jaZDuIICYUTU/Xsarm7x16poE5VlD9Dri15hXQRO
	 nfxIDPeZIl2aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795D7EF06E0;
	Sun,  8 Feb 2026 02:12:25 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 07 Feb 2026 20:12:11 -0600
Subject: [PATCH] arm64: dts: qcom: pmk8550: Add PWM controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-pmk8550-pwm-v1-1-f2b26ab98d8b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNz3YLcbAtTUwPdgvJcXWPzVPNUIwPj1OS0FCWgjoKi1LTMCrBp0bG
 1tQBRMpMhXQAAAA==
X-Change-ID: 20260207-pmk8550-pwm-37e7e203ecfd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770516744; l=1352;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=nkSib1r0tiqP/QFHvtzkaBG2I3y6pZ5YlqojPgxhYug=;
 b=WwacdgPXd9I95XFOewoNrVUHY3wYGX1kyiu++95/qjcS5hp213dk57+rlewaOY3TDIljTZSsu
 J8NjhJQMZQVBTHMOEs3dGQsQEWuQgpHNFxApLn87gr95PhiLNailWG3
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92141-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,b800:email]
X-Rspamd-Queue-Id: 9FB091079FB
X-Rspamd-Action: no action

From: Xilin Wu <wuxilin123@gmail.com>

Add the PWM function to the pmk8550 dtsi, which is usually used
to control PWM backlight on platforms using this PMIC.

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
This patch was originally submitted as part of a series to support the
AYN Odin 2 [0]. That series stalled, so submitting separately.

[0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 583f61fc16ad570972ac166aef12183382ebb4c5..3049eb6b46d7af77e5ea39e41ced0de24ee9f3e0 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -73,5 +73,15 @@ pmk8550_gpios: gpio@b800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmk8550_pwm: pwm {
+			compatible = "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-pmk8550-pwm-37e7e203ecfd

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



