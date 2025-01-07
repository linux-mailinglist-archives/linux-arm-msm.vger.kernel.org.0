Return-Path: <linux-arm-msm+bounces-44160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F921A0441B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEDE37A0419
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BA71F0E51;
	Tue,  7 Jan 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDKST+jn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1B86321;
	Tue,  7 Jan 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263201; cv=none; b=IH6lekfNdJ3V28OnWXwHPpx5oR5p7sdd2DSA+7Zkp5ClsJso3ySvDYHam/SNW5+E4fBb7kKJn+Sv4Kl+QrydznqZlZFn0ZxO2lr/22H8o8PfK/iAH6QkghuF4lVQxkt/LGkh8PiaIUGNZ0mhYcSWxsKoxuD3B+NsWnIUJ/rFpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263201; c=relaxed/simple;
	bh=HW5UP+Hh2z2a22Lx+HwnvhXepcphCb4HK1NIWFN1HuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8kd4sGl0IPDLpx48hdn93QTq+eyrZGDeb7fwDAYLIIJB52Bsi6MqI7/oRUEDeFpY1JjpvBUu+dP2N3baQ+m8stdLhi/7zTHJ2enDEJRuBYPcZRKM9CHaiGh2I9H3IU2+XnigTbeeaCg/XqbuHIEGrmhO8qaFo/3q9LXzlmEDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDKST+jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE55C4CEE0;
	Tue,  7 Jan 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263200;
	bh=HW5UP+Hh2z2a22Lx+HwnvhXepcphCb4HK1NIWFN1HuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDKST+jn66IN7CqV7Kww2DUrbI8shNCa41lebRHzR1NDPBLqt+t+PxQj1y72pHYe2
	 /IgZg+/Yx1YGcuCN2yJc1MZp854BuAyK9Y0jitUNZo5WcwksYZSAuK77tRRK2/mfeg
	 K1L8870o8OAY4u/eUTJQi4oCX5tlLOdqeCm/BUyI6MqVDFQtC/eC3bgG03XF25/nlv
	 vTttlFQL77zUIXc5FXvNflBt326zpSyLaSfee4QkMDjXUsM1l8zA+KMZvRDkH/yHdZ
	 BF7/cTsRtEkiNAqYCkHQTenlpkTR5DH2ChavbXaU8al6mo1setNVliE9KNVd2uCaGK
	 k92GtyZBwseTg==
Date: Tue, 7 Jan 2025 15:19:54 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo
 cores
Message-ID: <20250107151953.GB7368@willie-the-truck>
References: <20241219211131.2389091-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Dec 19, 2024 at 01:11:08PM -0800, Douglas Anderson wrote:
> 
> This series breaks off of my series that reworked Spectre BHB
> mitigations. Originally I needed Qualcomm Kryo IDs because I was
> adding "guesses" about their Spectre BHB mitigations. Now that the
> Spectre BHB series no longer has guesses I don't need them there, but
> these two patches still seem worth it to land on their own.
> 
> I've still called this series "v3" because the first patch was part of
> the v1 and v2 of the previous series.
> 
> Link to prev versions:
> v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
> v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org
> 
> Changes in v3:
> - arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
> 
> Douglas Anderson (2):
>   arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
>   arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
> 
>  arch/arm64/include/asm/cputype.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Can somebody from Qualcomm please provide an Ack on these patches?

Thanks,

Will

