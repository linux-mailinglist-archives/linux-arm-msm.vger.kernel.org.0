Return-Path: <linux-arm-msm+bounces-76073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD6BBE43B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783D83A9C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA491A9B58;
	Mon,  6 Oct 2025 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEXSwoYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B43770B;
	Mon,  6 Oct 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759301; cv=none; b=t3UZ6pvFE0QJYV+7RwtzJ8BmiVGa8dxbwCGRhZH29n2Dvy5GBWFyXGjKBJkrvern5QcIlp5Mo/HIYPxb8b8ilTpo2unVxdnt91yOtRhy8txMmG/BzQraMYp5UlNI8pSq+9/t6j4Tgu+xPad5X4ISJW1FM2mFBvIdj5cFBs6xtAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759301; c=relaxed/simple;
	bh=ABqqFmeqDAlhbrH9IOkJtThyT+fAKJdIn7eBS7vRYtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWdfJ32A4X6R3rMJHFu7iEwdGIrGpAdPJNn/NEC+NjoD7IqoUIct3hdbn5mRaWix0/wwCJQmCGMSRh4JZYu7nqc74clCuueaeEjnOj3waCgsvZsCtclzZCE9Yi6GUAz4l2zKUesHl5c3yBUVxGBSFqTlpmxUbciAaNtTQRpn0zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEXSwoYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA26C4CEF5;
	Mon,  6 Oct 2025 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759759301;
	bh=ABqqFmeqDAlhbrH9IOkJtThyT+fAKJdIn7eBS7vRYtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEXSwoYf4qRnBAkMtgQ/WrvDQxF2P+QFIIzlcZLavupMDnUa9ljFpQpxuR8+/asD5
	 ymxOrUWXdPwxg7ttW9tvVRG436dUgBPCUd/Z4VbUFmrtDCjYw/Y4N+jKjQWVfq/yUK
	 51pLaCwKCeotgyLPi3Sl7uNkOaWWy9b6NxnZFO54z0ztiAd2dyc5430uChhX+3n4/1
	 vttPwceFL+gxEuc4i3fklR/MpJzYxZ18R/Q8vewECgzzN3HjU4Jxg+roONgiJq8/H7
	 7EWSQ988UP385MTWmI6gMLdB9RyXREhm6OSjN99CGm+aPWbT13QaDzH3qlVr7mrnUu
	 RBl/CaIY/Md6w==
Date: Mon, 6 Oct 2025 15:01:35 +0100
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ardb@kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
Message-ID: <aOPLv_-f5sNGtG4e@willie-the-truck>
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>

[+Ard and Mark]

On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Historically arm64 kernel contained (almost fixed) value of 0x8000 at

0x8000 or 0x80000?

> the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> in preparation for removing it entirely") and then commit 120dc60d0bdb
> ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.

Given that we made the initial change over five years ago, I'm struggling
to see why we should start caring about old broken bootloaders _now_.

In fact, I'm far more concerned about changing this to a non-zero value
and having more recent bootloaders misbehave.

> This caused no problems so far, because nobody seemed to be playing with
> the extremely picky Qualcomm bootloader as used on some of Google Pixel
> phones. Current attempting to boot the Linux kernel on those devices
> will fail to load on those phones with the following message:
> 
> KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> Error calling BootPrepareAsync Invalid Parameter
> 
> Since the kernel ignores the field, set it to the expected value of
> 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.

(same typo)

> Note: I purposedly didn't add Fixes tags, since those commits didn't
> break any of devices that were supported at that time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index ca04b338cb0d173f6d9f5bcee52f6d3d06552599..05e874977de376835625f52bfdda78305dca28b5 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -60,7 +60,7 @@
>  	 */
>  	efi_signature_nop			// special NOP to identity as PE/COFF executable
>  	b	primary_entry			// branch to kernel start, magic
> -	.quad	0				// Image load offset from start of RAM, little-endian
> +	.quad	0x80000				// Image load offset from start of RAM, little-endian
>  	le64sym	_kernel_size_le			// Effective size of kernel image, little-endian
>  	le64sym	_kernel_flags_le		// Informative flags, little-endian
>  	.quad	0				// reserved

Could you wrap the kernel Image in your own header to workaround the
issue?

Will

