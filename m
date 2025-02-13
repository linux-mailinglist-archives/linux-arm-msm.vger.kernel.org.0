Return-Path: <linux-arm-msm+bounces-47839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9AA333C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 01:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3C9166E02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F016800;
	Thu, 13 Feb 2025 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lksfB6+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34F33F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739405071; cv=none; b=KfzJLRxTpMiEZBfOsDdxuC12TEg6hQCmWGVztRw+oMSQ0negnDsHpb5lKuH32a/tRklxDXDqJwrIY61J1z2vVsEOBXDvbmDrsBY0S8OQm1xMps4ZIgHLdw12GHE6g/5iEupX7Nlx4Kh1kM2l00fp/tB/ZhKqCuDKckFnv61P+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739405071; c=relaxed/simple;
	bh=yXEn6M4zmOSH0mBgsox+8yvEgc9Smd7J4BruiCZC2Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRPN51vaBFCTZMg8AhxuIs5dU9kHcOlZtxKRegY7L5awIdSja4q66V6NIC5bEma4/c849jVI7ul0LOlYkwirfQ5uexu22PkYpDUT3y4qa8u/H1Vtv3ecf3HvWLtO/+z+CWqJfR5uAkmtXdD95+IBc7L6X+tqE+kNML0sL6bypFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lksfB6+M; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308f4436cb1so14587611fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 16:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739405067; x=1740009867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/dX/qzqd6dVtCQvTD6EDKh/RRBcZW8oAwKMkEiG/94=;
        b=lksfB6+MvL2Nl+mseP21+ZYi4C8Av454X7nucJRlRnBTFMJtQq97A6nCjl9nco+bMg
         8HkoLa4hveCk+w2zxe/BKDSHaacda/SS/SJpZ7wkBVovCYR2XlxW71BAD/A5wWp7+t/5
         hr5dfePE3Eo06AcV/wFFfti9PrHJr19+k5LKan76jqVtfWfwYSKl0p4qvr1jkJuXPBO0
         r9lAOH5QhByMLq64qUEEz3XMIIm1Bp4Gj6LJjCchDbQB9VRa/g0xZ3Na91HmUmfqB+x9
         4NIcBUfLrS0ggbsuHI33owl9jS8eoPlSBLT3mI1P7iNUl4k512K0DoqzU2A15P1Elvbm
         QJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739405067; x=1740009867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/dX/qzqd6dVtCQvTD6EDKh/RRBcZW8oAwKMkEiG/94=;
        b=pLadslyZ5nWEYDk1E/u98WRFc4FOctTnaUWHsN3G/geNTgOzxMPt4R+CPRmf8VuqXT
         LeD6VndigfF7RiRGiUw4rxdoKvaBs8kO9gRjl1XEPJAe79M0hESuFAgycdT3bviUuAq4
         8QjxMaEqtB0MrbiaeHf+EEwdK18SvcGVDhwjuLFWpU1aS40wA8jnvbO0wUnF4oS+h5YR
         3mnUtG8/msX+4xIt9u5oerhXxNrjMWymNWB69n+nEOPgaPQIASDj57TxK6oVeorrAF6j
         D/5pdHl/90DcJyE35lKBJNAoHmH6VKePIjZ88ecgWij6TG7QdDQd8m++084iSpq/6ndd
         Kqvw==
X-Forwarded-Encrypted: i=1; AJvYcCVKM/iIDVgn3tqukrEDLEdiMl1pOUhyMK5hbo5Lbk7CqCf2Y5Fdzl9Y4JgdfqJi6VjnYdr+UN0rzkau9WCd@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHe3WdMjErAn8upCcgyF7mSzLWNlkz/fZR3wZgmedJAGzU5Wv
	yb3V0nUgyRWvKWYSNvEaRMUjZGiBAQA5nRP/a4zJfJGgHUsiVBHKOeJ0Iwg1atU=
X-Gm-Gg: ASbGnctCy1Q6WGH4mrT0p54jDVqXUO87PyBApA1xB6NyRm1oRpnaFtDQTXZRoiOTmci
	95sBI7HPRy1v5Pg9Noef8vtePaZ4jSFCz/Q2NLSYl4t/e/zAnRzyIs1Hczw67gd2UkHUWNoOpq2
	+M4mD10XCBnmgPnu+515Eszgs6MKnz3UgI36A/oknchECJBc8O11VIY2/wIBMGB+JDe5FhIK+HY
	iZiDNz9zq17vRD0/U2DcegPNQkLs6WCEhMeoi5QE6MVyiSiTQ8HtlrPdpd7InzestTbbC+UjIqS
	sjc4FTY5aEAI33PuOgjPio6RIKVK/tl+d07NSrura/BPJBuQIo5aeVymr9KKdSSl+akvPw4=
X-Google-Smtp-Source: AGHT+IH+fxi9VKUfSEWdeJIAsmbcn/rRwU9rp6DokXIOHewLvT5877lvjYqtDg8LhsfdCVvtFd5JDw==
X-Received: by 2002:a05:6512:220a:b0:545:1d04:5dff with SMTP id 2adb3069b0e04-5451e01f3a6mr241356e87.24.1739405066968;
        Wed, 12 Feb 2025 16:04:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f11ec34sm12035e87.235.2025.02.12.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:04:25 -0800 (PST)
Date: Thu, 13 Feb 2025 02:04:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <5yli2sqw5hxoinlaguxjq2lleez7p4qjkwvexrgn7uphnu44ws@trlvdrpep5uv>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting

Unfortunately I don't know enough details to comment on this change.
Maybe Abhinav can check it. I can only notice that msm-4.14 disables
programmable_fetch_config for non-DSI calls. Would disabling that call
for DP interface fix your issue?

> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb..a21addc4794f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -94,17 +94,21 @@ static void drm_mode_to_intf_timing_params(
>  		timing->vsync_polarity = 0;
>  	}
>  
> -	/* for DP/EDP, Shift timings to align it to bottom right */
> -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> +
> +	/*
> +	 *  For DP/EDP, Shift timings to align it to bottom right.
> +	 *  wide_bus_en is set for everything excluding SDM845 &
> +	 *  porch changes cause DisplayPort failure and HDMI tearing.
> +	 */
> +	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
>  		timing->h_back_porch += timing->h_front_porch;
>  		timing->h_front_porch = 0;
>  		timing->v_back_porch += timing->v_front_porch;
>  		timing->v_front_porch = 0;
>  	}
>  
> -	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> -	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> -
>  	/*
>  	 * for DP, divide the horizonal parameters by 2 when
>  	 * widebus is enabled
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

