Return-Path: <linux-arm-msm+bounces-42373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22D9F38F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B02EC168FF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D608206F0B;
	Mon, 16 Dec 2024 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hzIXKspo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCA20629F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373801; cv=none; b=Z52hPMw5q5Yr2ZJU+NQzWsLmjLMllkv3ZADQtg2qZ8C4dUrV+Pfgdrm6emIf7lNkeomwik0ayfOpRWnHSZ0KSOMjrG0aLKbCf1y+671ERQ6lKnwFhoa114r1yOio66F+fOltg3IQ/1UcxD3vX7X190E1lvCDdLaZJ1WJQKrdM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373801; c=relaxed/simple;
	bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsFbI1wLU5AjYzzGqe1pi77+XMDzWTIlbHMRC31N5SRaELADjpl6tQWJdhFPBDLVk4oET3sSkUUuBc6+Y4Fu8kcuXO080U+u8alC+o8eBabFQ9uwPrswUfEvXgDoZ7V4YL9kZaGmvVkngWKDPNKda4eCW7Zby/uiq6rGTVLkLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hzIXKspo; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f0054cb797so35490307b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734373799; x=1734978599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
        b=hzIXKspoPr8yLJl/ZlJNV7fnBIGtdlFUDvTBuMQ8ELR6LffTieTAahyjqzRl54BQFk
         /NryktWVmYlKOTV/Wkn1AugP7dwKIUErOzTgRdE7+xN5higb/ij3YU/jmxO10vFyTorj
         ThuL57tTEB2FLO8Oc1k124WWyeoLw7bxmid0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373799; x=1734978599;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
        b=W/I7qKVGAol9ANOGywxF0Q7a4jao7/HErMoOLIYu42/nIwRcxtgaivp5JTqY85J/D2
         198bDXOGyJ3Rq0C1DAkXRZLOwBuEUYcGQkfxjATzhpwYR5hHcJXMFRnasiEeRWXgIYlJ
         ZljbjGOHM15AvauVeqm5jww5SKNYTFwZWgos1PiGOgZQPw/LilbPMNtITVgXdcfLlSj2
         7Wz8RW5i0LOwpcOGcP3Fm+D+3Zc7TYRXzjuZgyxhI1dQ6R2pZxa639EqtxOr8yCg47eX
         7DdqGWcpjEsto74/2/QY3fwpMas3GC3olR1aEaDBuSWk/TY/JTHRFfFoIXCJMvkvE9lo
         LMNw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Clgv21BCLJ6ci3ab2v41qoEcixQm4JsPgUMufUlZub8utBA2tPOViIfNG2jhbzTx2xZu9AAqCNKKB/TQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3d73IrpsLHx3EIfHQX3JeJOjNL/0FIvsWoYD3iGO9xEUUIWd3
	FBgZ0nT3auCWdILg0OhD8O7g/y+f8yxOj6EUs9c6kDPGvkd4CkdgrDPJA4wzF2v9rOhRQNYZfzn
	Hk9QITkgS9lhw9zakxBJIk5WlRLnhljJxNfTL
X-Gm-Gg: ASbGncvmzyz88ru+Jw/S2sUjgMo9XXOltgKgguGbUkol226i5muHj0CFve5vv/a6Eag
	0w2n02tODMLGgiEekXhsgWSsi5KXVGq8sE/5whGN6cXXwvVHL1P8Yadh1fERENYn3HA==
X-Google-Smtp-Source: AGHT+IFec3otTchyFxbDJfKFBz47WzGfI8yjCwnobgW8mFZyVIcbwLvFYT+D1W5djrG5rBzv+7Jo60SR7JxAagJAj/U=
X-Received: by 2002:a05:690c:6005:b0:6ef:4ed2:7dec with SMTP id
 00721157ae682-6f279adac53mr117919057b3.8.1734373799003; Mon, 16 Dec 2024
 10:29:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:58 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org> <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:58 -0800
Message-ID: <CAE-0n52Uj6h=X2PqZcPBnPDR_vVfi4_Y_miG-dTPP6FzH8rtag@mail.gmail.com>
Subject: Re: [PATCH v4 15/16] drm/msm/dp: read hw revision only once
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-15 14:44:20)
> There is little point in rereading DP controller revision over and over
> again. Read it once, after the first software reset and propagate it to
> the dp_panel module.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

