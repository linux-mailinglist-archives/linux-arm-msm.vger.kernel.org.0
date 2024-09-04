Return-Path: <linux-arm-msm+bounces-30636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272E96B318
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FB90282F0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FC1147C71;
	Wed,  4 Sep 2024 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTwHTsKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0632146D6F;
	Wed,  4 Sep 2024 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435800; cv=none; b=HlvOyxD0MYnDxsBZhXGSLy8HiQOzZKHstRxcKWKjbe2WDzjpmlZYMJf2ciRhydWsVdTH0tz/6BmSgdoJrUuO+21mf+orlG369boo1aPgo3SPXhLOjZZZ2BiY7QJVtcxwmYQKaOv+KfJz1M29Lp7CCQnhc11Uvf1VNSW8BqYTXS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435800; c=relaxed/simple;
	bh=7Z63bOR1fY9qwqSNIp920ir5fJ8AiMMISMSGccEKkt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg7hpGEpCgD21IMfuoph8gr6Oh7Oi/6ZUwWbRnvvBb2zeO2nN9jeTnWo6ihJusYEtMD2657KBryvXVgyRXhs8tD4R6Lr8ejSzsfi7zlJbOpXpVKSP+fYsWxdlxmXakMR9NPKougoTuw5OMafxQcJlq98809vYXDvEIeBbeENqc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTwHTsKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4CEC4CEC2;
	Wed,  4 Sep 2024 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725435800;
	bh=7Z63bOR1fY9qwqSNIp920ir5fJ8AiMMISMSGccEKkt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTwHTsKmjWJjApHg0lMnhr8lI0VPWdP1grV6CczeinyyraCuQSp1aSmQvkUqjw6kF
	 ytP/hnYf8e/UiJglJznOMAP7NLMCl85ROv/1Ew3kl+Dflare6wiXrOdT8vRjNXBs6v
	 ksKsk0zSEeRbHrWMkzsC7Js8/BN3uYZgQHGeGBEGOTTAfOvIR7MONe8l0mFRZP81l4
	 fK+udSjPEDA66PtjqqFeSON+8LXbwmHsC3KTTylWosIDUT3lv/3N58QAprLOCU/O+E
	 5K89V6PIUsb4bzBTxR+OeyEf1S6RhKDQGQTuuk/cMGZ6s+dD84qDNc4Oix2J0RujTI
	 CGnZTGq9ee9uA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkfw-000000001r2-1PXm;
	Wed, 04 Sep 2024 09:43:37 +0200
Date: Wed, 4 Sep 2024 09:43:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	andersson@kernel.org, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: apr: Fix some parenthesis alignment coding
 style issues
Message-ID: <ZtgPqJHnQYd7Jm_z@hovoldconsulting.com>
References: <20240904054735.7952-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904054735.7952-1-riyandhiman14@gmail.com>

On Wed, Sep 04, 2024 at 11:17:35AM +0530, Riyan Dhiman wrote:
> Adhere to Linux kernel coding style.
> 
> Issue reported by checkpatch:
> - CHECK: Alignment should match open parenthesis

This is not something that is part of the coding style and just an
excessive warning that that checkpatch issues when run with the
--pedantic (a.k.a. --strict) flag.

You can use that flag on your own code if you prefer, but don't send
"cleanups" like this for code that is already in the kernel. It's just
noise.

If you want to practise on how to create and submit a patch, these kind
of patches are accepted for code under drivers/staging however.

Johan

