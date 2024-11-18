Return-Path: <linux-arm-msm+bounces-38230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3D9D1197
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E7571F20FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B97A199953;
	Mon, 18 Nov 2024 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsbhSK0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91ABA4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935765; cv=none; b=AjGoJ+FVeEOhdbBvuBUnd+x9xfnvoHW8CuO6DUT/qK1QvP7e+NAYidDHRgFfXoZ/tASSsrDsQXxBOW/KwrFtAutGZq8Xi8BTnN3Gjf1kWQzRvh6T0us1FrPT5k6Ew38VNBoQm2Dgk1p3PC7ccIBuVMLsOzXrBFjaoUOLSJ9Ek/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935765; c=relaxed/simple;
	bh=isQfHjNvPZ+RBZD4jB18sz7oOCaJdhHyXcKs6SzwfXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWiQG14YhUfSDHORGCxGsAiiHyu2usqpytJyuQeNHw02kKSdPl/dqqecDPO5zY+pEzvZgo93EKtAKr4XqRumY+dY5PKpZWLqQzHZKlBZ3VI8m5BJoYMnls2k11uCq26SQ5DyRUvXbt3hSO5ODeuRrIECj8j/mFuPT5EiTQrUZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsbhSK0A; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so4920807e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935761; x=1732540561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5kn730F60GJ62g7uE1IWf9DYK/RMYmF9XpOCF21XHVw=;
        b=CsbhSK0A21Tt4hyctOM3kzhCPgq5GYEVI/h/lF0bDAbvTC04Dvy1aJXg5Xp+ktT5Et
         Q9bpS7YRZ/hDruQ8iH9fhm/H9zBonCOJUG7+Dr810s+aXy80pJjMoiOecCwl/j7AiVL8
         vqBQPG3q4lKeiVHJl9+2o2eTG8xdQLUDWLIFE4hI9uMvAa/CMBJ6v5WV0pLrO2+CYFdK
         IgfnBCpYIajOQXhEYiVviXlUXikh7SK2Cao0sMe08hebcZEv/x+sSdvIFDCSyPTw5Maa
         bxLmsZ/V0a9dSH4r3E11ptkcsIJaMP+PFpBGizclXtjCL551ht5Fr3X9ZfefXZQV4Uj9
         pL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935761; x=1732540561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kn730F60GJ62g7uE1IWf9DYK/RMYmF9XpOCF21XHVw=;
        b=EHP5Y8Y/D0Kp7tgNzlNg73gwe0gPU7qsD0DTEMsQgOslPONu+c7rJ3A9or/m3of7qm
         w+8ybQcrnBRsDUKv5DWS8igX6e/7nZntDIBMp2T16V9FfjWtM0ur3QBen2xqYYTZsynb
         IdZRwCVWjl6WQY0As1h+rMfqh3qS8UountZjT+WBppURPM+iXom9X8XjQn2kMgyUhDMQ
         b+XTQjJErJXGEW+pZPFVwM8A3EOhAr4wFcZ6RrZ4d3BPlccJaKrMtyxtaw256phNrYGV
         40j6FXQ5SJOukGRVETVr7PHXbazFwznYIAG0u4goRVsO0E4OzEe7shV2M5WyYry7ubwC
         lvxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPm2mtpSa0phhc69QVY9fQzoKx4DrGh4Jh7jOz3eim9v9/a63ULV2xR4gFGYaNEUddY9GGNd5Bh5XxSw1n@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1wx5HNawbqHs4T62xRb/7D5CuI6jiJKfDI+Tpssljk8oXbzl
	7sJRwsxKGfkc/4RCi2S9ltNxFdNa3A/qb3JIPE2Gp878CZkX7jmK+FxScoW8eTU=
X-Google-Smtp-Source: AGHT+IFcO+4bXNWyrTDG1UHUoD/2vsE8HQkLwCjNKCdp11omfGZNuIumNW5L3zMzoTlTQbdUuyGd5g==
X-Received: by 2002:a05:6512:2823:b0:539:fb49:c47a with SMTP id 2adb3069b0e04-53dab290683mr4631909e87.4.1731935761293;
        Mon, 18 Nov 2024 05:16:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548ba4sm1605270e87.264.2024.11.18.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:16:00 -0800 (PST)
Date: Mon, 18 Nov 2024 15:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Message-ID: <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:31AM +0000, Bryan O'Donoghue wrote:
> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
> multiple power-domains which power it. Usually with a single power-domain
> the core platform code will automatically switch on the singleton
> power-domain for you. If you have multiple power-domains for a device, in
> this case the clock controller, you need to switch those power-domains
> on/off yourself.

I think the series misses the platform-specific part. It is hard to
understand what kind of power relationship do you need to express. Is it
actually the whole CC being powered by several domains? Or are some of
those domains used to power up PLLs? Or as parents to some of GDSCs?

> 
> The clock controllers can also contain Global Distributed
> Switch Controllers - GDSCs which themselves can be referenced from dtsi
> nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.
> 
> As an example:
> 
> cci0: cci@ac4a000 {
> 	power-domains = <&camcc TITAN_TOP_GDSC>;
> };
> 
> This series adds the support to attach a power-domain list to the
> clock-controllers and the GDSCs those controllers provide so that in the
> case of the above example gdsc_toggle_logic() will trigger the power-domain
> list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
> respectively.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (2):
>       clk: qcom: common: Add support for power-domain attachment
>       clk: qcom: gdsc: Add pm_runtime hooks
> 
>  drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.c   | 26 ++++++++++++++++++--------
>  drivers/clk/qcom/gdsc.h   |  2 ++
>  3 files changed, 44 insertions(+), 8 deletions(-)
> ---
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
> 
> Best regards,
> -- 
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

-- 
With best wishes
Dmitry

