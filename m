Return-Path: <linux-arm-msm+bounces-99089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBgJG/GfwGmLJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C57812EBCCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A22F300A108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB4212542;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwCoe86N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D1173;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231524; cv=none; b=cWJ5xWGfSLhJMjRyNOwiWS6AklA6ctmjmmsUXCa2b78A1aGHpCzTIIHazF3gspP/RchqKoyV3aR7fIr0RAEovYIO8VjN0D2Ev1D9CIuU/ggrqvgIPwfji4leBD27EnCn1yJq8cMqeCoR1fLPpMFthHkzN7TR07aZlK2ILJKZXTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231524; c=relaxed/simple;
	bh=Fx8scvvkZ2WH96Jv7rnokl81BDcUFWfwaIaVaQRVyXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JqyjC+DtAyJInDINdzEh9FTR0ywTUlvX3MCsa3YkDVY00XKZ3VQ4tsH0I6cx01XYK+cvMWUugwkHGDmqA3qr7e0nBCAd9b80StLJDKDPAQ8Bol9VLAmS2+FkhYFJ5ODd5PQa0RzxMdo1BUfJEyLsogdJLw1Iy5cTzmjzSieGoGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwCoe86N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26B52C19424;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774231524;
	bh=Fx8scvvkZ2WH96Jv7rnokl81BDcUFWfwaIaVaQRVyXg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RwCoe86NMbYGsetDlBYdPYRRzw8f2oe2+rHrQ7l3MHiNxmpJGu/pBoE3A2pZejlu5
	 2e0RbcX+azZQ5kJwe/x6FZE6Twx4sETFFOfXjj9XrxsdfmbQ/9BgIWmjaTVJlYzLql
	 R8aDgmWR0iFvUk0U4a41xjY35iecBZwhsvcO4C6m7muR7jK50eYujirQoCxd5GmZgX
	 VoH+wr5oZ8murpF69m2UnBTM5Im3wMjY373W8wmLhl7Zl4xx1Av5QP0/RkU1tQaKBa
	 /ww95KupNuw4rvQqVNk6JQA5fz8KVc0CpzcB3NEEHyzk+P+DzVZCCdqpYMmwjNaOqC
	 WgZe4n01YQxHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B49AD58CC0;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Sun, 22 Mar 2026 21:05:17 -0500
Message-Id: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Py26DMBBFfwV5XVf2GAbDqv9RZeHHkFgq0NjUS
 hTx73XMJt10ea907uPBEsVAiY3Ng0XKIYV1KUK9NcxdzHImHnzRDASgANlzc1/41SXddYJLdKK
 3qDwBskJ8R5rCraZ9ng4d6fpTQrfDZNYk4m6d57CNjaYWPHSyNT1pstr3rfDCGg1KDd6XcIstq
 om9jhmbYwqIOiXT4tfIjeyURO1gsDBmyZ7tl5C2Nd7rtWI96yuqpPzzIksu+ETawmSMl2Q+zrM
 JX+9lZs3J8A8LhSXEQSOJSTj7yu77/gvb/GHZYAEAAA==
X-Change-ID: 20260217-ayn-qcs8550-16c07b63de26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774231523; l=3082;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Fx8scvvkZ2WH96Jv7rnokl81BDcUFWfwaIaVaQRVyXg=;
 b=COU5QBD1c7xMgcxJQXAM5pLN9I+v1lzcmOaykK4F832Dr4W02uo2YKuvfU1e1RiEQNvf7ynSl
 HsBJVIV/mk7As/KoGEuCGomRZbVkmgV1KxqS5AXLjGtNh3bxxZG5F0P
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99089-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: C57812EBCCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This specifically includes:
* Odin 2 Mini
* Odin 2 Portal
* Thor

The original Odin 2 dtso is not currently included as it has not yet
been verified.

The initial port was done by Teguh Sobirin for ROCKNIX and was made
available on the AYN github [0].

Support has been removed for things not yet supported by the upstream
kernel, these will be added later when the related drivers are submitted
and picked up. Such includes:

* All panels
* The Odin 2 Mini backlight and touch
* All rgb leds
* The built-in uart gamepad

This series depends on one other series as described in b4 deps. Namely,
the one adding the AYN vendor [1]. This must be merged first for schema
checks to succeed.

[0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
[1] https://lore.kernel.org/all/20260220-ayn-vendor-v1-1-292cbbb682b3@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v3:
- Drop unused backlight regulator in patch 3
- Move zap shader firmware to standalone reference
- Move i2c controller enables from common to devices
- Add ABL dtbo workarounds to patch 2 as per:
  https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwliagwhf36tewdz4z6mndp@afbxzhjziiwv/
- Fix multiple property alphabetical order issues in patch 2
- Use interrupts-extended for pwm-fan in patch 2
- Ensure blank line before status in patches 2-5
- Rename spk_amp_l/r to amplifier in patch 2
- Remove a few properties that are already in the soc dtsi in patch 2
- Order tlmm nodes by pin index in patch 2
- Drop qcom,dll-config from sdhc node in patch 2
- Drop dtbo support, convert common to dtsi, and include it directly in
  device specific dts'
- Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com

Changes in v2:
- Drop awinic bindings dep as a duplicated patch already exists
- Change Co-authored-by tags to Co-developed-by
- Drop alias to currently unused uart15 in patch 2
- Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com

---
Aaron Kling (1):
      dt-bindings: arm: qcom: Add AYN QCS8550 Devices

Teguh Sobirin (4):
      arm64: dts: qcom: Add AYN QCS8550 Common
      arm64: dts: qcom: Add AYN Odin 2 Mini
      arm64: dts: qcom: Add AYN Odin 2 Portal
      arm64: dts: qcom: Add AYN Thor

 Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1762 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |  140 ++
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  230 +++
 6 files changed, 2228 insertions(+)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260217-ayn-qcs8550-16c07b63de26
prerequisite-change-id: 20260220-ayn-vendor-a153168c29b2:v1
prerequisite-patch-id: 042cab8f04748207ba5395dd0f23c445955aaa2b

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



