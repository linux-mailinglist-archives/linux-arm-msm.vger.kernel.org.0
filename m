Return-Path: <linux-arm-msm+bounces-6409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB7823A34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 02:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93E13B238D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 01:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25361185E;
	Thu,  4 Jan 2024 01:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxBG//jx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D891847
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jan 2024 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbdd013c68bso39160276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 17:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704331612; x=1704936412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx3u41l9QZKgZ8gqgJMArYJDVj+QtcewK5aizV2WGFY=;
        b=MxBG//jxkOix7uHTP0blxh8kT4uTDAb0l0VOexIorEfW09k4VMk/RV/7kAeRYReJLg
         o/hJXkZISubrG/LOknhhvq7QdT2mFB1h1ZnXrsrbmGq2pEssbOPPQTdgPXLx4MZ2ak3C
         2FAbJmIAk5nWy8VLSUS4/JUVyUEt4FFn/7/JDuoe6apd2OH/i3r5CRClISenJWpLybVD
         M8F09PdOcidskwevDJveZX8SnYyaScx/+2YaSQebY9cjQbqRTtJU1QGW9k2jyJlWf/uq
         fuRvZDg8WYOHUtmmZuWe/PJyfB1UEZY9UfV5MDX88lio0X//t4fTwVFAHp1xLjr48Na9
         APCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704331612; x=1704936412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx3u41l9QZKgZ8gqgJMArYJDVj+QtcewK5aizV2WGFY=;
        b=JxypUoQR5Kk6FZp9OSZjiLsvJNFQouItBoLNMPzfpgfw5wVFThv8L11cJH6EWCYj82
         P5aP9RzRk823r0y+j+WaUWIYZHTHwGWI0Jwije9FNAiwU5y/+VT+aGXPMIbG/S3kg664
         MD8V9rgnEtNEedMDNn2Xrrn33Eoo5wfxdN0hA9UHYXZugFXceg1aWw9nAckr39ehKnhK
         hJzfJy5BSrDxHio2DsVM75UaQigKiUCJL/84YNBM5pb+jA09OHxLLJPjhcVq9WOG3eP8
         hj9LYoC7WTLoBjpiOV8Mzai8K5oYYbluBFwWConGpmhB+DC5patC3qgreiWfN6268CI5
         vupA==
X-Gm-Message-State: AOJu0YzcoEUPpsp+IbX66huK+C2AOwu4vMQsm8uxZLpWHUUxP+M3yJov
	p/L3f6zsd9tbnX3h1aPRs8pl0EvLQvv1WpO+oJEmD/kSuIzgaw==
X-Google-Smtp-Source: AGHT+IEEhVZD8rlC33wLUE7sEisAzzhMZuDOknbIjleST9CZMG8wZDtT/Ef354wjvxIvysQtunyF38OYWJ3M0EFWr10=
X-Received: by 2002:a25:adcb:0:b0:dbd:b588:19e6 with SMTP id
 d11-20020a25adcb000000b00dbdb58819e6mr9908236ybe.48.1704331612558; Wed, 03
 Jan 2024 17:26:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231-cpu-cacheinfo-of-v1-0-cd3584d2c7b4@linaro.org>
In-Reply-To: <20231231-cpu-cacheinfo-of-v1-0-cd3584d2c7b4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jan 2024 03:26:41 +0200
Message-ID: <CAA8EJppCRzknaujKFyLa_i7x4UnX31YFSyjtux+zJ0harixrbA@mail.gmail.com>
Subject: Re: [PATCH 0/2] cacheinfo: allow using OF style matchine for cache devices
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Dec 2023 at 19:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Qualcomm Krait (APQ8064, MSM8960, MSM8974, APQ8084) platforms L2
> cache frequency should follow CPU cache frequencies. It is logical to
> put the correponding OPP table into the L2 device node and then add
> simple devfreq driver that aggregates CPU votes and sets the clock
> accordingly.
>
> In [1] Rob suggested reusing existing cache devices for
> platform-specific cache drivers. This series implements that suggestion.
>
> This is posted as an RFC. If this implementation is found to be
> acceptable, corresponding L2 cache driver will be included in the next
> revision.

I'd like to recall this series for now. It doesn't work as expected.

>
> [1] https://lore.kernel.org/linux-arm-msm/20231011154935.GA785564-robh@kernel.org/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (2):
>       cpu: allow matching cpu_subsys devices against OF nodes
>       cacheinfo: pass of_node to cpu_device_create()

-- 
With best wishes
Dmitry

