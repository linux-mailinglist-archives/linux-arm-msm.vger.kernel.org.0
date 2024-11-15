Return-Path: <linux-arm-msm+bounces-38041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB19CEFC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A3F1F226D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405821D47C7;
	Fri, 15 Nov 2024 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7uiE6dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C91C07C3;
	Fri, 15 Nov 2024 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684262; cv=none; b=G5vGSSCY+QOpetFXhdw1WMLSl/UHT+A+ptdEYZkx3kTvseHWMZ2kOWZ6dlS8l7kbuKma+HDiG+wISeQCxYUm6fOIyPAQ1R4h5s2eQHlTGZtzxYr/9JZ9AZ/b4AfPKkMpD9PFjZLAvqYGHIBO/rWYuLeKMwolMMoznppmo0F3Gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684262; c=relaxed/simple;
	bh=HGJRpA5ii3SkSf5KsEeezpEijSCTH41S4aNzX9CrgRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwX5OBW+gjlhS5cJQfv/DbF5Ku/0k+Ce7TODuUmZ+LwV5x6fha6J2Kz6/XMWm0o0hz0YFsJm3Ubluh4rrax/H/TnQkG9YceiqTZk38VUqRYZ8SSjBb2gf2xu34yo0QeRzJAu02Jil9d1slF7PswFV9o57K4VfWN0g4Dd8eRCnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7uiE6dy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so32375641fa.0;
        Fri, 15 Nov 2024 07:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731684257; x=1732289057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucx6B/JNPInEFsSvEI7ykSi0Caq6EWc3TFtRreEO100=;
        b=i7uiE6dyYvFYSS/Xo3pTa9XJmbn1PCcoWYEfsnDGDCq0yPd/qJevD8fUlB8QCNgl20
         IAuP5JdoAhmBHQfS8jB7QsIsmT3bK95I0rzx+MrF+OTX3DAqpT9p3wQhH2v5YrDUZE8I
         D7Bux5bVY2aVALoLAQvw7BIjPs0YTVqSwL1UQsalYgbe4AkvpI0ynZ/d59P8gDu4tCfY
         Na4IbLkJwPtRK5t0Y/14KFQK/48yPdclAjBr6E/99O3GtpHphTuzYuSnQpv2OHgW+9yn
         M83lXLKYv/wZXHqT+pt/skhqxjc+f55ian2lHO7VD1RLhIP9/sGpssI0tzDV78ZX0eIk
         Qt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684257; x=1732289057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucx6B/JNPInEFsSvEI7ykSi0Caq6EWc3TFtRreEO100=;
        b=YemqVaM9DB/BgfmZwFuRYg+fvYEy9C/kKV4AuIg//5DI1T68aZ2uods3q3ccZl+g3t
         4dLxxHrN2L/PlnccY90u+KV/wEPCaA0EYapNiP1+7iy1TOtT2jrU2+qxtnTZte1/tZsG
         1IdzUyPgdmvkuF4SfnKrPr0y4ksVkMujmqOtN9ExdovYpzO3wFZ40evlkrH/JJidD+Rh
         JAJl1arqeHCgR8ZVEltsQA2jHky/ESjEZ4BnVfwQtRokzje16yMjx4/kg/jV/RSGb5nq
         CI/bOnE/TJybMMpL25a6ks9x/M4mq+Pr0vStF+sTCnuXQ19TfIxHM4wYYgUyk+hB2jjI
         rRMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7YEXpHF5BgrJRYVgKHpZGufSO9mo7v5nzUI8859DVcVdxv0PzPcgs+GykRjgt746p4WSR+R5eFHwkOOz9@vger.kernel.org, AJvYcCX/2yDuuQ5sQKmUF4VBOSX3l+yuBveEZw/jRhwLhjAEIK781qz4rXEJSwteFyIOOMEIYCXu1Adxp5+TgnHj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+n3Fobato2oNGPHZcOzgik+OXjuCZvQorYC2F0xVQtgmg/1hw
	qdS0C9IRypO6AlIQftR2hz4VZaRd5VqTyod1HggeiQeOI1mP1u9nvVVzLM4s9mvrlJ7901Csvhz
	wED6l01Yuh/b8JFYAGngCM7aH8Lw=
X-Google-Smtp-Source: AGHT+IEq+4+ZiT7fatSpyDHwGTKw9bmCk8H4bY8Ywl4dnVqzNvEW7tC37RSxM+cvzrfByPvlrPEQcRJGzEGaIAKa/ms=
X-Received: by 2002:a2e:9a0f:0:b0:2fb:6110:c5df with SMTP id
 38308e7fff4ca-2ff606db449mr31887351fa.31.1731684257169; Fri, 15 Nov 2024
 07:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
In-Reply-To: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Nov 2024 07:24:02 -0800
Message-ID: <CAF6AEGt2wHzMn2jF=P2+U5f4KQTE-8nTg4FUyF4oipkdqhYktQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix spelling mistake "swtich" to "switch"
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: quic_abhinavk@quicinc.com, sean@poorly.run, konradybcio@kernel.org, 
	dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org, airlied@gmail.com, 
	simona@ffwll.ch, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The "upstream" for the gpu related .xml files is in mesa because they
are used by the usermode (gl/vk) drivers:

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/register=
s/adreno/adreno_pm4.xml?ref_type=3Dheads#L573

Things should be fixed/changed there, otherwise the change will get
reverted/overridden the next time the xml files are sync'd from mesa.

BR,
-R

On Fri, Nov 15, 2024 at 1:40=E2=80=AFAM Zhu Jun <zhujun2@cmss.chinamobile.c=
om> wrote:
>
> There is a spelling mistake, Please fix it.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/driver=
s/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> index cab01af55d22..d28fac3fb6a8 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> @@ -563,7 +563,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/=
freedreno/ rules-fd.xsd">
>         <value name=3D"IN_IB_END" value=3D"0x0a" variants=3D"A6XX-"/>
>         <!-- handles IFPC save/restore -->
>         <value name=3D"IN_GMU_INTERRUPT" value=3D"0x0b" variants=3D"A6XX-=
"/>
> -       <!-- preemption/context-swtich routine -->
> +       <!-- preemption/context-switch routine -->
>         <value name=3D"IN_PREEMPT" value=3D"0x0f" variants=3D"A6XX-"/>
>
>         <!-- TODO do these exist on A5xx? -->
> --
> 2.17.1
>
>
>

