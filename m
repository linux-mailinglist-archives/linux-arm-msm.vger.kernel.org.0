Return-Path: <linux-arm-msm+bounces-19607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5A8C157C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666C4B21B7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55177F7F5;
	Thu,  9 May 2024 19:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="njMxRWO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B877F484
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 19:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715283320; cv=none; b=GK/CQMDKwHX3myLfOYXw1b8lpKN+6rml33XawUnbucFGyf5B6FjuBjVZkaQvhWCErZo1A2fqJZbXxiszHQ7VVzDu8Z+eQvtfzHpQ/DcnNOjAZFiyLHZu9cQLAyYWZlboHnxM9+MO5hRe+Ad0tUAu86m8XG+qQHg6gFyK6p0faBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715283320; c=relaxed/simple;
	bh=EaYjQrX+/02VwYCtKZW3vScrvUW670G05eaMa5VkSl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyNPWNCnMWdxVypf6M553xAKNsODDVXz6OXi901IGxRZsejYjCqD7Y1M5CoeX7eXFFdiS3tJwsi/L6Tp3iU1/H07MpM5Rj/vGsFqFmH1Y+NSdqew+pV2IztnljrdXBKNAJtbomWHeWWqQHKcSU+/iWkTY/mCg1KMPaP3LhNuENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=njMxRWO2; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c996526c69so273652b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715283317; x=1715888117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw1OkgMZ/krnn9QK21TBDDqRd4Ysk40xlaOCf58rQec=;
        b=njMxRWO218VOr9i4CwliCfguyyPAJOD0LTGrOz+F2sjEDkdwEXGyx27PO5rp13gvnt
         2WNCPzckhZFz6G7qiH6J9/z1qgBJXc127CnbTSBSHPckFqrCH9kMeZtfPS/UybVTS6Bz
         RPWsnqDxkw8uNXcJfM0k9PW80kjPyLQFSpSIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715283317; x=1715888117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw1OkgMZ/krnn9QK21TBDDqRd4Ysk40xlaOCf58rQec=;
        b=ExEjhoxiC369jNreGS7jVwdsnU+7n95V+9KHB9yc+vJVmxQA1p59u0fnp6NWG7dwys
         RWLjIEjhFtH5osE5uZCIxy2SpFGL7KQHVRttVREA6OjOCcor+sKqLkygnloq6TkWXaGx
         JRPGyj0GPOaCmhiL2+C8QII2numHopx3kU/m3Zq+IGmlg4QPnWvfTqjZFWdrol+r/jQ/
         NNYrNM0njiaz0FMt8HxpNZY7GB6p0Uk3QhJqDMmFcfR4nkwfX2bnNPfQ8fNhZo3Mra3/
         phzjpJ4nwslbNU93XEOpYoDCLvGK77zgUgbHc+RuKUXV5Mba2dN1g5ilfhLETbC9Rz7M
         Jnjw==
X-Forwarded-Encrypted: i=1; AJvYcCXhOhjSr3jGL9AMQ2OdtkqNteafuPBlehueleC/VnXYo4qNBtKw9sqQDbS6vakDGR5VEZbHkwHyJoZs6NrX2qOrr1lBMnlS726aZuVfRg==
X-Gm-Message-State: AOJu0YyZYMnoG3vklUgk0xnypXma09c28kOu5fapZU7KmUtfSJDLVBrq
	7rNFftXIfTeqz4k1OcBwe9hInGKD/dUzpKSvmV7JS9Z1s/79/sdxdykeR9Ez3iyKDGQOLFeJ9U+
	1CUgi
X-Google-Smtp-Source: AGHT+IHl/cas6UQ/PW0y0LKv5CZvn6/xaurtcr0zTrtWniX3uWZLmJ367TYlh0HMKUW27f0MM0zgmA==
X-Received: by 2002:a05:6808:3bb:b0:3c9:779f:6c5e with SMTP id 5614622812f47-3c997035241mr672576b6e.4.1715283317396;
        Thu, 09 May 2024 12:35:17 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1797c8sm9855436d6.22.2024.05.09.12.35.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 12:35:16 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439b1c72676so3301cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 12:35:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrtuAWw1GPJu0tpHYw5VgREpZSkGy6Z+3jMuf1rYnfqaxsk3VhiY1CIaeWWcUrz2seIC4fsSz6Q7pOgDfa+tuKFI5p7l+1iIonofYH7Q==
X-Received: by 2002:a05:622a:429b:b0:43a:b977:d611 with SMTP id
 d75a77b69052e-43dfdcde1cfmr333451cf.24.1715283315822; Thu, 09 May 2024
 12:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509184129.3924422-1-swboyd@chromium.org>
In-Reply-To: <20240509184129.3924422-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 May 2024 12:34:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VP+DDQbdb-pD2JJKrZ+MrkgcuyzBj4H-4oTDVvBpTOtQ@mail.gmail.com>
Message-ID: <CAD=FV=VP+DDQbdb-pD2JJKrZ+MrkgcuyzBj4H-4oTDVvBpTOtQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by
 rpmh_rsc_send_data() callers
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 9, 2024 at 11:41=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Dan pointed out that Smatch is concerned about this code because it uses
> spin_lock_irqsave() and then calls wait_event_lock_irq() which enables
> irqs before going to sleep. The comment above the function says it
> should be called with interrupts enabled, but we simply hope that's true
> without really confirming that. Let's add a might_sleep() here to
> confirm that interrupts and preemption aren't disabled. Once we do that,
> we can change the lock to be non-saving, spin_lock_irq(), to clarify
> that we don't expect irqs to be disabled. If irqs are disabled by
> callers they're going to be enabled anyway in the wait_event_lock_irq()
> call which would be bad.
>
> This should make Smatch happier and find bad callers faster with the
> might_sleep(). We can drop the WARN_ON() in the caller because we have
> the might_sleep() now, simplifying the code.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/911181ed-c430-4592-ad26-4dc948834e08@mo=
roto.mountain
> Fixes: 2bc20f3c8487 ("soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to=
 be free")
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 7 ++++---
>  drivers/soc/qcom/rpmh.c     | 1 -
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

