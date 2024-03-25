Return-Path: <linux-arm-msm+bounces-15097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C898688B037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 20:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DC61FA2BA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 19:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F071CD2C;
	Mon, 25 Mar 2024 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AOYmL8p/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B41BC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395611; cv=none; b=qPFOz2WFagLrZxL/Dt0vEM2trn/1qIcsKDt18et2WDMVGERxnmBacn430KLi03s5ZQGHtEK5A/U59C5hP+wEzR/RpxlvfEv6JDV/Rs960rq5yjKnwcp7jrpNppX/7xzx124NvfQvz6TzWUDF5zqLjNr8ylTWZES4430zj8wwLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395611; c=relaxed/simple;
	bh=KlDcReSHkzr3q7MI7ZjcywQz9k72vldHzd9nToqdlAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liUK3PZskZb625GPwdU3E6ylQ2euOUCX3mpPRjxfuaPADHf9I5iQDJon7/z8LbqMm97P10C+n7oY1yuCsI87V2E0t5ne6RzUiYfV5PGK0wSHq+hzxtQGNvEEID1kq40+QBOzXhXFMjIXFFEBgDyMS9a/nh+MxUEoI6CqYFIgE2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AOYmL8p/; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-690cf6ecd3cso29705216d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711395608; x=1712000408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCSW8ugAsHBM7+R2hVkV4HgvR3WEY/XblW4OKhzKjhs=;
        b=AOYmL8p/g2nFBW6PORx+YIeFHDqCxubAfGWaLL7Oholv/M2v7z03BvmqSh6qC3eovx
         r8RyDjzn6qdXY2IrR4r7ft2EdM0klqvbTDlaqiuM+TRmxDfkv0c3Q/SPuZ0e3Rh3F9ih
         /bLvr/+IiYIExRvpk8rNy9cm5/2PG2Dhmw5sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395608; x=1712000408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCSW8ugAsHBM7+R2hVkV4HgvR3WEY/XblW4OKhzKjhs=;
        b=HzIj2QGt8+iGigQ9U229wydFJOs9G3wiYfhrSkNPDAy2aX1iG9D8TJCPlmDqhUrRse
         m+yQmRnZ32NO2OCwwHfPhIzD9GOwfOStlLX4A8vLwH59qMlN84MY7QMKgU15ncZwEvgA
         TYwyY1hDfFOsmxxEqJNsCF9XYRgwfzMsmT1U60SzWHUGAZq6WLB1kk8LFbqNwWkzsyyg
         q/Xb5b+v1os7OrluHv2++43XEpVVZL22U1wGuyvKH4POY4RiqzKrqR6P2oqCoY+787eg
         fDW+hISdtxJL9KofWGE5JqBSGl/0wqZaMzYo/uxufp8D6c5FvreyQxdFk0z3Ju810Oc9
         GGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRfECsOXqYc99O66EHXShom1galBpbW/wPBXTb36N3bkD2JGBezbJL3hYjo9xZMCKfFGmFjYdFZRma19E2k3qdmvqyXDLTctFLVSUzFQ==
X-Gm-Message-State: AOJu0Ywu0lY8VEwtJJoLT/h7fyR+lK9KwWX4CrWJ2G8dzwUASE3asKtv
	CcF1KX0hgh41jBG4FTiyHnncWTIiKb8IsS87hyr2ZkLg0dtVsq93CAAlAnZcr0cVlruTY9v5gA8
	=
X-Google-Smtp-Source: AGHT+IEpYvFrAFN+k7D8F9APBwyaH8cFKLJpvvdxnTQCdagLH5KtJ6dBSzRsgm0X8owOd3wMEoAVkg==
X-Received: by 2002:ad4:5cad:0:b0:696:8017:8856 with SMTP id q13-20020ad45cad000000b0069680178856mr9331960qvh.54.1711395608658;
        Mon, 25 Mar 2024 12:40:08 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id fz18-20020a05622a5a9200b0042ee2920298sm2887833qtb.61.2024.03.25.12.40.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:40:07 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-428405a0205so62141cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 12:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8LQbBqfMcxnIVayn+1FvvZxlqD74Yh7lfTpgppoV0OtAQBiGAkmYJHmH+9SyYVL2YfDvylcyayt662N4sB887MmUd9KmVweIRdgIolw==
X-Received: by 2002:a05:622a:553:b0:430:b590:e88c with SMTP id
 m19-20020a05622a055300b00430b590e88cmr1295243qtx.6.1711395605673; Mon, 25 Mar
 2024 12:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325184204.745706-1-sboyd@kernel.org> <20240325184204.745706-6-sboyd@kernel.org>
In-Reply-To: <20240325184204.745706-6-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 12:39:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URo0V1JGJ=sOz4i7hW9EqrCHyEwW4Bc1P7hsoxdw5tAA@mail.gmail.com>
Message-ID: <CAD=FV=URo0V1JGJ=sOz4i7hW9EqrCHyEwW4Bc1P7hsoxdw5tAA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: Get runtime PM before walking tree for clk_summary
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 11:42=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Similar to the previous commit, we should make sure that all devices are
> runtime resumed before printing the clk_summary through debugfs. Failure
> to do so would result in a deadlock if the thread is resuming a device
> to print clk state and that device is also runtime resuming in another
> thread, e.g the screen is turning on and the display driver is starting
> up. We remove the calls to clk_pm_runtime_{get,put}() in this path
> because they're superfluous now that we know the devices are runtime
> resumed. This also squashes a bug where the return value of
> clk_pm_runtime_get() wasn't checked, leading to an RPM count underflow
> on error paths.

Ah, interesting. Thinking about this, I guess it means that a single
device that returns an error from its pm_runtime_get() will fully
disable the entire system's unused clock disabling as well as the
entire clk_summary. Crossing my fingers that doesn't show up in
practice...


> Fixes: 1bb294a7981c ("clk: Enable/Disable runtime PM for clk_summary")
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

