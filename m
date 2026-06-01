Return-Path: <linux-arm-msm+bounces-110643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGcqKnK5HWrKdAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E286622DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C68D33001BD8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE3839282C;
	Mon,  1 Jun 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjuxVO5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575837F74A;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332854; cv=none; b=W97tVu0TUriR11ifFksJa7yQssejSxa5k+ChyPP0KyteUHoI9LA7bS1Ig09i+nJ4g6jyPINyxu+xqdU5CI8rmmHJjNqgXxZeR+hN9uWFGBcsWqy02sWKucVwsDUeZvsSiE3ot4YLV3IkWFhreYUTltIKhVpljORyeYTV1d+ocQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332854; c=relaxed/simple;
	bh=O2pCDokgZ3DXKuGnRSIwijCq5J/0NOJdQ50dy8sFUeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i6zo+RyCjkpoSrD3vyxKy5X0oYgW5FJiX4Gs2e2s377WqiczkJRLN7C60w1iHW+EFuBW6GvfZpeL7dmZQRnrPyw7I2HCkUeOVR67oU5M7gLopS8KgtLKbP1JDiokgZytqO2wcw8D71iXKkmYwW7Rqs3o+eL5AKzCRhddMMNYUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjuxVO5z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4829C2BCB8;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332853;
	bh=O2pCDokgZ3DXKuGnRSIwijCq5J/0NOJdQ50dy8sFUeM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hjuxVO5zKfYGyGTwbACI1HudQbS7KfGZmJwM7y14hUtGiHUXjTdAhW/o4wkej9KUX
	 XCxz38oAt5ca+7rmI2Z7OySut9VcV36Qg+UcO8U6fVbEiFMBSxlWY5Nzqbur7p0Q7S
	 EKd4ikSANh6Hz9EKpBO2ouiI99TEZcewsUrG7+MTCavtONMB/fnwv+KOKza8ZGp84O
	 PGawjVpkm+K0NbuamYgyW15JC3tK7aw/12pBfVUAWSAk7l3wdK74OGPJtpo5ap4047
	 u39NLax7BJvFidaRprCVgzGKR7JpF/TEn7aXlAm3VEsaV54r8fGrtw7XQxgPu/adiZ
	 IZko3DZeDYQnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A19ECD6E5D;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Subject: [PATCH v3 0/3] Add support and enable the debug UART in the Pixel
 3a and Pixel 3a XL
Date: Mon, 01 Jun 2026 18:53:59 +0200
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53OQY7CMAwF0KugrMcopC0UVtwDsXAStwSGpDhpR
 YV6d1IYaTaskFffsvz+Q0RiR1HsFg/BNLjogs+h+FkIc0LfEjibs1BSrWWhauhQ/4Yxj4sJwZL
 uW+iREwQPbNHgiB483ROst2pTFlVtqClF/tcxNe7+sg7Hd469PpNJM/B3wXTrc4n0f3bKUODx1
 XBYzdtvygwrkCA16qaqSzRW77sQ0xX5QinEZeBWzNigvgZUBqoCtd1aXTcSPwDTND0B6ipNr3E
 BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=O2pCDokgZ3DXKuGnRSIwijCq5J/0NOJdQ50dy8sFUeM=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbk0nlT9oDrwgIlS4Y8YvL9kz9oommsGrD8Cy
 xFZLzZ48T+JAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25NAAKCRB6NCVl/2Nf
 eTDJD/0dbwV6sH9Y4IDn/C58x2AbIlbHOyIbWiquQWksdrJobyk9zXRzmEVi4D9BwZM7ey5CGKY
 DbP6TXb20djN5rpTJzB+j3Gq6mtR8QMJQHZWH6gDh51JOwcpeqNejp4X4A12bC068PuRxpGTshm
 QOCc2jiq42Ei5c4iBPqCTDDbIImUUS9J1LISI/Zxj5qn/3gOYHb8FA+O4QYtJE8IvRkM4kziaDs
 6NHv7/hypRuBkPpgQVRIGsep4TwkFYitUvqj1WdAdARaIQFm1nWdXMhZzqZzBQgfzvSO0rD5usx
 OuoktzkB9MhZTcSVQ41fUnDLAyOG4DNlace8XeMBIn7B6nfSIzLbdNXGvg0vpEHxE5GvxV73Vdk
 XKnHSnuAykIHqtyGTAyIPafz5b8SoZKT9zIEUXLpV8KPkv6B6REHKLr4Ob71QrNAOGN7EwFTmPB
 o5iR7pe5HAULyqWuhO93sE72DJL1EBhGG8UlpjxYdcyIo4NyRbuEtJJCkAlr4Jse8JiYtSf7x01
 qdTFOFuulYZOapQYWWwUVKe/CVEQ0Ni14MQOinfDQI55neltcZf/VPyoIENcyujU+K6FjDU7t3Z
 7eEyhnQBk2xgUacnSCxFO8JhIUrv91owZM9t3w4RUdrGMogvX9n9st1ghfvszGMg60tcO3PtXVt
 n4YhrAEr29b0w2w==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110643-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6E286622DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to get logs through the SBU pins in Google Pixel devices, it is
necessary to add support to the devicetree, and enable the corresponding
UART. With this code and an USB-Cereal board, I was able to get full kernel
logs through serial.

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
Changes in v3:
- Drop dependency on already-picked patches
- Link to v2: https://patch.msgid.link/20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org

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
base-commit: be0cd82a9f584e562b243684303054134c8f6583
change-id: 20260328-pabloyoyoista-debug-uart-on-rdacayan-next-69274358cef4

Best regards,
--  
Pablo Correa Gómez <pabloyoyoista@postmarketos.org>



