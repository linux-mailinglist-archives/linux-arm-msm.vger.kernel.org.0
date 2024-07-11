Return-Path: <linux-arm-msm+bounces-25917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E534192E1C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0426282E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E614E15535A;
	Thu, 11 Jul 2024 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fRhRq6t4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9B155308
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685624; cv=none; b=LObZ9WBoEpSfPYJEF4J/Bsh/wP4G68K2Nseh6sHoUb+t3KT1MoPI94tdNJMhfxSzH0ttmtzR+NlMl9HxHENAelHFlhqky8qLWpZ9emiNVJ2pMucE5v1rtvio/TephWLxiRka7Z0TFHZ0BYLbKhU3tRSP8dAXwOH9rTF60cJn4M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685624; c=relaxed/simple;
	bh=eI/hajbdA+0Rm/p6P9F4jJIv5qhR/mAL+TsDqW7Y3as=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=co3BHuk9dQIQ5v9n5LoH/rTpydEAbYslIYPGNpWaZcpZkyCyJK/PajyL8XadW0inQlayp+nKLFqNeaIVpdof9kPBqhvoPmjL8LENJ40OKDMWyFcR21ZEzpcaE3lfcLIB0wxmSCefM2G0oasiF+EwLU8nhfoYVPt7sQDou8WuMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fRhRq6t4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-59559ea9cfdso669733a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720685621; x=1721290421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvTe9WRrtDlz1Jy2LpZjEQGJotsWMz6Pvf+dzDrN3iE=;
        b=fRhRq6t46btwedVqHYka3HYI/ehBxGMR+tySNwBUxkpJIrEm7F1hbs7A0kOsjsZkA3
         swJOYY5gC8JRpLWEjDxXyZjorpzlawH1foga9+fzXs0QE5RP3Ahz7CqTEItjOVT22e2D
         8V9ovE0UQjyfhvLNqXZZhNU3Ogroe11U6oY3cwvIjc7uPXEvGSz8/mL/1cQlflIPJctY
         2DUZB4KZ609Tg9MQLPG1SWr1EGmqn9EmnvuqMFw+uiRfvHeCYOD5K3ndQmA0vvnQE+p7
         L3IWveHuzED3ACijODlYSEIjq1iO7ahB7H17HjjAHDEUp8ITJqRABc3WquKDXBl9NKFM
         cW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720685621; x=1721290421;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvTe9WRrtDlz1Jy2LpZjEQGJotsWMz6Pvf+dzDrN3iE=;
        b=OIxH1FCwdgM+ySG49j1h6ny/qeiUmkNp157YDVsVcXTa2TVCD9rNFn93AI0LmPd/9p
         a7K+yqj0SRY9N2ObpJuKicMr5MWcWHZbljynab4aLgKxzdwOcgsBLBljAB/xByj2zNGi
         V7FWX6uOi/LOI1pOREL0SZCSlEcNB6rTDYD7R1Xgb8ZFsamHVIp+4IxVp9NsdB+Aj/yH
         T6SD5teer4V/L9ph2oEohhagEY+JdYRU8BmpcA0vUFZzElHb+RK93V+bk6wNzTxFQDy4
         a/csqSVqg7f0aGFIwiNSklytsfdsfRPRso9c3heX3gTnQjKyreALfu5OPMy4iQTjdNPb
         T8dg==
X-Forwarded-Encrypted: i=1; AJvYcCXIGfcpn/m3Jp+f5wKzHROHv9c1EKySN3jGZHGusVrkqTSdwi5cteXNQsRlWGB9tVcDCe9AMcJzvnoEMg5OFaRLMoODXuxi07H2jsifnA==
X-Gm-Message-State: AOJu0YzHjptttVFHPGHBMbLgNhasadxryVfQ/kZy/q9JAdeHcduCYoyb
	jjCk2DENqwzKDsWpumreOa1uTo2OBBB2BbYCvfeEZoUUU/eI6OtJX+U8KzBl9W8=
X-Google-Smtp-Source: AGHT+IH0DQ63yM5AH6DvvXzYYY41PJu/2xwyhi0Q2SOrjQgcllimfZ5GRDL0RyenxtLJEbGV6Jl+ag==
X-Received: by 2002:a17:906:245a:b0:a72:518e:7c8b with SMTP id a640c23a62f3a-a780b689fb3mr601415066b.11.1720685620585;
        Thu, 11 Jul 2024 01:13:40 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a856251sm234228466b.185.2024.07.11.01.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:13:40 -0700 (PDT)
Message-ID: <069282eb-d891-4537-bdc0-85de17b5e61f@linaro.org>
Date: Thu, 11 Jul 2024 10:13:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710110813.GA15351@bnew-VirtualBox>
 <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>
 <20240711054934.GA37910@bnew-VirtualBox>
 <793b70b2-d6c1-4e4b-96a5-8a257837eafb@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <793b70b2-d6c1-4e4b-96a5-8a257837eafb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2024 10:11 AM, Konrad Dybcio wrote:
> On 11.07.2024 7:49 AM, Ankit Agrawal wrote:
>> On Wed, Jul 10, 2024 at 01:54:01PM +0200, Konrad Dybcio wrote:
>>> On 10.07.2024 1:08 PM, Ankit Agrawal wrote:

[...]

> 
> Ohh right source_base is a global variable.. perhaps the original patch
> here makes more sense given we definitely don't wanna unmap that..
> 
> So I'd say let's go with this one after all
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

We should probably also check if msm_timer_init() succeeds and unmap
if that fails.. we can just check the return value of that function
and if it's non-zero, call iounmap

Konrad

