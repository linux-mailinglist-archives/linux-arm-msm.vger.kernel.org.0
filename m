Return-Path: <linux-arm-msm+bounces-96308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK3YBCv/rmkxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:11:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA823D6B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BDF8313ADD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF13B8948;
	Mon,  9 Mar 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVuu04LI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670E3B4E8F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075893; cv=none; b=sDWAIvqc/ucGpzsjIeNMT3COT/lQWY7Ak90y6EMlKh5bxBfyFnxQj3Gy/8CsnK6MEhF88MGQMomTgeFjAura+JbgPG81fCA7XRs6rS7suSGJ+BWDcuiRokxaqWGgX0ds8vXezDsJ22JOqA2N4YqkBrvGoPxn9cD0MpSam1qNruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075893; c=relaxed/simple;
	bh=/dIZrM5IUttYsSyyQTMorm0yElUCp9TuGSDmE5kDcdU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nu73oqvtDIwCOpdR0IOjfNHSrChlZ4f7i0ygCwXX/4MeXU4DeF4Gs5VEkv4KOgM7NpqXraPz8F1cFGXS7zyW6h/PbjLve4W717fxLkny+Oyi8pXPcY7MgkhWz3pnnU7mRaji3JTCmYhJ0dPlUroYeTGAK3wx0dSqLfWozhbceAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVuu04LI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so9526335e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075888; x=1773680688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EjqtMmTP6qLcmK14ISsOFqL48TISXYv0ejZVuQlmDiE=;
        b=KVuu04LIzBcrXS8Qv2YGmaAZKHlNy/Pw/EBzYhuFrf43rd0oesqY0zbpHtY6OERqqG
         HWr8R15kFzUjuaYfq+mhKk4ULaisDyx/xn/GyC7f+Fc8vhWJOK/brMzRJ9z+0bVYaKsb
         LchZaUJHepnJZVTKnD9lxawN3EKEQHQ36tizAvHkx5sfYX3b8sKnjW8MqH92Wk4TuEiq
         Fk7UoHw0TW9NChdRNnVEs5/X2Q/P2dnD4gso3iiFJt6QWghaPWU/SYvjxU7ywKCwyWr0
         ge6CutE7K1zS4kyiIYOaNnBs4Fbqi+5/S+zMNSiYjEkE5DSDcfTgBDHMyzwryt49mcME
         KMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075888; x=1773680688;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjqtMmTP6qLcmK14ISsOFqL48TISXYv0ejZVuQlmDiE=;
        b=jintfcCWijb0NwMwW576BU/N0TrB6Leam3y6KbFczJar3C+F1qi/wMiQVkvokS35ok
         ELf7B0UnEGkEm3h+lTzTRiLMo2ttftrTXCNpGjkmwv0X1+XCDMij4R6C4DsLIo78R5tq
         MSa1JoJ9GbbyNk1Agkl3AeHawxpZLfjkgWxjoLmehyDYU/2vbij1O4NU6QnLSIfoT8QU
         vWKOVMHyFCOKF6vnS6TAz2qTfACI1I6k3AIjxL7xPOJFm2xrVDtSkhyU5/aKV2AsWpW9
         SJAJSvzq8QPJQstbsApYPGIAQSEpfNE1Faz0ZtFnmLNe/q04g3zV6BrVB3lCE7vw+Wo1
         KP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWao6bTVyGwV2MLdlTpLX3577csi+mnQIOFg0hiPHbycHBac2xoGyQUBo1V1iTEeBXGpmMWpdiOGtCS/90H@vger.kernel.org
X-Gm-Message-State: AOJu0YyRhpc46El8S7gT/jqrVc4pNvhh/ZuuMY3QKQugI0j9O9c0kK/F
	MWoMT1SaZUjKAS6k0FR7zRRZ2RmveiU0km2q26yifCgXV5IKoSRmq5mn
