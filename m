Return-Path: <linux-arm-msm+bounces-29957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11F9640F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A664282823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6892C18E03E;
	Thu, 29 Aug 2024 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWCODiJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8728A18E036
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926170; cv=none; b=rzpfrajbaOxEnNO/xQmoxiaW/liNlcZ5TsixesLbUmYdLY0n7vuIiss548lAI47lKi6K1SmT8QXYcgWgUsvdtG2zxNipo6WnngJZQI0RhzhdnQQx1sCnI8zTnD4HdsLHBDP7/ujjIkLT5ms0V3ALuGcYyYm3JxONvZOCi3cXvnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926170; c=relaxed/simple;
	bh=92ByrN5d8Lg+NWMwH/cCUk3v7BuRdfpvo/q/AI3YNyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPeNrxREx4XKJMqbgvMaA04pZJ1/7PUlWFird6WitI6htnjIF+zxEdjOg/jG7TwNQ0bSudXU6IYb8PiAmBKR7u3IiOpsyWy79yBJB23Nrg3a5P7h36hN54BCCaC/sJdTICsJL1Q1XkLPntvbBD33QUjO7sbbG3vjmjQehOqSCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWCODiJe; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso5017921fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926167; x=1725530967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7u53BKBtP5gVlCvhU9dT3HNJftitXcbCrItbMCuXjo=;
        b=WWCODiJeUr2A9k7V1Im4ivCTA4Cve50pJxskiKfiQc5kqG7fLaxj1xYfELiqeWjNLF
         45cs6Jr820gA8iDrGQhSbikfKievZKAvbNo2HCDH6+j1Jw/abyZmkNcxQFCWpCUEvFVX
         7JVs78zVn/0UNGNWh9L3qOsO3fptKDFXyCJx/RU/3iP9snXmUNLXpPExRvK9qav7vLwz
         q2xOL9WRTXwAj+sJzeseweM9zBpLfRCEn1rs0nARU/t1W0KIoP+9psdpemaJVuy0o3SZ
         +xzh8lBZKRNCaOOA/z/zChuVLBHxuvuY1dvP+kEb/iWkuoHAkompg2MHYMNqk8eO/VYT
         SjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926167; x=1725530967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7u53BKBtP5gVlCvhU9dT3HNJftitXcbCrItbMCuXjo=;
        b=ZpOAsBdJUFJrRGVMMYmleSXtFJEvre+uBKTHPHYWBpAdqWcC57S8DQy13YeS0GyW80
         wZIt9wepEunL0D+ofIofJIBuTu9KD46y5Ewa5vYG4Llp5LeyaesoN5z0c4e54d02OCTi
         xujre+ztNk2iiqIo9up8Xd2s8Ss4io3SwFW80GfwhF8KV3oJQYQsjDfRw20CfDtF9bmO
         Kc1lQHtreESP8JD3H/3wI0aRCFkxCUaZcjoWJgKzAskc9A4PhZTwHXStEctHLwNXBIOv
         wc3TB/TpYr8HMmud2jHYJ2cFyrybEl/9yhiT9q5xZzVLbTAWJiGP5Zab4p0mvM/TObUt
         WduQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm9iL1Nxl3Fz+GrrUCDSqWvkGQs8Hd/oZfQZ8mOO7QKmdWm0fzWUMOTd3SiHKk/l0Y3G4kFUNRX45G1ndH@vger.kernel.org
X-Gm-Message-State: AOJu0YzCa6QMNHQqmkhGp61kHwekQ4kZ/Wc+ptBk48jXpTsAuSqZctAU
	o2EAJt8ldWL0K7QJRxxgvRdGs2p06SgjQfYEbP8B1TDXVnPQ7iprNNsCbVv9scw=
X-Google-Smtp-Source: AGHT+IGWt0QjEbulCmHcESGmd3m1Dusiu+1cC98QtVv2Lvh3qTNPkofKZb5d7J1AVPjx0jBydRHytQ==
X-Received: by 2002:a2e:5119:0:b0:2f3:ee58:eaf with SMTP id 38308e7fff4ca-2f6106de016mr17131721fa.23.1724926165948;
        Thu, 29 Aug 2024 03:09:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615194f2fsm1365101fa.134.2024.08.29.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:09:25 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:09:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom_spmi: Use of_property_read_bool()
Message-ID: <6cqvluvuogkrx77x5q2neobxa4bu5tfxocdbdd6hlydqqqj2j4@opaxs554ehxs>
References: <20240828130056.3481050-1-robh@kernel.org>
 <20240828130056.3481050-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828130056.3481050-2-robh@kernel.org>

On Wed, Aug 28, 2024 at 08:00:55AM GMT, Rob Herring (Arm) wrote:
> Use of_property_read_bool() to read boolean properties rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT property pointer which is a problem for dynamically allocated
> nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

