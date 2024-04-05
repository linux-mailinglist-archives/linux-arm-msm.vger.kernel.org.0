Return-Path: <linux-arm-msm+bounces-16584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331389A416
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E61528C489
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDB5172761;
	Fri,  5 Apr 2024 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5/hRK3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C42172767
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341207; cv=none; b=NfBY+Fy3LPbp2C1INC8SUVmlj7dLSxBiYoJ3ErnR9zNIdQZF4ft6i9r+RaZSOkHPVjgdKfBNNmJrWI9m1taW+fwTJJWKJ8vcr4vCXGjn5dTEZqE3fzEvv+EWUdLaRmoUfjdYTu04yy71abgoPdFjeS4acBpL4HJkG6bD4Z5EsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341207; c=relaxed/simple;
	bh=h7mzRR2BcU+NZthRy3maM+pbscEw0W7grx4tbHyDYwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HY4i7W7po25O7vU+/tLcRppzxSRabLqu21z1jZLtzdpCC1kkHFvaEIVEzFUirsoIcjCw2LoSmHKv2MfmJ6vzKYpe4K3PCL2uuXpDDr736wMAg3kruZC1tIH20WBvSEtrU5qtaURjoivSrrzA715aptuz2F/6N5V1MBO70hzf6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5/hRK3w; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2620874276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712341205; x=1712946005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpDzGRrClkUxxd0wNBawM8cLr5mKpKI36/KDGXm6I7I=;
        b=m5/hRK3w7G7MfQPIM3pgaqwL7sDLnvKb7sSOzaEw86jh2+0/t9cuUaLGZDAMHGd8qZ
         aAiTgPyVFYpkFbsXRjPmgqzj4bAJFiroSC0LeTuQJPzGxpSGKyO+HJIXBzf9O71ISJi2
         pLk/LpnTJFYptrdL8BeuoVkpJVwJFm/9Pw8XxETcrr3K/t1nBCcaMmzfyT0bI0GfVSX4
         Wyg0glZCdmrupaQTTFBKa2mZHorLncDQUh4b+2HYfIWpeV1vjy+/G6vJJJwFLz7tIVCS
         26OEjVcJyvCL2kF02cQx6wCfsWQVh4BSLTe6P0LfyvfJqA4UQeFCovhOHFQOBad5B/E8
         W5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712341205; x=1712946005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpDzGRrClkUxxd0wNBawM8cLr5mKpKI36/KDGXm6I7I=;
        b=aZWQ0qjTtpTIjxVRdm9w1h8M2p637rGCN++5GSQM4W63kiD5XAyzt4Ab/A22OyL4eL
         YZjtGcOxE04WAN5ks6iPAjYopHdtgcmDA/kuVu+0nBU9uT81u+0/VD0AjfK+xhQUVgPF
         3K7VTjv7SUu6JbohNpeLEksHvinXa41Pe47xC3+3WaSm5ZUethM3NYWeBfOmPxaLlMSN
         JXPmTZudGhQgt7pRjSzIyCwscfknsXuLC00Khb9lr80i3fDd4xAHkYUgKxBVrXg7Fnu1
         N0sx99v6PUamMNOYvlk/64jMpP8VbaDyzDaiRuG9fSR4N9tQhoxMwnREcMJS6/D7HEEK
         4u4g==
X-Forwarded-Encrypted: i=1; AJvYcCUg+BhPL6grtXrqz4/7ku3iwBSEn4OKj3vjooiMnWOGAePTcFGXOmZjPXmop+z6BcbuNdjPVJXTfKcv3EnkmOlPQMSwGPjoiG3AKn5obA==
X-Gm-Message-State: AOJu0Yxr/OV2kuTVyQAcTKCpNZmya/QMwXmHyDNn8M7yGOLwCSxRBs1Q
	PDBwZhqntWCEAzCn0JZ+d7w1eSqJitPvLU5jyyqIIhFMdpseDqJb54ZlbJBuaGEfwPO+hSIfEej
	eioSupDfJGGJZNQkQpmQx0YCX1zuWDf3FY7OMjA==
X-Google-Smtp-Source: AGHT+IEmS3F4yd2lSXcfoF8T5aDOGQm50r0FnJ0IB21W480Br+HatBoZliUU6wHsBQ2BYSCNyXyrl0Pj9i762weS68s=
X-Received: by 2002:a25:69c2:0:b0:dcb:e82c:f7d with SMTP id
 e185-20020a2569c2000000b00dcbe82c0f7dmr2213889ybc.41.1712341204840; Fri, 05
 Apr 2024 11:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
 <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com> <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
 <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
In-Reply-To: <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:19:54 +0300
Message-ID: <CAA8EJpoPbK6rEKG9mh2pfo1tp8Rrn7oqXt50j0q2O5v50A8Zjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 21:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/5/2024 11:16 AM, Dmitry Baryshkov wrote:
> > On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> >>> All the bridges that are being used with the MSM DSI hosts have been
> >>> converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
> >>> code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
> >>> downstream bridges.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
> >>>    1 file changed, 11 insertions(+), 25 deletions(-)
> >>>
> >>
> >> There are the bridges I checked by looking at the dts:
> >>
> >> 1) lontium,lt9611
> >> 2) lontium,lt9611uxc
> >> 3) adi,adv7533
> >> 4) ti,sn65dsi86
> >>
> >> Are there any more?
> >>
> >> If not, this LGTM
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> >  From your message it looks more like Tested-by rather than just Reviewed-by
> >
>
> No, I only cross-checked the dts.
>
> So, its only Reviewed-by :)
>
> But I wanted to list down all the bridges

Then I'd also nominate the panel bridge to the list of bridges for
cross-checking. It is created automatically when we request a bridge,
but DT has only a panel.

-- 
With best wishes
Dmitry

