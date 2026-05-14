Return-Path: <linux-arm-msm+bounces-107537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCwqE+RzBWocXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2753EA7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 715B33016B64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EAC3C199E;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdHQZFOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238403F4110;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742242; cv=none; b=SdLH7XcVY9oeNQC0jhlFlyE4FODYvJGHx/WFfqhJZjLIUul/Q5IE9ajtDZ9ydZxtofvzMOVpLFEk/3sOmK7XgotaeibrekWfJGiBGP0gbgZYLgYHiFy8SDwkNm1NR7gZ+5sFadYhVtzQixnXO0xQJQBBEhvDvvc5hS/3zr1/mz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742242; c=relaxed/simple;
	bh=elyyTlHLLfNzd6l3H0FL9Cz6LRQxDUIlfmi0kRxxO9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LGbvbx3MsJr7RtAYbY92kQVTVJUUtVljm2SJEbqt/G2aiFVMtkyyZF7Lpe5iKtUw56B+DAan44eoBOKWHVKbEOsQK57XUi+3fveJJfgzog7hpeq5obuI9+hnLkDBHNri0O7BGBgIO/33Jj/0y7TWIpw51TE+NB2aN3Dd851XTsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdHQZFOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0425C2BCB7;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742241;
	bh=elyyTlHLLfNzd6l3H0FL9Cz6LRQxDUIlfmi0kRxxO9E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NdHQZFOg4fvaeuLVIuVuF6WqqBCI5SP6PNoVASTucmcjqvEzhMpy3rGLC3UygvLsp
	 Ey+VwbHKQin+vUd0pkzQ6u13qsvjNb0Dnlk4464zpHAGA1zS021rh2JXxduBeABoTh
	 cXOxmf26FXQpMCK+YMy/zawFaDqZHZmaN+2bFdkehY4m1Grnq4OfeB1Ioh7lKhk1LR
	 to58mpjtC+rI2NtXfjWZR5t45LPYaQa5ZXAXq4LKHqH0sm1Sh9LlrWlkiiC15oBw5a
	 WuWCQihbP3kMIIZDHgDCf2CpA8yQm8T/+VhRZHWkaCTnazmNiqAnkiVFXeSidOPKWC
	 hXxa+gEIbAL9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8BDCD4F39;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH 0/3] Add cpufreq to MSM8960
Date: Thu, 14 May 2026 00:03:59 -0700
Message-Id: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XN0W6DIBTG8VcxXO80oILVLMveY2kMwkHJpHaAp
 EvTdx/Wm2Y3vfyT7/y4kYDeYiBdcSMekw12OedgbwVRkzyPCFbnJiUtBeWsArxePIYgY+zVZTU
 ef0AIUR0HedSMC5IP88DY6wP9Ou2dZ2u24/5I3CY87K5432n6TENcVjV94y8kBgxMozXXg6iR6
 s/RSTsf1OI+tr9eSb2SDr3szSzDBIkDhZbzsuZUyKZtX2o1Zc+aWXHux3XbpGqzRFMro+jAZfn
 PGmRAyOFs7IrUHCg53e9/5tTtTHABAAA=
X-Change-ID: 20260513-expressatt_cpufreq-66638ba8d156
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778742241; l=3190;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=elyyTlHLLfNzd6l3H0FL9Cz6LRQxDUIlfmi0kRxxO9E=;
 b=adAQ86t2E9Pn6umm47Qn+rUyfPMy/OFEixbhV9nt3P7UFwHbRLRI7fNOuINyw84yMC7CwDYRk
 g2c6AIttcVaCAJIZP/EIUG6prgzQQ06VhHUwO/PmytSB5CscdM7y1qt
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 1BB2753EA7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107537-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Similar to APQ8064, cpufreq is enabled with this small patch series.

Tests:

// Show available frequencies
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
384000 486000 594000 702000 810000 918000 1026000 1080000 1134000 1242000 1350000 1512000
$ cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_available_frequencies
384000 486000 594000 702000 810000 918000 1026000 1080000 1134000 1242000 1350000 1512000
 
// Show current governor
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
schedutil
$ cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
schedutil
 
// set low freq
$ echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
384000
 
// set mid freq
$ echo 1026000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1026000
 
// set max freq
$ echo 1512000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1512000
 
// set low freq
$ echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
384000
 
// set mid freq
$ echo 1026000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1026000
 
// set max freq
$ echo 1512000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1512000
 
// SAW2 regulators
$ cat /sys/class/regulator/regulator.*/microvolts 2>/dev/null | head -2
1200000
1150000

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Rudraksha Gupta (3):
      dt-bindings: soc: qcom: saw2: Rename MSM8960 SAW2 compatible to v1.1
      soc: qcom: spm: Add MSM8960 SAW2 CPU support
      ARM: dts: qcom: msm8960: Add CPU frequency scaling support

 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml    |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 133 ++++++++++++++++++++-
 drivers/soc/qcom/spm.c                             |  20 +++-
 3 files changed, 151 insertions(+), 4 deletions(-)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260513-expressatt_cpufreq-66638ba8d156
prerequisite-message-id: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28
prerequisite-message-id: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
prerequisite-patch-id: a6ab585bad167db61d13b10c3912018ec94cdfd9
prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7
prerequisite-message-id: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
prerequisite-patch-id: 27c37aa51fe76043b4998137d106689ed5ae6c91
prerequisite-patch-id: e477ee37abf167c55659f5e591b070b176187ca7
prerequisite-patch-id: 9680b63831f2be63607bff2175639c1987af5e85
prerequisite-patch-id: ee275dc3aec6159072d0a9efb66d18468a72ad57

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



