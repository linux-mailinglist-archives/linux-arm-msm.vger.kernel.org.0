Return-Path: <linux-arm-msm+bounces-93327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEQZJQcolmnxbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 21:58:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D259C159ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 21:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A23CD3007B15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 20:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA963491DB;
	Wed, 18 Feb 2026 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN1JXgg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD03491C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448242; cv=none; b=Hgq7eYNBWQ3o/vHsPLHcEtZfA+OGc/DyLZMtNwbWVKntPphEUBpQ2oI6u2TgqtHFXuE2wyCK2ojIEU1wSW2JmJy2zTnL+jDaqyDDW4SyAjmhmWCL5o//JQMfUsH7zz2sZ7iNYXTmwAdt5KcO3JL1LaVp3obafL1jzRNHQ/ZY6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448242; c=relaxed/simple;
	bh=NrImsyeBmcyB/xczM3IyezJ+XEgL14mHdJnKM9XhK+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAFx9gSgvdTbHwzDhyszxogxwBMNL8BSyuPhzVUtZEMgVEzoqBLd9U9QXafwaLC0Qn6Bng3t8VCcEAbV45DNzq7LCGdV+cZzp+2AcOfNcNRlZeGCpgRg4NvL7btM+MksXsYNXp0mILT1wG9upfHN2ivLfGvMPWIDn91yuHIUcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN1JXgg7; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270adc5121so284609c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448241; x=1772053041; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQmTwRzucgCJ+TONChC4KuMJonzwlGON5FYise/WlLY=;
        b=HN1JXgg7cv1m40/+0AkpjZ6QBQqxcWoIby2fmmQ+KbJhRf+cFjqj3Yk08hqVgGd+C7
         g6L8F8prXiRQlZQyrQVuMgd2/dqFL+LMWZ4GWdJujdd4Fk+K56MQIKRHtKYzB3sg5Ace
         9AY918Y2izW7qgKB7gzzCiwwvQyefElUxkivjQxBUHqk0tf8oO239prMYIXr2wnK/qRT
         n/nrHswM3AIUIatvAuwE9SaUJwP9/dpJ11Km+6Wwc951k6Qtm9NwwueYbMWS7QhWf7gm
         m4Xj9cfkJjCDTovqbUuNG0TViF9OBp8HXef2XWVNh6VVPToV9+zovOTivVfBrybWiG2d
         9zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448241; x=1772053041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQmTwRzucgCJ+TONChC4KuMJonzwlGON5FYise/WlLY=;
        b=vtBM2z5021Zd7eTZrCTmToemjr/osSCv5fz2vt41rP3eguQheUWbZeFkKuzl6caJ46
         QJcmMLCnPa5zN+6O+pQl4C2omhBLP9hREjyfuSkALpZKX6S1wRCLnmeEJsqTfA3IJwdX
         sQAeSl0UvRcLrFK2GdCKGAO/03wvNXEXvyeGxGb56fFu5ORc7HZjSLnNhU12vukl9Vir
         zR7tc8NPMYGzZm7MhwEMIJm3tlBSCOeO9u4j/54w0EafSqGYEsy+jk6CQosNpLlXaOVJ
         SdmwCFJypWuMaNONJ3wGIPKwnrcVa8NIlIVy4XrDenVpyxzQdXz9i338WfI9tsOqJfFC
         4Uag==
X-Forwarded-Encrypted: i=1; AJvYcCWZARvci7WJP4zwQfnvLPTcLS1fA0FjYpDenCb/OPYi/KAQdWiRQ263UoOY3Mkkj+e9g0zWB7/NYC6qK0Oz@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTtMUeadyVvIjeT2Wlf2R3DLES38pOeQtu1lBVndCq63KbeCp
	JL45qHejn2G/SsiPtAGasnn6ucPdvsykOsCnaRBivIQXJQ/zcu0uHyYK
X-Gm-Gg: AZuq6aLfsHtrBUACXjQUHTUNdm8IQUQkVfDbWNgeRDDWRmvuuRlw1gMC/buUuCHBtyo
	qeTx8+JRI/6L1eOWH5Pms/SqTUnEDJ8AAYHIojosHyriDFvgJ2gUe/Fs6v+rwlt+CBNQXw/x1QN
	fDPtKnwZJG3+GJzVdjpbu8UUnY/qDbkavHjgfw7CEQGl0xcZZtIOCaAZqmdf5uy6PWOCjifLDpR
	Q6tWcYw6R4Gs7oUYGTzlwz5nJaG79pRhZhTt2S2r9DY+VOJr9H5K4elXsH9nPnbjoZ6G2xJVXA4
	DigVDKAPRqU/3BBJ4lrvtVlBFLRuMEgwxuts45WZ35519RR0rIIcxWjYJfDN/IrdEpubP/UHzdm
	KSA+ubXk97nM+hmjWdyG4xGTiDEJvXDxes5YQ6zS80qjizqE7WWcvxJQiCBIp6BTXsj90x3Jwis
	eJBjEPKiJ4OVhIehVV/VwND3tcCGCk7kSyUK9lUEvVvQ1d3B45IfVZSmSeAhS2VH4t
X-Received: by 2002:a05:7022:6087:b0:119:e56b:9899 with SMTP id a92af1059eb24-127599a5719mr1369362c88.0.1771448240567;
        Wed, 18 Feb 2026 12:57:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba118sm24748533c88.12.2026.02.18.12.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:57:20 -0800 (PST)
Date: Wed, 18 Feb 2026 12:57:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] net: phy: qcom: qca807x: normalize return value of gpio_get
Message-ID: <aZYnWZqfzKwzzF4f@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D259C159ACF
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by qca807x_gpio_get() is
normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

[First copy went to Andrew privately by mistake]

 drivers/net/phy/qcom/qca807x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index d8f1ce5a7128..6004da5741af 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -375,7 +375,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);
 	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
 
-	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
+	return !!FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
 static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

