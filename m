Return-Path: <linux-arm-msm+bounces-35972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923F9B0F81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 22:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 900B2B23126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B06120EA49;
	Fri, 25 Oct 2024 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR+0sxwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE220D503;
	Fri, 25 Oct 2024 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886709; cv=none; b=GyfPpWe78WQN3waWDCvEP5fAZJIzzisMWprPObiKNugckVd68EjkjBdcNewgH5/TBkKJ0P2Fglk1E2GlBrJg5+Z8thA2byGvL7cIJYXdDk5zexb7Wy3B3PYaPF23UKLBNHVqVmLj81GGoUu6t5Pjbszqb83e1gQDAHG3AXwSnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886709; c=relaxed/simple;
	bh=WzU9HaaTHzzcvIqq8w5qqyymwZCtfHZ6qc+MaefFUyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM8SkySW0a7MzZBHGaWIILpioNcLXrdCfpfaMLCwt+ic+MUHfxxinRpHX7Lvh2sssZM9OrwT+/0ClzsAmHtj1d7xSSV6XIbAdeJm2V5c9+j1hQkAcfA6aUUJQmpapjguK/3zK/RJ/MYhAynsETcL1bAq4tF29Z4V8pbBoSJcVSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR+0sxwu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4fd00574so1513430f8f.0;
        Fri, 25 Oct 2024 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729886706; x=1730491506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1X70Bk92OXSXgwxsbd/CkwTx9ilKB7Lhi3xm516EXcM=;
        b=lR+0sxwutNRv6Un9xOUSWrEXGFKzTW09SUK9L8GRd9SsMPRK0ElRU6pOVRDTk2Ms/J
         5Aw+bjDHStX6Qfe4HgrBXrTu1p8wWEGGtw+dk2ipLgA03MdvLnJxHrh+nBLwVMDsCwT4
         YumuWcCTHTuoG1pxEV1flqaaeljJKatHE5u5gbv7ynt/+TuzKS1CCBwG6ZlpiaapC7rd
         VLsjSC7uNPdZUNSojwMxGUX/QKqLih6em4fAxIYlMn7Y+xR233ovrjHcvou0sM9VxWb7
         3zj5+slU7Df+w1ND6YaAoE+xo05pzfQem7ecjmBiTIvHSP/RLRq6pgN+3KqoH+RhicyI
         6rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886706; x=1730491506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1X70Bk92OXSXgwxsbd/CkwTx9ilKB7Lhi3xm516EXcM=;
        b=MuQZrjgYeIQq9X+MWWcTMBnjFfRZylWtd/ydZU0XsGV/TlZF0ZuNINlfE+HRd5mRjz
         JIAWYc4gcUVPQcphqBJ1qshgHTKeHIc39UiH2sfCQBl7wG9tSKMSvIfp2wTGQX0dSsWC
         eNz4tw5zS7yP/eTDRv+BnutP5aRA8gOgvIVKWQb+4yEZ7bZptqwtldL07Qe3KjdV95J1
         hAlgNYFRy78/z6r1rzyWbO6sgatp4YymW7YL1EsL5LSWvGLXMHa+8mmyJu08FiZA0fqX
         A7SYHT9KamnSg15H0ttgvPMppQZSfujfm0BBiMQ6YcO7zoteXuu16Kp7spkJLEzc9Dy8
         qhFg==
X-Forwarded-Encrypted: i=1; AJvYcCVkTpJjhHE2wT3I3fjNqguG7mGaW5KM7E2xKH2A+4rXylmPGHgWZCheL+reGNvKG/OMb7e9PiQgP0IJDTHx@vger.kernel.org, AJvYcCWxlUfR8d+sB7seVT+rPdBfbRYmCmV78SrwFRiDIwNn6APK7ubdKQv+QDkZMg7ajX9xYTab9gEAId5dJK4c@vger.kernel.org, AJvYcCWzKSOGe/qf1pL9hmYmMynWiTgDtO+xO4FNm6/F1ALTgCWe0r8HyMxT+JiTJymxh8RYIx3JqRytZIl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RyftKnWvvWBgf8ZC5I1E+WLiBRDmsyocmfGeVjIoVHfz8cbE
	X//4rB3uAB8FmnIyCj2KfUs3g9D/jZH/WmkaDxZSKUieHu/V1YqF
X-Google-Smtp-Source: AGHT+IH6RJxZpeVZS0q4kyHOwiyMCIxB5nEvNJcCqMGEpmSq2K9V0mihG8v6D7NKxdrNBRRTP9dgtQ==
X-Received: by 2002:a5d:524d:0:b0:37d:47eb:b586 with SMTP id ffacd0b85a97d-3803abc5246mr5459182f8f.4.1729886705442;
        Fri, 25 Oct 2024 13:05:05 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71406sm2390341f8f.84.2024.10.25.13.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 13:05:05 -0700 (PDT)
Message-ID: <45461b57-cb5a-43a5-8b9c-09ae059805a9@gmail.com>
Date: Fri, 25 Oct 2024 22:05:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from
 IPQ5018 PLL config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com>
 <yplfg55afv4vucpcxbkqsxmn44mzwr3tepbuvgtswhupx7fzfi@mwofp7v3uarm>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <yplfg55afv4vucpcxbkqsxmn44mzwr3tepbuvgtswhupx7fzfi@mwofp7v3uarm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 10. 25. 8:24 keltezéssel, Dmitry Baryshkov írta:
> On Mon, Oct 21, 2024 at 10:21:57PM +0200, Gabor Juhos wrote:
>> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
>> those will be initialized with zero values  implicitly. By using zero
>> alpha values, the output rate of the PLL will be the same whether
>> alpha mode is enabled or not.
>>
>> Remove the superfluous initialization of the 'alpha_en_mask' member
>> to make it clear that enabling alpha mode is not required to get the
>> desired output rate.
>>
>> No functional changes, the initial rate of the PLL is the same both
>> before and after the patch.
> 
> After going through DISPCC changes, I think the whole series is
> incorrect: these PLL can change the rate (e.g. to facilitate CPU
> frequency changes). Normally PLL ops do not check the alpha_en bit when
> changing the rate, so the driver might try to set the PLL to the rate
> which requires alpha value, while the alpha_en bit isn't set.

Both clk_alpha_pll_stromer_set_rate() which is used for IPQ5018 (patch 1), and
clk_alpha_pll_stromer_plus_set_rate() used for IPQ5332 (patch 2) sets the
ALPHA_EN bit unconditionally.

For the PLLs affected by the remaining patches, clk_alpha_pll_set_rate() is used
which also unconditionally sets the ALPHA_EN bit via __clk_alpha_pll_set_rate().

I have created the patches after analysing the side effects of [1]. Due to the
bug described in that change, the clk_alpha_pll_configure() function in the
current kernel never sets the ALPHA_EN bit in the USER_CTL register. This means
that setting 'alpha_en_mask' in the configurations has no effect actually.

So, if we assume that the affected PLLs are working correctly now, it is not
because the 'alpha_en_mask' is specifed in the configuration but due to the fact
that the set_rate op sets the ALPHA_EN bit.

At least, I came to this after the analysis.

[1]
https://lore.kernel.org/r/20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com

Regards,
Gabor



