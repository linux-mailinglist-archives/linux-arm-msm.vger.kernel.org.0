Return-Path: <linux-arm-msm+bounces-105625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLcaIdrC92nDlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:49:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F40814B794C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE38230053A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB5A3A962D;
	Sun,  3 May 2026 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMnFaHwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3F21CC4F;
	Sun,  3 May 2026 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844951; cv=none; b=eU/9zCHQAKJ5cZXZc801dsW2/DRMPlbWuGNX/eEclmisdXfq8Z2LRuucAXXmfARgOvUYE5q1N2vCcfVqbryf6oxvEGJ2VaT69nLmz0QljH8GlvQswuK6iS1X3pax1SkcGDr4qm0PqzesinxUOTM8RcYpMit5Xe8fk5U2gyapJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844951; c=relaxed/simple;
	bh=tqyCVFI/HgMru/pPjpMWXNPza9vzLUJD6GMdYk+Ebas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZgESyUaCEPLPC6UIQuiZFJr7H3y5tzLc+2l+/dY3vFecVqy9XHVztp80lx7jFKUi8pH0Hi26h0OO5BvMIHb17P+6UCIyep79PIK5GCeIt5avp0Dc9Qs0Peieq66OxBLFM9l9YGIC2q9/pv5vxbkT54TilYhMQ4RN7Wniol/elqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMnFaHwQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14689C2BCB4;
	Sun,  3 May 2026 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777844951;
	bh=tqyCVFI/HgMru/pPjpMWXNPza9vzLUJD6GMdYk+Ebas=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MMnFaHwQUEJpXsNrh1V+FFvbLRojbess5Nf4ETk9InEEziQ+7tQfFG6LmIQJjfrtz
	 smEQZny9bvW0sK+IMzYKIfNZGX/o8GzqSICdu9Nnu8bkyNhWiork8JQ3svFWh0C7UO
	 0vC/7rtuUsTRyIvV/lLrsuxmQS1uVQI4AZ9Zr8cBWQ9Zi9OZ/MMT9191YS0A8cngR5
	 G7fXLSN+5ktlm9YCwq1Gm8LeLm+/61FuOMTkLoNaDBKuJ9JdzYiiwuIOqrV+GC48wl
	 W+x+VEbAVtOuYR5YoU1sql71vXlSI6cWWg8+FXptuU48Z6cQAOybwO2VnNRL4PSbgt
	 xsSQWU/8oYh8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EBECD3426;
	Sun,  3 May 2026 21:49:11 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Sun, 03 May 2026 16:48:42 -0500
Message-Id: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTW7CMBAF4Ksgr+tq7Il/0lXvUXUxdsZgqSSQ0
 KgI5e41sCAJEss30vfeXMTAfeZBfGwuoucxD7lrS/BvGxF31G5Z5qZkoUFb0MpJOrfyGAdvDEh
 lI7hgsWFtRRGHnlP+u7V9fd9zz8ffUnp6HHd5OHX9+bY4quv1Xo5KLcpHJUEm9kEnokYxfW73l
 H/eY7cX155Rv7C6WLa29pYhQQxrizOr9dJisRUl8nXU4L1f22pucWmrYhHJU8TGYHr62TxsBX5
 pTbGxBgocHCmj19bOLMLS2mLBkmMXTEX0tOteWFesqRXV1qFJhHM7TdM/jRYAWiMCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777844950; l=3860;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=tqyCVFI/HgMru/pPjpMWXNPza9vzLUJD6GMdYk+Ebas=;
 b=qS28oGdqIqc8eUqPKbvantKoNktzxxrGvlVdK++kh6lRdZwIWGL3rlGz9RkZ+1ozQHZyRJtxU
 66lWsBzNdI8D22a8N2tW8CjioPb9Lz81A0Km/XJvr0ES14o6SqTkSTr
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: F40814B794C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105625-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
Changes in v8:
- Properly order and format amplifier properties
- Set amplifiers name prefix to Amplifier L/R
- Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com

Changes in v7:
- Add back pinmuxes dropped last revision, but without output-low
- Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com

Changes in v6:
- Fix comment style in patch 3
- Drop a pair of unnecessary pinmuxes in patch 3
- Lower usb sbu pins drive strength in patch 3
- Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com

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
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1764 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
 7 files changed, 2133 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260217-ayn-qcs8550-16c07b63de26

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



