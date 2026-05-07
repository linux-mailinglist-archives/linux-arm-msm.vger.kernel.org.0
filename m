Return-Path: <linux-arm-msm+bounces-106478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOtYFQy6/Gl2TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:13:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59A4EBF9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 909C6302F643
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DD944D039;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZB2LxOKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404453EFD39;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169978; cv=none; b=l6VISGV99LR628+YrV7Zrd5rO+sIMP/dJ6EedQimqAn4umBvlUG7OZ8fPtOAJaZSBsCcBj7nujzgQ2qhEAvhdeSZg50a+KX9DYyFyI+O9LGs50sZdXANKuoroxFH7SvwcXoiZMHglb+hB2Dslk9yb33bS7QUxYW1FAIoLFpB6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169978; c=relaxed/simple;
	bh=DI8D86bD8AE3e33QAsmWkuZyiSBpCR+NtFhwtZE0MFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R3NxqV7Td/+iQ48WjBZ/oc69yRTXbIxDKxff/CqzGGL1/O5GwiQr/NfDwCoiaRBoC9niIxYtsrDRlNS2hcHOvXu69W4Be0J0jkMdns0VzcSgTWDlbEK8x4N20m9VmHnwW0jKfalvMmPI1qGB88zJYqOZ4U/9S2Dw+iEj8vtiBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZB2LxOKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6F63C2BCB8;
	Thu,  7 May 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169978;
	bh=DI8D86bD8AE3e33QAsmWkuZyiSBpCR+NtFhwtZE0MFc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZB2LxOKJFOJeABr1gMJpivu14C61J2QEh8fjMzkj9aRgiWgotQZ2wii8E/4TsyIfx
	 dWryENWVSBMhwWviCRB51cH8REZ2070qdNE/OxhbFaqbzdhBDlx+vfiXQHVg87njoJ
	 befxGoxKD406NxVoHf0DqnNlMZiv0PQ9x3v+eM1QuipdILTHDlNvvb3G5PHopQUf9v
	 V2Hm/rDdOBBqbq8T4pCkD62XN8lOisNn9I0SGThz8R7RiJ+ODjl+MUjD0eVvFsPgcR
	 8JBWyjuuLffXAU4mqSp+bwdRWmy0OO8LSO/mV/+03smtoxTfYYXOJ9cPX+SFs1RzAY
	 pbFkRYCU54WqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D360BCD343B;
	Thu,  7 May 2026 16:06:17 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/9] Fixes/improvements for the PCI M.2 power sequencing
 driver
Date: Thu, 07 May 2026 21:36:08 +0530
Message-Id: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHC4/GkC/3WNwQ6CMBBEf4Xs2SVlUyB68j8MhxZWqRELXUAN4
 d8tePYyyUtm3iwgHBwLnJIFAs9OnH9GoEMCdWueN0bXRAZSVChNhP0rCA/YEdoRjW2MKTN11Gw
 hTvrAV/fedZfqxzLZO9fj5tgarZPRh8/+N2db7496zlBhSapRlOvcFPrsRdJhMo/ad10aA6p1X
 b+eodg8wQAAAA==
X-Change-ID: 20260422-pwrseq-m2-bt-abdaa71094eb
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=DI8D86bD8AE3e33QAsmWkuZyiSBpCR+NtFhwtZE0MFc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp/Lh2l5qZXLrIeRH+CFId7hT2Ay1qhgWaR5qn5
 lX50UUrGe2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCafy4dgAKCRBVnxHm/pHO
 9YRkCACLd2DefFRxeOuA2LVlQF6kk8GAuQkBiUKQ5GCGiGNnm6p8Y7CaJaX9G+R0rUY7ertftpU
 n7xj4iPaax+MxIXtOsweskYcUqdoOapwOLylMi3bEhQ07roZV/45wLsPptFp4S5eZQKOe/nrpe/
 9s/Zb0jT2NCEFpk0QDba+JHLhkXHWXmJdRKALsLGwR3l6R4hOOWpZ1raPHvTF/h4X5lkRu0lkdG
 +iq3yzmbP72EUXgj5MymLkX4O8q6F9TX1YRYNmtyH5iJZ95JISwh8WaICJCiYHrrYBBcwK559S9
 QetE/nsuX87fG/YlBpsAKgwszANhjnsUF4I0CBDotIpAPs8S
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: 6C59A4EBF9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106478-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com]
X-Rspamd-Action: no action

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
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
      power: sequencing: Add an API to return the pwrseq device's 'dev' pointer
      Bluetooth: hci_qca: Set 'bt_en_available' based on W_DISABLE2# presence in M.2 connector

 drivers/bluetooth/hci_qca.c               |  28 +++-
 drivers/power/sequencing/core.c           |   9 ++
 drivers/power/sequencing/pwrseq-pcie-m2.c | 234 ++++++++++++++++++++++--------
 include/linux/pwrseq/consumer.h           |   7 +
 4 files changed, 217 insertions(+), 61 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-pwrseq-m2-bt-abdaa71094eb

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



