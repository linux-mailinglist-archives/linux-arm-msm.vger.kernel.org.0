Return-Path: <linux-arm-msm+bounces-116144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f+WnL1tCR2qdUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:02:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17F6FE873
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:02:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=gixaTgx4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B0423028188
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E083446BC;
	Fri,  3 Jul 2026 05:02:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB633D6F8;
	Fri,  3 Jul 2026 05:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054922; cv=none; b=mzzDI1mGmHDPqLMCLrp8vjVd4I4r+5Zx35e0PYZH2T+og6FAojgLBFEFNl3vxPNsSgpcEFBpGgvs0+Wp4HWS3iDtypN1Rqwav+rTzrUn5VVARewo6hCZWoV1P8TT3hvXz/2ylaMZvRySJy4/v3KEu3UnLEBX4bRonJtBDzAuidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054922; c=relaxed/simple;
	bh=TEYuJUKXzxEFy5xoWNrz95fV0Tc0zdb5ghzNYc5CJr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LBCCDH6kLXwxaDY7BT7SPTNOrOF6gf+nkSD5w/pq/NAznibIGd5Le74uF02SQRqxWfgkIbG0m38OrkL1UZD0a8TZabAs8SoW0YigghIBDvm7WZdNBID85SqDLWwsLbJWQ6T4mQ5hdeVk9MnTW/XHdfgw8OdqUlAjQdv0yVYaKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gixaTgx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 303BDC2BCB8;
	Fri,  3 Jul 2026 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783054921;
	bh=TEYuJUKXzxEFy5xoWNrz95fV0Tc0zdb5ghzNYc5CJr0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gixaTgx4+HjzZJrh+5PRI9JT9X9AMX8gPRkvN7HWmzvtfOT9K1V6Xn8NzdY7ohnPY
	 xFTwZtWNWgRHbRp9Gk5mgBs71iDFLNDgN7L7s7ZwB941db8/oOjnpnBUgyRqushH2B
	 Sa3wtGJc2gwt6wEsC9RasHxq3cTz2Y6jKPg0UW39VI9ipKEXQcX1DZq3Ql4sfiEdFI
	 d4X2ZqgtColiQbhCRZX5crFo3Y6Kg78sJZspK72aZUnQ5N0GeMI1qbYEVM0lMHnjGr
	 JGVMJKknaFGbBKDBlLyJ251wVKw7zUxOR1qaZ/IH+pjYdQ8KE/yx/h+qs62czIUZZ8
	 c0TE9Hc+ZPgeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC29C43458;
	Fri,  3 Jul 2026 05:02:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v3 0/6] Add support for IPQ5018 Bluetooth
Date: Fri, 03 Jul 2026 09:01:48 +0400
Message-Id: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwWqEMBAG4FeRnJtljCY2Usq+R+khiZMaVs1qY
 mhZfPdGvbRQehn4B+b7mQcJuDgMpC0eZMHkgvNTDtVTQUyvpg+krsuZMGACBOPU3WcO5TPVw4r
 R+9hTENYKYWTX8Irku/uC1n0e5tv7mRec10zHc0lGDEEddFu8nHLJsujNjapApzTiSBOnQCVH0
 BVYayVcfQiXeVWD8eN4yeN1b9MqIN03LrZF3ZVKV6y2Rjdk7+5diH75Ot5L5VH+zyepzJWdlFI
 jINS2ufo1Dt7f9rbDS+ynIf8yWDaANQ1YqLTQ+rexbds30ZTLAXQBAAA=
X-Change-ID: 20260625-ipq5018-bluetooth-06ff66c9d753
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783054918; l=5529;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=TEYuJUKXzxEFy5xoWNrz95fV0Tc0zdb5ghzNYc5CJr0=;
 b=S59+vhjGVJaB5+EyGLdZSCxL/r1NTPbtH8BmWFxHHtfHzSqh3dS2iWKLxyPuN7fwBdx91CeE0
 CFKvk0fXRWqDM1dKGyw6YtwBqVXu5kgA2c2/hSDkGh5aCoflRqtAc1G
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116144-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:replyto,outlook.com:mid,outlook.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E17F6FE873

Hello,

This patch series introduces Bluetooth support for IPQ5018.

Bluetooth firmware is loaded by the host into a dedicated reserved
memory carveout and authenticated by TrustZone. A Secure Channel Manager
(SCM) call safely brings the peripheral core out of reset.

A shared memory ring buffer topology handles runtime data frame
transport between the host APSS and the Bluetooth controller.
An outgoing APCS IPC bit and an incoming GIC interrupt handle
host/guest signaling.

This series has been tested and verified on various IPQ5018 router
boards utilizing firmware extracted from GPL distributions, using both
mdt and mbn file formats.

