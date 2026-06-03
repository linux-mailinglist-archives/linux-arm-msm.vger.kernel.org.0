Return-Path: <linux-arm-msm+bounces-111044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cU/hOhKGIGqz4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 21:52:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8763AFDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 21:52:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=r83+czbH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BBF7304FF54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 19:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF32139C636;
	Wed,  3 Jun 2026 19:51:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA139D3EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 19:51:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516309; cv=none; b=LjG9ZBZ7Gx6v02YcYI15jCHSIFWWIVu4gCNWPcffuDg6U1z8N4lqpIwzAShcd1msSQWseOZv086yJ5tiLX+3HnVwrHbULE4zDbnm/SQ29bBpTbg54654B6oJ3uGUiMEZLGSZ9gigul6b4gxxR+bcUIIIYP/07oZkWfb4aN4fxaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516309; c=relaxed/simple;
	bh=5W58dWElK4RYZ2metX2RlynazzBJ7iHoC8xRzPeYPR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dd3ei48oLyzhcfbTYqSYuxolVi/TRd742Mpj2tZXIsjOUg2IVyG6AHeIkPdpw6s5YEGmNU6W2ojksInUYAIdodhcmmA51C8MtNFVCJn8aZ/m4stHx6EQpzQxeej/tQX07NMrF9l/Eh7mnQIxYh0TBN98JSg85wineHINx/Hk2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r83+czbH; arc=none smtp.client-ip=209.85.222.174
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-915671abde5so329983385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780516307; x=1781121107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A82BTWIRj1ifSpCdTDnYpFe45FXXSmxFaqAlvQSXlrU=;
        b=r83+czbHTT7HsbBwTz3g3IyAaM0WYQxrp6J9II1TqhJ2NUQmOio6qGR2r5xxyUpez2
         lxAwc9i7STzbYJBVfavAnrfRh/IcFRMXj/RzUkT4Hpuwd0VuNgQvatfaC+63OqYsmbQw
         3Mf+GZ106lzv3GoerLQIguRwstZv3paHpYWG8/5nU8UZ6llTR02wp81HQqYbAzwiTygi
         V9BmqFGTODnyAXegGWjx0SXmcoeV0MnOxRQ5dEQMd2GmnPUA/mwL/wZhs7DdKDqmZDYL
         3YvgWy8+WiVmddNFMsGzcGIFWqMC5x4ZkzU56ASU21D6RqnNwKK3t6IwuiKWUl7KVJuo
         ph4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516307; x=1781121107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A82BTWIRj1ifSpCdTDnYpFe45FXXSmxFaqAlvQSXlrU=;
        b=h5uybLtHCef3wdX0tDTaqzyIJHor74TbA/ZHHMftkdLcrxcCP/GuwjA1hPsa60lgM3
         ZxnDn7RG70a7MmuYhZk3oNa7vrPWvJcYQIGatofSZMdW3BZzMKlxf+z4CavtLD775jdS
         1+t48D1UhQhh49hnaiz6/OoXrNto7FgqSsLU7GcR70KSSsAKdfCNv1prW73Li5G9H79E
         w3mYeHPl+SG6KrouPvTD/pLt700o9JglhY6/83KPVy8nylMTtzC1xBPjQzvHmbZto/Xe
         wpp3e9h9dIh+Znfyb5/MuerJdL09WIzJz5zaX8bnusDqHp6BdoJy23QCVP2VJskc/qrr
         nCng==
X-Forwarded-Encrypted: i=1; AFNElJ/vI+tKW0W3T6HR9RZXlr62Pu3hbLjF6MlTV6jtO2W2ss+pJJL7lE8xjOKgnFOw30422M8X/cAgrSpWkB6O@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTGoE677dhvGMERfQuLGwDsWbMsxtYUYq4rC2OjizsIO9OgNr
	LmlaVxgcAT+gxaIAsWWROIii5ME7mAx1YFqMEmMxL6fURYtS6SM2B3YC
X-Gm-Gg: Acq92OExS66sPUpDUrV2PnG3LYlw1QOM/zLYOsfAW2eHphy0ycqPom3KbSRGy7hYUQS
	nohfBZj/xwt1bUJLTtsz/s2HncBHRiXZ4Albb1LP4vGA7Aun4gJe2CeiyHcr144+xOiYRo1Sulq
	7K74OeYSKmpGhfIxkRhmz17rkbCRjW0h1HOZsYmlBj+xd25NDab10pV+nlYk6ypik72aPfnW2Xg
	eu1LYK/SzRemO3pYDE55esECDdQlC62D0RrpACR6h3JqyH/oYL27DTy7yTx77nuTmKPTffjo2k3
	/76ZxzmTp3OrLrl8QOr1xT4iz8EIDCq2cg0LO38otfd0ZUiABvQspG0mP10JE99bPjSAcFCwhoW
	KQPNc8C6SSDuGivfznSjf7XFRHHGUJTF4nn16izOUPDYv4ZhKidX8nblOiU8JMwvD+DH9GXheZU
	pP3fJ8jaXVGr1nr6c/t4lFsSyKbHwPBf75HDZLCiwgHcPlY1rAsa0=
X-Received: by 2002:a05:620a:17aa:b0:915:98e9:2c1 with SMTP id af79cd13be357-91598e90562mr334917385a.32.1780516307468;
        Wed, 03 Jun 2026 12:51:47 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2359ecsm337901685a.14.2026.06.03.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 12:51:46 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	=?UTF-8?q?Adrian=20Barna=C5=9B?= <abarnas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] bus: mhi: ep: Fix device refcount leak on create failure
Date: Wed,  3 Jun 2026 15:51:42 -0400
Message-ID: <20260603195142.2189386-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,google.com,baylibre.com,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111044-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kees@kernel.org,m:akhil.vinod@oss.qualcomm.com,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:abarnas@google.com,m:u.kleine-koenig@baylibre.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dbgh9129@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC8763AFDB

mhi_ep_create_device() takes one device reference for the UL channel and
another for the DL channel after allocating the transfer device. These
references are normally released by mhi_ep_destroy_device() before the
device itself is removed.

If dev_set_name() or device_add() fails, the error path currently drops
only one reference. The remaining channel references keep the device
from being released and leave the channels associated with a device that
was never registered.

Route both failures through a common unwind path that drops the DL
channel reference, the UL channel reference, and the initial reference
from device_initialize().

Fixes: 297c77a0f273 ("bus: mhi: ep: Add support for creating and destroying MHI EP devices")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/bus/mhi/ep/main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 0277e1ab1198..34d3662eb091 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1338,15 +1338,19 @@ static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
 	ret = dev_set_name(&mhi_dev->dev, "%s_%s",
 		     dev_name(&mhi_cntrl->mhi_dev->dev),
 		     mhi_dev->name);
-	if (ret) {
-		put_device(&mhi_dev->dev);
-		return ret;
-	}
+	if (ret)
+		goto err_put_channels;
 
 	ret = device_add(&mhi_dev->dev);
 	if (ret)
-		put_device(&mhi_dev->dev);
+		goto err_put_channels;
+
+	return 0;
 
+err_put_channels:
+	put_device(&mhi_dev->dev); /* DL channel reference */
+	put_device(&mhi_dev->dev); /* UL channel reference */
+	put_device(&mhi_dev->dev); /* device_initialize() reference */
 	return ret;
 }
 
-- 
2.43.0


