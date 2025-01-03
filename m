Return-Path: <linux-arm-msm+bounces-43909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FAA00D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D686F3A44CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDAE1FBE8C;
	Fri,  3 Jan 2025 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaYbyBUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC91F8F14
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927943; cv=none; b=CR0B7FP/tqXcjI4HxCuT9paUVwRsvUAzig/wGuoqPZEYVJUJ0Yfg8lGOVJvmFoo4xomT3EWFXjLEqrFw7Jd06idqA5fsOJExslbREjBLF0RklXUD06d9W4pB0dm2LC6I3U4+munF4/LWpKD1tsz13Wi7eIjRK6G+n1UTby41Yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927943; c=relaxed/simple;
	bh=nsBY1ZPzzju1ok1+lmHnyMAxcF9L1im2eXIYoCL6RkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZqwJEO7Gcj0xDZOpInQR4dZYfMrnKjUX9Gs7oVOJNucOPxtObbHyZksGR4bFtn9mvC6R9idF0RZYvFdOT0rqf1zL/ekeHb++6kMvQnpikKcXRWBBqfXQSp+YpJhLF/ywBY1+uiyBTUO7NWxv8ny2lJl55jt2gcGudhsDZ19Q2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaYbyBUj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3047818ac17so108008581fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 10:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735927937; x=1736532737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
        b=zaYbyBUjVXV4REEQX7D3TBxaWkcu8F25yRZwKKtTGGW1yW6r/dhQoBTUc7ZeiXb8ua
         Gptes5Myt5YSCFySVRjfXWQfQfFzXBfIWtY268EDGX5EAZgSAMlOWPBIWqguVBvpjI5b
         1wRd1C6grNsGNAq9wTCy3XIN4HcOWfcvM6c3eMAa76SPx2a/PYeCUNEy+JGr9UMN/XOt
         /+Kp1h66w3x6G/ByMXrAeEk7qVgjc4xVa3BJzw41EX5WmGiNt4u5tdYk/vhgQcsMXfK0
         tZBgi+pVwoXFLeEYErrq8gapPtSlb/UCHESrk9A/jqHrw9S7rm6JQ2UKbzb6AC2wcLUP
         YnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735927937; x=1736532737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
        b=EFfnf89GlkiCwcPb5ZtbkWJohWMpz0CG4hE+GcFZCsdllJOBgyoyniM8XhgGmdvimg
         iwNgAx2NExQwC8tJCpJFQhbgZdhlR0G6e5OPimhN9EzEhYvp6BdCjXpTDjpwJdf1YUz5
         nxBtBAJiY9BcvhaOlkZj1Z1ykpGEqEyPEcF7leRnDNX8UKzyfhuz86GwLKDDgS6qDs/L
         DGZqclRScXzLEcNkodOpEozukq2m7HBo9mBmQxLsx5BS0z0avzMXmF337kHPRAokFDdm
         nwkydl8GECVnJ9qS62zEbygG1VBJKAXjbgWnWWsbDFQBhe4wbtJLACY6GNU3wNzniyDg
         gLxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ78FXdsmMEW00YgBJnfoJNA70cHTYFsS+XasSCSF8t2pp4AGsrDS1K/DGlflU2IAFTT2HPy+8yJCpKyEn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2E2J6rRkKdCEl5VJ1WuA0aZW0QA3u5MlUMR1KwhDWmOV/jLPg
	HOnSBoWcHHIurEInKI/EZzcKi8eWJmussOlyOlLzvc4xj+uX5WinkqXI7BAAp7Q=
X-Gm-Gg: ASbGncsgSFFi+OtVCSLuWbfFmnV7cJsWehELHbEQFFOaNvKL0ZRFDaepjCgR8bJGIGW
	Qer6L8yH7sHrsybVxvo5w2IjLRtYXdi4rK33JJAtPOlOJDoKzjjplm07SLNeMFDmPzRf/0Mm7UW
	IljKYKATkLkThk8Of6PmoZqDEpM9AHc4zq9OPWSb8gj9uY+6bdT7JUMKZ8xtSdyqjNFRkEq4f22
	T2KpZ3Lg3Z8nvMOn2qcMuox0qziTI2kZUBi48JVVhf+PrThFGyd5Q25YdneJRWDYZeMn5BEpKbv
	wIpHCE5igJN7fNWKqe5i9ewGkXs9u4goLsx0
X-Google-Smtp-Source: AGHT+IHkyk31lkzWD+THb2q0kv0bZe0UEvMvlsqPvrWF0mIfBuAWDJmkYgVUK9JyXm1uBZasD7+P3A==
X-Received: by 2002:a05:651c:502:b0:300:3a15:8f2d with SMTP id 38308e7fff4ca-304685dff04mr196263781fa.34.1735927937405;
        Fri, 03 Jan 2025 10:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083ebbsm47714751fa.115.2025.01.03.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:12:16 -0800 (PST)
Date: Fri, 3 Jan 2025 20:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <qsmcpai2uqfhmy6y5wks55p4fyqigndfzqfnapvdjf35gu4wg3@5aowfh3xaydn>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>

On Fri, Jan 03, 2025 at 02:58:18PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.
> 
> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

