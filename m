Return-Path: <linux-arm-msm+bounces-49950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CAA4B426
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 19:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E2716ABB2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B00F1EB195;
	Sun,  2 Mar 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHSKZRXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57C1EBA08
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740940992; cv=none; b=FmaH9XuqQY10XKC1F916pvCfSICK6AwH+vn5emrCz0JyeRTQ16RzOIUa5J+xwTfIDjGIVIAROVYx+lqkRNJCpDgNfiKNOe6BTEcWnPocAgSv2m97AK3RGQB6paMsLI7SsbH4B/K3DjyPc9xU7HFM2eLy9BKRRTa/XPX1yRolfuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740940992; c=relaxed/simple;
	bh=+H1JYRsmzoPrlN0IZH2KXuNuKiNSEAFuP+sgrI0/RtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZR5fmdF0iG4SUuSY3r8LijYMWbpXeptNaR4BX6vQRsFzz6InaWYJ5ntm5pxkz3CRx064vjaeQk4vmSwk5qNLD0fCfb4AxqF/RDiZ6de8MS7TsxUWWRPoyMQQ6ojjQNkTObqClD9jvfokUjvy1Sqlb/qPI6JZ9wclRMnCr9+ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHSKZRXJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307c13298eeso44891541fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Mar 2025 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740940988; x=1741545788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYfSZwjrk1wuwLyH83CewpZux6QazFFyjHhdeIqoGk0=;
        b=xHSKZRXJmjxn4HtvvUvqGeQ3d5UkVE4L2yO2HyRj9rBsz9uRxhFKfXP094NjQPckcZ
         g4cJNRAjO3RmQZL9XMrNqP2VavpOcqVHM0JDkc37E089owDZM5GhbB0jZ8S/MTRI72FK
         qMxQnPZicawaODzDBql/UUr33T4B3dNiKZQMSJ3Ix5zG6Vx2UoH+tbC9jZfTd8k8emJC
         cj6dV/wcHGnXOUf9GT/94+gAWp3FecbemdSpgjlLI39L54uFLvJ68LcrRHaLkMsaAQXk
         C2Je81kM3X2WkAr68jAX7Mu5sU0guaW1p4bWVVrbmqXPN34Ge3/hxWKUaItxjE7iDBp0
         D7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740940988; x=1741545788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYfSZwjrk1wuwLyH83CewpZux6QazFFyjHhdeIqoGk0=;
        b=kv066O1yiPfNyo2h4qFic3jGBzV9DyE1g7cTbyOxXnbrVxUrBAjXX91rsm1KHTw1kn
         nM6st1fXzHSdCNjI06LIDwl/wtwIxo7TtxqXrbEAQkWAMpO+TcQJ+iR04zGI61uqB+Pl
         18P3+3XJ9jMJzFrMQABohb3NMrLGFH9WjKxyfR7tr9O0YPPiFvCqhP+6SlzXj0kyrmpP
         nSZR9R2FU12LM+9sjL3/pEqVdauX7GXHtuIorCtX4LMRu+TyE0XGu0dPHLLkp8UTizSl
         OReqps6vkixgmKe+DHeTrA9h09qfsofr7CA+xdEZeCpIOzI8wCcp1sMQsnca8xKh/AXt
         cLzg==
X-Forwarded-Encrypted: i=1; AJvYcCXVBdwVc1nR6XCviM2T3CPfwKfpJRkUIi0FodqDSmjYw3FNw/R9SvlX9VjnACEYO5nK7/tRTEvRjSoZ+Khn@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzRI9NQcLrw7HMboWxntn7RWLSytAo6i+UDBtWRyocS6g4JHK
	Xi/hpok5+K4GRo6tP6yRllG4n3teErodgKKJj3VMjimed/fQeWYdSbiYxlmN/noZ1C0IiuLKExq
	7JcP3pg==
X-Gm-Gg: ASbGnctlK1r8bYzrnEDjRGcfh5M/phVZEfRMOcpecSCaiGo3jug1q3ppMlAOcgz8Qv1
	KJf+/RQ7tZI2CqjkA7KHC88YQi+RFCfISDHZ9+7EzRtxxx4KABIuSTt0JWKH//YzzSPT0/EHz08
	js1n5FliCvV2jGypBcXIlbJbOqNzZqyqewxa90C5CTjvCxM8OGqSmumQWDMG9gFAubyrL/UL4YG
	vwv3++iRnJ3mht/Y1+BSuKz5xCOWyuXsyDnDLJbDJW+dDhBk/nAbv51ch1pRguK3D35tXu8vRpX
	8Pko27TWlp3+rXM/jWYd8hgyV4VW6LA4t8yyDwZ+AnwXLkD6SkCa9AOhLgEIKnQK/GMBoKlQX7W
	Tldf+bti2x2WCTF0+MxZL3DwG
X-Google-Smtp-Source: AGHT+IEYTGmoWgInNdncfhUdNvmlzFmlOJQaw/FJcWHC4CdZnaQ0MmPAPvQbmmMMOiLgnNAPW8hDoA==
X-Received: by 2002:a2e:a4b9:0:b0:30b:919e:3021 with SMTP id 38308e7fff4ca-30b919e30aamr32112101fa.10.1740940988464;
        Sun, 02 Mar 2025 10:43:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbf2927a3sm347551fa.1.2025.03.02.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:43:07 -0800 (PST)
Date: Sun, 2 Mar 2025 20:43:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andersson@kernel.org, Michael.Srba@seznam.cz, konradybcio@kernel.org, 
	jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: qcom-ssc-block-bus: Remove some duplicated
 iounmap() calls
Message-ID: <keric3hixhjbxscdtqbgbi66lz5oklj7dunhfbmmtscjlmjykd@6ud3faz63pvz>
References: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
 <efd06711b126e761a06eb5ef82daf9ad4e116a10.1740932040.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd06711b126e761a06eb5ef82daf9ad4e116a10.1740932040.git.christophe.jaillet@wanadoo.fr>

On Sun, Mar 02, 2025 at 05:21:34PM +0100, Christophe JAILLET wrote:
> reg_mpm_sscaon_config[01] are allocated with devm_ioremap_resource(). So,
> they will be unmapped automatically by the manage resource framework.
> 
> Remove the incorrect explicit iounmap() calls from the remove function.
> 
> Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/bus/qcom-ssc-block-bus.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

