Return-Path: <linux-arm-msm+bounces-60119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFFACC24C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9886F3A4E59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156381917ED;
	Tue,  3 Jun 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIxvxbKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50941A08AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940382; cv=none; b=NGfy8MKrX0SPJu4ESa+pK2S3dmPrUnV6TK/gf0R/nENa1t6aNrQm7kDmi9mWhe5WrQLSRT6M5dcfs8/wFJBPcHXHjxqQBfKb1RF4YhVBHcTn3oZIlwwkSIlKpU2fUE/Jj1uaouBMgC8HvDpnGdoC4OtxQkpeugXUYHEfADPdUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940382; c=relaxed/simple;
	bh=88ebPq8yyoMl4IbSe4Lw/wi7y5HfoSZftTdxZSPMfz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFd9+4PMBmjZoNftYTexGpA3KNMvNPTgrEvMg3WUPmoFJYNCTbkQnsh7UQLSghMyLgcLV9cnQD826uzvD1lRNtsrIUZBfRXrlniFm6swaAAd/3aT7fZnwWAabNjRq5zUrjYHdDN0K19NX8CJ7I+N3rsYnQ+3neQPrMIICD8jnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIxvxbKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88837C4CEED;
	Tue,  3 Jun 2025 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748940381;
	bh=88ebPq8yyoMl4IbSe4Lw/wi7y5HfoSZftTdxZSPMfz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIxvxbKgHKSmgJsQ/kKvQXIvtmJ2kbMn9t9mUGwZQjA+NQ34z/EXxsd9DNCzYH3lf
	 sMAEs8of48w7ZmVniPvhkbszt6M6EE8WMxoGSQnY8QtC5N5dEhMY6u5JAL6QmDntIq
	 5MrQY6HORI3SnHNSqT5v2qGDvcbWCEsmnjWBHKqH4Trfpoaz30TK6dczjgDfxvmEqN
	 F7Ae7ngkhPnXxKsXm9oT+AD8cyw/Dw0LzSks01QUsHv1h1VMQMEicwg6DPhIsdjh24
	 Mw/GoQfiqgMAlKy8nCdbkMmhpSUSVifaI+Q0+wqimJHvhJU4pXw996EhR4a771FDOd
	 +BfIiJ4U1G3FQ==
Date: Tue, 3 Jun 2025 09:46:15 +0100
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	George Moussalem <george.moussalem@outlook.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.16
Message-ID: <20250603084615.GA1728274@google.com>
References: <20250520024916.39712-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520024916.39712-1-andersson@kernel.org>

On Mon, 19 May 2025, Bjorn Andersson wrote:

> 
> The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:
> 
>   soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2
> 
> for you to fetch changes up to 936badf282388be78094e55bd5e2c96f86635e48:
> 
>   docs: firmware: qcom_scm: Fix kernel-doc warning (2025-05-19 18:04:28 -0500)
> 
> ----------------------------------------------------------------
> More Qualcomm driver updates for v6.16
> 
> Allow HP EliteBook Ultra G1q to use QSSECOM for UEFI variable acecss.
> Add missing compatible for IPQ5018 TCSR block. Fix a kernel-doc warning
> in SCM driver.
> 
> ----------------------------------------------------------------
> George Moussalem (1):
>       dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018

Why is this commit in here?

Where and when did you pick this up?  I don't see anything in LORE.

> Juerg Haefliger (1):
>       firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q
> 
> Unnathi Chalicheemala (1):
>       docs: firmware: qcom_scm: Fix kernel-doc warning
> 
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  drivers/firmware/qcom/qcom_scm.c                     | 1 +
>  drivers/firmware/qcom/qcom_scm.h                     | 3 +++
>  3 files changed, 5 insertions(+)

-- 
Lee Jones [李琼斯]

