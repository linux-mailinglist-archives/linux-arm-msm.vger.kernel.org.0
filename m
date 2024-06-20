Return-Path: <linux-arm-msm+bounces-23406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E38910D47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DBA0281FBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 16:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0911AED3C;
	Thu, 20 Jun 2024 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCWILTeJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879520B35;
	Thu, 20 Jun 2024 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901634; cv=none; b=dPrIjiPJVTeSC3O+BreDWliTE6BDVuZANHoE5J4LWk+yxfJZJHN5S40WuudmyUvrnbxJUck0Xiy7YkgGYrZ8CIoS+qgoyn3Y62ijhixiryQjz0nhBtNtxnbK5GS7gB5qwL9oPj2FhZzGwCfWgfGbTjmOiG+6DI9JmRlniWIHk14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901634; c=relaxed/simple;
	bh=+zQnkC1ohw23Q6GKsj1WBvQFO2P3lh97O3BY7g06Fx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5fvVG2WPz1xTkWGhLQmSImVlAxH6+gIqar9JPx6IQFvSchLbsTk6ohN39hWN/B+Hx0mKCR6YLTp1N6aeshkCevjInBD9Dc8WMiIHu1uwJjseT4z67gzpe5OOV/42hRJZmmc5FRmGBmr1r2Pd8LsAlujGvOgcZbHplTHqvTeFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCWILTeJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso12054711fa.3;
        Thu, 20 Jun 2024 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718901631; x=1719506431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybRqH+f3jYJpqHLaTIJ36+rntUDMcpku54YvTURH+dM=;
        b=RCWILTeJFLmRT73Oaexl5olCoj0rj7qmDKWDQidcpgnr5dNJeU0Yoj6wnqcw9F9fpV
         tpGMWPuP+fuK4znw48szRomLY08+tz5oswpurKbVPeMVpcXZiCxSvsIuEpMPpQcUlNqh
         I5bTv00jfR5UWID0V3Tpn8K/ULKi1TkYL3PT/s3niCmwR7Jb23TpVZVpaGePTFvN9HkF
         +MIxL36oYPbdBYjX0JBYV0u0lOdgnUh2Km+EhH0VOZmgvdFNpHYTMZzikzSdtEt07Nke
         wpqzU4g1Emuwyiaad6jIn3DrFl3+mPl3KZAaW5kBLJPV5cmSjMyI5rjUheIjZZnzA1lv
         8zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718901631; x=1719506431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybRqH+f3jYJpqHLaTIJ36+rntUDMcpku54YvTURH+dM=;
        b=Y1D6PWrvYqBQnDb5Cc4WyzEXVZwPZvNfr0IZy2SADfwSzIp+1GL6TdK9dUZ1uopeh3
         FAVJC2kvM0YXp6ifdEe+fQBx0hMh1W9ZL+GMMMxmemwHFzI+JbqB/yrCO3MfKS+88j9F
         9Hmowe/cevM5gQYJsPp0Au75huzU4H2tHFWw0peKXd5gpPStTrKjhXpM6mpxJH5hpwGr
         c9Po3ROIXoQufD0h4Ue09FCtyUM30Bml1bVv96DptavFguCUBNpAivcGsnwv8nY1xOzz
         pcz6qcOEvyUE3S49rN348IBoHa5T2fSk7VAxl1FY9Xk6Bsd7S4Z9s4u2Bj+z5uoectIB
         cerA==
X-Forwarded-Encrypted: i=1; AJvYcCU11+kk6qoW7nLPq9KKeCcUy43LxNAE6rHbr2r8l73ZEbtXS7jXPyEIGJpCnwFKSQkd+DqbgC2gmW+YWZF5M0rnc5aAoQdNzCztRjbo35g+BMdRvCeDrMAl4n4E8ZfmeiDQFpfUDova8Iue0A==
X-Gm-Message-State: AOJu0YxD/PvIkQfkLk0pvmwnI27Z3XxqYqgkuXs0+ujwWKIXMkLOXE2Z
	yIvqIRTIsJlB5XAPoyS1fQ7e+rqNzF9C2Np8GwZBkfau+pWTFOb80VhFcvUSYUC+5mf/ENcgORn
	jVADZJ2p3NzfJt4hEPctd4kFRIvU=
X-Google-Smtp-Source: AGHT+IGvqdAlDx6Z6v6araLkEoxtUYIgBR7BNE4u41+u5r5Ox89EvqTbeZiT2Cqa/Zme0pueUrHwq2W88SeIlIYAC/Y=
X-Received: by 2002:a2e:a9ac:0:b0:2ec:3d74:88ca with SMTP id
 38308e7fff4ca-2ec3d748a31mr44402911fa.25.1718901631136; Thu, 20 Jun 2024
 09:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618164303.66615-1-robdclark@gmail.com> <20240618164303.66615-6-robdclark@gmail.com>
 <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
In-Reply-To: <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 09:40:18 -0700
Message-ID: <CAF6AEGu1VArhyYO3+oV5WGcXTBZxCUFrQcpM_fuT7wJakA8AFQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw catalog
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 12:02=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
>
>
> On 6/18/24 18:42, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Move the CP_PROTECT settings into the hw catalog.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +static inline void __build_asserts(void)
> > +{
> > +     BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> > +     BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> > +     BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> > +     BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> > +     BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> > +}
> > +
>
> patch:394: new blank line at EOF

removed the extra blank line while applying, thx

BR,
-R

> other than that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad

