Return-Path: <linux-arm-msm+bounces-108428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEmCLD8nDGrvXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:02:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999D57ACB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8F4C30C4003
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BAD3F44E3;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEV28+Jw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E63F1656;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=XxdjO6/GMABj2BiAeBT0YT7I0C0i6J4lBm6lKZOyKMUSt/vrMCqLtWyuc/a2K9s1Wqyym3EWbZUQ/3piRRCVGH8ad9XL3NpBkZOPt8qERZWaOSURVzSIyoLUAImoqbg15ieooQvo47MKiCuP1fuVVrVNzUtjB4CdELlxxVR056c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=qgyE4BavcdAMbmH3vIkn/RD22Ci57+1MFvlk9VlBUXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NO92faaPIeQe1Uk5ISKxMdGBCVRLWpZhvA64HY05YD7hwPKanEGSrwOIWl2CnTcyMM2sJUcr9Gb9CQkjqO8QGoQdb6MdsFwC2K6GfA07EhAPiBeKACfgeaP7JEs2X5YfZDyV3Rc1Nmpy/XTYlxD802uDyM5DBncfoCZl7f666cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEV28+Jw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A471C4AF0B;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180964;
	bh=qgyE4BavcdAMbmH3vIkn/RD22Ci57+1MFvlk9VlBUXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jEV28+JwqqkO/sc1TDm2v8S6VcZUP3oZ8G4F15Q0F2h+HSbru0YG5S5y3bShTqXSF
	 JAQU8F16GVdFblKY0aDHF53J0Mf7WjYkqvNORldSD8EwosVeuHwmNVXi/79Pu4mFdx
	 wPziWEL2XnYnjvwozPhcGj8TB8qGn7bSAf5Vhiski3LSwNl9TumtDeChmNa0Za0QlQ
	 KJB5bgGLc+HBQQVv8PnIKcoAs2wd5GJZrbBxv8kJ+EnAPZq8FtReZycIzByqLpr3Bo
	 P+BkXrfseJADeCYhfqfqL796Y8zaJ7OzDk+YR//pk3y8+ZljYD+R4+/137bHfTx4jE
	 ct1bdiBUq/8MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33311CD4F5B;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:26:03 +0530
Subject: [PATCH v3 8/9] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-8-b39dc2ae3966@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=1JRO5dSGOPrnel/y/+GxWrpu7wlYHN8HrLcjMdVlLBw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWgZT1oo7m2+M3nNcF0fXvZRDRGOAP0AxKQb
 2GMks2jX7uJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwloAAKCRBVnxHm/pHO
 9Zt1CACjhzfGGAunlIJwGOW0wmipI/1SxXqQIqU2kw26YlfrNwstH/CIqBTrAAO0sVEH9UsMmA5
 7vhj3bZp+NmtKXDzveiTL7H2hOkguMEHY/6RJImjO9/vb+fYbBIlhis6fO7S4F+F/WZWQdnDN4h
 +0k625nbq/y6zlFiD5+GjKlUbPqlUUymoKcGRv+iwSsgzh35y7zJ33fe06a+aAuGD2qxDzmP27Q
 Ng5O6lM/9dQZkP1BwczE+8nsSMevYmwoqJdLrY2aa+dYr2PnP9hMTxTSnBGXtz2z0SbIIsVrLrW
 Lj1V/IYy52KaNIOCuz8jO7lJljmsOb31UmnLtgkY/O3r6OPk
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108428-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7999D57ACB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
2.48.1



