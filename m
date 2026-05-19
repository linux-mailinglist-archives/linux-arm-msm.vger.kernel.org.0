Return-Path: <linux-arm-msm+bounces-108429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCo7HqonDGq/XgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC557ADB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8885F30C402A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B2A3F44F0;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzFdfMH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787373F1665;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=RAtzELAt0ZwJzF9zszUU0sOcQ9Y+h66YL2wzWcMSZcgNC7PvlxOBOQhEnm72jMoTOSweB7SI7qlEa8rTI32+CHF9dZ5ajVZvHHQJzWlwOkj3IFGqOzxbaJSI3myJThQytBZUFtfNPcpRGj9qXnmyOmrEqeCRAnnptVnjolHhZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=/yYq1WSrNccr99sqYODgp2VjRUNml4DbJ9vOoFrdW+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbtZCN+TQu2HNiBrllqbuEnrsKqxI2uDEpeeBrHPQeR5fxLDoFvfL5qWBgFVtyQXoAE8ZpdjjyOrsKjfzeJViVO4LfJpNCUhGyT1re/sUdJMIjP15aCggy1dmKaAINvftvIHfEPSDy8BR7DTSjwKVuAH5WpZLOyrsiSbdauj2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzFdfMH2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 566ABC2BCC9;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180964;
	bh=/yYq1WSrNccr99sqYODgp2VjRUNml4DbJ9vOoFrdW+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AzFdfMH2my7e7F6Z6stkWkRGTx4YjkCiLawzCIP+9mSyStNn9ngGSaT33BDNVtDRU
	 skBAFCj2GJlMSDg2/ZzkokzsYr68gSIZGKATRNJNx4Gz4/tRMc29rXQVIfvR0OexgS
	 C8tGRodJK0pzKyJTO+QHCy18jTXOtsdHSewqD79YD47iQ0mYdNaIS83XJgI0rBd/KQ
	 dHeJt3NMzqBR9KZ+5DHRGQKBcUQVbzsXvgs0EZaJkgcUbZNRAnmRFn5BWBYnph/Dv+
	 4jJyhkjF3nuoRg6xykJXO8cD37ZFbwdkW28Zv0YalGUjLfOgIREH6VORay4OF87Om/
	 yTAIjC5U3AkNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A139CD4F57;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:26:04 +0530
Subject: [PATCH v3 9/9] Bluetooth: hci_qca: Set 'bt_en_available' based on
 W_DISABLE2# presence in M.2 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-9-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhYeDGRs7g3L5EI4vL/aBNiOeNbObMwLbx4vbZzrq4Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWgT26G56u8CFC6bzeX+drLEj2zvQzXmY9jU
 Ldhw5Am9Y6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwloAAKCRBVnxHm/pHO
 9XLYB/4gTkNUgoM4H4MF6p4LmyPBauiswNdCgjlccfcY7i4nsCjefKTFkCwyGS2kjZUzRiWRzlk
 MRoPpLy+UF+2gHLZImAf0I/eKE37gB8dUYMeDme7citmtk9fDw4R9ZX1n3Zkr59o8it+O9m59oY
 FSSF/sm2JojrXmwYB7063rwZ+Sfz7AvBz9sszDk8oLqKZRYrdRtKa8fjXz1SlalZ2k+ATxAn1xR
 qE8oFx1w6OFHFjtX1fCIEqbs3MB30RErWMXG+icMfTFSdoJep4mmPgguahcQdrThM1AT1eZJp21
 yL05JLFNZ+JT2XpeHboyj91u/DTNbcczWJOF7lxVz+HRBjrT
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
	TAGGED_FROM(0.00)[bounces-108429-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 2BBC557ADB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Check if the M.2 connector supports the W_DISABLE2# property or not by
querying the pwrseq provider's DT node. If not available, then set
'bt_en_available' flag to 'false'. This flag is used to set the
HCI_QUIRK_NON_PERSISTENT_SETUP HCI quirk, which informs the HCI layer
whether the shutdown() callback for the device can be triggered or not.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3e71a72ea7c7..b5439b9956cf 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2449,10 +2449,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		 * the M.2 Key E connector.
 		 */
 		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			struct device *dev;
+
 			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
 								   "uart");
 			if (IS_ERR(qcadev->bt_power->pwrseq))
 				return PTR_ERR(qcadev->bt_power->pwrseq);
+
+			dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
+			if (!device_property_present(dev, "w-disable2-gpios"))
+				bt_en_available = false;
+
 			break;
 		}
 

-- 
2.48.1



