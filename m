Return-Path: <linux-arm-msm+bounces-21680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD48FBEC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71479287217
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659D614D2B2;
	Tue,  4 Jun 2024 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbnyJeqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED714E2E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539485; cv=none; b=ByojcO+hmzcB0HZGeD0d11gjtS7mbj07HjTCvCy01U5Tzhmk4KowqY0HH3TVlOByUfjHAYrTf6/2ALSZbRunrjSFAWaFC+jE1Y1M9nH68ZWjtgU2UVPfQKLpETFPOdsZJvCB737KJGJO4yFt5qO6pcGDVVODw8AG+NrrBc6uOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539485; c=relaxed/simple;
	bh=UxKMXajm6DR0Riqf2wqSJ50U+pm47wuiq1272pCFaQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYQcsmEaGFYfup+swD5RnOaj7aKqFxoqDCSrqF91UoPoQUsR5Omzeed7UPUJI6nCEEoLpO3y08fpl/ZgK9dGcJ36kVo2rNLS6KgHfFqt3S7oyafA7CdiL3qjbj3Ul+5mGyqdxF4+55TOBj/EyNnfppDGCDKfwRJhSsWnb8luOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbnyJeqd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-627f3265898so63263027b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717539482; x=1718144282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
        b=pbnyJeqdYCIU+zt6EN/zvHuwDm4V6e4hGfrxawjbGuWKVYy7vF1pt9F4HmyKIS6FmR
         SUZN9dsQj/PYN1lMcP0LxDSksnRkHVWZ55XfeVjRvTBpnpNzmK4IdCTxspnxO1dkOxAc
         2oNNUKylNUwYkp3pxPUysfOVW748pTi8SUSHWoyXul9gV+m6Si0g5RuQrRvYpe4lSnXZ
         mU7THmP4bSOD7wBVv3JnQ/xWoQNKhfCnsUoe58E+cYz0ozt2BbSA7xmFcmaJZtAxXqD4
         CnXthFe5byNZLHG/P+LBi+TpVCzwjG/gsiYsD6vUYXHyNL7WkdPnjkRd9fhbD2OhoiiF
         hwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717539482; x=1718144282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
        b=lps2G0xGTZ5uVU0/b8kGbOZvXxLQp7EJVf+h5YaqgNfNp6GNGZUs30ULO47pcaIdNk
         7SvZUykDIJXUNMfsMpX7nj1wxxS7RQOYzRp3DndGEgws7rkx4rFJJcv/m3InK4W8TsoJ
         DvwDu54/Z774RPOcUpOJewXZxgevkcqP+Wl1QWTVDrcsatw7vMLGrQaclHjJC1UXVq6/
         j33l0PP0dbi6RYGB5g8JNmrAeBt1Vgm6xyarRssFz/qyx0N59GXnVEPuepzcZCWGI3zg
         UXOMX3Qi3Dv7pdn+fVLhDRwM6AX92KIrUh7X24uGgL9F+3zJcQ3BFT6sKUPu3FnQArGK
         iUXA==
X-Forwarded-Encrypted: i=1; AJvYcCWs2XA66+7xU3+V9gWpKjfdHjpVIC6fzSxi5OIky/2Sce6wKt6dfMhtWdEtAV0xh28K9OlUE+P37WXtIGspJY8vSQk3YjdIO+mtUp7uJw==
X-Gm-Message-State: AOJu0Ywag5k8YDctTDRYldRTQdqUiDAI0wpctvSnbclk1GOM+EilXUHa
	/mE798TyP7CM54Q6mVX0gcXv3c5N/f2eNkz6YGAkqBTRWYlZr1yRniYJYZ406m4DBux3Hc+dsBS
	nXKqKWAAr9LYmKffz2g8Tc5r5nwLz/msJ/ZGrlA==
X-Google-Smtp-Source: AGHT+IGjOfS4i93Row/X3jqzU0dH+hExXMYcFf+ZqDyJ2rsltsLw1J6GpgelC+gB54Q/xtCmXF7iFbUk4LEnR14NsBE=
X-Received: by 2002:a25:828a:0:b0:df4:e791:867c with SMTP id
 3f1490d57ef6-dfacacf972fmr736847276.43.1717539482510; Tue, 04 Jun 2024
 15:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
In-Reply-To: <20240604214018.238153-1-pbrobinson@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:17:51 +0300
Message-ID: <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> this is needed for automatically adding firmware to things
> like initrds when the drivers are built as modules. This is
> useful for devices like the X13s and the RBx devices on
> general distros.
>
> Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b4..fede5159e7f5b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
>  MODULE_FIRMWARE("qcom/a650_sqe.fw");
>  MODULE_FIRMWARE("qcom/a660_gmu.bin");
>  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> +MODULE_FIRMWARE("qcom/a660_zap.mbn");

-ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn

> +MODULE_FIRMWARE("qcom/a702_sqe.fw");
>  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
>  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");

I'm a bit sceptical here. Each device has its own zap MBN file (this
one is also a fancy named a690_zap.mbn).  Do we want to list all such
files? Consider all the vendors, which are open-source / Linux
friendly, like FairPhone, OnePlus, etc.

>  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
>  MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>
> --
> 2.45.1
>


-- 
With best wishes
Dmitry

