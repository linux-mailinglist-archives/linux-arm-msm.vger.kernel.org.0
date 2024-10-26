Return-Path: <linux-arm-msm+bounces-36043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895EA9B1A76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 20:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACF5A1C20C98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC4B1D6DA9;
	Sat, 26 Oct 2024 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfeoqRUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8520326
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729969112; cv=none; b=ZvflV/QBtXU6FOBayGxKSor8lDm0YxpA7psQ9Cnsn4499RhC2ad+sEdwEKTNUt57SHul9glRgX4LdfxGL37QCtJCSI37jHk8l0vE/p2f0/Y25VqQU63Aga+igUVLXt+Y2rMgKUTlM027bLIt/I7OgYMYS4Zat7uygfxtdDBvYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729969112; c=relaxed/simple;
	bh=Bhq+qEUKi1ZKhoGjEnYcSYDRUoYO3jOBYe5n0Y2Dc0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNon08EgLunIeL/hIBO4UEGFsT8XjDrrF3tyqgmTPwVgZfrJmfiTUhS3tIVraenYpl02wp9t5v8md5xC+ffl2ekBCg2ODeFVg2vXp4hfcP9eZn+JngTdskwvwW7oqtI7AAk/15ioeEerUqD9XKk/2IA0E8NtjZld3oUqmRgpwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OfeoqRUM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so24323301fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729969109; x=1730573909; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8HDsl3CGH6OA8DPtcM8+Korp7G7oNPkdso/gaK8MpY=;
        b=OfeoqRUMtdqpCDpKKK4vjD9m1aJwDJSTSnL/nstu1mPWMquPdZUWtXbj7drvOrv1C6
         UlW5dxnF+c/G2WajoFBkGBPsdQbOcEmI744/bm18349VLNQ+WmYN+6iz25PZb1NNU2HJ
         0GNM7V4DQlnxegMXfOfin8lRkjQ8Cpt9hly1+SU/Kq8+BXRY3JIZSsB1hKwNLKN9W/gb
         O1hxAkgY6KefxsAgIY7tlC1PUU1WmJe5nwvfd+DlRqnbWn6NkNbYA5ui2a0J1j4ZrmY+
         IgMfQUwVX0iuD4+2uZT8NmLGlvK5QWJYbRwbONuthBXIqNDLPqFHBCztyNKkvtLX4EIh
         hhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729969109; x=1730573909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8HDsl3CGH6OA8DPtcM8+Korp7G7oNPkdso/gaK8MpY=;
        b=n5qu2TTG++U1BAWvHLyh5c8juJ2lF4u/ytt8A8LQtzEy1h/xTLUczv8GMAS+fkvUJI
         QsAk67cOMyNy7Od7YB0pxTFw7NriRkSQ+H7mc57ISftDVmGi4vYBpiK75tHG8vqeOjKj
         ZMbbuO5KJ3YzduV4Ta1xYj/2/4dpQW2/tkf87TmEkJatfXGzL6CBdsp/SSRGIdhqJNtB
         O7Z7/ketXQ9bNwogFHR3lOObfi35qTgZ0ehpzEaDIp3kb7nFeejifKiJE/G+RQ8RPeTd
         4vhVz6VS61fM4y7SOk5zGt0uw0bcNAsPF+UiggqzuDfXvm+tuGAUdtpZ27hcWr80UfF7
         LYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdKQhxKpnGcyRBJZ5A3hZIqleIaC5YasmbqpcHa2FcNC12Uok8zqGVizVlRNTMCrbeJKb1tvMm95Djv839@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zA9mjDjJHsJOKlxCD/XX5ztoCGi9mJFooakcQidzyOd4KnbN
	zEJ0pJJ33ug71oFaIce8whoFJJ89xrJtO45/WyZGySxJNb8Vz6euRLN4Fbqi8/w=
