Return-Path: <linux-arm-msm+bounces-73587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4882B57D54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B220169CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDF9313271;
	Mon, 15 Sep 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Npr+EvYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41003128CB;
	Mon, 15 Sep 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943126; cv=none; b=XEj4QdjW4d2C9iYfTpZ5SDCvMzIMaGuz1YC8h76OQJbx5UgXNHbVZLi0kHQqjbbcZxQzjGxvIbsnt4COVh8iSB9QyUJtm7mLDi711WzxizKyBIsmbEmDNVXSgMtrQMJphAY/8VWd4nvZmbScgIK58g914vG2VKvZswDA55kKDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943126; c=relaxed/simple;
	bh=zrQicUNoo6UgynPyMyDCeR2T6ObaM+KXzOtK+UfCdqM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=UqwrsHQCTpG1uL1fhTrA4Jt8Pa70JKm4F+yHnm7ErY/3Lo41atB2CxSDD77P43owyr0qsJr+8JKt16Wl4speHL3tdPeQL0jG5z1xR1g3uk9RfF4WUc+zS8kAnvK1vrXjVtEI53X5CBhqJ1gDl4J6LxQx35T5ymibMzQuAoal35k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Npr+EvYu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5BAGv8bXy6yGoJ0dUhvbeeGHyvCJ5y2qDB9qmmx7p1E=; b=Npr+EvYuelWGLsdmeVazKkEnO+
	O3Uv7640Ocxrt3Cg2CtZt9EfHPf5gTHjyW4dFAqXG+OrH0eMYrGtDkxh5SprmJbtGYhnb75+Lh8N6
	CsmGfQNXeFofqYYAT7P0f2Zmkn4uynSCzosmpmNc5ZN/0eLOrQBog7YDN5R/+wLmGs1/GfxRnT7vY
	gJm7mjf99D1Y7xIV+ofHtlFZjnVMmd4kicY4E7+2g6DuHTmLieKQOo4SqK99MNrYKBkZKFVpZtRWG
	4jysYgsMguVoiaYPPcYv1+nqli+DCkNl7B1tWs0w7hl+QVhG9idUHWM81vEus2l8FSX2Gd399psYQ
	FPEf3KeA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56240 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uy9JJ-000000000Mq-1kmY;
	Mon, 15 Sep 2025 14:32:01 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uy9JI-00000005ji1-30CX;
	Mon, 15 Sep 2025 14:32:00 +0100
In-Reply-To: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
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
Message-Id: <E1uy9JI-00000005ji1-30CX@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 15 Sep 2025 14:32:00 +0100

Provide a function to retrieve the current sfp_module_caps structure
so that upstreams can get the entire module support in one go.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/sfp-bus.c | 6 ++++++
 include/linux/sfp.h       | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index b7275ecdf19b..f409943f1952 100644
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


