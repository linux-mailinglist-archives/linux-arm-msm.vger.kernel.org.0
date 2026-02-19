Return-Path: <linux-arm-msm+bounces-93332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIptAatflmkTegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 01:56:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5913B15B441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 01:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10D4D3019931
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 00:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB5122A7F9;
	Thu, 19 Feb 2026 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/w/Jay/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91521FF2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771462566; cv=none; b=TEmxTZsn4w/vasf7VhvS9zic72U7WRHkEUecM8FqwmoF4jqDLYV1iTsPHs9FiHd8mpAn81+ZoaOeXGzls8utH9Z92alQkFMGLgQv55r4lv2JfvHt4bs0WUpAgIaRvbZl6zVF9+O3blydLNvhh7k6L5qW3OsyRk5BPN5SdSsWz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771462566; c=relaxed/simple;
	bh=ArX//496bE2FskhpynLTmC6UDYXpDSzY0XjLm4x0EFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcNN50cyGSDXaxpR4razTvVKowvvw9+LxlFDoauud3x0JmcFF2sR2K9SGziEYsNryaBo8r/4CWJSzkw5GKxmR0/Tzql6efLUil8VA/NiY+aJ50cX5rSXMfjx4yWScb+wcMLBV4QVTbYSElgAEYMLI+5/XfUfgCMoJ0jVIx3LskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/w/Jay/; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1270be4d125so410121c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 16:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771462564; x=1772067364; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGgT8gl4BQs4As/G6azTBQb16A9Jfxh7/HDWdFmRLcI=;
        b=S/w/Jay/t0W3W9uB4C8DAp9kQUvZjsm+j+7g+b2tzxSfl4Gm+iytx1UiR/6rzNGc9D
         NsamUPXceAcpUx7DSefv/CxElhAGLPHB+Qk+5SKtbVbVk/zHYSCICn6JFfyvl0BxeaB9
         Uyn6HtQx5uu9nayyfThKkfycm/+XjNkP7BEMJxRqNIwc1YJh6iO93chmnn3igpRG81ft
         u6bLk8ZY2EsCxAefgOH+rE1rXt7uJOquFwgHUOQLgOuDnzOi5hNQrukGo6FJ37A9DYXE
         MVfgSQfM9OAetvM3PjBA5Nnojop1jxeExB+MNkZWK/xdwQbdxNz5E4XPYx1RYsifgcbq
         JzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771462564; x=1772067364;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgT8gl4BQs4As/G6azTBQb16A9Jfxh7/HDWdFmRLcI=;
        b=hlwDfbe0himSqGw9Jqe7sHHLYH4o6ceWq8C6r0EfycFxGO/ecot7BpNnp5G5JNS32H
         JFAQWJnC/IYwWyrfWpjjfylQGFtvSX83t2lv5PZ2KSVz56qrVvyXt2eL2uUNtj0iIrUI
         7chHjDSNdFn3nGsbb9iWL8jvCH4QyDTwnbXNnL1L+JTIkRAN2+LtparVRnqx1sQAFgI9
         t3smsop+w9aIGCU6Xwj9L/HEnClmke7QRcHA0KBKDhqaAzkGOFub08k0wr+9PAyrQD8+
         E4MQ9w4BToL3LFIFc7MAVVjNYVnTV/nMJe5PTmK3T/nonqvbNQWFI0qbJZD3/lPo+62l
         4dZA==
X-Forwarded-Encrypted: i=1; AJvYcCXS+w2x2+xAz7CajLCCs1wlMZvn4RrEB8757S1X/MO8T5HDLy7MXGcRkLEswHxIOg5eexeZiGuA5tXvaZcy@vger.kernel.org
X-Gm-Message-State: AOJu0YwxSc2GiSe3Eb3V+02i+wVjWc0XT6i+FpS8NUSG8jV0ReReyWlC
	7VdfCTF8NTb4NHXodXDQ0/Ct1wMA+8eTyGoLW8DBI+u/OuNLR3kaQSRy
X-Gm-Gg: AZuq6aKEkVDkYzV9yuoNH75tM2UWXOqKqvGY6W+nmjMHyR0w17Sd3DnQvS3hcfMcasn
	64zRxVDfGT5iMqoqI+NhVb+ouo2bGMtGMOi9I4DPb5N6mC5vchFoHV11EWCauDlWWZqVwJilPWB
	HFJyXayYzD/o1DTUQBlkD4SQDypOPZs52mGp95IwTIuqa0bIlAXD228+k6LNFdOfCkbYY3oDyrt
	PND+xRcTAEknzPg2p2iHwMNJxKtkBSbmmw+Vtpi3wPV/lfd+gz6FIrEjB4woIUqBxSlvu8jDvRY
	hy4deVWhnpu7jTe0oDsy4+0w840pJfHIOyQrK0u650ihv/GRPb/5OusBet5Mns63W9f9YSPXRst
	GoEfVC7lKQto18TXN1/Qy9HKew06ArlNa/UTaSXw4XwEDxiwr5JzdtDNhnZw3BL1bPudDI/5aBa
	KxU5o+jxmLBdzPmdEPoZycrn4H1XatK1L+R6JiWroMo+pGRTzGvrodIAPS6bM4XDNN
X-Received: by 2002:a05:7022:396:b0:11d:f440:b758 with SMTP id a92af1059eb24-12741bc0129mr7691550c88.25.1771462563993;
        Wed, 18 Feb 2026 16:56:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cbc900sm23969207c88.14.2026.02.18.16.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:56:03 -0800 (PST)
Date: Wed, 18 Feb 2026 16:56:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH net v2] net: phy: qcom: qca807x: normalize return value of
 gpio_get
Message-ID: <aZZeyr2ysqqk2GqA@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93332-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5913B15B441
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by qca807x_gpio_get() is
normalized to the [0, 1] range.

Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: add correct netdev tree prefix and "fixes" tag.

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

