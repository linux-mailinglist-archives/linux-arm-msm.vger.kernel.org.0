Return-Path: <linux-arm-msm+bounces-11575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897C585947F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 05:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE57CB21BEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 04:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F4E468E;
	Sun, 18 Feb 2024 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfhMJ6wQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B14689
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708229633; cv=none; b=iikgxNVRz6tebWaWT7xa6KbD5RH2isVRvQzxVe2M2mXE2uxIblfTZshYbXVgURgG6VYxp6ynIfrdzpQr6YCLpKR2B893x7YdC+sI3PY1VL0C5+dyvqUZ3wCc78Ci7nYLkDQm8qd114B0eKwO49aoY7FR2qh5hg7lMqkw/s0e7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708229633; c=relaxed/simple;
	bh=cVJkdcOEblAEOzjP4Iqn/SO4fBv4SCvbXhBMLyUEPRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5mLNt5akIau7i0OZVTsjQZjUTwaHNgJmwBSmuDaAAJWcxDkhx0Mm4EBoHhOVY3bPm6WAHdn2W1j9hiERb9TFng3tFwTLNwUlZycjCkUOkPBxvrktPBZz8XDwLddspJW++UHgJ2uvOVxp0C/JLThJ1cVjFZ2h6CTTd3+ERqSQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfhMJ6wQ; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc745927098so2840449276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 20:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708229630; x=1708834430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3T5HFHmi3CM0xKiFsfU8xvakCYZHbxMf+HiMKicUfQ=;
        b=GfhMJ6wQ5MlVug+CY7jDPPZflyiRbkf5Oiv3DVb8ibSuenLKXyXHGgiLtX1NojMvcH
         Ofrqnl9Xl8CW4ATCyM/Uy7dX0yleU/rgn/fucsM5rLsOp9jaBW3fJz1koF1UrXRtRRfd
         y6QiQ1mEfaj1zh4vE7sJnbQnrn5As0aV8BulOagEZZCvKH5KaZBt2tdfPSWlhBB0A7ya
         YBc6Cu80LqsPYyBXtk5+OIEJDKLv3MZnLscob4WGOIm0LrkT9MaIC8Oqmljra5NyFTRr
         uygUe7/lq5tkAjKlE0DC8uRB9r1+0q1pX/PzNlH3/1cApmfPYE81Kc/+GNoczTehJ4tO
         3t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708229630; x=1708834430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3T5HFHmi3CM0xKiFsfU8xvakCYZHbxMf+HiMKicUfQ=;
        b=B9LWsX5pPZW6V7rijepU2aqylRUe5O6FmYpfRpASDCaZgnQsMBJBjOQjSITRXHVj/z
         2SYXg5/NBcoIT6Y/FA1I1AaAaLGLPlXqzEyvF12jBxRuQmp/pu3zV0BVOqwUOuJInnXW
         J6VM4a/17MlQERO8mUQltWCW55ut+szYFlbs5WXM2MuFrpuNVYUIOtohoF1mgO39ryGK
         d+3tKCE779TOxzYgCOIcxoty9Hh0G+UJUUNppgw2GOzyq7wKYZdOmDCHE8Ht1wQHGDMV
         KquXjUFaT5rmUr/mHN71XniW1Vd8+fiMyKKCpmS+yh7OX7X2BYQNEudkxwXokW/8DWr2
         3Hug==
X-Forwarded-Encrypted: i=1; AJvYcCVG5JxLcT6u6XaD7XAS5IReOCpxdoeBNzaGTGTDF6B3Yr1qea0yEwv4vJ+t1zTQFkDQFSvtqcTt1zVe8lsF1UjNcvUtdfw3bATZtu06fw==
X-Gm-Message-State: AOJu0Yz6mKp0G5gNiBENf+ED1eeeAGA7MTtjcP1ouZkkxeGXfBji23K9
	E3mVIt/CX4R0r3cz8Xd2NBHtkhFZN1ZJeEu0oZFA1rwnl16X2AxUKA+aDnb3aUFSSlHzbxHhFV5
	vqUVYizTPMal09gVi4TkOGuF0dIgJ8hFS8MYx7A==
X-Google-Smtp-Source: AGHT+IGNdSCdpONwmK45JNto+Twc09//VCm5Uc1QpJQkACoXcDwACt6GCtz1nfem5gmgMEOmkzcqy2WxKLXHoj8/i60=
X-Received: by 2002:a25:d689:0:b0:dc6:bbeb:d889 with SMTP id
 n131-20020a25d689000000b00dc6bbebd889mr8114737ybg.52.1708229630382; Sat, 17
 Feb 2024 20:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 06:13:39 +0200
Message-ID: <CAA8EJpoXN_paysLhg=T8wRAiQWBHq-LLVrig_OYwRTbosn5WQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ci: update IGT test names
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 06:12, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Since the addition of testlist.txt the IGT has changed some of test
> names. Some test names were changed to use '-' instead of '_'. In other
> cases tests were just renamed. Follow those changes.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/ci/testlist.txt | 1888 ++++++++++++++-----------------
>  1 file changed, 844 insertions(+), 1044 deletions(-)

Forgot to add:

Reported-by: Rob Clark <robdclark@chromium.org>

-- 
With best wishes
Dmitry

