Return-Path: <linux-arm-msm+bounces-42921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777C9F8CD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5008163DA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781B97081B;
	Fri, 20 Dec 2024 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/sSn5/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC094175D29
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676836; cv=none; b=i/ZKd30tTHwP3GE5TJemIGFZiBT9nan/ASlSoGx8Gf9KhpG0/cgEah8xOQbeRl/NI57+mEr9MQ36FgYeZZB9LqBtvzWGD3TXMRgaJaUYjqs2/ouBVKwxntB+0BsuWzNeU6hg0+qr0yy2RJx6g6ek925vAMChJNHsgDWeSLw7D8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676836; c=relaxed/simple;
	bh=y9JHwmsgJykn5Vuz5DPHZlgGFgCSKQIm9DCJUV+dnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5JtLYjG4LD/5gm6npeGsNchxdzP432PgmGpvV4VrcTE0f/e6LDa91YR7sTN0Fj8LByAF6E+HqZm2oqtfI2Zjk7j2uJYDIMPlk/MHCIC0iqI3VrFk/hXjxAYEO7ThFay3bXWlxJupmEHfSL5Fk95gG4WwXNxJMUJWedpOlCBVD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/sSn5/e; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-728e3826211so1353734b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734676834; x=1735281634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAR6EL4b1dcR37cH4D1lnXYbRYlW9ts5uPuKUPE4Krk=;
        b=c/sSn5/ecqqiQAgWvjLfwuDZd1R5AVnM498/3A8HYJKLgjo02JJSTAjI0T3v9IHNHO
         VrxgNhwinAfoTZoOmwluJaL4YC3tyif61gljPqqU2eZVC4G8KR2MPRlYSPZVtdJKv6mZ
         T7n6Ofl59ONEijcvD5ATw6bbHitylNLpHWoMd0v4Hjaehys04OIcVUGtzDQPDO+ju7tF
         3f1KiGtYG3LZG4tyqBK3ERRRBS4MDhl64bNgjNRcE8SfIcnkF0LHkLrEPdWjidCMKxCF
         wZOQKqS2oba7UeUg8adUO8qmKZVFcPko0oWm1EA+axgYr1lYX2rDNA52q+hewu7y9y8U
         T4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734676834; x=1735281634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAR6EL4b1dcR37cH4D1lnXYbRYlW9ts5uPuKUPE4Krk=;
        b=rzBG/mqBaOhBWWnoWfHMalXeE/qL2UTKOY/6dU9/3Rxzn/iEmycRxYXjABbOsJqJKJ
         i8LxJkt+HnItdSguHtVl8TV8BVyW9eBAO5XM6+1C9rGv8Is6sA/bWa3fyqqFM41N9qra
         OYLBl/n88Nq7Lfjls045vwyQ+u86pj+86YAXHN89y/5CaweBU2g146okspg4JAQBiXn+
         gi5pS2aEQpgdlbrus3mDcuPWPjjYoP0FjrnAp4tAoKUNJJAwKROAmaQ0RmL+jQlqLumW
         XewER2xTZuNPzsDOTjQ/M9c6socqvQfrf+0x7hJtS1kp5k/EgxCaFp6OJAfVHuGtJdAs
         jMug==
X-Forwarded-Encrypted: i=1; AJvYcCUzOqp1MIrZoiIiHRCaoehdUv6tt9QsqsjX5bq5Dddf8jnkCq5cSZ9dOEjJ9aDz6GaWDm3RT77+A3KRkgkJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3rbvW0fz65/d4sq8lz53HVhUEm0Nps3RjcxgdpPtbMehv+B8
	JxYb4zs4aBYcIerXW+VjREYtUJ7MSZ1YWsoret6my9aie8ywgd4KbFLCveFwFI7nkYBkGJVpW9d
	s
X-Gm-Gg: ASbGncv7E+irysbhl8K/LOjTNm88f5XWd9YgfzfkRAVCWYIugvIxfxPMEuvyGyb8VRD
	sE1UPK/AYOnWG7alJ3eZFzBJq9/8hjM5W7AMcHtkubsVMo0ZBmi4HESQW0HMHnnbjjQFOhWDXfe
	xeFO3mTx06ayAIKWFJazNrXNxdcLcrgpsgBP/q7cx15Kvl0tghlyO1me0safax8LWlW+D6J4Ejc
	C4vcbXcDonqH++MXCJcHY++IaLrHWTj8VADCXzVge5WxQpsICNZgqzlDi4=
X-Google-Smtp-Source: AGHT+IG+SV0wvhd/C/3SUzB6URLeBHUlw0VzafbKosxxw6sZbA2+f4EkHrtw3uo6TK73xskXOue4og==
X-Received: by 2002:a05:6a21:7108:b0:1d9:fbc:457c with SMTP id adf61e73a8af0-1e5e08028ebmr3084396637.36.1734676834228;
        Thu, 19 Dec 2024 22:40:34 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm2198123a12.7.2024.12.19.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:40:33 -0800 (PST)
Date: Fri, 20 Dec 2024 12:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: manivannan.sadhasivam@linaro.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] cpufreq: qcom: Clock provider fixes
Message-ID: <20241220064031.qgbfndt5ijlksnf6@vireshk-i7>
References: <20241205-qcom-cpufreq-clk-fix-v1-0-de46c82e0fe5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-qcom-cpufreq-clk-fix-v1-0-de46c82e0fe5@linaro.org>

On 05-12-24, 22:20, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series has a couple of fixes for the Qcom CPUFreq clock provider.
> Patch 1 fixes an issue where incorrect rate might be reported if LMh IRQ is not
> available for a platform (issue identified based on code inspection). Patch 2
> fixes a regression reported for v6.13-rc1 [1]. The regression was triggered by
> commit 25f1c96a0e84 ("clk: Fix invalid execution of clk_set_rate"), which fixed
> the behavior of the clk_set_rate() API. Even though the commit got reverted now,
> patch 2 fixes the issue in the clock provider code.
> 
> This series is tested on Qcom RB5 development board.
> 
> [1] https://lore.kernel.org/all/20241202100621.29209-1-johan+linaro@kernel.org
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Manivannan Sadhasivam (2):
>       cpufreq: qcom: Fix qcom_cpufreq_hw_recalc_rate() to query LUT if LMh IRQ is not available
>       cpufreq: qcom: Implement clk_ops::determine_rate() for qcom_cpufreq* clocks
> 
>  drivers/cpufreq/qcom-cpufreq-hw.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)

Applied. Thanks.

-- 
viresh

