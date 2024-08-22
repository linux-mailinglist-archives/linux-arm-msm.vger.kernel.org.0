Return-Path: <linux-arm-msm+bounces-29317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51E95C19B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 01:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2E11C22475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 23:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18713186E5D;
	Thu, 22 Aug 2024 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll0/dhFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E193D183CC8;
	Thu, 22 Aug 2024 23:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724370693; cv=none; b=QzhGAgEfeB4tGhZhFHyWFHlmSvmaldMjaTNuVE3bOEujPfgAsiN1xqM0d13YfkY7n7kaWSnegmByN/WrcPVAmzsDzxY/dYvSR2hLWqY7E1HWroyBARRXx90VtUCP2FfdBpIaM4eVEGZtR6SoWd3p3AKBMCa8kj3uVglNK1uPMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724370693; c=relaxed/simple;
	bh=9+QDfJ7Nji+1rQiMAkPeB7cowHiVfIKcDhXZ7rUw948=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1qF+mAOyYQAn73dF5831g4Kwmoem6LD6R8XeR5gVHC5P4c4goIGLeE/jbuWBs8RHNX0puqY1m1fg/n0fp22onTIJA9Phq3FkIhdbDfM5olH4tgAGfmzIRslqyimxxkA2V48Y56kDgi7+MsqfAjBM0U8fAP1pvyfvqKTM0BIsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll0/dhFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E2DC32782;
	Thu, 22 Aug 2024 23:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724370692;
	bh=9+QDfJ7Nji+1rQiMAkPeB7cowHiVfIKcDhXZ7rUw948=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ll0/dhFlQlylb4Pn9kMEqdk3/QF9o3mbtVOmnew9/gKE3vJTTrHchqi9NJCS/jtR8
	 PjMgkvh5gj9mnsC5FiHqiGFka3YAXBhADn4M/rRwVVtwXHFGF+W3oU1AqM9KbL8Eg4
	 OSfDGW6NTzcPsAXun1/1llvtHSUr1AwiewaJoWVjEv49vFWEkAczH5K03biepcGyqv
	 neLZ1zY3UlzZUp0fzDMifafPP4dA6OmzdA2rkg2IqA0K8xYEHXQ4PNDGaBqDJLMnxa
	 NMsNJBQHduwI/021oSBboU8xTjenl+VX82UVvO+qpP904oupdqpfRjT+cBGhxWT7vt
	 m0tX7DWKmHZJg==
Message-ID: <85161bf4-543d-4583-9cb8-1ec43f8250a7@kernel.org>
Date: Fri, 23 Aug 2024 01:51:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Allow packing uncompressed images into distro
 packages
To: Bjorn Andersson <andersson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 5:11 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> the compressed kernel image, which means that the kernel once installed
> can not be booted with systemd-boot.
> 
> This differs from the packages generated by the distros themselves,
> which uses the uncompressed image.
> 
> Expand the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> selection of which version of the kernel image should be packaged into
> the distro packages.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

