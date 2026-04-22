Return-Path: <linux-arm-msm+bounces-104101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKo2J0Ww6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674144545D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36B0A301860D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87373D332E;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLu72SdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392DC3D16F2;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857113; cv=none; b=LZqpbhY9V455PjgOn2tohThIMkXcXTMTNC9K6fXEwuLAHXUGJgaUTR+YdLTvlgjNz7/BTtrEvmEjKbAUsx3/Ma8hjvc4DIThZtjXDvV4lIP+v3CR4q/wJoyzBf8ifu55U9GP/VSlSKtYaudN6gv1d6SSTt37aIeWVwVzkWlo9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857113; c=relaxed/simple;
	bh=aC3N0vFLQqJ9pWeBGkZU7n1kGC1cK0vsr+ydfhVVUxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzftSp6E2BKtHJVc2ZCP/Z9WrprLPZwaBNqJ46UjY/BsGn4ikxCAYl8guwOBxV7XUgOSsVRO94SougoJJEuEr2cauzuYNFlRdhdL7Z+WdoFRCYEItsNOnsIpzhEcSlz7S7Y3YLyGsr+f402lWKQTG5ez4Efve/UHBqz20n1s+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLu72SdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DAE3C2BCB9;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857113;
	bh=aC3N0vFLQqJ9pWeBGkZU7n1kGC1cK0vsr+ydfhVVUxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oLu72SdGs8LDg14oaxCuiOnuBXWounJvSv9QHX1RPk/M6w1qw8LPx4kZQPzl0Glds
	 62TnNJod6g9OpUjzLGzK5EX44bOQTdvjY+pggFyVQR37/R3pB5LPbuYEfGHSaX2vBF
	 NCvj/ffWTdUcq4nu+dPbvQBq+F/bIvZ0ScwxO7ScK84CPSnWgq1uNZ7HHJKrKteWfk
	 B6Y4DLTJXa2+u9lvDgb9rm+vQr5gMbq/GwI/HIeHuiS0KNL7XDYx3r47KPhR3rCWR1
	 JYWdO60zI+ixcCFE7d7sC/sH9YwgmLQu1rAoGGwhH+kk8cQpnAn5aZm5QVyIhUh5jY
	 lvyEO91fwsRrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15442F5A8DE;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:53 +0530
Subject: [PATCH 12/12] Bluetooth: hci_qca: Fix the broken BT_EN GPIO
 detection for Qcom WCN devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-12-720d02545a64@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=MQK4uW+3KV6qGFqWC5yEYOtbmFTmhw+bW5cuFTU5wq0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAWuB2qxpCLf/GFBYjifLzZ8B9XHNP/TnaUg
 6BT6IqwDcqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFgAKCRBVnxHm/pHO
 9UrGCACcW+dlfQav+XDBsT8HgQvBy6YlJjwgniDIlcAYbGTDuMmfs1PqEWivUb4lfHSSOMkUUAp
 mB+c9oOr7b08WeHiuO6gEtLJx1hITwXtZuJsrWjr5/dMeWwH1uIhIrbQc0XobrppCNb1YtkqPy2
 d34tGCxvjcH+Bzhz1IaNm4kW/FVogCv4LDi3K6zN3yHVVTghJpX8K6ZbuGtl/WcxHoouM4+nRty
 /jzTiLzt2Ax8VKjr19NAR/tStQGbufxp3PK/g6FmNE75k/teM3lF+ujGx52i5s7Cjdd+8CtthCJ
 ffU2AI06ZtQBFJVIFeYP684R9qS+CZYFDcNr1H5dPzJwE7Kk
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104101-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8674144545D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Commit 'db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT
driver")' tried to check the presence of the BT_EN GPIO in Qcom WCN devices
to indicate the HCI layer whether this BT device can be power controlled or
not.

But it was broken for two reasons:

1. Assumes that when devm_pwrseq_get() API returns an error, BT_EN is not
controllable. This is no way true as the API can fail for various reasons
and also the pwrseq-qcom-wcn driver treats the BT_EN GPIO as optional. So
even if the GPIO is not present, it will not fail the probe and this API
will not fail.

2. By skipping the error return, probe deferral is completely broken as the
API may return -EPROBE_DEFER to indicate the caller that the pwrseq driver
is not yet probed. Skipping the return value means, this driver is not
going to depend on pwrseq driver probing again and it just assumes that
the pwrseq is not available.

So to fix these issues, fail the probe if devm_pwrseq_get() returns an
error and if it succeeds, use the newly introduced pwrseq_is_fixed() API to
check whether the power sequencer is fixed or not (i.e., whether the
Bluetooth interface on the Qcom WCN device is controllable using BT_EN GPIO
or not) and set the 'bt_en_available' flag accordingly.

Cc: <stable+noautosel@kernel.org> # Depends on pwrseq change
Fixes: db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 27e52b08ec47..dd1d93cbb3d8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2470,16 +2470,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
 								   "bluetooth");
 
-			/*
-			 * Some modules have BT_EN enabled via a hardware pull-up,
-			 * meaning it is not defined in the DTS and is not controlled
-			 * through the power sequence. In such cases, fall through
-			 * to follow the legacy flow.
-			 */
 			if (IS_ERR(qcadev->bt_power->pwrseq))
-				qcadev->bt_power->pwrseq = NULL;
-			else
-				break;
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+
+			if (pwrseq_is_fixed(qcadev->bt_power->pwrseq))
+				bt_en_available = false;
+
+			break;
 		}
 
 		qcadev->bt_power->dev = &serdev->dev;

-- 
2.51.0



