Return-Path: <linux-arm-msm+bounces-24596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370891BA1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BDCAB21B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C48C14EC5C;
	Fri, 28 Jun 2024 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfQ0KTPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3D314E2F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563747; cv=none; b=SebLYBCoondnk0PgKDaxXjQiNNKVHfA2Lv250Y2q+kk5vAUI/hcPy4cmP57vEtFRrR4b/Sdzl5l478U7rfuFj8jX9vuSAfIZUnbKcR++ZDjEy8EqIWC/e8rZ6QPIbd9QLVa6OuFYSfKrudl32keZ5cgVaRMA/5rm1OfZYIUcfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563747; c=relaxed/simple;
	bh=Aeqbd8mZF5g0gMvxy8MT2FkZAI51t9W3BeDBDhRYKN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8zvCw4lRMsUoSTKz+2BhcCb5x+NQVz0QmmRzCI9v7SbUVhyFRjvZVl4j/4FJemJ7C48gd9gIIi55lBaZVvjIy4TVVQkXk8ggh5QJAnrstzcw6DFLpSUB4NojLjrkz96t0z2tppn7p6bExX3uOtiyrBI5PZY95cRfct90dcEhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfQ0KTPi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd8897c73so376549e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563744; x=1720168544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=NfQ0KTPifBwF4t6W3AUoHCV4ne4NxDOjpqwKEXJrzzthgBwpel/q7rg3ht7cKRQ0aX
         lFcrmMGgEVm/IhB5HkUjaV+GOaSiEWlV/xOlmXfxiYnZmzoxxx7RjmWPqBGR5EMStl/J
         ufwfLmLKWy8cizY/i32gp7BPb1LkD2WOebAak713r5VUhVPkhbaYvGJocwyXamtqoTJK
         OTg4GWyx0bLzpD074D3LbZU9dmp+Nt0Sm4HRn0nyt/ar+FqrG4EtOUySeyObI9IvIn7F
         0CJJd9bsj045ZeTuyLnaeHxVq6grrnyYIlWEVB8Dwt+mX3rlQ/Qr8VRaE5q/04lsgVI+
         eMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563744; x=1720168544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=iWL1OWmeZOe/NtUQxC/4XrsqrgoZGybICs6etk26B675BXQcwSO4LjLPsDG0EfvvAQ
         Ry//NNNUaR6nXHL1/zF75sV9muiYE7M2qY/lCIbl9pvd6tYtcUwFu8SBuQKguiwQcZGC
         GH7C/zDs0EfN9CJFOOD7P3tuABHgVzvFxAtkGF4yPS0eJHOY4SuHRVQ4vysxWpdvT/1l
         QOez4l5wUpfXo1DEFZkJOvocm63/uw2bbxERhDUijijzOi47OjK/3yihnmb2Y3iQ/NXo
         Atws0ZIVqhGmpb5f6nmJY48L84M+Mg0gCzOoHKvl5foxNNB3woX7SZivMx8/cLl2eHDZ
         hgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLGglbWehQGdA4HQRXgnyEiVCC4hnixCzNPmHsIDkynS0eMYOe+H5tEbE7PJ5U0q/Ur7syP2HGqHhPVdh+7hmoAj/kvIFyc7Vw1roruA==
X-Gm-Message-State: AOJu0YwoJAfq+FLuAftY3dcZNmLsp0qy+zE7eNc2RDwI0cwnFryAEvF3
	I4Yy8Ci0rZieFMD1yzib8zuPUg6lM+bxpFk2o+gowu+dyzuOXUhYeHmXcrDdONM=
X-Google-Smtp-Source: AGHT+IHTiAZIPdDFBY86RLx+OqmRRF+qtx5Trn2TYV6LbMTMP6YvfamTxpc4oxDTByLWmHsNlvA5Vw==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id 2adb3069b0e04-52ce183add6mr9396478e87.33.1719563744009;
        Fri, 28 Jun 2024 01:35:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b37asm209380e87.275.2024.06.28.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:35:43 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Message-ID: <ojokmx4l5eaeclemszd4esgyfcov4gcqteegh3vqpbk7cdfmgn@yayrzbbaire5>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>

On Thu, Jun 27, 2024 at 05:23:46PM GMT, Krzysztof Kozlowski wrote:
> Driver uses ARRAY_SIZE() to get number of widgets later passed to
> snd_soc_dapm_new_controls(), which is an 'unsigned int'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

