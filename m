Return-Path: <linux-arm-msm+bounces-41852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CAF9EFD70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE1E188DE53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EEE1917D6;
	Thu, 12 Dec 2024 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCTWCing"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0ADDDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734035275; cv=none; b=ZIYuZaR9BTph6hanPfnOfR16vauWC/D0Ql4y0UAW8J7+u9FOJU1SjKlx1zSO6zp9QPSKI1liPJB81Fh7NJYBMLZl4rPR5D7e6WBrEEnm1X9pI9IHFTHQmyAb80QeYjPF107qXlWq+zNyyPBKi8S7gLxUq8h8sDEoElwoqrBFTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734035275; c=relaxed/simple;
	bh=2rXihmp9pWl3LzrM5tfFee/d+Lbi3u9PgbARXkqiJbU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjCxjU5u/CLt8Mh9HYgpC3+Xtvqw32vzWP3EF1NyEC02EPh/B3HlIUVAqy3koh1p4O31vGDlKS4jreMM8SfezD402gXEM3ywgG2nl4B9t6q3JDIDNN8YT+9heWLDqRxnaAHKZLLN4a5I9a1/sEZu23f+Nt9qCwEdv6fCK4TGrz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oCTWCing; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3983426f80so670665276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 12:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734035273; x=1734640073; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
        b=oCTWCingdSS0MKYxILzGFoZI3ig1yvRCXI1FpH+6zlnmOcyndtUMNsipQRd+B51GM/
         SjJmn3toOfZAKLlquy+AGjTH6DMaDR6qNu58vCYuflKr1BPeuhHMThRmPELPEE1wMjpd
         sPbolgDS0zUCKElVIzGAMPoc5FbN9ZzFaiW9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734035273; x=1734640073;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
        b=mBKaqs8XHIgmxB8dOB8WFEYEPOSZ7b7RgztnO/tOgP/OrJiLbSwFaJ7D0/28yi7SNJ
         NJRMKCdcUmTQkT0HLftcWA7OvybWMOhk03RRalaEYks5jNcPtW2gmAzhxVz4qjDmApj3
         ULR8OrE0zcKxeChQWM++1Fc5T21QlqoYXiKLcOgdxKpO5aCTH2NPKuJkf62J9ZQG/g90
         YwZzIOINZiQpwEECfdp/Lq9bNBFisHW/uTroaZcz9f1ks51FZYiV/XwmWkGzlL//vg7J
         JNWZjgukfXfpK0ac/YWWe1y3Z2OnYvILErwfLe23WkU2si/5J1vbVSz5NydKzS8WxbRv
         MFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfg5PDzSVs8TEkJ56vLiOahcc28MgvUIA2gKI3sQ9DabmK4tg0POjf5Yj5hR5wM1G9o+v2Hjv2xZIk3qLr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2PrGeV5OVCZbiFCH7Wk0uK9dgRfTYfwvC+sSHPuLiVtj93qE
	68UVdaV2BH1TX0Xt9oriz1L2S1px2nKUquX7XYL+Fl4isMcfs6/0jUCi/pgeuQRP2x3UN/COeFT
	r071Mt/67h3pG4Ahm0RewBTuOaHbIQwXC1jv6
X-Gm-Gg: ASbGncsYGRHyJDAnsrCbPiyM5NFu+d0FxCoFEIgor9w5QkflFdDGsRwIpTkjv1QdPox
	5PDDk4lhIrKMHdU2tK1a79WXfwQKwVWWA1hTxFX3aLc+Q/DORd7qQfgyH/8CETTPVYA==
X-Google-Smtp-Source: AGHT+IG3KC9ssh6ekayVwqUK7Km4JQfm8yz6hlNQTxOXGgPcqzMW7GAJJi4TlQ/fXN099DQlJcEjq7UgjR3xUuloAyA=
X-Received: by 2002:a05:6902:1b8e:b0:e3c:7fca:716e with SMTP id
 3f1490d57ef6-e43491ff2aamr112163276.6.1734035273092; Thu, 12 Dec 2024
 12:27:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:27:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:27:52 -0800
Message-ID: <CAE-0n526i3eZbSsoyLgO=MFPb1_mU_v9c-zgMrdQGWgUvj-+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] drm/msm/dp: perform misc cleanups
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-11 15:41:35)
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

For the series

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

