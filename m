Return-Path: <linux-arm-msm+bounces-18694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD878B3F74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3DE1F24C87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD433D8E;
	Fri, 26 Apr 2024 18:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgBCOb/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6571879
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156600; cv=none; b=lnggMjBUQvjJB8sqxzFO3TDnrjITWg7dtDUVVc4L06DI8YufNismqnQ0f/DWacE0Kl4Rsvz74MVzLqL4MuP9/yUJ7aC3YbV1cV2Yb3vee18OSnIx53Ij1WwXabLU2RbfyZqtdCdPJs/348uBeioouvZg45z+aJ8Z5xTVP75tTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156600; c=relaxed/simple;
	bh=8iQni4o8AKLtkCiSzMF5sTTPENZrpRMz064oMyR/9p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmPv04yADDH3+InWnTuYg4+i/XpwmsjELeoGzpVrCr8qZWvCPpfAvTZDKo7BaRBiby9Ji4/Pf69LWpBF1tMm2ZFgJmGFamak6m8J70yS1QL4tZIOR2QzlgSVb4+9VMtcNw7pqQqyLLIDmgsvDKR8PkoywRb/0qE+RAHtBmHasIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgBCOb/q; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-de596c078c2so2115432276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 11:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714156598; x=1714761398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PfhKiSI78+JIcccpgJr34viq+IohAArFutcQbMmPLDk=;
        b=HgBCOb/quyE9u+R/YOyJ5I6S8qNznA00InRMtv0S0M3KZtqIDEeM6wenyxfmL9ROKn
         IvrXaDCpcijwBUBHuV7yLXTZ4Ti5TX6svN5SeqK1qzF2yAb7oJE3/zQHVRHtYwp7O+1G
         /7m1xhNZzGgGB2/znyUKNAKpvQmRATpMYJfpApB70YiMQfo+Na63+Ro8pcptgMnhxU2G
         2ttY+n9KgQN32NO+zA8a9TbNMok5roP3hjRLPYa+sfe7rLLRvlIK9bZUbWjhFk2l4+9I
         9QyNiiy/YnpJlH1/Q/GErngKlRaAqTyBJcnI+6Y8PDIG5oICbaxZJ+JgEx4RbKUtzyTj
         M6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156598; x=1714761398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfhKiSI78+JIcccpgJr34viq+IohAArFutcQbMmPLDk=;
        b=EeZRevzQ+i18fv4MjmeD0CRe+TEJydsHMJ318u0H5ozY9KgsssOkgS9tqKmga7ZIPP
         +VElSVYIFZSF3kQoM05/NNvDodFm2YTlFPkgMtxof0m5Tnzk/mYfurJPxMG6vNtsVkFX
         K4Mk4l+VMKNkDQyLhY9bt6Q8fEXPpXxBp2gSYFdtF0G0eOIQ1sfTzOOwwBTD9kvjyZ0m
         8DyBc45kHF77OT55KJQDDJkKN21AhyoSItvKV/CFfOaQ4D7KPQ6HDB4emoUvG8WOMnKI
         N+1hzJeE/tlXF4L/6250vulgyHBv5KikWxPMi5IuoPSxn870OKUKfvXfc6E0Sne7mM9o
         cnIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHC8anobnB87FRsAcllF4GhJn5cY/Dxxs0jLeOE/zXQoQTu125uEXGS/o09x9Y4mEJGfMUFHZJY6Fb5zb5/b8RNIYK7qeDSnx30OJrtw==
X-Gm-Message-State: AOJu0YyZwxQTnGKaKPP2GQvB0StioGZjy3N3p5QlALG06DbB65cVvUuA
	GVP0zTisIn2e/KNx061jScu7DyBfwVlE8CjzBZ7eF2/vf7wHb9Zt+O6sVQUxlS+l20uq+XTGytD
	RhgnVpgKRNtPUcSAu26SiOKvatxdAd7+VIJph+g==
X-Google-Smtp-Source: AGHT+IGRxa3W0lgYO1YxHtc9PrSoHPfAHJlkehTh6IfPv4AnhXZXP6F5xHNGt4rxS/gqBaEeHMiE6Osf3r+FXyv1SYw=
X-Received: by 2002:a25:2fd4:0:b0:dca:c369:fac2 with SMTP id
 v203-20020a252fd4000000b00dcac369fac2mr3878075ybv.3.1714156597887; Fri, 26
 Apr 2024 11:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com> <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:36:26 +0300
Message-ID: <CAA8EJpoOJ4z9+SgWoCnKWY4Tq9aoX5z9f9S_KhHzo8o=GEuG+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
>
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

