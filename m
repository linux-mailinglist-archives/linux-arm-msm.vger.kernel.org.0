Return-Path: <linux-arm-msm+bounces-31444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542B974855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 04:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C06FB24D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 02:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55B428DB3;
	Wed, 11 Sep 2024 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPsBjSly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C560161;
	Wed, 11 Sep 2024 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726022982; cv=none; b=cOEJk+RhPHel9IL1kVP5sKO8NKAto4zFhGI3cTqmRlVQRIf0Tq69kPFHsSxGFGrWD1LtS4fYWUlbo9kvf3KDGwilgcxlVN4woeFHMxcOMKwSuqjkDkSQugFmnOw+VffiROomp5drLho737sXl6XXnQuPhaKKdwDYVk7Lz+x56tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726022982; c=relaxed/simple;
	bh=bF4oV0nKbMeRxZj7ImVrHIdlrJsuV8VUv4ujLjPK4c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LONFXKNHE/qOQcKIibrkLOhSSVpYQDya4fKAOfncjXwnbsVTklSciV1d/13QlOgG+bnv9Ko5u8jwG6JpRVKLbwXMYT1dYf7f+Z8c+v6BC/2gPkCN2Rhk9wA/xDkLULCnhohJShW2RnLzuCwzOWutXBZ0BePGC6i3srO3aL492+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPsBjSly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EF3C4CEC3;
	Wed, 11 Sep 2024 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726022982;
	bh=bF4oV0nKbMeRxZj7ImVrHIdlrJsuV8VUv4ujLjPK4c4=;
	h=From:Date:Subject:To:Cc:From;
	b=KPsBjSlyKgVbaZFX07Bi6d/goO2GxexzXKLtoMRRmcpeoeXCPzP774XsIFxbpOnP+
	 PIm7lVZR2HFf+q5k567hrJ5joVwbWCHlAHXBu0A+i0DUOrzmZ0dXyKnbH4IgT4zajH
	 XWgrqUTbOYBCbj0wFDGmgwVS/aBGbb6FBF0+Rw21W5+WP73ac6M2YIN21RdKNX0/Hn
	 xXU2dYmP41WbcSzhM2KWHAmWyDwVNUT0ZOqPvMFZ0qVNcliVKgwqur3c4uvaRspNMQ
	 rDNE22D9nMnuE+A1I+58mEXtAq1H41vt1ZRT74sckWFERkaZ37LP+WUIbW514aE/Fj
	 PWrN9HfZ4BlZA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 10 Sep 2024 19:53:16 -0700
Subject: [PATCH v2] arm64: Allow packing uncompressed images into distro
 packages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-uncompressed-distro-packages-v2-1-51538434787f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABsG4WYC/42NQQ6CMBBFr0K6dgwlSlpX3sOwqNMRJsYWO0I0h
 Ls7cgKX7+f/9xcjVJjEnKrFFJpZOCeFZlcZHELqCTgqm6ZuDrWzHqaE+TEWEqEIkeVVMowB76E
 nARdD64+eYuudUYX2bvze9JdOedB+Lp/tbba/9E/xbMECuoCI7oqewvk5MXLCvY5Mt67rF0hQL
 fvKAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=MrV3DTe1I/Mq8IiG+MCg4vdZxH24zTV3GQvQhnWmX6I=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBm4QYjyua5RITv0VOVy7VAeQ4Aok86nofTge7xL
 CnkNTtRHQeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZuEGIxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVOrhAAlmP/znChC53rICaPQT5g236Owtvh8FkPrPW1nhY
 +S6hvWSKBsYPR3TN30uEFnOMCBkLIyumShBKJnYnScJJHVXkOIzllh/haPS+vAiqG58TgQZGBR5
 6YTSUEL4l6sK2tfF+9FoHojMpueQfCFInUvfQDu+PXka3/oyy3Q6RZEr8uxYbe9OYj92iPLCSPP
 YyEJminFv5Sk6DLCe/a02mmvdzkp4/Kcki/+rc2K53Rbv8AVdVRzY+FOmZ1pIg0mfhOFjb2nojQ
 VYOkKWk3jHtB7IV6enxpg+p5CzJgaePrqD9zfYA2mN1GvUn/sHWtVBJ3miPp3AthbIVm77+6VNV
 iiaFn+T646l0st2eQlvJjZ2lB3Nt9Tfl6GDm/16+Eagn/1GtGk17993CfEqO7B2PQ+IUhbTTBv5
 674gTkJpXoL3QIkGKQjPchTtY9lKnKffKoh+PWKST/EnrkWi9DJGT78jiLAAwLcel0iV1fbP66G
 EkFSf5wjtEYG1PRv4dIDRv3gNOgwWBrNDcHFWYxP41gu3iZuYAqtcCjqdr+TFOkPAr4FC1Pqivc
 63qxzoT8SG2tlSywJ0J/aLwi+3Jv0Nq4CzUBZkdpOBg8OC1wLn6alxr8I4xwBtjwapQFfRDPPbx
 yhftgCrCWN5BVDQpszOk855IvmYz/RsqzEFRs+Xfiqdk=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
the compressed kernel image, which means that the kernel once installed
can not be booted with systemd-boot.

This differs from the packages generated by the distros themselves,
which uses the uncompressed image.

Use the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
selection of which version of the kernel image should be packaged into
the distro packages.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Changes in v2:
- Restore the install-specific handling to retain the behavior of
  installing the uncompressed "Image" under CONFIG_EFI_ZBOOT=y &&
  CONFIG_COMPRESSED_INSTALL=n.
- Link to v1: https://lore.kernel.org/r/20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com
---
 arch/arm64/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f6bc3da1ef11..3d9752e56109 100644
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

---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240819-uncompressed-distro-packages-8da6959ed698

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


