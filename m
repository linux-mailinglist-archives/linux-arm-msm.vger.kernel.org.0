Return-Path: <linux-arm-msm+bounces-38551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E39D415D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 18:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73DF5B2E893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 17:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFA21607AC;
	Wed, 20 Nov 2024 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQ890Sme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE718660C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732122554; cv=none; b=JBdE68wYxCsmPmqw3Tk5cXopDsGmARZHPDhCdLgZU25MWKTwTAlMxYc/yKWwYR66ZykhZLApBjJry1H7kwZnG3MGvW28Gr5Fti/VLOPrTFYGqH0TA0PXHAHWSkmmGz07bMHLmIo/kWJOpG0hFgTWDDLVxtHV73lu9MYQ/Dn76Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732122554; c=relaxed/simple;
	bh=GxGYBTBzNgOeIfq/QdI2OaIkEKakJlVruSDheSbNFFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkeE9e/k7s+Xpz1J+2NobvjdMW0GNuwvjz4GNMvFjyPVza0UrLEJtHKsieluWpvx9I2cxvWMPVytNBphH8yuPrpxAUfqBWU3tulT2Paavfhei0rMyDifA0nVEa5ds2jHCGi5cxTqD3pIdxPIym/fn2KDQx945xneFirJ17YNqvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQ890Sme; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso61976395e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732122550; x=1732727350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lBaWVIKUDm8mK0qFWu7ZMD66HrRVg+A8qSokIpCLr0=;
        b=BQ890SmeFYdur6wFjXEHO7s5gpo3VUjwH1KfoUuCzRrDxF6USOgLfi1KvtlMX48NSJ
         m8r+yEcEAUGMWSASciaAe+LZZRLIb7Wj5FZQ9ajG0PYlopMG4nO7cxTXtCrQ6Y6ULaSV
         MjlDNHR+iABTSPetyJVowR7FLYBufsdLYSEldM/p69njeUw+VzsJbuSIek6lgT7I26B7
         AAjxWOnSU4BC2rW8l/MMHjzoNB9Rb8h/YwF5DS9rpkW/NyCccIZMpiNkMOcboppJchGX
         BJyUVVMwfOAxz59qHeK9ZlbFUR6yrOOAT/90sYSk/030U5l0J82BWG/Lkq1Xfzk4eMY5
         Apgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732122550; x=1732727350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lBaWVIKUDm8mK0qFWu7ZMD66HrRVg+A8qSokIpCLr0=;
        b=BraEpTAfPVwCM/NgW+GuHXmtKRA7g8R1/dSDRQX+83hZ7vi57oYNuuKA4q8DR0WI6a
         z0I58JPevrpOjq5jQ5qDMxawRHxtq1tgnu05g9Bkrxyi5I27esW/d8Qe7VboOUUMH0tb
         xfWl1lVxVd3RiNH19WxFrIEft1eRk1/OS18LrKQtxmjANgEM2MuxLwd7SPIdAaYJ07Kl
         mKK/KwgRrma61wcGYEHWVruTwd5R47vyD7oRL7Refo2rWOBBplPX4QwXCE8GIfTu5/Xn
         Im94W9nuv/kOX/vNG3zSKyxnbTF74QENyO2Z2AhARvrdSCd1iag2r8p1i4hny9ZA5P7f
         S4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXRFykAnYA00AQZRz6TiaX8PKH/evXm25zNFUq9rjdysDAMKgp9137V+7OMn4mjsnNS7ImBCxTP97SZMUgG@vger.kernel.org
X-Gm-Message-State: AOJu0YxFP/uuWdio41jRaQ7BvqPz9FQR70U94HjYW0W6udFDkz7mexWM
	jNUnj5/5ny9kpKn1dbbW1HTnbMt8SDjLpgyTknv1/r0p7tEmH1u4byfWHGTQHINwYdbqZ2NouKi
	EUuE=
X-Google-Smtp-Source: AGHT+IGiaYIxKh7fbsrmK6tgUUwDYtTaqJ5Wpge3WBivCuMq4wZZiH8eGrvzsvlRCSKNGG+wDtIT/w==
X-Received: by 2002:a05:600c:3b12:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-433489819c0mr37456805e9.5.1732122550515;
        Wed, 20 Nov 2024 09:09:10 -0800 (PST)
Received: from [192.168.0.200] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b46359b9sm25029685e9.36.2024.11.20.09.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 09:09:09 -0800 (PST)
Message-ID: <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>
Date: Wed, 20 Nov 2024 17:09:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2024 15:34, Bjorn Andersson wrote:
> What I think you want is two things:
> 1) When you're accessing the registers, you want the clock controller's
> power-domain to be on.
> 2) When the client vote for a GDSC, you want to have the PM framework
> also ensure that parent power-domains are kept on.
> For the single case, this is handled by the pm_genpd_add_subdomain()
> call below. This, or something along those lines, seems like the
> appropriate solution.

Yes.

I'm finding with this patch reverted but, keeping the first patch that 
it pretty much works as you'd want with the caveat that gdsc_register -> 
gdsc_en -> gdsc_toggle fails the first time.

After that I see the GDSCs on/off as excpected

cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
off-0

cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
off-0

cam -c 1 --capture=10 --file

cat /sys/kernel/debug/pm_genpd/cam_cc_titan_top_gdsc/current_state
off-0

cat /sys/kernel/debug/pm_genpd/cam_cc_ife_0_gdsc/current_state
off-0

Perhaps we just need to fix the probe path @ gdsc_register()

---
bod

