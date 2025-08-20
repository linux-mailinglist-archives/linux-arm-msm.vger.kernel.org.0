Return-Path: <linux-arm-msm+bounces-70003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE199B2E3DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 19:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200A11891397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727D1338F4D;
	Wed, 20 Aug 2025 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow47i5HT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3B31DDBE;
	Wed, 20 Aug 2025 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710366; cv=none; b=hv07jPfCqHUmO/Sag3P1GN+kqiwxYcRWeS4wCdRvgQUdfJjM02jVTciA76fcPBWIMe9y5yDmN7a0JWMCKUj1I47BzdwXDwZOb6TvDIQ65gPo3RH4i8kIT+Ioye58vyfL4hYKjFokfa1PEBiQq7oW4xSGsBPbT0F+2swgjyN8j60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710366; c=relaxed/simple;
	bh=+/l4HyLwY6rOCdHIGKa4vL5cDTO5vLIlcwh4lI6eX6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFyGP6hP06psD+2zSFYxlabNRpgOsmRPFsGn8Xhm8VMWGLRdYxNql/XMAsDJYFMGAAEADvxoz156mjIOzwUxIGVwoIkui0kzFQvamwNYSgBqYSdcK+YP7kdEG36nvpYXd6pdDOk3V6ueukJwJN7T35kP5jA9UGtMFqkulOatBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow47i5HT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F42C4CEE7;
	Wed, 20 Aug 2025 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755710365;
	bh=+/l4HyLwY6rOCdHIGKa4vL5cDTO5vLIlcwh4lI6eX6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ow47i5HTh0xq8wFpvN/WQQVFowPxAYu01Z5rzkYd6wEzP0+lcbVL8fBzJLkLRyRBn
	 FO7LwEChfydAbA7pSEbLLoThTbg2ZKdBv1q01WI0bEyW5LvdPSRfCvDQ1czn898F3N
	 GfXnVcWdkcnk7/qVU6hmLkOfEy5q8Pv0HW/fNiM94PvBFhGCzXo+4oPUJVVg+1kemE
	 3nLx7L6HwxZny28ij+kJopgP7YWkka9cRBs5HpPhs069yOZkQLi52LXJfwNr7TLGC8
	 VeE6q3f6l+fOfM9DQ8Duvuql2Uqggd1Vn4fNPm4USBlVKhqK3ECnBdJqdmX4ByutRd
	 Gn/J4f4rOpY7A==
Date: Wed, 20 Aug 2025 22:49:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Message-ID: <aKYDmBYyQI2TjTQ6@vaman>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <19494b00-a5b9-4490-bddb-48f48e73b0ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19494b00-a5b9-4490-bddb-48f48e73b0ac@oss.qualcomm.com>

On 15-08-25, 06:32, Srinivas Kandagatla wrote:
> Hi Vinod,
> On 7/4/25 1:12 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > 
> > All these 3 codecs have been duplicating two of the soundwire
> > functions. Noticed another new driver starting to do the same, its time
> > to make some helpers so that we do not duplicate these functions.
> > 
> > I have added two helpers of_sdw_find_device_by_node() and
> > sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.
> > 
> > Changes since v1:
> > 	- updated sdw_slave_get_current_bank do error checks on read
> > 
> > Srinivas Kandagatla (4):
> >   soundwire: bus: add of_sdw_find_device_by_node helper
> >   soundwire: bus: add sdw_slave_get_current_bank helper
> 
> 
> Do you have any comments these two soundwire patches in this series?

Yes I am nota  helpers like this, but I dont think it is big deal so:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