[   14.781511] Bluetooth: hci0: QCA Product ID   :0x00000016
[   14.781583] Bluetooth: hci0: QCA SOC Version  :0x20180100
[   14.785926] Bluetooth: hci0: QCA ROM Version  :0x00000100
[   14.791546] Bluetooth: hci0: QCA Patch Version:0x00003ded
[   14.796698] Bluetooth: hci0: QCA controller version 0x01000100
[   14.802217] Bluetooth: hci0: QCA Downloading qca/mpnv10.bin
[   16.393850] Bluetooth: hci0: QCA Build Info: BTFW.MAPLE.1.0.0-00102-MPL_ROM_PATCHZ-1

Best regards,
George Moussalem

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v3:
- Consolidated the SCM and helper call into one function which now
  checks availability of the SCM call inline.
- Changed argument to boolean type to set ECO power mode on or off as
  opposed to passing a raw power mode value.
- Removed unneeded parentheses in if statement
- Declared aux_ptr as a zero-initialized struct as opposed to using
  memset
- Changed for loop to a while loop for better readability
- Reordered function definition of btqcomipc_update_stats to avoid the
  need for a forward declaration.
- Removed unneeded header files from btqcomipc.c (bits.h, device.h,
  init.h, kernel.h, of_irq.h, types.h)
- Link to v2: https://lore.kernel.org/r/20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com

Changes in v2:
- removed unused struct member btss_reset from m0_btss struct.
- used devm_reset_control_get_exclusive_deasserted to acquire and
  deassert btss_reset in one call. No need to explicitly assert upon
  unbind since devres will handle it.
- As per Bjorn's comments, collapsed the rproc and BT driver into one
  which now handles firmware loading and transport.
- As per further review comments and above change, squashed the two
  devicetree bindings into one to represent the Bluetooth controller
- Added new SCM call to drive Bluetooth power modes. Based on testing on
  more router boards, this is required during start/stop sequences to
  avoid the controller hanging. This is only supported on relatively
  newer QSEE versions, so the SCM call is checked for availability
  before use.
- Refactored resource lifecycle management in the driver so that IRQ and
  work queue are managed at the driver level (probe/remove) while FW
  loading and powering on/off the controller is handled upon hdev
  open/close.
- Consolidated TX send functions for custom IPC and HCI frames into one
  and solved a potential NULL pointer dereference issue under TX
  pressure.
- Replace code to load and initialize firmware metadate by existing
  qcom_mdt_pas_init function. 
- Solved an off byone calculation error in the RX parser.
- Added entry to MAINTAINERS file
- Link to v1: https://lore.kernel.org/r/20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com

---
George Moussalem (6):
      dt-bindings: net: bluetooth: Document Qualcomm IPQ5018 Bluetooth controller
      Bluetooth: btqca: Add IPQ5018 support
      firmware: qcom: scm: Add support for setting Bluetooth power modes
      Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI driver
      arm64: dts: qcom: ipq5018: add nodes required for Bluetooth support
      MAINTAINERS: Add entry for Qualcomm IPQ5018 Bluetooth driver

 .../bindings/net/bluetooth/qcom,ipq5018-bt.yaml    |   86 ++
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   25 +-
 drivers/bluetooth/Kconfig                          |   11 +
 drivers/bluetooth/Makefile                         |    1 +
 drivers/bluetooth/btqca.c                          |   16 +
 drivers/bluetooth/btqca.h                          |    3 +
 drivers/bluetooth/btqcomipc.c                      | 1041 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   44 +
 drivers/firmware/qcom/qcom_scm.h                   |    1 +
 include/linux/firmware/qcom/qcom_scm.h             |    1 +
 11 files changed, 1235 insertions(+), 1 deletion(-)
---
base-commit: 4d1ab324fcb7d20df5a071edb0304461846fdc12
change-id: 20260625-ipq5018-bluetooth-06ff66c9d753
prerequisite-message-id: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
prerequisite-patch-id: 6ce8686c1683f468d86b4502f5ec9d19c392a382
prerequisite-patch-id: e362f7fcbacff716b7ef720e6780786a7d88c013
prerequisite-patch-id: 9168930e40551e842c8171d5433a6f39ad4b78a4
prerequisite-patch-id: 64fecfbd1e085d7d2ab0ae23295ca34ec8e14c5e
prerequisite-patch-id: 566804aaa690ee9aa285d0fd75fd16d94fbadebf
prerequisite-patch-id: dc18bec338f54b3051f4523f9d1d3c0566a20ccd
prerequisite-patch-id: b6b3eb46429936ab49423d295433daf47981db0f
prerequisite-patch-id: 75caa99e3bbcdf41b6462b9f5f703bea1d4a65fa
prerequisite-patch-id: 35e9968f482f78ca233eb0306d9c5fdbff093175

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



