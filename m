Return-Path: <linux-arm-msm+bounces-41563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FEC9ED826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8B61884433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7E6259498;
	Wed, 11 Dec 2024 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLX8jkCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B71DDC28
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951365; cv=none; b=OqwVVqx3qSfRYaVH8gyr2FfUTCF8xwRyZpHUoM7Xuc7ll3+u1JgLaZkMt8g7PTYWVm98iU9063b+vUIm2NL6g7x6y/riG8quhGK2YDfBqnIxUC/lJ6HvE2u2mtFGgbAcw5L4U7tapvs0D08wi16pzODJ9gPYhKPmxstIBm6Vfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951365; c=relaxed/simple;
	bh=Ca8kqVvAVdINGWA1VQnxrxlJaZR1N1d7Xc+tsgI0o3k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsnXLt9yf6rOBlJdem//99y/F1uJ7TqYbC7dMqFfrO7e2MX/0xqDWQZLJHtPAE8/4W1WeXVP2gOkt/YmK5yoSLoEml/C6DHeFLZZWJzawKixz2f46t1rKRqQ7iTHSEMEUE/ZR/XeHkHckC0IOCtFCi8up89jHkt8A6D51+wy9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FLX8jkCF; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef0ef11aafso65792607b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733951362; x=1734556162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQDqVSakcr3mxA+wnwNeXmA0JdxuRMpWtJWg3CDfgIg=;
        b=FLX8jkCFhRuXrU7QylKC97gLdnErAU2u5l++JsXFYXZMunPWKoN0aFIp3bPRnpnA6n
         u8Q7LdYqHut0ejhn7GcCfv+psp8UJXikckcA3bi6HF8YD9BtFun0VSFvsyEG9MfApL5P
         mxiTZBm6T6JEOxkN5AnhEiOfxtJHT8jDJxnXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951362; x=1734556162;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQDqVSakcr3mxA+wnwNeXmA0JdxuRMpWtJWg3CDfgIg=;
        b=h4NRkQTD/x7IrxboJrRpaaG+jiReXQ5jIZVMCgvJGd2cNdBkvvNNvIYE6afIiUX7Ft
         Q/6Azb4QAumWhQuoDkH1ZjzMPjSm4IXcVhMFpn+EcaqaeYQOjbdfBKQf296ZO6p67sIw
         TZC0g7I7IJoV79DlnQNL1zb0uNDfjaB5AvZNwty5TaRWuP9M4DE/DrDFG0CMgWSqgYBM
         4Rd5lM81vS28zqw0LY2FV7l9sXIXG1C07x8Td9oJ6QvWiyIXjX2oaSHd2YRPMDX4R1IV
         ZE9W1s7GO3yO6A3+w17kfbI6tqu0hGwFLrpZoC8DWBz1pxoAR+UR6F9by9QH0oq438Du
         C/9g==
X-Forwarded-Encrypted: i=1; AJvYcCXIABnJAmUp4TqyCRD8urOIpR4jeDlwgwnoJ/ESPtYC2eO61uE+DkolDqDbEyEyPlfBZ+H5lfP6Gbz43UN5@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9pL9xbwixdguSnbLnL5IC/irUZpCqVbuF53107ufq16bCPPX
	rawzRUF3IDo9Bvt2QEXRtMmGtOrwOO8S8PE0DKnVWWkn0ArfIjasskrOIe/xuqzJgcF3N07ZJx/
	4gHDagWJFXJwbL/n15gvjuTF19dwZn6QV0m8m
X-Gm-Gg: ASbGncvHCXbv6DcdH9w302CP7r+moQiLrKuKCJp9OIkoB76Z22MDFJT40bA4SWRkvts
	KSHb73x2RM2H4Dc/H86InyJTPLf+3NoFQbxTTBkT7uXc5BQMkJJ6jSd1te2PiwDg=
X-Google-Smtp-Source: AGHT+IHQYD+rGSnTOhQP00f7jJc0s1qfCuYpNpAifu02eUFcwunSxMKsHSx1sXnfiWl+na08kVCW69bpJsghQkOvSbs=
X-Received: by 2002:a05:690c:64c4:b0:6ef:70ae:ca16 with SMTP id
 00721157ae682-6f19e86a455mr10895707b3.39.1733951362509; Wed, 11 Dec 2024
 13:09:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:09:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-5-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-5-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:09:21 -0800
Message-ID: <CAE-0n53hKPr2WsGWTy24qfsSO4TbmtnY5bOQQ51UuW4RPUz0Dg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dp: move I/O functions to global header
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:35)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 13486c9c8703748e69e846be681951368df0a29e..2c500dc0898edfe1d6bdac2eedf3c1b78056cf6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
[...]
> +
> +static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
> +                              u32 offset)
> +{
> +       /*
> +        * To make sure interface reg writes happens before any other operation,
> +        * this function uses writel() instread of writel_relaxed()

It's readl_relaxed() below.

> +        */
> +       return readl_relaxed(msm_dp_catalog->p0_base + offset);
> +}

