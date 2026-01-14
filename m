Return-Path: <linux-arm-msm+bounces-88939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1461D1D5E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA6530402FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910C037E312;
	Wed, 14 Jan 2026 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WysZdHt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BF35EDA3;
	Wed, 14 Jan 2026 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380980; cv=none; b=KDLvVqakciOwESGnxlC/+N5aufjgEu71bHNHEBsxCkvVBzN6GLzk/PD32DtuQmuYWksg+nKLPCaaDwP4ocVxF6lKB3c1qkkdfVl9jLL8xsRs4Lh0ihE6iK0fwdkkjFJYCU2Q+DTRh0u5rC4/dqUPV7GeWMal4ooB9WXC47OwvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380980; c=relaxed/simple;
	bh=za4xTPWPWUHIXHkvsKZBi5B8uKsVvVpFvxtO49NYT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEAi2MIyxtxKrvXy/h5qvswvcLWJd+LxDa5e8O1LHxi766JHaO9Pe+J/576TiRUakd+BXM5UO/i/Q68mmvekJ5CNP3OblIp7WLQ1HvblR7Gj6O5lhCBqaEfJqj8dXtOsac+2JTQ6/Tempom4PJtFqpoxyId0nLU4ZuFEGO4eo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WysZdHt5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A930C4CEF7;
	Wed, 14 Jan 2026 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768380979;
	bh=za4xTPWPWUHIXHkvsKZBi5B8uKsVvVpFvxtO49NYT50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WysZdHt5vhuNsDQwGfAAf6lFLKcLvjYpEiZibWBXcfRmpKxMy/MISzgPiklw6n2a9
	 EYN8iCMUsYFuVSIeALm4nsQ9lpl8hQR1irii0HCVFuHgg69M9QiLozEqoVkjF4Y+AU
	 aldxqkX3makv0a84TIohE7NRzOnPq2/IUrnYApitZ2KhtqQ7rXvjIcAvzpsUJ1vFiI
	 Uwtf7rRYDsAaTdOmTZB2CJ4fkQ8BWhH3EXvwOce1m//83ngrge59uS7uV0h/FzOsmw
	 GG320eEWEiRG2Q3GFRRFSs2mjLU+h3lT1eyNReOCD3AFLadRDyxvzKuiSZZPOFBRGH
	 8mWqZ7CXWENwQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfwfk-000000006r2-25Dm;
	Wed, 14 Jan 2026 09:56:12 +0100
Date: Wed, 14 Jan 2026 09:56:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <aWdaLF_A5fghNZhN@hovoldconsulting.com>
References: <20251221164552.19990-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221164552.19990-1-johan@kernel.org>

On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> The hw clock gating register sequence consists of register value pairs
> that are written to the GPU during initialisation.
> 
> The a690 hwcg sequence has two GMU registers in it that used to amount
> to random writes in the GPU mapping, but since commit 188db3d7fe66
> ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> the updated offsets now lie outside the mapping. This in turn breaks
> boot of machines like the Lenovo ThinkPad X13s.
> 
> Note that the updates of these GMU registers is already taken care of
> properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> properties on a6xx too"), but for some reason these two entries were
> left in the table.
> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

This one does not seem to have been applied yet despite fixing a
critical regression in 6.19-rc1. I guess I could have highlighted that
further by also including:

Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")

I realise some delays are expected around Christmas, but can you please
try to get this fix to Linus now that everyone should be back again?

Johan

