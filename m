Return-Path: <linux-arm-msm+bounces-116982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mp1NHn/8S2qMeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D249714CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ra+Gj5oz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66521325F2D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785723B71BB;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395713ACF17;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358846; cv=none; b=YlHGaaSe1eqT6l0fVP03kHneE10UsXkaZaPDaW0GKSUQxJszDhfDKP7lZcV6IJCKGGM8elkk1Z6IEe0TmBsdjeqG27Bcxpo6Ef/KNoYz94GWjjDXeMwIEJ1H787Qsy4c2wdcmlKcUXyDYABpVct0lJ1Uxt2vAKVLedBHd2Ia5Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358846; c=relaxed/simple;
	bh=FDaGUXsYHpDPAqclhsXm+P1bNp8+SDoQIHzBy07SwCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jcbhz18x8Hgz1YayaEtPmxRP1vHtsst0PaIUjkCVu8BQYNHKKsyzJTjRw9M00tRUnaFkGV2cWgW14PcBgwyj9/apjnuILNUk758CNM+lPV89cl+LSgugp2A+e1zg9WBI9aMisQfrZyVmwgdZ8DYVnt43eTGNQPMkOxjdjNn6EME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ra+Gj5oz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00E9CC2BCFA;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783358846;
	bh=FDaGUXsYHpDPAqclhsXm+P1bNp8+SDoQIHzBy07SwCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ra+Gj5ozAV1TMyuH4qF9nYiU6GUvrFaU0NqJhub8QhqA9pafn1ZBL85R7C3izitUt
	 1ty1LXkNFYSqRVEMnmK+NsZaW3+qyftb7FY0d3w2I5nEUZMdfMhi3UPHn5jhtKOLaC
	 g2cOklTlvWomeBzj1ouhbHGVCJvZd63AQj8kSXdNvZIY/+6nhRMt4NvPktFjCSgglm
	 9s9YeCn2m5FJPNK7k06TvVhrW+0EgE7k5Oc+q94Lk+ksAg8RFQ1BK0I3TIY6vhHmhP
	 wUZWn9jMw294k9xrJ8ai9844BaABm2R+Ev5JzqNVZKHPut6AE1e8oOA6CLZfhNWd7P
	 NDwDomS3Fpmmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD06BC43458;
	Mon,  6 Jul 2026 17:27:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 06 Jul 2026 21:26:20 +0400
