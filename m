Return-Path: <linux-arm-msm+bounces-114702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y8UhJZGqPmrlJwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:36:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3936CF29E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:36:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=W+c8RUwv;
	dkim=pass header.d=redhat.com header.s=google header.b=FRJ0StNc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114702-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114702-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFC9E304197E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1633FD134;
	Fri, 26 Jun 2026 16:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C03FCB2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491598; cv=none; b=mudjU7Vn5/XeJrrE+AYoAQnoeZvVokwmhWHPf6vYpVPr877XuYSmbNa9fu/LujDGApZhVdAbPdJsXfJ+394PYrCmuryLNuK39v1KOvcOKIzWV6AHkZgchvFoy+XS+JMCupdad2VVHyQTfI2JLM8Uw1gWSWFxs+sWUVB/w2EuiRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491598; c=relaxed/simple;
	bh=4C/sb0FsOyRTobfskpY6am3zXhp6RBvbExjHUf950gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bdh0f8bt6MnQ1QyYxCopYThflX+BjrfegxsRu+uvGE6hhaLxEChIjyfgyPP7oRVD9jtnwOMP0M9bwbrAPYKVWKcr3AB5zX+xte713ARyVVp2l+Ys0IVZ3FH+grO2kHJqWEbhblDD/NpGuPgzBdYAzOwHhxKW0ZZCypUveFStC+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+c8RUwv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRJ0StNc; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
	b=W+c8RUwvuQoAeXTLEOSUFBuNg8AnwcSqbSTn/S1cV/8xlNH3UBSFM+x/5AOmIXtcYqpPMK
	1e73OKJi/DTFD7FR8BAdhQKWvKRH86ZqKSoI+cpJzBjylbCd3MDiGnVPsTrnB+XOkopGT0
	u7aiNBCS6lWbx8nn08IeehJ6cdOl7F8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-GWGr7NXiMPuMTzm1iMAayQ-1; Fri, 26 Jun 2026 12:33:14 -0400
X-MC-Unique: GWGr7NXiMPuMTzm1iMAayQ-1
X-Mimecast-MFC-AGG-ID: GWGr7NXiMPuMTzm1iMAayQ_1782491594
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dba00e17b5so13278676d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491594; x=1783096394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
        b=FRJ0StNcSzidnxDcc7YKYMua7wy8T6wPpkXIPnrjFwGjNsnJNPRUwwMuq/4XYZ+mRi
         8nLCk/Xg2RHVx8rDFOWAGsON3GLowlNr5yOzTYQesGhQOtS5sbaheW5e/uKhebm3NPq7
         RgHH/TMTAykJT14AALzR8T1B3X6LgDk4+EQu3PR1gw1Lrany3RV0ZNlIGNPRd40s+7fw
         hkU81vCaEQQgFnxpbE04CzDw5luRzetP/7lWW7eem7dSN185Ahu9scaUgiIFD0BUzNA0
         brbv8n3C15Ukp+ARca013gM1o2P7JlYjRxJzteX7GWzrJaUUhckzWJdVl8s0fW04UGcW
         D4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491594; x=1783096394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
        b=r4iR8pP1Nf+ezb2wcLg8E4+KsgxbR5j953xWPvkcMp66kJYr3DLufAhq3JilEqYk5+
         XpzU+1UplwTXFU1RYYTWK5NenwO+vLywj3jLHirsPGiaFPH05ooS1qX/kZvbD9KESrti
         C6iJGvAf+NWWR5gEO/bv8VKrEFA0XU4wHJ9uu8cGoRaHb08hPjDMVzaOg8zHxt2yvtUX
         ghb5fGx0wCVkEzncmoEESuWB2WPioxv0ZClfz5nrcfpl/cV2JFFTTCVMZdQ8CE0MOJZG
         ZKJanHtJmYme2MufxycAn6YNSK/2jmlrDERwFOaLb6u2d0mDy4fnaDetZ7c0fG42zLp6
         7sOg==
X-Forwarded-Encrypted: i=1; AHgh+Rrin8MI1+KBwIFEg0ESNcHrvlEuMiPqAl8fU8E2UsETxTx7mN4KNFk6dTQPCQ75Vg7NFjzk4CdP2FLTe1v0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjYXHf6E8lYAzi1HpuTiyJvvmPwq4IUawlCJ5k9/s+aMutELI
	yQ7Ya5unFXX2PS3fLCQraT3kaNbccHj90PxMejE/gWwb9e45RWwThu07CvdzC3AlvCUnTD1lBlH
	oJLhA3MECqKI2mfbRMdO3ruxwYT6a3jrigVdLwENrr1w4hHW+JDzkFHEQZR3V1gMEqcc=
X-Gm-Gg: AfdE7ckqxqbI14Pb+z2OayFh5vD0x0w8dULKokRs49VzemAdGNTTbC9OjNqQqhs4o9z
	4ieVoSQbCNSe4a+xMcnGM5we5nq1AFWiVEHdoY065ZIq3CjYD1JcYm0uRlmpfMxyVn1xqMI9IfU
	XBod88zW7whbTuZ2QofijjIyFYkIH7XDc30OPZot5MXbQASjR/NuSGqsIg2DYLA0SavaZDKj6pF
	xowL1lHYzYCmeOyuc+zCy6gHrxxOB8In9dKct15E1yEJ2tqh+mGaZAuWrT6XKImuAGGYOD9g6iZ
	SyUZchFuVbBeQC5PMg5TE8XZ2IUwOEVDo7rN2EZRolhJJuK12db1NQiDcSNARthcqSniqbSxnmn
	lYsit44qjRorbxwHDLaqondjvuAqiwfCNDdsVbedX3drkgB9u9g==
