Return-Path: <linux-arm-msm+bounces-95123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE2aA4TOpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:05:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1D1EEF44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4FFB30BA596
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA833F5A4;
	Tue,  3 Mar 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMEYOJMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43633F383;
	Tue,  3 Mar 2026 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539051; cv=none; b=MNwlTF36O620k4TrwVMh2+m+JwrulypwQDVL5YQgwNIdOKbuBhw9o67Ogl6GA0owlijK1UueaaepmBjYHHJZyJNmhGNcclKuc2OYQDXIahW8M0bSGbNctrr5UXGgvPj19FLOug6WdRwc0TVxk/gjOnFCBHIxylkyEhcMLhE4804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539051; c=relaxed/simple;
	bh=vXaHvCEHJXa60E12gJk4qXYIo6yuZXE+bxs1JmCmVKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnMhORnIDoCroHZqMJcdlhK99E/snPeCUX1fq1CmTj0SDR2cVHQydvAyzqCUN/j8ykvqX9L63uXwOZsXP3i0PWpDZY56Ajou2jVyJEAxZv4AMf6cjtYuBPG4BVEryvSPjkm3q3ecoh9rIlCyJdCg4VitHz+lrTeUE2mB5RxarMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMEYOJMB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1895CC116C6;
	Tue,  3 Mar 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539050;
	bh=vXaHvCEHJXa60E12gJk4qXYIo6yuZXE+bxs1JmCmVKI=;
	h=From:To:Cc:Subject:Date:From;
	b=QMEYOJMB3DeR1jQdolTaUXAdR0T4xlXJUqmGaZ2z2Fb7auuJToYN8vNDDx5lCCpAw
	 SzgzOogn/OsS2Jhw2ROKEJHX1igHMLBUIzsJ4PhyQXfWxAEXBblCVI1g/YZY/To7i3
	 qRZT4rb7NcxkziIe0UHAQQk93MJFTpMb+eX8SYirsJu89Bq5Do/w+fdv9vLeDq/hic
	 Ey2QaLrbeiIZPs7s0MgK2/gUNVBnFTmcBYXQ/ovv1PWIO1EGIg0PF4co8x1vGQhCKt
	 Mlr8UIgcT6EMfLzt2opMnPSXylZB+OU5L4qsYgU0RHDi2317uZgnJecmrc16iu2rVo
	 KaL/iRCcpArqA==
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
Subject: [PATCH v2 0/4] driver core: generalize driver_override infrastructure
Date: Tue,  3 Mar 2026 12:53:17 +0100
Message-ID: <20260303115720.48783-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A9F1D1EEF44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95123-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Currently, there are 12 busses (including platform and PCI) that duplicate the
driver_override logic for their individual devices.

All of them seem to be prone to the bug described in [1].

While this could be solved for every bus individually using a separate lock,
solving this in the driver-core generically results in less (and cleaner)
changes overall.

Thus, move driver_override to struct device, provide corresponding accessors for
busses and handle locking with a separate lock internally.

In particular, add device_set_driver_override(), device_has_driver_override(),
device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to
declare the corresponding sysfs store() and show() callbacks.

Until all busses have migrated, keep driver_set_override() in place.

Note that we can't use the device lock for the reasons described in [2].

This patch series includes the migration of the platform bus; patches for all
other affected busses still need to be extracted as a follow-up of the WIP
treewide patch in [3].

[1] https://bugzilla.kernel.org/show_bug.cgi?id=220789
[2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=driver_override

Changes in v2:
  - Drop DEVICE_ATTR_DRIVER_OVERRIDE() and make driver_override a
    struct bus_type feature instead.
  - Add driver_override documentation in .../driver-model/binding.rst.
  - Move kfree(dev->driver_override.name) before release().
  - hwmon: axi-fan: Use NULL instead of dev_name() in
    devm_request_threaded_irq().

Danilo Krummrich (4):
  driver core: generalize driver_override in struct device
  docs: driver-model: document driver_override
  hwmon: axi-fan: don't use driver_override as IRQ name
  driver core: platform: use generic driver_override infrastructure

 .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++
 arch/sh/drivers/platform_early.c              |  6 +-
 drivers/base/bus.c                            | 43 ++++++++++++-
 drivers/base/core.c                           |  2 +
 drivers/base/dd.c                             | 60 +++++++++++++++++++
 drivers/base/platform.c                       | 37 ++----------
 drivers/bus/simple-pm-bus.c                   |  4 +-
 drivers/clk/imx/clk-scu.c                     |  3 +-
 drivers/hwmon/axi-fan-control.c               |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c               |  6 +-
 include/linux/device.h                        | 54 +++++++++++++++++
 include/linux/device/bus.h                    |  4 ++
 include/linux/platform_device.h               |  5 --
 sound/soc/samsung/i2s.c                       |  6 +-
 14 files changed, 228 insertions(+), 52 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.53.0


