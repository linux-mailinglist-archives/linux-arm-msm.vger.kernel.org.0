Return-Path: <linux-arm-msm+bounces-110245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z7yMHCJjGWoBwAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:57:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3DD600590
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25DDF3013BAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4A93C4565;
	Fri, 29 May 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvpigIhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF83546FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048616; cv=none; b=uUwFhJ6ACuLN5RO5iQFmD3JESyj/TYpwW6xGF9Hmlwvi6Op1R3xu6F5AW1P2f6a22baMnP9Aa8V2DD9BT2+Vjifstx3V7DL8BvRSTb3TixU4ElZ6wf9xcrivKl07128WT/m4nl2mJCkfzM9f9hfmVb4cwP+m0WO3gSewIqkKz90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048616; c=relaxed/simple;
	bh=lV4KFFGp0ypFwMw75cgGF7N44SHe2ZGna2tzsRK8m/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KW+yuK2e7UyQgEjy1urim3Loax7yH0zdPNRTfh/MnBzKo5TV0jWagcIgyqTTCwVnu2LydKKWgUDe5f0Y/NpmaFDj62EhSG5SDGoEEjlVVl1bp75FcH/TAR6Poq0ewBPjtJgCLYFKvIFyRn8RLjcecIppgnFo4WrULjekntcSvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvpigIhO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a41a9a97d3so1078104e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780048613; x=1780653413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLbV5NS/+AUn3jPB1rVufRXT2KFY5tOEq+biHp14VAU=;
        b=CvpigIhOFnv0NnKDQBUvFcL41zpR6zaC68nVP6n0ybWVVxsXgnwEFntUjy9yHsCmTX
         1WGz4dkworxwCT43fmLwiuEYvxtXM/mjZAHgYI20IzJ18NjobkWOOiXTvXZZwVsnrfj4
         JNqsdqSdipSjOMcHPD09uTnHcbJTgg08AmLC/I66B0NlaqNW0H4hsktXIx/H1R7Vc+Od
         CGs3V3NRFNxg0y4fo3lX6v53/PUnN7kBEKaTry53/vqlEK7kz0242EdcmFahzXjqHRKF
         BlQ3THSYmBVNeHW164gsHGsQaYSyTPd+UKY0z/8CfZv48xnPSYF4xJL3zmsX/E8+X49l
         jhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048613; x=1780653413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLbV5NS/+AUn3jPB1rVufRXT2KFY5tOEq+biHp14VAU=;
        b=KjHerSftQJkCa/MQJfIcyiu8x6WwWKhwj+QZAN5hnA+rhQNV2z+dT9jvEjxILS1Oii
         vFE7Dfi/iMZT/KifdK7eeL1OIXuruuxGqXARQGZ/BGe0rj1/AjEWeeacuxrwuUzCN87p
         tILFr9gQCJBXjlq+uOnRQYcHIKNGftxUMhvEroDm4oICBKxyUZ4hCbW7f6lOOybtiOA7
         KUJAGKGYzfrXp4FTIGrPt/o2WikYRDU+KQ0/WHq7P2FUa98MEDFUc4zquGQkQ26ofl9c
         BbvZwabxMha8j9cao+F1t9CC+DsQ5rN2sRjWF2i4r4rJibgFwG1rI4RA0V+/dq56N/Kh
         fINw==
X-Forwarded-Encrypted: i=1; AFNElJ9dI8UcpHfGDNzLExheyOfg3cjs9S7J2FH1eZcvNFES7qZZ6zYyReyoyJaKJUPFrQ00A9XwhlZaP85rkjZK@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGyJB3Qd+jd1VkdaTegW0iN7hLjEBbBdH7NnX/KrZRDD/y1gz
	tz10pGJLW4HCoI3kOuHJ1oR6oL80dwso9cYAgd9FSop3yBC7WvvegAwZ
X-Gm-Gg: Acq92OEcu/R6iJj57rReCuMoEQittjZBjfzIaeJtN1PjAqd8Bgmjb9d+lJSKVU44/ab
	2bzYQj97jDe77q1fyQdcwQn31pVeoVBmuvxd9Qrh8vskrCnBJ2BnKe9hotOkX/eWzRm0cSbZz3y
	UjmkiC+EBd0uRWvJttdeU+ve9ZaRt6uj4YGVpHe9VGDWnHXf5PthLvmkqQ46cnE0VV+hli0sfvF
	YHyevgcF6UbnMrBGJAsn7843oYAQ2RY/ls0rF1ChqCSDHgE72RpzTzrEzg8cdSVVoUyJl5tTMNv
	tUWscsI5+Fc7qecfDVLSLdRhmiigajAN0LZ5l2tnhYb7Kq3pjXKf5EE0A3p7ivXImcd03JK9J5a
	6JQNt2gViZJ7msrpc98bPHU+hF0XXlEoO7WnPj4EQkXUkda15K9OSitpH4g66ODAUi7CK6nr15D
	jnySXBZt08zVer7lCoJ80lTClUd4eo6yLtxBuPpX7yx9xE5GFr+W2sSonKAMvxyjG4MQ==
X-Received: by 2002:a05:6512:3988:b0:5a8:7396:63e3 with SMTP id 2adb3069b0e04-5aa59523751mr278652e87.5.1780048612472;
        Fri, 29 May 2026 02:56:52 -0700 (PDT)
Received: from localhost.localdomain ([94.158.61.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07214asm178613e87.21.2026.05.29.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:56:52 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	hcazarim@yahoo.com,
	linux-iio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on driver unbind
Date: Fri, 29 May 2026 14:56:48 +0500
Message-Id: <20260529095649.2452-1-sozdayvek@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-110245-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,yahoo.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4E3DD600590
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

Fixes: ce0694841ea6 ("iio: iadc: Qualcomm SPMI PMIC current ADC driver")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v3:
- Add Fixes tag (Jonathan)

v2: https://lore.kernel.org/all/20260523134613.4930-1-sozdayvek@gmail.com/
v1: https://lore.kernel.org/all/20260520190924.12774-1-sozdayvek@gmail.com/

 drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index b64a8a407168..88f6be2108e7 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
 	},
 };
 
+static void iadc_disable_irq_wake(void *data)
+{
+	disable_irq_wake((long)data);
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
+					       (void *)(long)irq_eoc);
+		if (ret)
 			return ret;
 	} else {
 		ret = devm_device_init_wakeup(iadc->dev);
-- 
2.43.0


