Return-Path: <linux-arm-msm+bounces-20078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28F8CA072
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 18:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A53EC281248
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D8E136E29;
	Mon, 20 May 2024 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W1msGeSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F628E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716221300; cv=none; b=jtPgKgCXNbv5lMdN3FTI9wyvJ2jPTiQO9zgn9Uk1xo3ThYqyeVLc4u34hzrSELRA6UEVAeghPLWNCtiBtpshvsdGEkmTYLiOVCVc3ar2fRbhOPlfMl5V6X9fSHKLBObT2Mw+q76fUEXcgmRvc1B/awStKEsi1ejc+CfPu8vV91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716221300; c=relaxed/simple;
	bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDFIGkQSPI3gFmR5VA2AQ/Nj4AUSO/IUgaYeSRxrBSvFWixieIV/twKVGFaJTjbN3rJRlevt9OE18sR2KEUgdpNA6xXG/TY8+YK/1RWbCa4wsfvzKJ/fGyA6IUxgWsxpzEfGiM2YHu+w8opoG1wNUSSGQOpcxS11mcRFeTU+/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W1msGeSA; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b27c5603ddso2080550eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716221295; x=1716826095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
        b=W1msGeSA5nVjocs5hPKz0cJfHUQ35N81HM93Uh9pZzIhWzLHBp1gw/EI6mMS7QldQN
         zazOi8R2HMgcU7nQlm8PkO7UdmD+uGv7h6jVgerIGrwLlZxIqqLaViljNj5b5YazF13U
         Ciq5J9mb1CXb9bC/tQxCrFhbAQQ1/RrMAkk5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716221295; x=1716826095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
        b=O3bqTlXJ5XyikByXgeSkjtesK0A4rXbmcIYF6nvo0+Bz/atOo5PFIbA2s+P8aF8SNV
         9UcGsELvGoj66EQfcTURLeiETw9R3ZlN8+k6wBf0tkVJWVCs2BMPJyQcHeLP3HvNHD42
         p5t6Bf/3nKV+sYiAA5rQgMByExFtkrtGQHB6fj7e5uEFpjvL7HhEuD14JOISZxmba+wE
         HWfkkwTo7QzP2qIoJoiF5SJnTb7j82bdnxus2HwAjTtl5n7NmbABsmadYmAEFtuYkfJn
         tvS4hJFsK1BpXuk1QkG9c3w4bS7ycBQsNQfGRxPLutAQdRGaw4xs2yRN6P2PwkK0Il92
         l4aA==
X-Forwarded-Encrypted: i=1; AJvYcCXAJrUGHhHy5+SGA6owpRsulM814gOudfUurlj4IiqyrVJhYx+ab7p8d3L2/O7FKnzaOzeHJa1ADhpGemfha7vCoBLHFW5B4viQmsr5UA==
X-Gm-Message-State: AOJu0YxjUDlEzlZo2iwl88weklpv8p9dPdTIftRyKShCwn23AHQkf0ai
	vpWl3Gn4Uez/a6uHdCgQv9Kc+PBDFc/W7rS+KI3A8CgkH1uEACN2CuoKQZcf7Q69jcDD3/In70s
	=
X-Google-Smtp-Source: AGHT+IHVJIagR568ww6ZROa4eyagFuK0JobwE7jV/1WNtD3gnmZc3ioAcffEYut8zLWBuW7TOgPC+A==
X-Received: by 2002:a05:6358:d16:b0:186:2990:adb6 with SMTP id e5c5f4694b2df-193bb4ff5ecmr3275698055d.2.1716221294547;
        Mon, 20 May 2024 09:08:14 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43dfa7c0c1esm142333831cf.34.2024.05.20.09.08.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 09:08:14 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43dfe020675so668241cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 09:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQIUwxTn6uqsbSOl3duefkFCVSYrzqUtdmbHAVdLBJhGb7sYskFcWPnes3DxyBUZ1TTN/EWeFuGoMoZd+wh/L4ygAV9gCcOCO1c2Zz5Q==
X-Received: by 2002:a05:622a:820d:b0:43f:7b35:c5e2 with SMTP id
 d75a77b69052e-43f7b35ca1dmr3103541cf.16.1716221292824; Mon, 20 May 2024
 09:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com> <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
In-Reply-To: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 09:07:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> > Prefer the struct drm_edid based functions for reading the EDID and
> > updating the connector.
> >
> > Simplify the flow by updating the EDID property when the EDID is read
> > instead of at .get_modes.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
>
> The patch looks good to me, I'd like to hear an opinion from Doug (added
> to CC).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> What is the merge strategy for the series? Do you plan to pick up all
> the patches to drm-misc or should we pick up individual patches into
> driver trees?

I'm not sure I have too much to add here aside from what you guys have
already talked about. I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

