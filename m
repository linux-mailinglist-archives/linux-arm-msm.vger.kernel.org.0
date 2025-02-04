Return-Path: <linux-arm-msm+bounces-46863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D2A26F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 11:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D9218823C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3043920125D;
	Tue,  4 Feb 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJdZb3XF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A651553AA;
	Tue,  4 Feb 2025 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663734; cv=none; b=ar3OPGAKrvvgHQe8OUwHhCRQYVXp8DJxdi88pFTVM/6r4LqQdIfcdmAjibufTpAp6MtOhPFWvVN4XBXcbGsv6ssCU2i6gDx1WC1gkdNqUW19VQQloyvPFDNrVRJEUngFkjv9EHLugamOQt+/J9bl/PR2X5fz0vImnELBAfmzoaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663734; c=relaxed/simple;
	bh=hoXWheexcnEg36AM8clJ6wt3s6cosncizBJmb2qlc7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eITkxODYyfeIIbXIJTDIgB6nmuPn6xB7Jej3MJySQd1ss2LT6EmwfadLKcbvcJFKgdpE8TaEquFoh6haATJiYifRQn8lVybMf0r5L7AVI/QPZx1sUeORglQ7RHrRp7EBTQ9Jd8YK8gJ3QnwCaoeMQ8DKr9I72zyFcBOfGKEf39o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJdZb3XF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEFBC4CEDF;
	Tue,  4 Feb 2025 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738663733;
	bh=hoXWheexcnEg36AM8clJ6wt3s6cosncizBJmb2qlc7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJdZb3XFpk+gGZhCl0chx1x38DwsHwOYeGc5CO1Xthly7XLWyhrYlq+eDoFhNm+Hw
	 R1arnK6AkvZAsiUvp1/SbX5+aN/uCDtrWjF0uCFHvfuFs8cBvGI2eWFI4iT1pSc4nI
	 gORE178H9xPaBLdZ7FfFv0/XsM4hJJDiil81/y7+w3LgF+iimco5BJDgJWnUCOZD3+
	 EEkLsE1tRMEicLmhqIDGcxWrZO4OrJHTuk0gcOm0PWXcnB7bYcZRi0NvXdhm4xqPt6
	 40k16G1FJz8p9rEWHAjaRvHI8r/ipCP4FSgSzJP0Zq6nng9PhqDzLsn+ASnvTO2Xvy
	 2Xvys4ytf/3Lw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfFrV-000000000Fx-0VGu;
	Tue, 04 Feb 2025 11:08:57 +0100
Date: Tue, 4 Feb 2025 11:08:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support to reconfigure PLL
Message-ID: <Z6HnOUfsSaKYyYfh@hovoldconsulting.com>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>

On Mon, Jan 13, 2025 at 10:57:03PM +0530, Taniya Das wrote:
> During boot-up, there is a possibility that the PLL configuration might
> be missed even after invoking pll_configure() from the clock controller
> probe. This is often due to the PLL being connected to rail or rails
> that are in an OFF state and current clock controller also cannot vote
> on multiple rails. As a result, the PLL may be enabled with suboptimal
> settings, leading to functional issues.
> 
> The PLL configuration, now part of clk_alpha_pll, can be reused to
> reconfigure the PLL to a known good state before scaling for frequency.
> The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
> in future.

This sounds like a hack. You already describe the underlying problem (and
indirectly its solution) in the first paragraph above, namely that the
video clock controller has not enabled the power domain needed to
configure the PLL.

I believe support for clock controllers that need to enable multiple
power domains is on its way into 6.15:

	https://lore.kernel.org/lkml/20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org/

Perhaps that's what you need to fix this properly.

> The IRIS driver support added
> https://lore.kernel.org/all/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/
> observes the pll latch warning during boot up due to the dependency of
> the PLL not in good state, thus add config support for SM8550 Video
> clock controller PLLs.

> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: Integrate PLL configuration into PLL structure
>       clk: qcom: clk-alpha-pll: Add support to reconfigure PLL
>       clk: qcom: videocc-sm8550: Update the pll config for Video PLLs

Johan

