Return-Path: <linux-arm-msm+bounces-18643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB88B2D6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 01:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53271C2093E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 23:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395E55B697;
	Thu, 25 Apr 2024 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjIwOr3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4320315
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714086218; cv=none; b=Lgutx7zp2EkAOYN4QShhZgjZFYRJTpiFAoBOhLr5PVhTyzf0RovDkFNv4SalrPJhjjnsa15uwR+RMKXAjQqesHGOAEZ1gijqBikoz4g20CEQe1CSCU4Sdbt5OLjH+UtNsZU092ozHU1cqsUeWaCXC+xJuMxT+0EinQUrv9+B6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714086218; c=relaxed/simple;
	bh=NzHHKJe4kkOvu43r40dYgdH27x88pgRFVBqdCwSi0rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kERunh1AL4aCNW1guIPvpek4ilqUTML2YUnJQVhu54fgDN+nI9G52287Q6PGa8COrijX9eBALKmvOtN3aG40TRarU8gfvplDUN1qsxK5RsBbI3R7gGyfOQhlzyl6RUgmYJGaZ62N0aYBjC5m+B9erGadhPZaHLv9S6we2s1Yaio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NjIwOr3z; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-617cd7bd929so16615377b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714086215; x=1714691015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHagRpxhRv8E4M664glhr6i4IPcgo78U/4ccBwCQ2jo=;
        b=NjIwOr3zNlKkObqjs6cTMSz05mez5xms8UMfU6LCzCBRv7vTfqtuvH8W2A69qMowYN
         nMsgk1VcO4uQqLJZJolVTBROFJMW++FzrXLLLMYliTsg79TQai6g8HGFKn7KwNeioVQI
         FqQfsjgx22F2/HSaqGFKcWzqEA7S18hzPoxxV6H0Hk7piWYAOaOoZKbOvDvYKG+63AJs
         dW3LoyfBRmx+GHDJFwIKNjYReRX3rm3B008MY2lPdUTZFowFyMis4pncdpMg95pVRSED
         oqkRupyWjfMM3AbW6b67nez2gW9SWWc29fDCb0YDCAfCJO6k+0rumrCElq55bQc4eVAd
         EQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714086215; x=1714691015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHagRpxhRv8E4M664glhr6i4IPcgo78U/4ccBwCQ2jo=;
        b=CAM7ED7OmDAoB6ZPlp+pQCkrNWZqc+uQkfnBlnlijSBXqgQ+zYmCCfzExMCCoU9HpF
         zeETvWGnJH9MW1iGdqoPpERr5hGX0B8zeCghv1cysG2tM7voCccjUQ+79uMOdKxB8dDg
         +jrd+H9X69tbSJvpm1/Q/aMJu+sZLGOVXW+TcFjxa8UMbcvJnvfqgtKeytxOpKlRhuj+
         XLv3tCBF2L5x7SkWZGiwZuL8giOG9BQhIJmzJvCxNNiAG/ES/ugIsYfh+yKv4rTFQ8Pm
         XQVSccEFXAILdmfheWqMb+dbhrtUeTNIL/LTFVw1pFIwe8T37KIiT4M9i8GnsFJJOXIR
         fMYA==
X-Forwarded-Encrypted: i=1; AJvYcCWb1KKqASJnk6QKnPiyaMPkrRVkU9arzuEUgXd2OZHgvA0yXwPKvOs36aQFYVlN3ypuUXhLSAshD4ZLP7sR7L1Tnlr8a8uBP4knzPNnMA==
X-Gm-Message-State: AOJu0YxgnW2OWkBGbmtvCQoPak3WkaB9xpNoCDobTr2QNH6l/YUfZVpB
	MUVACmnmN7BI0B542MoB9+yY6zv5QzOtKWIvQbxcNMY5Z/xC6kNwZJpBHHuWtxMJK9IE4xBFoAw
	kHAJHO/to2TTRaBT7Ofq2AeddiBNLbod6GawxGg==
X-Google-Smtp-Source: AGHT+IFi6Fa96cZocrneBG4jFva/n4YMGR4e+ytDr3dukU+Wo3e26hXS0LJufmTCWEJP4N/7pkKDRFqUv4UcEpyPf08=
X-Received: by 2002:a05:690c:c11:b0:615:800d:67b2 with SMTP id
 cl17-20020a05690c0c1100b00615800d67b2mr1184461ywb.29.1714086215597; Thu, 25
 Apr 2024 16:03:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-6-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-6-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 02:03:24 +0300
Message-ID: <CAA8EJpo1mfBH+H4Z4uvZk6T_sKFt4-CBgOwJjaFVEx+zy1ZD8Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Expose the value of the software fuse to userspace.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  include/uapi/drm/msm_drm.h              | 1 +
>  2 files changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

