Return-Path: <linux-arm-msm+bounces-20023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313B8C93FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 742611C209F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65507175B1;
	Sun, 19 May 2024 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLJpqiAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0ED182C3
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107548; cv=none; b=klPbmOgM6T4cPDFEyJ6CCrxMXeglV7fMLkI4dG4DP56R1QI3YG8bFJ5XcZqVtV6lh2Dx+auPNqpdpVwbckmzFK/TnPkd2mJE4PwvBF4vkQya/Wh/S5WrVKa2gJZGRZSzQef5SWxLyynJHFBc93jTy2WT+AkI1dZ1nMyB6REyFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107548; c=relaxed/simple;
	bh=7o4z5Hzuh+ixeSbNecKz9Jy3CviJ1QmeQIu1pkshTm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDdUn24QZ8Son41QMk+wflfIB1CvVPBJUlfW89btOtNobN2mMepbZr6C1JOjdXwWbijFc7RAuY6VGRYTAC9SU5fg3DnIAWMOJQcZFMZkncfBYC2OF2M3rf3BDI5VL+OboQct1w/NRwjxyDNsFiuZ6TpNzu1OJJt7QCGaLXjTLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLJpqiAM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e564cad1f1so27666391fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716107545; x=1716712345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Le8VTSm8L2eQLV/FvTpqReYtFhrZrNh0lNICrrBekA=;
        b=wLJpqiAMv6D3hnrQrQkuRr7xrBW+Pls7B6rws+tlHKCBdcgiPHc4nnBJYfURcUPtm5
         TqHmYoIqVrzK0e1cGEE4fVHp6T5z39B4tcXOtufHHE6tkPvD+GnSnkFXc7DQ1lL/KGST
         aHtSgWCC2tV+6nL6ZyaJU4EZ1P6Q3zSXdgeHFKFHrDOJtN0QTOquApKoEGc1Y3YDjDJe
         1icZWlBQpxzSWn0avkFdohNljpQxHRQGc9sU8EqtojeqdA9vmwuGSYgalWg12+h6/Asv
         CwnCDGRJMa+Cykg9vMRN0zunzf2jYLUXP0S1Tt9EaP7wkcseJ5CogTmlYoZtrLDKk++K
         GSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716107545; x=1716712345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Le8VTSm8L2eQLV/FvTpqReYtFhrZrNh0lNICrrBekA=;
        b=lwjLzQdT8R79j6ddvstEaBJ3pTkZAmNQAkYqnIIJZlifTATBqn7eP0pn5sRuUx04Mq
         l/XoFFQNukQQKFgnmMaA5P/5Ii4XCng1WQrJNh74Rke1Idm4qIbNcR3imxxXmJMqAhr7
         U0+3RU6O0HS5rCq6eH6dCSygGWIBg4PXBkjuhKyYglOVyRnJrO+D09JELGIQaI4BUaLr
         DDxlMuNmQgdKfToOEegyPLZpVgM7SBldMPDoLonjxdMm4v61zQ1fDm7wLkK/GGv/I858
         qZlZL9xzSigJvzY8FmHLpPlTRdxbGZZzFn6fSMz482sOVqgdlR5hgIm18qH5ShsmkrLX
         Z0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXEvsmszJadPWckcX+FPgpszlc6B+AZTLyNZQycqxJGOdCPC4AEhMFX3C2Y7a2aFlaEnUHQsbsqKV1wM2NBk7uwcftjST9lKBQrA0a3qw==
X-Gm-Message-State: AOJu0YxVo7g4jN72W4HGOnOXAMrjlthAu/PRsfuEs4C5y/5eNk0A6L69
	gj9NdnPMauM6beyJe1ucFwywgWIDzTBtoDcme4o4WKSBcse0MYHvrumnb/WYnBc=
X-Google-Smtp-Source: AGHT+IHRQAJTuuhuKf5V1fqci/B7pNsDW3WCJuXKkN6dOU9qUhabV6ERXOSUH7pVZKKxAmR7LqidOQ==
X-Received: by 2002:a2e:3c1a:0:b0:2e5:62e4:33ec with SMTP id 38308e7fff4ca-2e562e434acmr147040561fa.33.1716107544823;
        Sun, 19 May 2024 01:32:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e52ed429ffsm27370571fa.54.2024.05.19.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:32:24 -0700 (PDT)
Date: Sun, 19 May 2024 11:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] drm/msm/iommu: rename msm_fault_handler to
 msm_gpu_fault_handler
Message-ID: <ekfam4rolj5ouctytp4srq2iofh2ih4spdic2r4ffvjjawenhh@si37t7k3lmkk>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-3-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-3-quic_abhinavk@quicinc.com>

On Fri, May 17, 2024 at 04:37:57PM -0700, Abhinav Kumar wrote:
> In preparation of registering a separate fault handler for
> display, lets rename the existing msm_fault_handler to
> msm_gpu_fault_handler.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

