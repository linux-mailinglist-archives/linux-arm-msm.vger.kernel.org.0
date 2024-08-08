Return-Path: <linux-arm-msm+bounces-28135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A394B575
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 05:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297131F22D74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 03:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8011955769;
	Thu,  8 Aug 2024 03:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhiwFq10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C8CA6F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723087801; cv=none; b=ItPuy9uD2tf2z6WwydO/zST62C2dG28tbc8vdRoLhBT3oYe3gNliLYGB+sr5UMh8q/X9NhmgYXuhyJ6UjCAYjBPXgoj+LKs2dSINWu9iwVAWR2fSnQoB14cVfveZ9J+mYf89eRfXq0sHVFHz6zlIHha5i17IJ3udLeZw1YZ2uC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723087801; c=relaxed/simple;
	bh=NNTuC94XhuZhDhrQS3QsAXSIBagRUogg9FNt4uigfZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRI15SvtTryo4lP6brDFmqK5DyUgJjpcNszpZ6M6I4ttDGdVKzoc1OWV/VkHgC6joHfjjN9HXehAKidhdR0nPMfioKzVcAej5yQ5OdpOkH8qYIz/itjG+wudyj3bZXcgg+ZMcQTUQ91L3Go+9fzi8uMGlwHA3MHHwXCzKydV/YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhiwFq10; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5aecbe0a9so315991eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 20:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723087798; x=1723692598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01aWtP1xPWHBVXs5lQjLNJmhvUCclZ42tYEJQkcTgC8=;
        b=LhiwFq10F+aD1sdLKd8aTx4ODEy+oJkKHRhnYqtG0MMlPLaABIlDbSt7ztHOoiJLXt
         P8zK8JSo4xSSHSKIZ5v7WRCKXr28Y1OMmxVTrJMsGX4Fb87V7naTD+S2EGbHbvxAjjkR
         B62Af5UrSQD7Bg1BOFqT0gYVUreDN+WzG5Fj/y6jOWhnTEhJvW6qLg6c0f79yVbIUvB8
         oZig5YIrBcDFiNAXiYB/Cm508MEadmvBzxHemLwco5eZ2KL4NYQJge15OyyF7vlANRlx
         Pfj1njtRZZ+v8FRQQhtuNU1VpwAa8Vb0XS22cIFd43GmJbnlI3Z109UIFGanIsAk1xi9
         0yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723087798; x=1723692598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01aWtP1xPWHBVXs5lQjLNJmhvUCclZ42tYEJQkcTgC8=;
        b=g8f/hw9Ggi5i461MltNeF7aX4txAPPuQEXpxvp4+TDXWPgVzDr6z52iSxG8Otr2qdk
         KBkCyRBe4+SqzrHxZNmpC8y/N0ZW1JcG5UZ6TSzHNc05Ido3hPSMqIzBuZkzZRtzQ+lV
         JszxTOhRi0L/x+JenvdOrsEiXdVxId7yX8PooQNMeO8aivfLPmRYICWcwdaVBB/Ia5e2
         ZU3xmquUtFkoTd9JWtqgnsMUF1ZPabLNKFcPfqneZrPgAVDKC/k07hCQv+irOVQZ4/1s
         WFy/Wnb0RLA/BEQb+zHxwRFMqnTyjEI0tfKd7yL4MPPq0NVE+UticrdQPgrW1lDXP6iM
         DkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB6zWha3gKx8Mk6KuYu4bZfCFKbuVZMCz3/rXhcdO7zVZ/s1c2iXlZ3wXDrfPq06rxvmxWdIQBlAYs3elB@vger.kernel.org
X-Gm-Message-State: AOJu0YwHI3fXukYQA04OVdTD3t5qUtVUaWUOevV49eCr5Ab3BPPYBDXv
	br5d5xiLeNh5Tg7QNUR3TbwIDudhvIsVuo4zfpHNBkpe8FSZIc8PgRCpysUd0uE=
X-Google-Smtp-Source: AGHT+IEpSWEleoN6z68EahBVUey4dWAXs0UACNyEwvkfecwreve69icdPVyIekFeZZlLj8kCtH2Cbg==
X-Received: by 2002:a05:6358:61c9:b0:1ac:ef39:fd6 with SMTP id e5c5f4694b2df-1b15cfee7a7mr96947355d.28.1723087798113;
        Wed, 07 Aug 2024 20:29:58 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff590608casm113256985ad.159.2024.08.07.20.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 20:29:57 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:59:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] cpufreq: Enable COMPILE_TEST on Arm drivers
Message-ID: <20240808032953.uzyn4ou5bxm2uood@vireshk-i7>
References: <20240806-dt-api-cleanups-v1-0-459e2c840e7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-dt-api-cleanups-v1-0-459e2c840e7d@kernel.org>

On 06-08-24, 07:58, Rob Herring (Arm) wrote:
> This series enables building CPUFreq Arm based drivers on multiple 
> architectures when COMPILE_TEST is enabled.
> 
> The drivers for x86 and powerpc appear to be dependent on the 
> respective arch code, so those can't be similarly enabled for 
> COMPILE_TEST.
> 
> I've built this on arm32, arm64, powerpc, and x86 allmodconfig. It's 
> been built by 0-day and I fixed a couple of issues from that. I imagine 
> a few more might crop up when this is added to linux-next.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (6):
>       cpufreq: qcom: Add explicit io.h include for readl/writel_relaxed
>       cpufreq: omap: Drop asm includes
>       cpufreq: armada-8k: Avoid excessive stack usage
>       opp: ti: Drop unnecessary of_match_ptr()
>       cpufreq: Enable COMPILE_TEST on Arm drivers
>       cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers

Applied. Thanks.

-- 
viresh

