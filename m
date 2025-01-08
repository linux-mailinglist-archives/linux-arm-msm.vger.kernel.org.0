Return-Path: <linux-arm-msm+bounces-44345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149CA05893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 255DC7A01D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 10:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4F81F63DF;
	Wed,  8 Jan 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXlPEkeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595031F1309
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333260; cv=none; b=fN87a25Sf4eI5kQh8Zz9MEgKsipnn14zRd9jxG6sZvJ0Do9btF6eEJOhV88v8g8OccqvZ0zE1HZaN4fpVQkOfi6lkkV4rH5ICM89JSM9oItRY6ngn9YoKzhBWKnIMfVcOclOi68wepkJY14uSgRoJTE1uUqmivUGfXQMANGBUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333260; c=relaxed/simple;
	bh=7Dp8gSfhyK3cIrHj2oyDrtZ5XxPQ6DdZq3tD+jolDFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoXfMzx37tiirVXphdNWzdtZWVqqUq/VC8xBwmBPg5Iz38FssYxZ1/jhf21wqs7vxGYh450B2F9eCDxR04a4OV5FWAKE+Bo7ZRhnPcNQeX0t2R8EqaT9GThW/T0PYMw1IRX3GNOt4Z1r1429VSAqrW/n7RGVP17mAQIJ/+VAVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXlPEkeX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401be44b58so17429771e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736333256; x=1736938056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KqGib1ZDnwv7hSRkBTzUodWhJMWwuBUix5Fy/i7/wXU=;
        b=TXlPEkeXZfQT1d0ghYqWPOpOVrOIguEqLLAPjcfeRcPlAB1nlL6vAsk/dFmnCmfvgF
         uSoHLLKGMZpxAvHTjhS9tXDa/aHhEsnONPyBUGMjghDyr0joC41kKl/dnvlT0Ot7HJNU
         AlfQMbDDQQsVMIr4JcRzhkCz1WWHYN40AOwdE8fI5HgA0DUQlx9KQ7WXIIj14MX0oiDQ
         4rvsnNR1fAcwKael8p+2AGp6K5SZLogB8uYnr7mUFkXufj1qqMIoI1z4UNaZTOJeseLW
         YXojmnjnjS+pu7sXRJLdO2XAgzpUJzZmVv2WD54yFt2ZM5CD2c0F+/cEOj9CpD6cR1sy
         WLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333256; x=1736938056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqGib1ZDnwv7hSRkBTzUodWhJMWwuBUix5Fy/i7/wXU=;
        b=dIRdkw937B0773JpZ1OLAvMQeTuSMb5AvbhsTYp3DQtc70LzlkBbU4GJJ1SnvDnH7Y
         emvd9NQ89jUpqCncreFUBdqUy/nuyJcs6zhl/IW54LZ63PqqmsK4qw9K+hhh341DnlVZ
         vA1v2IlX4jc1ofEEe3WeOEplBymI2GMnsyMCCe6RB0wkEGbY6pfXHxGAhJJjmAJWBwrn
         07brFL/3VaBXaVeV7CBSY9VovWXWhwlOMCr8Jzy0ottbCXRGTfX2HcsP/OuGUrEhmrAd
         VM2z7h4fvpXauv/+CfRHoxHloseO2IxSOYxOmiGaKzSYRBjUM+pG+Wvc4msopOIP4yQt
         j5XA==
X-Forwarded-Encrypted: i=1; AJvYcCVuZY1hJ/0XokqXR+AsUu3AozRd/RL4gEj8s/kKXHWmc7rbh2WJ2nwg/IWBfWS79TcRIO3DMcwMV9vvdR9B@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMzx9xW6ef3ngLvudQ6mAgIVsxgz4dMpYeZxP6zxoRqBYUynm
	D6aCgRp3OoC770iTa0r0mid0LEuFUrENfzUOGxDiPZLka6ssVcE4oeTnd7aDDZC78Nr+xSKeYz3
	L
X-Gm-Gg: ASbGncsiljGylw2mVc2dbnl+gsZV1uiIBKtDSxlEVf6+0/qSSj9h7jXZJzjJ59eJs1j
	wtJFLzInxukF08yMLLZ5yybSxTsp7hlxGMbCxgAeA0Mv2ULy5HjwyHWbldG6Vf4Kh2LD6dkDUoH
	m3wC/+UVkDyAwBnzCkByfjFgUj1nEbU6q+iBRqUov+5vFe3lK5p84pmvxPM5CGWNQIU1sw2ElUr
	at0RxXhifJFNYY5FEwlAnc0trdN+mDwCG9YRvut3mpEganmH0gJksJo4GKA1hP5we1jpBPhotCJ
	pwwEPpQ+jhWK/URrmzltRpY6l/4E+6yMDaex
X-Google-Smtp-Source: AGHT+IEgV7BYOyPY9tt7dlqJRF287AoBBvsP0IoKOgZDwqu4YNfzFyL37fxw2kC3z/KJ5mhZiXcKzg==
X-Received: by 2002:a05:6512:ac7:b0:542:29a6:a067 with SMTP id 2adb3069b0e04-542845af553mr606181e87.6.1736333256365;
        Wed, 08 Jan 2025 02:47:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbd0sm62422871fa.37.2025.01.08.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 02:47:35 -0800 (PST)
Date: Wed, 8 Jan 2025 12:47:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Fix an OF node leak
 inqcom_smd_register_edge()
Message-ID: <4t2q2sij3o7iixzmau55gsh6gcvmpm4jrgp5v5mkfuocwai3sb@ahdwofczf53z>
References: <20250108005045.2716459-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108005045.2716459-1-joe@pf.is.s.u-tokyo.ac.jp>

On Wed, Jan 08, 2025 at 09:50:45AM +0900, Joe Hattori wrote:
> qcom_smd_register_edge() leaks an OF node reference when
> qcom_smd_create_chrdev() fails, since qcom_smd_parse_edge() sets
> of_node_get(node) to edge->of_node. Add of_node_put() calls to the error
> path of qcom_smd_register_edge() and qcom_smd_unregister_edge().
> 
> This was found by an experimental verifier that I am developing. Due to
> the lack of actual devices, no runtime test was able to be performed.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in v2:
> - Put edge->of_node for clarity.
> ---
>  drivers/rpmsg/qcom_smd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

