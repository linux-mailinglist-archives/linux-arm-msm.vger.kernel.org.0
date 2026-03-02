Return-Path: <linux-arm-msm+bounces-94771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAleIZDZpGlhuAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:28:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFE51D2171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42554300460A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 00:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B351C5F27;
	Mon,  2 Mar 2026 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjtZn7Aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD254183CC3;
	Mon,  2 Mar 2026 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411274; cv=none; b=ps1N2ewQYScVyaYszYKbUXTpyAsBHfcIPPGaY8GO/WqVIhAR6HJRSOKLUAcEkrIh53Pr1zhzLReYwyVwG+0kiJjgdT10k5ohl3Rph8SLqmRrKpWx1Y6CZ0dVf/nTWAJSZmCZQU8l6wHq64DbtzucZ199fpalS/3DN2tbsoQtswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411274; c=relaxed/simple;
	bh=Pns+Gig1BWJSqDMXsjGA6andnLvpaxx09TdwPTjU55g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZHZp1wkJKyBMObNjnOTGv5tkjC4/ujSP2s+jxgYkyvs9+Q7siOKZfPKRyOtut26VXRlasMzmaZHvqiGpKagf80MqhWezbhE8BrOTbmXZZjtLMyBIio5BKJdw68jYxm4Oak7f1wls2k1Pi1hq/hcjb5F1dvdPnzXF1V/5W5SXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjtZn7Aa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8EEC116C6;
	Mon,  2 Mar 2026 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411274;
	bh=Pns+Gig1BWJSqDMXsjGA6andnLvpaxx09TdwPTjU55g=;
	h=From:To:Cc:Subject:Date:From;
	b=EjtZn7AaXiIU2Ks2SxjbV1LgW/hXT8bmYzHXEb91QrW0MDYwU5i3yjwu31XlQXr/+
	 cl5+dWxBDhFArVxrZ77ImiU6MLDVYrimHtUcgsWKnfXhgfJr+R1hJnwzcKDn+izlHJ
	 YltjyggOMjkjkDbDycQSpjLu3SsHHKexwU6tY/xF+E0DenRaySoNiWUueHXxSEg3hE
	 9X2cgbajLIaz5vrCxD5UoTerJyGusi22Gxcw+TyifyZa9hPtQZvT3ewKFd18js4S1g
	 KJbr9EEUCFaUBJ4r3hWVMlGQnRu0MQ3kZ0jnGNnPDb4wOkbDQ1rJj0+UW+vXENIium
	 yce6JBBlvZa4Q==
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
Subject: [PATCH 0/3] driver core: generalize driver_override infrastructure
Date: Mon,  2 Mar 2026 01:25:55 +0100
Message-ID: <20260302002729.19438-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94771-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FFE51D2171
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

Danilo Krummrich (3):
  driver core: generalize driver_override in struct device
  hwmon: axi-fan: don't use driver_override as IRQ name
  driver core: platform: use generic driver_override infrastructure

 arch/sh/drivers/platform_early.c |  6 ++-
 drivers/base/core.c              |  2 +
 drivers/base/dd.c                | 60 +++++++++++++++++++++++
 drivers/base/platform.c          | 35 ++------------
 drivers/bus/simple-pm-bus.c      |  4 +-
 drivers/clk/imx/clk-scu.c        |  3 +-
 drivers/hwmon/axi-fan-control.c  |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c  |  6 +--
 include/linux/device.h           | 81 ++++++++++++++++++++++++++++++++
 include/linux/platform_device.h  |  5 --
 sound/soc/samsung/i2s.c          |  6 +--
 11 files changed, 161 insertions(+), 49 deletions(-)


base-commit: 78437ab3b769f80526416570f60173c89858dd84
-- 
2.53.0


