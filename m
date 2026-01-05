Return-Path: <linux-arm-msm+bounces-87573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA6CF5EA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 23:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C59D33043920
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 22:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DE32836AF;
	Mon,  5 Jan 2026 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKoXhy8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092AA4C81;
	Mon,  5 Jan 2026 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767653921; cv=none; b=qFLkNhAOW7FQcl+WcaOEHY7INKBD/WPHMLHl3XfAMAPl581iLo62LZNi/MopiBOwA0t/4Iz71FwuYDBLHK34G9NjjmjdUqb1mjTPYKV2l1Tto9LE7B1o7XPtxpxyeU9PePS8gjdR0lGeDpKDjxr93EAc8TbHJY6y48AExAawRkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767653921; c=relaxed/simple;
	bh=57Y8OhPb0RdZXNMjxm6zVtmsLCS976QesMyxc2EBE3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyBGVOLsvFq+hlRQuJjJFGU+lmLurry7ISRq0xFOEUpSOlwiNzRiqiCk4kzJgzgp1pAw9XasfK3QeRsS5eHhMDnYsm2+A2llkSBBJ8VW6NY+l1bRcgFn3ahOL2jDDlWbtb/vpnfDXhvuD/MTJTZffz08fvS1aKEbcJQKuMLqbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKoXhy8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E28C116D0;
	Mon,  5 Jan 2026 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653920;
	bh=57Y8OhPb0RdZXNMjxm6zVtmsLCS976QesMyxc2EBE3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKoXhy8PphpPNPQyctzXS0XHOTt/dcW1d3000+w5MghP3P4D+HpA/3NvPIWZCXdno
	 Tf7mqXJHL0BMgUe4E2BTTw9KKuXPNGufXSKw/kkxxTksGoTNcdOXERj+H6dRT2cSOg
	 S/4XaH2Mz0bAE750Zw1A0tK8K6cSSvOfI2gQgTj/K0UZp2J91/5yeR0j/w0haqIBvW
	 gtiKwroqz/OluIdw15azPae9Sa9pb0dGYktG5nn+3aT3T+Vvoajs1ghah5Vsw5sM8H
	 l33fBbvu1iOB2WsKxua255VCktaOZ4QjAe68fk/Ts1qTcpUMaQ5OVOI5HtmtyU4/fp
	 PTgXf8OTzNkTA==
From: Will Deacon <will@kernel.org>
To: konrad.dybcio@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	bibek.patro@oss.qualcomm.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on Qualcomm platforms
Date: Mon,  5 Jan 2026 22:58:19 +0000
Message-ID: <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 09 Dec 2025 10:53:23 +0530, bibek.patro@oss.qualcomm.com wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add actlr settings for mdss on Qualcomm platforms
      https://git.kernel.org/iommu/c/f91879fdf70b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

