Return-Path: <linux-arm-msm+bounces-15254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC488CCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AE04B25ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 19:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198FE13CAB7;
	Tue, 26 Mar 2024 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KyboOhyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2913CA8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480261; cv=none; b=QKwEacDLhO+ePzUExnkth5TwB6KBxskNlgk3LKWj5ky+M9NxrjCHGfukLT27wH8Lhc/sz/HP9mMsxji7GEP49k9lJ3+smbBRvG7U9vUGiN49ySf1MHkUQGFcODBTQ2gZ0but+9jz5wxffOp/5yUK1nJzg/Wzizehxr20KGmMKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480261; c=relaxed/simple;
	bh=ToUJYuhDAz85g4r/WsOFeLYCUrSVtmnz2atZohdxqro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgSP1rFkWa9sT8dnLAhE+JHwgiM5s1wvoXi/n2JUIeGizNXao2MD917lkERo09vTTLK9QH9rS26H7hdSUH/S+LoOdPyLqYZ3HpRVwaA5gR5FRbbt1+EUahLWydvdi4B9AjPSj+fLEaJqKqbNqkIwKZhl4J3uj0xYBrLvCo2CsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KyboOhyR; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc236729a2bso5724339276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 12:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711480257; x=1712085057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IE7xk3OV0JEnARvb245KGQxZo7yTliXOcGgjSpwEcXU=;
        b=KyboOhyRuXfJCIxUVWw6CfGowuRRuGG8Hl/Zu3W1So1vm6hnDjnOIxAfFZk464dRWx
         pJmxe1mBF4iAweAT5U7Y6KKuHR1N1Tum500QgEKnCYgWReu77vixvoBqnuB9LgL0Wz9m
         PwKFRrAEivEXfr850EsKM4EnCxhZb8iEt6ZZ4w16y/4U4CjBhXY8RuJblOS0K+pYc1MQ
         /gKJK4fViQS0LVV+tzZEGSvMC3n9MgWJcuUHAtcsE0WSvNUqymRJvsOefRuKfp1X8Ema
         RDJczZYhF3wXyMoiu0uoNot7a3DG0gmqjwH+B0vjRp0YsieAhtFucD3/lawyYT2G44z2
         /rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711480257; x=1712085057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE7xk3OV0JEnARvb245KGQxZo7yTliXOcGgjSpwEcXU=;
        b=hg5GqF86Z7bTa1Efwip+aEtR63n2nwbbSft00peCNfsA1bGQMcKxRIg8IQt8SE24Tf
         grfPdZGxblFMqvSwAT/fDWzPsXeszvoKeOEBHgrRjaARw2UWweEsH2h1a3NhuOfl71pu
         fRaj86ZC2JKLhPEs/LRl7Nj0Amy5OtsDyNMwhc7bGJGVNoTe7osb2bNJVcvx965dNTVf
         dEuI2LgeFs/VZW2yPCiWsd2NiaYb5+6SaySKOEKfcjpobs6rjWCtEgWweEQx4o87q5BO
         kBlxip5bM8FOMML3lyDcsS1zszUHOntMC9k9bRAc1tRJ4QvHQtc8UjhZdAkM33rCwbCP
         W8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVk8wgyc4vYS4/pHAGa80zp746sc3yO8d0IaoQl7LlYLyAIeryvtt3Tb5OZ6wujy5GdMzR4d39VElJ5ASwvrw5njX5BMoqFj3upmLJJ4Q==
X-Gm-Message-State: AOJu0YySS+XsZFuYthN5M3To+mWWR8zmsriqKj4BTDlwhmCI9AWTDhvq
	lp4rYWXHeOPCIYw/Qu+LGIvGfCQVY4DyWqxTwxMeSY5P2ybDPRsBbR7oixNQYpjK5M9Z+OHeh5h
	twVWbghIXxtcnK4v70OsAimTyTYBgr4KLUYcSZg==
X-Google-Smtp-Source: AGHT+IHxqKh1R1vXRToBFH4FuBo80Q2nNxyZ5k8075XA5DVC95AeGuZIe36QWl9BniHxxTeZsSRtUf9UFqbtNqvcfSo=
X-Received: by 2002:a25:b103:0:b0:dcf:4663:ecd8 with SMTP id
 g3-20020a25b103000000b00dcf4663ecd8mr2128971ybj.8.1711480257065; Tue, 26 Mar
 2024 12:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com> <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
In-Reply-To: <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 21:10:45 +0200
Message-ID: <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> > On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> In today's next, I got:
> >>
> >>      drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> >> 'out' set but not used [-Werror,-Wunused-but-set-variable]
> >>
> >> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> >> fully implement devcoredump for a7xx").
> >>
> >> Untested diff below assuming `dumper->iova` is constant -- if you want
> >> a formal patch, please let me know.
> >
> > Please send a proper patch that we can pick up.
> >
>
> This should be fixed with https://patchwork.freedesktop.org/patch/581853/.

Is that a correct fix? If you check other usage locations for
CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
being incremented.

>
> We can pickup that one with a Fixes tag applied.
>
> >>
> >> Cheers,
> >> Miguel
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> index 1f5245fc2cdc..a847a0f7a73c 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
> >>               (block->type << 8) | i);
> >>
> >>           in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> >> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> >> +            block->size, out);
> >>
> >>           out += block->size * sizeof(u32);
> >>       }
> >
> >
> >



-- 
With best wishes
Dmitry

