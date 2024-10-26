Return-Path: <linux-arm-msm+bounces-36045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBC9B1A7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 21:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61B6AB2170A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 19:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47AD1D86E8;
	Sat, 26 Oct 2024 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lc7shbHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A01D86C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729969238; cv=none; b=epmPGq1hfgfgDrN3lCcX3OzMBIV8prRRSQ4ZgY0wjunM0XniToT4RiddQbp6CE5QW/epNhrGV+d5riuXp/KJQoToEd8TRwZlfMSvGOqCJh0mPri+C1Fa2Gy+kBQl4oD+b/KrvE4Wiwl3R5kB16Kz19rjhbu53SueVjyeY5zxHHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729969238; c=relaxed/simple;
	bh=6dUlzTwUGPwpXZJnptyyaU8W89mDX5xxYq4Yx7VwhXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ec2GCk6gmvOKACSsZZRuFgjYkXKQb1PZtoQoe2bV8sn+TVCMsg3Ql+H3yt49riMIEGQleJzyxvqOHAlPgBe67DjxsnR1J8NpVnHc6nKAgY5Mj1xPhJNa4t26OPTFa5TNGiTbOsNTSBcTEHmMSwKypC6B+qFS5iiZfi1DiLGRWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lc7shbHh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso2819975e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729969235; x=1730574035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOIxZ0ZR3GBH3uWPIb84gnfS91+/sVnFrw/NYTYrxQ4=;
        b=lc7shbHhQblo5n2ttwlDOE4MlkA/AzTEnXDTjsQqEVJMkbPumFFZMny7jUO82/1vyw
         4bFHD+GrqbN4slGWfKNj6ZHjipfPYc3WbQKVBsOBgGM9jWmkUZUhSvWPofft2x+fLwbs
         QZidd2ynqjQakM0pWsz+wQSJlp+GglayxO1J63yU+6JIzHOFtg3Lt9JnSRx73WTX0gmg
         +PUQxDKdu8GILADYOk/bXjXRfUouSujAp6wf9Wu5LZvGpivcNYWLLscYEOoinrknDY2S
         3IyczVpTpNbOLax1LbAQeb87mFeGg9rhge4mu7i3C+ElHiQyWBOcZ3vlnItfrBllf3Hg
         izGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729969235; x=1730574035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOIxZ0ZR3GBH3uWPIb84gnfS91+/sVnFrw/NYTYrxQ4=;
        b=TcR1N+YVhQlALaF6/4LODpSKOSVHAWDuRXNTu1Fn0JeMibOGaYzuglkVLI7e4DsGyk
         SAxiqms6UP+jDN5R4tho+DaUvtmGUc5kqX4bro7WPPcJbp6ShGphTFwdogw2itrVFdtP
         URFfc9KHTkgauv0ZGlskbutt4DOyfFjUX48wLImz5BCGp+yUf43AOQZUfU4HOhICrpLe
         pngMtJaqlLkNWdaTBbactoENE/3JIiEqNTY0QZxNMUv3HRyVJ7s2v/SKGlHJ7mryhnvD
         jjuaeGJ8uZPCksRQ5RxZ8d9RFATX2CylYwx+EjlBA48DEr3uwpofGAANk2dr9D6wurQx
         Ie+g==
X-Forwarded-Encrypted: i=1; AJvYcCUAVS9W7fS6VlqOXoqZ95di0pqgrJ3C2Aus45/G/Xrz9UQx0hPT0zZY0aCHdXLBGlcisRPKxIoEyHt6NCVz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DkOrBenFraW/JjREcIAhvXML6a9HnNAuQidJHEngE05x8Nay
	NSaQ/aPnDCTeDzTKwZKKOxLKcZNZXSQNA2qL6UNlByiS6OpK1SxqSj/ajzg8TmQ=
X-Google-Smtp-Source: AGHT+IG3BVqn6G9Q5H/9KlAzSLHu5IO2bydiW8FJchvfjiFJnTea1/XN1pTtre1vB7Qcl/SECPzELg==
X-Received: by 2002:a05:6512:3d28:b0:539:e3a5:4fc7 with SMTP id 2adb3069b0e04-53b34b3ba70mr1350286e87.59.1729969234898;
        Sat, 26 Oct 2024 12:00:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1e9a0fsm583749e87.271.2024.10.26.12.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 12:00:33 -0700 (PDT)
Date: Sat, 26 Oct 2024 22:00:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from
 IPQ5332 PLL config
Message-ID: <rc5rry2vywp4kruv52wfvatnncyodsvroop4qgexyehpxm467f@4l5t4o2e5nwj>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-2-55df8ed73645@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-alpha-mode-cleanup-v1-2-55df8ed73645@gmail.com>

On Mon, Oct 21, 2024 at 10:21:58PM +0200, Gabor Juhos wrote:
> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
> those will be initialized with zero values implicitly. By using zero
> alpha values, the output rate of the PLL will be the same whether
> alpha mode is enabled or not.
> 
> Remove the superfluous initialization of the 'alpha_en_mask' member
> to make it clear that enabling alpha mode is not required to get the
> desired output rate.
> 
> While at it, also add a comment to indicate the frequency the PLL
> runs at with the current configuration.
> 
> No functional changes, the initial rate of the PLL is the same both
> before and after the patch.
> 
> Tested on Xiaomi Router BE3600 2.5G (IPQ5312, out-of-tree board).
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

