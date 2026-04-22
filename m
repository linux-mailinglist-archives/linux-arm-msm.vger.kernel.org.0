Return-Path: <linux-arm-msm+bounces-104091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOd0IzKw6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89126445430
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6D8F300E689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016123CFF5F;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIR6rp2V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F13815F1;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857112; cv=none; b=exM5qG9/Rw4LFe6Vg1ADBMH5AIT4qIqf7fDVzNaxajVROz5I8BiRSsCHGxi5Y/sFj4TucaazH9OxB7aEcdLtgTHPKSGOV72J6Gqs0GPi8vl/OOVpCsZuv9bR2TClMvP7+w+IYGaOzd0e5lGSbZLuBORQS2E4PqK4aDKWbF+dekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857112; c=relaxed/simple;
	bh=lqk3QdLBMm60ixEGqFx4KyHoJO7Nz6868LggAMS8LtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pgjJFjKOnQNnX/mFNHyJ8Z/Cnbl4G/cPWfQ/I8lgO9MpAUn2PWCnDaVpyR8AHjX8B/eaPSRe6aUYUl2KYUnaqTLr+VOKOYhEOZTJsnswqVebG85aOovuQb2pn3yIwMSzk6/BelHOOcw37yhCpPz7ET73UnK5Kri5DhYAU7N8cj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIR6rp2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 658C6C19425;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857112;
	bh=lqk3QdLBMm60ixEGqFx4KyHoJO7Nz6868LggAMS8LtY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kIR6rp2Vu1BnKdcfqcJYA4zIQ94njZwWTA/DCn2B7lwVOSyO+tawSqkzlOVo6+rKw
	 d+4c7+Mj7z3ELj93WICzPQrtzxlQnv+vFVw3d6X/8r3HO5Ihueo/tIm5tHT9J7jwMD
	 YHYqC2s6tZ+AHuA3m4BfStRf6UagheUkYJVitk2ruGogw2ZL63+B1x90twLaZXoi0n
	 uycMrfXY/bIsr2bshI2B/G3kJ+PqR6MqOts0kRgk27/ay2d/Vk+cVcdbaMEIyT0bGQ
	 Alq2DS7xO7VzlA1TdagMYgpxTuG9UiQOhxJIp2qaU/mPN8uwoe3UtZ1kVB+cK6sBcQ
	 IAl8vVfmuqfHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B5BF9B606;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH 00/12] Fixes/improvements for the PCI M.2 power sequencing
 driver
Date: Wed, 22 Apr 2026 16:54:41 +0530
Message-Id: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqv6GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMj3YLyouLUQt1cI92kEt3EpJTERHNDA0uT1CQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAycvp3XAAAAA=
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=lqk3QdLBMm60ixEGqFx4KyHoJO7Nz6868LggAMS8LtY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6K/+74ctGya8p8gkXaPiUCDCvw26R/1sf31k+
 3IL7DZbwWyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiv/gAKCRBVnxHm/pHO
 9SONB/97M+ux5IjYybMtelgpS4I3KTrOMDXpTMpWH1ziA49OGXH8mUfyDlcDGatxmuRfF6dhz9m
 tr0qaHJZLNOJsSgjWrh4E5qFDkKvO0Ss0DDwQpQJ8LA883KMrjYaL3g1jU1Ifq5fbqp7CeC7wIG
 /cjfeBjOumzw/0bQ9QVRm3h/qBH6SVaymWRMuTCaSjROVI76j1e7hfuiqK1agIIe94TbEndP/6b
 cYtLXHRTkUcC6rNuR8Q8MvlosdrmXeEI+PH/Pc8/IWfMlIyFjWCTrb5PLnSXeqRIPRoIet2KwzR
 0dzB41l4ZPR2ByB8P4xYX01vga7PK58akyC/9i3rgBraM+hT
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
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
	TAGGED_FROM(0.00)[bounces-104091-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 89126445430
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
Manivannan Sadhasivam (12):
      power: sequencing: Introduce an API to check whether the pwrseq is fixed or controllable
      power: sequencing: pcie-m2: Add support for 'is_fixed()' callback to 'uart' target
      power: sequencing: qcom-wcn: Add support for 'is_fixed()' callback to 'bluetooth' target
      power: sequencing: pcie-m2: Fix inconsistent function prefixes
      power: sequencing: pcie-m2: Allow creating serdev for multiple PCI devices
      power: sequencing: pcie-m2: Improve PCI device ID check
      power: sequencing: pcie-m2: Create serdev for PCI devices present before probe
      power: sequencing: pcie-m2: Create BT node based on the pci_device_id[] table
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
      Bluetooth: hci_qca: Check whether the M.2 UART interface is fixed or not
      Bluetooth: hci_qca: Fix the broken BT_EN GPIO detection for Qcom WCN devices

 drivers/bluetooth/hci_qca.c                |  40 +++--
 drivers/power/sequencing/core.c            |  33 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c  | 242 ++++++++++++++++++++++-------
 drivers/power/sequencing/pwrseq-qcom-wcn.c |   9 ++
 include/linux/pwrseq/consumer.h            |   6 +
 include/linux/pwrseq/provider.h            |   2 +
 6 files changed, 262 insertions(+), 70 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-pwrseq-m2-bt-abdaa71094eb

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



