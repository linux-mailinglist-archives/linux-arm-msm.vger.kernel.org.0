Return-Path: <linux-arm-msm+bounces-106681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Nj3OI7d/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:56:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F74F69F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B111F3038F49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DA93E0C67;
	Fri,  8 May 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xd2FaL8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB63DD536
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244809; cv=none; b=TfbUVPEO04PzQjH8UofhELsCaP32/7naYTwwlC3qu53k4Tb38rSWJyLHM9GEjuGuLS/1lA5Zt8bx4SMuGfxT2YEdNnn3bp/6elZQGtBu0mRhumbE6DYCLqPraA2qwVgHdyQwB0IpvYKCJ8TekGBDzGBJxS6P1oluO+eny2pXtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244809; c=relaxed/simple;
	bh=MNyVJI2hbWvpz28Yan5uNv0jnas35N/Bch/oPiRkTZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXiVnOnctASMaxW94mqxJVS2YSl53dSMLOAmcbe6bgAsLLuC5fGrEgXZt27hjCytd0nyOJdqDVkyfYIo580tfo508UrSJspdtRb5nZ9CZ5bIy4gaJP/5VnnT7yy6Z7/IlsurODNCQrBNsiqHUWpyBb8hOuyUVgeeIeRJg+qxLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xd2FaL8i; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bc47a96d3bbso267840566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244806; x=1778849606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Gh6I/+24agVwX8lBZJvSBSrfNENuBcVK4OqqTCY+cw=;
        b=xd2FaL8ipK09rHOvK+0TeGCUCQD7w/0h6NVtzNKLZnwKdsUFizVjZ5gbU6Hhbtf/p+
         0ohY7JK+D39p5/a3ood7fnvRAu3EdgbAkg+0CGPulMCrnlNghu7qkLhzj1Q0XPDbkg/Y
         cNGhCESThbAYoYealr2na+2EY/RolgjL45cQX/X/I1sSMy5AJMTJgN3dhBUaAF9p/Y0F
         Uf57WLYXFV3y4q0LiakP4SSpserK+89APuethWGESRnNxE+/h4yk6/fIAv+oyeh1xT1C
         QvgVfbIiUKwKLb4332XzywSP1vSkPPrBTpgHOJrvccgFgEDGY0KR3NlBGtKU5xrrolbX
         dx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244806; x=1778849606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Gh6I/+24agVwX8lBZJvSBSrfNENuBcVK4OqqTCY+cw=;
        b=A7WLQKpVD799xz4RiIgKuuEQ9B3n6JKAbskxE6aLwFTWE5Zahm4vAwG6gjE2G1rO2x
         A1Os2snYG4BfVwSq43D4uV4H8L4XpKarjpJ2AKAoPza+/Ve2ZKGbjo/Fqrl5rU4utVPR
         gdz3WSm7JvyZInQzPDCEqsEVGN2J48pEKxbPsTTI/GCBKRnvzglEhDek8rDNme0HHVIH
         VEfsUxYg5Szsz0uHH3/4Y45WrWcg8963YHsTOKcRl87mPYf4wthTefgF1wqcemxDyqOJ
         quQVjBNcZYMxAyMPu1rtDuxc1uGdVADiRTutKUmb4piDlF2QbG4wSKsF0zPgwkpytYuY
         jvrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P+n2VIBVSMi93tuhsxa/DWbvtxy1kb9N47fcOOgUg3rNCD4UkwOQQJ1JMyBlXypoozNaq8zl4YO8Dg5b6@vger.kernel.org
X-Gm-Message-State: AOJu0YwruOrfp0hLW346diTBmDjEH6TTjAtXakSZvQnp5VzOIrvFH7bZ
	GJJDx7ujpOlsWi+PJJMZzr4i3h/wRNfi4uY9zqhONCXu5Frbg5+2WvidwOPwVDFtfs4=
X-Gm-Gg: Acq92OGKTNlHHfUzhp1kz2KOk+OuB0Rjrgzl5Q8kRt3/B/XflwBci+lRYPsZYVDA/p7
	wsAhS6Ra+aWlt0Fo1cYxQdTt/71ZUAapwLUHe95BE09VCOSjxdImLAA0kAzR/pXtGtz/aES/MFw
	d2BVj31r77dxI7Mmg6Npk8dZ+Vd7zVixmC0mylOldJaOmj+Rb2+jKSd4KHFpot8SK/brw424zUW
	CixTT4GccddXqwF+VVZp9/cHeSTsYz+5FLy5ON2MkprVMQTnDxN7KNswmJuhYKowX3JNbe6jXcL
	92lwUcQgUhOWEh8zm2SJ9SGxcPW0qxSlG/vNzfQKIfmqB//ukp2/qBNQWII+k1lLCrjNzdYscZX
	M1jsItgitKUwtsRBkaNiW4PFaAN2LPMnDPJgUgbozt5tnA8XIYlFOxoWMLSo8wHF5VFLrc1u0HJ
	Lv6otGwRDwGm9JQ+V11B199Dlkq2ShqY0CwLCKOY9TjYOzpeIhUjfwkKcAQmnVG1kQcD2k0JAJS
	7ldeUkupg==
X-Received: by 2002:a17:907:7255:b0:bbf:74d7:1c4a with SMTP id a640c23a62f3a-bc56e21ac66mr648201166b.40.1778244805766;
        Fri, 08 May 2026 05:53:25 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:25 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:13 +0200
