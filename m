Return-Path: <linux-arm-msm+bounces-104102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGk/ND2w6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAB44543E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFE1F302E99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E734E3D3D03;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1Cz3LBh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F883D093E;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857113; cv=none; b=h1Pj7VvVHB55fsWM0SKnL8rfwsxZ3p2ODbEm2UCee91amQd1wmImVx22eQk2gCad9K8vEbaNJfrCX1xFiC/uUUGISYHaVOkfmFjcKgN9Tx2DynBdS3YV4ZK2479igy2TR/D8kVlwbI3hLiKoM3qrbznmqgQ86v8MAl4BUirVjyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857113; c=relaxed/simple;
	bh=Z2XhQFgSczXs6etj6Kn9gFI9cgZPNFDDhuehnrLVz74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf1Nb8I5ZYuzX1GRy4qTpTxsmG48mC7NjzRGlJGn4M49Waz1U4NNtGmqKflZV5KrnIiTY6PIj7sWQ7eGJa/YNwmEuqDZ/iH/1k4pJomZUJIZUZFuRoxAlurvXYAS9bemjnBnXVKDOE4/cB2WWsGbcbsPbnG1hbl4RYfsd/DT6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1Cz3LBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E3D1C2BCB8;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857113;
	bh=Z2XhQFgSczXs6etj6Kn9gFI9cgZPNFDDhuehnrLVz74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b1Cz3LBhxbeq2LUjcli9VxWIWXdR3eYAI7Zbv5ir8grKEv5nkKP7YSSyszJ9fA6hq
	 yqmQx1XSYR2hwjKYir0Gumb6uacJpAEW2yDyYPoyC/z7zahK10jsxaGsFsuldw46SM
	 o+5hb9eTb12sbFj1ZxNaUjsSRIVPtC72a/Z9mJDfvMDI4qbIvR/Y7cDt0h4Az0pjQ/
	 ZllZNu94n+q+CSR1G/AkAlgwWWq5cwvOTNGioC/nweV4a72qGBTyJ6v9ID2BoZqg9F
	 BSNpVuIlvV2VDK/5+iPnRAvP6KEqP0tCVdY19CdHk6W7VFJvgL6NnDx1REVdQ+geXi
	 YiIVrst69W8Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06985F8FA9E;
	Wed, 22 Apr 2026 11:25:13 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:52 +0530
Subject: [PATCH 11/12] Bluetooth: hci_qca: Check whether the M.2 UART
 interface is fixed or not
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-11-720d02545a64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=QIQ7zI+FcCO4Ozijr68y6L0R3ZFIXMS+JR88yCNclek=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAVR3W3V/KaHFdujOJwfJZ0I+8jLydfeBZ8c
 C328qYFsrOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9YQwB/0SQX+/Rbzc9tYYkKZ8hAXIlBudrTL7cV4f3GeBe+ZtK6NTWCunNb7eXa9yuHvHCd9rl3k
 q3rztVESPA7EUkULnNf3vf69nKap5M8nXd5LoUFcL6F/3b4WhDkUoAPCC4dpT1fYfLR4kqp4k/F
 adD+fVrocmi0ny4WJxDSF31GfJjsi+Hkp23SqSfIOvgcU/d3sTZVro8VRjvt64KXqfbgWf5rZtg
 qhYP9GXbF/4T6a83od1As5/ZPGYlb1DJPYysyepKTx91EWhl78i48qE4wM2oLiMv3ohsqVyqKUy
 B73fONwa5nr+RdRHt8DVLfnQtWt6ukk5yzMGy8jpFxfpcwvG
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104102-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 82EAB44543E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

In the M.2 connector, the UART interface is controlled through the
W_DISABLE2# signal. But the BT driver cannot know directly whether this
signal is available or not.

Hence, use the new pwrseq API 'pwrseq_is_fixed()' to check whether the UART
interface on the M.2 connector is fixed or controllable and set the
'bt_en_available' flag accordingly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3e71a72ea7c7..27e52b08ec47 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2453,6 +2453,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 								   "uart");
 			if (IS_ERR(qcadev->bt_power->pwrseq))
 				return PTR_ERR(qcadev->bt_power->pwrseq);
+
+			if (pwrseq_is_fixed(qcadev->bt_power->pwrseq))
+				bt_en_available = false;
+
 			break;
 		}
 

-- 
2.51.0



