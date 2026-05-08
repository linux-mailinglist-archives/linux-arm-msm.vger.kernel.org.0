Return-Path: <linux-arm-msm+bounces-106684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPEeHP/d/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB04F6A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D333082D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9821A3E1CE0;
	Fri,  8 May 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GCp7h3xs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B83E0C52
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244812; cv=none; b=Uioyb8DdTquiOUxXg+1zdJiNVXrytFsO5JdRdYIiUqa4gApBjBSZhbJKg5BenH/1GLfWUrNyvRIy9LSAkFM6J3YswTmuLMhBTO51GXABdrH0dll9JoHgy9oc6mykonVOEwyvi+ZJciK2wO0iGgo9fRHglIHcGy+BySyjhnDkhGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244812; c=relaxed/simple;
	bh=5gO6npexgo7th4yWru6p4t8YuaeWr0gCCknKoQ5U+NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NgOSQTPpeDP96zkrV7P4PNUI+uabPit+TWw8vGqdcA16Np2v3hFaKi/4TchTNziKhsHUNFGuIxos7DnyHzBcL4wkDV33uAu7udvGzxl5fKIz6aUumwORw5ApjSinrJOqILGbEAiS/pSQ7tTjqI3YiHLD5k2lpyTcxohmUNZYOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GCp7h3xs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bc356898256so339593366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244809; x=1778849609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2w0ldg67Kx7W7htSiAB7dV1/ur2vkooDzTmdvNdijms=;
        b=GCp7h3xs3Abp3GlPrVOtpMD9a6ZmkRrHogQ9oLrE/VZy2wL4lA0Ypv4GiMTSBoeJ2O
         3VoMuvytHN3cRNxdeG5tMkD/EJwq4oWRgGlSF4+2avVCZAFTqCZ2IFi/HYBsCVUxhJiS
         /Y55EE9pnmQ0JkdyGa9Yrso/ea5heWMwLpSNyNr4nZWJUb8WNXpaSqhBRojmmpFCGOTl
         Vq6QbyfP6sJM1oL/p/jSgXpZ3RkcXz9aq1phwPc2Bo4HfibkjVgeG4EhnrNIvVwNQTlx
         u7irn7bhGTDh9C6V6rQdLwZevqjDZca7qiYz2+CisRo42T8I3hr+uOK1bWd8ACLdVwWp
         eTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244809; x=1778849609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2w0ldg67Kx7W7htSiAB7dV1/ur2vkooDzTmdvNdijms=;
        b=nVl4pnQ6NInLsyRdr97k9fNLoFUlzh9XLZxXoIcc7N9iuLcD5ogbn4jGD97tJ4ngzQ
         EDnupG8XortWJNd2hDmkkTC+BwK/Upd18dmolIdDDA18L6K6z9LsDR09gjea5A0SR44d
         kGpZqsZMsaMfraWU3XAolq9X7Bm8mMh88yDdM7KA0fFPBMWConMJgekqCUY6+rlmbSrE
         BGW0pUB/E8jZrkv/H4r9qfGml6Nha90GGytowI3bKGYbOA1Lx+WlJ3cvuoFsy1rozT8D
         291axnskGsUe9i7oSEjEggaMSk4RG8n7HY6017+0/0HBDYqZlJGr4ctzpyub9uwjWutH
         CPlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XqwDbo/GTivz7y3n855eLK9fWr0HPerIaOZlgJ0U+tIff6bjSHwWPaUX79xypQ9Nz6zEjSfcHJosx0qLl@vger.kernel.org
X-Gm-Message-State: AOJu0YwGgVL/BTdgMwxPtR1Pv5KpcyVQsBek8HXDUL2qew4k4xpwh6vb
	my60Rj9pHE2guqJuF54Af/PbhZc3Jhxhts/Y9xiBFGh3ZPbjSuguYW365Sp9xURPnj4=
