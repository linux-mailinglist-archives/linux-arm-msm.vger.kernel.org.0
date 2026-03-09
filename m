Return-Path: <linux-arm-msm+bounces-96310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKglHAIAr2kLLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:14:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E123D7C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 715DE3037F0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F8A3B52F5;
	Mon,  9 Mar 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtduvdpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCA3D34B4
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075971; cv=none; b=dQqU1eH71rXBxuv0k/GWc7Q3EzhasYB9qvMNJY9kk1nKgYNJlZjL1h6hv4d5XI7Ck9ohBcguFpN2kwtVyvYaPpZru6+bZxc+012vdJogRwYZ8ZrhVt7bLZh7s6M01FQ5Q0P0OUVaGWhTChqweprV1gMwJncNZNDsBcf3vWDclME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075971; c=relaxed/simple;
	bh=pGoltY4kSCaXo0vDd4mfu5q0ojRiK1efKjHBKySFkEY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cC4bDn6HREMy0oILEAo/uKigMJTVCt8tYjgTYvVh6L4t57vZfU5rzXF2HXop7zthvLA2w1MngcKd4tU0W4G/llea+MG0AGChwQgV9IoKb9zZWM8rQ97eseDoLkfw/AgM5bo6V9uUWcF+STt0VrFIB57CDo6+QOyCFjstVItGtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtduvdpA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so18335895e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075962; x=1773680762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYvw9MarMz0Jz71VkIlHQa53Xkq+DgdVXXRsb7BPpNk=;
        b=MtduvdpAexjPMUVuqXRtAf1iFkkWK2g2s0pHvOZg0k318FL9NZpluDI2BN8WcpSJX4
         DNyBDrIRB/sOtgPBNrjkztKVTgS7mVDTjdZt9mD9LR3uD2gXRzYhM891ItZ+4k1IdzkA
         dyye0+s5lZDe3P+OnYXMIKxCeBbo7ps3rFsiRx3tbixRgtWUn0NsCzkk832bwZLn4YPd
         1vFLQEIn/Cv2ZhBHbr+NOVm8j9G0eKnJQpq1wAp4LghOlmOysGgqarMDG15ARZiJN6JB
         oVlgdSbELKb9cAa/nTFjeakw76N/t473wEuWNxGHXHH5vioJL9aeAFZdk8uHeYQN1SCP
         pBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075962; x=1773680762;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYvw9MarMz0Jz71VkIlHQa53Xkq+DgdVXXRsb7BPpNk=;
        b=TMYY2KUY6kwOG+3vrWfj5+JmRjPot39k/IYrWilcwISA7FpKhsZx8Izdkry1AwXvl3
         Z8W1VAv+Lp+L4Ia+1XEz9KdsvzrOZZexuVK45wGff36Sz9avY4zV2b9NyITblOpnKNOs
         6ZmsKn5b1g4gHqJEpZigPGwiND2eHRTGEw8HDLl0+1vh9qRLoO+2Z2y4idKMAZaiMFyd
         AXihIsGqp3cOGILDDYvfdfdjkw4EaNYecl+tDD8uBl31PG0bICo8l+BJT+znpW9Q3NS/
         ADtZL0Z0Vd8RmEMYbHfepTWqExfLMSOyNNIVqICO0TFiYkb4QxTfxaRu3icSm2e4I7K/
         z6sA==
X-Forwarded-Encrypted: i=1; AJvYcCWHT4A1HbFt60YOLFCqCkg9aWZz40SNFmxYghYvYCWGVF2K431QaNsrCul6/HjPk6C59qnCXPfJQAZLCakC@vger.kernel.org
X-Gm-Message-State: AOJu0YydYYZA8yZwGoOfxaHtL1WdtEzCmZftkQ2/idD4vPAKSBjJScvh
	zhRaJAOMIHFgmEeNgnja2ckW5qcpE2qnxEEqXPPYqFJio0ekEeDGEuje
