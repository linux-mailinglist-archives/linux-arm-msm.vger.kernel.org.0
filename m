Return-Path: <linux-arm-msm+bounces-92858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPYwL2LokGkMdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:25:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B013D526
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1241300C326
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 21:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A09D30FC37;
	Sat, 14 Feb 2026 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EniqImIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D4309DB1;
	Sat, 14 Feb 2026 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771104351; cv=none; b=RjOOXPfnPjZRPu/8s+FvCVBWqqtMHi7qqSc71cz3XmI7erWllTcUuvOcrhfC+3sfCJ3n2U8euK7HwPj4DUkIGq9uJe2zyQaBV8lwa9DyEf835oyOu1118zN7OL5ZbJkmmxcNMz+FkvSIbuPQVmvohqkfoCu0p+T10h35Ng4TrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771104351; c=relaxed/simple;
	bh=N6xMz5KoFVfzNcR2If2erhXZur3yHqb3P1eyI0nS6uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IAlnI6msO5qTn5BtGsG4MQ/5EqYbBnmeOEdrAG1iipi81EDqtbDb4kjgYG19Mjq0huQVoZ0KIUiFU9fO0TinsJi/0dsTkb+Opum3qEDIsx+oeBV9roYQz299ry4XcLS+chwEn6jeYukTQaC+eWWWJo0Cpmgfbajr7Tl96v50w6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EniqImIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8004C19422;
	Sat, 14 Feb 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104350;
	bh=N6xMz5KoFVfzNcR2If2erhXZur3yHqb3P1eyI0nS6uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EniqImIRhXkK27NvLvvWCAEuhUjGEtTV01hQ2NCAtUd68tqFiSr0j2Kzm19BhylkR
	 QB6fG6a1NwPeoWTJSF8vZhhGf5PbkQpyNOuxBnbkkU/We6l4D4bjb4ApMtUQ6JfJC4
	 WVWj0HUGOoygsfRn3I6UbeZJmcZNMX6uZNi9ff7YHxXY50EiUl4qmtnBT8KJ6Ux6oH
	 7VtpLGMc7sbYEZzlhjOYX5vSELGTHcuPsseQ4ddTpncvvqHZ1nNQGy3qfbKiBguyG5
	 cLR9f30OBU+rJmVa46Th7r2sT0hvcPvY7tDpZ/NEFJEsDCGEKKUS4YndLK9t4TIr5d
	 scxUyOWIhKi7w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Sat, 14 Feb 2026 16:22:57 -0500
Message-ID: <20260214212452.782265-32-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92858-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A0B013D526
X-Rspamd-Action: no action

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

[ Upstream commit fce1a9244a0f85683be8530e623bc729f24c5067 ]

On QCS9075 and QCA8275 platforms, the BT_EN pin is always pulled up by hw
and cannot be controlled by the host. As a result, in case of a firmware
crash, the host cannot trigger a cold reset. Instead, the BT controller
performs a warm restart on its own, without reloading the firmware.

This leads to the controller remaining in IBS_WAKE state, while the host
expects it to be in sleep mode. The mismatch causes HCI reset commands
to time out. Additionally, the driver does not clear internal flags
QCA_SSR_TRIGGERED and QCA_IBS_DISABLED, which blocks the reset sequence.
If the SSR duration exceeds 2 seconds, the host may enter TX sleep mode
due to tx_idle_timeout, further preventing recovery. Also, memcoredump_flag
is not cleared, so only the first SSR generates a coredump.

Tell the driver that the BT controller has undergone a proper restart sequence:

- Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
- Add a 50ms delay to allow the controller to complete its warm reset.
- Reset tx_idle_timer to prevent the host from entering TX sleep mode.
- Clear memcoredump_flag to allow multiple coredump captures.

Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
which indicates that BT_EN is defined in DTS and cannot be toggled.

Refer to the comment in include/net/bluetooth/hci.h for details on
HCI_QUIRK_NON_PERSISTENT_SETUP.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

`HCI_QUIRK_NON_PERSISTENT_SETUP` has existed since 2018 (commit
`740011cfe9485`), so it's available in all stable trees. The only issue
is the accessor macro change (`test_bit` → `hci_test_quirk`).

### 8. FINAL ASSESSMENT

**Bug being fixed**: Real, user-impacting bug — Bluetooth SSR (SubSystem
Restart) fails on specific Qualcomm platforms (QCS9075, QCA8275) where
BT_EN is hardware-pulled high. After a firmware crash, Bluetooth becomes
permanently non-functional until reboot.

**Severity**: HIGH — Complete loss of Bluetooth functionality after
firmware crash with no recovery path.

**Fix quality**: Well-documented, well-reviewed (by Qualcomm and
Bluetooth maintainers), small and contained.

**Scope**: LOW risk — only affects platforms where
`HCI_QUIRK_NON_PERSISTENT_SETUP` is NOT set (specific hardware
configuration). Does not change behavior for any other platforms.

**Backportability concern**: The `hci_test_quirk()` macro only exists in
v6.16+. For older stable trees (6.1.y, 6.6.y, 6.12.y, 6.13.y), the
backport would need to use `!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP,
&hu->hdev->quirks)` instead. This is a trivial adaptation but means the
patch won't apply cleanly to older stable trees.

**Other concern**: The fix adds `msleep(50)` in the hw_error path, which
is acceptable for an error recovery path but not something you'd want in
a hot path.

**Verdict**: This fixes a real, important bug (complete Bluetooth
failure after firmware crash) on specific hardware. The fix is small,
well-contained, and guarded by a quirk check so it has minimal risk. It
meets stable kernel criteria. The backport will need minor adaptation
for older trees due to the quirk API change, but this is
straightforward. The fix has proper review from Qualcomm and the
Bluetooth subsystem maintainer.

**YES**

 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0faa90..a3c217571c3c4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/*
+	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
+	 * hardware and always stays high, driver cannot control the bt_en pin.
+	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
+	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
+	 * command timeout.
+	 * Add an msleep delay to ensure controller completes the SSR process.
+	 *
+	 * Host will not download the firmware after SSR, controller to remain
+	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * Since the bluetooth chip has been reset, clear the memdump state.
+	 */
+	if (!hci_test_quirk(hu->hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
+		/*
+		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_delay, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sleep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+				  msecs_to_jiffies(qca->tx_idle_delay));
+
+		/* Controller reset completion time is 50ms */
+		msleep(50);
+
+		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+
+		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
+	}
+
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-- 
2.51.0


