Return-Path: <linux-arm-msm+bounces-32076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330797D59A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 14:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005EF1F238A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 12:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE6414EC44;
	Fri, 20 Sep 2024 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZzwrcRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6614D280
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836271; cv=none; b=iLCyd6VdHgrCfsou3A/HXyeiMCICA1gr43A9trl97qimyoeiPgyCrGubpI3IO+owUKgJix/qodGIgs/XG4QJXZqRD9HMB30Y9DjMSgNpKKLrD+lYJJCZSnwKz+KJ4FjZzWW9Q0UhnbIge8DS/e3DKts0US3crgc4Fxm0vym0ZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836271; c=relaxed/simple;
	bh=B8MzUXbeIjS+MC1pxMl6CzSLrM5Bx82UeVG+v9v3rEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nydTz8r1uYvHnrT8h9bFnUqHdPtnb9GysI1Y84FHy8JQrBJ18WVxCGzFh1aEzonl5R+g97bOcSNt9MDHb+N5pQiSkFJ39mS6am5YHoVfgDMVRsIZ1jlUF5RKOxkF4COZF31Cr2l8LMv4bvGEOXv6KbkiJBOuxX7uzs9zKOMQRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZzwrcRY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d43657255so288246266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 05:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726836268; x=1727441068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDO0vPyvIABvz0DiT33xAJEo0l8Q5gFjEXHJSzmH/NE=;
        b=XZzwrcRYzLhu+bX/CdK2pMnPKrxruGMegxiAZmA6yHWXUbwLr7pNZmHdyS0I2jo66g
         2BCpwOllB832WYrTjaBfF6rpRSBpRC4UDWkDcFdV1h9F+AqNGaQKDJ0g2Klmuuuc77uf
         YUiyFx7YLxX/gQ/mpKrTF0tAxvx/i9KAk9ANNBsFQQodvFox7YO8XIAs7tWO5WjwjvTh
         UNSQVdZhlKFvia99LXeierzjQFtyUEM9Xb36xwmUEL6OQj2SGNA9COrVpPn2qpkpejke
         Aw1LEj1ihfVNsvhxWfOaDK7x22xV6vs2WEEhe9LPNxyjbht6/id3yPkii+WYHNbhw6eC
         WMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836268; x=1727441068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDO0vPyvIABvz0DiT33xAJEo0l8Q5gFjEXHJSzmH/NE=;
        b=VN/EvaFkt3+uf6uBgg3jrraCoyg3dA4aEs5RgCAxDNXlBUCS/RXMuQrutf6FVTHihg
         DzC4OrjfFuXX9egwyCmTozZXluVxA1vYi5RyB+e74dECWYWXe0fWl8+NWQkczN4iLrFn
         XTHgddNINDJCIlf7f7ucv2akce6AnkbpvyAQi9atzHitLked9QJXljCJTT8nMAPkHrIi
         9y4j7N2ruDN3mFN0zNlH8yMABQqgGcyZng5KcYzXCDX2x+V72x8ZX56yN9oagWkztrYN
         Yw3I70dGdXeTtdkhvRnA7HHJ0whcFQDT/TT/sTOfjOQhvYda766JKT0fJUwAcXL2afGv
         gNog==
X-Forwarded-Encrypted: i=1; AJvYcCWpZf845A2cb+9Zv+k0pVTjsr323J3ltQtO8m/6K/lr9GzG6IxAdZBBlcTPLSI/PqCmg8C3LQIxZuJpifUf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4O4QWGRKnm7qAyo6nlfoHnISsJHdNAeDxO2voonsPbM8KI8XV
	sXMRK8WLGKZcgJ8T0yPlXJ6Cm0N0oAYYeKToUHr93+RoPmWPpv367wkkqbzTqwk=
X-Google-Smtp-Source: AGHT+IGDYr84SfhTE9iCQ3CMFhcNCWIPXNlNOj1ld8jHd8Q6e5bYh+70KLroF2CA85pp6CVhB7OAtQ==
X-Received: by 2002:a17:907:e65b:b0:a8d:c3b:b16 with SMTP id a640c23a62f3a-a90d4ffaf60mr209109866b.28.1726836267822;
        Fri, 20 Sep 2024 05:44:27 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:de75:1bb0:80e4:4afd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e519esm855375566b.176.2024.09.20.05.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:44:27 -0700 (PDT)
Date: Fri, 20 Sep 2024 14:44:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, stephan@gerhold.net,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Message-ID: <Zu1uKR6v0pI5p01R@linaro.org>
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb>

On Fri, Sep 20, 2024 at 01:48:15PM +0300, Dmitry Baryshkov wrote:
> On Fri, Sep 20, 2024 at 06:07:11PM GMT, Jinjie Ruan wrote:
> > It's important to undo pm_runtime_use_autosuspend() with
> > pm_runtime_dont_use_autosuspend() at driver exit time.
> > 
> > But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> > is missing in the error path for bam_dmux_probe(). So add it.
> 
> Please use devm_pm_runtime_enable(), which handles autosuspend.
> 

This would conflict with the existing cleanup in bam_dmux_remove(),
which probably needs to stay manually managed since the tear down order
is quite important there.

I think this looks reasonable, except that pm_runtime_set_suspended()
should be redundant since it's the default runtime PM state.

Thanks,
Stephan

