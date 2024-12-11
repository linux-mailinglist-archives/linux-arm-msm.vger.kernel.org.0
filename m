Return-Path: <linux-arm-msm+bounces-41568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CB9ED857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8F51886C03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843991D63F9;
	Wed, 11 Dec 2024 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D8/wlLoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257C1C07E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952025; cv=none; b=IViWB9d6Yymbv8WkJtLbzja6IrGTK40tAgooVd//TtHa1rGPq/95WMix5+LkreTAsaFUic5DzNGKrzQkqblXTEeVyf6NF8EfH1en8uFewyfkb71Degc8vIsxxAoKZGyZ6WNIinzH9Yf6bHPbQ9+e0+7oSmFJtCJcxT66B73GZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952025; c=relaxed/simple;
	bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3nqlptMIFnUIrOPZDY35Qp0bs6BMgTQnTQezvKa5UbTdtG3Nz/4Yn27JTUE0GfGNWQreI55uD2JdeInzGghOpMo4dwpIUz4Jq8kLmmSTq3wC9K5QFAvZkTZ0KGTwIX6PZWA4k2WyfGbDpydWaM5UHYh7nmLocQ5fV5nuTCoJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D8/wlLoJ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6eff5f99de4so50332507b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733952023; x=1734556823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
        b=D8/wlLoJgzEP9OfIDjcP/mvD0diE3K+8ECn62GJ5gE5b/1iKTJcJUimAzaiFRRCgdq
         WFCRfSCqvGB/rEFC1lMl1VZ51gmAZBbSZDde9aeZURh0ccN+VSkKpikLIdEPltcM05wX
         enjKNPH8ZzW5nn0n7LsnJp85ZWOKlF/jxffwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733952023; x=1734556823;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
        b=Bw/boUYVGZFnGXxysmFgBerGsi/YkR2gJAaPPDfAsoHdSiLZziUjQLQlePDqIUXs1z
         YuQPi64UbERYxuLjYMaNYOIiGTz2z1c8Uy+7Y9xkccyX1jsU7SIvoMiOiJl1Ds4Ay8BN
         nhAQhoMmfCcGDz8jM7G2jpIYbrp5ikdDrPrxwCnxSLeZ5hfzbb8XQLbrrgnaS3nYQgAR
         Y89Zv35ctaeNye4h5jC3vQ2t0QrcHIRuTcS43vS/bhpbrhP4ZWniLQ3zWxxBxV+nAJbM
         ZmZKd1b3T9fKL6heRB4iVa+dhDvz3Zt73zcEavPjBoAEDlajpp0gItKxa9CCIPcdidzn
         DWcA==
X-Forwarded-Encrypted: i=1; AJvYcCVwXYQRF//ECSIBTf66bJ7CQDmWunpMQYVsQ2t4bYIC87LKxsSRW1HZTq5XWp1uWNEOHwxLxvoPHxsx4rZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZB3y+8ogLNZSaqM/EQKeWZN0F5tGxfbf1iDqVR5qg26PFSP8
	6B0tru3e0zq9N5UO3gqrxlunbwgYA0zFigLT2PLq1iv5udtHm5ARPGMTKlI/5g4Y1dHg6SPGDNe
	e1Wp8IKu0GhpABkIsaKuBv251adoOcq+vs1g3
X-Gm-Gg: ASbGncuj1iwYK0VQS/qqgLZVJY+1bsnL/wWhJ6gsM4jRfeQ1jVP7/zoLbZhvBOWlVoa
	fswg9nFt/oseKQSY4WvOteQfuORs0N6Sen1HqfB5EB77jJIokEBC+RhpOtmfbB9s=
X-Google-Smtp-Source: AGHT+IGiqcJUcizFAGyQuCjc5BPiqK/fm5496Pa//h9SFBYiB9+QTvjnCAELvBpBSrKYiF5MVCjIFkIU1R/GLCyr/Zg=
X-Received: by 2002:a05:690c:6e03:b0:6ef:8122:282f with SMTP id
 00721157ae682-6f1a508837dmr10285587b3.24.1733952023136; Wed, 11 Dec 2024
 13:20:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:20:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:20:22 -0800
Message-ID: <CAE-0n52dsQko18bY2uu_k4AFNdeirQ0FaE-k0Jy9=Re_fGV+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:32)
> The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
> for the header output, while it expects a two-element array. It performs
> a sizeof check which is always true on 64-bit platforms (since
> sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
> an error code which nobody actually checks.
>
> Fix the function interface to accept u32[2] and return void, skipping
> all the checks.
>
> Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

