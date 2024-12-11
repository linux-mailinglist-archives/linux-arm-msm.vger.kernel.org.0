Return-Path: <linux-arm-msm+bounces-41564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9D59ED82A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C782813C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A26320B81C;
	Wed, 11 Dec 2024 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zsLsZoKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C311DC9BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951375; cv=none; b=eq0yzRRBJLWU0iCssaSJ3VZOiZ77cEwnI2MM5TvPnI241xiHM6+TxXHM19q6EEpwg7sTS3pjsGEofseu7aWsZQiScMTKotaJOmPLGGZskDeCaMnFfBaXv17zfGgvA6vI9vlLd1Tiy5MwihR+ILKfYpAt/cUcKwgYRPlLk/NTWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951375; c=relaxed/simple;
	bh=M+SBjnr89ky9x9KqFq4DMNJhwJdrFehbl/hzoDeq7v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfR3GsUyyCzAR4dbsrKS2ONT4OptxE4hZfWoP1kasB8SMmmWzylB+q9/ysGDsELyyKi566jbcvLE74/LmOk9Phdj1g2NE3IzWfXs9k67Kp2r1HtEe0wHcv6krxgfJoQfJCEJoi2ranZBZ2GLgw2bt4ldF0vZsdRuiqk7EJkqIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zsLsZoKq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54026562221so1960402e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733951371; x=1734556171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
        b=zsLsZoKqd72pnw6Nmj8KvbcwLBEDmLccujJddAXkVt4crjhe+G9B8sbeku1Hn8AiTb
         +rW/auWpu78PgjuKukl2R5Axebe31Tp4GNSFbUXKs8CTNt+TA4bqhUkC1heqpLv89i/3
         HyzCk2HvQVNm2wfQ+f6f4M83d1U58qnny2Ilau0Ti3lC0zfCwqql0mnA5yRyfmErPtxQ
         iv4C6D5elBzLEFfyy03QOpIlDd5vdyxelZSjIqeudhluIttbzdUz08c2/TjhJwgegRnk
         3HHJznZPMg+UBephNVq6D0Qlg2ljXVertA8wj008ffjEik71O5S36qfjjfHxeeXmleRk
         AAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951371; x=1734556171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
        b=UL9kn7xvmnJrzFTY9j8eUpgl2BT9amc9kqtXCRfM5IwHXPdVcC0qIntibBQRQlgAed
         7RuDzQlvDMXMFdFRfbdNwpUihNfHOoFp71kApQESh+EczNKEXabW2NC7fk64+eFPfni9
         e6oKUTTUQu0RXNZdvBzN+a34MV8VGhvUPiHKKHJoye2lDm5IBnK4VhQNRIeR55LEuycV
         rmo6icrYXr2qQXrTMB/gMzOulSq+PSU85fnejjUQbiFmsIsLgH7ZMJI+n8yQ8PMZ3yP6
         dQtr25auiEX7nKuQ6jMUPajUMsDFzdfkxRhVMfM/Mdph1XdIjvfydoHdYLUg+JPUW2sI
         vebw==
X-Forwarded-Encrypted: i=1; AJvYcCVtZQeCt7X26QE8tLjmI7E29sY7YcmKaRC20ncftOqcPXEFljM35UsSvLIo1Z7FAOG1CifeoM7NFe7dO3Qw@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIqxWJzpSYyIwJxIy+OZWf9B96k2DCOFNjIlN43LtnNSjsXnE
	O6ptWDRRLDRFOO9Lp6me6kvPpL8torgzAVIA0ackzutPdsxy29rYohJXLnoreig=
X-Gm-Gg: ASbGnctK1EzGz3CMGsVaJ7qWxP96fjyL2/U794dk5Tb1K6o9T7pr0gT/oP44V1gph8W
	QPHHx8JDZtplYEzmUWgUMzG6l8un7pU7wK3tDN3w9FMoYyb5KzcZhrbRMblXROiZqNIyPidJ89j
	HbVx++4Ir318MEB65KmdOkJJzzUSEdbXAbuSW7/B9GgoGEA8KKDaVWEPX3g8+7014TMr931YtIb
	FcKM3zRlPKmSZ+nhPyjzNBsm1nxGcfU/IREIfhLhsljRnVL1Q5J/cRmYq2M432lLcwc/iSxEzWL
	9tyYIvpdCrKy2uy+NzaTqK5ykY/WtQM8Dg==
X-Google-Smtp-Source: AGHT+IE2nngXJnaAUtwl9k5Kp0+1aSGdWZRqw4X43BjQNC/SURzvx+f5grBltDBz9C5ghuG1lIXKDg==
X-Received: by 2002:a05:6512:b11:b0:53e:3bb9:5e02 with SMTP id 2adb3069b0e04-5402a60b1b0mr1317831e87.56.1733951371282;
        Wed, 11 Dec 2024 13:09:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3aa94b60sm1561872e87.114.2024.12.11.13.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:09:29 -0800 (PST)
Date: Wed, 11 Dec 2024 23:09:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
Message-ID: <rggt2smcj547el3bovp5djilydxe5wygqasborwunejihbqygc@xanqsyxqgyke>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>

On Wed, Dec 11, 2024 at 11:50:26AM -0800, Abhinav Kumar wrote:
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
> 
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

