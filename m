Return-Path: <linux-arm-msm+bounces-52999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890FA7896E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D65B3AD363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EA92343BE;
	Wed,  2 Apr 2025 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1YRWaBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27682F5A;
	Wed,  2 Apr 2025 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581111; cv=none; b=JYfFZt0PREwS3HYek9m030UoKHBKVPVdMDFIuNLtmwll0w+m2mFeIAd1FtzQ51s7EemR2bDF0sh1ZP3kiySCevHjYGpff1RHyCmXBVQ+Mso800iWnIO1x7pNmwEZqqCkqrMWoHQFinQXgzTGHpAvsqTeKE3FRqbz5DiV1Scb5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581111; c=relaxed/simple;
	bh=4o80SK3M3bxzfeOnw59xuxykQwJv89rAJKoY5/5QRvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX5SsqaSgEsHag9IIzHeKY6nZ7DL9DzFvf2AkBZWisVK+fpFF0hH119ZBa35vW6avOfbzLcmmfAAXSv03/oTYaHa2yItb233kUy1I532WKBkn9euqoV5y3bMuDyLTCU4fnmElCgGKh53rs62McBmMkN8WAJ/XhOwvr4MbYhZ6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1YRWaBy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F0C4CEE5;
	Wed,  2 Apr 2025 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743581110;
	bh=4o80SK3M3bxzfeOnw59xuxykQwJv89rAJKoY5/5QRvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1YRWaByd6svTXoOHBeHK2oe9JWgeo2lY9hSv4uNBcLixX/bnttXcixL18FOlJPMH
	 hoW+ZaWHIhmY7s8Mz6yhI48mnoFOfZevB85Yayc4Awo6HC6pa+QLQ0Hg+XnCZCF9vz
	 oQQGQuEyp+Lq51TkKpzYX6yC7GfJsxdvECuCbukCjlR0Mhl5z38PYUJgiDhpYErT6M
	 XNwk/IPH9ZDdfZoXUzQ04a8O544R69d58MPTGQOhFTRCY+QTtHv7BLzm+gJClT1s6w
	 Lq4/bgZCtScnO1llmqcn01txK1CpwlO9Ap+BtipaYv4J+TikT1mFsnTdvZrUchrwOB
	 g60XXWSBj1F3w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzt62-000000002Uz-1Bab;
	Wed, 02 Apr 2025 10:05:14 +0200
Date: Wed, 2 Apr 2025 10:05:14 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 2/6] mux: gpio: add optional regulator support
Message-ID: <Z-zvuhz2nkA5j4RZ@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>

On Thu, Mar 27, 2025 at 10:06:29AM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Some of the external muxes needs powering up using a regulator.
> This is the case with Lenovo T14s laptop which has a external audio mux
> to handle US/EURO headsets.
> 
> Add support to the driver to handle this optional regulator.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> @@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
>  		mux_chip->mux->idle_state = idle_state;
>  	}
>  
> +	ret = devm_regulator_get_enable_optional(dev, "mux");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");

nit: "failed to get/enable mux supply" may be more consistent with the
other (non-capitalised error) messages and avoids repeating "gpio mux"
which will be added by driver core.

> +
>  	ret = devm_mux_chip_register(dev, mux_chip);
>  	if (ret < 0)
>  		return ret;

Either way:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