X-Google-Smtp-Source: AGHT+IG+uAttEvncXYNXMkcJpveD7u0Mi5IE5CX5h5bEQxKZ8tYxZeMQ5gxI8s5NPz8KyrjYtVQ6nw==
X-Received: by 2002:a05:651c:2112:b0:2fb:4ff6:eb0d with SMTP id 38308e7fff4ca-2fcbdfdf40bmr12262051fa.22.1729969108739;
        Sat, 26 Oct 2024 11:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb46016f3sm6064201fa.106.2024.10.26.11.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 11:58:27 -0700 (PDT)
Date: Sat, 26 Oct 2024 21:58:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: gcc-ipq6018: remove alpha values from NSS
 Crypto PLL's config
Message-ID: <kz6mquqituklmowemr2fbl6673frilqfxqan23l2mhnubfksr2@kuxj7dvvy5zv>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-3-55df8ed73645@gmail.com>
 <f4ip6jde5ffs6nvpllqhjleeb4s3j6hok5decxrof3inexh7ut@esgcsblz7wcj>
 <23d59aa6-ef46-46bd-94c9-a298b4870e09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23d59aa6-ef46-46bd-94c9-a298b4870e09@gmail.com>

On Fri, Oct 25, 2024 at 10:06:55PM +0200, Gabor Juhos wrote:
> 2024. 10. 25. 8:18 keltezéssel, Dmitry Baryshkov írta:
> > On Mon, Oct 21, 2024 at 10:21:59PM +0200, Gabor Juhos wrote:
> >> Since both the 'alpha' and 'alpha_hi' members of the configuration is
> >> initialized with zero values, the output rate of the PLL will be the
> >> same whether alpha mode is enabled or not.
> >>
> >> Remove the initialization of the alpha* members to make it clear that
> >> alpha mode is not required to get the desired output rate.
> >>
> >> While at it, also add a comment to indicate the frequency the PLL runs
> >> at with the current configuration.
> >>
> >> No functional changes, the PLL runs at 1.2 GHz both before and after
> >> the change.
> >>
> >> Tested on Xiaomi Mi Router AX1800 (IPQ6018, out-of-tree board).
> >>
> >> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> >> ---
> >>  drivers/clk/qcom/gcc-ipq6018.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> >> index ab0f7fc665a9790dd8edba0cf4b86c5c672a337d..d861191b0c85ccc105ac0e62d7a68210c621fc13 100644
> >> --- a/drivers/clk/qcom/gcc-ipq6018.c
> >> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> >> @@ -4194,10 +4194,9 @@ static const struct alpha_pll_config ubi32_pll_config = {
> >>  	.test_ctl_hi_val = 0x4000,
> >>  };
> >>  
> >> +/* 1200 MHz configuration */
> >>  static const struct alpha_pll_config nss_crypto_pll_config = {
> >>  	.l = 0x32,
> >> -	.alpha = 0x0,
> >> -	.alpha_hi = 0x0,
> > 
> > I'd say this serves documentation purposes: zero alpha value
> 
> For me, setting 'alpha_en_mask' means that the alpha values will be used. If it
> is not set, then it means that the alpha values are getting ignored. If those
> will be ignored eventually, specifying even zero alpha values explicitly is
> pointless in my opinion.

Ack, it matches the behaviour by several other CLK drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> If we really need that for documentation purposes, the comment before the
> configuration can be changed to indicate that alpha values are not needed.
> 
> > 
> >>  	.config_ctl_val = 0x4001055b,
> >>  	.main_output_mask = BIT(0),
> >>  	.pre_div_val = 0x0,
> >> @@ -4206,7 +4205,6 @@ static const struct alpha_pll_config nss_crypto_pll_config = {
> >>  	.post_div_mask = GENMASK(11, 8),
> >>  	.vco_mask = GENMASK(21, 20),
> >>  	.vco_val = 0x0,
> >> -	.alpha_en_mask = BIT(24),
> > 
> > This is okay
> 
> Regards,
> Gabor

-- 
With best wishes
Dmitry

