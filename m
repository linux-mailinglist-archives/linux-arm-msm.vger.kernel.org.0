Return-Path: <linux-arm-msm+bounces-7917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84372838ADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 10:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E561F26652
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B055F842;
	Tue, 23 Jan 2024 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SgqeWKKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664205D75E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003140; cv=none; b=R8zZyhkC6MmuSDkyDNweXyKNJRlquwUFrOuRQ1RrQ2mnxvUf+9C7J3xbg5VH3s/GVrhYfdrD/+1NegTfOVvvKyLKg1FLhPvWvke5l0EXp1C2Yh7TPrpDpgxCx8RuCC0M8LnYV+/2ql8oM8JfraPPOnpKRJZs+owSsWJI1YZyhi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003140; c=relaxed/simple;
	bh=aLi4ni515fDPLmheTfXWKONnXtTpxfLwvtIiaSEI/pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYm8VoOqtEgGwAOsaj1V3lSeLv/lYnyfMXuBI+uIhr6Hi7wvqhM+N185pJtIST2C3qKhzxf6i2sVAW8tS4FSQQLop/TwhQ7TsE47fvYZqiPZHMZsfoYmsAcuIS2TQAQPUIsqHhfKmK7UaQBGElh7/CoJsmUxr+tXNuzbsHCNOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SgqeWKKk; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42a0ba5098bso22904121cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003136; x=1706607936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GPuIu+Od8YPZ7JAGfosVr9r0tWmFr9cTu0oqbB+e0Zo=;
        b=SgqeWKKkVfxFi6U7w1Pb3K8TdafaRdah6HPMhYpQCSjsPbxITaoq/4gOfakq4uHny1
         iyaLBJIoOITozXmV3Nf8bZ+uVxL2n2qzAPyhagNapf5fXxmWWg74khT9OZ3jKdzVKj5M
         Vw20FKcGeQi3Soibai1EkTr//02S+07D7D0xp9zq/809AI/yyg+Z3Ty/AP/sV+a2Ibam
         RoiqsJMcCApxz6LVBRkyeMGYfLJ8or+rRMa9fDWXCvv6v40HOHQ2aWpRL0ICazeaV6i1
         vUsLTYN3FdfpbhpJxyhF5Mkpe04uKOcGnLVKUz0fvZJY+MWoKXAEeHrpt7NWTU4hPflv
         jrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003136; x=1706607936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPuIu+Od8YPZ7JAGfosVr9r0tWmFr9cTu0oqbB+e0Zo=;
        b=SsqjAPxcY6Cwd5x1W/Le6hYoWe4FcFh94msgWzSUYheSgAqIvLNSizPGDBLp5aOHAX
         PWKi0t6Euh5B1oAlI03PFvVu9XFjM9EqwrLcBIUcjLBfQ5BcOQybeIO8j86w0Nvsdyd3
         UvasvdQepGJPbfhSqiptb1KFzw8nVmMbEfSqUPf9yQ4VZqiPjXv4p5OtUzIV4fVAQK7T
         gZxP6bGJh0FVn+rH72uEZ1VxmHVzT8t7V05xFvnMhCjUtxtKFOLA/gt0V3Im7osSNT9b
         I+a7EcCnqGzDsEdvR456kGeMcL7wfe7YPV9yxkZrThG2Rq1saKkYAzUbwCtUT2WXWpzp
         6asQ==
X-Gm-Message-State: AOJu0YwCcZUqJ5nP7X/Pwy55pAsT1iArQkQky4nZEJTit+jY1ImV497M
	CLhEEg6slFn8CB+hmrSrPCNpVMsOGOqM4kOf3Itdqg6KoPyf31X5YZZGnMJXWcOyQuPTWZwVzfs
	=
X-Google-Smtp-Source: AGHT+IGwmRddd4hbzIPzChpuRO0Dfx5I4nzCNEfptJ98zrnanML4MnrVA1G0oVNdUJTPC+nD4BLe2g==
X-Received: by 2002:ac8:4e93:0:b0:42a:3a03:7ea0 with SMTP id 19-20020ac84e93000000b0042a3a037ea0mr450084qtp.111.1706003136386;
        Tue, 23 Jan 2024 01:45:36 -0800 (PST)
Received: from thinkpad ([120.56.197.174])
        by smtp.gmail.com with ESMTPSA id fg6-20020a05622a580600b00429be14d3bbsm3323313qtb.13.2024.01.23.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:45:36 -0800 (PST)
Date: Tue, 23 Jan 2024 15:15:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
Message-ID: <20240123094528.GA19029@thinkpad>
References: <20240123062814.2555649-1-amit.pundir@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123062814.2555649-1-amit.pundir@linaro.org>

On Tue, Jan 23, 2024 at 11:58:14AM +0530, Amit Pundir wrote:
> With the addition of RPMh power domain to the GCC node in
> device tree, we noticed a significant delay in getting the
> UFS driver probed on AOSP which futher led to mount failures
> because Android do not support rootwait. So adding a soft
> dependency on RPMh power domain which informs modprobe to
> load rpmhpd module before gcc-sdm845.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 4b6ea15c0a11 ("arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC")
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/qcom/gcc-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 725cd52d2398..ea4c3bf4fb9b 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -4037,3 +4037,4 @@ module_exit(gcc_sdm845_exit);
>  MODULE_DESCRIPTION("QTI GCC SDM845 Driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:gcc-sdm845");
> +MODULE_SOFTDEP("pre: rpmhpd");
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

