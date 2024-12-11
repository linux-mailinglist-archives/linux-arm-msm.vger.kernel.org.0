Return-Path: <linux-arm-msm+bounces-41567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085E9ED854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05EE11886D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72881E9B34;
	Wed, 11 Dec 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k7zbKkyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0D1E9B35
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951974; cv=none; b=XA40UmcsfHeASS1fKnorG0dI0iapa79OKkE6Vo/+Kywkvd+qC3Phts6Ngt37PFeggX7tZzoVfW31D+OhQkL37+1vdxSgLqRpDX7leNz9MBE/21J+wFZVr1cwYdWtDefF4Q4uQKKNxemla1InS36NKy2IG8MiZBo1XWlz+/X8LPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951974; c=relaxed/simple;
	bh=HYpTBgw49iGGQnoZixVyDOp+jWreZ3c1N/xlRY2EXfY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpJ3nhq+8ZIdXctOIjgdEs+v62q4uav2/ftSTXhmWEWmOvj9GY4DbKmxA0Rl3ahbVd9xD3aoqIPIWcMkn8CHwOASP2WHEP321tv4+b3ogGXgtIEDK9v6zkHbHAcgc0DunMgUEDqJyNpk1fRIl325YGyQfgUE0vY5+4D/Wx+8Vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k7zbKkyl; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e399e904940so5613150276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733951972; x=1734556772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYpTBgw49iGGQnoZixVyDOp+jWreZ3c1N/xlRY2EXfY=;
        b=k7zbKkylDfXQKrfwtGV+Eii+as6j+ngABWpEa73iwgd/nKCSeKpcXS7GzUDU42Tk8o
         l0Tv2uJjhbEsjvXnN2AVoo9kde3Xr98kXAuchQmeipFsMk+xC3li7iA4x9SKE4qHbCaU
         Oxv61kve+EQPNvT8ptmlgcwd0aeViaPNpt9zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951972; x=1734556772;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYpTBgw49iGGQnoZixVyDOp+jWreZ3c1N/xlRY2EXfY=;
        b=nnyCdRbHfJYsxtYkYjHlmJgy2J6CfIECFZvIXLHJRLbDXXwxWrE96b0YEFgNdTwGqH
         mQq208KLMqCaxa8V/foJU4WN2RViSIiZS3S8DyBkoZ0E1frOfrG4xL1u1uwQFw31QS+K
         jLZkOcL7yOHyWYnOGVAPb53LoLJyG7yHvpHXix/5vx4odsa3T9/sk6R0jBLWKMsjMN4c
         F/dcjkPeIRwcUx6e9Hchgjo1vaOs5QrQIBt5TUS6+OZoU+wRkSmfUOETxwWK2zrGRuQu
         XRw8SLGh9HIh1HMRNeZWqTMRCHSY+37RySqeN6Ac5s+ivtSZSNcjr720I8UG9tQGi1RG
         1VCw==
X-Forwarded-Encrypted: i=1; AJvYcCVXqc73abP2dNLxh7D1XlC/wYLrF+bJwfy4Fst48t4phLZ2eOSAGgISIbLsZD7hZizma+aSBxLmUwdyt8iG@vger.kernel.org
X-Gm-Message-State: AOJu0YwbjMrYOWu7Z7qXoyBMpMj6i+jRav+rCyNLBVMf+vBrxBmPpYil
	aMB6F0PZXnNFMpV99hv9ahfnqtvZMgvQnFGxW8F4LzoOZ4ADDijfYWJOi9BD8p7y8WPqRPjK5z5
	MbDyV7cv6NTtGuH8CLDo6jM1qPTXwqeIsCo34
X-Gm-Gg: ASbGnctvwh3FYuEMvlO0wuQnO+zhHhQIm7pc+BnXOW4mfPojuilQQ4QmnvUUDgs5GGQ
	1dU+mEjb0JHKA5lhJnsx5tyZt/k9um3Mbvw8TRojAcwDeZD2pectyZbylholuMI4=
X-Google-Smtp-Source: AGHT+IG0n1apsTNyaVMm69eKfJ0OWmTmr6rAMEZdQLhM95ckH8dadOxw475UNN17L54dURE+0mDPgl6bERAbF28z3lI=
X-Received: by 2002:a05:6902:2709:b0:e3c:9ed1:4944 with SMTP id
 3f1490d57ef6-e3d8fb607a4mr1059614276.1.1733951972207; Wed, 11 Dec 2024
 13:19:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:19:31 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-1-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-1-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:19:31 -0800
Message-ID: <CAE-0n533qmCvd78GncN=cEkYqvfQ8ejs3xr7E=ucUJ8SqfSeDA@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:31)
> Rather than printing random garbage from stack and pretending that it is
> the default safe_to_exit_level, set the variable beforehand.
>
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

