Return-Path: <linux-arm-msm+bounces-15250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF93B88CBE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 19:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EF181C20A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D358527A;
	Tue, 26 Mar 2024 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eldnj7Q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2515208A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711477155; cv=none; b=FMd3yxhGf+wZQZAQxqubWyK5+2mtM+jem5iJQJcPLgcwVQfu+DRBMjr2wnQ2Ms4+r6cifUAUKbUTgK5K2Mt/9pCCug3C9eXFXLjkbVUZ2jfm8XDNa6XXEbVZIyOtyNE/bOButiT5YjHbwJ2uf3bLT2lkM8n6xFUFkN4xkmEOADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711477155; c=relaxed/simple;
	bh=kE4s7E13A37rsrQkk/iO8j4r372xV995/m+AqVZL8wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvVVz4frD7d2ElmhB+k05kzMi82eH5cTb05eF8ArnxQgTy3GrIN+dTH5PYDTtnWmFraxQucC5mnrazzhi4DOR7zMeIe7LV85XQharlWd4tRFhC9uq+F8720Tv7ePwfLvabT4yPBTjxsN6Co33aK0kd7lVDaL2HsaMHoG7eRo8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eldnj7Q/; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso5576602276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711477153; x=1712081953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
        b=Eldnj7Q/Jid4KYYwV5NEQbyBhTI8Dm/WF4s5CjzAwIMHYoi3R0O0Ev7FOH3xE4hvyL
         9DzqT8OGinBUATDjyAX+HQPigDWd6cES7pnQ8Srx9JUEL8sE3uzGl97b5akoNCLUgm6A
         YZ1CHzW2i7ojylbpZuX79IfKSjX6SaePi58AsJxquZGWdpvhFbEupp9xQ3Qt6GqTvXkd
         KlyXsZ71fu4jAQseF09L/Ki360RCV8LRhFty4DAGLoLOMp5PnqIKXh8m9KY01cADjUuy
         6IN+EfyyCoiyLPbzLKJbn8jW5pdQqcGYI94/PP9zjUs/oei2+luvTPwfln7CDQvSeooq
         oneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711477153; x=1712081953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
        b=eKcRUTkYonE9EuPllDOtUCA2v4b8LJKGCt96rfzl1OZIucu9c3fw+hd4IJYZyvP33m
         +uo32biRiBFFZVBXJssgKbHhaOmsDfXnfs7IBbS3iq2jQFdrzj3u1DKTcwN/gfoMiVcN
         jTgbJu3b2Ef8m7Kt+8jVkMQ0ZC6gvIaQmO6xXGEOwzWBX1FrHKecaT2UBTkT7xiPfGjG
         yFpBUCUGvOgpEDnH+u/MOktDPA+EuFXR8qvUBgJxuKDzxoLGnCD/YgUxLXKzRP0hIyZL
         FBN9WREPCBUpynHmMJ9BdR/WMtrWx6Xgwtr8ofJnMAWKc/yCSZSuOsmkGxNIkgSNQzWl
         5OcA==
X-Forwarded-Encrypted: i=1; AJvYcCW50Kea6Qnr2oFOqbNlxnGN3QA3Fm6XfOXGAdoDMx0jpm5AD2N1RUPi8RHFiFgJrr0nKt5FJIaATX8DjfJkHB5202e++bOSKqoz+AFpBg==
X-Gm-Message-State: AOJu0Yw1mhmK3h0SMudSdppvJqdtCOG0CqZtevzo1if1twn/ZW60zcAR
	IJRaYw+Zbut0x42p5rxS+jTFS1Z8zEmVbZhCh/ZztIDwd0IUJ8/tU4uvNf3RY7b04VFXKziv6gQ
	kZNsSnmfoXqlYvLcTcEqYM52n/dEmh6Q0tzv1/A==
X-Google-Smtp-Source: AGHT+IFMp3OMawqOBv0a8n7GbzvaXu6Kp6vGmhRT4WskjxEebuGXOrN6fvoyGzz6SGmREGfuoZ6gKvGOsfAU2TMNBoo=
X-Received: by 2002:a25:820e:0:b0:dc6:d093:8622 with SMTP id
 q14-20020a25820e000000b00dc6d0938622mr491441ybk.15.1711477152723; Tue, 26 Mar
 2024 11:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
In-Reply-To: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 20:19:01 +0200
Message-ID: <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi,
>
> In today's next, I got:
>
>     drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> 'out' set but not used [-Werror,-Wunused-but-set-variable]
>
> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> fully implement devcoredump for a7xx").
>
> Untested diff below assuming `dumper->iova` is constant -- if you want
> a formal patch, please let me know.

Please send a proper patch that we can pick up.

>
> Cheers,
> Miguel
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 1f5245fc2cdc..a847a0f7a73c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>              (block->type << 8) | i);
>
>          in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> +            block->size, out);
>
>          out += block->size * sizeof(u32);
>      }



-- 
With best wishes
Dmitry

