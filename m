Return-Path: <linux-arm-msm+bounces-14164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17A87C02E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 16:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88491F20C23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 15:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657BC71B3B;
	Thu, 14 Mar 2024 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n5glVOxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFBB51C3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430176; cv=none; b=VhgS0fNHvpt1Lj54tddEUjQx+JfkS+GL8iMJ4byY7ia2pSRz4rgYafd6hpbUiYB88EcDsbcxKg23CagiCZ2O2Ixn66ivGUDnIPxcD08yOImqWRteUfHXi70Y7t+wuxXcuFsKibVZ0HDlFLkcLaKV8SROOgn8UzdlQVXssFlHuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430176; c=relaxed/simple;
	bh=BK5vGjzgLHTG5Uy0fF+PO/iDPbQ/wrXrAZUSjAUJ9iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW0bOMt+q0oUYIsiJwTpGMkPXwHDZY/0QSmq1jddHI4r7gLi5efoTfiIHKhR6v7wY54MFFXVWQ8fn8NbJy7SbWSNEmNpgB/YuNI9OZDdlZGEuZWoE06Czrl35H5+mcobMFfoz2b8vY2P5UI75rX7n7BeeYkHzdIVLt62luQ4e9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n5glVOxG; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6900f479e3cso10841156d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710430171; x=1711034971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
        b=n5glVOxGsnctw/5jZnWEKcMdDcXqTWHRBa+sWfvNfJ+BO8d4+frFSRW/QA/2Qx3Ke9
         hUJM+itue+MdCyOai+U8nHCVqLpmtrBA6Y58DQw8e2OLKuHDVhX0prB4IQzsK6qa/aa1
         NJeQkjVjrrjdlINJwe2W6E3IJ39d4ZOE+Rh4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430171; x=1711034971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
        b=rNAcQgMFWLfyls9Up9QPmDEomTsynAxQlmc7+VGj4zb8A1I98f4K0IAP4QJZeVRF+Y
         hH8V0nei6jhPN90RZTI0yUVrqdr9Vu7ebP3DqJG7L9u2JH8rYbRRDGFfVifh8D+33cYr
         2uRL7tTS7Xyyf4cVTxN9mIRCuUeUlM+4Y76Gb0jVTkQefruy0Gnhwwt09XF3uOM8Y9fl
         wj8ECqep6WV0813yPbcqfT3kjJLDQOyH/u8L0DAt4Si7n1PooYB4P7Zok4mQ6c1De7bG
         Y1KDlHO8ZdQ66UZ6oNFB+pvS0EmCKZYMyoeA1jBe3uQjZDmMJIBhZQe6e43j8P9h1wnx
         +xjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkinzTHhD3oqoqpyB4HccG9QDubo+pJB4qEnEe3B/7lm3gPOJidWevBgjrPYP+iSLyIbK/KZ/bvaXVmtaBInjxuKNlRzZ9+a+cHhM+og==
X-Gm-Message-State: AOJu0Yw1htB5/7kR2KE8ljuoUMPskvyJguEmjIe1qUS3pL3l9KubV+TZ
	cZE+9MgmTvpR1TCz3RFyMkm7sPLkVbkku1bjfSNiKw1HVr5O448Nz0UT492y52fZyu36kVM/uBU
	BWg==
X-Google-Smtp-Source: AGHT+IEZcXO4L75AGmwSJFtM58488TjSMw99h2i1jA4fxLdy10o9bWKsXXgvAfRXkB7L/geYcFxVTg==
X-Received: by 2002:ad4:5907:0:b0:691:4662:17c with SMTP id ez7-20020ad45907000000b006914662017cmr2043417qvb.14.1710430171221;
        Thu, 14 Mar 2024 08:29:31 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id t12-20020ad45bcc000000b00690d2942caasm582254qvt.20.2024.03.14.08.29.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:29:30 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43095dcbee6so324251cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs3YuuatK4N+9hPzFS+AAAJvmvDeQoTBe54J5uFV68myfCTz4cPbNlX01jbH3avd9SZ08/SjQ6+dfAMb6tLuPcZmii9U+hZzlRGnW4rQ==
X-Received: by 2002:ac8:474e:0:b0:430:90af:43c3 with SMTP id
 k14-20020ac8474e000000b0043090af43c3mr272846qtp.21.1710430169466; Thu, 14 Mar
 2024 08:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307093727.1978126-1-colin.i.king@gmail.com>
In-Reply-To: <20240307093727.1978126-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 08:29:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: remove unused variable 'out'
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 7, 2024 at 1:37=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The variable out is being initialized and incremented but it is never
> actually referenced in any other way. The variable is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable
> 'out' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
>  1 file changed, 3 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>

