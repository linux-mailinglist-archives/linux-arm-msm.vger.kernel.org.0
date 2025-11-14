Return-Path: <linux-arm-msm+bounces-81812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CCC5C15D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9043B1BF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA9F2DCBF8;
	Fri, 14 Nov 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isuJfJxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D823741;
	Fri, 14 Nov 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763110275; cv=none; b=lDlZxRhFgj0VssFdoOrnfQc9w4gVw+JQ1i5QVDH3IV7vgj7qzJ9NTeDq7z+8tI7wTjSoNMgldhG9124XDmeHXRW+mweb1uEcBbaEqA4a5fFOrK9nPXwm12D7eLCVCvb0IAm7aVG8zPkaT/Llx3dO1sI/Dch4lFulnRyVFDW/oiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763110275; c=relaxed/simple;
	bh=GmRqE5RMoMhnQ3d6Sa3aWb28ACAgAslp1jHppTOujPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9+ZUdiHitbSBA5LTRy5eGY8rNAiI1C0M9oqXW+xoip5bsA8zswLM89HB4QNMw0peLtTbCZDRN6gfGYX1X+Dj3JsG6VNXbvLeD+zyx2Jcwh2/xM6xNUxHFrtWca+cxfZrQBJ/+h5J+pdYlN3suF5LAuiCLtkX/Btxu96aH8kqM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isuJfJxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BF9C116D0;
	Fri, 14 Nov 2025 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763110275;
	bh=GmRqE5RMoMhnQ3d6Sa3aWb28ACAgAslp1jHppTOujPc=;
	h=From:To:Cc:Subject:Date:From;
	b=isuJfJxJqTOikzFh3bFFJMz85LRh1QJV2JR4GaeoZ1fTu4SpfqJmR5KcXp4xGW/pC
	 KDA/tc5PVms2QKuCcK2mvJ2pRZFwdB+lSDECTr2DJ9DW/MdlQtPtkLo/0fp//kGy+9
	 AG7xEx5oVJ43nxyeauAwkz1P6ASP/lkmSNE40mpgjSi3AfgwQYq1/3nqf9CqD8O+BR
	 aOkrZAE3dgGVMPbzUdWvx7Xesmv9ana7jFPivGaoI0rlbGFsC1ImaESvM0RWouhBaJ
	 W8n284EY8W49RPglbWphaomNLMArK3D0nHuzGx3Dd5QCT1gJMT1MLst9TUwUCbfP5e
	 qufaUuCNHmAJA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	shivendra.pratap@oss.qualcomm.com,
	leif.lindholm@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 0/2] efi/reboot: Enable platform specific reset on arm64
Date: Fri, 14 Nov 2025 14:20:56 +0530
Message-ID: <20251114085058.2195900-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Vendor/platform specific reset types are common on arm64 platforms as
can be seen from this patch-set [1]. EFI runtime ResetSystem service
provide an alternate method known as EFI_RESET_PLATFORM_SPECIFIC [2].
It should be able to handle these reset scenarios where the platform
specific UEFI implementation will decode the reboot command as reset
data passed as a parameter.

On UEFI systems, it is rather a better abstracted interface for the OS
to use EFI platform specific runtime reset method rather than overriding
PSCI reset method with DT based overrides on arm64 platforms.

[1] https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com/
[2] https://uefi.org/specs/UEFI/2.10/08_Services_Runtime_Services.html?highlight=resetsystem#resetsystem

Sumit Garg (2):
  efi/reboot: Add support for EFI_RESET_PLATFORM_SPECIFIC
  arm64: efi: Pass reboot cmd parameter to efi_reboot()

 arch/arm64/kernel/process.c   |  2 +-
 drivers/firmware/efi/reboot.c | 25 +++++++++++++++----------
 include/linux/efi.h           |  5 +++--
 3 files changed, 19 insertions(+), 13 deletions(-)

-- 
2.48.1


