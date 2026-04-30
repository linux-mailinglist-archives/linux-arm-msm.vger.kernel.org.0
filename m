Return-Path: <linux-arm-msm+bounces-105413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPZxKwij82ly5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:44:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 123934A7195
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC743020032
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65F647AF56;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APazw0E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFB274B3B;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574630; cv=none; b=kPTEz/CQwgGGaF2B7purWAZNbpkIWhQqsFFiBSwOPCHweJmbS2vWGbMc10pIbHobUMBL73W5WPf4DanJuV0LdqutYVuEYfPictOvbe38UWs8y0W40Isj+q9pxRCFGkE3P0T1nnCYNXLGuiq9Y2MI3f3CugppA93uO62i/1gX0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574630; c=relaxed/simple;
	bh=Hn4fAHqLcsc4NFLexnYd+fElE0TVdwcxmDnovGn6lC4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GnWeajD/CEq1O87vvPUK8tI4VRguNJUUZC+ke0faywdjcr0YVlS8r1UDla894P+gHywxEQnbQOAspmn9dznnhEca01ddCcXuZAEXuCHQLM8RBgaZfq6k6oh/qj6WDi+rt67vyaNy0bq3oijDWmKgpLTL9M7MyobhdZ2ikI5sZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APazw0E+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47875C2BCB3;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777574630;
	bh=Hn4fAHqLcsc4NFLexnYd+fElE0TVdwcxmDnovGn6lC4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=APazw0E+m5zSnab2cL7C4NZo38s5jehBynjDZPQq8Vb9rQ2St2mAknQHIILcaruAv
	 Ne9Ob1vPjYlRN4nBcOs5SuHiG4dLCuPpMjaPnqc2sIrWJ9RYd/1VSwoH9gjW/pxi9I
	 61W6qn3d0UwDZTGpOZ6XIaqiaHwfdYPjnFv4rgnJYqqE/amZVd5PNz2qrSRvQ07WXV
	 GPlyS881358cliScoILxYUuLDe/3OhM0taeAIKqlOjLNDj+TJrykj0nwG/LPt2fpCY
	 tKBeft1OBsWU8CWd3fxJQLDy9kxo83WafwxX8MhQui6gikGIgHiAiOauoWjkhi2uAR
	 /McqFGy/SFkVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A94CD13DA;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v7 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Thu, 30 Apr 2026 13:43:35 -0500
Message-Id: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTW7CMBAF4Ksgr+tqPI5/0lXvUXUxdsZgqRBIa
 FSEcvcaWBCnUpdvpO+9uYqRh8yjeNtcxcBTHnN/KMG9bETc0WHLMnclCwS0gMpJuhzkKY7eGJD
 KRnDB6o7RiiKOA6f8c2/7+HzkgU/fpfT8PO7yeO6Hy31xUrfro1wrVZVPSoJM7AMmok4xvW/3l
 L9eY78Xt54J/7FYLFvbesuQIIa11QuLWFtdbEOJfBsRvPdr2yytrm1TrNbkKerO6PTnZ/O0Dfj
 ammJjCxQ4OFIG19YurIba2mLBkmMXTENU7c7z/As5E29z5wEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777574629; l=3655;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Hn4fAHqLcsc4NFLexnYd+fElE0TVdwcxmDnovGn6lC4=;
 b=m3HSYN9ki6dKi0kwoCeXi0E3xz5dPpdurfAyJeggwBVF0IuO4ftcIfraOhHY4qu7riHOhIEyU
 yj6fpH4wxYJBqW3iOvRkXKn24o5NLqWrouV/APk6i3ZYfwtP9Su2XL0
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 123934A7195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105413-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1760 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
 7 files changed, 2129 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260217-ayn-qcs8550-16c07b63de26

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



