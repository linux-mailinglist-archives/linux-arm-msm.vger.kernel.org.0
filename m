Return-Path: <linux-arm-msm+bounces-70241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A6B30E62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7191D1CE0EED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C112D47FA;
	Fri, 22 Aug 2025 05:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CD4BCs1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28666279DAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842393; cv=none; b=JhPnCZq/AolCWtxOD8jHzzSbf9+WbFlPwc1GZpbvCd1c4HKvfxNtRnLsyjqMazWeEDGomvZw4LYDWSWHiAc6GlOiIEOdh/VH/79LAMELzHUZ+PbBBt6hsQi3pW3x+tX5QdDXpTLMVJEizuSpfmI3/D9fuD198dZjIIJraX9AxM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842393; c=relaxed/simple;
	bh=Lv4OXvThRZ3aaC9Yk63c3r3UXiEApaGmTnynlaWwLlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9EIDfEAfuZYbYiChijifmD5kFut82Opb+tTgqUw8czFyyrQvWIZV/+a/3nhP5ygV+iPpKsHbGGVhaTh8ZW/2zNKfdU4IJj94VHGDvUdlUCshXTH5X+tP7MYUI9iIsItJlj4fSHwt1KK47IyYcpcFnN4dXJT1FKfiAwDP9lHGGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CD4BCs1P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=muTL
	R+uO1apVyAZkBbYYZe6gE3Jd5HWWcO3c7R6cA9g=; b=CD4BCs1PRkjTCCYhPycc
	34kdjEOjYanOh4U654+aGn6BZHBbuPF+jcC/cv2aS8DWV8Jct4EOIkwCUOs0WgHR
	seR6tPavlBgjL3wwmOISzO9W8uvnhAJHNUDRBxm9pN1dgVA4fdyTjunEhDCnUokO
	tB00CVhfMFWHhQFHD9kg91SWyAdPqZ7J6pkoslduLsz/z0M74LR7DRpikfxMuYt2
	q6OmOHPTWk+doXL6W57nrnVLbA53X+sSSnl1a/j0gTKB8/gaEo4t6+3HReiK0Rjj
	pSHe2u2FILIEH55eX2T0BF8My1ZxsW2P74nrg0vyNFnzpHHZUKfn4Y2OEMkK3JDt
	2A==
Received: (qmail 3778719 invoked from network); 22 Aug 2025 07:59:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Aug 2025 07:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@KHGr6e08GtDUtcd1
Date: Fri, 22 Aug 2025 07:59:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKgHUXzK_iSfjP7Q@shikoro>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
 <aKeTq1lJ549a2jnQ@x1>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKeTq1lJ549a2jnQ@x1>

Hi Brian,

> These all look good to me.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Thank you!

> Should drivers/clk/sprd/common.c also be updated as well?

Yes. I wrote in the cover-letter that a few occasions couldn't be
automated with my coccinelle script because of the indirection. I will
fix the remaining few ones manually, but I didn't get to that until now.

Happy hacking,

   Wolfram


