Return-Path: <linux-arm-msm+bounces-44293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1782A05217
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262493A5279
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E70D19F11B;
	Wed,  8 Jan 2025 04:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jX7x5nlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24619CC27;
	Wed,  8 Jan 2025 04:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736310502; cv=none; b=TpSs9AqgKiUl8qlOeSU0T6X0TWkw3LMtuuqV/zsUr3/taWVqYHBqzodHb0wH8+30eO0gmSxPyVJWJaoWVy1OFPJdy+nnJpjapD+tgY7PQwSE4dQwnqt2/Hx424Lbos3X+cpKc9A44mzkUCVLMwhml+oAMeH6KXoVLDHW7dXisiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736310502; c=relaxed/simple;
	bh=DBhe3V/vo9pp/4MHQZtgdqNKC7f8XRmG2mupajE3oEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3iqbCsJaHRurYKQ8k9u1plck5rgWfVnHug0eJd/yA5fb8esKBT1X+OuFDgMZ971M69s3DamttT37q64ebQWtoeFC+xgGM1mkPK7i9WMSaMZyJzogBSnLFgEfezVoIZMOvcoqCLUEAgtEQZIavSYQ9X73ow8XEPEgfx5yhkFeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jX7x5nlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64B5C4CED0;
	Wed,  8 Jan 2025 04:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736310501;
	bh=DBhe3V/vo9pp/4MHQZtgdqNKC7f8XRmG2mupajE3oEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jX7x5nlzwnQW0kLQCH/fceUmCafYTo29fhet6Sc89B5M1vQdERGw2xjhAeFqpFObd
	 fMXIPFgbTBNevlkpSOFUzd42+osdCTBf9s0I5y7B33UVRMrw0gA0KbbC6YxH81jV+z
	 1mvwcw9v+4wQKlImKuDDTMTnaWCW2A6AQyKdcV/wZZGSTv2cfTuHXze/6p0Eago67D
	 nRgTE82Cp73oKFynK3FPXh10aaIKrXCYGWe7oFk/BLqqSdk0ai3d5O7M4bPsSE4B2N
	 VQBwEygwQ9MqnitciWMmLKRlIapWWZnmkjTcnNtz+jHML7mBqqz/53MzJ+UwnsEj1r
	 uGGA7yrwWCBGA==
Date: Tue, 7 Jan 2025 22:28:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v9 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
Message-ID: <oqfqgjsglgvg6iox3aiizxafqxrczijknhs5vbxkqrj3om3rec@aovx5ra4woie>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
 <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-1-f15fb405efa5@linaro.org>
 <3nq6zehelawkkdsxuod32pyntxdgbijsjm5bwk5hu6l3nni7lo@5aeutzvdefku>
 <c911b6e6-0af2-48f2-9445-0a05dcb1ab5e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c911b6e6-0af2-48f2-9445-0a05dcb1ab5e@linaro.org>

On Mon, Jan 06, 2025 at 04:55:18PM +0000, Bryan O'Donoghue wrote:
> On 06/01/2025 16:53, Bjorn Andersson wrote:
> > This sounds very reasonable to me, but what's the actual reason?
> > 
> > > Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> > > Cc:stable@vger.kernel.org
> > Without a reason it's hard to see why this needs to be backported.
> > 
> > Regards,
> > Bjorn
> 
> The reason is it makes the next patch much cleaner and makes backporting the
> Fixes in the next patch cleaner too.
> 

That makes sense, but let's state that in the commit message then.

> I could squash the two patches together as another option..

That would work too. Although in the unexpected case that the order has
any impact on outcome it would still be nice to have a comment about why
it was done - and why it was flagged for stable backporting.

Regards,
Bjorn