X-Gm-Gg: ATEYQzw5F965WYRfDf7saIvqqoG9SO+ePYUqhb6UNDkC61Gl+EN+cDWLag05ao/nj8W
	724FFrfShgleOgqb9MjEw83XBjvYq2qdsNg2+tS8FnuIZGpDjUH4GW4d1EcYgwW1iEe81N5YFgg
	Z4dRIrWejAYGo3JhTuSZ3nO2euCqw+8iIuRbX3W3+FgdN+dK4ZHT82Hx1ebOBrxs8jZLlaZfGkm
	ZDzSm5Nnp62SR7qabN4F7c3aTpgCIs3VpzoZqI3m5fPl+zfqiCBmyeyNVHGF/W7TotAM6B2ZCDc
	+aUwbAMhyDmy4a/ZSOSori3QAjCsAUpL4jn1Y9pruW9T+dEwAb44JZTNgSBnS1m1yTKHlghG8Ck
	bUBWtGnVGyazNzTfd6WeAcAs+WBBZNOud3/D/NShVD4IpY25foQLqejWCs8AxAuf34BcSLvLDeG
	FTkpvfOFZC+JzL1c9liTP+i+si1k+I+mLDEqlIweVWSoygM64m0kZvvzmGKy8b6RPWJimsfel04
	JlqjYEM4C5zpdJ55QhUvGELvaPqStYvW7Q6cJ9NjzrQS+ulDO0NP/N/PacPuW8=
X-Received: by 2002:a05:600c:a413:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-4852fe93699mr101900845e9.30.1773075962006;
        Mon, 09 Mar 2026 10:06:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbd87sm110337545e9.16.2026.03.09.10.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:06:01 -0700 (PDT)
Message-ID: <47b85676-b349-4aa0-a5ef-cd37769a4c69@gmail.com>
Date: Mon, 9 Mar 2026 18:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 5/5] net: phy: move remaining provider code to
 mdio_bus_provider.c
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
X-Rspamd-Queue-Id: 094E123D7C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96310-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This moves definition of mdio_bus class and bus_type to the provider
side, what allows to make them private to libphy.
As a prerequisite MDIO statistics handling is moved to the
provider side as well.

Note: This patch causes a checkpatch error "Macros with complex values
      should be enclosed in parentheses" for
      MDIO_BUS_STATS_ADDR_ATTR_GROUP. I consider this a false positive
      here, in addition the patch just moves existing code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- explain false positive checkpatch error
---
 drivers/net/phy/mdio_bus.c          | 282 ----------------------------
 drivers/net/phy/mdio_bus_provider.c | 275 +++++++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h   |   3 +
 include/linux/phy.h                 |   3 -
 4 files changed, 278 insertions(+), 285 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 9fb47332602..00d0e4159e9 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -10,20 +10,14 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/etherdevice.h>
 #include <linux/ethtool.h>
-#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mii.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/netdevice.h>
-#include <linux/of_device.h>
-#include <linux/of_mdio.h>
 #include <linux/phy.h>
-#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -64,218 +58,6 @@ bool mdiobus_is_registered_device(struct mii_bus *bus, int addr)
 }
 EXPORT_SYMBOL(mdiobus_is_registered_device);
 
