Return-Path: <linux-arm-msm+bounces-100557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMvqFVNdyGnAkwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:59:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9E3502C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF37301A924
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 22:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C1935F5E7;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyfRhz/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7EA33E358;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738724; cv=none; b=eHVZcyM7yH7d+WS3odMJqfS6UjhMYAy4HQJM1FRzVF8mLK8tUUN/AfYtGKv0+vXJfw00hEQe8E52BdPQ8bUHTVv/X/aVunbZVQ+WyZX9qKYcrNTjSjfAX6L3boA0VnwFyfO2DiECmKrWzzhY1fKzL56p8Rv6kL8OLnhhKlWCUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738724; c=relaxed/simple;
	bh=nHP3Q79k1Omfp3O9NIZj0wGgAydolfzgFfeB6Upr46w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W9uo/U5LbE6AqxzHLRRmNZQnKA0e/hpqsCh6irKC9ZuRfzQZ2GcbJkhl0anQTaAVJPaIlnh1HNrD8LLa17ThUpWwCFGv0vsDXjCvpvKsIThiHgpFjzaCfqQVx/Vy1KOTWlqqin35zJcPKay/1Gxm5NDV+1wN+e2/AxderHDeEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyfRhz/5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 447B6C4CEF7;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738724;
	bh=nHP3Q79k1Omfp3O9NIZj0wGgAydolfzgFfeB6Upr46w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hyfRhz/5mnkLQxzEHgYItQwgXehDRDyZjI110adxTjAb/ihd8QxKLIeMg1Z87y2Y3
	 4RyH2LfoOSgEowpBFnoW0N/vy0N/m0Zad65zEK9hovqCKSRtdFI1ig2zRycsoaMiLT
	 35PT40CgUseQ1Wjdl6ZabDSs/IAuI1zSf6Gx9U13Vrs/JluAs/nF+40ILdd4yA15rN
	 9dum7GiKGi1ZpM15rB/s2le/uDnl0V6H13UdTi1IealD6H4pR5zlu8xTmwJzjmuYbb
	 08ncMhdmdKAOG3ugC63xarSFCuWzVKOEoNfNM4+uZ8GyGKOAiqcXXUwVpFpsonOWMg
	 aQmchfxH9s5bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7310D148B;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Subject: [PATCH v2 0/3] Add support and enable the debug UART in the Pixel
 3a and Pixel 3a XL
Date: Sat, 28 Mar 2026 23:58:39 +0100
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACBdyGkC/51Qy26DMBD8FeRzF/kBhqCqyn9UOaxhIW6DndomS
 hTl32tIj1UP1R5WI83OzM6dRQqWIuuKOwt0sdF6l4F8KVh/RDcR2CFjJrnUXMkWzmhO/pbHxoQ
 wkFkmWDAk8A7CgD3e0IGjawK9k02l6ransWJZ7xxotNfN6/3wxHExH9Sn1eCHEehrySHSk8YMR
 oLez7NNXVFX407rUSujmpU+U4y4JeyK1y2gFA3nslFtKZSqVQUCZrQn66aAg0W3n1ZYZsG33wW
 U4HzduhS6Euqv+/WFYy7Bh9vW3kVsif9R1EUAB27QjHVbYT+Y/dnHNGP4pORj6cPEDo/H4xuEZ
 HzyrAEAAA==
