Return-Path: <linux-arm-msm+bounces-116981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VazyC3r8S2qIeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A4714C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=QMk44GoT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B46329F4F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755D73B6C14;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394DB3AA4E7;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358846; cv=none; b=DL0YWcdwDzGunYgDWpAhrX9rsVhmbpjT3/0R61/rlf5oguWCVMDDwCqmCnQAkW6Nz/pvFjs6CsS9EL0s5rD40EWON2Zk0M7UrlJm2gnNW2IOemBGuWf6m5Nt3iBtLkpQ+LZxFRKwshcNn22ANr13UvTaNRu+fbHP1jvYlrbgTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358846; c=relaxed/simple;
	bh=UTMLPp5SFDhnMFgt7IPfsSKRMk1sJaVz0zv6qCKD7u4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hbOfGEcXAwkwagBEAOwAl8ddIe4iAoo1t7dTuEHqTjVaJ77t/rDzQdzA6wUMRrrFAh+4Y4mK0YtFzg/JPh2nltyEny0Pr3+w1dmLposU/uPlnImtxE4X0YTQLGP8chZ8R6TOj6KlpcyNnqqR+EUJcrCW1BC6AcQESx3qgrS5C8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMk44GoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3A15C2BCB8;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783358845;
	bh=UTMLPp5SFDhnMFgt7IPfsSKRMk1sJaVz0zv6qCKD7u4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QMk44GoT4bgmKRlC+gz0nmYZdxXvq6YBL1WBRsYgbGOfxf4UbCjdljoxs7hIi3HZr
	 GJnw8jkS7OXtqe3wjByGF/5K5qR5wQ4Xt9FI8/61lIRq5EpCn5gL/NIJm9loJu58xE
	 U2RlPgL4mw62Rss7VCStVDLE9Bl6Qd8Wy9VKVj9Sp8eVeJDwozFphvDeYB+Ou6T1Uq
	 wlkAT3m4/OwYMsPUornqJWZWYGAM0VDYSI0s57aD/6xVSrWIXwBojE1aZgvD+wrCo/
	 OyYluNYnVHMIYQ7cOqF009tO9Vi621YyT7hbtZhb2RDZXs80IMu44NpFpdpi+bEAg6
	 J2Hh1k/T23DbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B0BC43458;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v4 0/6] Add support for IPQ5018 Bluetooth
Date: Mon, 06 Jul 2026 21:26:16 +0400
Message-Id: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33P0WrDIBQG4FcJXs9iNNFYxuh7jF2oOa7SJDbRy
 EbJu8/Yi22s7EY4B873+99QgMVBQMfqhhZILjg/5aF5qpA5q+kdsOvzjCihnHDaYnedW1J3WA8
 rRO/jGRNuLedG9qJlKN9dF7Duo5ivb/d5gXnNdLwv0QghqEIfq+ciC8Ky6M0Fq4CnNMKIU4cJl
 p0CRrU1jVQnH8JhXtVg/Dge8vOyp2kVAO8bF/O3+1ppRhtrtEB79tmF6JfPUi/VJfyfJqnOkb2
 UUgMB0lhx8mscvL/sacVL9KchHxk0G4QKQSxhmmv912Dfxt77gcGywWmvBO3qLjf6bWzb9gV9X
 2cYuAEAAA==
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783358843; l=9475;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=UTMLPp5SFDhnMFgt7IPfsSKRMk1sJaVz0zv6qCKD7u4=;
 b=M9gFbLvv7oGEdkqbYAbE9y4vkMvs/LNQ715orHa+zSBKKc5/FyMyjCvg4xM0nkzFc1rKWbJ4B
 nlpvISR1oJ4AtQq4X/VpAeglUXy0+2xZ6FStoXeRBRu3bfBT4VYjn0V
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116981-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,outlook.com:replyto,outlook.com:mid,outlook.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D2A4714C93

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
[   16.393850] Bluetooth: hci0: QCA FW Build: BTFW.MAPLE.1.0.0-00102-MPL_ROM_PATCHZ-1

Best regards,
George Moussalem

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v4:
- Ordered switch statements in btqca.c. NOTE: left enum qca_bt_soc_type
  unordered in the header file as the btqca driver has conditionally
  checks whether bt_soc_type is above a certain value:
  'if (soc_type >= QCA_WCN3991)' is found in 5 places
- Fixed TX path serialization by protecting btqcomipc_send and
  btss_send ring access with desc->lock, preventing concurrent updates
  of ring indices and free counters from TX and worker contexts.
- Fixed and simplified firmware ring traversal to decode little-endian
  next and translate firmware offsets via TO_APPS_ADDR in all ring
  walks, avoiding invalid pointer dereferences.
