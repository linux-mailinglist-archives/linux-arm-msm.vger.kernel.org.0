Return-Path: <linux-arm-msm+bounces-23440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6291132F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68859281B16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2031BA87B;
	Thu, 20 Jun 2024 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/Md/TJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2771B9AC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915386; cv=none; b=r7PMRYBpGR9bLaJbXJauQGd4JhL8slEXrM5BGohb9hl1d6zAerCUwSkXI3CXYmmMDiBQSovswRmHIgVm580SGNr9j+BUtlzBAV2yfOKYcvc+MT/U7S4sAuWJrxx+to2BkNyyIwF+RxUdYZ/YvQB7Lfjwwk/wV9A7MUeGSMlioX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915386; c=relaxed/simple;
	bh=EXP5nQi91Jo6kF1rzXh96JncWYA9OikK2JC/gkHN3Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn7eoEpXcW6jqf6kI2zrV5/zsxIVNWMRP+s5YIIUY0yH26T7zxhichHsJA2zlfasFJKB0yau5t+KRNlifZK5AbenGxWGi8Ldqy9Y/zzEyRKTzPS7nWzzCm8hwgHak9txDBvHvUUK7kjOZ7wxnN0fzj31NCg1nmm/MfrkDLLnLGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/Md/TJ3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso13553531fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915381; x=1719520181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhu391MowIkohLMR2Orb/FA0XCbrdTT+Z4gHfZRY9w4=;
        b=m/Md/TJ3DjMairUihoOzN5mD/qFp7BtUZazrNUY1Yywxl3vM4G+clQ6KmyOH7PNtm6
         7VbSUH71y9YNulrNWSJpqxNK0FD2r+tlioRxJUvvbj3mlYYGGYeKuTAMh9W1Frux79Bf
         l6hQT0qRihHdf8iYUmowZpm7t5TU0Ffn3jy8sOOqonPo495u707Jh2caHuLUQZdkMO1y
         EUuS9JFAGeNzVY4slHmHw9C4/TW6L1iqID/Sicm6SlcEbbyDrkMU1yVMwueRJXVuBPtG
         fKwmex+89vw9Q8fytKxMdw4Zq9OPAy+MoXzKAA1QmYr6GuqDrfEnAH9HYQlk3EF7CnDH
         umGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915381; x=1719520181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhu391MowIkohLMR2Orb/FA0XCbrdTT+Z4gHfZRY9w4=;
        b=E7trGZ5hfMWWxmQXAvZkT6kJMzAdMx//dYiNukkxAm4pl1TAf8Pp48yjqly5lJJd9b
         +92BTeTAPdAZk5jGqbOtY0lxu9ixPtc7zL0SqfcC8aCp6oGh0H8pNQfLgHERZKe+ysN8
         u8kv8sfyH+40QpiktgVnpqe12Vw21Du+e+ZYswG+AQzrSg5D/kcyOjmkqqNHGAi9dmWF
         vGMMAI4gkdFxp9rPTtO7eRqg9B9D/MswteLjPFXw9c+X8RMU3RwrLrJPWOGgxQ7N5NxX
         fuTUJrLvBxK1sodHSYbq21bQBagWcQKRLuqXa77n3yucGWPSQ20qYidWNOYwhF5v+Pzf
         OGtA==
X-Forwarded-Encrypted: i=1; AJvYcCUjpnFMi1M9d7D1vWHP4D/pHw8UooQ/WpqmNsTXwE6/pHM9uscGRVk9DIobmXNWY5FrL2Xae5H4SOWPcKL6G1kQy/Tqb3VlDynhpna1yw==
X-Gm-Message-State: AOJu0YwIrEVhQsNf9HFmSaof7F8X21HQa0z4yM6xzgOp1dtAAgx63p/l
	RX180E4Bv4L+jC/NILg+xWVw5ytgkOyWjEJfB4u2pkX37WZgAYevG24NI40q/70=
X-Google-Smtp-Source: AGHT+IHhWAWQPYglGVh5M4MGrcnUTyn3QOb5ZXLF90xiDtTOHmqPUQLBGCOcZAhbEpoE8PLlZ1sMXw==
X-Received: by 2002:a2e:8817:0:b0:2eb:ec28:62f2 with SMTP id 38308e7fff4ca-2ec3cec5f83mr37406201fa.28.1718915381341;
        Thu, 20 Jun 2024 13:29:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d59a82dsm160121fa.0.2024.06.20.13.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:29:40 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:29:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <izksgfpdypauaa5jn2nd4an4rausjn7hjwpzu5rmkrix3bbrr7@df37xcxj5vtg>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>

On Thu, Jun 20, 2024 at 01:17:30PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> changes in v3:
> 	- simplify the documentation of clear_pending_flush
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 

Thank you!

Rob, do you plan to send another -fixes pull request? If no, I'll
include this into -next.

-- 
With best wishes
Dmitry

