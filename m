Return-Path: <linux-arm-msm+bounces-104100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCr7Ov+w6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:29:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25754455B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65CFB30803F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5413D332A;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fduyQp40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3413D0922;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857113; cv=none; b=PIsYXFltC/aG5rbqE/ucrfyEp+IAQ/6sVgSibeVd62MnpnJiwhS9XCPD9l4gMmSMwS06qdXZe0Ao9+Tga0gNprgbNa9+GG18MkjWJ1Odk03W/YueRLyofjO8hr3zcI9y0KIwopQ/Dac9buNXw+fbS21bDB91tw3MyGw5Q+XHuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857113; c=relaxed/simple;
	bh=Tg7SOw3s/lafvQJmQvIbW/95bIZ182IZGFX/NqvyLac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkEl+Awq4ZavrllSFQUfNjvMZdCuAOjkAkiE95TckRjNruWDnSG+6bbRaTDmFH8kPQHQhCslu3gS+bJP+XojPk36oeMiGNbbJWFOcAx36vDEKg07bJ2p3HZ+onul++VCck5d1mlnNwid42WPZczCvNqh54l5YgxoXSwEETF9Utw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fduyQp40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0044FC2BCB6;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857113;
	bh=Tg7SOw3s/lafvQJmQvIbW/95bIZ182IZGFX/NqvyLac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fduyQp40SyGAKvw2nJLGHmxrE6YdxQQH7HWscbrKrlYA8cDazXPfY6jynK8AC1ASp
	 4nPTKuE9rjJsKPes8cOT//XQK9wFB2GpQqcAz5FWr4805LAugsDVrF6c59tIb8l/f1
	 2lKjMBp3Yyzl7E9ZiEAA2jmvj6L2xA4vEeV4BvYeSsSS/bECqIYYpjAeOBG0L3P2p4
	 rpyTKNiCnWuV8ZyAgLsMX+IsmtWzN/Gwfpxetmt96jA4XdeLhU/6eqZo9JKZ8BONsw
	 GUHOrtWI1IshEa+NRTcwoN9/wkSDcWply5FWZBxahQ7s/JZYb8fXqwV6VGyvBiS51s
	 H1Fm0HnWWvuog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D8F55811;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:51 +0530
Subject: [PATCH 10/12] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-10-720d02545a64@oss.qualcomm.com>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=CYtLXv4mDbkKU8ZXR0dOu/yzt7lNw0H8EDwMcs3qDA4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAVg3I8YJy0MeD42TYKbsZ3Hmz05FP5VLWr2
 CRMx/3aU5GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9Qe/B/49VnD5xEguAAq4cD9f3UojRirIXC0j8AIO/Qub7Spl76Ah6J6kzmHNQXzGf5Gfp/FzEiw
 M4HnURHWVyJoGm+KkB8SkM1Dso5OvR+afSAbcVwRspogwtcWxoRpXAGt/naLBJw/90tGJMoRO4Q
 QwD8zIzOrsvRFvIsgb/ncE2Za9TctJPfdNOe6OYRs+vT3udzlwpfxp2PJ3Mo9i1CeSrMN6Ykk/y
 OfBWyToJr2ukIWA9UDeGru+1xk4KYxk7hMz/ybJJk1JbFbacQ5wcqijEBu6/oGC9f6wpeX1doAz
 5rBbtFdsgI22/wq1pqL6UBUty7qKAOMEJfZhgqyxv8cn2xeL
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104100-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B25754455B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c83fe72bc549..3e71a72ea7c7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2391,7 +2391,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2499,7 +2499,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2537,7 +2537,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2555,7 +2555,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.51.0



