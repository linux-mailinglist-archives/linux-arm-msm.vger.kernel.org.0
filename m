Return-Path: <linux-arm-msm+bounces-99351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ6GGgp9wWknTgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:48:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A322FA732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BF07323A4FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AA23BF685;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShCiTqjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894526CE2C;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283268; cv=none; b=VFSkAKPMVY9NU/sfTlZexfO6SA2pZH/yJlHXoOEUY0A0P9hEE2vFzFlp6st3ogwdHxcHr10k2XHVuj2C0A8ZwUMs9IKandOIXT20ZSP/iCDnN6WGqhvsVJQO7jgzoFujJlNIS/KdxVh674VszcFVSklRn6DhwEfGd0xOxCFuiMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283268; c=relaxed/simple;
	bh=mAIONOJXN9qDLiD2zg6/6yjTKQjH5j/wK0B7TSQ0MeE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZsQta2rfuZmibLCZUQ8KDuf6z5w0XUQxB8v66evvmUSMuDT4f6ZFK3XN0sGcRmpkWHUY+T+73YEZ/ABK0aTPdIHYFaz81GNrNHuhPu157ozzd+Z/Tl4p9ZRdVtOVNq8oVhE6WJGwvBj8qkOIB3X2RSyE9ZLeZ3hVqiLlC2lpXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShCiTqjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9DADC2BCB0;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283267;
	bh=mAIONOJXN9qDLiD2zg6/6yjTKQjH5j/wK0B7TSQ0MeE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ShCiTqjgCFDVItvcxDlWr8lNVR4ineF+ApPoKBXPFY3w6N9gNwZaykAFyG9woporg
	 zEIJxXmPwaQ3dFyaO36GQehSOUeTSJwiMNAADLRvtnKJXgA+DsTMVK9efCgOoBQb+v
	 RbmH4Kb3E29fDolUD6CrLCDmf5VmW1X3jA8c0TAYwCM3c9HPrRhJYJAVg+3R5TNP/X
	 U+IxUVqOyAiobrXPvh1Tal1Es3uWXLSrq9/b+QMdMDTC0BW70Ie6hUt436jYHWHQQ/
	 qzejbskEB/rKTpIAOrkgai3o0HbrbaOF5ks2zo/7dezzifuXbsxoftpHXNQiMzs21u
	 r3rnnmgJoS0JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5130F483C3;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Mon, 23 Mar 2026 11:27:42 -0500
Message-Id: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq1pByjVlfcwLkqZahMBabGRE
 O5ugYXgwuWb5PtnIB6dRU9Ou4E4DNbbpo4j3e+Ivqv6htSWcRNgIBjwnKq+pq32MssY5UKzvBB
 JiSBIFE+Hxr7n2uW6bIftK0a77/Fufde4fv4Y+HRd4gnnm3jglFGDsgCjVMlRnW+Vso+Dbioyd
 QL8sRAtCnGUAplhuvi1ycoCbG0SbaqMkkcNTEq5tuM4fgB3QKrYMwEAAA==
X-Change-ID: 20260217-ayn-qcs8550-16c07b63de26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>, Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774283267; l=3250;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=mAIONOJXN9qDLiD2zg6/6yjTKQjH5j/wK0B7TSQ0MeE=;
 b=m5luLhRY05a6rFuC6+NC+g8IhHYE8LcU4WFTyd5n0MdpaOdgbW1Lay2dJ2LWFEHdApTG83iv2
 Lic61un0fHcBptIUb2eDT3WN7NaX3PrT8fIVMx/Po1Awi7t5o3x2PIj
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99351-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08A322FA732
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
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |  140 ++
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  230 +++
 7 files changed, 2230 insertions(+)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260217-ayn-qcs8550-16c07b63de26

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