X-Change-ID: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=nHP3Q79k1Omfp3O9NIZj0wGgAydolfzgFfeB6Upr46w=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyF0iNfMJR0Hjn40mzpRhY4a+KN6RyU8HE7UTZ
 Xji9/1Z7siJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCachdIgAKCRB6NCVl/2Nf
 eRZ5D/44/oBWn4qtAuhYWUV9scv83370tqe24jS31uyhpYWN4oIlyYDEKJgPuIbsUH3ou9eKUVu
 9VlMaSTp2dPqbBsUiHoqaBKy8+Yzi0dYa4CC6C26RIboQ/hOAIQLkfFSaWYUhzavLCibKMQQdHg
 jbVtAXMOQrahgUjFMKxHTM4V7bfbFYmnxhb6lezWnnFRJLqsajJc0f3mqMR3U6ESi9kkzKd+PP+
 XNqn32c7Xzd4iSBDvCVnTYpZGN2irVz8wMLigYSqFwnfUVT1IZnhcDICeGr6ENGQudwv1PeQa5f
 YCWwbYIxIZgCRZ3U3noRgCnSihtdWW53dJIttJd2lsTfS305C0W4K+ZWNpN3m+o7eF+u3EFOhru
 8xRnaCgekO/9EFbgOX/fccXDYD4GZ6CgGLkuUAt0+8WPkxkUEMBBqATpfoBtBAp/2Ru/addYKiS
 Z0qByh4nLGmEh/VBfp7B6hyL3NsaYYdf0DuRS4ptQt45TIcrJhZZ+eKj8oddaFxIvmLfo0bc3EY
 WIizaDAps87cYyibmDhabOlh5Dm2t38HYPfjKw0qOnpD9PhybvCM0tM9x6+mC6jbVEiU+aFXDEn
 p/iBJ6as/BES7NZZok8hNWSGc8u+xU2bmt9MBKkyNAkHb+wuZdoLjLfy5naWxD3Jkvll/JTK4NC
 vKN5keWVOhIHzZw==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100557-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org];
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
	NEURAL_HAM(-0.00)[-0.856];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:email,postmarketos.org:replyto,postmarketos.org:mid]
X-Rspamd-Queue-Id: 9DB9E3502C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to get logs through the SBU pins in Google Pixel devices, it is
necessary to add support to the devicetree, and enable the corresponding
UART. With this code and an USB-Cereal board, I was able to get full kernel
logs through serial.

This series depends on the patch adding a sdm670-google-common dtsi for
dealing with both the Pixel 3a and Pixel 3a XL:
https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/

This is my first patch sent to the kernel mailing list, so apologies ahead
if I missed something in the documentation.

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
Changes in v2:
- Fix typo in (3/3) commit message
- Link to v1: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org

---
Pablo Correa Gómez (3):
      arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      arm64: dts: qcom: sdm670: add debug uart soc node
      arm64: dts: qcom: sdm670-google-common: enable debug uart

 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  18 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 207 +++++++++++++++++++++
 2 files changed, 224 insertions(+), 1 deletion(-)
---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4
prerequisite-message-id: <20260217002738.133534-1-mailingradian@gmail.com>
prerequisite-patch-id: aeaea0c438bff770d0c4c33d937db5706d642daf
prerequisite-patch-id: 11ce654ef61d48fdebf1c4e1d9d184cfb7bcaa59
prerequisite-patch-id: c6203c8a71fe103b983b6ba5fc99a22948118fb4
prerequisite-patch-id: f9ff17c7e4b4396850f51e45249d2f6e35df3725
prerequisite-patch-id: faab09f9fe421a6358e5512c6050dd70d3271273
prerequisite-patch-id: adb88e3ddcbe33db1e3fc60ea4cb195dac18a8b4
prerequisite-patch-id: 0c8f7fc0835cdda72529fcfa7b654bb97109fae4
prerequisite-message-id: <20260310002606.16413-1-mailingradian@gmail.com>
prerequisite-patch-id: eb2d2be6edae3d09973b49f3ff6c48fa0845e7e0
prerequisite-patch-id: e6d9e56eaeceddee68d56e2ec8ac20997bff52c9
prerequisite-patch-id: d5e2975adf904bf656827100df7989218ac9e963
prerequisite-patch-id: 04478351b1304dfe1357d176c8d0c235346ca40f
prerequisite-patch-id: a54db56ccdf1491c46158a84ac1cae70f74bb36c

Best regards,
--  
Pablo Correa Gómez <pabloyoyoista@postmarketos.org>



