Return-Path: <linux-arm-msm+bounces-29032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2463957BC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 05:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E10E11C23B23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 03:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971E31BC58;
	Tue, 20 Aug 2024 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUNMnkTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF533F9;
	Tue, 20 Aug 2024 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724123268; cv=none; b=KLGuWsgWY7W2XY7tkvJImzdxk72UjyD8zb5LO0aS7fhLgRVEhRFlHQgZ3NWA47934/lNOmoZffYjSqVNG4vzdabC/rWMcPFsmZH12/ai3UuFlYPE2DgGv/qB4oNGbwlFMZs3vu5sdwbqswNxZhkyAAb95gBKaxHq217Zy/TELDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724123268; c=relaxed/simple;
	bh=/Axwd6v4J3R0M1uVLGMjdtdRPmKmwT6RQHIPaUGm6QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EvtzHeA9TNZRhQWzx2Z3MY3KBwhtlmblTeIHhKIyjpL4LXMZiNT0957X8ue8r7oZpmAEANna6Fuecwe66+0HdsYUKDlAG/RDoN0nprONtlNNrEUNprdrGOMdpOvRRFufXjZLQX8DBpuoSWvnsAylo8T0EIto/387BIBnbSXr1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUNMnkTh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A54FC32782;
	Tue, 20 Aug 2024 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724123268;
	bh=/Axwd6v4J3R0M1uVLGMjdtdRPmKmwT6RQHIPaUGm6QU=;
	h=From:Date:Subject:To:Cc:From;
	b=aUNMnkThZD3ifTu04whxjYzNoBqMuoAOZk48Zc6g3AUtYWEG6IOK4k7vKA4iXjI6c
	 0ci8rWdBsQhT5E2pHPbz9RlaG1/VvUamv1vZjsiHQO3eE73nBjTlWpgCOVsk/GkNVZ
	 Xq9nzllGtKPg19CjmRM0WmsiiD8mLWlFxN5BjdVvl5D1PaWh5C2HjiBVnDy4lNalo2
	 MX0uEXx5R/r2MzRecnF5nSdI69AL3Cdhsn4b73uYxtCuDxWM/c1r4NFdGzhhYsXOF3
	 GFe9RcMTCgmWQFeFJIs0osXk7WCMCLA+k/26lK30Dkn6AWM+ULdHCoKxFxqAuiR5jl
	 SUxXPlbRI6ftQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Mon, 19 Aug 2024 20:11:58 -0700
Subject: [PATCH] arm64: Allow packing uncompressed images into distro
 packages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH0JxGYC/x3MQQqEMAxA0atI1hNQUWm9isyiNFGD2EqjIoh3t
 7h88Pk3KCdhhb64IfEpKjFkVL8C/OzCxCiUDXVZN6WpLB7Bx3VLrMqEJLqniJvzi5tY0ZDrbGu
 ZOmsgL3I3yvXth//zvLMIoxhuAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=bvOxw2747Tbs7BVukVhYfFrC+fslcUhZqtC3yXHe77M=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmxAl/EUyFFWtnQPr+MYx58NwUKEYRipWXWoHYJ
 jU3fk1xmBCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZsQJfxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVd0Q/+NZm/hJzfpYFRs7ON4nGrPu9frFuWNqoVujZuLU2
 xUmAfCMZb+rXSmIYf/o//afVDa+X8AWrsZX4Hzph5hAaY97fJKd73D1Bol7z75p+5nhKSn/88f/
 DnI6LwBNyhZrgsJOStEKAkM00kvXyaX6/tDe9nXNG6F/121ODeaQ/sNaF+PKpm0lXU26mp1z1BG
 E2iYk4csGk4YO8PGMh+DQA7GHL2uvHnM5H3yyZNaPlVHtVda5x1/Cy+Z8z+2FBsdzDF4Uccd27A
 NKrp01mhcIJQR93TQPHODLE1Unh5BlkgPQlq97fZ+mQSyzFoDM8kqTsOIQKIlNltUepJHYc00mU
 aVX31BAotTlafbjIht3lpGyIOOmOaOOUj5HeOB/sRSGE1kehlGLiWzIANvDf40+DT9hwl0zNKQ2
 CTs+t5aJn1SkKtKel7YSg6F7RdcDJcZ2q+Fo0j8+5hwdi9bc008IYHihSkYI6oU4tiX4CNZ6bxT
 u/uiJ5Bvo6nYIivYGlhnZeFpbX5T7qC59t276GOXkyYKSTeD+D62QLFX1AO00cDVGAYlEN3evy8
 HdJkz4Ugt/gdS/yQ0rcUZp+08GOCKWZh3NWHdJAh3knn4EsPr/nMCJdymbgkUhxrbbKjGTDo/az
 scBt644e+/NP3uPNTw22QmUtnCV+vso3WmrkW117aFak=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
the compressed kernel image, which means that the kernel once installed
can not be booted with systemd-boot.

This differs from the packages generated by the distros themselves,
which uses the uncompressed image.

Expand the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
selection of which version of the kernel image should be packaged into
the distro packages.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f6bc3da1ef11..7bb9a0a5500a 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -166,9 +166,13 @@ BOOT_TARGETS	:= Image vmlinuz.efi image.fit
 PHONY += $(BOOT_TARGETS)
 
 ifeq ($(CONFIG_EFI_ZBOOT),)
-KBUILD_IMAGE	:= $(boot)/Image.gz
+  ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
+    KBUILD_IMAGE := $(boot)/Image.gz
+  else
+    KBUILD_IMAGE := $(boot)/Image
+  endif
 else
-KBUILD_IMAGE	:= $(boot)/vmlinuz.efi
+  KBUILD_IMAGE := $(boot)/vmlinuz.efi
 endif
 
 all:	$(notdir $(KBUILD_IMAGE))
@@ -182,13 +186,6 @@ $(BOOT_TARGETS): vmlinux
 Image.%: Image
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
- DEFAULT_KBUILD_IMAGE = $(KBUILD_IMAGE)
-else
- DEFAULT_KBUILD_IMAGE = $(boot)/Image
-endif
-
-install: KBUILD_IMAGE := $(DEFAULT_KBUILD_IMAGE)
 install zinstall:
 	$(call cmd,install)
 

---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240819-uncompressed-distro-packages-8da6959ed698

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


