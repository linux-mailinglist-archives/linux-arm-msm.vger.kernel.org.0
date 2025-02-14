Return-Path: <linux-arm-msm+bounces-48018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFCA35C8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 126E216DDF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121D227E9D;
	Fri, 14 Feb 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnn/A+eA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9C221541
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532630; cv=none; b=BR4+cj+kGgQim7tfOcDcYu2ihNlc0QQ38vk6I0FLESpCOoWep50MrunQGHavSdkKSTONKEYgXCKw+jnBf6/ispI0lCaYjVVaSXlzVsKKvJ+UTYPIQtIppxthjfriFqBqhRE3hMSjPDNeXqDvrC9FpeWb8CdYEpPsb0qBIVh5I/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532630; c=relaxed/simple;
	bh=aOk/8lcb5DDM4fG8L4cmHtutp/x17bXsj0VDjmgE+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LV5fwT9H/zOtwLn7S6l2wnSDDeDtyM0tUsv4MlEzBSmXEhmTP6YPoZde5vXeU/Jrp8MLTfjOKR4aEuZccfjk2r0tYRAOkPFaO9BWwFFa0igVrovS6wSgDbXE7u2I/j5INpsypvw/5ws5iigCdjRS6y64li78at45LIcWLHe7sDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnn/A+eA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30738a717ffso18920051fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532627; x=1740137427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
        b=fnn/A+eAFIO3vUswb7CBk43/CDMnQzrg811ij+Q096mVa2AbZdPxfZ1B0Tx3KHTQYN
         L5HZiXKbybrxpmKhv+YTMJAWeykIptM+5tDrVW0rNCdTWnoJTw0+PvflZ6aVE7tD2M9D
         gD4ryPJSsWXDSvzkIVFQAMyXVdn6ugbaWMgC5ncvs0HygEh9ZOvk0Iu8kH0L8cLTln+h
         +9f72ixpgW+L/gxPzAruamoSwzN3OUydTsvjkgHM0pdSuJoMZvcHnY86qsl+9TAmgRHa
         ph+UbrBARG5RefCCFcTK/xR8RdFGSm1ymDpP+5R1DajWBdvmuEjnF+EmNcZqtmvucaPO
         wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532627; x=1740137427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
        b=KQVM3RV8d8pE3BxMLO/rYcqLIEsV05PLHDTqbq58Hfp4Iov52Lh5svm6PLkoik2Cz8
         V5YEAG5OdfO1oSEF2PIEFi3dxIlFt7BbmuFcDrf1v5pdeA7MrKl+GgSpeDmXihEvIhPV
         w1x5ialDlPhy9UMf0eHsh87SScGhIm4q6lOmTEoaV0nxuoA0fHN8/TgdkvFlgNAxSHR8
         ZgKWJE3E542E7E70hUIXnikeU/OdN2/K/qRl6ppDtFyZcfk8a2mloiPBtjvRqXMTyH3o
         qKANhath62YIlb7mCDXpT0Fadm24DN36pEj9TGjIgNdzAxxjhN+Hu6s+xTw1LMJUewG3
         MPTA==
X-Forwarded-Encrypted: i=1; AJvYcCXFBcpqDsGFhFeYsc5HN0NkIn3jIPs0YhIjBVCxypkhuRP69oU6qcpdUnXdlDuQb4xJDccshoS2B1My8NtN@vger.kernel.org
X-Gm-Message-State: AOJu0YzffCu0Yi+ZRkHfcuCnK8kTMRLNPsBMTWaFap7Cpwo9O6tN0hoF
	kPEF/QK8fmrQ09SByLUGfy7zB4RndW9mWQR+P0ip68cgkMATcp/fITed7aT3Mqw=
X-Gm-Gg: ASbGncvftMHXLFkYX5k023ZH/x/919yFbzMOV+CNnQP9ibh59xLDgoIKNQijdlvUew8
	xCXTcQlAxp2kmCKEFDjiwws1wK6WeowaHSAO2Q7cbwSMau4klzj9mERV/IiXzg5EKU7Ug/0agt4
	nO/aCE+y54oR4LyiNUm3NHXGHaVmhwHjx+k21fNRwapibydfjC+plBTZHbur74M0i6F1XZaxMOU
	fpiTz3ufxHvcFpliIK4hoMhPa99GQg54pO1HGylg/TDQ0B2J+2m45PhGeWOEenE8Ww9BftP2/PU
	xAd4ux/cZeTLl2WLbduEy7TLoSGKB94CtbQvAqNLX8QjB4wiMc41tyEpMvzXvkdyUIaHMhw=
X-Google-Smtp-Source: AGHT+IG1HjnIzHq0g6LCLS2rLFVsIGs1tP/QSpXsX3Vtdfzqpm5vZz4Yto5JghYhTAcD6DaFR7+wyA==
X-Received: by 2002:a2e:a58a:0:b0:307:e498:1269 with SMTP id 38308e7fff4ca-309050e318bmr35230061fa.37.1739532627133;
        Fri, 14 Feb 2025 03:30:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b769sm5097411fa.101.2025.02.14.03.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:30:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:30:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>

On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> > Few minor improvements/cleanups why browsing the code.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> 5 weeks on the list. Any more comments from DRM side? Can it be merged?

Are you going to repost for the patch #2 commit message update?

-- 
With best wishes
Dmitry

