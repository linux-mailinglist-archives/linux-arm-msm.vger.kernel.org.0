Return-Path: <linux-arm-msm+bounces-8065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71F83A19D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 06:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF2D1C227D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 05:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9764D10958;
	Wed, 24 Jan 2024 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQUPI0Gy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED3FBE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706075785; cv=none; b=RcrTdxsGAb064OE3UfN16iDbkh+11sq2jQvvucKtSjf9XjZEJl8IuMKhP7b0FULXC0HZmh6i22LP44/4dD5QGK5vU6FNosSqi3i5AVLvsLJ3euc3Z0WJLOy7qCJEf1Ayp6W+i88koURyIwZhZ68ZKT7DplLnGWK81BrzaQRvU3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706075785; c=relaxed/simple;
	bh=3n6qbepBC/quy189WMpUt5s0sJ7FlfcHVamtdO7egM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZLJOYXJd+P4PgVzaEHs3OOG8Js1ku0RCq6KZIAo0+smRFBJR+3iDd60tVsa78FmRZOwu7+00++cuKvrGRB9+wqi9bA1SCUWjnmqZXU+eYd+WcDk/sEYfuoVUxUrZJ/8QN/NQ5uC7igyqJkWQdWvDFFW1Ot1gfli16m04jKZCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQUPI0Gy; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6dec4b7b680so3202494a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 21:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706075782; x=1706680582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7SahGLtspE/3Wi9Cd+JOw7KlfpX4OF2RIxiyIP7SV0=;
        b=CQUPI0Gyf7iMVcA10t0J6r04j6YDF4Q6PiMRKcRAEg+WVj6KxdR5iSjMSH9izVJw1I
         eWEctJIUL9aPKNRO8yJ0lyN7bSV/jDY1WG9r8EcyShbbGJe/c5xN79ViXN+JORHMajDY
         3lVFKRVel0lAAFxssdot+ARQPurXeBX6M9tre1yECT9ZrE3S4aN4izbkIobsxqrD+gB2
         PqqDggyVIjCgWAll2xtReuBmYA/XAr4VvzisMbLenDYR0AcUbxsn+W6KD51fBPCjDLml
         IzviHy1wIPcxQkBILW8Wy4+qLFo6TwfpiR4yy3p0elIznif5BQuoB2TOGUB6aIO6pp1h
         gYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706075782; x=1706680582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7SahGLtspE/3Wi9Cd+JOw7KlfpX4OF2RIxiyIP7SV0=;
        b=F2xxfbE6jdJF3nm2/+gKTZS7FlMyLtT2qUsQ8IRGkdim2C3+i1zOUng/YRxyDdjjzO
         BWRQZ/jEHGd9WVjS3zVV1c7xg0Y0DKTs+1nJ0GquC9vJeuKeMK1JKHjd4BmC8LAQ0ZYT
         jSb1HYFu3HM9gi7K+iczibnyvYqVMMa3LGGiYlqQhHdp7ZZs036Q13E/f4HhGKmX5I20
         YVoc2ej/2NK4+Z2wTT/4czkqTPqHdCoEGfcV3dRa8lvhlYSfqe3n2GvcvqFzKptreAuK
         JdC4EtT8BkqQ1Q6qIQQI/V15N+nyeX98VC9pis5kZKEEWEuEPqjGeYHbsg4cDSjoBI5Q
         IO8g==
X-Gm-Message-State: AOJu0YznceCenBW1hYXK9YFAR/1DTIV5sohJYTfIErAE/TsXfo2KXEE2
	kX7mgJZ7s1t0a3lIiopXJ7bjzuHX7gcpqzGGf5n72AenUOlW9f0WXjQRMGww7QU=
X-Google-Smtp-Source: AGHT+IGiCI/sj/mAtB23fTMLULvqgI87+dSZUJXZCXN7hV/stz02CWQa7d9iE2R5I1NHRIlUItj1Gw==
X-Received: by 2002:a05:6808:10c2:b0:3bd:a6ea:1c6c with SMTP id s2-20020a05680810c200b003bda6ea1c6cmr1180274ois.116.1706075782222;
        Tue, 23 Jan 2024 21:56:22 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id ko18-20020a056a00461200b006dab0d72cd0sm12721062pfb.214.2024.01.23.21.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 21:56:20 -0800 (PST)
Date: Wed, 24 Jan 2024 11:26:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/6] cpufreq: do not open-code of_phandle_args_equal()
Message-ID: <20240124055618.5xppexdpvwnv6zng@vireshk-i7>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
 <20240123141311.220505-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123141311.220505-3-krzysztof.kozlowski@linaro.org>

On 23-01-24, 15:13, Krzysztof Kozlowski wrote:
> Use newly added of_phandle_args_equal() helper to compare two
> of_phandle_args.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on previous of change.
> ---
>  include/linux/cpufreq.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index afda5f24d3dd..3cd06dafb04b 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1149,8 +1149,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
>  		if (ret < 0)
>  			continue;
>  
> -		if (pargs->np == args.np && pargs->args_count == args.args_count &&
> -		    !memcmp(pargs->args, args.args, sizeof(args.args[0]) * args.args_count))
> +		if (of_phandle_args_equal(pargs, &args))
>  			cpumask_set_cpu(cpu, cpumask);
>  
>  		of_node_put(args.np);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

