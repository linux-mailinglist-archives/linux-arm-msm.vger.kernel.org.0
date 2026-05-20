Return-Path: <linux-arm-msm+bounces-108876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vksHEEQLDmo35wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A959852C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0513F3221BF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CE633F58F;
	Wed, 20 May 2026 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzL08Eln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27843272E56
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304179; cv=none; b=p5L0G3gjGS+SdhDcodpNUIsHLh4HjFEmvKnFW0JMkgc9yxsgSkq1t45rOdXo4L7HgwTaavmYrmrs3V9KpRHNQr1VqQEhr3gnfQMQnfL7W7hUBCblwvYBge228dXX8JWSrEWEplvvIDCJGmCtg38jcoNlvGA2TdJa450iIi1913M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304179; c=relaxed/simple;
	bh=WI5d2sIhzon5iSv9LESgJJisHe0kjNQeDryiAHg2gpI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nc4F3U88OY5mxT/d9de0KN0XvxgRaqN95SLSnP16ez7zSRkNu1V8kycbnQuXLvzYz5cLEmT6peLxdRV/mVk3KM/uxqAg3MZVrI9xrRXPVsWIMkxF4uOiNj0eFKgK1VrK/shY0T6hvwTgGv8vp5DY1gsEcwoeRFmfla16G0OG8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzL08Eln; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso4737315e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779304176; x=1779908976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FttOyObDZY6c8IeXvp79f4b56sRCEoRuLMX9sSkdMYA=;
        b=mzL08ElnMuBgBBS57pyjj//LiUbQ7I8dnYeZN12AmEajVPVMNkw/n4RALMRjwIY16P
         PFqeWMVgpK8jptbSIdiZbixFG9C5KeBHfWtiocx5fSXQ1mMSTz2kacWvQj76dldfZ/xL
         PhkgOqwXVbTtA5x2pJXV2jkm2L/FzTgJvN2VPxjoadRmMNjGe8AorO0J3tGAwrsNk1CG
         DZj0JI9cBQXj7APFRLkZRVvNRZFft9n9JC4UBKJUgWUUUJSvQmEW05H8orIF8Ui/oDMu
         Q5zOPcaAty+fCiQJ92scviYEdi4Sqw/tgMMsACzD02X9KvsjDFukNzQQpyA6J+ujCSot
         FfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304176; x=1779908976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FttOyObDZY6c8IeXvp79f4b56sRCEoRuLMX9sSkdMYA=;
        b=HD1f82cPcgfsoPxuVapQ494lM/Ra8Jf/2RTcCFJbN2bGtA4QL6JAh+Zen5tGf9OSYd
         GxDS6XRrbAipmep5XZD45+YnU2/DCUHGRg15f75/c6Yn1OR2nP7DfbZm6T2FR7nYkt0l
         dBXUYmJcXK5Vov+cQ2memKQceyHNWED5G+2B1D3RqpcJ+GcDKlzckaOTawOrFLeDKTFB
         UuQ1CqT/pFGfXxQ+4AB2MBDWTWbhbJ0JfyemgQ2IzlCLI5odcFheQGl45h+ARYT6ExbT
         MOxu7U6FDWvefoo5IAaEe45bKrK55hg5/5V9oDzQfI2XJvMU1+TDINs5QN1CO8x/5e62
         Ttbg==
X-Forwarded-Encrypted: i=1; AFNElJ8bLgqjxT3pVKSl8xen1VKGzZJhKm2Bv86riXeQIDyRHRH6w4mfUQhq+ctTN4BtAJYGo6yxpwjgAwfWqfcs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4TymV2wUfiONr75nMfcbD3FrcTKQUyhG6a5OGY9qrEXDfqi3r
	BBTEXZrmm7klJ1rAvxDiYpQ0NN4teGGY3lTcVlXp4xTLkd/79KyknzzP
X-Gm-Gg: Acq92OGihFQqtWSsI3M0wLuTQmCf/qv2M97PPK/XpPjHpzJ++1Q7EstOu4gkrt88Ans
	j7CLaW7UKNlB/wNBnEyerfWMYqxmDUikConvavEkjve7lk8CDVJRDjfQK0qABnO3j9feExFkbut
	IFNtERz/hvNycUZlPCYEMfrZXyVFvAFGQnATeaIw70cgfVTEwe8L5Oeixk2R2YUjvUuH84d3Uwg
	EJQxREmXJMk6IlgRU1e/o9CWEzTbAJWRqhJMs2czXmGMY/KeTiVD4A46sg8A/cNOHFmThz35uju
	tPvu3I3oHIEfZ8pNS9TE6dGP+QMUatmPa+ha1YXDwjxXpPmjSxpuFdQd4Vu9GO7C+60SQOdQ0Ww
	BkCWUza+jUlj0dD1PGf64+pTCUdHjMILRsoLV4KIaBDEt0NMA1/pB3MlGyqsgMdqCJx8/BWcjg8
	EwSEE1JDcsllUXTHtHgqRi36oDEN8KrfgEPGIXUAeQ0DT5
X-Received: by 2002:a05:600c:c177:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-48fe66423ecmr187206125e9.3.1779304176451;
        Wed, 20 May 2026 12:09:36 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm11344115e9.11.2026.05.20.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:09:36 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	hcazarim@yahoo.com,
	linux-iio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on driver unbind
Date: Thu, 21 May 2026 00:09:24 +0500
Message-Id: <20260520190924.12774-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108876-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,yahoo.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F28A959852C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iadc_probe() calls enable_irq_wake() after a successful
devm_request_irq(), but the driver has no remove callback or
matching disable_irq_wake(), so the wake reference count on the
IRQ is leaked on module unload or driver unbind.

Check the IRQ request error first, then register a devm action
that calls disable_irq_wake() so the wake reference is released
in the same scope as the enable. While here, drop the inverted
"if (!ret) ... else return ret" in favour of the standard
"if (ret) return ret;" pattern.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index b64a8a407..0ec3a0c4b 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
 	},
 };
 
+static void iadc_disable_irq_wake(void *data)
+{
+	disable_irq_wake((unsigned long)data);
+}
+
 static int iadc_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -538,9 +543,16 @@ static int iadc_probe(struct platform_device *pdev)
 	if (!iadc->poll_eoc) {
 		ret = devm_request_irq(dev, irq_eoc, iadc_isr, 0,
 					"spmi-iadc", iadc);
-		if (!ret)
-			enable_irq_wake(irq_eoc);
-		else
+		if (ret)
+			return ret;
+
+		ret = enable_irq_wake(irq_eoc);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, iadc_disable_irq_wake,
+					       (void *)(unsigned long)irq_eoc);
+		if (ret)
 			return ret;
 	} else {
 		ret = devm_device_init_wakeup(iadc->dev);
-- 
2.43.0


