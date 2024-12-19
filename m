Return-Path: <linux-arm-msm+bounces-42785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A549F7A68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 12:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D59FD7A2B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 11:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D26223C7A;
	Thu, 19 Dec 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GenVSOh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF5223C6B;
	Thu, 19 Dec 2024 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734607827; cv=none; b=aV3hJDIW0X4vBMRPK0tN4qO3qt9WbCjAykaRwfho1c/A2Lddw6YBzriHPpTNdxU17wpjoHDf2AZqx+QHFZLDPzAJz/3hM7PzN6keuJq6OXuov9Y1UWeKbooxpjgjcMTfNJTlIGlaDe0LCLw5vuQtNjD9w9CBkrnZe10UerXNfRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734607827; c=relaxed/simple;
	bh=WZy77EM6Jp2nJGwMoUPBoqtGUEr8RfDUcV/Dtjbg0I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjOT+izdsAUaUFSGBaoJqorJJgcOHCRKMOXARq9tbqC64HQZhH9WDUgmqNJoqywws5fuDtEjrqjh1maThGtJvqX6KB2ya/9CJ1gPHzocCGm0L4u1cftAVaSPb4HiyedWTCrSyzAIpaH4yJ238+MsqyFYqu3ppEXJdKz3xjs/XQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GenVSOh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE0C4CECE;
	Thu, 19 Dec 2024 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734607825;
	bh=WZy77EM6Jp2nJGwMoUPBoqtGUEr8RfDUcV/Dtjbg0I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GenVSOh3XU2e5AJnorSRRSioUtijToJOsGApMyITwDhvgZ4Y4EzR31hUh2NONg9Rw
	 Eqz3EUsbX6qb+azS7mGCxt5h1iaVKWzB+95c1Mwk6ZgmBP8x0ayOqIL6MFbbMkhDcL
	 lbamqngDPhxrUjnsUoeZjwAVjeQOPIqkXxQhZ/LC1f4G00ve8AMeF3q4LoUt+p/SS2
	 OERqcx8zxSWh/ez35wO+SJFPDIYgtmRX7PW84+/udhueRPSrPysLaaZBM7Jz6MYQOE
	 r9y0oHXrycr7RVDQBN0uA1xAlVt6645p0qVtsY3KE2DsL0Uk6jO4KC6UHu3//Us+wE
	 ICW5uOqkwoalw==
Date: Thu, 19 Dec 2024 11:30:20 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20241219113019.GA23640@willie-the-truck>
References: <20241216171017.4881-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216171017.4881-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.

MMU-500 has public documentation so please can you dig up what the
actual behaviour is rather than guess?

> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the year.

Sorry, but I don't understand this sentence.

Will

