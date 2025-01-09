Return-Path: <linux-arm-msm+bounces-44486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABEA069BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 01:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 072FD7A2700
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 00:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10A436D;
	Thu,  9 Jan 2025 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fNtFdInP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBD195
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 00:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381159; cv=none; b=sBNFpLKXYa1GvwtVMku+HXniS9VwgxpU4kfaDp42TcKQgh74rKTCo+kheTMrDgAgtHvwPqtFnNlC7CnRupIA1GP6OtziDSBIzHbfel59CftGnxlWCRCKdiF1a1rUTG/XPq9VvGsb4FQanWe91FnXO04plLTC26YPW0lpVoXSew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381159; c=relaxed/simple;
	bh=woaLdQFZWEuR5pLqxpEoTMMweh46RlQ6e6gAgrr5jIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOHgtnDGSwdf4psNBzi8W8jl2eMH93uimlKTEytlel0WBm3cLsg/KbSBTL+7oSdQqyEQISgnnlBS3xdRkA0bIKAaTPB/iysB/f2Yq+ATVFY/Qjob2brmxf5RqdkBBEXKcEml5ofoDb0yjOR/3qZImEYtmuRXg/FKr3xE1U9qdoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fNtFdInP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso343999e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 16:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736381156; x=1736985956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
        b=fNtFdInPPMsvm9dGxlZ3n3G07R8EPvDxO0K5almBMwM/OnnZez7vFtLa/G+yclKTaD
         c+178oWEvvnsRjXvzdRfnpLsR+mzkBtxZc+UbaLOcfWJARcBZaEBxt5PzKRu8WU7SY/f
         r/KEavfae7YvscuLo4qcA5ksi2I4ZlVOiTQoWkZa+g2cF6goxyH1OzJUlJbb/dXfgvmU
         rfnloFGAG/badDIcqsLz8x8eN4TiuU9jcFKj90/mcR/600N/OSJuT19pGmL2yountyv8
         zd0OvpLYW2gQq9BgZ3FVCQ5BrxQwQPZ6PACwXmdLzO8Eeco1JkCombY1bsOQtiLsaVns
         DeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736381156; x=1736985956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
        b=Omh/+FfwgTKSdjyRxSltr4rxq1YkTYnUG6bZXMZcjHaD1n/GF4s31H4tyA5NZm8t4/
         nlnZXHoExueshBNyREzXYXi4FvJdGWr0qeCR9Vr5xMqeYEjeZcwo/fD7M9PwWIp9tDKK
         DyQiI1QU699LWf2cZ0P3/0NDGM2NiA7FEbS+5kOSR/+clzVK0RFWoTWYywcfnHFHYpO2
         YxBJV4iuKjTxf/lxpEP/y1C4morYLyu0WitqqA+lx5ac9aOOdKQpkxzwXB6go7lqieuE
         ODtOQ6f82Lz8vs03J2Q69qqfZKeTXVsAei347Gcu8Beji/vB5XFJMtAvBXOl+kTe72pd
         op+g==
X-Forwarded-Encrypted: i=1; AJvYcCULXUL1imQf/HNAaCT44MOpV9ZQzW5TzPb0rQcNReBaWUAobii0KSJwxalqcXmQcUqVYKulceqUT+Bl5tdc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6I+h0o5WvKpxJCje1cQ5GytsexaqrJ47fxyd+Csi5xhYWUbVH
	YCcdLsL04dvaeN/IEdttlfJu8rqOS2o+SC/Q9Wm0LBg9Tj4ugtVzjdK7GTGhT3k=
X-Gm-Gg: ASbGnctcVAl8bDINEeQpYkdIYOgqvGHGSDIL9X+YARaSKoucYVsQRmtgtBwl2e9HWHp
	Hz+eTNwWedOaKHWzugPndsv4Zsv6emKnPg5VJzlxFUI08do3H26OL4eyX2vH9dQPJDst2zwSFgN
	+WY3L3H9Q6ZCfyggr/cyUmcSXM/ICnGb7ueIg/UhjR1X9l75GR81K2Y6Z3/wpAR7+dyZVQzz440
	WR3ypeyZde0RzHUY7WpcCIrkQN56bVpNyqD5Pw1KsQd8wIbReFbcxPpZgvKdjCjlBQaQWlr8JmR
	WF/3IeXS9Iag1ESUE8keKFdPi6U7I0QHPYHT
X-Google-Smtp-Source: AGHT+IELUqPRnCGpQ4QsIILyGi10OQNYGAtMxjnWsGZVt+RoeZcTFjHg8GOZFcw/nz8qgnwgQ+uKZw==
X-Received: by 2002:a05:6512:b0f:b0:540:3566:985c with SMTP id 2adb3069b0e04-542845d1495mr1192732e87.26.1736381155638;
        Wed, 08 Jan 2025 16:05:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49a28sm30057e87.42.2025.01.08.16.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:05:54 -0800 (PST)
Date: Thu, 9 Jan 2025 02:05:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Initialize return value for
 dpu_assign_plane_resources()
Message-ID: <nlxhx5dlc6y4m5htbfv6l27ms66jpse4umj4c42fzrcctnvy6a@5dbsjmuqsjwn>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>

On Wed, Jan 08, 2025 at 02:40:47PM -0800, Jessica Zhang wrote:
> Initialize the return value so that the dpu_crtc_atomic_check() doesn't
> fail if the virtual planes command line parameter is enabled and no planes
> are visible.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

