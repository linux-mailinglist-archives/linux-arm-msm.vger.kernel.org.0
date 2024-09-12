Return-Path: <linux-arm-msm+bounces-31616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF9976D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 17:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61FC11F25647
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1D71BC09F;
	Thu, 12 Sep 2024 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+c5MCJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FF1BB6B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154147; cv=none; b=B2HMLWgBskYw/DGtbwSAJLmuwyK7sHLT1Yirr0orDb2K+RCldMttGBI/cbLbvrQ2NBErv/ZExNtU1Rpb4PKIclTcsYDvTw2b3E/+QnlHr3nD/xuG/DMGu9UbwLArrjazfMdK6399bY2u6Q2q5grNM4O64HG2+sOzMwOvI3zhv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154147; c=relaxed/simple;
	bh=6DeNJKisdHYMTlnWCPVFWo+z9XDLlOGPOF91RO/mKyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goCMcjnl8eOjrtpjaFzOGsTKyuYr0AoSOiwYAqx1lLWf+41M3q4VETUukoHaZj9LEJrT+652OVOhR1flZElQBJ55WeACFTCvTcgtY3K/PakBPksJZvdG7TPIecM4gFlwSGAK4djWtR51KPIO9I69rMEqjZE/MxVAAVvPhsT69kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+c5MCJb; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so12679741fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726154144; x=1726758944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPI6G/S5031LI8BZfD5KQZOQrwoKDAX7R4Xz8VDkK7A=;
        b=m+c5MCJb9kVsj82Xu37so6GB9Pbjz8WlGaNo6yPhg1+bWxxUPOGdc/CEjCE5hPL0xQ
         HhIaFsA15nzQWQheb/qMjDTCv7i0tVhFwoHHPF/lp7vcyIoWEYyl0Om4K5Th24PcPhOY
         jmEdq9sfaOnUDCj++5eOgTu4PJAPm5O949KnxjyuRMTe2zMUj9kWSVwSdDgkJxXrL4DK
         qgRsRbw0PlQlruhnbCRSmMV2MxW6f2iWzSGfHFdwFW+U2tmd2FLrubt3E8Ztz7kDI+7d
         nkVwjgp4BlOpAfRf6zrItqnb+nPhMl5dXfB+3tca84xzMu5f4iSkaTNsGpcwvFuEHDaC
         UYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154144; x=1726758944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPI6G/S5031LI8BZfD5KQZOQrwoKDAX7R4Xz8VDkK7A=;
        b=eMei8lor5VWZA8VzZxiqFQajum6GRgFK9Zd2NguccFOwN35MwBKOR0zTbTAXnV+8g0
         BIb1BXMCOaFpgmpHgyAxIZr/dhzjCyl2RmH9fjUlbANc0/RrC817nq2e9qMryPkiCbxi
         lwkerjsqNKjSsfY4SQa/ZOsrL/nHqpplhOuBnOZmwXQ5iCP/PgYbhw7cA1X74YvVXtAE
         QBJ/c/SFkXvySssBzAUvdAiL7UR63TaGRiGpInZWsBcfkEVqgGHBeE/3zxla+fIbAfmH
         xhOtFTMBfXG2E55wJ1GzCJnc5b6LGXone5tG39XT7lxmAFMoUy5MzF3g7gfvyQ9dUrHt
         KJXA==
X-Forwarded-Encrypted: i=1; AJvYcCWDtYR+81Q2Nz6hETVjcoTrxyqYzdq+9tlK1WT6WlvvwMOxAYe1zvQkADzv+Af05beWg52SbcT092ZW5XLw@vger.kernel.org
X-Gm-Message-State: AOJu0Yywv/AZsg1xot/bYyWmkN7+3u9h5tYz7swn3hzv+bO24rgjhgb7
	qZaqL6fUsgzeTxh4WASsfN2n/sUsxbgm6EEr0xpXPJ3YJU/si21vop9ild4q2RA=
X-Google-Smtp-Source: AGHT+IEq3+0QP1kTu16Ee8cKa/6tDbQAbGkULUNu0YLqrcV48CRN+wczhR73Rl5UaQW8a6CDxJLzNg==
X-Received: by 2002:a05:651c:b0c:b0:2f3:f193:d2d0 with SMTP id 38308e7fff4ca-2f787f2dacfmr18360581fa.33.1726154142906;
        Thu, 12 Sep 2024 08:15:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b2138sm18952261fa.137.2024.09.12.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:15:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:15:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm8998: make const arrays ratio_list and
 band_list static
Message-ID: <fbgqvfhansee6zklmziht7igpebsbwt7xdfzqdq4qwkjbff2p3@cb43iqi4oxxx>
References: <20240912151037.592477-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912151037.592477-1-colin.i.king@gmail.com>

On Thu, Sep 12, 2024 at 04:10:37PM GMT, Colin Ian King wrote:
> Don't populate the const read-only arrays ratio_list and band_list on the
> stack at run time, instead make them static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

