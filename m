Return-Path: <linux-arm-msm+bounces-19586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B798C101D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 15:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF8F28337D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80C912F37C;
	Thu,  9 May 2024 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SeSSZTCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002091474CE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260068; cv=none; b=t+v0fB/BeR50eRh+2PUX9FopCE2Q70Vn5uvk0ImxOZFXPQsd3aYvrWPTzGdeQ45fXfYRgFiPyoWqnAd/bk5w9YBDKNK2Ouvl036OyvPF0Ke2FZR6GuzuKigEQ1QQomCLkXWvN/lmo+ZbxANmYv6LcuT6fSj6ufSE9gHyOwIJ5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260068; c=relaxed/simple;
	bh=qnwFbH6hbNfNo6t7d3oWIOBDIP8qMb2iCaLIEzvTNro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8/Xl4ZoKCmJ1zzk0EIJwUyTORun3O7bQRBO6b6LqzmE8kj1sfdK6UDxyehM6s/TY2bu9bC5nYAIOG9DrXGjR5EU9dy+SNRBxzu6nJcKkwMa+SHKr3CFQlsUz4Bh11jrN7xz0/tov6eq88CxvulQ+uJ+lTgoAheoL/rWKJE6IdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SeSSZTCn; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f05b8fc6c1so408250a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715260066; x=1715864866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dq/7jv0B6IQSIW5ezeZnjPK1GMhKRF8SPgvddGu3eY8=;
        b=SeSSZTCn063EgJ+jsq7aYpWuvSJ+VyZNlkAOZ2o2rF/IHgl/CL3tGJCcGeZB4e4pFD
         RpHp66j094TZIIzvkwdvJOHxed6Bz/QppeaNzRqRt9hRyE5RmsMLIpglBHWFO4EfHUU5
         Uhqt05EfchKs8U2D3dx4he5UlevUlQ5fymIN4jphaTIBvAeia0vh4Pmn06n4Uj8I5lBM
         080j8p4M0ccP0Xlmnwgi5B1b68dzTk/AwNuLfhA9Nr8wK9fOcUNeXGV0AZYrDwYcAZNL
         DqkN9qp3spp1hKkmCaQwoyPLrwKiAN+hHlt80QMgXaTJSacRx2g2Yk65wyPjspFV+8MW
         AmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715260066; x=1715864866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq/7jv0B6IQSIW5ezeZnjPK1GMhKRF8SPgvddGu3eY8=;
        b=wPd1MkUVXFTutN+bpPdDsHnizhhaBiEh7OTx0d5WURDCldQvKpu446xKfpi+9xfqFf
         Vj9eSjC5kiG1o87EQIZ+gBb4qCVanG7rkeIyHQEqN3yE1s+bUNbXY3a663Mbs0pcEJw1
         fZWAu/W/O5mKRHeeUI50pMwxtPQfS2FGLNOThCfoJj+lW4JXX4KYS+h8IyGiaL+43J3R
         cXk5v5O4VjaPOrILFzhCyUX/4CRDdadOg2Ggenc8G2F7Uyw6mwCa1oHV0CNRfV7uGaJR
         KdUA32qRACeOnlknOSYiN71du39XttiMmwuw1wI88OlocX/vrec9jp/iRuDuma8bWalx
         faMg==
X-Forwarded-Encrypted: i=1; AJvYcCV67xekluLi4QIa6ze+fYC4T7pwshPip9cBJch359zf7eieKcWqULJmRE5Tu0YSC3vBA+RrwzyRwxkhU/dGnIPCu3/PIyxzUa4h0lXa3A==
X-Gm-Message-State: AOJu0Yzm5WsFDebLRmH7vEkjOdh8BCmGqwBVUENLP7Tj/HBHcOXcayZc
	3osyhC2Xo3q7q+2vIOzpEeb9Hgk4NB+OBbxhyilq4G8Qf9L+2lVYe1bTdIPZSVKaCWo8Jd7pl4W
	i9UYFRbc/li53eOHNSe/3U7rn91MCAPEALjVV9Q==
X-Google-Smtp-Source: AGHT+IEzWUdmpapzSIoFpj2DfAmoac8yI22Bh1WIGABq6d2/lIZ+FrGwyUl/xliHUdZ6iq0y1VIvQMAuV+fw1Y5IS0Y=
X-Received: by 2002:a05:6830:4118:b0:6f0:7e5a:95ec with SMTP id
 46e09a7af769-6f0b80e3a15mr6185005a34.37.1715260066027; Thu, 09 May 2024
 06:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 16:07:34 +0300
Message-ID: <CAA8EJppJQOjMOPJYcEfD56knZzDed2ijp6HaQ5wP+UdC4Nw8FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 02:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

