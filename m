Return-Path: <linux-arm-msm+bounces-48741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE9A3E1D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0FE3AB6A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B361FF1A7;
	Thu, 20 Feb 2025 16:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DrAJSbQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83300212D69
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070739; cv=none; b=mQstQWhgWbV2TTszfI+WziV1i5cR6ReV8iKCySFkGp7Um2SDOLTEfJe5LjOOAuxHMbk0qXA28PQ6dJRd+PvWGutkjvHuUq/r7MCoey/qQCju28UcajZCpjKmABvBXWf1Ek4rIMHNOXLVANcVCY1Pnphc168LCJtkccIVjxUe9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070739; c=relaxed/simple;
	bh=IaMyx4zJbOc7SlK0SsUvl5E9g4q84clVwL3Qp+Re03k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyFwxtJ3nPKB3XtcxLu5LycklBr5L1MDGBxhd+rOfnKPFTYDnPtKgx7yU9hRf847LfQ3z9Gc33kAWYl9MpmM2EM34HVHBGKInQwUVUUAifmp7/j96wJXRkMLqEErO6hQkln9nNqhjOuquOZELSPO/zYgImayZPNzQbPDifLqmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DrAJSbQs; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so1106753276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740070736; x=1740675536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQGm09mvBdK2cXSMuQL4mPfZFTNbgPhxPgRHKoe39gQ=;
        b=DrAJSbQsNTEoPjrC7xyEDUT77+IZKnF6iEXQexDsVkaRiwzQdle+aNFLblGEUpsKv7
         hZyPov+6q5P3TBe+Q7U6RiqmLnBDGM4zhj8KfROlVq4kYWwij8OYy14vYWfH2kCSVX/8
         uoKnoIve7pQ2zNzgt1v5eJw6cInR7azxbwh0dC6WZwNc7F5R/c6Gc4D0fNMKl/4CmUTz
         p5L/2xajkaSxVplrWLlx4aFzD9d1Po1Jj+eF/9mCKTa78mmqdp6Arersr/pBMe6pagmV
         1WU0KFhhvIpeXW2ZOco1EvnMoJQAOvYtTLniwyQ8P83GQ+EVJRL5xNsxK8pAYPRqvSYT
         xkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070736; x=1740675536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQGm09mvBdK2cXSMuQL4mPfZFTNbgPhxPgRHKoe39gQ=;
        b=OfrVohiHbgSmevFGDwNVkE4JBj3Xp9dq+aUYqWzD3D9oGFQ1dwL8cN742HO6LnTjJk
         ZE46zZ+OMnXqc+0GiV34OOOoexirpxiXwFW9xHAk+3PDKb9D0bRzJ+rP35haNMDSZf/a
         HivdbXRKEERWgVPeCyYw0FRKJhY2u3uGV2xkp9Tzpf/6QQQN/3lL22/vuKiblyxFrn7U
         RZSMhAfAzA6rWwvcGCW/14/jKvNpj4QXmHD8eA53SczsvJZ7pDPE0xm7UkVPhTHLFIAk
         zLeEaRtDPWP0+vbYpoH1+1Rt3gwrDvmJRtN8zlCmJscw1Lw0oJGcX96paAETFzsG0TF2
         jZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiawOJdpV1jQgT3+IvkHuZIPN8zkQAwRPDIaKui0JhLs4Euu7447Yr09GFmusOg65k1mPu7A/WxJHUyLNk@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbrgDQ4cdFJDgM96hxITdgkG8okm7TZFfwRKcQCrgOrq1i5yY
	V9tspXc/QlARqh5P0GowIj4xqIDSYC+4VSj+9mn4HKn8LYvZBfpwBp0yhSFHRbw+oUGqv540ML/
	NM/eONvuPz80xg6aevDiAeaIoX4Khov6GFI3Alw==
X-Gm-Gg: ASbGncthY0ABvGEMShm6AS1JoJ1+qQhrlh4ResZkhISGVPF/PcZZn2y0wOsvPCWF5uf
	hj7KFljoIXRIuhj5/XXQ8GLtpNnxhKa8eBuvnC3hkNKdod7xKod0eHqlw84ILEi2+cOFGBEOoF1
	oftKfGmePx0A8=
X-Google-Smtp-Source: AGHT+IHo/TSwDj9rjaJmDI7ueG/cX0IHmiSNBjN/IaIJE2k5Ejy7bMVotuAKIkDs0CnNfxvReAEeAqe1/IzMKeJl4mM=
X-Received: by 2002:a05:690c:2789:b0:6f7:534b:560a with SMTP id
 00721157ae682-6fba561941fmr76173317b3.8.1740070736530; Thu, 20 Feb 2025
 08:58:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org> <20250220162847.11994-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250220162847.11994-4-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 18:58:45 +0200
X-Gm-Features: AWEUYZmFJxng0_893ETLEGldfZpNnTmG1J41zgQwIxN-aVy1Spd_reUcQ6cKDbU
Message-ID: <CAA8EJppOSTFfszx26GzwQb36GNTU6WEpWmSX+j5ds17wc55nig@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 18:29, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> With the existing code, the buffer position is only reset in pointer
> callback, which leaves the possiblity of it going over the size of
> buffer size and reporting incorrect position to userspace.
>
> Without this patch, its possible to see errors like:
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fixes: ?

> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)


-- 
With best wishes
Dmitry

