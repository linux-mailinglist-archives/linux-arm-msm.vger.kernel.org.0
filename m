Return-Path: <linux-arm-msm+bounces-47349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2530AA2E30A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 05:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058E93A57E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9DF12FF69;
	Mon, 10 Feb 2025 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiolQDvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FE54918
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160959; cv=none; b=A5JB3g9rrWKjJigj/xTk9xyF9qlT1c2z1KbWXvMcbrtATKFE9WEuk4g5k4fnihKGSwcK/CFQNMfyA8FHgDLdwX5d+OZNfiTA2iXWlefK1D0UvHPVsMKO8QeKF4pq4ravCRRzIMEBHkt6zrnXULwkuEfa8BsY0q6l9xn200A9s60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160959; c=relaxed/simple;
	bh=3M3JyY4rOW2vOrZgnCjRD0TpnM5NeMnBRPZBQbfP9n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGyPhcb0+ruanQZzjzZpWnUv8dsQ7oi6leFAuBm9ECYyfs+zieG4/Marlq3rRl7j2UviL+8gHK6rUT6oHiim6sCyuwgMlgq+YdohpMrlwIanDbZcKLjjdvMjsnctRBF/vpm9Ljgv8lPqLHPqHYmwWHxyUE9BmOuz4raqBnDXvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiolQDvO; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30762598511so39190181fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 20:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739160954; x=1739765754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
        b=CiolQDvONIg+PolEVXKtBwAlZ4I5Cd9irO1OWkOynd3YVO0lJyxI8G7deLCODdab1O
         iwKbMtl2oA5VmMrFojHXK2pt06YJA5YMOGeQTLwQ5XH2wBhlzH8QXMgBZeOE+ypa0qtc
         KlirMFbEaHtcZNar2af/4VaIjrZN/SWUATVMNBoGFEBCaRab482xdawa0B+GkkQo5yKH
         tmuDrqIqN0ki1LFh+yA1ykSbC/IcB57Unb54rcnTqPOEWeLUa1MIQsZ6+UyQNaqp9Rop
         CksYJpEWmhj2Sk/SdAD89z/+Fiu5ZtzI997dPk6KddlzOyNqFaaTDcck5GA3ptr6Uf0x
         K/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160954; x=1739765754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
        b=T02wrPgBFREpsiDbG+pFKV9EkUKxocASYsm4rRyz8sN0B6YnEJ9LVSDPVdzK3oUDhz
         de+njZ7in3yshTdBkOzNVW2PZQi8XVMSvfAw2S4urOCloLjocbXWsl1PCb65mjERaijC
         PCTM3VXo5rbhMoE8yIIN6luDlll/SkmWtx2t/PALXdmeQf9Moi51b/85GsJbfaBLVMy3
         sNM43fgwRDeihh6xzfKCILwPhRCFuB8YbC7uFtLtEgs9GzXhTZT6SjAzsMAmJfq5bO/7
         yEaXsMJRi69QTyD6SAEFNy7UyPF7ewaXNsFRvcbR1Lr5pPJpjimvG+yAxsUxD13tJRq0
         rBhw==
X-Forwarded-Encrypted: i=1; AJvYcCUL2DbIfBGRRI10GanB6su1HjhIZl03l6HOVmI1aGrA6zhZUoyCXZi2IugjYjEaKu/utVWICcM4QBGR2hrt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7RP1nYPzEEoX1PlzYWftZPfWmYufDl6FWlewQ6qd70g5rFXX
	xoeeMp4ePmgFuoOVpoNQf2HjozA1UVVcvK+roXSG7jvAp8E8MXhlBAYUMJ2sDL8=
X-Gm-Gg: ASbGncvGgdcN+fS3P8seydGesn7/M9S2scZ0wCwGZOktv5rxWwc2J8k3oF/1wpu9Pj3
	xBt9mpODvtAQLrY4GUkbJLzKC3hQbw7kGPDD4Er6r13in0clLN7BQrehy5AOD8uRpDmaIB91buy
	+8XLeLupxl7KeZJTPztQQHOFfKB81cjWTl9Lik7/iTPU9e1yuRRuBPsi9GGiM1op5dMUwgBHaPe
	jpKO2CXgbQdLozIaG7NO6qPohKsb+pScaSQ7v69/YVlHz0ku1890P4k6m9ZqtrOT46biL85DPLc
	NPs9rey5q2Vgs9RdRhlqRWYfNqFmQN/fqna2jHkobm+OWuFSFt5d5fKpTgKtbRuI1HNRlpo=
X-Google-Smtp-Source: AGHT+IF5U6ArPZ8cE6ddrQjBGFIlwz3f3qJFMYvqashpqs6GvurvVMofzsRTGb31NHrx7zoqyP9jzQ==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id 38308e7fff4ca-308e54d63b4mr13706111fa.24.1739160954311;
        Sun, 09 Feb 2025 20:15:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de190915sm11354891fa.40.2025.02.09.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:15:53 -0800 (PST)
Date: Mon, 10 Feb 2025 06:15:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <koye2ppygjsns56xxpdirz5s64kblqjhw264rmfqzlxsx5mzwo@u5t7m2vktfag>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>

On Sun, Feb 09, 2025 at 10:51:54PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Changes in v2:
> - Return explicit 0 when no error occurs
> - Add hardening mailing lists
> - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

