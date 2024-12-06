Return-Path: <linux-arm-msm+bounces-40720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581749E692B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 771101637EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3538D1DF274;
	Fri,  6 Dec 2024 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbpsUQqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC81DDA3A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474483; cv=none; b=JfA7XTbWsMY0JJbD0RopWQw5NsgwhwSAnaN+zMpK+bAgCZh+QHrISPrYh9tI+i9m5mKY0HtGAR4Zju3DVISke4SjBHC3TYyweug+S3z3YFilzB58YUOoQnYXOIL9aXiX+OagqMMkck55DA3E/Bp0z9TDkVD/L+CpXp7lKvYrKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474483; c=relaxed/simple;
	bh=bcX/8gOs6XW0Ygt0hDstjuJt5JxZsVwkevrtwRWGGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9BkVEUsa2Gr0xmmFuWM/j7F/Zu/SpIPJO8eksTLfJl58rnXSpxAw3fmR+u/oE0iOieBhdx20yxr/Pl9DSvUOhi0IBRrUF4DAX/MZ4d7j9OeDR+cpx9EapqneSYKnLj01MkiWtZpvRNQDIe7tsHAchNC9mkjLgqPR4RNZUwkYhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbpsUQqM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dde5262fdso2321875e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 00:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733474478; x=1734079278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li5k7w3RncPwKsG06G6cusXPPrs5ee6rU92nmMBGwZA=;
        b=kbpsUQqMbo1umoI1M85Ld5epUYGoFWjMKKtpu070h+kxpeauKfrChvnUV38EwpiJ1O
         AtLZHeMfInS25/Vd8woICYkV1T8eU3ssnP/lG+f3vLm911JqwxjimIpwoyDKkQUz/n7y
         mCIVKsSUNS1ObsSAcVkVYEXdROuoo5n8GcSNbZl/7tkhrHiP0yNgwYqVbeSrwD+zGOoi
         dKZERMB3+gHRqlIfifRXOUTHDtY6CuReDCuGfms8B2lgo+iKjs4YC4bctPBI2JpEUnmV
         fs0L8rhCqD61sQCKsizoegNERQSIoVR7bernEmcB8aFhtoBU6I4yBGY/Wzjp6Wi45y/D
         ZIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733474478; x=1734079278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li5k7w3RncPwKsG06G6cusXPPrs5ee6rU92nmMBGwZA=;
        b=sBEvKkMxYwaWKUWuQHqttYwfpj5M3P6VWetrMrtiaf+908J2uITdVxyI2gFfkLV6CV
         7ZztRXH4lOHXB0iyiBDL8ty9aOxSD5LQGy8QsxuWQOQM54tNpBp1mRJmhkjg/pV4XSsW
         d3a2SubgZ5VXBvrwueC7T7GFlXAJV+1wiJS5sIRT7xNPqfuCbbdl5ZxS0QBIe1ntToZd
         nB7AV7WGM7OsskReeIgD5dlwdRx5o16H7ZgV4slsEWu6rcxAZIpnTTHumJfI+xbkX9Vf
         CagEA+uEoZwb3vhytbeTSbMVN/3SczhBOit4TXUgQC2FpwIVUxe7pHFEyHl+vDamXgvP
         JvWw==
X-Forwarded-Encrypted: i=1; AJvYcCV2EBm3yXvCist8RraZr1uc8VosaPbggHsgI+wSCJRDdW0ezbF+/dB8uMQSKhzNgTD35ykvfGLsGq+BXT+Z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1H8wL3y2l5pVhCKswdP7nln7lvuC5ZHM3p1nolVkEoW2lEoS
	tb4FtmdZ29CnnPd2fj2KdzqwBXM2gULM0GzkbKh6jNt3k0INIuUOalA1cwHaWyI=
X-Gm-Gg: ASbGncs9fyMgvroYUaIgqwh+nWUoAozSs6t63usmrFhtpqsa5QQ/RlwBtqjjUSjO2sC
	hwhb8Dki4XSqtmEuxdzBLc+9eedUwQbsVh4lu0rJUhg8sMM6/u338ohEsa5ThgcNSElMfc4/A0A
	RDiAXbXmuRuE9gN7q5vjM99Sm9SYXo2Pp7fpYZLtSmScrnHAUfGqL3EY+pJXXcSZlGYQBCCQX/f
	oJfBoISxN7nPJwnJgCslrtEuhS/m6Uw5eHrStLSWWMvsjk/wyrm5ISGAGJW9It0yV2LaoPRVcNh
	PF11XjoOjmqB+xKw0p5LdSE9wiAcwQ==
X-Google-Smtp-Source: AGHT+IFPNVHu/d8sk7Z9glpuRmqa30hf9B+0XHZ+yeGqInSbHjdmC0Dj+A9i/LiHl6Y+WoYcHtnQtA==
X-Received: by 2002:ac2:5e84:0:b0:53e:350a:72a5 with SMTP id 2adb3069b0e04-53e350a7482mr349029e87.36.1733474478446;
        Fri, 06 Dec 2024 00:41:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e372c9228sm26344e87.2.2024.12.06.00.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:41:17 -0800 (PST)
Date: Fri, 6 Dec 2024 10:41:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/45] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <4ttrd5nrl3flexsmlmlp2jdbht23lxsrkfuuma72nf5uknkehz@xpl3d3w4kjr3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:34PM -0800, Abhinav Kumar wrote:
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.

Neither subject nor commit message tell that this is limited to sa8775p
only. Please consider toggling all catalog files which are supposed to
handle MST.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..2509e28e3d6b582cd837c6aea167b3f4ad877383 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x37000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> @@ -393,7 +393,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_6", .id = INTF_6,
>  		.base = 0x3A000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> @@ -402,7 +402,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_7", .id = INTF_7,
>  		.base = 0x3b000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> @@ -411,7 +411,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_8", .id = INTF_8,
>  		.base = 0x3c000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

