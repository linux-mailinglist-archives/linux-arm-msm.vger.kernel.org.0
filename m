Return-Path: <linux-arm-msm+bounces-30502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA696988A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2CED28149E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF8C1A303F;
	Tue,  3 Sep 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWRK6Kq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0644366
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355041; cv=none; b=u0XSIyphJuFUcRguJiOIPPWfinfUpPZqiGkTw6nKB9v5/s5XPT8wsUPDUxstns2HRafurFdkIorMHI9tQhFz6RRCsJGjfLIWSFyZ4/dQnbld2QfcEDXGYtDouM8Kd+rAvq7jJHxp28Ox7yFpQoBgrJvOrr83aO3xjEaPnkyv4lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355041; c=relaxed/simple;
	bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3dUdQhcOqi6J26Y7z0tGkpA9ArgS+h2ojg7LvhWStgcLWcpoO6QNqAtB8FE17GI9k+mSsUHwSGyYp77VNZyc8JGpnUJjD7j7b4GYQCPqFuXDDUV2+YTJDbFLO6ta5W0BUJ3qiu17lxcJqV3WrtM4iKb95BX0VYQfZTXb4gLmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWRK6Kq+; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6d47d860fc4so26734047b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725355039; x=1725959839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
        b=FWRK6Kq+rFrk2HPiPqOuX3kRuxM7GhbYepzQtbh33prdxZF3BKuP0CMY2DO000v8E5
         seQX7D3ddSkbujc5urpCx0WiR54/Ttf13D09yvlFjTACBe4z1NfDfHziYAuUrGkuG9y1
         U7r87sLt3DtVCqJOXIzLlGahYfl69NNyvYZBd1Iu1VvcxLlHWTf0Acl8IlmEVizBiEol
         zm5tqEjg3GvT4k0NQ6TzGQOVvaysajmlW3mIFKNq2okA0irV86cY9d8Qd6xveuVlIecR
         C0Rxi9EuO/CUiWa9SctVknnik1hF6TmUOr68YYRHRwCq4E+r5A9f9hxK2D8w+FecwmKi
         0mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355039; x=1725959839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
        b=Z1kfSQNX+SZ88WJqrBvZSFIte+tnJqQ4bEGq85zC/7T/8sSAUdwv/L0Ruj22pU9hLt
         6SEbTZuWRO6zKas+TpMgEJ3QeWT7leXtEXii4y5y9SwDnJMyBIwJTnxMohC8pfSevqb4
         NYTV9VCqZ9xnlc9ttfcFP+TJIxZfdtO1EMYfG/gxtfAJvmDrDufA7/NfbQhukSOuo1MG
         //XFNuQ3/5bUmdMQWygpF9e96FLXKnaooLG42Xqh7ejM/DeiyNsYeXP3O45+mO+6h9qA
         K+U3ekkoYxQsYhnz9U6TI3U50rdURjE/6eoNw39ZpV/0/OgsBzRKmA+DpCtbRplRCaGw
         Capw==
X-Forwarded-Encrypted: i=1; AJvYcCXfCQVzOTUcRDVdQ9C0SNY9+KlpfNhmPV8YbVyPMg72Mkt0DA6aiLQSDzP2x23tvIzvbtnv1ViIvTjc3XEq@vger.kernel.org
X-Gm-Message-State: AOJu0YznCf3S5qDAy0hJ30sppeDYFUHGwROK1owOuYRVu3vm6jcAtMXo
	gPfE73fo1amo25Eq5EQqQpzmJQ0pFvHGsrNnp0XhgoffONL9SE0r09wjesOSOwcNUxDDXX3hsDr
	WQMS7I4EcgEvGuzotml0kbuKnurYX9eNh7stTTw==
X-Google-Smtp-Source: AGHT+IG81YDgPBRq6/EYuW4vKT6fy1SFqxRv2KyQLs6HLXZ1o9IbzXMNe+6OWbwaOtbCurnbVfpd3OtZMgL5A8LguhM=
X-Received: by 2002:a05:690c:81:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6d40f62dcf0mr167802017b3.32.1725355038732; Tue, 03 Sep 2024
 02:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com> <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
In-Reply-To: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:17:07 +0300
Message-ID: <CAA8EJppZvWH1y-WeNW+9zSonoR7vem7N7q0o94ZymiZfvvUfJQ@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 11:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > Add support to DSI CTRL v2.8.0 with priority support
> >
> > Proper description is missing
>
> Actually, there is no clear doc for this register. Any URL or
> doc key word to search?

Do you have a corresponding change in the vendor driver? If not, where
does this come from? What does it fix? What doesn't work if the
register isn't programmed? Answers to such questions should be a part
of the commit message.

> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > Several tags are missing here.
>
> Co-develop and SoB tag, right?

yep

> >
> > Also, how is this patch related to quadpipe?
>
> It is a must per test. Maybe it is just related to dual-DSI.
> We can have answer if 2:2:2 is enabled.

Tests are a separate story. You can send a separate series and mention
it in the cover letter. However this is not a part of the quad-pipe
support per se.

--=20
With best wishes
Dmitry