Subject: [PATCH v4 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based HCI
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783358843; l=31901;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=x+cbLI31aRe6O5pytIO3sf+o6xMRzjTHo4tuYfRb0SI=;
 b=uSYBYUhtzBdAvWQW0sZi0SDptuSfQzN3ih4rHj2fivV6+TN5gIu+KeBAlLMAeXDpqkyRevJ7d
 HYIxMARAFckB15pzNw64qWkyK9B6IUjribWNpuORyQZgQ+0n5X9LblX
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
	TAGGED_FROM(0.00)[bounces-116982-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:replyto,outlook.com:mid,outlook.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D249714CA9

From: George Moussalem <george.moussalem@outlook.com>

Add support for the Bluetooth controller found in the IPQ5018 SoC.
This driver implements firmware loading and the transport layer between
the HCI core and the Bluetooth controller.

The firmware is loaded by the host into the dedicated reserved memory
carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
call safely brings the peripheral core out of reset.

A shared memory ring buffer topology handles runtime data frame
transport between the host APSS and the controller.

An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
signaling.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/bluetooth/Kconfig     |   14 +
 drivers/bluetooth/Makefile    |    1 +
 drivers/bluetooth/btqcomipc.c | 1148 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1163 insertions(+)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4e8c24d757e9..a2d82f27f07a 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -413,6 +413,20 @@ config BT_MTKUART
 	  Say Y here to compile support for MediaTek Bluetooth UART devices
 	  into the kernel or say M to compile it as module (btmtkuart).
 
+config BT_QCOMIPC
+	tristate "Qualcomm IPQ5018 IPC based HCI support"
+	depends on OF && ARCH_QCOM
+	select BT_QCA
+	select QCOM_MDT_LOADER
+	select QCOM_SCM
+	help
+	  Qualcomm IPQ5018 IPC based HCI driver.
+	  This driver is used to load firmware and bridge HCI data onto shared
+	  memory between the host and the Bluetooth controller.
+
+	  Say Y here to compile support for HCI over Qualcomm IPC into the
+	  kernel or say M to compile as a module.
+
 config BT_QCOMSMD
 	tristate "Qualcomm SMD based HCI support"
 	depends on RPMSG || (COMPILE_TEST && RPMSG=n)
diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index e6b1c1180d1d..05f19047bed0 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_BT_MRVL)		+= btmrvl.o
 obj-$(CONFIG_BT_MRVL_SDIO)	+= btmrvl_sdio.o
 obj-$(CONFIG_BT_MTKSDIO)	+= btmtksdio.o
 obj-$(CONFIG_BT_MTKUART)	+= btmtkuart.o
+obj-$(CONFIG_BT_QCOMIPC)	+= btqcomipc.o
 obj-$(CONFIG_BT_QCOMSMD)	+= btqcomsmd.o
 obj-$(CONFIG_BT_BCM)		+= btbcm.o
 obj-$(CONFIG_BT_RTL)		+= btrtl.o
diff --git a/drivers/bluetooth/btqcomipc.c b/drivers/bluetooth/btqcomipc.c
new file mode 100644
index 000000000000..bea3b83d9f2e
--- /dev/null
+++ b/drivers/bluetooth/btqcomipc.c
@@ -0,0 +1,1148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/elf.h>
+#include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/mdt_loader.h>
+#include <linux/workqueue.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include "btqca.h"
+
+/** Message header format.
+ *
+ *        ----------------------------------------------------------------
+ * BitPos |    15    | 14 | 13 | 12 | 11 | 10 |  9  |  8  |    7 - 0     |
+ *         ---------------------------------------------------------------
+ * Field  | long_msg |ACK |        RFU        |  pkt_type |    cmd       |
+ *        ----------------------------------------------------------------
+ *
+ * - long_msg   : If set, indicates that the payload is larger than the
+ *                IPC_MSG_PLD_SZ. The payload instead contains a pointer to the
+ *                long message buffer in the shared BTSS memory space.
+ *
+ * - ACK        : Set if sending ACK by IPC interrupt is required by firmware.
+ *
+ * - RFU        : Reserved for future use.
+ *
+ * - pkt_type   : IPC Packet Type
+ *
+ * - cmd        : Contains unique command ID
+ */
+
+#define IPC_MSG_HDR_SZ		4
+#define IPC_MSG_PLD_SZ		40
+#define IPC_TOTAL_MSG_SZ	(IPC_MSG_HDR_SZ + IPC_MSG_PLD_SZ)
+
+/* Message Header */
+#define IPC_HDR_LONG_MSG	BIT(15)
+#define IPC_HDR_REQ_ACK		BIT(14)
+#define IPC_HDR_PKT_TYPE_MASK	GENMASK(9, 8)
+#define  IPC_HDR_PKT_TYPE_CUST	0
+#define  IPC_HDR_PKT_TYPE_HCI	1
+#define  IPC_HDR_PKT_TYPE_AUDIO	2
+#define  IPC_HDR_PKT_TYPE_RFU	3
+#define IPC_HDR_CMD_MASK	GENMASK(7, 0)
+
+#define IPC_CMD_STOP		1
+#define IPC_CMD_SWITCH_TO_UART	2
+#define IPC_CMD_PREPARE_DUMP	3
+#define IPC_CMD_COLLECT_DUMP	4
+#define IPC_CMD_START		5
+
+#define IPC_TX_QSIZE		32
+
+#define	TO_APPS_ADDR(a)		(desc->mem_region + (int)(uintptr_t)a)
+#define	TO_BT_ADDR(a)		(a - desc->mem_region)
+
+#define	GET_NO_OF_BLOCKS(a, b) ((a + b - 1) / b)
+
+#define GET_RX_INDEX_FROM_BUF(x, y)	((x - desc->rx_ctxt->lring_buf) / y)
+
+#define GET_TX_INDEX_FROM_BUF(x, y)	((x - desc->tx_ctxt->lring_buf) / y)
+
+#define IS_RX_MEM_NON_CONTIGIOUS(buf, len, sz)		\
+	((buf + len) > (desc->rx_ctxt->lring_buf +	\
+	(sz * desc->rx_ctxt->lmsg_buf_cnt)))
+
+#define BTSS_PAS_ID		0xc
+
+#define BTSS_PWR_CTRL_DELAY_MS	50
+
+struct long_msg_info {
+	u16 smsg_free_cnt;
+	u16 lmsg_free_cnt;
+	u8 ridx;
+	u8 widx;
+} __packed;
+
+struct ipc_aux_ptr {
+	u32 len;
+	u32 buf;
+};
+
+struct ring_buffer {
+	__le16 msg_hdr;
+	__le16 len;
+	union {
+		u8 smsg_data[IPC_MSG_PLD_SZ];
+		__le32 lmsg_data;
+	} payload;
+} __packed;
+
+struct ring_buffer_info {
+	__le32 rbuf;
+	u8 ring_buf_cnt;
+	u8 ridx;
+	u8 widx;
+	u8 tidx;
+	__le32 next;
+} __packed;
+
+struct context_info {
+	__le16 total_size;
+	u8 lmsg_buf_cnt;
+	u8 smsg_buf_cnt;
+	struct ring_buffer_info sring_buf_info;
+	__le32 sring_buf;
+	__le32 lring_buf;
+	__le32 reserved;
+} __packed;
+
+struct qcom_btss {
+	struct device *dev;
+	struct hci_dev *hdev;
+
+	struct regmap *regmap;
+	u32 offset;
+	u32 bit;
+	int irq;
+
+	const char *firmware;
+	void *mem_region;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	size_t mem_size;
+
+	struct sk_buff_head tx_q;
+	struct workqueue_struct *wq;
+	struct work_struct work;
+	wait_queue_head_t wait_q;
+	spinlock_t lock;
+
+	struct context_info *tx_ctxt;
+	struct context_info *rx_ctxt;
+	struct long_msg_info lmsg_ctxt;
+
+	bool running;
+};
+
+static inline u32 btss_lbuf_size(struct qcom_btss *desc,
+				 const struct context_info *ctxt)
+{
+	u32 total_size = le16_to_cpu(ctxt->total_size);
+	u32 lring_buf = le32_to_cpu(ctxt->lring_buf);
+
+	return ((TO_BT_ADDR((void *)ctxt) + total_size) -
+		lring_buf) / ctxt->lmsg_buf_cnt;
+}
+
+static void btqcomipc_update_stats(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	u8 pkt_type = hci_skb_pkt_type(skb);
+
+	hdev->stat.byte_tx += skb->len;
+	switch (pkt_type) {
+	case HCI_COMMAND_PKT:
+		hdev->stat.cmd_tx++;
+		break;
+	case HCI_ACLDATA_PKT:
+		hdev->stat.acl_tx++;
+		break;
+	case HCI_SCODATA_PKT:
+		hdev->stat.sco_tx++;
+		break;
+	default:
+		break;
+	}
+}
+
+static void *btss_alloc_lmsg(struct qcom_btss *desc, u32 len,
+			     struct ipc_aux_ptr *aux_ptr, bool *is_lbuf_full)
+{
+	struct device *dev = desc->dev;
+	u8 idx, blks, blks_consumed;
+	void *ret_ptr;
+	u32 lsz;
+
+	if (desc->tx_ctxt->lring_buf == 0) {
+		dev_err(dev, "no long message buffer initialized\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	lsz = btss_lbuf_size(desc, desc->tx_ctxt);
+	blks = GET_NO_OF_BLOCKS(len, lsz);
+
+	if (!desc->lmsg_ctxt.lmsg_free_cnt ||
+			(blks > desc->lmsg_ctxt.lmsg_free_cnt))
+		return ERR_PTR(-EAGAIN);
+
+	idx = desc->lmsg_ctxt.widx;
+
+	if ((desc->lmsg_ctxt.widx + blks) > desc->tx_ctxt->lmsg_buf_cnt) {
+		blks_consumed = desc->tx_ctxt->lmsg_buf_cnt - idx;
+		aux_ptr->len = len - (blks_consumed * lsz);
+		aux_ptr->buf = desc->tx_ctxt->lring_buf;
+	}
+
+	desc->lmsg_ctxt.widx = (desc->lmsg_ctxt.widx + blks) %
+		desc->tx_ctxt->lmsg_buf_cnt;
+
+	desc->lmsg_ctxt.lmsg_free_cnt -= blks;
+
+	if (desc->lmsg_ctxt.lmsg_free_cnt <=
+			((desc->tx_ctxt->lmsg_buf_cnt * 20) / 100))
+		*is_lbuf_full = true;
+
+	ret_ptr = TO_APPS_ADDR(le32_to_cpu(desc->tx_ctxt->lring_buf)) + (idx * lsz);
+
+	return ret_ptr;
+}
+
+static struct ring_buffer_info *btss_get_tx_rbuf(struct qcom_btss *desc,
+						 bool *is_sbuf_full)
+{
+	struct ring_buffer_info *rinfo;
+	u32 next;
+	u8 idx;
+
+	rinfo = &(desc->tx_ctxt->sring_buf_info);
+	while (rinfo != NULL) {
+		idx = (rinfo->widx + 1) % (desc->tx_ctxt->smsg_buf_cnt);
+
+		if (idx != rinfo->tidx) {
+			desc->lmsg_ctxt.smsg_free_cnt--;
+
+			if (desc->lmsg_ctxt.smsg_free_cnt <=
+				((desc->tx_ctxt->smsg_buf_cnt * 20) / 100))
+				*is_sbuf_full = true;
+
+			return rinfo;
+		}
+
+		next = le32_to_cpu(rinfo->next);
+		rinfo = next ? (struct ring_buffer_info *)TO_APPS_ADDR(next) : NULL;
+	}
+
+	return ERR_PTR(-EAGAIN);
+}
+
+static int btss_send(struct qcom_btss *desc, u16 msg_hdr,
+		     struct sk_buff *skb)
+{
+	struct hci_dev *hdev = desc->hdev;
+	struct ipc_aux_ptr aux_ptr = { };
+	struct ring_buffer_info *rinfo;
+	struct ring_buffer *rbuf;
+	bool is_lbuf_full = false;
+	bool is_sbuf_full = false;
+	u16 hdr = msg_hdr;
+	u16 lmsg_free_cnt;
+	void *ptr_buf;
+	u8 lmsg_widx;
+	u32 len;
+
+	/* Account for HCI packet type as it's not included in the skb payload */
+	len = skb ? skb->len + 1 : 0;
+
+	if (len > IPC_MSG_PLD_SZ) {
+		hdr |= IPC_HDR_LONG_MSG;
+
+		/* snapshot of long message context in case we need to reverse */
+		lmsg_free_cnt = le16_to_cpu(desc->lmsg_ctxt.lmsg_free_cnt);
+		lmsg_widx = desc->lmsg_ctxt.widx;
+
+		ptr_buf = btss_alloc_lmsg(desc, len,
+					  &aux_ptr, &is_lbuf_full);
+		if (IS_ERR(ptr_buf)) {
+			bt_dev_err(hdev, "TX long buffers full");
+			hdev->stat.err_tx++;
+			return PTR_ERR(ptr_buf);
+		}
+	}
+
+	rinfo = btss_get_tx_rbuf(desc, &is_sbuf_full);
+	if (IS_ERR(rinfo)) {
+		bt_dev_err(hdev, "TX short buffers full");
+		hdev->stat.err_tx++;
+		if (len > IPC_MSG_PLD_SZ) {
+			/* reverse long message context if we allocated one */
+			desc->lmsg_ctxt.lmsg_free_cnt = cpu_to_le16(lmsg_free_cnt);
+			desc->lmsg_ctxt.widx = lmsg_widx;
+		}
+		return PTR_ERR(rinfo);
+	}
+
+	rbuf = &((struct ring_buffer *)(TO_APPS_ADDR(le32_to_cpu(rinfo->rbuf))))[rinfo->widx];
+
+	if (!skb)
+		goto complete_tx;
+
+	if (len > IPC_MSG_PLD_SZ)
+		rbuf->payload.lmsg_data = cpu_to_le32(TO_BT_ADDR(ptr_buf));
+	else
+		ptr_buf = rbuf->payload.smsg_data;
+
+	/* if it's a short message, the aux len and buf are NULL */
+	memcpy_toio(ptr_buf, &hci_skb_pkt_type(skb), 1);
+	memcpy_toio((u8 *)ptr_buf + 1, skb->data, skb->len - aux_ptr.len);
+	if (aux_ptr.buf) {
+		memcpy_toio(TO_APPS_ADDR(aux_ptr.buf),
+			    (skb->data + (skb->len - aux_ptr.len)),
+			    aux_ptr.len);
+	}
+
+	/*
+	 * if free buffer count is low, send ACK request to signal to the
+	 * firmware to process and free up queued buffers in the TX ring.
+	 */
+	if (is_sbuf_full || is_lbuf_full)
+		hdr |= IPC_HDR_REQ_ACK;
+
+complete_tx:
+	rbuf->msg_hdr = cpu_to_le16(hdr);
+	rbuf->len = cpu_to_le16(len);
+
+	dma_wmb();
+
+	rinfo->widx = (rinfo->widx + 1) % desc->tx_ctxt->smsg_buf_cnt;
+
+	regmap_set_bits(desc->regmap, desc->offset, BIT(desc->bit));
+
+	return 0;
+}
+
+static void btss_process_tx_queue(struct qcom_btss *desc)
+{
+	struct sk_buff *skb;
+	u16 hdr;
+	int ret;
+
+	while ((skb = skb_dequeue(&desc->tx_q))) {
+		hdr = FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
+
+		ret = btss_send(desc, hdr, skb);
+		if (ret) {
+			bt_dev_err(desc->hdev, "Failed to send message");
+			skb_queue_head(&desc->tx_q, skb);
+			break;
+		}
+
+		btqcomipc_update_stats(desc->hdev, skb);
+		kfree_skb(skb);
+	}
+}
+
+static void btss_free_lmsg(struct qcom_btss *desc, u32 lmsg, u16 len)
+{
+	u8 idx;
+	u8 blks;
+	u32 lsz = btss_lbuf_size(desc, desc->tx_ctxt);
+
+	idx = GET_TX_INDEX_FROM_BUF(lmsg, lsz);
+
+	if (idx != desc->lmsg_ctxt.ridx)
+		return;
+
+	blks = GET_NO_OF_BLOCKS(len, lsz);
+
+	desc->lmsg_ctxt.ridx  = (desc->lmsg_ctxt.ridx + blks) %
+		desc->tx_ctxt->lmsg_buf_cnt;
+
+	desc->lmsg_ctxt.lmsg_free_cnt += blks;
+}
+
+static int btss_recv_cust_frame(struct qcom_btss *desc, u8 cmd)
+{
+	u16 msg_hdr = 0;
+	int ret;
+
+	switch (cmd) {
+	case IPC_CMD_STOP:
+		spin_unlock(&desc->lock);
+		ret = qcom_scm_pas_set_bluetooth_power_mode(BTSS_PAS_ID, true);
+		spin_lock(&desc->lock);
+		if (ret && ret != -EOPNOTSUPP) {
+			bt_dev_err(desc->hdev,
+				   "Failed to apply BTSS power-save mode: %d",
+				   ret);
+			return ret;
+		}
+
+		WRITE_ONCE(desc->running, false);
+
+		msg_hdr |= cmd;
+		ret = btss_send(desc, msg_hdr, NULL);
+		if (ret)
+			bt_dev_err(desc->hdev,
+				   "Failed to send control message");
+		break;
+	case IPC_CMD_START:
+		spin_unlock(&desc->lock);
+		ret = qcom_scm_pas_set_bluetooth_power_mode(BTSS_PAS_ID, false);
+		spin_lock(&desc->lock);
+		if (ret && ret != -EOPNOTSUPP) {
+			bt_dev_err(desc->hdev,
+				   "Failed to apply BTSS active power mode: %d",
+				   ret);
+			return ret;
+		}
+
+		desc->tx_ctxt = (struct context_info *)((void *)desc->rx_ctxt +
+				le16_to_cpu(desc->rx_ctxt->total_size));
+		desc->lmsg_ctxt.widx = 0;
+		desc->lmsg_ctxt.ridx = 0;
+		desc->lmsg_ctxt.smsg_free_cnt = desc->tx_ctxt->smsg_buf_cnt;
+		desc->lmsg_ctxt.lmsg_free_cnt = desc->tx_ctxt->lmsg_buf_cnt;
+		WRITE_ONCE(desc->running, true);
+		wake_up(&desc->wait_q);
+		break;
+	default:
+		bt_dev_err(desc->hdev, "Unsupported CMD ID: %u", cmd);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static inline int btss_recv_hci_frame(struct qcom_btss *desc, const u8 *data,
+				      size_t len)
+{
+	unsigned char pkt_type;
+	struct sk_buff *skb;
+	size_t pkt_len;
+
+	if (len < 1)
+		return -EPROTO;
+
+	pkt_type = data[0];
+
+	switch (pkt_type) {
+	case HCI_EVENT_PKT:
+	{
+		if (len < 1 + HCI_EVENT_HDR_SIZE)
+			return -EILSEQ;
+		struct hci_event_hdr *hdr = (struct hci_event_hdr *)(data + 1);
+
+		pkt_len = HCI_EVENT_HDR_SIZE + hdr->plen;
+		break;
+	}
+	case HCI_COMMAND_PKT: {
+		if (len < 1 + HCI_COMMAND_HDR_SIZE)
+			return -EILSEQ;
+		struct hci_command_hdr *hdr = (struct hci_command_hdr *)(data + 1);
+
+		pkt_len = HCI_COMMAND_HDR_SIZE + hdr->plen;
+		break;
+	}
+	case HCI_ACLDATA_PKT:
+	{
+		if (len < 1 + HCI_ACL_HDR_SIZE)
+			return -EILSEQ;
+		struct hci_acl_hdr *hdr = (struct hci_acl_hdr *)(data + 1);
+
+		pkt_len = HCI_ACL_HDR_SIZE + le16_to_cpu(hdr->dlen);
+		break;
+	}
+	case HCI_SCODATA_PKT:
+	{
+		if (len < 1 + HCI_SCO_HDR_SIZE)
+			return -EILSEQ;
+		struct hci_sco_hdr *hdr = (struct hci_sco_hdr *)(data + 1);
+
+		pkt_len = HCI_SCO_HDR_SIZE + hdr->dlen;
+		break;
+	}
+	default:
+		return -EPROTO;
+	}
+
+	if (pkt_len + 1 > len)
+		return -EINVAL;
+
+	skb = bt_skb_alloc(pkt_len, GFP_ATOMIC);
+	if (!skb) {
+		desc->hdev->stat.err_rx++;
+		return -ENOMEM;
+	}
+
+	skb->dev = (void *)desc->hdev;
+	hci_skb_pkt_type(skb) = pkt_type;
+	skb_put_data(skb, data + 1, pkt_len);
+
+	hci_recv_frame(desc->hdev, skb);
+	desc->hdev->stat.byte_rx += pkt_len;
+
+	return 0;
+}
+
+static inline int btss_process_rx(struct qcom_btss *desc,
+				  struct ring_buffer_info *rinfo,
+				  bool *ack, u8 *rx_count)
+{
+	u8 ridx, lbuf_idx, blks_consumed, pkt_type, cmd;
+	struct ipc_aux_ptr aux_ptr = { };
+	struct ring_buffer *rbuf;
+	uint8_t *rxbuf = NULL;
+	unsigned char *buf;
+	u16 msg_hdr;
+	u16 msg_len;
+	u32 lsz;
+	int ret;
+
+	ridx = rinfo->ridx;
+
+	while (ridx != rinfo->widx) {
+		rbuf = &((struct ring_buffer *)(TO_APPS_ADDR(le32_to_cpu(rinfo->rbuf))))[ridx];
+		msg_hdr = le16_to_cpu(rbuf->msg_hdr);
+		msg_len = le16_to_cpu(rbuf->len);
+
+		if (!(msg_hdr & IPC_HDR_LONG_MSG) && msg_len > IPC_MSG_PLD_SZ) {
+			desc->hdev->stat.err_rx++;
+			bt_dev_err(desc->hdev,
+				   "Dropping short RX frame with invalid len %u",
+				   msg_len);
+			ridx = (ridx + 1) % rinfo->ring_buf_cnt;
+			rinfo->ridx = ridx;
+			if (rx_count)
+				(*rx_count)++;
+			continue;
+		}
+
+		if (msg_hdr & IPC_HDR_LONG_MSG) {
+			rxbuf = TO_APPS_ADDR(le32_to_cpu(rbuf->payload.lmsg_data));
+			lsz = btss_lbuf_size(desc, desc->rx_ctxt);
+
+			if (IS_RX_MEM_NON_CONTIGIOUS(le32_to_cpu(rbuf->payload.lmsg_data),
+					     msg_len, lsz)) {
+				lbuf_idx = GET_RX_INDEX_FROM_BUF(
+						le32_to_cpu(rbuf->payload.lmsg_data), lsz);
+
+				blks_consumed = desc->rx_ctxt->lmsg_buf_cnt -
+					lbuf_idx;
+				aux_ptr.len = msg_len - (blks_consumed * lsz);
+				aux_ptr.buf = le32_to_cpu(desc->rx_ctxt->lring_buf);
+			}
+		} else {
+			rxbuf = rbuf->payload.smsg_data;
+		}
+
+		*ack = msg_hdr & IPC_HDR_REQ_ACK;
+
+		pkt_type = FIELD_GET(IPC_HDR_PKT_TYPE_MASK, msg_hdr);
+
+		switch (pkt_type) {
+		case IPC_HDR_PKT_TYPE_HCI:
+			buf = kmalloc(msg_len, GFP_ATOMIC);
+			if (!buf) {
+				desc->hdev->stat.err_rx++;
+				bt_dev_err(desc->hdev,
+					   "Dropping HCI frame due to RX allocation failure");
+				ridx = (ridx + 1) % rinfo->ring_buf_cnt;
+				rinfo->ridx = ridx;
+				if (rx_count)
+					(*rx_count)++;
+				continue;
+			}
+
+			memcpy_fromio(buf, rxbuf, msg_len - aux_ptr.len);
+
+			if (aux_ptr.buf)
+				memcpy_fromio(buf + (msg_len - aux_ptr.len),
+					      TO_APPS_ADDR(aux_ptr.buf),
+					      aux_ptr.len);
+
+			ret = btss_recv_hci_frame(desc, buf, msg_len);
+			if (ret)
+				bt_dev_err(desc->hdev,
+					   "Failed to process HCI frame: %d",
+					   ret);
+			kfree(buf);
+			break;
+		case IPC_HDR_PKT_TYPE_CUST:
+			cmd = FIELD_GET(IPC_HDR_CMD_MASK, msg_hdr);
+			ret = btss_recv_cust_frame(desc, cmd);
+			if (ret)
+				bt_dev_warn(desc->hdev,
+					    "Failed to process custom frame: %d",
+					    ret);
+			break;
+		default:
+			break;
+		}
+
+		ridx = (ridx + 1) % rinfo->ring_buf_cnt;
+
+		if (rx_count)
+			(*rx_count)++;
+
+		rinfo->ridx = ridx;
+	}
+
+	return 0;
+}
+
+static void btss_process_ack(struct qcom_btss *desc)
+{
+	struct ring_buffer_info *rinfo;
+	struct ring_buffer *rbuf;
+	u32 next;
+	u32 lmsg;
+	u16 msg_hdr;
+	u16 msg_len;
+	u8 tidx;
+
+	rinfo = &desc->tx_ctxt->sring_buf_info;
+	while (rinfo != NULL) {
+		tidx = rinfo->tidx;
+		rbuf = (struct ring_buffer *)TO_APPS_ADDR(le32_to_cpu(rinfo->rbuf));
+
+		while (tidx != rinfo->ridx) {
+			msg_hdr = le16_to_cpu(rbuf[tidx].msg_hdr);
+			if (msg_hdr & IPC_HDR_LONG_MSG) {
+				lmsg = le32_to_cpu(rbuf[tidx].payload.lmsg_data);
+				msg_len = le16_to_cpu(rbuf[tidx].len);
+				btss_free_lmsg(desc, lmsg, msg_len);
+			}
+
+			tidx = (tidx + 1) % desc->tx_ctxt->smsg_buf_cnt;
+			desc->lmsg_ctxt.smsg_free_cnt++;
+		}
+
+		rinfo->tidx = tidx;
+
+		btss_process_tx_queue(desc);
+
+		next = le32_to_cpu(rinfo->next);
+		rinfo = next ? (struct ring_buffer_info *)TO_APPS_ADDR(next) : NULL;
+	}
+}
+
+static void btss_worker(struct work_struct *work)
+{
+	struct qcom_btss *desc = container_of(work, struct qcom_btss, work);
+	struct ring_buffer_info *rinfo;
+	bool ack = false;
+	u32 offset, next;
+	int ret;
+
+	spin_lock(&desc->lock);
+
+	if (unlikely(!READ_ONCE(desc->running))) {
+		/*
+		 * FW sets offset of RX context info at the start of the memory
+		 * region upon boot
+		 */
+		offset = readl(desc->mem_region);
+		dev_dbg(desc->dev, "offset after firmware boot: 0x%08x\n",
+			offset);
+		desc->rx_ctxt = (struct context_info *)(desc->mem_region + offset);
+	} else {
+		btss_process_ack(desc);
+	}
+
+	rinfo = &(desc->rx_ctxt->sring_buf_info);
+	while (rinfo != NULL) {
+		ret = btss_process_rx(desc, rinfo, &ack,
+				      &desc->rx_ctxt->smsg_buf_cnt);
+		if (ret) {
+			bt_dev_err(desc->hdev,
+				   "Failed to process peer msgs: %d", ret);
+			goto spin_unlock;
+		}
+		next = le32_to_cpu(rinfo->next);
+		rinfo = next ? (struct ring_buffer_info *)TO_APPS_ADDR(next) : NULL;
+	}
+
+	if (ack)
+		regmap_set_bits(desc->regmap, desc->offset, BIT(desc->bit));
+
+spin_unlock:
+	spin_unlock(&desc->lock);
+}
+
+static irqreturn_t btss_irq_handler(int irq, void *data)
+{
+	struct qcom_btss *desc = data;
+
+	queue_work(desc->wq, &desc->work);
+
+	return IRQ_HANDLED;
+}
+
+static int btcomqipc_firmware_load(struct qcom_btss *desc)
+{
+	const char *dot = strrchr(desc->firmware, '.');
+	const struct elf32_phdr *phdrs;
+	const struct firmware *seg_fw;
+	const struct elf32_phdr *phdr;
+	const struct elf32_hdr *ehdr;
+	const struct firmware *fw;
+	size_t metadata_len;
+	size_t stem_len;
+	void *metadata;
+	char *seg_name;
+	int i, ret;
+
+	if (!dot || dot != desc->firmware + strlen(desc->firmware) - 4) {
+		dev_err(desc->dev, "Invalid firmware name: %s\n",
+			desc->firmware);
+		return -EINVAL;
+	}
+
+	stem_len = dot - desc->firmware;
+
+	ret = request_firmware(&fw, desc->firmware, desc->dev);
+	if (ret) {
+		dev_err(desc->dev, "Failed to request firmware: %d\n",
+			ret);
+		return ret;
+	}
+
+	metadata = qcom_mdt_read_metadata(fw, &metadata_len, desc->firmware, desc->dev);
+	if (IS_ERR(metadata)) {
+		ret = PTR_ERR(metadata);
+		dev_err(desc->dev, "error %d reading firmware %s metadata\n",
+			ret, desc->firmware);
+		goto release_fw;
+	}
+
+	ret = qcom_scm_pas_init_image(BTSS_PAS_ID, metadata, metadata_len, NULL);
+	kfree(metadata);
+	if (ret) {
+		dev_err(desc->dev, "error %d initializing firmware %s\n",
+			ret, desc->firmware);
+		goto release_fw;
+	}
+
+	/*
+	 * qcom_mdt_read_metadata has already validated the ELF/mdt header, so
+	 * no need to revalidate it again here.
+	 */
+	ehdr = (const struct elf32_hdr *)fw->data;
+	phdrs = (const struct elf32_phdr *)(ehdr + 1);
+
+	/* guard against a large (incorrect) number of program headers */
+	if (ehdr->e_phnum > 99) {
+		dev_err(desc->dev, "Too many program headers: %d\n",
+			ehdr->e_phnum);
+		ret = -EINVAL;
+		goto release_fw;
+	}
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		/* Only process valid loadable data segments */
+		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
+			continue;
+
+		if (phdr->p_vaddr > desc->mem_size ||
+		    phdr->p_filesz > desc->mem_size - phdr->p_vaddr) {
+			dev_err(desc->dev,
+				"Segment data exceeds the reserved memory area!\n");
+			goto release_fw;
+		}
+
+		/* Check if firmware is split across multiple segment files */
+		if (phdr->p_offset > fw->size ||
+		    phdr->p_filesz > fw->size - phdr->p_offset) {
+			seg_name = kasprintf(GFP_KERNEL, "%.*sb%02d",
+					     (int)stem_len, desc->firmware, i);
+			if (!seg_name) {
+				ret = -ENOMEM;
+				goto release_fw;
+			}
+
+			ret = request_firmware(&seg_fw, seg_name,
+					       desc->dev);
+			if (ret)
+				dev_err(desc->dev,
+					"Could not find split segment binary: %s\n",
+					seg_name);
+
+			/*
+			 * Use the virtual instead of the physical address as
+			 * the offset
+			 */
+			memcpy_toio(desc->mem_region + phdr->p_vaddr, seg_fw->data,
+				    phdr->p_filesz);
+
+			release_firmware(seg_fw);
+			kfree(seg_name);
+			seg_name = NULL;
+
+			if (ret)
+				goto release_fw;
+		} else {
+			memcpy_toio(desc->mem_region + phdr->p_vaddr,
+				    fw->data + phdr->p_offset, phdr->p_filesz);
+		}
+	}
+
+release_fw:
+	release_firmware(fw);
+	return ret;
+}
+
+static int btqcomipc_open(struct hci_dev *hdev)
+{
+	struct qcom_btss *desc = hci_get_drvdata(hdev);
+	int ret;
+
+	if (!qcom_scm_pas_supported(BTSS_PAS_ID)) {
+		bt_dev_err(hdev,
+			   "PAS is not available for peripheral: 0x%x",
+			   BTSS_PAS_ID);
+		return -ENODEV;
+	}
+
+	ret = btcomqipc_firmware_load(desc);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to load firmware: %d", ret);
+		return ret;
+	}
+
+	/* Boot firmware */
+	ret = qcom_scm_pas_auth_and_reset(BTSS_PAS_ID);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to boot firmware: %d", ret);
+		return ret;
+	}
+
+	msleep(BTSS_PWR_CTRL_DELAY_MS);
+	ret = wait_event_timeout(desc->wait_q, READ_ONCE(desc->running),
+				 msecs_to_jiffies(1000));
+
+	if (!ret) {
+		bt_dev_err(hdev, "Timeout waiting for BTSS start");
+		ret = -ETIMEDOUT;
+		goto shutdown;
+	}
+
+	return 0;
+
+shutdown:
+	qcom_scm_pas_shutdown(BTSS_PAS_ID);
+	return ret;
+}
+
+static int btqcomipc_close(struct hci_dev *hdev)
+{
+	int ret;
+
+	/*
+	 * Trigger the controller to shutdown. Once the FW has completed its
+	 * shutdown sequence, it will send an IPC_CMD_STOP message to the host
+	 * upon which the desc->running flag is set to false.
+	 */
+	ret = qcom_scm_pas_shutdown(BTSS_PAS_ID);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to stop firmware: %d", ret);
+		return ret;
+	}
+
+	msleep(BTSS_PWR_CTRL_DELAY_MS);
+
+	return 0;
+}
+
+static int btqcomipc_setup(struct hci_dev *hdev)
+{
+	struct qca_btsoc_version ver;
+	int ret;
+
+	/*
+	 * Enable controller to do both LE scan and BR/EDR inquiry
+	 * simultaneously.
+	 */
+	hci_set_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY);
+
+	/*
+	 * Enable NON_PERSISTENT_SETUP QUIRK to ensure to execute
+	 * setup for every hci up.
+	 */
+	hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
+	ret = qca_read_soc_version(hdev, &ver, QCA_IPQ5018);
+	if (ret)
+		return -EINVAL;
+
+	ret = qca_uart_setup(hdev, 0, QCA_IPQ5018, ver, NULL);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to setup UART: %d\n", ret);
+		return ret;
+	}
+
+	/* Obtain and set BD address from NVMEM cell */
+	hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+	hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+
+	return 0;
+}
+
+static int btqcomipc_send(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	u16 hdr = FIELD_PREP(IPC_HDR_PKT_TYPE_MASK, IPC_HDR_PKT_TYPE_HCI);
+	struct qcom_btss *desc = hci_get_drvdata(hdev);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&desc->lock, flags);
+
+	if (unlikely(!READ_ONCE(desc->running))) {
+		spin_unlock_irqrestore(&desc->lock, flags);
+		bt_dev_err(hdev,
+			   "BTSS not initialized, failed to send message");
+		ret = -ENODEV;
+		goto free_skb;
+	}
+
+	ret = btss_send(desc, hdr, skb);
+	spin_unlock_irqrestore(&desc->lock, flags);
+	if (ret) {
+		if (ret == -EAGAIN) {
+			if (skb_queue_len(&desc->tx_q) >= IPC_TX_QSIZE) {
+				bt_dev_err(hdev,
+					   "TX queue full, dropping message");
+				hdev->stat.err_tx++;
+				ret = -ENOBUFS;
+			} else {
+				skb_queue_tail(&desc->tx_q, skb);
+				return 0;
+			}
+		} else {
+			bt_dev_err(hdev, "Failed to send message: %d", ret);
+			hdev->stat.err_tx++;
+		}
+	}
+
+	btqcomipc_update_stats(desc->hdev, skb);
+
+free_skb:
+	kfree_skb(skb);
+
+	return ret;
+}
+
+static int btqcomipc_flush(struct hci_dev *hdev)
+{
+	struct qcom_btss *desc = hci_get_drvdata(hdev);
+
+	skb_queue_purge(&desc->tx_q);
+	return 0;
+}
+
+static int btqcomipc_init(struct qcom_btss *desc)
+{
+	struct device *dev = desc->dev;
+	int ret;
+
+	init_waitqueue_head(&desc->wait_q);
+	spin_lock_init(&desc->lock);
+	skb_queue_head_init(&desc->tx_q);
+
+	desc->wq = devm_alloc_ordered_workqueue(dev, "btss_wq", 0);
+	if (!desc->wq) {
+		dev_err(dev, "Failed to initialize workqueue\n");
+		return -ENOMEM;
+	}
+
+	INIT_WORK(&desc->work, btss_worker);
+
+	ret = devm_request_threaded_irq(dev, desc->irq, NULL, btss_irq_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"btss_irq", desc);
+
+	if (ret)
+		dev_err(dev, "error registering irq[%d] ret = %d\n",
+			desc->irq, ret);
+
+	return ret;
+}
+
+static void btqcomipc_deinit(struct qcom_btss *desc)
+{
+	disable_irq(desc->irq);
+	if (desc->wq != NULL) {
+		flush_workqueue(desc->wq);
+		skb_queue_purge(&desc->tx_q);
+	}
+}
+
+static int btqcomipc_alloc_memory_region(struct qcom_btss *desc)
+{
+	struct device *dev = desc->dev;
+	struct resource res;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "unable to acquire memory-region resource\n");
+		return ret;
+	}
+
+	desc->mem_phys = res.start;
+	desc->mem_reloc = res.start;
+	desc->mem_size = resource_size(&res);
+	desc->mem_region = devm_ioremap(dev, desc->mem_phys, desc->mem_size);
+	if (!desc->mem_region) {
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int btqcomipc_probe(struct platform_device *pdev)
+{
+	struct reset_control *btss_reset;
+	struct device *dev = &pdev->dev;
+	struct qcom_btss *desc;
+	struct hci_dev *hdev;
+	struct of_phandle_args args;
+	struct device_node *ipc_np;
+	struct clk *lpo_clk;
+	int ret;
+
+	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	desc->dev = dev;
+
+	ret = of_property_read_string(dev->of_node, "firmware-name",
+				      &desc->firmware);
+	if (ret < 0)
+		return ret;
+
+	ret = btqcomipc_alloc_memory_region(desc);
+	if (ret)
+		return ret;
+
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,ipc", 2, 0,
+					       &args);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get ipc node\n");
+
+	ipc_np = args.np;
+
+	desc->regmap = device_node_to_regmap(ipc_np);
+	if (IS_ERR(desc->regmap)) {
+		dev_err(dev, "Failed to get regmap from ipc node\n");
+		of_node_put(ipc_np);
+		return PTR_ERR(desc->regmap);
+	}
+
+	desc->offset = args.args[0];
+	desc->bit = args.args[1];
+
+	of_node_put(ipc_np);
+
+	lpo_clk = devm_clk_get_enabled(dev, "lpo");
+	if (IS_ERR(lpo_clk))
+		return dev_err_probe(dev, PTR_ERR(lpo_clk),
+				     "Failed to get lpo clock\n");
+
+	btss_reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR_OR_NULL(btss_reset))
+		return dev_err_probe(dev, PTR_ERR(btss_reset),
+				     "unable to deassert reset\n");
+
+	desc->irq = platform_get_irq(pdev, 0);
+	if (desc->irq < 0)
+		return dev_err_probe(dev, desc->irq, "Failed to acquire IRQ\n");
+
+	hdev = hci_alloc_dev();
+	if (!hdev)
+		return -ENOMEM;
+
+	hci_set_drvdata(hdev, desc);
+	desc->hdev = hdev;
+	SET_HCIDEV_DEV(hdev, &pdev->dev);
+	hdev->bus = HCI_IPC;
+
+	hdev->open = btqcomipc_open;
+	hdev->close = btqcomipc_close;
+	hdev->setup = btqcomipc_setup;
+	hdev->send = btqcomipc_send;
+	hdev->flush = btqcomipc_flush;
+	hdev->set_bdaddr = qca_set_bdaddr;
+
+	ret = btqcomipc_init(desc);
+	if (ret) {
+		hci_free_dev(hdev);
+		return dev_err_probe(dev, ret, "Failed to initialize\n");
+	}
+
+	ret = hci_register_dev(hdev);
+	if (ret < 0) {
+		btqcomipc_deinit(desc);
+		hci_free_dev(hdev);
+		return dev_err_probe(dev, -EBUSY, "Failed to register hdev\n");
+	}
+
+	platform_set_drvdata(pdev, desc);
+
+	return 0;
+}
+
+static void btqcomipc_remove(struct platform_device *pdev)
+{
+	struct qcom_btss *desc = platform_get_drvdata(pdev);
+
+	if (desc->hdev) {
+		hci_unregister_dev(desc->hdev);
+		hci_free_dev(desc->hdev);
+		desc->hdev = NULL;
+	}
+
+	btqcomipc_deinit(desc);
+}
+
+static const struct of_device_id btqcomipc_of_match[] = {
+	{ .compatible = "qcom,ipq5018-bt" },
+	{ /* sentinel */},
+};
+MODULE_DEVICE_TABLE(of, btqcomipc_of_match);
+
+static struct platform_driver btqcomipc_driver = {
+	.probe = btqcomipc_probe,
+	.remove = btqcomipc_remove,
+	.driver = {
+		.name = "btqcomipc",
+		.of_match_table = btqcomipc_of_match,
+	},
+};
+
+module_platform_driver(btqcomipc_driver);
+
+MODULE_DESCRIPTION("Qualcomm Bluetooth IPC Driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0



