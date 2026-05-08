Return-Path: <linux-arm-msm+bounces-106704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMo0C7AA/mkTlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7F4F8A7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5028F300334F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 15:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21F73F20E2;
	Fri,  8 May 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQQf0al+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453DC169AD2
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253997; cv=none; b=B13HvHm99S8S2nFCf2PMnO+lnIGCPDwKvTRJvtFl87NUk2xfYkEmmE9RZqjRBYRuKKWKIgczYisQ94wn5tmD52Pik0gqaajIYqu1dtrLxgImprpv36Mq/ePaRW41iw50QlmS+hYLS5ZbovGATzmw8Oxa2F6OkhDGh1R7V+W5LUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253997; c=relaxed/simple;
	bh=8Qwf36rId+Ems/1eDwX4FkjrATBDA7Znl2SUcpy1ZKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klDrevk1V4YGGtYKXxznn2igEiDFRImuC+8NICY2ofzJ8abxdgGbGsT05eFsRvLjIplZOVny5Z0nhiI/XYd/E1M4FxkDuQl3QufQ+jOPJMViSlY6P7aZeQuLlFbIpa+F8gLn8C6TZzEScrxWxqIutoVHtQXLkQTqCncBQtJNrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQQf0al+; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ee990e8597so3709200eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253994; x=1778858794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=gQQf0al+Ql9V8ivsZYRc9GP4KYBcCsvgTIgyDeuSEae7IsHOKlyQ4IfUc5Euslx4eJ
         WBSYsD6FzKaQWBfYutn6tqQRKqkYox/Te07X2cODbclAcIEHpixlOvB+Zl/pQR9m0kxV
         cExVgIaxzU1cqb15oWo5pvV7q5VbiYXn0GwpDg/Du5fcd9wDrMZXwFhrotsoPgg8X4se
         jJ6IfMRATVuYBUkaq/tp5d/QNeP8ySzZ/ixmLSm+aTvHL43WP5fw1OkB82KuIAuhUDfZ
         LffHzPkvMZNnx/9WegllhOxvECbIRV4kHXmEsly78Xs3AdlOYnYN0kCW9SGV6eTktOGD
         8uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253994; x=1778858794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=lkkkFtqrEdESvGAnf65f5qDKCiCuah8cTtyQ0CFKEplRnxN1BU9zLCOGWKkgYwH3ha
         y8liwXoLgHZ711yM/sWf08AglBgALFIhfP/eESf5/B+20RCVHzQyVH+v1W++ZlHNMg7Q
         4Cc0si0hXgjTMlaIdZTtFIGDXSeMnKb+0TJpHot1jVX4Dhg+5Op3lUsUWAhxGWabxblT
         Yc6MN5KmgedBvNdo/uLqS8oallaMfq9DXqUbTLI8bPbi6G+pBxlSnffTkmpDafIN3jrK
         39g1gY7WfIUnFvLewMKWzFz9Gwt54psIB/v0/P4WUtaR/evxULSHzyYfRz9nXTJV5h/6
         BCRw==
X-Forwarded-Encrypted: i=1; AFNElJ/S5qlRnt2KKO6wmHyZHk1Wfc2bmv5TJ+FaGEwWHGz8jC4I9pfde/8Q6JoI/mFE6fymS3iISHH/GNHjszWG@vger.kernel.org
X-Gm-Message-State: AOJu0YxmGIz/dnugj/CLH/xZn6SgYz9ZqdtD7swKlOHxyjpQFJVWtUHz
	NAYFgXxiA6VaPTiY2WraUEcgvmZQSAgtn4MHlvdubp5W2li91AxGmnpH
X-Gm-Gg: Acq92OFkYK5osgKOY8c51l3oGsJIQKkE2uqCz4uSLK/mjp+YbwA9gIJV2sqQ9ux70lA
	Jd/9i6KcJPZOSuD1DXXPFY+td/13pSzcxPaCzU0YCb6l5dtN9kWEXhY2COtGVG9x4T2ILpNkSy5
	PjgZH/MwlybMSlWx2fUgtv63gwvZfT8n9bumHWkPAsr1p69MVRj/15xJSB0K9ZJ5EEsNtzs9O5x
	C6AZGFppeEG7hLgDLDtSstdhJ05lmAa9JwQ7KGDmv2Jd64/VRukAlwgjh2uPAYQcqy6786wDf04
	4qs0zQFRzNUawuCh6GaDbivT4QE8fKJfNFVI5zaNANlkMpJaX3JB6EBboEcj4jw6KZGkAfb4xaY
	qe4ZySs+wf7Qb5Ly8S/T75l+e4SAw7V7UmTMx2ixvBi2rN7LGivzN1dXkysbA+v19ZZLoQ2F89o
	5AkyxuaVEUnkx8sTRJwy3HXCmz0WRYuD6oU0SFbMaFdzYb+1k=
X-Received: by 2002:a05:7301:1014:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-2f95c2a01a1mr155628eec.13.1778253994365;
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Romain Perier <romain.perier@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Peter Rosin <peda@axentia.se>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Paul Barker <paul.barker@sancloud.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Fri,  8 May 2026 23:24:19 +0800
Message-ID: <20260508152435.21389-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DDD7F4F8A7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,sancloud.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-106704-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tkos.co.il,st.com,axentia.se,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lumissil.com:url]
X-Rspamd-Action: no action

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..c947f844c756 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,7 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +506,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0


