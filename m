Return-Path: <linux-arm-msm+bounces-36234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB79B3CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAD741C221B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FC11E1325;
	Mon, 28 Oct 2024 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpWisS27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D81E00A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151111; cv=none; b=QIlB6XJ6JCg4H9FbEKZwDTB8bVOLMevP5DIxXDmjT1b+b+RI/ld7INtU0KSMYsu5YScHy4AHZki/g/+gKRDFbuOFVlbgx3mPr/KSm6ZiOBhLjk3xQv8MXkwVBNvtOVFOX5WcLnCWEPpTsiP98L13UM5F5D8pVzPgPlEGtth+5/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151111; c=relaxed/simple;
	bh=rNP0697oEONMwff9ZdYnEmi/EdLyTDcy3n05qjVl4Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7LTPJb4PGqNAyKOu6MU85P++rLEzQUhCHx96l2rCEd7xMN0gip+cBlhm6TaKg4dHNxnW14zrcR//cz7wnQLHJIarIlIpsLU4VdFKg0Z92exfFN8FqZKfKnwzTNvNBmNeobxU6Sq1poi7uKd7GF3+Vw4bA3bWSM6FVnw65fD+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpWisS27; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4603415e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730151107; x=1730755907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcruSnnDqGq6bAgTm7Y7D6i6UOSc/pUqKsE3cNsrnr8=;
        b=LpWisS275r6O0pbR7jGzEiQwB2TeXVh9D52+4MKJcBT6lKTcYQHH+gptHCcWMdQK9O
         YS4ymorKsoKZYqAPfY1xyiBaU01huVRzluT8ABGymCq9QCUarY8hsXXlgtzWnTIDTWQe
         itPPn6qd/m+DrQzO9TQjZ2EwPCn4v0uKylhqdIlz41vQqtuV7v+p+kVqE/yN2hL8roFt
         Hph91f3zZgDCdO5/JSu0fLVHcPP1vsfztm/lotFRKJzu9kX7bSA3SXaW0kHfVPZeBTHm
         EaVvUKfQLSlcT0kJc5wcJTy6I2reZThFXfBCm60cLwIaQb0L8crf4CsWier2klr4k6ii
         17nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151107; x=1730755907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcruSnnDqGq6bAgTm7Y7D6i6UOSc/pUqKsE3cNsrnr8=;
        b=bAAz6hZ6a3FOZD6Cf/95FgF21Ef225djpo1UaPhroC6bKaIUh6zm7vFhdapPbt2+dj
         w6RygslfCDlfva3gUSILzG7rAzy973pd04YPZ3AN4ffAK2LcjRiTco6IQegq7J0xrDwd
         /4TTi3sysmgjp0xX6bXQgUD/GwcmVyDYpQkOwhFw5mHQCLMiC44LsgYWs4M8xNi2n645
         M+PKM8t+ivsmtzGFxp8xAB06hsxd9MHxDxOC6aYTWL0kUYBL1/ogun4erQkFu1uJH+S/
         rv436ThcjtR0JCCOSFORiinhzhoG8EUbmiyvu4cI+NBy9mlIYs0YNfF+MEgo/HdOph89
         XOzA==
X-Forwarded-Encrypted: i=1; AJvYcCU/zK0pTX3gPhWcfvW7HZ+b4SG1LZ338PNZfVMybUQAIV61vFvwNgAQnHSVoQiXJxsrhMGH3EZN8C90iCzM@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVSSQJnZb/nb2v8HeTwHUE3Aluuvn/1eJMn6V8PgdwSunJEAd
	BtRPTgXORnPYYEkkZUijYM6NIgcZKgq7YS4U43O/nf0sX9uUh9XN4jnJHSkAYaI=
X-Google-Smtp-Source: AGHT+IFh4I97P0VA1ZDbZn39ilOzI8Rz4sAHvj28rzFNZ87rzgBW0C51WC9ZejKJ44j7eqdIlt728A==
X-Received: by 2002:a05:6512:b17:b0:539:edc9:7400 with SMTP id 2adb3069b0e04-53b4745f331mr297876e87.20.1730151105186;
        Mon, 28 Oct 2024 14:31:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1245c8sm1186637e87.65.2024.10.28.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:31:44 -0700 (PDT)
Date: Mon, 28 Oct 2024 23:31:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask'
 from IPQ5018 PLL config
Message-ID: <3qdbri4ymlbzn7dcl3dxyggyjberohytpoq2qe3zj2lxwq5hj6@n5f3gkaqpsu4>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
 <20241028-alpha-mode-cleanup-v2-1-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-alpha-mode-cleanup-v2-1-9bc6d712bd76@gmail.com>

On Mon, Oct 28, 2024 at 07:48:15PM +0100, Gabor Juhos wrote:
> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
> those will be initialized with zero values  implicitly. By using zero
> alpha values, the output rate of the PLL will be the same whether
> alpha mode is enabled or not.
> 
> Remove the superfluous initialization of the 'alpha_en_mask' member
> to make it clear that enabling alpha mode is not required to get the
> desired output rate.
> 
> Despite that enabling alpha mode is not needed for the initial
> configuration, the set_rate() op might require that it is enabled
> already. In this particular case however, the
> clk_alpha_pll_stromer_set_rate() function will get reset the
> ALPHA_EN bit when the PLL's rate changes, so dropping 'alpha_en_mask'
> is safe.
> 
> No functional changes, the initial rate of the PLL is the same both
> before and after the patch.
> 
> Tested on TP-Link Archer AX55 v1 (IPQ5018).
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>   - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
>   - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

