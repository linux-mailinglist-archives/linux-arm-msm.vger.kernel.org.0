Return-Path: <linux-arm-msm+bounces-25345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07D92850B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AABF1F212DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D685139E;
	Fri,  5 Jul 2024 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6crCR4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08D146584
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720171412; cv=none; b=CehkSKnr+Ws0HRdGSikulWTqA9FwRqEEIWJftxT/qt9uwRRfyCYDeoJVF9GJFIS3fSfaeLMtI8hnIbenCPOUD7eJClQrNvJzDHx701s4Zd1c8drYw936MSVCyvaR6flidwA0f1Zjbwv2wCmN16+0GwOpbYbpBElZCawh2yPuZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720171412; c=relaxed/simple;
	bh=rS1RzpDxZ71cuVcTLvHHE5pX0pxnaso2+748Dz7Bodo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3QZQCVwd+0auae1FqJaqjPT7cCJIVaSb4P2+0zdtiuLl06dLxJmuMtLM08rxF7qdf26QkbjO2FxEjCFXiVIkWr3mPWeDkSWL3xdt2LHE2JAz8JEnmSp9arojXLi60CqdQfgxzXM0/dQWoPQK3Tec4ImbL71NkoFfXyBsKEKWUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6crCR4A; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b417e1511so13349017b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720171410; x=1720776210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
        b=a6crCR4AOqKlKzUbPkp2SthDXxb/DHqpCektfMvrFirX22ckRWOBXUtjLB5FBtOGMt
         2kn+zKo/1WK0Yq3oOwb+OLKeI8QYjH8kWyg29zkC06dQbdCgWwicrTghwT3RXebR1mx2
         R/qxXHS1/4ut4ch4KciCZTmTw4Upt9cSAAxmFpKwtQGncccHfjEUcWJT/UZDuZIes9hT
         yzoUNH/wXpO+hZWF2RG9EOJY9bJiH1I6KMcCE1BsnwWPN3U9ulIaztka7czscnHmNg11
         yq1jfYbP50BCSumbN8UkMfVFLHjMEXdkJf1OZHUeAetK74pRRZWVJ7ppfRHkQ5j80Br1
         nGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171410; x=1720776210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
        b=dzI+YKllH70I8khzBvedCQPhvHhQB4d5MOPK3g8wUBJsN+nJxZOpFa1NLzb1XomCEC
         J8QTGGfN8vGR5kKiVaPv08DqbK+mTFdpIMYyRj27IwyiNhbkx1TxmZdnXQzObiHB4q25
         8/B1/zHGkKuNy6BRtoFzR3zLo7Q0YRNZGdKXeYfIrG8nUqlZ2pM6U6ev1wkejK1U4viK
         VtFhqtQXTMR7aCBZehtil5CvTww4G9EwN3OUnTYFZW2B/4Oor+KUDz2wdgVTu1ws+OeS
         wnrupLLaFHid7qgy0Jrd63UnHcYzkWQ3AqJKozJgvgeWqQ32ljE5rk3o99oO0b3U7p2s
         BPJA==
X-Forwarded-Encrypted: i=1; AJvYcCVI1LlLc9LnYWDCzdi+18GdJ1KiGRGuuMqcY58SmRwTG72PDZzet9O+GhTj1Xcy/QG+vKL5AH1Q67K+wrXexT+tpAH/XbUD8OYV9NJeaQ==
X-Gm-Message-State: AOJu0YwRmdf9xc7YKqr24Dos8ez2+Iq6r1f9iAxmSZQFJBDHyWuFNSq7
	pJH2mTXihqz0Boiy9qSHI/VJ9AQ0cStBeN/sZTEl1OsJsDUn/zx2avG0T98KSqpsElaCXyDAdEQ
	uYloeZkVjWwY8bi+h6vbIDec7m+rB6hChiE4FAQ==
X-Google-Smtp-Source: AGHT+IFdbNU4G1KM5yKg/MD/UwoLXL7Pbn3ZaZq/bO3zaxMuYCSMp5qT9ATgxj2sjU0+WAadmGYWZGC5dv3nUOiV1F0=
X-Received: by 2002:a05:690c:700c:b0:62f:37c9:77bc with SMTP id
 00721157ae682-652d2ddeff1mr47325217b3.0.1720171409891; Fri, 05 Jul 2024
 02:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704093002.15155-1-amishin@t-argos.ru> <20240705091312.9705-1-amishin@t-argos.ru>
In-Reply-To: <20240705091312.9705-1-amishin@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Jul 2024 12:23:18 +0300
Message-ID: <CAA8EJppkdgj79v6s==egUOm1omJwsSUV-iduJm6PjJkvr6iyYA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix incorrect file name output in adreno_request_fw()
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jul 2024 at 12:15, Aleksandr Mishin <amishin@t-argos.ru> wrote:
>
> In adreno_request_fw() when debugging information is printed to the log
> after firmware load, an incorrect filename is printed. 'newname' is used
> instead of 'fwname', so prefix "qcom/" is being added to filename.
> Looks like "copy-paste" mistake.
>
> Fix this mistake by replacing 'newname' with 'fwname'.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2c41ef1b6f7d ("drm/msm/adreno: deal with linux-firmware fw paths")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v1->v2: Fix incorrect 'Fixes' tag
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

