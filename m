Return-Path: <linux-arm-msm+bounces-108422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ+gOoQnDGrMXgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2957AD6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF55B30531C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466013F0763;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogqY9Cp8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A03EFFDA;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=IBquwZ7tmATgNChugn8LGgl8e8A9CyVJcJ1xZAzCA1gP/+ZJTvIAMNic4EOwVccl1hcD1QW9IOzBBQPFmfVxZpEgNgLAiupWk3x7V0p3zDbVcAErS3RjA9Na9yck7fgtYns3qQ6+8ZI/eWPNzIMS/yvbrJJ6LLtSWFPBIZk8RRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=DbW7cWokzs9SPWLbVR6F11pAkkmVjuF4uDahlgdHrFI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hiy7oLXLRf1QVU8B7wODU3RsT1i0ThEw+fbWquSTePUq9vEMKb3BGIhwnuzj0DH4J2Fma3LS8ubJD6sAiu+y+VWByhDm2vi1432Oid1Zm08EDadTVRxJqHw4UGC0b+25FtGXeYx6+kcgT17RJXtb6UmU0zr/1/r74OX9523UO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogqY9Cp8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DDEDC2BCB3;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180963;
	bh=DbW7cWokzs9SPWLbVR6F11pAkkmVjuF4uDahlgdHrFI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ogqY9Cp8FYfJTMMLiLOmaeSRT5WL1CT84BKiFDxcdgena8dVrGag5z1RwBpo7BDSu
	 yqyz6CHAyntxv/maGPRDtUqCV+Vv1Bn5WtHtDEZfy3UZws4hFxZR7U0mZq/J6B50Qs
	 Zu4fbs7wHC5+AsSI8KoOOdvX0GjDt5T89x0bS8PqVc7pIMQ/JJd2x/wq6eMzzOzoew
	 cjiSxmU0qCMjM0GgGW20gQgGiMsmbOlPcfcnFecbd6n94dl3EIurJ9/pJKKU8fS3S0
	 BGM5Lore5oAqUfXExQ+V147GY865gkKIfSzDyIYsa1GyVzeiydBdSQhTr8BdmMGGzq
	 7ZXiQtLGHr15A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8618ECD4F5B;
	Tue, 19 May 2026 08:56:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/9] Fixes/improvements for the PCI M.2 power sequencing
 driver
Date: Tue, 19 May 2026 14:25:55 +0530
Message-Id: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJslDGoC/3WNwQ6CMBBEf4Xs2ZKyFoie/A/DoYVVaoRCF1BD+
 u8WPHuZ5CUzb1Zg8pYYzskKnhbL1vURjocE6lb3dxK2iQwosZAKUQwvzzSKDoWZhDaN1mUmT4o
 MxMng6Wbfu+5a/Zhn86B62hxbo7U8Of/Z/5Zs6/1RL5mQokTZSMxVrgt1cczpOOtn7boujQFVC
 OEL1ssDmcEAAAA=
X-Change-ID: 20260422-pwrseq-m2-bt-abdaa71094eb
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=DbW7cWokzs9SPWLbVR6F11pAkkmVjuF4uDahlgdHrFI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWd6uHVDNDSaoRPub149N10KV5kuzO24ifSD
 MySZ45yJ7mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlnQAKCRBVnxHm/pHO
 9cIBB/9x3BxeHndl79hZqMzi6uMkzEEbeolEngfxNvIn2I6u7AbAxFP9ctfVhWHQ3cL+JRmwvsB
 P3n1xHSJMXEVLWmnNNmyFijsP5xfPTk9WkXKvHXvm3mG8WpzE4n0Hb2OwD6sMKaixHua/JjZl+Q
 H1wFeiX1DvMnEv/OT9U5X4FY8b5UZ98y6TS4IXkWeasMkA987IRbt54BYBqI65bDa+OY8PVjHjB
 JQVTnUxg/bZ0kUnnVtWC9yMQIt7ARoMdXCqk3Y7+VaFhXMYv3OqrQabgKhBywjqNgXUGj9+vSlj
 qM3G10Cz8Wbg7SELu9I/YGjAKFrPKdpV6HNc8FMBVNnUnFxq
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108422-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,msgid.link:url]
X-Rspamd-Queue-Id: 7AE2957AD6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series has several key improvements and fixes to the M.2 power sequencing
driver and also the BT HCI_QCA driver. Notably, this series allows the M.2 power
sequencing driver to work with more M.2 cards, not just WCN7850. It also allows
the BT HCI_QCA driver to detect whether it can control BT_EN (or W_DISABLE2#)
signal on the connector and set the HCI_QUIRK_NON_PERSISTENT_SETUP quirk.

Testing
=======

This series was tested on Lenovo Thinkpad T14s together with the below DTS
patches:
https://github.com/Mani-Sadhasivam/linux/commit/29534d15307551b2355eb254601dec511169f0aa
https://github.com/Mani-Sadhasivam/linux/commit/f4eaacfe647674be200847092b43cdef2194fc55

Merge Strategy
==============

Since the BT HCI_QCA changes depend on the pwrseq changes, it would be good to
merge the whole series through pwrseq tree or through an immutable branch.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v3:
- Renamed __pwrseq_pcie_m2_create_serdev() to pwrseq_pcie_m2_create_serdev_one()
- Moved the pwrseq patches together for creating the immutable pwrseq branch
- Collected tags

Changes in v2:
- Dropped the pwrseq_is_fixed() change in favor or exporting pwrseq device's dev
  pointer and using it to check for the presence of W_DISABLE2# property
- Dropped the BT_EN fix for the Qcom WCN devices since it will be handled
  separately
- Collected tags
- Link to v1: https://patch.msgid.link/20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com

---
Manivannan Sadhasivam (9):
      power: sequencing: pcie-m2: Fix inconsistent function prefixes
      power: sequencing: pcie-m2: Allow creating serdev for multiple PCI devices
      power: sequencing: pcie-m2: Improve PCI device ID check
      power: sequencing: pcie-m2: Create serdev for PCI devices present before probe
      power: sequencing: pcie-m2: Create BT node based on the pci_device_id[] table
      power: sequencing: Add an API to return the pwrseq device's 'dev' pointer
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
      Bluetooth: hci_qca: Set 'bt_en_available' based on W_DISABLE2# presence in M.2 connector

 drivers/bluetooth/hci_qca.c               |  28 +++-
 drivers/power/sequencing/core.c           |   9 ++
 drivers/power/sequencing/pwrseq-pcie-m2.c | 232 ++++++++++++++++++++++--------
 include/linux/pwrseq/consumer.h           |   7 +
 4 files changed, 215 insertions(+), 61 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-pwrseq-m2-bt-abdaa71094eb

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



