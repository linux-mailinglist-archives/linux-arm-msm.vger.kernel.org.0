Return-Path: <linux-arm-msm+bounces-41666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8A9EE053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18D75188591E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453791C5CBD;
	Thu, 12 Dec 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf795aDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C27425949C;
	Thu, 12 Dec 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989068; cv=none; b=XBm3EMWSaJE2lLdfs8gN/LSWU9ppnoB9JBeSl73VN8yjhxv+n7h22YXXZOJahZcL6dwvNTTpSHLz2QnKvy2A8IctDJZWBPzZKj0IDXQ6tok6crMm9lgej5nP1T4H9EQINb+D/pZ85s9ynw/lfEo+HIUCUeHazGuegg2GRjDsWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989068; c=relaxed/simple;
	bh=bWhgbqqKM6P+PHutWafLF1olCioOfX7f1KTnV0RgvnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZTO3TsvM0gAXumQnRaL4H23EAffhMNG0sQD6v2ntDD0Kj1zV51w2sTjMX4hbRkk/UvR9+J5lpQso1wtrTstJuJT0NnwwsthsEAg90rI4X5B5eSUg7B0YU4Yl7vmCuKOOlVWQoTpPGGKj61NaoAd+dHpGMG4TmqkPZl94JTLvYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf795aDW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82F7C4CECE;
	Thu, 12 Dec 2024 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989067;
	bh=bWhgbqqKM6P+PHutWafLF1olCioOfX7f1KTnV0RgvnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf795aDW6aHTxxKhIVVQ205leH7C98M19+0SyU2dbROJm7OLryGA/MRVKoz/+ktA1
	 o2/i2A9MCz9TNu4iPLeRhJ1r8zZIp//KxLYdvpMPFYQIRaetxRk/ZcH+Ahl+rlZ7Uh
	 mkQdutrdUTbOvqyM21lxMckv8NS5XRheK32NKebV4M5M/PCwWarFLZovu58XqxHNr8
	 b5JtSIDJ6gE/koNKsWYFouU11aONhonJLcGkWCeHrGTQkKr4RkYeGZv2mzLZGqmCbm
	 9A6izoJbp47awUwi+bnIAof1jHYf52VriT1KnLNriW3KzMH8KoBDd3OxbUnEoMb0Lt
	 xw8WhUdJcQNNA==
Date: Thu, 12 Dec 2024 08:37:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] qrb4210-rb2: add wsa audio playback and capture
 support
Message-ID: <iqpxa25taj7qkjjlkqk3qzxvvkinao3tp5vthayxlxpaam4mr6@2szcfdtaormu>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>

On Thu, Dec 12, 2024 at 12:47:13AM +0000, Alexey Klimov wrote:
> Issues with distorted sound and unstable volume on playback were resolved
> and this patchset also includes support for onboard DMIC and thus
> capturing feature.
> 
> This implements the playback via the following path:
> RX1 from DSP is connected to rxmacro which communicates with wcd codec
> using soundwire. This goes into AUX input of wcd.
> wcd codec outputs analog audio into wsa8815 amplifier.
> Capturing works through vamacro using one onboard DMIC which is
> directly connected to vamacro codec.
> 
> Special thanks to Srini. Without his help and support this patchset
> wouldn't be here.
> 
> Previous version:
> https://lore.kernel.org/linux-sound/20241101053154.497550-1-alexey.klimov@linaro.org/
> 

Please start using b4.

b4 diff '20241212004727.2903846-2-alexey.klimov@linaro.org'
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 17 messages in the thread
Could not find lower series to compare against.


> Changes since v2:
> 
> -- forcing single channel output for RX_1 channel is moved into drv variant;
> -- added capture feature support hence some new patches and
>    updates to pins description;
> -- sorted headers in wsa881x-i2c driver, removed excessive ones;
> -- removed of_gpio.h as suggested by Rob;
> -- removed wrong bindings and updated already existing
>    qcom,wsa881x.yaml as suggested by Krzysztof;
> -- removed unused pins state description as suggested by Krzysztof;
> -- reworked wsa881x-i2c driver
>    (initialisation, pm, consts, some functions, etc);
> -- usage of devm_kmemdup() in wsa881x-i2c probe() as a hint from Krzysztof;
> -- updated commit messages where required;
> -- not using i2c gpio bit-banging for wsa881x i2c;
> -- made dtbs_check and dt_binding_check happy.
> 
> 
> This series depends on:
>  -- HDMI audio playback
> https://lore.kernel.org/linux-arm-msm/20241204140027.2198763-1-alexey.klimov@linaro.org/
> -- and LPASS clock controller
> https://lore.kernel.org/linux-clk/20241212002551.2902954-1-alexey.klimov@linaro.org/

This prevents merging anything to ASoC. I suggest decoupling
dependencies or your patches will have to wait longer than needed.

Best regards,
Krzysztof


