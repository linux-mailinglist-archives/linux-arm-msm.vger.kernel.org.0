Return-Path: <linux-arm-msm+bounces-29964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CE696418B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F4B6B2552A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE51ABEC0;
	Thu, 29 Aug 2024 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uk+IUGBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378B1ABECE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926770; cv=none; b=Frv3Rs/ar3c/9s1XpykYeNV3NNydzh75UNnAdhH+T51Abcxim0CK40VC6ECEyY3u16oweBto9mD5qawd4iZlWkPuUPgT0pIjtRYq5juqmey7fhDjQJAEw4ZUnH7WCXdOwZdR0HPHNBcpQ3Chu3S1+B9vKLIt2UezgFSXbyojV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926770; c=relaxed/simple;
	bh=JiZQWXIRJ3HjYCLl7hFrsgGpcmSL/PwTn6gBZKW5NnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4GA/YYNvPbOYrI4pRBsQW4In6GnWPoGxsCsnyq+7mEAJrN33pbrwDmgRnU0WR1oC1xFrRboV3fR5p5TqmQD/IeF0SySyreUsY+aZslKAYqjEQgrWhmA6AU1zLWm7h/JMAxJAsx9Eo+Q1lHHDJ44lmlKj5DyusMVb6keNPMlj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uk+IUGBj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5343617fdddso844371e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926767; x=1725531567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsgEl12pS5/oK+D6m4jiXUFGwYqDk87JRvruFRHJCvw=;
        b=uk+IUGBj5vZH3cUlq2z+8waWEcJdBbudsV6P5FOXvr7So1vE7L2e7qHSw1N5JsuKCQ
         QlW0/hRw8G4d/Sa3gISoaOm5JS9YG5HQInI8cnMdPtR1GEPrn7g4ial+4H9w6Wx3KtVD
         433zVeHCx6YnUt9yCdFwxG7RvrxCsC0tm1JQoFLC5lSMpF04b17ngzA+T8tKoUH42SEE
         IuaBWpMZFwbDgUoAqhfXCniT/ZIRZWcaVPKLPRUoY3TAsc75Q4VvNvxCZoU5rEYPhXx9
         rprx8+ECE+/26gBj0bkBrX8diJyx57P0yEOaWTC88DssIYeTx81ErBOqc6DzTfwL9pkd
         jd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926767; x=1725531567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsgEl12pS5/oK+D6m4jiXUFGwYqDk87JRvruFRHJCvw=;
        b=pRd6UPdLgSr1bQ8ytBFBRnwzKnDaragRlxKPZMomjPFUy4GcM1jk5HCiqZfsrhs9LI
         EgsUtczhCQ5akpLMIsneHWC9n3vu0yMT6eT2is57SBrZQ1y6d+4WhQYlqXu5sHTccfkP
         ux6Pi21x1hlnU//jjdUux0uMEA1DSzbT9JbwnBodKahOVWWLmuNqJVnOUlCW09Yr5Xgy
         c9oapaf7feq/y0wMC1PEUDFQPRGr7stjQZOrBS+39lHO+e7TzNEu/73KXC3X8UH3opmu
         Q8C85iNfrQP6Ghauo3Lo/PKP78Pdg6GhWi6CimFP+VPHJfzGdS1url6jjCiDZn9XZcIJ
         Sq3A==
X-Forwarded-Encrypted: i=1; AJvYcCWTDpPTHu3IxtA8xErEqwarBPHmvmTPqdiVXuNIc8Q08s+leLurrUGYomoeav6GXSJz4x2dv4GVFjDKZnxm@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZ5CPLSJCEr6/Hh40jYN51T1AYp56RyqUBxF1spfQ5uHhTHyQ
	yvuScfwJ8VWhnS6zRsTWnIfIFW+8qJNA8y2EDKP3Gtt/QTAQdR4XaqGlkLLKK3w=
X-Google-Smtp-Source: AGHT+IFI/J4pmYQEU4+SHn18VCyisudN4k2godV3tyoAlPi2LbLETrSD6LA/Lou8PXucHxARCjq3Jg==
X-Received: by 2002:a05:6512:234b:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-5353e575f40mr2138577e87.33.1724926766646;
        Thu, 29 Aug 2024 03:19:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827af9sm116406e87.170.2024.08.29.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:26 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:19:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Message-ID: <izr7linltwo4kbpp4dtls7bahvk4a2hwtqaz3fyuktjuiudqly@ivulir54ktxk>
References: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
 <20240829-nxp-ptn3222-v1-2-46906bc4747a@linaro.org>
 <79a643de-9808-4866-9e41-8bd5ab55ffed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a643de-9808-4866-9e41-8bd5ab55ffed@linaro.org>

On Thu, Aug 29, 2024 at 10:30:49AM GMT, neil.armstrong@linaro.org wrote:
> On 29/08/2024 10:21, Dmitry Baryshkov wrote:
> > The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> > translation between eUSB2 and USB2 signalling schemes. It supports all
> > three data rates: Low Speed, Full Speed and High Speed.
> > 
> > The reset state enables autonegotiation of the PHY role and of the data
> > rate, so no additional programming is required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/phy/Kconfig           |  11 ++++
> >   drivers/phy/Makefile          |   1 +
> >   drivers/phy/phy-nxp-ptn3222.c | 119 ++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 131 insertions(+)

> > +
> > +	ptn3222->supplies[0].supply = "vdd3v3";
> > +	ptn3222->supplies[0].init_load_uA = 11000;
> > +	ptn3222->supplies[1].supply = "vdd1v8";
> > +	ptn3222->supplies[1].init_load_uA = 55000;
> > +
> > +	ret = devm_regulator_bulk_get(dev,
> > +				      NUM_SUPPLIES,
> > +				      ptn3222->supplies);
> 
> Suggestion only, you could switch to devm_regulator_bulk_get_const()

Good idea, I'll take a look.

> 
> > +	if (ret)
> > +		return ret;
> > +

-- 
With best wishes
Dmitry

