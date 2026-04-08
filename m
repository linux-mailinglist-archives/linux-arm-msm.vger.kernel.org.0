Return-Path: <linux-arm-msm+bounces-102357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJV6J2mv1mkLHQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 21:41:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7F3C3471
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 21:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01673004620
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1B637C901;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YECcgPxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2A3101A5;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677287; cv=none; b=a0etUhj6F6LX1Ji1QpcKCHf6q/kW3/9vDxPQlUe7e0twvjKr3/p7oRQMjdv+pLlwOMPMWvqf8K2M++arGzg/gawjjqmZDlW0odkbuMVDeubYJNUNyIy2oA4rh7t2RgH9RKTc4fD3paFyHjSI+kya8pdEG34kDsG0JqTg1cxmmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677287; c=relaxed/simple;
	bh=/oHeOnETGJE0SUFKHP2T/LzqEY4JsFg/vxoM8xZ7Z3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XHYmWt20kLrUufOvCbcTAG5qTV3NITDN/Namf0tzUWk4soInXB0N1sbCkNSRqypt+4qLbAX/XynCQyy8ChD1zZ5jY0972c4iawqauxqw/Ibj5yiZ+DW2kbe2B9YbiM36HjSYbJ9ltcg834T5wsCd5b9TJ29yQ+o5PsPDbV8fNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YECcgPxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05000C2BC9E;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775677287;
	bh=/oHeOnETGJE0SUFKHP2T/LzqEY4JsFg/vxoM8xZ7Z3k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YECcgPxARxiF+5wUMJBt7P7r6QJ9I0Lbt0o58MKpveuL+WNwocp+Q8jdqh8ji9y3z
	 w4L8xAr4s2Jt3G7dTaywz/vfZJEhmZH2sFBurxjKImLvdnt5vnXgZrTOQExyohtAPx
	 MMjHzMS89ZKfBrHsQvnDZWiN0aw4MnnVazCD3AQa+CT1FT/UiL25vyku3nvVbk+WId
	 kaQfwLz1MTDSOK6TlDlls/5B2kJxxxKmHxZyMvQVNybSy6tDnuk4sj8Tsnr/P0zLs5
	 Kfmrc7YxRa0IeO4t0QJrSo4dGapsLKDYka+jIsJX4lQpfWOXOw4HuecukdXbipCeyZ
	 nD/G40FTbxnfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E671B10F9968;
	Wed,  8 Apr 2026 19:41:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v5 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Wed, 08 Apr 2026 14:41:23 -0500
Message-Id: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OQQ7CIBCF4asY1mJgpkV05T2MiykdlERbBW00p
 ncX7cLWhcs3yffDUySOgZNYz54ichdSaJs8yvlMuAM1e5ahzluAAqNALyU9GnlxyZalkto4taw
 M1gxGZHGO7MP9U9vuhh35csvR6/d4COnaxsfnxU6/r0MctZ7EOy2V9Gwr8ES1ZtrsTxSOC9eex
 LvTwR8L2bIxK2tYeeWqX4sjCzC1mG1BnuzKgbLW/tpibHFqi2wRyZLDukQ/+XPf9y+hfNYQbwE
 AAA==
X-Change-ID: 20260217-ayn-qcs8550-16c07b63de26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775677286; l=3242;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=/oHeOnETGJE0SUFKHP2T/LzqEY4JsFg/vxoM8xZ7Z3k=;
 b=Oh6568crYsz/N4WuBL7Q4EeNLqO4ZcT/5I2cZPxMIn+l2eQLk99OpULdSbf8yVZKMF61jauPQ
 EIPh7MP2XqbDbGohnEjDLH4GeADS22pnvbQeg6N42+vI7MzH8fBK/VI
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102357-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: 21D7F3C3471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This specifically includes:
* Odin 2 Mini
* Odin 2 Portal
* Thor

The original Odin 2 dts is not currently included as it has not yet
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

[0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v5:
- Fix some style reviews in patch 6 which required matching labels in
  patch 3
- Drop hdmi support in patch 4, since it doesn't work
- Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com

Changes in v4:
- Fold vendor description patch into the series
- Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com

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

Xilin Wu (1):
      dt-bindings: vendor-prefixes: Add AYN Technologies

 Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1762 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
 7 files changed, 2131 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260217-ayn-qcs8550-16c07b63de26

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



