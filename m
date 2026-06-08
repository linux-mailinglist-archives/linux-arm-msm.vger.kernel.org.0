Return-Path: <linux-arm-msm+bounces-111800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JJsJEsucJmokZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:43:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44A655433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:43:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=dXhxYimS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111800-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111800-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A698C33D912D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343943CFF65;
	Mon,  8 Jun 2026 10:10:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDE23C062F;
	Mon,  8 Jun 2026 10:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913447; cv=none; b=C8fJ0Cl5IOLFhUjqvJ2RIuphDgwgto+qr8X8P2dyCbaj8IgIbtGVNmiufPE4aI/hokPicVgLsP0yTh8sk4WeJ6CLiPHm/pdfGPJFi4gFCTkWePGEXajoG7yIKV+d3ynxUqjyebMDfN9uC7KCJlttR2aaLpWLH2t82CofBs+1ZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913447; c=relaxed/simple;
	bh=6tW3zuKCOaqZDLAwvoD1qXk6xoEe4lRrNVw8RwLJQ94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kofTfC2PSmg+G4bnR6bIyNys54z38mikmcBaVKHHYH/5KUVNtiuz0yP93Zqfmt9QKs19GgP832DYMnAKOPxrHOeuBbTHkEX+0686l9IYsIXZyBKTMt2TzaxgeQkWSsBhM1Ud0+j6Gu0vuEFZoOIGDzp1aoVVPFxDeDmUPRd0XEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dXhxYimS; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780913444;
	bh=6tW3zuKCOaqZDLAwvoD1qXk6xoEe4lRrNVw8RwLJQ94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dXhxYimSo90DpKste0Gh5t55ONIjgp5CLiQ5RYN5cvDdNJ3cDn5wOEpYB29tEWOk2
	 F2rt3OUT9tebY2T8akcOqFVT8ngcG+HviLIkSpaSX5bIomWNLv+wUF79C1IeoFmh5X
	 zHVoeZ6ktRrOc1pdusWG/xTwPtKRMXAql8sDCbtVD9uKt1l3pFu9o+LDvI5KVoU5HX
	 1oKTHox+16ur7Y8RvCxrTTefxfr7x0q+/pNXJIhMSMeslTbzgBNiEbD8S/5A3J+vTb
	 Qbg3QPHPZqx1TMaTI4JjqQlMddG0ELNdI5MGmPzKzG9Kdgl1AqXrf+/BIfPRNvxDhX
	 Oioa/R8KPPU3Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 117C017E02F1;
	Mon,  8 Jun 2026 12:10:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	srini@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	sre@kernel.org,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_wcheng@quicinc.com,
	melody.olvera@oss.qualcomm.com,
	quic_nsekar@quicinc.com,
	ivo.ivanov.ivanov1@gmail.com,
	abelvesa@kernel.org,
	luca.weiss@fairphone.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	krishna.kurapati@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v9 01/10] spmi: Remove redundant dev_name() print in spmi_device_add()
Date: Mon,  8 Jun 2026 12:09:40 +0200
Message-ID: <20260608100949.36309-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608100949.36309-1-angelogioacchino.delregno@collabora.com>
References: <20260608100949.36309-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:sboyd@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:andriy.shevchenko@intel.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,intel.com];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,collabora.com:mid,collabora.com:dkim,collabora.com:from_mime,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C44A655433

Function spmi_device_add() uses dev_{dbg,err}() for respectively
debug and error prints, and passes the same device pointer as both
the dev_{dbg,err}() parameters and to a dev_name() that is part of
the actual message.
This means that the device name gets printed twice!

Remove the redundant dev_name() from the messages.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 57b7c0cb4240..152787ae82ca 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -68,12 +68,11 @@ int spmi_device_add(struct spmi_device *sdev)
 
 	err = device_add(&sdev->dev);
 	if (err < 0) {
-		dev_err(&sdev->dev, "Can't add %s, status %d\n",
-			dev_name(&sdev->dev), err);
+		dev_err(&sdev->dev, "Can't add device, status %d\n", err);
 		goto err_device_add;
 	}
 
-	dev_dbg(&sdev->dev, "device %s registered\n", dev_name(&sdev->dev));
+	dev_dbg(&sdev->dev, "device registered\n");
 
 err_device_add:
 	return err;
-- 
2.54.0


