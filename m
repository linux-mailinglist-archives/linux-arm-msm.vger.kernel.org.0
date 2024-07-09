Return-Path: <linux-arm-msm+bounces-25539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8D92AD12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 02:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C348AB21DC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07B526AD0;
	Tue,  9 Jul 2024 00:24:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34AEA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 00:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720484669; cv=none; b=fuB/HQfySvPrfe6cFcGYkpuCdhZlXlz3ZgVpjKr1vqnEkRhwQiAFATZ3EvdxGNarn9RlcHjAffZujkh/6+d/KWAB3u/QvsjVkzZLAn/xIcIQ/rA9jRh99w2Ub5ONC+gQaHgUq/bkhWTlWWYxKuZZGFrsnaMyfOXfR4LxEKowxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720484669; c=relaxed/simple;
	bh=OXijfxSktD32jVhvGlHifwLx3aNVOhgOTQl728nchT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gO05U6UtTrBSHjjHwTsG1P9jr15YxhSyVqhJXfui1pxLJqP38txmXAjGK+mNysFinJLvH31WUYp5tT1BoqtWy48P7phskraFnOUK1heS/i8wyXeacIjJi4dH1BZe6YeEPeLKfvGUIs1nT1zQJkNdMqxO8y3oMoPxl1UpSr30j/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb0d88fd25so29435975ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484666; x=1721089466;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlo3UWV9lkDtVHiC3tnceLIBeIIjDfMxY69ysONeH1A=;
        b=KoJfaAr0tvMMmbQZ/MTSmM6HkKJQIKmZIMJwQTL35irUVsdwQ+Zu3l9TGLBrHnI1Hb
         kqwZ+xOX+f+oQx28D2d033b01rGaUmGz4lQh6Jhja5S9+hotMVr7jNDpFngWrR2PEt2W
         SLt0nZ4zNvYpRsdS+hnl3vPy7+QGEiDjbcWYCDTP97NmsEhg9ARvXw03nmNNhH7OSMAq
         kPxxYpceWnPV3PChry7SsaEvfV6E6mTdv6jwCo8hSYBzJIvh3cOSkOiFfT3EoxDhXTfR
         yxLrxRSY1TaZJUSpDN9vAwBW7ivedrL429HssTKwV1F8FmL1D9NdjV/xP6A7M3Z853h8
         sL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwWBldEOdOJmOfpOp6AYN9Z+e1Jn7r/ob+eqEAJN2XbxRSEJS7NkGuTKqvkdfeNPEIFqCy9qH3b3dO9k7fyWFf7ucdPrhXVVIJacLwoQ==
X-Gm-Message-State: AOJu0YwCucDmO7xF+rH3tXL1+t/8XIiNLvlLj0KoKPfaISRD+331EGqE
	AE85beViK/OWb/0lEh7u4988trwExePbCSSiH6oXoLJm5flV/9+SYXl/U7a2Ofs=
X-Google-Smtp-Source: AGHT+IFdw3EaveRM2ZTHoRq8dYxA8E7q05nixOcYOGorj2dRL4w7J12n220WAjIf2IctJiJkVfxTEw==
X-Received: by 2002:a17:902:db0e:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fbb804725emr12528595ad.28.1720484666359;
        Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7d2dsm4321415ad.180.2024.07.08.17.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:24:25 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui
 <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Date: Mon, 08 Jul 2024 17:24:25 -0700
Message-ID: <7hplrn76py.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Viresh Kumar <viresh.kumar@linaro.org> writes:

> From: Lizhe <sensor1010@163.com>
>
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

[...]

>  drivers/cpufreq/omap-cpufreq.c         |  3 +--

For OMAP:

Acked-by: Kevin Hilman <khilman@baylibre.com>

