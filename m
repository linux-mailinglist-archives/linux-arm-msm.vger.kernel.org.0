Return-Path: <linux-arm-msm+bounces-57245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57826AAFA53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96D261C21610
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1F648CFC;
	Thu,  8 May 2025 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiiWyhiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35E2C190;
	Thu,  8 May 2025 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708360; cv=none; b=RlcUlSe6kKSNfmgedKkzWAPSQzOfkGmHyrvDf7uF+LMPm2/ByTQXKHTmyxvOnogNZDQ/l956mkxrXvbwL7s552N9XViXs3vkWG3bDOn4oU2p6S++U+vNLZozxFne5JAbBW9lTGgtnJR8o1P0CQZMFBwnNR3+9FI5KEYWuPMhcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708360; c=relaxed/simple;
	bh=gtvcZNEeXpPInbrf7rQ7RG25lTI5aprhGw3x58onNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSHwrSdtTQ+5JZn60siQ42dxqUxotBy+ypSKGAGFVmjVqYqo0IKB0ks8GF5tSko4ojn3Eq7P+Uz4Qo02Fthu0RyI49pvVBhaBya6P8QEnCFTU3Hp6MghNxnLQLiGinff79kAN9MOPeothyUQQIuqLHTUQmC77DtqTfRfzNaGGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiiWyhiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA45C4CEE7;
	Thu,  8 May 2025 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746708360;
	bh=gtvcZNEeXpPInbrf7rQ7RG25lTI5aprhGw3x58onNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eiiWyhiNlquLFFMTKbOZdZ/Sfam9B40u4DIuYyja1QolOwigVPF2m+ASdGwk/RZDm
	 eDpw9Q3/5vN1Ard1bQxeec+TcRtbtbB5cFJFVLopvIQRAzxwvSFtUED8fDwvy9WH+Q
	 4xVdzKCsYZIP428lefgyGofVq58WYRd4VZLtQCD9VPkti92uqQ9wLF1ET+NIITvbIV
	 9mOof9MXdVK5UWwk7sHTkRdvGH57uTpWwBi0CAUhEnPGYqTPfyaeq8K6Vl4lFtHXps
	 k6ouHLUAeTD5xUTAxCse+hVv0Q8xYHCC7HFGu4sLV+H217idiafvK5oWXG2u8Hzfl9
	 tRwvaUvtiqBWg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uD0dR-000000004UX-3MnV;
	Thu, 08 May 2025 14:45:57 +0200
Date: Thu, 8 May 2025 14:45:57 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 2/6] mux: gpio: add optional regulator support
Message-ID: <aBynhb6voxJvZtB7@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
 <Z-zvuhz2nkA5j4RZ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-zvuhz2nkA5j4RZ@hovoldconsulting.com>

On Wed, Apr 02, 2025 at 10:05:14AM +0200, Johan Hovold wrote:
> On Thu, Mar 27, 2025 at 10:06:29AM +0000, Srinivas Kandagatla wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > Some of the external muxes needs powering up using a regulator.
> > This is the case with Lenovo T14s laptop which has a external audio mux
> > to handle US/EURO headsets.
> > 
> > Add support to the driver to handle this optional regulator.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> 
> > @@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
> >  		mux_chip->mux->idle_state = idle_state;
> >  	}
> >  
> > +	ret = devm_regulator_get_enable_optional(dev, "mux");
> > +	if (ret && ret != -ENODEV)
> > +		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");
> 
> nit: "failed to get/enable mux supply" may be more consistent with the
> other (non-capitalised error) messages and avoids repeating "gpio mux"
> which will be added by driver core.
> 
> > +
> >  	ret = devm_mux_chip_register(dev, mux_chip);
> >  	if (ret < 0)
> >  		return ret;
> 
> Either way:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Can someone please pick this one and the binding update up for 6.16?

I see you recently volunteered to do so, Krzysztof? [1]

Johan

[1] https://lore.kernel.org/all/20250501175303.144102-2-krzysztof.kozlowski@linaro.org/

