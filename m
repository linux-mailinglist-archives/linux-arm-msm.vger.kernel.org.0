Return-Path: <linux-arm-msm+bounces-106906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKDALhzAAWrIjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:40:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3050CF12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78BEA302A6A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD92374182;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozvupYr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E8372680;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499234; cv=none; b=MtlvVcyQnd6bqkggypPaGjIKhgtDrdTOvfOUHOfz4Vwomh6zgQsVlSisnMpi2mbInvYxrXx0F9rSw+DZcMxJhBwMcb0GG1d5bbpkwebsrpbu6cms+Ln6EQ2PBywGZB1eTkpi28T8w1u+/7LN1rMp1TYJtXAuqd2eJpBayMvR3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499234; c=relaxed/simple;
	bh=tvd6ZTLuJ7HOkMjrrvnOyh5A5zjUjdnNxtckDH8Po7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XYGBuolFxwU2DOiPjqMUc1wKDa7F2i0/K1sOZCTd5neMbO7dMEifkKOe26ic9R1BViU6J6etpoBamP6Fyr0wq84DRtZSnAx2rBsqk8Sv4yAgBM2rcKF+K9rsPJGw4dEGtkr2b/5cj58fqO4bqui+pHlopbnYo+HhuTkuSp+t96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozvupYr7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34B25C2BCC9;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499234;
	bh=tvd6ZTLuJ7HOkMjrrvnOyh5A5zjUjdnNxtckDH8Po7s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ozvupYr7SBPA+QI9kC8yonJhpsc1LsjHwyucz6pzruEKFZSA3fdxovJsNy4oeKuDk
	 ag7J7uH74lR0+/i0xZrUZSfZnbBgBw/oHAssxduURiudTrRSgT5cZGYtajiZGzwCOe
	 o3HR+NTbCI6MEUNbZY6xf5VvGeTQr3vulbZ+OrZ8FP/wncyqF2f14k7bOSyZpaRfDT
	 GRX8UFG3Hg8cUhbxRuoZgBfoCgx8S0GVE+chcf+5RNkdwdDJOFnphH6vIHV3kZRkpd
	 Vhehqnuf1Dr4Py+ah+lpTj7YtZQ06TBJ5gSltl+KCL3Yt4rwpV6zDC1VOlkwjXcZeg
	 IpclBAqiVKAxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231B3CD4842;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Mon, 11 May 2026 18:33:52 +0700
Message-Id: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jmbc1QAwZX3sOwKMMURoWSFhsN4
 e4W3Lp8yfvvLxDYCwe4ZAt4jhLEjQn0IQPqzdixkjYxaNQlFjmqydGD5zYoRj43VUX2VFaQ9Mm
 zlfeeutU/Dq/mzjRv+83oJczOf/avmG/en2zMFSqyWBhiwtLYazcYeR7JDVCv6/oFVcZiSrIAA
 AA=
X-Change-ID: 20260510-pocketds-e0e7b99cf369
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778499232; l=2566;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=tvd6ZTLuJ7HOkMjrrvnOyh5A5zjUjdnNxtckDH8Po7s=;
 b=byuN/FB3pvbmX47hyTt1leLWKl0EB3jX+h4Du7RnqYGbBML8/bOLrTSBW+RuIcetr/SBLPFrK
 l5JzezcUyFSA7oYbq42pQToLxq086CWh3t8hqwp+p4cgAXg/lAnCGtD
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 25C3050CF12
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-106906-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,0.0.0.20:email]
X-Rspamd-Action: no action

This series adds initial support for the Ayaneo Pocket DS, a handheld
gaming console built around the Qualcomm QCS8550 SoC. It has UFS
storage, WiFi/Bluetooth, gaming buttons, microSD, dual displays, and
USB-C with DisplayPort. Game controls are exposed through a Renesas
uPD720201 PCIe USB 3.0 host controller on PCIe1.

The first patch adds labels to the sm8550 thermal zones so the board
can attach its trip points and cooling maps through the &label override
syntax. The second introduces the Pocket DS device tree itself.

Only the basics are wired up at this stage (boot to console, core
peripherals, USB-C and DP); the display panel will follow in a later
submission.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Changes in v2:
- Inlined the board into a single qcs8550-ayaneo-pocketds.dts, matching
  the sm8650-ayaneo-pocket-s2 layout
- Added qcom,qcs8550 to the compatible chain
- Prerequisite patch labelling the sm8550 thermal zones so the board
  can extend them via &label overrides (and refactored the board's
  thermal-zones to use them)
- Added the Renesas uPD720201 USB 3.0 controller as a child of pcie1
  with proper avdd33 / vdd10 / vdd33 regulators
- Moved gamepad_pwr_en off &pcie1's pinctrl-0 and onto the
  usb-controller node
- Split the lumped upd720201_active pinctrl into per-regulator states
- Fixed mdss_dp0_out data-lanes to <0 1 2 3> (all four wired)
- Fixed gpio-reserved-ranges to <32 4> (gpio 38-39 drive the Goodix
  touchscreen)
- Renamed nodes with underscores (llcc-lpi-region, splash-region,
  gpio@20) per DT conventions
- Reordered pinctrl-names after pinctrl-N file-wide
- Dropped the unused cont_splash_region label
- Link to v1: https://patch.msgid.link/20260510-pocketds-v1-0-cf05acec06af@gmail.com

---
Alexandre Hamamdjian (1):
      arm64: dts: qcom: sm8550: add labels for thermal zones

Teguh Sobirin (2):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1861 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   26 +-
 4 files changed, 1881 insertions(+), 13 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-pocketds-e0e7b99cf369

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



