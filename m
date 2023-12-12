Return-Path: <linux-arm-msm+bounces-4333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CFC80E464
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5491282A49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 06:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B454AFBEA;
	Tue, 12 Dec 2023 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7CTmTsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86912CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:41:40 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5e19bfb258cso8873637b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702363299; x=1702968099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
        b=w7CTmTsR4bBftceV6dA8o9SkIwdin5kWphWNg24ZoBmAmR3UJT9A4WvMa6uK1HaX4P
         d26/t2VWh4VUPiGw81pclF3ceFc3tLx8rQAxcSeRM7PFlxVtIaFhQvcRcB1bUp0ZTpzj
         btceeHcpuCt8srjtVGnZ0xfBj3VLPBeWZYfo4XAvnCL9wJ25qUD78GV/1XNefqNLTAsj
         ZZRSb5YmTMHTNsxjK0+el1NV6aRrlaRB1idcggDWcjit+hLxuawxybwPM6Qi18iTGsaO
         Y2NzRwy8lpiR2IVkMXrv7ZARqApy7xvLQOBCsx7EW1688WhNmUM2Kp3iyIlFTO9t6Sr3
         hZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702363299; x=1702968099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
        b=g12QZaDagOz8KU3COeWoH5ZwwtftVqLFaxlTyrnb+OkrN6/mFiQjVyn42KuYIjGC+G
         M3XSq9A7aADkhsGWUxFpnbbOg8ztRpMi+FG8ZVKVJJv7rabTeiBRRMvN79ROQ9r3r/1j
         3CLKJYXtajp4cuwxnh3E3vqHmJqlbLgX4ULy1HwAUU0meQu/QwBnCVVgKiu8yRVLxgVQ
         +UuWxVX01K56/LGGgWpQdzjjFZEQIXC19WICSgbb1fYRuVl1qsYlWcuuewLrrkySiJVA
         xh3WHJOihUvwZEl/D1V7evIXgGEGOTESQvQ6geJygF7Kuz20OZSaZ4LkgHioo3PfUN6V
         kfcw==
X-Gm-Message-State: AOJu0YyK6L+t39f87m9F4iRF3DWbhVCY9QmplCuDK4gZuy9vatMSB0lW
	ytRHgUkpRgscStjrsgm3DTuYYVbzHXoWLIdEniXZZh2/ErL+/sOLBSa0CQ==
X-Google-Smtp-Source: AGHT+IHm3Elev5sOzSSZwb12FUilvp/T+04Oo2vDTg0/IFFD3ZcM1sD3HEd7qlZ80V9IQ6FD9RbDvwFmQqdbl1lMypM=
X-Received: by 2002:a81:8585:0:b0:5d7:1940:53c7 with SMTP id
 v127-20020a818585000000b005d7194053c7mr4579131ywf.63.1702363299778; Mon, 11
 Dec 2023 22:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com> <20231212002245.23715-5-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-5-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:41:29 +0200
Message-ID: <CAA8EJppjMhqJM8svtFECPJHRYvG7uSY6GB=Qe04q4hCQRNQZjQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since the type and usage of CSC matrices is spanning across DPU
> lets introduce a helper to the dpu_hw_util to return the CSC
> corresponding to the request type. This will help to add more
> supported CSC types such as the RGB to YUV one which is used in
> the case of CDM.
>
> changes in v3:
>         - drop the extra wrapper and export the matrices directly
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 30 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 31 +--------------------
>  2 files changed, 31 insertions(+), 30 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

