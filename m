Return-Path: <linux-arm-msm+bounces-27303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD093FECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814891C22282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9CE1891C3;
	Mon, 29 Jul 2024 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EpkRUYkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAB43152
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283742; cv=none; b=ZDLOoIcysPH0CSDFNiwOgYLVzUSDCFNQzJURCV0pDWWWy3YegPAiX9B33NIyhEwCYH1wtkwFIdDciPhLUnnZ4J02rC0RtLFrFBePvlkdNdi4/GWTT+uxXKBIYIU0shXfJuHxT3NuYi4t1aqw+jxfX29jj5OQmkMgJ4NUAzh+EbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283742; c=relaxed/simple;
	bh=/jIHXG4vT+DDXeeiF4buw3dVqIn5OLZLpsCUv9QEgTA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3qLKcV2DjXsyvBvHoGyXgucyg4RFjetrp9deFqZuKzzxZ/fJzuYh2A5TlC2SZzR0qq12kBIeLUZOSPmOdwQiPhA/+B7LAGTOqIs7Ku78aMQdCguAb5Fxg6nfGtYwr7+cqpBQu6zk1vJ+eqK+En/8G5VQeryhZrh9rUVGpweLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EpkRUYkT; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70940c9657dso1606015a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722283739; x=1722888539; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jIHXG4vT+DDXeeiF4buw3dVqIn5OLZLpsCUv9QEgTA=;
        b=EpkRUYkTaXcnqLodSHeZdg0yVhfC5+O0n73cKq/PdBlELTyIqBVZzh9ri7x1akmlsL
         JopF/MDUAguzSfDJYk0hlEPn5RJXmBVWrziByXpQyJn0wK8spiWbavbEzjJz0tRo8u7J
         xP8yDQmdMsb74zpUtWk03SbsdanPk9ufXaTvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283739; x=1722888539;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jIHXG4vT+DDXeeiF4buw3dVqIn5OLZLpsCUv9QEgTA=;
        b=Z5EzSmk4im8S/e0BdwjFyrEciX4gtpYDL79RYvX/LfDhRhbjhCvv/co1r5RdZAdb8q
         86uhauP84Us2uoaSA7cKZyDVCF9wc6GdYx8U+cYmtKB1AW0+AEo3D7Gsr8lfazGatOoZ
         L4kEo4MfeQXmFt2KkO0aVaR52YoZ1OiPAlPezHyQuqCFWkJpZGPBEndiIuKHf4HC99dt
         m3o0WQW+5ExcG8kxAWLpdhLe3NJSVC3wPpQo6pe00rnfkCQUXf6yhihrgmI88F/BE2n+
         Daxe7OzEsMDO2zd0QJ++9XsLjpqVRJO7qh5F/D31BAjqpM5J7UNATZhg823eh/5IAE4y
         zWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUruo1YQrLqVr5+6LYJkBIbNBu6eJwY3Ix6iPQVDE7PmbAlOpT86OZ5V3ZZ5JTLrB1fKuKM5NGIHfMs2703GXdQvqtr5kCDFovDCf/G9w==
X-Gm-Message-State: AOJu0YwVKSdEMpIYnOcb5yUUkfCV3T+PcD6HN8sYy9ywkS3U3xxvjFQk
	Kk9ZJdjRhk9q0yMnKTPjdanG+IVlye5+CbQIEOUr63cmotpBKUoUgLulkYtJ2tKoSBEk/xnWX7T
	aTvGnj4BSM3l2ePNYRH9Epd849EiF4fSImzj7
X-Google-Smtp-Source: AGHT+IHpeBg5e8K4m1AjsYDN5Lf6w44ZrVNCRytKZPa/zJpkcs95lHEvp/x4E8DP9QtdgZhxg7CCNODor9FG/pDAGIU=
X-Received: by 2002:a05:6830:2714:b0:709:3b82:7680 with SMTP id
 46e09a7af769-70940c1aa9fmr12988155a34.19.1722283739275; Mon, 29 Jul 2024
 13:08:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jul 2024 15:08:58 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com> <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 29 Jul 2024 15:08:58 -0500
Message-ID: <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Guenter Roeck <groeck@chromium.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Vara Reddy <quic_varar@quicinc.com>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, quic_khsieh@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-07-29 11:28:35)
>
> Thanks for the feedback.
>
> Your change looks valid. We can use this and drop the max_t usage.
>
> Let me push this with your Suggested-by credits.

You can take my

Signed-off-by: Stephen Boyd <swboyd@chromium.org>

and either squash it in or make a follow-up.