X-Received: by 2002:ad4:596d:0:b0:8ce:a033:eef9 with SMTP id 6a1803df08f44-8e6d7f0b3f4mr122001436d6.26.1782491592871;
        Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:8ce:a033:eef9 with SMTP id 6a1803df08f44-8e6d7f0b3f4mr121999726d6.26.1782491591564;
        Fri, 26 Jun 2026 09:33:11 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:42 -0400
Subject: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=4C/sb0FsOyRTobfskpY6am3zXhp6RBvbExjHUf950gU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh7UZno7S3biD5fKPXEuv/YJVRyo2sQZ1veigv26y
 9aUTyyPOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIdy7DP6PzF968+Otc56fo
 0vo33mdyC2NZ9hodLV69poWz5vZZ6jP8066+uMKW2T3K0mbbus98X5RFvL+I/GvRyPoZXZUYcn8
 zOwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114702-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD3936CF29E

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains, resets, etc. We
currently have dev_set_drv_sync_state() where a framework or driver
can set the sync_state callback for a device node, however it currently
only supports a single sync_state callback.

The pmdomain subsystem currently sets up a sync_state callback in the
core framework, and the clk subsystem will setup it's own separate
sync_state callback in the core framework. These can collide with each
other on some types of devices that have multiple types of resources.
Additionally, some clk drivers already have their own separate
sync_state callback already defined.

Let's introduce support for allowing drivers and frameworks to add their
own sync_state callback via a new function dev_add_sync_state() so that
multiple sync_state callbacks can coexist.

Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/base/base.h    |  7 +++++++
 drivers/base/core.c    | 29 +++++++++++++++++++++++++++++
 include/linux/device.h | 11 +++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index a5b7abc10ff0..339db4afbeb4 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -178,6 +178,8 @@ static inline bool dev_has_sync_state(struct device *dev)
 
 	if (!dev)
 		return false;
+	if (!list_empty(&dev->sync_state_list))
+		return true;
 	drv = READ_ONCE(dev->driver);
 	if (drv && drv->sync_state)
 		return true;
@@ -188,10 +190,15 @@ static inline bool dev_has_sync_state(struct device *dev)
 
 static inline void dev_sync_state(struct device *dev)
 {
+	struct sync_state_entry *entry;
+
 	if (dev->bus->sync_state)
 		dev->bus->sync_state(dev);
 	else if (dev->driver && dev->driver->sync_state)
 		dev->driver->sync_state(dev);
+
+	list_for_each_entry(entry, &dev->sync_state_list, node)
+		entry->fn(dev);
 }
 
 int driver_add_groups(const struct device_driver *drv,
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..acc12f402dd3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2612,6 +2612,7 @@ EXPORT_SYMBOL_GPL(device_show_string);
 static void device_release(struct kobject *kobj)
 {
 	struct device *dev = kobj_to_dev(kobj);
+	struct sync_state_entry *entry, *tmp;
 	struct device_private *p = dev->p;
 
 	/*
@@ -2625,6 +2626,11 @@ static void device_release(struct kobject *kobj)
 	 */
 	devres_release_all(dev);
 
+	list_for_each_entry_safe(entry, tmp, &dev->sync_state_list, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+
 	kfree(dev->dma_range_map);
 	kfree(dev->driver_override.name);
 
@@ -3239,12 +3245,35 @@ void device_initialize(struct device *dev)
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.defer_sync);
+	INIT_LIST_HEAD(&dev->sync_state_list);
 	dev->links.status = DL_DEV_NO_DRIVER;
 	dev_assign_dma_coherent(dev, dma_default_coherent);
 	swiotlb_dev_init(dev);
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
+int dev_add_sync_state(struct device *dev,
+			   void (*fn)(struct device *dev))
+{
+	struct sync_state_entry *entry;
+
+	if (!dev || !dev->driver)
+		return 0;
+
+	list_for_each_entry(entry, &dev->sync_state_list, node)
+		if (entry->fn == fn)
+			return 0;
+
+	entry = kmalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->fn = fn;
+	list_add_tail(&entry->node, &dev->sync_state_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_add_sync_state);
+
 struct kobject *virtual_device_parent(void)
 {
 	static struct kobject *virtual_dir = NULL;
diff --git a/include/linux/device.h b/include/linux/device.h
index 7b2baffdd2f5..b7a3dd4b56ed 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -642,6 +642,8 @@ enum struct_device_flags {
  * @driver_override: Driver name to force a match.  Do not touch directly; use
  *		     device_set_driver_override() instead.
  * @links:	Links to suppliers and consumers of this device.
+ * @sync_state_list: List of sync_state callbacks added by subsystem
+ *		frameworks (e.g. clk, genpd) via dev_add_sync_state().
  * @power:	For device power management.
  *		See Documentation/driver-api/pm/devices.rst for details.
  * @pm_domain:	Provide callbacks that are executed during system suspend,
@@ -723,6 +725,7 @@ struct device {
 					 */
 
 	struct dev_links_info	links;
+	struct list_head	sync_state_list;
 	struct dev_pm_info	power;
 	struct dev_pm_domain	*pm_domain;
 
@@ -1137,6 +1140,14 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+struct sync_state_entry {
+	struct list_head	node;
+	void			(*fn)(struct device *dev);
+};
+
+int dev_add_sync_state(struct device *dev,
+			   void (*fn)(struct device *dev));
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {

-- 
2.54.0


