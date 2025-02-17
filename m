Return-Path: <linux-arm-msm+bounces-48281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CEA38CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ACAE18948A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13166238D33;
	Mon, 17 Feb 2025 19:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6OfmLye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C3237179
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821880; cv=none; b=lXflqvMpv8uXWPC8hvmZrD0h99Da1x/v++6XNqM3IfZSe4LXbILztt0pf0R69NyOhSmyc7yAR2DBeMPSISI/0qMXNz2kqIXfU49MdKcNfgkYl6lZyySLkl/GZOSpf6gYsC2E6oCa+AtcIrH9++MK170XqviqZInwiwaFWapc/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821880; c=relaxed/simple;
	bh=gEL1+zcVPC/RV5a90EqpXLzztE8bxnY4nor7gtc46Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu1GUhdy7QVI0ryhaA0xX65I0dUC9Z+9LCB3iPcPiEZM7RUdJLNcYrOGqi5OFPkAIYM1n+zb8HZiVaVV1u3hlKp+fF9i6f4llThi9x3MTn2ry4AnVwVHodTgvkmJlnV7bNmcRpr379lRD0Yu/0MSiDsVLjETVkHg39hcp45orkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6OfmLye; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-309311e7b39so21904021fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739821875; x=1740426675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
        b=t6OfmLyeC4XFL6/TBuknVVZMLbw0m0Ge5Ej5ldRxy5U+AhB2Ql3yjfkVzTJD08IgCq
         +ojQJfh0lsr9uFgCV/Fbgq5t4sc9f73kbQdXnFy45AjZ4u1Vbzd8tolfH1j7KMl0VQzd
         EXAl8WqzYIJ5eVP7O6HpDMCO8cC8boUeQLqcBo62tGEzk/F4MR27cC324uTbeo5WOczB
         jMtgUQRZd2dKFVWOCIizRSYO/SZGm6g0eXBtRi8GvtBwtupDMsQ8u9Fx/FIHghywgnCL
         LV/AhzWSJtCXmab4dkKudTuoxlqjQL/HyiEkdCn+yROb0/g4ZwdTbEJKmXsiW8mFXzqG
         xOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821875; x=1740426675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
        b=uwfxZsef/EJ2L5DTlXycfbJEE2WA7r14OFqE46n/moc5RCahU2nrI6zWdzwh4iq13S
         K7zgshDcRYnDkJmMckzJ8f6XiF5vgFwHrRU6iEn0sOJL8TIKhSZLWCK6JjmiG/0/GXRO
         jEQpn4yuNNUHAxOZ1vIqrFe1y2vJyJZnbfci0antNllgf3U6PH8mFxfpDMfnluonAKdo
         ZooEBUUvYY1yfjUop28YIuddUFl6KOwNyQa+vamt54+g2mgvnjNZVkVdV38pbKs+SjyY
         ylSOmWY++iSzG8ZRl0HnDKK9zYca4XhD38hIwWa5u7T2a2NhUE6Oti6eVM5292tFQJmg
         gXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQt9zif0YVbh3Vspb2AsGslgEb/N11Eo/7OmOYEawa2cpmxcuiWdbGu4Ofa4E7rXSoKO743kNfZM7OZdrC@vger.kernel.org
X-Gm-Message-State: AOJu0YzpGpcbyxWIsXiK7NOcqxvFJetzkWtTV8m4d0pcCu8khTByLCMc
	4qTdDYRskLIqb+0JfgbUg1VF3BYfI5hPzqwScJIccbYxe1ZoMBTIMhZG4oH6Eqo=
X-Gm-Gg: ASbGncsoq/kfmgxeRqnaoNEp5B7uYxmSS+g58VmrWqFl/emDwiZ4ZFVBnCUs68DyOpk
	WAGPAwZ+JI9mZyfQ+y0j8x4K5/mC6T/qhG0HfsOlMjf8REpjWpzvcUFkoQvAyULrPd3vFf1/sAU
	TY7J5K/Q9fKQehZWX9EECuCmaIg9pRzf2LqrKGXn1kJZ/qOYJIuGqSsby+p2Twj4kTn01JRllEM
	2DdSTvXRgwaO4Kdc8f5PSwqHjKbI1T1vs2Z7fNOimRhE6navUf1+Fks8dyNDn6nYrVN+rUKzb8j
	xcKnVQrO+ytRlexXKVfk2LX6k1S2ITySG+rM11hcEm7xkMUmZsYvDYecZTcfhZjRrZs812I=
X-Google-Smtp-Source: AGHT+IEQoBP7xS27h3W8daUCOs5a+K/MVyTg+zctUJ3ISgMlaM5H7WG6g1V94qDglsRK691P9WX9Tw==
X-Received: by 2002:a2e:8ed5:0:b0:308:ec6f:7022 with SMTP id 38308e7fff4ca-30927a630aemr30983201fa.17.1739821875240;
        Mon, 17 Feb 2025 11:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309cec7e45asm8598171fa.105.2025.02.17.11.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:51:14 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/15] drm/msm/dpu: polish log for resource allocation
Message-ID: <elx2yudvkpnrxu4q7uqm7wrhfryhd7mcmnuh3ktmtkor6sjmke@4ptbzra2k3a7>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:15:53PM +0800, Jun Nie wrote:
> It is more likely that resource allocation may fail in complex usage
> case, such as quad-pipe case, than existing usage cases.
> A resource type ID is printed on failure in the current implementation,
> but the raw ID number is not explicit enough to help easily understand
> which resource caused the failure, so add a table to match the type ID
> to an human readable resource name and use it in the error print.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

