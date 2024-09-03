Return-Path: <linux-arm-msm+bounces-30485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F296969C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D65E1C21D1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D689D201278;
	Tue,  3 Sep 2024 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPGgWoDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C99201252
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351097; cv=none; b=edZayl98j1W+0xrmN9LWl60DpbqlnKW1oZFyMnmKyeh2ua5GEmWKIkaBf7Up2V6nPFQipNWc9v8cT4VsHvavbbCfz0ynrEw2o2pguz+lY/G4EOqbmhKKNmt5c1UkfMM/uSNEH4mUuWnYQjzR5vRH83l91jMi9YXMZXVQqTNgscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351097; c=relaxed/simple;
	bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eooSA2F+z1CQkNEGPbRWXWdSnRaEIMg4L3wo4VloauLyBMWgeA4wpbI60Lv4QOVP69VO6GofQuA+a8JZVFALGuwtJrS0whTDS973wgaBjHEcGO5ryClgipml+vilFTTKF2JIKLmp9ochvDxOFyKQgQD3JxRDOjrmaJceHHVMaCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPGgWoDz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-534366c1aa2so5189594e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725351094; x=1725955894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
        b=mPGgWoDzK+7qApQWCsbaYxiABpN0rhd7ZXJ/XaaYIrjcqIJp/WItudNPNcYTtoE8kf
         Cmv3360wCvPPec2qvMpO5ZNxT4Q1uVDpYqr+Vji8Nf6U0rVo9lcJfM0T2dmg2zPdoFXp
         g556LFc3ybQmITTPpANP4GoxT9fhY9r5z6LrzkuV4HbmudwcfX3tPhqBoWs7wSjSCSOZ
         ZSqd8QIKX3l68uQlUfmY4cFILPkIyqWUZe7QfiTRbRIx5m/WeHnicdirBsODM23mfCXV
         6OPDk/y2o0DX4qRLPyvMSWcTwmXWIAnd+HEM/H4EQSwGx1qHDACKO2uIW2K3asIO47XT
         TnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351094; x=1725955894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
        b=u2P9MtT57k8lRpVjpjyEqbrCJIp9a4zJJL2GR0PZpMFWZ49Z2ejwITAA+vR67dBRP1
         QVFwrYaK4RjRZwHS36xVrvLYcdS+RPTkevFDOnyN7/QYBSiyXsPPTUgVuUM/vmyxL7tx
         hf9xExhGIi263XuDy6ttn/zPI3OkPs4JDesGZ/OG9pPdTZhw/0vQseGAvrY2IcsVcNAZ
         6Pg9DL56GWJFaqvT5COY8oSRWUhvGimt9erkKqkovfvGcd2En6idDucNXmlSpVqqw/7b
         a9BsHPYe2DX9mnNjoEtd+jMwbGglytYSyPyFGLoghNqyTe5VdXOGLR4+BAFLecWnJ2c2
         Reew==
X-Forwarded-Encrypted: i=1; AJvYcCVVkcBMdigKX2ZG6FNHW902oG7fXsVVQzecqMDUyY+ZEtK9DZ7tcVFqkgh13Awx8Ig+hnJq8P06iADQJL6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/uz0Y53IYKFaXSGZY9Q3UVdU+ftGf8T2pUYaNsgasEI+s93j
	dIMWcmvoNNDe2eJ7nrHCQlZ5JwjSKGUDRO03IHZP+zLizP4Cwa1j2SAczyh2g/dndo/YCAMJczu
	STAGLJAfh15zdDMWamd23A8eZxCsfpSe2IqrEPg==
X-Google-Smtp-Source: AGHT+IFA+v/Lw2VM8YBLUxDrbigDTMftuBsPCXYDExzuRQnypmgUTiFnyFUrx8r3ouJS7IWB+TH+Av+oI+GuAY+0oHc=
X-Received: by 2002:a05:6512:1044:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-53546b691afmr8245078e87.45.1725351093898; Tue, 03 Sep 2024
 01:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
In-Reply-To: <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 16:11:22 +0800
Message-ID: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add support to DSI CTRL v2.8.0 with priority support
>
> Proper description is missing

Actually, there is no clear doc for this register. Any URL or
doc key word to search?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> Several tags are missing here.

Co-develop and SoB tag, right?
>
> Also, how is this patch related to quadpipe?

It is a must per test. Maybe it is just related to dual-DSI.
We can have answer if 2:2:2 is enabled.

- Jun

