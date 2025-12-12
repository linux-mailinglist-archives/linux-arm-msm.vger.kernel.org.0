Return-Path: <linux-arm-msm+bounces-85085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF0CB782A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB6D301F8DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55428272818;
	Fri, 12 Dec 2025 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jm1fRYX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438815B998;
	Fri, 12 Dec 2025 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501626; cv=none; b=gwU8mIb5tUKcmcnVmAQv0/NUES5VWFKUkcMQxpmFM61zxNnw17CXx5rzJdd47EbThsHQgjMi923sMWjQf7RRBi/TZl6nxIIcIwKoJ35OzCjxSUlOcFhKlmwYvRtHyyxZX1Amq+5t+ZbmfmOp1tSEv8rTVrcgVN7scJC/DmvaHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501626; c=relaxed/simple;
	bh=9daQRw9I8bfVj1VxjeMWS5JxcX28mNqfUuqiEktzN1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnuhZgjOpEYtOEmqZLET2bo2VclNxJvuhDkAGZn9EZPBCNUaOKaMtg/VSzIPTRb2PJhgq7k2xuIsqyEgruh5h2G16ZCG+UHgZvAcS3vDvnKBah2yDfjdh2zVB5qKB0BR6n8ILrCYP6RlooSoeUj+PCpBJV7xASp0bwv81Cy4ZN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jm1fRYX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86DAC4CEF7;
	Fri, 12 Dec 2025 01:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765501626;
	bh=9daQRw9I8bfVj1VxjeMWS5JxcX28mNqfUuqiEktzN1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jm1fRYX5J9y1p0yOvJrfBYf4/hd0dESxfmW7vDqaAc1X3neDwqN3809HnUf/FF8cH
	 SLb9Fcm7bPaOSBdK4i1dkBvxxuIT95U7n5LO7G+eGQ+Os2LtK9D6NO55np/fwGH/vQ
	 hgTRPyTfTu+TQVGtWci+ggqk/Iul7+t12c2DHYuIAPmSg32UUCigv7dI5WqDgdaYL6
	 YXoGwebP0G7A5tYAe/Hmcc12I62Ir4FbA6n+TBSUpi/ujj9fwGhwNf7kjRlW9yXTm8
	 /TBW753OGQgISF1ePuT4EkTx7gJIvGLeZGY+hhoB8qMGp9siI8GCWGl+ZA5LNnb0h7
	 SX+MEtjBbeIng==
Date: Fri, 12 Dec 2025 10:07:01 +0900
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mayank Rana <mayank.rana@oss.qualcomm.com>, Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>

On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > 
> > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > authentication requirement.
> > > > > > 
> > > > > > Current image format contains two sections in a single binary:
> > > > > > - First 512KB: ELF header + SBL segments
> > > > > > - Remaining: WLAN FW segments
> > > > > > 
> > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > headers in a single binary:
> > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > 
> > > > > > Download behavior:
> > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > >           2. Full image via BHIe
> > > > > > 
> > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > 
> > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > 
> > > > > What is standard about it?
> > > > 
> > > > The TME-L requires standard elf image format which includes single EFL
> > > > header and WLAN FW segment.
> > > > 
> > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > required for TME-L image authentication, how about using 
> > > > tme_supported_image?
> > > 
> > > Just elf_image?
> > 
> > Is it too generic for this specific use case. Current image format also
> > contains elf header.
> 
> upload_elf_image?
> 

Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
defines that an ELF executable can have only one ELF header. So I'd prefer
'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
used previously.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

