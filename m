Return-Path: <linux-arm-msm+bounces-95125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIOAEfnMpmnIVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:58:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DE1EECBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2724A302D729
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E18E344044;
	Tue,  3 Mar 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdJJ1hcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0833F595;
	Tue,  3 Mar 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539059; cv=none; b=cqG0yj1Bc0utmUCd2slwumminfAaWdCNVpt9AXlU+DUFY/azwAm50sXgiY3RxFqRX11wn5lbQ8tvwzHPARsFhzUTiMB7Ir9IdKCfjONHioGiJwFV6sgqu0jBBmmskiN2KIdxwQS0bp1OUSBVGWqSOlRPfObdOLmsBsNxdGdqixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539059; c=relaxed/simple;
	bh=CFaaL8gRJL7PBLsD3XJRYlsmDMT6/BIrxbJWYBiGnpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sogdDAhIMi8I/c3HbwHFNrEh0mAly0/fTehHbrw7nsD81zLxZc80xIFw52FTwWmHiEpSQQdXeDTTKLZ3WJSm8iyNYFGMn4rKIUrmoyCnzr5QopoM/Sfzjg9ONAYEgIQS7qnawCGEG8B5x3+Fy8Wj+aa2QwqWVdiGBl6ovOCfcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdJJ1hcZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFD1C116C6;
	Tue,  3 Mar 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539059;
	bh=CFaaL8gRJL7PBLsD3XJRYlsmDMT6/BIrxbJWYBiGnpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sdJJ1hcZxUomU+fjclbkwf+MtC81BxuFQXpXOLl7wgh4UmEO69KicOlh226CGAIsN
	 qpIGsgcPmwJS2C2oqYGJFNLRT5FCX75MgPo6xpzh6Irth0J1xiFTynpv+8UXcQ6+Ek
	 ixSlNz9wsim1YM6CXfe6I4UkNPm0qaD3Hjz5fW7plA9i1mNnvQNMEZn1VQiReA7jCs
	 szH7vWdH0dVxqm0/pjYEvlUEgcZQrpPWlE9dwmvc9a2mn4OJ3G3GUWIi7GeaVOXNAC
	 CMp0KiC7XRKcQOPh1buUDAGy8O6ucjDY45bP9jomy4g7l/+gJOIGf+3GC2ncQBFuEX
	 nVZ9tckMeJN/w==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/4] docs: driver-model: document driver_override
Date: Tue,  3 Mar 2026 12:53:19 +0100
Message-ID: <20260303115720.48783-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF2DE1EECBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95125-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Now that we support driver_override as a driver-core feature through
struct device and struct bus_type, add some documentation in the context
of how a device / driver binding is established.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/driver-api/driver-model/binding.rst b/Documentation/driver-api/driver-model/binding.rst
index d1d311a4011f..fa0888c2b3b9 100644
--- a/Documentation/driver-api/driver-model/binding.rst
+++ b/Documentation/driver-api/driver-model/binding.rst
@@ -99,3 +99,51 @@ of the driver is decremented. All symlinks between the two are removed.
 When a driver is removed, the list of devices that it supports is
 iterated over, and the driver's remove callback is called for each
 one. The device is removed from that list and the symlinks removed.
+
+
+Driver Override
+~~~~~~~~~~~~~~~
+
+Userspace may override the standard matching by writing a driver name to
+a device's ``driver_override`` sysfs attribute.  When set, only a driver
+whose name matches the override will be considered during binding.  This
+bypasses all bus-specific matching (OF, ACPI, ID tables, etc.).
+
+The override may be cleared by writing an empty string, which returns
+the device to standard matching rules.  Writing to ``driver_override``
+does not automatically unbind the device from its current driver or
+make any attempt to load the specified driver.
+
+Buses opt into this mechanism by setting the ``driver_override`` flag in
+their ``struct bus_type``::
+
+  const struct bus_type example_bus_type = {
+      ...
+      .driver_override = true,
+  };
+
+When the flag is set, the driver core automatically creates the
+``driver_override`` sysfs attribute for every device on that bus.
+
+The bus's ``match()`` callback should check the override before performing
+its own matching, using ``device_match_driver_override()``::
+
+  static int example_match(struct device *dev, const struct device_driver *drv)
+  {
+      int ret;
+
+      ret = device_match_driver_override(dev, drv);
+      if (ret >= 0)
+          return ret;
+
+      /* Fall through to bus-specific matching... */
+  }
+
+``device_match_driver_override()`` returns > 0 if the override matches
+the given driver, 0 if the override is set but does not match, or < 0 if
+no override is set at all.
+
+Additional helpers are available:
+
+- ``device_set_driver_override()`` - set or clear the override from kernel code.
+- ``device_has_driver_override()`` - check whether an override is set.
-- 
2.53.0