X-Gm-Gg: ATEYQzyVPFBTiwXffbl8bqLpt/bSA2nVwZwvkg4Mx8W73FxSOuf34pUbER4eqMLnLIp
	kfAQE5JPPcmX14durdHvN+Ra/Xo3hDEov071k26TkUKnj9vTjoKgSuz1lmtuR8n0jMQA6B1Euwt
	2qAvYEZDQjbAOJLYiltFNHH3SM0ESk80j+Rj1GSEpsWqSa8U4loJtVFDiLwCRp4XPBSIEYjD8q7
	P2zgrsjgV+5WuVMwP0/YkoGEfFKbixXZZrwjhyLxBohgsDMTuzB5dZiiEVMV4HDPCXOtbUurQGU
	x/09gk3xgVR2BWuv8rbt8naYw4WVQxF0HfH+yIjGh3IKut26umqxi9F3VwuSpkHd429NaIJtuae
	ONJjUWT0+3Wr1RjqhNZH555xOiAsa2aGElf/FxAow4gASB2iy9s4gvH38eX31mWgKpWAHel813E
	3H+kwR/D1WYrpb8/kdaa7/y3Q8tPY9ptiTDp7pnhN9FkPI+2+Crrt+aKScrOF4AOArITx54KFZ6
	+WQeuf0+xn5ChzfmxCQFJcBDNm2vqzmLIdrrAlRUC0Xz1cdWr7vLAjiZZyWaq4=
X-Received: by 2002:a05:600c:34d0:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-48526923c5cmr193755105e9.11.1773075887324;
        Mon, 09 Mar 2026 10:04:47 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a9e549sm4543125e9.12.2026.03.09.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:04:46 -0700 (PDT)
Message-ID: <b15b378a-fda2-44b9-9d63-bf82919b71b2@gmail.com>
Date: Mon, 9 Mar 2026 18:04:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 4/5] net: phy: move registering mdio_bus_class and
 mdio_bus_type to libphy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
Content-Language: en-US
In-Reply-To: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 86CA823D6B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkallweit1@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The MDIO consumer side shouldn't register class and bus_type.
Therefore move this to libphy.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus.c   | 23 -----------------------
 drivers/net/phy/phy_device.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index c9a495390d2..9fb47332602 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -905,28 +905,5 @@ const struct bus_type mdio_bus_type = {
 };
 EXPORT_SYMBOL(mdio_bus_type);
 
-static int __init mdio_bus_init(void)
-{
-	int ret;
-
-	ret = class_register(&mdio_bus_class);
-	if (!ret) {
-		ret = bus_register(&mdio_bus_type);
-		if (ret)
-			class_unregister(&mdio_bus_class);
-	}
-
-	return ret;
-}
-
-static void __exit mdio_bus_exit(void)
-{
-	class_unregister(&mdio_bus_class);
-	bus_unregister(&mdio_bus_type);
-}
-
-subsys_initcall(mdio_bus_init);
-module_exit(mdio_bus_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MDIO bus/device layer");
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d1cbcfc3d2a..0edff47478c 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3913,6 +3913,14 @@ static int __init phy_init(void)
 {
 	int rc;
 
+	rc = class_register(&mdio_bus_class);
+	if (rc)
+		return rc;
+
+	rc = bus_register(&mdio_bus_type);
+	if (rc)
+		goto err_class;
+
 	rtnl_lock();
 	ethtool_set_ethtool_phy_ops(&phy_ethtool_phy_ops);
 	phylib_register_stubs();
@@ -3941,6 +3949,9 @@ static int __init phy_init(void)
 	phylib_unregister_stubs();
 	ethtool_set_ethtool_phy_ops(NULL);
 	rtnl_unlock();
+	bus_unregister(&mdio_bus_type);
+err_class:
+	class_unregister(&mdio_bus_class);
 
 	return rc;
 }
@@ -3953,6 +3964,8 @@ static void __exit phy_exit(void)
 	phylib_unregister_stubs();
 	ethtool_set_ethtool_phy_ops(NULL);
 	rtnl_unlock();
+	bus_unregister(&mdio_bus_type);
+	class_unregister(&mdio_bus_class);
 }
 
 subsys_initcall(phy_init);
-- 
2.53.0



