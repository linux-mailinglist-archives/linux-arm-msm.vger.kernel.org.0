Return-Path: <linux-arm-msm+bounces-74849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB8B9CF9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ECA32E7BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F43A2DCF4E;
	Thu, 25 Sep 2025 01:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1I3viug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3A021C9F4;
	Thu, 25 Sep 2025 01:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758762550; cv=none; b=lqPDJlSwzERMsUsHIO3yRpV+nwJVN3qVLRL1z5mq1OXLoK9NrjT8Hq57JlPR7LtePKli2Za5RId79NPFTlbiOFgMnYiGtCG7Izb41Bxj+S753PokrB48DifRChK35j2oFa1fNXjfnk2LZWaTnAd4EZUObQxGIh6Ee25/g2Vhegs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758762550; c=relaxed/simple;
	bh=dHxDOJhnkECbkUUwQmUp3zM1Xow79G90WP64t2bY+rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqzvuYBCgeRhoyiMAreG1d3DMH1WCD0TWq9kkpvvpHEgtJmqC74ibWuPuTljgPTwaOPYRIMDMFl1qDFyQqB4vbIHLBtxorfFvGcnJkgCLuuMwLk9uV8mHkc+xZInQ9GMY8os2YdSLO9cG/bh6qU/ZZJPEihF32WdHvVEHV6zVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1I3viug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8815FC4CEE7;
	Thu, 25 Sep 2025 01:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758762549;
	bh=dHxDOJhnkECbkUUwQmUp3zM1Xow79G90WP64t2bY+rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1I3viugqZPRdIw7VSAQjbeRMw4u7cwU5+mbB6hczhbRxc8XIqbBUgXy4l3Nmj8xo
	 N18KKmI0Kt4jKAlBOVdKl+s6J8irWyPEa6WtUEWqP0zPmGzcEV2LA3rISp1Lmklb4w
	 oqR47e5f2Re0brYjzEYWcq0bJNDD+KMLCtDCBJ0jlnVAKybND8Hfj5kCPq7jKtOcOd
	 HuhWwcRqh//Q9j1ZXAcjjfY5fjBcXihx4QCZsZQIdHJQyBEpRy4K3sOPPwmvx0slcS
	 C+2bpxqM34yXVeaUlb5+ppsc216QwDmERGgKV3cC9JH0y0sIAnRdatz2iFJ+EffNO6
	 2lWyx9rR2TWEA==
Date: Wed, 24 Sep 2025 21:09:08 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.16-6.6] ASoC: qcom: sc8280xp: Enable DAI format
 configuration for MI2S interfaces
Message-ID: <aNSWNE2F4gmLgUQ1@laps>
References: <20250922175751.3747114-1-sashal@kernel.org>
 <20250922175751.3747114-5-sashal@kernel.org>
 <aNJJe20u8bEOE3VP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aNJJe20u8bEOE3VP@hovoldconsulting.com>

On Tue, Sep 23, 2025 at 09:17:15AM +0200, Johan Hovold wrote:
>On Mon, Sep 22, 2025 at 01:57:36PM -0400, Sasha Levin wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> [ Upstream commit 596e8ba2faf0d2beb9bb68801622fa6461918c1d ]
>>
>> Add support for configuring the DAI format on MI2S interfaces,
>> this enhancement allows setting the appropriate bit clock and
>> frame clock polarity, ensuring correct audio data transmission
>> over MI2S.
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Rule: add
>> Link: https://lore.kernel.org/stable/20250908053631.70978-4-mohammad.rafi.shaik%40oss.qualcomm.com
>> Message-ID: <20250908053631.70978-4-mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>
>Yeah, it's bogus. Please drop.

Ack

-- 
Thanks,
Sasha