X-Gm-Gg: AeBDievgWcqr72cNwJVselBXYtu5uUSRxX/oPWHeqcy5Mw4sYlkXUtpCKIlI64JIq7C
	uAeClKJX/ATMoeDR/r2DkiQjX49Lg0aMr1N/44CiN1sFvNVXCJiocL74WxMxwif4OSuy5iHVL6S
	bSM3CqEhu7/1yUIDAKy5ATj57V5Z/KAH89vqA8FEmEkifAmGuoIdtnHErJnqZs8mTF5vHV/qwrB
	NdEAUebMtwoGzCkl7klsXz3KCI2N9KBhoGD8/A/5ZbQA2UeurjgrttmYoliE7jVOKffmHOI+aGD
	18koFjP6aptJoY5P4RLgfE0JJE7nt/FU3m/Lj/h3sf3z48cClUBqBoDWIjaEsFq1IFpqJ5WDoYU
	wyGLhaH5iY3iH+3nZiiyK9X44B5Vq7VDCRDDaubcEnwZIHuMUsE744OnBI2nsVE4UQjyMbdAHFy
	FW3dpq8GUMLwCA4dYExnQohzx045GDX0q9r59I/T95ksVnH+8vgsbUAGAEGgirg7zhuzUKM1U+A
	2mMGq6KHXE2m3RuraqO
X-Received: by 2002:a17:907:7205:b0:ba8:e7b5:1106 with SMTP id a640c23a62f3a-bc56e01b348mr733763566b.43.1778244808667;
        Fri, 08 May 2026 05:53:28 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:28 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:15 +0200
Subject: [PATCH RFC 3/4] Input: gpio-keys - add regulator to gpio_keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=3314;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=5gO6npexgo7th4yWru6p4t8YuaeWr0gCCknKoQ5U+NA=;
 b=4QSIAQbxI0W8K8el+9bhadM8rW5gb7l5/joZ0qCZtpqAOcIRMsdoI8SFaBNyEdgGwaME96pOn
 YqdAA1xDYrlDhX6GdCPyTLXG+iSpUO9IMK6q4SMf9HIrColb7icPAwN
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Queue-Id: C8EB04F6A4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Action: no action

Allow gpio-keys to have vdd power suppy through regulators.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/keyboard/gpio_keys.c | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/gpio_keys.h          |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index e196174856796b391f14c31da9b2fee5ff742172..2199ce7455cfc763569e173d4d18da92507f38d3 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
+#include <linux/regulator/consumer.h>
 #include <dt-bindings/input/gpio-keys.h>
 
 struct gpio_button_data {
@@ -729,6 +730,7 @@ static int gpio_keys_open(struct input_dev *input)
 	struct gpio_keys_drvdata *ddata = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = ddata->pdata;
 	int error;
+	int i;
 
 	if (pdata->enable) {
 		error = pdata->enable(input->dev.parent);
@@ -736,19 +738,48 @@ static int gpio_keys_open(struct input_dev *input)
 			return error;
 	}
 
+	for (i = 0; i < pdata->nbuttons; i++) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		error = regulator_enable(button->regulator);
+		if (error)
+			goto reg_err;
+	}
+
 	/* Report current state of buttons that are connected to GPIOs */
 	gpio_keys_report_state(ddata);
 
 	return 0;
+
+reg_err:
+	for (--i; i >= 0; i--) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		regulator_disable(button->regulator);
+	}
+	return error;
 }
 
 static void gpio_keys_close(struct input_dev *input)
 {
 	struct gpio_keys_drvdata *ddata = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = ddata->pdata;
+	int i;
 
 	if (pdata->disable)
 		pdata->disable(input->dev.parent);
+
+	for (i = 0; i < pdata->nbuttons; i++) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		regulator_disable(button->regulator);
+	}
 }
 
 /*
@@ -829,6 +860,16 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 					 &button->debounce_interval))
 			button->debounce_interval = 5;
 
+		if (fwnode_property_present(child, "vdd-supply")) {
+			button->regulator = devm_fwnode_regulator_get_optional(dev, child, "vdd");
+			if (IS_ERR(button->regulator)) {
+				if (PTR_ERR(button->regulator) != -ENODEV)
+					return dev_err_ptr_probe(dev, PTR_ERR(button->regulator),
+								 "Failed to get regulator\n");
+				button->regulator = NULL;
+			}
+		}
+
 		button++;
 	}
 
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index 80fa930b04c6795eb7c6143a79655a6f918446eb..66e786ad7eba407dbea2545941f5b6e464a4f61c 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -3,6 +3,7 @@
 #define _GPIO_KEYS_H
 
 #include <linux/types.h>
+#include <linux/regulator/consumer.h>
 
 struct device;
 
@@ -36,6 +37,7 @@ struct gpio_keys_button {
 	int value;
 	unsigned int irq;
 	unsigned int wakeirq;
+	struct regulator *regulator;
 };
 
 /**

-- 
2.43.0


