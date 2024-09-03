Return-Path: <linux-arm-msm+bounces-30474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7114969599
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA9F1F249C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B061D6DC2;
	Tue,  3 Sep 2024 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vs+13x3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034E1C62B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348775; cv=none; b=cWo/WqExnFAZwS5dcBeFXH5WUq3cg1Md9jgczYPAlXux8kKO4cqxa6t4u5KA809YMPCW7eArTKAQcI38r5W2vWGIcLESS5Y2LennP9UgqUmalQ5JDENFiedhhXV3RvhdP6U5ouMOClqKWhJ1V+toSeBe69Hf57BmIO+MMiXJbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348775; c=relaxed/simple;
	bh=U7FqpAKPzV4buH+ZI1vofCGLlOfNoJm00tc4Xp0bqlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExdU03z4fVQFfK+s4pBNOZcATCypPQrK9Yx5eL2PzPN+03ILR4hBo9CN0emvPIrcf2o+005V/Tjy2EPvgMQ+h1kV0VwedGLhXvELRn9UNlAOc2bOKGkD/1CzmNfoVtSbw01b+1J1AyfhuVJ6t1g3GgTLXpIXi9qdUhRbDmrbTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vs+13x3W; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334879ba28so6966663e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725348770; x=1725953570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7FqpAKPzV4buH+ZI1vofCGLlOfNoJm00tc4Xp0bqlQ=;
        b=Vs+13x3WKrzOvshslTGxrV2rs3mzB14w8WyXspdGmAJ0FPqDDtMXD1FIxD4DOuvK33
         qWKA6xAa3Al0oJrO9pVkt32AMSgbusv89lhdyNYjuFolfkSy8872pv5dntM5We6GgPyg
         YCXVx42dnaEZLGqsrrMwLvUyrmdA0lPVvLgfTej5CbeaqZa7nNNErQdSQ+d9DH/9qma3
         1dAtAomK8rp/LDKAs/yh95mF0rnCC7bS55CysBoqRzXKpa5ymw3WBFJJ4gTN+GUPOoKR
         0Lj0NtM89RABWVIbT914UdgpRgLD7o+Q7Q5Z8DSbouxKalILdHFcEkYO2SsQV1NvspYA
         +foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348770; x=1725953570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7FqpAKPzV4buH+ZI1vofCGLlOfNoJm00tc4Xp0bqlQ=;
        b=fd0h1cxEn4rTV2XYWm1RC3MMOcat/tJ9j+APZA1sNMHRP+M4nPKxe4j1amuWqj6qNG
         f2785nvoaGrp2EJzvyM9+vGm+tzyvs8Eo4zUc+YSpgPU1Tkkghvcdk5Vl9X7uooQCi6h
         F9rtBLrXA3nLcNcZL6WdXafOCeN+sU4EzmvFrzt7cN9D8UL1W+tvfkTcKezDFo4HYiGa
         dVOPJIjvmTsPWF4A+kZ3zdtj3C6onm3JMRHzABNMYqwYkT3iLbIEXxEcu42rd8r48p9h
         yVWwJ1HPa3thkc2XVP8LQ09Yz8anHxhSnMFzChFHw45lDdOR6shl7c3/uX3cvHm3WMT8
         yY6A==
X-Forwarded-Encrypted: i=1; AJvYcCWPSDuehmPGR3tMGHZyfRKlrPe81P/EN/7LRqsYjEnmGx76chPoX6Stl2x014FkrcW7E/KRpJkeuDzxBp8A@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcrfRWByUACcH4M8Yi+Cq2iiXlW4cmLT+I/jLUsI/VZonBHf6
	R2JaZAAfqDzM4RJ6WSR0IR61jJfksf+jX2fayyLdFrSqK4Dt80PVitrIGnKHPsW5NwrA4GNpzm2
	eWBX9bhh7grnm9vbm5nzcrU4rLhy4sOX1+nNYiA==
X-Google-Smtp-Source: AGHT+IHrFPfCS/BVC8UCkjCGmyI7i7/wfoGrPytiT60dSKpQkQEML/b4+Lrc3MCNMZfPCyT+5uqmLNbJH1mOjM56rKk=
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-53546b052fdmr9233089e87.15.1725348770143; Tue, 03 Sep 2024
 00:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
In-Reply-To: <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:32:38 +0800
Message-ID: <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
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
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > For the bonded DSI case, DSC pic_width and timing calculations should u=
se
> > the width of a single panel instead of the total combined width.
>
> What is a "single panel"? Please rephrase the commit message so that
> it reads logically.

Yeah, it is a bit confusing without the usage case explanation. "single DSI
interface" shall be much better here. Because bonded-DSI can work with
a single panel with 2 DSI, or with 2 panels with one DSI on each panel.
>
> >
> > Bonded DSI can be used to drive a single panel having two input
> > channels, or to drive two panels with a input channel on every panel th=
at
> > behave like single panel for display controller.
>
> Missing actual action. See Documentation/process/submitting-patches.rst
>
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>
> As pointed out during internal review, missing Fixes tag. Any reason
> for ignoring it?

Sorry, it is missed by mistaken. I am just more familiar with
"Signed-off-by" than
"Fixes:" tag, so not sensitive to Fixed tag and miss it when you
mention it. Will
add it.

