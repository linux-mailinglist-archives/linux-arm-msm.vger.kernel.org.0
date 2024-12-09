Return-Path: <linux-arm-msm+bounces-40987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3B9E8F8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FCDA1886A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB252163BA;
	Mon,  9 Dec 2024 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIZWq4iM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20632163B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738419; cv=none; b=slkwfKTU4qAjdkBHOHYYhZh5ehi0aOXj/8LUpzEajQdoIJwzYRKtbHIZSVOIhYoQXlZEHO2hWizT7d8iM8Y0gqnlxL7242TTPmhLi3jjTVy0YP/UfidHA4WBK0GZevShA22kxYeuUTZ9uaOohk8PrvB7VIZasF6lXyFHdo+gpIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738419; c=relaxed/simple;
	bh=9S1OgwK5FtDALXZaBtPeWSCifcuG4huzgVs3mX6EYro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw2XGZMq7Sy282JRmgGtHiWFBpYo731Ik45uLX9yGmkK/ExqyqugHP4H1qnmSzZtxdGEtu1v/W0UneW1S/8sms+/ghS0Rpm3Srz4BXT2wgV3kZyp/C1HziJcxwE8D8F+o+Mr3D+fNHPEYMFEvN3plkbiyWFGQKA2td/XRNR6Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIZWq4iM; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e397269c68fso3935990276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738416; x=1734343216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaKxBgaq02X8de3kQjZpaBJzI71CtFoxfGULZINgpO0=;
        b=sIZWq4iMuY3qqVnov5zv/W/cXZRPYwbthhusAw3rmTPgtWCduZ8fTFGmcY/MGU4EqS
         0uqm6VsQLlKOP2OYZHK9NJK/uuLjPUWsxnAdwk0siOU966DDZDc9RPXsycQ+/k2uwe9g
         YURWfDjmI5ReeoEhHT/q0hwQ4Ps0q/aZ7A5brCsvj9yO0UUybxjH9U9357hqrM7HYPRX
         +YY1ITRxxs1qxxIXSU2hd7Ryde1lh1EBhMy361V/hZzmlmN7Tc5wf6p2sN6y1zfXpf6Y
         DNvv1vqMMU2oj8l35wg5c0h6aBRB6JIIxED55TU9h84dLd6TgmG2+LYL56H9wXjvWHR3
         sCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738416; x=1734343216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaKxBgaq02X8de3kQjZpaBJzI71CtFoxfGULZINgpO0=;
        b=jLETN61EGxuY/EXE2y+OHkT45A1ZbALpuJA2nXSVQ3rPazx2vovEZK4dEP5b+d27x3
         31JHoxu5mJ9XNoUO+6eANYu5WgEITSRmwKRGrFot2pKlbI5fcEO+rcKx9KUO+ih5gpAV
         YDoG6lrOQNFj/NXHeCl3qjrr67GOhJBMRauBbMlaeFeGYU7RihGDUOreQo3mYwCloLiz
         VD3Ky0ZWgW68o3tg8fAv3/LCsAazfr1OmLey6hgEfuPfqGC28CieKuMOQBx4wy3eUtVL
         0drXgL0tosGc7Ps+lORSjjX9/ZMhIo2tTuRuveP4JhNyM99iR8TKVCKVDze6XaakrxOw
         RcxA==
X-Forwarded-Encrypted: i=1; AJvYcCX2WGhm25Xs4JdDB4ovk5rcbnXM9lR1FfKj+tGH2Jv1AiYJGK7JymH3lSQv5Evehml6f17dvM/5L8EyuWx/@vger.kernel.org
X-Gm-Message-State: AOJu0YwxotgQTPJ8GcOhcBGUdc+F1GL0jtxSmXyuRtpE+19E9AfdVy/w
	q3slbYv7aVlSR6r9Yz7DNFHwM7mx7/43zUr3ZpdSHHEPlDWeniOv+BMAGXZ88HtxYy6Asht57+g
	2vvkj/QkawqHx1nd9NAS1T9akN6GCFHwHZ5DSbA==
X-Gm-Gg: ASbGnctKsRjJ2pnfdluCf/y96AXO8B/eeYpu/feG4s9ovR7eihEfCaGSElHVdlHiJSI
	C0Nr03cnACkq7KVrhoPQjQavL55HkM9Y=
X-Google-Smtp-Source: AGHT+IH+mgmmr4qqUrNvXi89RebxgrqqEnj6NinYEcPLT9jjbWocaOUTk5gkEpMuQlwCgNRcU7QqZkyyvUYXic93/so=
X-Received: by 2002:a05:6902:250e:b0:e39:b0de:fed8 with SMTP id
 3f1490d57ef6-e3a0b0ca18amr10550531276.17.1733738415719; Mon, 09 Dec 2024
 02:00:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org> <Z1a3jOB8CutzRZud@hovoldconsulting.com>
In-Reply-To: <Z1a3jOB8CutzRZud@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:00:07 +0200
Message-ID: <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback connector
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Leonard Lausen <leonard@lausen.nl>, =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Dec 2024 at 11:25, Johan Hovold <johan@kernel.org> wrote:
>
> Dmitry,
>
> Looks like you just silently ignored my reviewed feedback, yet included
> my conditional reviewed-by tag. Repeating below.

Excuse me. I'll expand the commit message.

>
> On Sun, Dec 08, 2024 at 07:29:11PM +0200, Dmitry Baryshkov wrote:
> > During suspend/resume process all connectors are explicitly disabled an=
d
> > then reenabled. However resume fails because of the connector_status ch=
eck:
> >
> > [ 1185.831970] [dpu error]connector not connected 3
>
> Please also include the follow-on resume error. I'm seeing:
>
>         [dpu error]connector not connected 3
>         [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Fail=
ed to resume (-22)
>
> and say something about that this can prevent *displays* from being
> enabled on resume in *some* setups (preferably with an explanation why
> if you have one).
>
> > It doesn't make sense to check for the Writeback connected status (and
> > other drivers don't perform such check), so drop the check.
> >
> > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu=
_writeback.c")
>
> I noticed that the implementation had this status check also before
> 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> dpu_writeback.c").
>
> Why did this not cause any trouble back then? Or is this not the right
> Fixes tag?

If I remember correctly, the encoder's atomic_check() is called only
if the corresponding connector is a part of the new state, if there is
a connected CRTC, etc, while the connector's atomic_check() is called
both for old and new connectors.

>
> > Cc: stable@vger.kernel.org
> > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
>
> Please include mine an Gy=C3=B6rgy's reports here too.
>
> Since this has dragged on for many months now, more people have run into
> this issue and have reported this to you. Giving them credit for this is
> the least you can do especially since you failed to include the
> corresponding details about how this manifests itself to users in the
> commit message:
>
> Reported-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@ku=
ruczgy.com/
>
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
>
> > Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> > Tested-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Leonard Lausen reported an issue with suspend/resume of the sc7180
> > devices. Fix the WB atomic check, which caused the issue.
> > ---
> > Changes in v3:
> > - Rebased on top of msm-fixes
> > - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9e=
b8e895@linaro.org
>
> Johan



--=20
With best wishes
Dmitry

