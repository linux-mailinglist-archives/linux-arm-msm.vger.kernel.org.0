Return-Path: <linux-arm-msm+bounces-34254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAC99C372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE2EBB253A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F21C155753;
	Mon, 14 Oct 2024 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="foWIHP+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F41553B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894742; cv=none; b=Fp1HIPGQr4is6Vnuhorgg2M7d8JBsHPH/x1NAhgeaXAvDMacJfILHI1hRHeD1L/5GB/RyJBfv11iPCo8x5O4GHbazm6rmU1IC+aNT3V0xgbatebuyttjdYrZp4hlEDgw1ObZX94OowMfu3O8ruohgnsmr6ED55GEGvYjvsVckdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894742; c=relaxed/simple;
	bh=cxIKPl7GKVQn98O/mrnEhVXAkE0uTRhk4Nnr0kHKm+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTiBHyfhICkcewQwL95/kGse7blqPXy4S3mJfAQOACalLA8GzSrpuWVc0l/JCaaFjg8HFILp+XDSrKVAhP9PFAN1y8Hq4U7o99s4IoelRZiav6GsHDqZKKatSGhj4CPrvWNKi++5o/npV23gLZtPJCGcEhw7GgvrWU4y8ErZTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=foWIHP+e; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f53973fdso605965e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728894738; x=1729499538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=foWIHP+e/j4WPmc12XR+s0eqpaPeJAIew+yXe0dJrOL6Md0pWILKz1Fz6HqPmrhgHx
         41o0AplCjHehGfpTn0Uru2Nc4JxEvszJHZ223ylk+3VEhl0Y4xMmejQVa8LF0Fw6QYOZ
         rdNyE9LnsJcrN5ihhk8b+qIfJvkaxopFlrCVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894738; x=1729499538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=i7hnC+0NLOA13/mkyD5oRIyMpJ3POS1djC0zNzb0f3NwFNrRijKBLee/yLduzqMfiv
         LjzF/WlDH75cfcRH9eSdlklH3ETvyg5jh1ERXqQpLVQ0SBJlA2Hb0QYMgvGaDgcbF/jJ
         yV0JGH4XUsfPEnBlhJCwBZbGMNMdSwTk4DKikCN0OSQKb2b9XvbNNyeWYlS+mOGq+w+v
         iX/d8uul6JsMLdcbFGECcQE/u9SnG8dsNnQaKKYEARiF9k++VBJL2EF3C3xFCVgMlf+G
         XvGANbJUsvv8JeD66kQfqra2cQs4ZiLfjU3f1BzefOEthNZLsQMws//4Yu3Po8PxeHg2
         pfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEtgpqFhzDhYMh84NpnTIZ2xm/hgbBb4NT6PLgbibNHDQM/SF+F+Y/iiROAOeU5DjfmUx6EhI1qaQ4f8Cl@vger.kernel.org
X-Gm-Message-State: AOJu0YyessyxkvKExZBo1JBNRwZNWOFQXgLC5KMX1bjnBC6TdveCDTKT
	1vHu7XGtv2ZnmislHb7PPSFpIQHFzHPKwIYyVtRfUxmmvv9udL+sPQNGXboql0QWplbwAxvzF1b
	z+c9mBltQSIghIYNDkl4oxOQXiMzTomclYIcf
X-Google-Smtp-Source: AGHT+IF8yCwYVSblYBBqvyU6aaOkHAFhmYHymC9/n8uskosKRPRl9o+TsOQe+6xYXWvIN2tZjy8ERc+Cu1NL6JnlR2Y=
X-Received: by 2002:a05:6512:131d:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-539d6ef4d72mr2569999e87.30.1728894738003; Mon, 14 Oct 2024
 01:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 16:32:06 +0800
Message-ID: <CAGXv+5FgLQMG=tA6d_gT71j5ZxWPa56rW1UmfUgKot4uCj56+g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] thermal: scope/cleanup.h improvements
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:06=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v4:
> - Patch 2: rewrite, significant change: kzalloc() also with
>   scoped-handling so the entire error handling could be removed.
>   Due to above, drop review-tags (Chen-Yu, Jonathan).
> - Add Rb tags for other patches.
> - Link to v3: https://lore.kernel.org/r/20241008-b4-cleanup-h-of-node-put=
-thermal-v3-0-825122398f71@linaro.org
>
> Changes in v3:
> - Rebase, because there was bigger rework in thermal code.
>   This made two patches obsolete, but brought new one:
>   1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each =
OF child
> - Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put=
-thermal-v2-0-cee9fc490478@linaro.org
>
> Changes in v2:
> - Drop left-over of_node_put in regular exit path (Chen-Yu)
> - Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put=
-thermal-v1-0-7a1381e1627e@linaro.org
>
> Few code simplifications with scope/cleanup.h.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (6):
>       thermal: of: Simplify thermal_of_should_bind with scoped for each O=
F child

I couldn't find this in my inbox. But since I already reviewed all the othe=
r
patches, and I looked at this one on lore, consider the whole series is now

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>       thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init()
>       thermal: of: Use scoped device node handling to simplify of_thermal=
_zone_find()
>       thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child =
loop
>       thermal: tegra: Simplify with scoped for each OF child loop
>       thermal: sun8i: Use scoped device node handling to simplify error p=
aths
>
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++---
>  drivers/thermal/sun8i_thermal.c          | 11 +++----
>  drivers/thermal/tegra/soctherm.c         |  5 ++-
>  drivers/thermal/thermal_of.c             | 54 ++++++++++----------------=
------
>  4 files changed, 25 insertions(+), 52 deletions(-)
> ---
> base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
> change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

