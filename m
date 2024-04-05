Return-Path: <linux-arm-msm+bounces-16583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6A89A40B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDF62815B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A036B171E76;
	Fri,  5 Apr 2024 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLd354/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062CD171E6C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341108; cv=none; b=Xuw3TVx3b6OI2S1tUwh1fxs8HmbvHBTQI/c2G11Zk0zQi496Ka5IrzovI0I1PqK9YzeXQLIBdyusnBTqh0JbUJoG62Wm8evZeqgZc1Pb+qR8e5YKCzKEeLjzgHk8SkppL/Fd+4VcL0BEklHnbEFK7O88syFVlYCeAbb3YY7qMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341108; c=relaxed/simple;
	bh=Ml1kYgtWe3qbK64T1On0wgDhjpMGdS8Jw9LhrMPODgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwnSkY5KAUqoO+VF5phLAOCoT0EYzOaYpI8igU9dcTpDf402T4VsYAnL37vwZLhMGlqzcgbQD/toL8CLUq6DdmBM1hB/xC9GmJhOjnJMJZQJKfPSWd56fs4XhSpLmfpDBWiLB4exP0l94jJsjkru3k9oeX24Vw95M49TjJGwb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLd354/d; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so3207460276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712341106; x=1712945906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xusq8645bs18vd5bo1781YkPIOE7fRvAIzVV+0gv2cE=;
        b=KLd354/dpY38j6f+uXZbJ/7gEXxYzyqRGlGosLICb8HoGOXyztvTTJwYjjONthoeYt
         9p9P/r/xjkGJ7mMIhKGLtVLENrg4IMn2VaMRJw2WKyF/b/3niXstfrauTWCPn6WF32qf
         oBNXGrb/rVShh56c8siWSlmCfHh2xQDh6rpdFd5sV/ESo07RMvqcwZdUlSJmRPYEME/v
         9W4qJYBQZgFKjlTD0fC+NXylQ3T3W/TnUvKGUNoz2NBAGO11APartrWcKzpQ7xvII7OP
         sb1LefecJTP4M3mV/GO60T9IY/MmECFMH2BnCkPNn2Ion22o5r3fs4rJ9RU5JfcAjTUV
         Arbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712341106; x=1712945906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xusq8645bs18vd5bo1781YkPIOE7fRvAIzVV+0gv2cE=;
        b=tc9bt32sq6Y5WACZuY5Ct3jaBxLBJoTam8cZEH/YnCBCNN0aS0/TcLgQgkfVcPJfL1
         Cj8LDQyohGvloiraYaOVF5ogp8vzmwAr73V//Va5cCRdUom6pZILL14MmeR8FNQzi9Wo
         kn+v4CJLlWzsk33WJCSlQz5vX9+htxKmN4rt1ucFgzll9QgU8YEfXWjtE31DcpdB72U5
         Lr6a5bwuMDnZ4x7qw7TUXfUGm/e/9jlsz4fVtFW7MjpuFmZyUHU9bK0QIuC3S96Bm3kl
         CcLKyzpvflkqn4gEwg0YwJADV1TYhhlnz6QzK96rlzAfYK1oZx7+62BV7WcyZRmQYku3
         ehrg==
X-Forwarded-Encrypted: i=1; AJvYcCWDAPdv1J0Az37Itx7WhZAbv8REE8DMDTy51396UVLEZiOstQmb3k6bN2uVaPV79TT9RtdCV3Qn1KnnZY8XrOrHqeBhVwY0dXh7ZOaymQ==
X-Gm-Message-State: AOJu0YzmISmCCeCyxcOwiwS7o+KLW3Ugb26IcGvyMEYE8srCysftCTa2
	1F7nPPklVynpE0k+1MRkbdkwsFvewDpO8qc9egMc8gs8tX4SsOZF4VGF7IHXzLVupN0BzdAzm7A
	68fNru2wznYTQ1NmcfiGe9uRjb6jc88vsrziEaj0Yq5xQJK+M
X-Google-Smtp-Source: AGHT+IGAiydtQcELKAc77FciECASPkeyjQDxlz8wjgaXfFo1Qeolajjs6rV6q1Z5jFVNfzu1qHoac4henI8hlNbj9Ew=
X-Received: by 2002:a25:5f43:0:b0:dcd:9a9b:8d7e with SMTP id
 h3-20020a255f43000000b00dcd9a9b8d7emr2531512ybm.9.1712341106064; Fri, 05 Apr
 2024 11:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405162213.28263-1-kiarash8112hajian@gmail.com> <20240405162213.28263-2-kiarash8112hajian@gmail.com>
In-Reply-To: <20240405162213.28263-2-kiarash8112hajian@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:18:15 +0300
Message-ID: <CAA8EJprju1pym8wJvzH346H8CKd0A8Ftz4ENsw0exAn6RyfQaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/msm: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, tzimmermann@suse.de, 
	sean@poorly.run, marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 19:23, Kiarash Hajian <kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  drivers/gpu/drm/msm/msm_io_utils.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..e4f7c282799b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret = ioremap(res->start, resource_size(res));
> +       ret = devm_ioremap_resource(&pdev->dev, res);

Now you have erroneous iounmap() calls in the code.

>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>                 return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index afedd61c3e28..34e598ce869a 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -83,7 +83,7 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>
>         size = resource_size(res);
>
> -       ptr = devm_ioremap(&pdev->dev, res->start, size);
> +       ptr = devm_ioremap_resource(&pdev->dev, res);
>         if (!ptr) {
>                 if (!quiet)
>                         DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