Subject: [PATCH RFC 1/4] regulator: add devm_fwnode family of functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-1-0bb32e8e6428@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=5378;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=MNyVJI2hbWvpz28Yan5uNv0jnas35N/Bch/oPiRkTZ8=;
 b=2ewq8NqF216z48g2VXRM684/943ePCqHB6/J7Y5sEVUk7QRpynBqlqD5IcEYTpjWLGO6gJta0
 mHeVy7YtsdrCiHUXDSUKp5NfBk6zrP+YUWkdFfrAfXfLYRaDb/XLnL7
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Queue-Id: 831F74F69F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106681-lists,linux-arm-msm=lfdr.de];
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

Add devm_fwnode_regulator_get and variants.

These function wrappers allow regulators to be accessed from the fwnode
struct without any casts.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/regulator/devres.c         | 66 ++++++++++++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h | 30 +++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 615deba5d22c8ce190c69081c94651d8df93d002..f525b1f48bcf18593798f6fa520ccdfc656f6b6c 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -11,6 +11,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 #include "internal.h"
 
@@ -803,4 +804,69 @@ struct regulator *devm_of_regulator_get_optional(struct device *dev, struct devi
 	return _devm_of_regulator_get(dev, node, id, OPTIONAL_GET);
 }
 EXPORT_SYMBOL_GPL(devm_of_regulator_get_optional);
+
+static struct regulator *_devm_fwnode_regulator_get(struct device *dev,
+						    struct fwnode_handle *fwnode,
+						    const char *id,
+						    enum regulator_get_type get_type)
+{
+	if (is_of_node(fwnode))
+		return _devm_of_regulator_get(dev, to_of_node(fwnode), id, get_type);
+
+	return ERR_PTR(-ENODEV);
+}
+
+/**
+ * devm_fwnode_regulator_get() - get resource managed regulator from firmware node
+ * @dev: device to supply
+ * @fwnode: firmware node to get regulator from
+ * @id: supply name or regulator ID.
+ *
+ * Managed of_regulator_get(). Regulators returned from this
+ * function are automatically regulator_put() on driver detach. See
+ * of_regulator_get() for more information.
+ */
+struct regulator *devm_fwnode_regulator_get(struct device *dev,
+					    struct fwnode_handle *fwnode,
+					    const char *id)
+{
+	return _devm_fwnode_regulator_get(dev, fwnode, id, NORMAL_GET);
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_regulator_get);
+
+/**
+ * devm_fwnode_regulator_get_exclusive() - get resource managed regulator from firmware node
+ * @dev: device to supply
+ * @fwnode: firmware node to get regulator from
+ * @id: supply name or regulator ID.
+ *
+ * Managed of_regulator_get_exclusive(). Regulators returned from this
+ * function are automatically regulator_put() on driver detach. See
+ * of_regulator_get_exclusive() for more information.
+ */
+struct regulator *devm_fwnode_regulator_get_exclusive(struct device *dev,
+						      struct fwnode_handle *fwnode,
+						      const char *id)
+{
+	return _devm_fwnode_regulator_get(dev, fwnode, id, EXCLUSIVE_GET);
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_regulator_get_exclusive);
+
+/**
+ * devm_fwnode_regulator_get_optional() - get resource managed regulator from firmware node
+ * @dev: device to supply
+ * @fwnode: firmware node to get regulator from
+ * @id: supply name or regulator ID.
+ *
+ * Managed of_regulator_get_optional(). Regulators returned from this
+ * function are automatically regulator_put() on driver detach. See
+ * of_regulator_get_optional() for more information.
+ */
+struct regulator *devm_fwnode_regulator_get_optional(struct device *dev,
+						     struct fwnode_handle *fwnode,
+						     const char *id)
+{
+	return _devm_fwnode_regulator_get(dev, fwnode, id, OPTIONAL_GET);
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_regulator_get_optional);
 #endif
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 56fe2693d9b2284d04ebae50165f9aa7b1b3fee4..7c3aedf7f4902c4e3e8e2f5ecf6e4323b77658f3 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -691,6 +691,15 @@ struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev
 							      const char *id);
 int __must_check of_regulator_bulk_get_all(struct device *dev, struct device_node *np,
 					   struct regulator_bulk_data **consumers);
+struct regulator *__must_check devm_fwnode_regulator_get(struct device *dev,
+							 struct fwnode_handle *fwnode,
+							 const char *id);
+struct regulator *__must_check devm_fwnode_regulator_get_exclusive(struct device *dev,
+								   struct fwnode_handle *fwnode,
+								   const char *id);
+struct regulator *__must_check devm_fwnode_regulator_get_optional(struct device *dev,
+								  struct fwnode_handle *fwnode,
+								  const char *id);
 #else
 static inline struct regulator *__must_check of_regulator_get_optional(struct device *dev,
 								       struct device_node *node,
@@ -712,6 +721,27 @@ static inline int of_regulator_bulk_get_all(struct device *dev, struct device_no
 	return 0;
 }
 
+static inline struct regulator *__must_check
+devm_fwnode_regulator_get(struct device *dev, struct fwnode_handle *fwnode,
+	const char *id)
+{
+	return NULL;
+}
+
+static inline struct regulator *__must_check
+devm_fwnode_regulator_get_exclusive(struct device *dev, struct fwnode_handle *fwnode,
+	const char *id)
+{
+	return NULL;
+}
+
+static inline struct regulator *__must_check
+devm_fwnode_regulator_get_optional(struct device *dev, struct fwnode_handle *fwnode,
+	const char *id)
+{
+	return NULL;
+}
+
 #endif
 
 static inline int regulator_set_voltage_triplet(struct regulator *regulator,

-- 
2.43.0


