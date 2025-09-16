Return-Path: <linux-arm-msm+bounces-73810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66551B5A42E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76BC5321688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C0E2F9D8B;
	Tue, 16 Sep 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wyz9cCZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870829B237;
	Tue, 16 Sep 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059218; cv=none; b=QxUcO7JQdOpxv24YfJt+q4SyR7xCE4uxStOnlA3trnuR91br/9Kvv+3Qa/QrvtFaAK+7RnMbL7uI3dlk31O/jnmxbUS2nKWfgWqFRZtKbes4zPUAQu7os8icOcALTn7Ho6SZCzRXM6S3Uq6kqL1etcyV54741Z4TBFv6LupD6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059218; c=relaxed/simple;
	bh=r4/OUarzufem9uXnRUAtp6Hh9tzbnzD1rzTEImdoLac=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=u3TU8/vSBcxTC9adacCESU9x3/4N9s9YanfYXTHC//8sy4EQ6iSgPA0E13fRhHIhSIacL1+XTlJKYxHTYG1OQt5YaDrpwGcTYqMLj+2PzzLwF7Zk2tMgswT5nmj6CSfmDsZQAkFk5eAruJbLk2VapeZ7kbEmo4wS0mnDWM2+olo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wyz9cCZn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i5iJgssHogjsfU5IHSZ6TFv4U0NOYJ5zxCLy0oQtZyc=; b=wyz9cCZn2aq7O/6qx04CuP70cO
	gYiPapJ42aSyAIdfW00FefWCviez1QhCkPSLLwUtU42Y+xrTSxA73SatppvzQheSOfmlpdxbsf8Nn
	G0bPhi2FqSNdXry1CN2Z9sOMoa3DMJVtfzO5WaRjQ92LQRO75thJKzFWEIUTR+QmEPMOGG+utklpY
	cgKJ0dMBMCxKknT6qq2sNn4jvAanagZg/PwV03hjRTzURhJ+7ctxcwGBHV3NhZ85T4xTXw9XfRGZA
	nJ7LfqgZN2qfsyX8a45MsyW6a5dNgChsQeMW94BeeJco7tSwciBqYmprGubQYeUhgBW0Kjkx2JNPV
	J+07WPhQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44854 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uydVk-000000006Pe-2b3u;
	Tue, 16 Sep 2025 22:46:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uydVj-000000061WQ-3q47;
	Tue, 16 Sep 2025 22:46:51 +0100
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	"Marek Beh__n" <kabel@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/7] net: sfp: provide sfp_get_module_caps()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uydVj-000000061WQ-3q47@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Sep 2025 22:46:51 +0100

Provide a function to retrieve the current sfp_module_caps structure
so that upstreams can get the entire module support in one go.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/sfp-bus.c | 6 ++++++
 include/linux/sfp.h       | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index b77190494b04..e8cf411396fa 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -33,6 +33,12 @@ struct sfp_bus {
 	struct sfp_module_caps caps;
 };
 
+const struct sfp_module_caps *sfp_get_module_caps(struct sfp_bus *bus)
+{
+	return &bus->caps;
+}
+EXPORT_SYMBOL_GPL(sfp_get_module_caps);
+
 /**
  * sfp_parse_port() - Parse the EEPROM base ID, setting the port type
  * @bus: a pointer to the &struct sfp_bus structure for the sfp module
diff --git a/include/linux/sfp.h b/include/linux/sfp.h
index 5fb59cf49882..9f29fcad52be 100644
--- a/include/linux/sfp.h
+++ b/include/linux/sfp.h
@@ -576,6 +576,7 @@ struct sfp_upstream_ops {
 };
 
 #if IS_ENABLED(CONFIG_SFP)
+const struct sfp_module_caps *sfp_get_module_caps(struct sfp_bus *bus);
 int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 		   unsigned long *support);
 bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *id);
@@ -600,6 +601,12 @@ int sfp_bus_add_upstream(struct sfp_bus *bus, void *upstream,
 void sfp_bus_del_upstream(struct sfp_bus *bus);
 const char *sfp_get_name(struct sfp_bus *bus);
 #else
+static inline const struct sfp_module_caps *
+sfp_get_module_caps(struct sfp_bus *bus)
+{
+	return NULL;
+}
+
 static inline int sfp_parse_port(struct sfp_bus *bus,
 				 const struct sfp_eeprom_id *id,
 				 unsigned long *support)
-- 
2.47.3


