Return-Path: <linux-arm-msm+bounces-15242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C488CAED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C321F66337
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE5C1C69C;
	Tue, 26 Mar 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bb2LxkaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681781D539
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474306; cv=none; b=FWNBjNsI+t7cy9cE+WpqoMeYy3ga5IUeaK1DllxxuKngLNq+DSdaRboLpzFQ7vQD1K3RnLf8dOFdjK5jxahUYS5TgNwYCb1P5zX8JICCCCpcJWXrivUbZtuazsOhZzii7xSwM2Cwk81rktDz+LPPEAHKHDsf4DyAC2lNx8B2uK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474306; c=relaxed/simple;
	bh=SbAoClBp6vcfCL54MkSlIoYTIV7r1b+nCCdUl2D5njA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTNuhTInlM+FJu0XywOoEiIJHX3Y488zZTuK8j1Bj8Uk3ys2gKLdS99B/l1ccYITQgPmx6d0lDy5Annhys/cc9AqfxbJPj4IyVOoPc+UcpqpXX+7kHhoReTrJ6LnuidwXbjH/U4JKNyUKFOHRLO8Kxhx/VX4ULDmY+QQ4EVJAJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bb2LxkaE; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a0a1bd04eso65419857b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474304; x=1712079104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
        b=bb2LxkaElAqiObuviNo2utz9kb5g7gX6/zhj3E83ANUvnBUK7MvYc+bS05fc+GcNst
         qArvvBL3Buoz0iMtiJFbtBwvEe7+oA8DT121n7lP9Wj/Q4RsNCvJXoZ1LYTR9EvZhXFI
         SWvkoyQj7Y3cOeoQZqDG6cJnSvADWaPhIDlCco/gBJIkTzW4Q84+piy9P5wSfrO9wf5l
         i/G+p0+ubv9pMzPmwvgQtSKU3b3sNgq4AyEBX5yEs2Z64buqRC7bqyT4QMqATlaN93m7
         b7j94z/BCjEk8MvD7GGk73G3zV0lT5dvztOuqw8TqlNLEq1x4bTi7nmNnBBnxV3GotyS
         zRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474304; x=1712079104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
        b=fYKX7UB7ZrDiOAoWPXdzmVEzOUDVOPfFMjHMlSO8PFH3PUXRuPj6kVTXY1rpn4Zjz9
         yevRL3mMhrwnQ3egPzytwUcEzcjYZdIAF3WmSzR3evxPjWYq5aLZ7UXLfB07kBy71iFb
         lZtLmH07cLAHkJiyytXthoiTVmp0wquDcu4mIG/NIxGRJrPW02n8qJX0ZNAi4NXHYS5r
         IYtxFN06BKkb8NLboVq5UZs66uiRrzDArqkH/x8wZPqlZ8Mp+oQLtiGEYR+gYQ+ZBgjf
         D4BeHreH2b41nkA8MKfXHEWybqOo78DfcChi7n4R7se7Oao2h5p2To6nXxprzelDtFj3
         dKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzyg8+iGV70tLXOMdl6TS+Wbg2cUJ5tUYUQFD9Z16emGLvH8f4HKS55EOocC3L1rvjXqdgtWBSDUFN3vMgE1lebPN5px8981n+Wxu5EA==
X-Gm-Message-State: AOJu0Yz0h6HpwYcb9miqkpxwQy1I6VukjbuGCXixHKgZCkheDQyvhb4/
	cVnh7gSEQiZnPPO4ATU3WT5xkXUwXImkSoU3dW8X+8QZHrzKks2bh1HiZ/6wamz/6do11nkpWn6
	9jGQoxrRY5SggFiFvuS/cGn4yPgxyy4bMmhK4SQ==
X-Google-Smtp-Source: AGHT+IHKvErihvCqyYvqxnaKemrvy7TNx3gwuqYnQoUJPA6s9U6270M569opHM8owaC5W9WEJhp8lM+R6e3WArVuFyo=
X-Received: by 2002:a25:db10:0:b0:dcb:be59:25e1 with SMTP id
 g16-20020a25db10000000b00dcbbe5925e1mr291813ybf.30.1711474304335; Tue, 26 Mar
 2024 10:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com> <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:31:33 +0200
Message-ID: <CAA8EJpoJQ+K6S7PbeWt740WhaMRWbNmu2LXz1Js+x8HgzuH24A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/dp: Use function arguments for aux writes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The dp_aux write operations takes the data to be operated on through a
> member of struct dp_catalog, rather than as an argument to the function.
>
> No state is maintained other than across the calling of the functions,
> so replace this member with a function argument.

Definitely yes, thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 9 +++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 5 ++---
>  3 files changed, 9 insertions(+), 13 deletions(-)

-- 
With best wishes
Dmitry