- Added short-message RX length validation (msg_len must not exceed
  IPC_MSG_PLD_SZ when not long message), preventing out-of-bounds read
  from inline shared-memory payloads.
- Fixed RX allocation failure behavior to advance ring index and
  continue, preventing permanent RX ring stall on transient kmalloc
  failures.
- Replace macro for calculting large buffer size that performed unsafe
  arithmetic by an inline function that safely calculates the size by
  reading values using endian functions le**_to_cpu().
- Declared aux_ptr as a zero-initialized struct as opposed to using
  memset and changed struct definition by updating its member to use
  u32 as opposed to __le32 as these values aren't set by firmware and
  need not be validated on endianness.
- Fixed long-message slot leak when short TX ring is full by
  snapshotting and rolling back long-buffer accounting on
  allocation-success/short-ring-fail path.
- Updated firmware load logic to remove call to qcom_mdt_pas_init for
  which the export was recently removed and replaced it by calls to
  read the metadata and the validation of it using SCM.
  NOTE: Sashiko correctly pointed out that the firmware ELF/mdt headers
  weren't validated in the driver. However, this is done by the call to
  qcom_mdt_read_metadata which returns -EINVAL if the mdt header isn't
  valid.
- Hardened firmware segment bounds checks against integer overflow by
  using subtraction form (filesz <= mem_size - vaddr).
- Replaced unsafe firmware split name rewrite with validated stem
  handling and kasprintf formatting, removing underflow/overflow risk.
- Converted workqueue allocation to devm_alloc_ordered_workqueue to fix
  workqueue leak in IRQ registration failure path.
- Added cleanup path in btqcomipc_open to shut down controller on
  startup timeout, avoiding leaving peripheral powered after failed open
- Reordered probe sequence to allocate/attach hdev before IRQ
  registration, eliminating early-spurious-IRQ dereference window for
  desc->hdev.
- Reordered remove path to unregister/free hdev before driver deinit,
  preventing send path from racing against queue/work teardown.
- Corrected HCI command packet length parsing to use 8-bit plen directly
  instead of using le16_to_cpu.
- Fixed endianness and address translation in TX ACK processing path.
  Converted firmware-owned ring metadata before use in btss_process_ack:
  rbuf base offset, msg header, long-message pointer, and message length
  are now read via le32_to_cpu or le16_to_cpu prior to reclaim logic.
- Added explicit producer ordering barrier in TX ring publish path.
  Inserted dma_wmb between payload or header writes and widx update so
  firmware cannot observe producer index advancement before data becomes
  visible.
- Removed info message printing FW build info as that was recently
  introduced in the kernel in commit bdea21b3be43
- Added dependency on OF and ARCH_QCOM symbols to Kconfig. In addition,
  also select QCOM_MDT_LOADER and QCOM_SCM.
- Removed syscon compatible from mailbox node, avoiding dt_binding_check
  failures and update the syscon acquisition logic in driver probe
  accordingly.
- Link to v3: https://lore.kernel.org/r/20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com

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
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   22 +
 drivers/bluetooth/Kconfig                          |   14 +
 drivers/bluetooth/Makefile                         |    1 +
 drivers/bluetooth/btqca.c                          |   16 +
 drivers/bluetooth/btqca.h                          |    3 +
 drivers/bluetooth/btqcomipc.c                      | 1148 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   44 +
 drivers/firmware/qcom/qcom_scm.h                   |    1 +
 include/linux/firmware/qcom/qcom_scm.h             |    1 +
 11 files changed, 1343 insertions(+)
---
base-commit: 4d1ab324fcb7d20df5a071edb0304461846fdc12
change-id: 20260625-ipq5018-bluetooth-06ff66c9d753
prerequisite-message-id: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
prerequisite-patch-id: 467ba5e0fde0e9a1e9d0a6faf3d22ba2126c62a7
prerequisite-patch-id: 9168930e40551e842c8171d5433a6f39ad4b78a4
prerequisite-patch-id: 64fecfbd1e085d7d2ab0ae23295ca34ec8e14c5e
prerequisite-patch-id: 7bf282ed9312b2ffdbe420429bbe355622620272
prerequisite-patch-id: 29a7d652948d13f91bdd4fc5fb8e6dbcd6e5fcc5
prerequisite-patch-id: c03136820a7749fd9630080e6d4459a298b3b630
prerequisite-patch-id: 43975fc425bf2f5dd5c1de66aaa78c4b4bde568c
prerequisite-patch-id: 75caa99e3bbcdf41b6462b9f5f703bea1d4a65fa
prerequisite-patch-id: b9b2a2f80a4827b457166b20f54644e57d90b824

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



