Return-Path: <linux-arm-msm+bounces-35276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72F9A902F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06A2FB22752
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 19:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497DB1CB53B;
	Mon, 21 Oct 2024 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVvH0JWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1521C9DE5;
	Mon, 21 Oct 2024 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729540245; cv=none; b=TMAcYtAM/D8U0ZQNimpH43SXL0JoYx70eMqTuEF/KurlDH+xd0Qo68rpsHFSB5qHTlZtZ+Wo7HIZCmGhZb55c2cXTQVz5hsMU7gWZBjqMkmmImgV3FVdvrIvI64N5cZMff88DOaU9PBP279z68/UIYcjECi40gI7tIowdBt2314=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729540245; c=relaxed/simple;
	bh=ydGZrdfQa8ASusOpBeBgAhY22oTxyxpiS7caUm/boCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn1+kjdjwtQbDxr1xsoo6huRssNNn8jmFTVNTHSnoluLw1HZmSiMpPKEsw9NXdr7sWns+UR1oOJEMUPXicTYrTKrfGE5NmtLOTOfg9o8hUf+CDAh2RyMx7RNG2CPcTIcmzy4IRfawBheEpkR2REfOxiqDvzopacBaQH4rVwQZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVvH0JWb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so5367251a12.2;
        Mon, 21 Oct 2024 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729540241; x=1730145041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lysv7uhwVKHdI6mHRz0fS2jA5yM5eGnF2mqAXAmknTM=;
        b=bVvH0JWbZ3bwO7sG6brPh6oflXVvLLC8JupViHBzPmSDWrUk7COI3RRpiyI1UuRXr7
         r8ouLWiB0zm7luyuaFJ/eqdoLPivLoeNGSVXvq0xR/XtNgFFQ+V6/MbZpSJzp3RlZhhF
         S8l8j+Os7yW3abrcHBpYzSKY230M3aXgOAUT89OqMeiJ0Fc822yI7XmUUODn+n/S64ls
         mvceNJNUk7N5az9gVoB5CXmGCywzjxjtuocyhi06Pwh3eEI6/LQqAeISm4y4LWo96P9L
         4gwTxDPRc3d7F+hRkuyTnpV4JzxaQwj0YXnCIQgyoXI2Va6ljSGnKo3LAvF7z85mUZZN
         MBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729540241; x=1730145041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lysv7uhwVKHdI6mHRz0fS2jA5yM5eGnF2mqAXAmknTM=;
        b=jY/VpzU0N+A52+iI37kCYzm6WiVKeFu4GyRdyKgpvn2q9hqJc0MT0DxAmjDdRtxvwl
         t6STeMbiQM8PZjo8QpyTiKs/qslPA6ll3xAag2uWY4rjGNl+p/wfwFjPavg6e/DNE+Hl
         hZyPOPmpPx/Me7NukR0oe/tFx9gFIPeW6t8WnuycKoiS1Q1yfYDLhohhSSWiDSlSBEw+
         dAwTxxWEz4TZw/ZoPka77wDTEc3SYbDolt1lKYfLQgTZ/+7lIyNjq/BF2t9C0VajieH1
         /dLGtktPknGDc4nHeJK9RbkvXoo+Fjrk8fGSx5VIY9+GHLw0L8ubXhQVyy8miqfuVRFT
         c3eg==
X-Forwarded-Encrypted: i=1; AJvYcCV9+TUxZojUn+7KCzlw68HLKK71tWwGkj1cotnGtlw9D9EHHIMfcfyxuLqZEu/TP4IxZ3xFOqBEILh5iHcG@vger.kernel.org, AJvYcCW64g4LUeSudRh4Hcsi4zA3lACSw2uohpO80eHMUZMeGghgyUJGazJrcgn0QrVUS55mDLjBcoIVhkDDwQKsaA==@vger.kernel.org, AJvYcCXpR0Fj2BHMdIzcrmOOPy3fma2dHoMMisvkhaZqjldHZNH+C4RMLKpbgZfh1PF+2iXJLKaQdrXeGzDF@vger.kernel.org, AJvYcCXxd2RQlE4lFKI/MJW3E/eTzs77TxfWuAcRH/0ky6dB6NdZ81ZsoSIWMcHF35ivoXwiBu9UZFveuC8Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46uULBGPZaFaCOF0iHGEwtjF1TRHkMWhBMOKzAiV6rbzq0MH2
	HS4CdlvXENxXTQrASk42lsBrmD1pPJX3FuIRp3n6+qQk9/S2Kz/wxb8EetZA
X-Google-Smtp-Source: AGHT+IHZYQnoOcQ+3GxNp3d9r5mQyk3oFBPMvOCeTy6raelJ3cO8rMq8MZ0pBKSYEr8orpxPv72P6w==
X-Received: by 2002:a05:6402:907:b0:5c7:2122:6ad with SMTP id 4fb4d7f45d1cf-5ca0ae7f7c3mr9387565a12.14.1729540241189;
        Mon, 21 Oct 2024 12:50:41 -0700 (PDT)
Received: from [192.168.20.170] (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a6efsm2316192a12.53.2024.10.21.12.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 12:50:40 -0700 (PDT)
Message-ID: <fc6d204a-93c6-412c-bdf2-9619415f5062@gmail.com>
Date: Mon, 21 Oct 2024 21:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] clk: qcom: Update the support for alpha mode
 configuration
Content-Language: hu
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 10. 18. 21:15 keltezéssel, Taniya Das írta:
> The alpha_en_mask and alpha_mode_mask must be applied within the
> clk_alpha_pll_configure() function to ensure proper configuration of
> the alpha mode of the PLL.
> 
> Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Tested-by: Gabor Juhos <j4g8y7@gmail.com>