-/**
- * mdiobus_release - mii_bus device release callback
- * @d: the target struct device that contains the mii_bus
- *
- * Description: called when the last reference to an mii_bus is
- * dropped, to free the underlying memory.
- */
-static void mdiobus_release(struct device *d)
-{
-	struct mii_bus *bus = to_mii_bus(d);
-
-	WARN(bus->state != MDIOBUS_RELEASED &&
-	     /* for compatibility with error handling in drivers */
-	     bus->state != MDIOBUS_ALLOCATED,
-	     "%s: not in RELEASED or ALLOCATED state\n",
-	     bus->id);
-
-	if (bus->state == MDIOBUS_RELEASED)
-		fwnode_handle_put(dev_fwnode(d));
-
-	kfree(bus);
-}
-
-struct mdio_bus_stat_attr {
-	struct device_attribute attr;
-	int address;
-	unsigned int field_offset;
-};
-
-static struct mdio_bus_stat_attr *to_sattr(struct device_attribute *attr)
-{
-	return container_of(attr, struct mdio_bus_stat_attr, attr);
-}
-
-static u64 mdio_bus_get_stat(struct mdio_bus_stats *s, unsigned int offset)
-{
-	const u64_stats_t *stats = (const void *)s + offset;
-	unsigned int start;
-	u64 val = 0;
-
-	do {
-		start = u64_stats_fetch_begin(&s->syncp);
-		val = u64_stats_read(stats);
-	} while (u64_stats_fetch_retry(&s->syncp, start));
-
-	return val;
-}
-
-static ssize_t mdio_bus_stat_field_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
-{
-	struct mdio_bus_stat_attr *sattr = to_sattr(attr);
-	struct mii_bus *bus = to_mii_bus(dev);
-	u64 val = 0;
-
-	if (sattr->address < 0) {
-		/* get global stats */
-		for (int i = 0; i < PHY_MAX_ADDR; i++)
-			val += mdio_bus_get_stat(&bus->stats[i],
-						 sattr->field_offset);
-	} else {
-		val = mdio_bus_get_stat(&bus->stats[sattr->address],
-					sattr->field_offset);
-	}
-
-	return sysfs_emit(buf, "%llu\n", val);
-}
-
-static ssize_t mdio_bus_device_stat_field_show(struct device *dev,
-					       struct device_attribute *attr,
-					       char *buf)
-{
-	struct mdio_bus_stat_attr *sattr = to_sattr(attr);
-	struct mdio_device *mdiodev = to_mdio_device(dev);
-	struct mii_bus *bus = mdiodev->bus;
-	int addr = mdiodev->addr;
-	u64 val;
-
-	val = mdio_bus_get_stat(&bus->stats[addr], sattr->field_offset);
-
-	return sysfs_emit(buf, "%llu\n", val);
-}
-
-#define MDIO_BUS_STATS_ATTR(field)					\
-static const struct mdio_bus_stat_attr dev_attr_mdio_bus_##field = {	\
-	.attr = __ATTR(field, 0444, mdio_bus_stat_field_show, NULL),	\
-	.address = -1,							\
-	.field_offset = offsetof(struct mdio_bus_stats, field),		\
-};									\
-static const struct mdio_bus_stat_attr dev_attr_mdio_bus_device_##field = { \
-	.attr = __ATTR(field, 0444, mdio_bus_device_stat_field_show, NULL), \
-	.field_offset = offsetof(struct mdio_bus_stats, field),		\
-}
-
-MDIO_BUS_STATS_ATTR(transfers);
-MDIO_BUS_STATS_ATTR(errors);
-MDIO_BUS_STATS_ATTR(writes);
-MDIO_BUS_STATS_ATTR(reads);
-
-#define MDIO_BUS_STATS_ADDR_ATTR_DECL(field, addr, file)		\
-static const struct mdio_bus_stat_attr					\
-dev_attr_mdio_bus_addr_##field##_##addr = {				\
-	.attr = { .attr = { .name = file, .mode = 0444 },		\
-		     .show = mdio_bus_stat_field_show,			\
-	},								\
-	.address = addr,						\
-	.field_offset = offsetof(struct mdio_bus_stats, field),		\
-}
-
-#define MDIO_BUS_STATS_ADDR_ATTR(field, addr)				\
-	MDIO_BUS_STATS_ADDR_ATTR_DECL(field, addr,			\
-				 __stringify(field) "_" __stringify(addr))
-
-#define MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(addr)			\
-	MDIO_BUS_STATS_ADDR_ATTR(transfers, addr);			\
-	MDIO_BUS_STATS_ADDR_ATTR(errors, addr);				\
-	MDIO_BUS_STATS_ADDR_ATTR(writes, addr);				\
-	MDIO_BUS_STATS_ADDR_ATTR(reads, addr)				\
-
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(0);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(1);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(2);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(3);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(4);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(5);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(6);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(7);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(8);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(9);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(10);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(11);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(12);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(13);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(14);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(15);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(16);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(17);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(18);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(19);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(20);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(21);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(22);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(23);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(24);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(25);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(26);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(27);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(28);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(29);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(30);
-MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(31);
-
-#define MDIO_BUS_STATS_ADDR_ATTR_GROUP(addr)				\
-	&dev_attr_mdio_bus_addr_transfers_##addr.attr.attr,		\
-	&dev_attr_mdio_bus_addr_errors_##addr.attr.attr,		\
-	&dev_attr_mdio_bus_addr_writes_##addr.attr.attr,		\
-	&dev_attr_mdio_bus_addr_reads_##addr.attr.attr			\
-
-static const struct attribute *const mdio_bus_statistics_attrs[] = {
-	&dev_attr_mdio_bus_transfers.attr.attr,
-	&dev_attr_mdio_bus_errors.attr.attr,
-	&dev_attr_mdio_bus_writes.attr.attr,
-	&dev_attr_mdio_bus_reads.attr.attr,
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(0),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(1),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(2),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(3),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(4),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(5),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(6),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(7),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(8),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(9),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(10),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(11),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(12),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(13),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(14),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(15),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(16),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(17),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(18),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(19),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(20),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(21),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(22),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(23),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(24),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(25),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(26),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(27),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(28),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(29),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(30),
-	MDIO_BUS_STATS_ADDR_ATTR_GROUP(31),
-	NULL,
-};
-
-static const struct attribute_group mdio_bus_statistics_group = {
-	.name		= "statistics",
-	.attrs_const	= mdio_bus_statistics_attrs,
-};
-__ATTRIBUTE_GROUPS(mdio_bus_statistics);
-
-const struct class mdio_bus_class = {
-	.name		= "mdio_bus",
-	.dev_release	= mdiobus_release,
-	.dev_groups	= mdio_bus_statistics_groups,
-};
-EXPORT_SYMBOL_GPL(mdio_bus_class);
-
 static void mdiobus_stats_acct(struct mdio_bus_stats *stats, bool op, int ret)
 {
 	preempt_disable();
@@ -841,69 +623,5 @@ int mdiobus_c45_modify_changed(struct mii_bus *bus, int addr, int devad,
 }
 EXPORT_SYMBOL_GPL(mdiobus_c45_modify_changed);
 
-/**
- * mdio_bus_match - determine if given MDIO driver supports the given
- *		    MDIO device
- * @dev: target MDIO device
- * @drv: given MDIO driver
- *
- * Return: 1 if the driver supports the device, 0 otherwise
- *
- * Description: This may require calling the devices own match function,
- *   since different classes of MDIO devices have different match criteria.
- */
-static int mdio_bus_match(struct device *dev, const struct device_driver *drv)
-{
-	const struct mdio_driver *mdiodrv = to_mdio_driver(drv);
-	struct mdio_device *mdio = to_mdio_device(dev);
-
-	/* Both the driver and device must type-match */
-	if (!(mdiodrv->mdiodrv.flags & MDIO_DEVICE_IS_PHY) !=
-	    !(mdio->flags & MDIO_DEVICE_FLAG_PHY))
-		return 0;
-
-	if (of_driver_match_device(dev, drv))
-		return 1;
-
-	if (mdio->bus_match)
-		return mdio->bus_match(dev, drv);
-
-	return 0;
-}
-
-static int mdio_uevent(const struct device *dev, struct kobj_uevent_env *env)
-{
-	int rc;
-
-	/* Some devices have extra OF data and an OF-style MODALIAS */
-	rc = of_device_uevent_modalias(dev, env);
-	if (rc != -ENODEV)
-		return rc;
-
-	return 0;
-}
-
-static const struct attribute *const mdio_bus_device_statistics_attrs[] = {
-	&dev_attr_mdio_bus_device_transfers.attr.attr,
-	&dev_attr_mdio_bus_device_errors.attr.attr,
-	&dev_attr_mdio_bus_device_writes.attr.attr,
-	&dev_attr_mdio_bus_device_reads.attr.attr,
-	NULL,
-};
-
-static const struct attribute_group mdio_bus_device_statistics_group = {
-	.name		= "statistics",
-	.attrs_const	= mdio_bus_device_statistics_attrs,
-};
-__ATTRIBUTE_GROUPS(mdio_bus_device_statistics);
-
-const struct bus_type mdio_bus_type = {
-	.name		= "mdio_bus",
-	.dev_groups	= mdio_bus_device_statistics_groups,
-	.match		= mdio_bus_match,
-	.uevent		= mdio_uevent,
-};
-EXPORT_SYMBOL(mdio_bus_type);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MDIO bus/device layer");
diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
index d50fe6eb4b0..041576eba47 100644
--- a/drivers/net/phy/mdio_bus_provider.c
+++ b/drivers/net/phy/mdio_bus_provider.c
@@ -28,6 +28,281 @@
 #include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/unistd.h>
+#include "phylib-internal.h"
+
+/**
+ * mdiobus_release - mii_bus device release callback
+ * @d: the target struct device that contains the mii_bus
+ *
+ * Description: called when the last reference to an mii_bus is
+ * dropped, to free the underlying memory.
+ */
+static void mdiobus_release(struct device *d)
+{
+	struct mii_bus *bus = to_mii_bus(d);
+
+	WARN(bus->state != MDIOBUS_RELEASED &&
+	     /* for compatibility with error handling in drivers */
+	     bus->state != MDIOBUS_ALLOCATED,
+	     "%s: not in RELEASED or ALLOCATED state\n",
+	     bus->id);
+
+	if (bus->state == MDIOBUS_RELEASED)
+		fwnode_handle_put(dev_fwnode(d));
+
+	kfree(bus);
+}
+
+struct mdio_bus_stat_attr {
+	struct device_attribute attr;
+	int address;
+	unsigned int field_offset;
+};
+
+static struct mdio_bus_stat_attr *to_sattr(struct device_attribute *attr)
+{
+	return container_of(attr, struct mdio_bus_stat_attr, attr);
+}
+
+static u64 mdio_bus_get_stat(struct mdio_bus_stats *s, unsigned int offset)
+{
+	const u64_stats_t *stats = (const void *)s + offset;
+	unsigned int start;
+	u64 val = 0;
+
+	do {
+		start = u64_stats_fetch_begin(&s->syncp);
+		val = u64_stats_read(stats);
+	} while (u64_stats_fetch_retry(&s->syncp, start));
+
+	return val;
+}
+
+static ssize_t mdio_bus_stat_field_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct mdio_bus_stat_attr *sattr = to_sattr(attr);
+	struct mii_bus *bus = to_mii_bus(dev);
+	u64 val = 0;
+
+	if (sattr->address < 0) {
+		/* get global stats */
+		for (int i = 0; i < PHY_MAX_ADDR; i++)
+			val += mdio_bus_get_stat(&bus->stats[i],
+						 sattr->field_offset);
+	} else {
+		val = mdio_bus_get_stat(&bus->stats[sattr->address],
+					sattr->field_offset);
+	}
+
+	return sysfs_emit(buf, "%llu\n", val);
+}
+
+static ssize_t mdio_bus_device_stat_field_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	struct mdio_bus_stat_attr *sattr = to_sattr(attr);
+	struct mdio_device *mdiodev = to_mdio_device(dev);
+	struct mii_bus *bus = mdiodev->bus;
+	int addr = mdiodev->addr;
+	u64 val;
+
+	val = mdio_bus_get_stat(&bus->stats[addr], sattr->field_offset);
+
+	return sysfs_emit(buf, "%llu\n", val);
+}
+
+#define MDIO_BUS_STATS_ATTR(field)					\
+static const struct mdio_bus_stat_attr dev_attr_mdio_bus_##field = {	\
+	.attr = __ATTR(field, 0444, mdio_bus_stat_field_show, NULL),	\
+	.address = -1,							\
+	.field_offset = offsetof(struct mdio_bus_stats, field),		\
+};									\
+static const struct mdio_bus_stat_attr dev_attr_mdio_bus_device_##field = { \
+	.attr = __ATTR(field, 0444, mdio_bus_device_stat_field_show, NULL), \
+	.field_offset = offsetof(struct mdio_bus_stats, field),		\
+}
+
+MDIO_BUS_STATS_ATTR(transfers);
+MDIO_BUS_STATS_ATTR(errors);
+MDIO_BUS_STATS_ATTR(writes);
+MDIO_BUS_STATS_ATTR(reads);
+
+#define MDIO_BUS_STATS_ADDR_ATTR_DECL(field, addr, file)		\
+static const struct mdio_bus_stat_attr					\
+dev_attr_mdio_bus_addr_##field##_##addr = {				\
+	.attr = { .attr = { .name = file, .mode = 0444 },		\
+		     .show = mdio_bus_stat_field_show,			\
+	},								\
+	.address = addr,						\
+	.field_offset = offsetof(struct mdio_bus_stats, field),		\
+}
+
+#define MDIO_BUS_STATS_ADDR_ATTR(field, addr)				\
+	MDIO_BUS_STATS_ADDR_ATTR_DECL(field, addr,			\
+				 __stringify(field) "_" __stringify(addr))
+
+#define MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(addr)			\
+	MDIO_BUS_STATS_ADDR_ATTR(transfers, addr);			\
+	MDIO_BUS_STATS_ADDR_ATTR(errors, addr);				\
+	MDIO_BUS_STATS_ADDR_ATTR(writes, addr);				\
+	MDIO_BUS_STATS_ADDR_ATTR(reads, addr)				\
+
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(0);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(1);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(2);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(3);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(4);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(5);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(6);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(7);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(8);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(9);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(10);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(11);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(12);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(13);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(14);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(15);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(16);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(17);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(18);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(19);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(20);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(21);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(22);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(23);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(24);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(25);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(26);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(27);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(28);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(29);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(30);
+MDIO_BUS_STATS_ADDR_ATTR_GROUP_DECL(31);
+
+#define MDIO_BUS_STATS_ADDR_ATTR_GROUP(addr)				\
+	&(dev_attr_mdio_bus_addr_transfers_##addr).attr.attr,		\
+	&(dev_attr_mdio_bus_addr_errors_##addr).attr.attr,		\
+	&(dev_attr_mdio_bus_addr_writes_##addr).attr.attr,		\
+	&(dev_attr_mdio_bus_addr_reads_##addr).attr.attr			\
+
+static const struct attribute *const mdio_bus_statistics_attrs[] = {
+	&dev_attr_mdio_bus_transfers.attr.attr,
+	&dev_attr_mdio_bus_errors.attr.attr,
+	&dev_attr_mdio_bus_writes.attr.attr,
+	&dev_attr_mdio_bus_reads.attr.attr,
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(0),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(1),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(2),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(3),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(4),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(5),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(6),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(7),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(8),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(9),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(10),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(11),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(12),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(13),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(14),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(15),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(16),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(17),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(18),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(19),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(20),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(21),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(22),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(23),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(24),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(25),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(26),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(27),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(28),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(29),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(30),
+	MDIO_BUS_STATS_ADDR_ATTR_GROUP(31),
+	NULL,
+};
+
+static const struct attribute_group mdio_bus_statistics_group = {
+	.name		= "statistics",
+	.attrs_const	= mdio_bus_statistics_attrs,
+};
+__ATTRIBUTE_GROUPS(mdio_bus_statistics);
+
+const struct class mdio_bus_class = {
+	.name		= "mdio_bus",
+	.dev_release	= mdiobus_release,
+	.dev_groups	= mdio_bus_statistics_groups,
+};
+
+/**
+ * mdio_bus_match - determine if given MDIO driver supports the given
+ *		    MDIO device
+ * @dev: target MDIO device
+ * @drv: given MDIO driver
+ *
+ * Return: 1 if the driver supports the device, 0 otherwise
+ *
+ * Description: This may require calling the devices own match function,
+ *   since different classes of MDIO devices have different match criteria.
+ */
+static int mdio_bus_match(struct device *dev, const struct device_driver *drv)
+{
+	const struct mdio_driver *mdiodrv = to_mdio_driver(drv);
+	struct mdio_device *mdio = to_mdio_device(dev);
+
+	/* Both the driver and device must type-match */
+	if (!(mdiodrv->mdiodrv.flags & MDIO_DEVICE_IS_PHY) !=
+	    !(mdio->flags & MDIO_DEVICE_FLAG_PHY))
+		return 0;
+
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	if (mdio->bus_match)
+		return mdio->bus_match(dev, drv);
+
+	return 0;
+}
+
+static int mdio_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	int rc;
+
+	/* Some devices have extra OF data and an OF-style MODALIAS */
+	rc = of_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
+
+	return 0;
+}
+
+static const struct attribute *const mdio_bus_device_statistics_attrs[] = {
+	&dev_attr_mdio_bus_device_transfers.attr.attr,
+	&dev_attr_mdio_bus_device_errors.attr.attr,
+	&dev_attr_mdio_bus_device_writes.attr.attr,
+	&dev_attr_mdio_bus_device_reads.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group mdio_bus_device_statistics_group = {
+	.name		= "statistics",
+	.attrs_const	= mdio_bus_device_statistics_attrs,
+};
+__ATTRIBUTE_GROUPS(mdio_bus_device_statistics);
+
+const struct bus_type mdio_bus_type = {
+	.name		= "mdio_bus",
+	.dev_groups	= mdio_bus_device_statistics_groups,
+	.match		= mdio_bus_match,
+	.uevent		= mdio_uevent,
+};
 
 /**
  * mdiobus_alloc_size - allocate a mii_bus structure
diff --git a/drivers/net/phy/phylib-internal.h b/drivers/net/phy/phylib-internal.h
index bfb1aa82386..664ed7faa51 100644
--- a/drivers/net/phy/phylib-internal.h
+++ b/drivers/net/phy/phylib-internal.h
@@ -9,6 +9,9 @@
 struct mdio_device;
 struct phy_device;
 
+extern const struct bus_type mdio_bus_type;
+extern const struct class mdio_bus_class;
+
 /*
  * phy_supported_speeds - return all speeds currently supported by a PHY device
  */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e9b0d7427b0..5de4b172cd0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2446,9 +2446,6 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 
 struct phy_port *phy_get_sfp_port(struct phy_device *phydev);
 
-extern const struct bus_type mdio_bus_type;
-extern const struct class mdio_bus_class;
-
 /**
  * phy_module_driver() - Helper macro for registering PHY drivers
  * @__phy_drivers: array of PHY drivers to register
-- 
2.53.0



