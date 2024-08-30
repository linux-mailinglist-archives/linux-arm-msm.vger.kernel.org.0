Return-Path: <linux-arm-msm+bounces-30166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5190965981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8184E284322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D19B16D4C2;
	Fri, 30 Aug 2024 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JgqgEnA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C616D32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005250; cv=none; b=MSL6k6xpylBGfU9rVIPpUyp9FNtA3JdJvNh+080tFVmzXw2yiDG6Z5Xrp8xOdVD94z8hYy71M7zGM/ch3Ij8/+l6wJboI9EIaaF1KpAtbGlLaUcL+ozJwmIcEJSBwY8SbE95sqwY6fjm3q2RuAWOSmf+hdmB0IERYiNFSwravao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005250; c=relaxed/simple;
	bh=djhJwdPEBClU58p/NBjRr2izhAJvns+9St76RaABT5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uufVZpZEgk8gPRmaAsp+frG57J9kwYdkqgnFcZclqasExzZMOH42Y7rg1NdP9GYe9N7Y3QaOADnr4tEOdASSVEDHUyQvNWI89jC/6g8HbFLkwVFzVXEp2XXr/CZIBt4/LUer5YgHUA0xtcVKWnzyyWuA3Mwk4RVf2zbZxFyxxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JgqgEnA1; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso13453991fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005247; x=1725610047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=JgqgEnA1GPu7FZrOeNdQmoRqABnpwiHSzp3d7emwxHIRj9Wgnzq6PBGDNmnnBzmYYL
         x3LJwz+R7IBqQ40+k3rKDXrIJ88L3napEvpMBG+7wMkS2FNPZRZXM5omkQn5btl7byXt
         qpIYkacHPwzKEkgCY2knnkHGpf6kJVKT/dt/oq2RMflfVwM+9JDSPAa54gjP6AlAI+aY
         4/8cLkk7IBqihSjKWPzqJcf/8pWJ5uZrRT2yAC/37o6f+43adSwwhD9iEgTnftbJMdbU
         Cw9sfjNnx6ssKHEl3igS+VacFhu7r8gc+Vjq1U5UKET8ln8qTBjtXr/+GHXIM2Itzv1g
         A0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005247; x=1725610047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=RanhB/o6XiOy+9UleWgdh4k7BxJJpNM8W9+YWROOS4cqDrHss6ciFJ1mgMivZxl/4W
         LUStIlXzVY/P4g88IbajsN0QDi+DuIU+drDFuOldK+z7cpMlV+nb2erpLGEPV5AMol2F
         EXu6BIAa00R1SKkhyUlER6eppIgnNxL221Y/oj+05ghkAEizAYtrZPxc/Y1x7enRV8pU
         v2D3EUHKTYFPSNsqr0l7uAd3mH96am3rDLa0wIAMYw/phQIQNXZ6D0Vkt2kHvwsmNT6e
         yYwK06h7rsU2o4E9KXwCh5LL15zqHjoNkSteLMSa+B4HluNrzc5OeXb5slBfVgCSjKu8
         PkbA==
X-Forwarded-Encrypted: i=1; AJvYcCWHCb5ucI8eS1evfpGi3ycl9/iIOsA7/1inHcXkA/WoHVJlz3ksr4kvHLa/C2IQWpVHLlJomJ4g0u9v5S0l@vger.kernel.org
X-Gm-Message-State: AOJu0YzwJwcvyOV5kueWCNVIZBSxQCkgjLP10EkXL/T38IhRtpzTjHQ0
	MTSowmxKHR0vqo+hi8l9u64sXf0aiib9vJNVctTzub78LnnIie1v3NfYMqrjoUCgO6HkT8Hd075
	C
X-Google-Smtp-Source: AGHT+IGLGyFncOCO8wysxVTyS2DCKX0ca/6jgHo5yOoDP9+DIjbDvXHAA6oekjEyFn5hFdhhY5PoUA==
X-Received: by 2002:a2e:701:0:b0:2ef:27ab:40e6 with SMTP id 38308e7fff4ca-2f61055b5d9mr33274671fa.49.1725005246070;
        Fri, 30 Aug 2024 01:07:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f4ac91sm5326961fa.72.2024.08.30.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:07:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:07:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-ID: <rlb53soai6dhhfcnpwmdyqgblsbofngh2ewub6hphh2d43oofy@arcqq7edrm6c>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>

On Fri, Aug 16, 2024 at 10:12:10AM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
> 	- updated commit text to add more details
> 
>  sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

