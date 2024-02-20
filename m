Return-Path: <linux-arm-msm+bounces-11878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B828185BF78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 16:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727EE28347F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D6E745DD;
	Tue, 20 Feb 2024 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLMBHFWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AFE73187
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708441685; cv=none; b=C9ld6X9klG+wRhyge1EdXykGC1sIXXKfLEbdsh/ezyb0weJn1BZL0Wr/kVoccZyeWQcSEWZLxUZuGKMBWWjcjM4Mewc1o54DhtwIiwEvMeJn59uTmRt68Ur6EFflsnxjlUV0+zMdm2lnwylWrT6yobUTXDju18BkfauawixaUIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708441685; c=relaxed/simple;
	bh=kwuCB+NIq1puSS5TsMWk2sSrB3UI23DqZRK20sJGEBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBzQ2uba1rGvbo+O3gsVdvMQzramsDX79ESQDMjrmQVJrIWUV1tdc3DJ0OVD7QmHzxiD/eBJckaRdfBgRBcUs8NeDx7p7iCXg0VQYgNukddX0WUHBbOYzyDfNcTsBD0tih+2dko1gkENmI9fJpvWapzK+V6OOfyK6JFdk/bJiMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLMBHFWu; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60869c68926so6229377b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708441682; x=1709046482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aqJwFAkkc43vrSyN9lwc8naI853QjkeHrfLLwt5JeQE=;
        b=sLMBHFWuyDY8UOpNij9+uzSenixvg2gmWBmwX01qv8zgpP5HAYZ+swcwbCJ5AsuEZp
         0eCH1mBo1ajaFWsbY7tB/9S+IEeZgcuOb+vddHKFCRx0irO06orfrr2QkNbPYvPLLqqF
         h78cyq1+XoJfkhmUlgFbJBRIcM/WcawYgxeN32plCbS1SPeGHyyuTiTgce2M7k75olzr
         PS4ytW5n3l2hqf2aqpd3dtSPSezZZlV0TiE1aMdv+78YoRczT7iuiLBS6Tx//PFbquBF
         Qan1O1t9te7Og1bg+hZ5rksyP2wrJ7zLALvrCYESZWOk3bRMH7WthfX9KEdiUOZOeIk+
         l/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708441682; x=1709046482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqJwFAkkc43vrSyN9lwc8naI853QjkeHrfLLwt5JeQE=;
        b=NKQukdZiTvq91uShWpJZSqeTFf5UeUwaSuH4kUDptH/W+QaCiAEXNzV+4GVA8FOzC1
         hwsKcZUc/irx4M/6rRLjQR7TQ7FU+vXuRUKdhO/oG4Zugd64LgFci7naPGGfjmLqHDej
         qaz3brmrhWsOA/H4Vd7WvyBRzuIuZ5X8Qs234vIIHiFfphenNNV2jIhw7T74TRlDwscf
         bVUQHJhZ8zH2HdlQclPoEVFZbkP4yC39kW14YoWbnMBqwvLZzQE7xMgfSkwTv+wEZyBu
         T2rCLeaFsBkR5HlNtVWNzN9yl1q4JNRRdYXYYZxpYHfsAIBhYEK9xqGsFIWfZ+6NoPD4
         JR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP8DfObg/tBzeCRgAZzbHeHliKWpOVkMaF0599oGk2xzMA/VgtSmk6jsX3J0kpjU3TFxkvMECEjFjk+lSd66J3zIporJdbhMoDq5kwwg==
X-Gm-Message-State: AOJu0Yz9kI9/fogJfLdJP0rPucE16izFX+1U3r8IImcIrXGOyldnV9Y9
	3irZSnp4N1sgqh+HdqxOUaNDv7lOdOtpvgLc/Ns2tiYeumNJ5h1bk+JjKwUb+ya6Z0odrk/LQnk
	FFJIoZezD39yWzv36mZjHl7cfZnb/8liZXpXoLg==
X-Google-Smtp-Source: AGHT+IHdekKqXY/wwhv1RRDJOaN+kUY/5Ujob9vjM/5eL8M11cX2uP3kIvac0Jr5M2dmGLVcBO8zTmi1JscWBwxIIoI=
X-Received: by 2002:a05:690c:f90:b0:604:9551:f595 with SMTP id
 df16-20020a05690c0f9000b006049551f595mr16731907ywb.50.1708441680946; Tue, 20
 Feb 2024 07:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org> <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
In-Reply-To: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 17:07:49 +0200
Message-ID: <CAA8EJpqaWHVqf8+EbkBktftPzPU0qq00PGhsoxYztRFuXDHv7w@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Helen Koike <helen.koike@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> >
> > - msm_submit@invalid-duplicate-bo-submit,Fail
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do you have a gitlab pipeline link I can check?

For the drm/msm, same as before (it had this fix in). But at this
point I should probably run it again for the full set of devices.

>
> Thanks
> Helen
>
> > ---
> >   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> > index 8b82e6656924..47e567b4f7a7 100644
> > --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> > +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> > @@ -5,7 +5,7 @@ variables:
> >     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
> >     TARGET_BRANCH: drm-next
> >
> > -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> > +  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
> >
> >     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
> >     DEQP_RUNNER_GIT_TAG: v0.15.0



-- 
With best wishes
Dmitry

