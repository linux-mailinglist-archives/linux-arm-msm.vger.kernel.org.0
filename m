Return-Path: <linux-arm-msm+bounces-32688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE29888BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 18:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572441C232AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 16:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920271C1725;
	Fri, 27 Sep 2024 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOL2EfGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD81C0DEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727453263; cv=none; b=Vw7JktXX7Fzh9KPG2Y7SyqUcOgfXIVLYwuhsPPx5LolUlrcsQANz9A5can7t3n5Q6lFiOaPdNlQEDwsBcRlpZObkly+MWHHOA+t20Q602lh5NBxny+gIrPS+bZEVDlA0NzR9snj8b3KXrXseJL2lK11WOo8nmRW3FOC/yhLIXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727453263; c=relaxed/simple;
	bh=EHFkGhEsQhdZACKa6pRYflE/XTK6NMY4RSG4EsLdttE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcg3+ZbqdcQvdBqA4hJjRsiUaesy/0YEfWrzqbewFaShCX9cVuAA2xuEK8e5eIZ5sZgTCelmckc2wuXT6XFFYTXvkeqXZUIku/BUBwMo8j0Cs/kN0nKubLJCqZ4eS4s/D2M4371OMu66jWC6vQnsOCYV+OUKgmz+J0HYy0PtQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOL2EfGg; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25d6342837so1541820276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727453261; x=1728058061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHFkGhEsQhdZACKa6pRYflE/XTK6NMY4RSG4EsLdttE=;
        b=wOL2EfGguNfhHEHLck4tK8+MJbz1AGa+t1ZGheiuhN1qt2wdW7IMvVEYl3wzLRO60p
         Zh1e3j29wmEuQrv/IB4wYwd+B2L5b5X0snE2YhsIW+SUq02x9bbmt544xU66em1X/zix
         6rKhYs29+S04YCwnbaA+tX9N7SH2x+M8fPzska4/APJWToXuWmlWglIMMaWgPx6EntG1
         IrrGyEV6MU1CQCqtVar+37Q4q60LldLtQ4HWXWYLVk818BW1dPSWYEjjov2lGWTv1x0Y
         aOJS/XML3WdzypGAJgj3hsN2YeySGKeOUwYRUdIltm8f/Gv4vt6DrRqb8bk4f7aABV96
         XR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727453261; x=1728058061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHFkGhEsQhdZACKa6pRYflE/XTK6NMY4RSG4EsLdttE=;
        b=gJZlKlQDDrvSc1QilgTix0JrSvHMhJXyctEMug1tqisQ7bHZEmmVegu2F336yPscLs
         tUzoXe0Lm38gXZUY2A5upYUCS6grJdjMk+BwXlXKJPeoMtOrMWujBFDWqTHX3vYaLjPS
         MM1HYLKTZ70zEqop7LTwvmTAuUWz5h8JHqpWsTqL+aERZg0F36yzjX6TKXBA+6dphiow
         Xhp1W1IRaOzlXCUxD1GmUDS1hKk5agWQjkm0XkFKoDyj3Jfs8IuxXuW3X5YMBVB9XJt+
         zHM9qCjlQo7QoE+fxUp5cTcL4zjCnrs54LIIsp9FnXEHmsFEcFY8chAMLYiI6Ma7PmYV
         6cJw==
X-Forwarded-Encrypted: i=1; AJvYcCVAv8RFcKadCuZU/wGfl4hjoTnnRgMdfHAwvQZBa6zs/donXQ5sgmq4uLbqiRQvK5HwwWc0Jyo6+v7buDmn@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcS2QXM1NK8fZlIuJ05hCdk89GAS0kMAfr7FdBSP7ttM+P4+Y
	mLwI9tetD79vW7H9/Fvf1R0fp6eT0Qy0H4lLG6PXLvo44Mx5MIsc6YqyzSx/HPdEddS5BNavfWU
	yxzjPyxgTdQgvlJmG23r1j6yez26LuHR3bANhjQ==
X-Google-Smtp-Source: AGHT+IGzx/qK9UYxRzV3lT0jsfbrNXpOxjZ3LgmKAoBZnS1e/5cYjHGIXlrJ/VoSeio0nf1YAgFk8rGuS3JdImONTdg=
X-Received: by 2002:a05:690c:60c5:b0:6de:1e2:d66a with SMTP id
 00721157ae682-6e2474f4adamr30196557b3.2.1727453260762; Fri, 27 Sep 2024
 09:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <20240628-dpu-msm8953-msm8996-v1-1-a31c77248db7@mainlining.org>
 <540ce2add6b1975502e898cc332275a6248aa1bc.camel@icenowy.me> <dd94e7fb72cf85800fbd46758010ea64@mainlining.org>
In-Reply-To: <dd94e7fb72cf85800fbd46758010ea64@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 18:07:30 +0200
Message-ID: <CAA8EJppHXUE=zhw=h7qM1iP3oLK6K9=Rqte5hKHtRGmT-5SWhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add MSM8996 support
To: barnabas.czeman@mainlining.org
Cc: Icenowy Zheng <uwu@icenowy.me>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Sept 2024 at 17:44, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-18 09:16, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-06-28=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 16:39 +0200=EF=
=BC=8CBarnab=C3=A1s Cz=C3=A9m=C3=A1n=E5=86=99=E9=81=93=EF=BC=9A
> >> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>
> >> Add support for MSM8996, which - fun fact - was the SoC that this
> >> driver
> >> (or rather SDE, its downstream origin) was meant for and first tested
> >> on.
> >>
> >> It has some hardware that differs from the modern SoCs, so not a lot
> >> of
> >> current structs could have been reused. It's also seemingly the only
> >> SoC
> >> supported by DPU that uses RGB pipes.
> >>
> >> Note, by default this platform is still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > For curiosity, will this driver makes DSC possible on MSM8996?
> As far as i know yes, but if i know correctly there are some DSC
> support also in MDP5.

No, MDP5 doesn't support DSC. mdp5_cfg.c defines corresponding
capabilities, but there is no actual support.

> > I think the Google Pixel device uses a panel that needs DSC, which
> > makes mainlining it currently impossible.

I hope we can look at the DSC support for those platforms at some
point. No particular dates and/or plans yet.

--=20
With best wishes
Dmitry

