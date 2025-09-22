Return-Path: <linux-arm-msm+bounces-74409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E320BB8FE54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 12:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 588B317A714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BE52FDC44;
	Mon, 22 Sep 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHO1HZ5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24722F39BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535320; cv=none; b=H6nKM4VKZiDLueZibcGiJqSf0qXvqai7RsrbrxCw3fD6yq3jA8quD0t1n0arC7miXRoqqJRiLHnspsdOydK7c5RPbnObrDpd4vGK6VOfR/V/RbVZhSuN2Q9j1hkkWjTWR3s4kxlOttNs8hZGHYq/hxammTiLNnY/ZppwamF9WWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535320; c=relaxed/simple;
	bh=GLC9unjLHcduutfU2De8SO6Cn5IZFndntQa/0T2wPQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYtI4Q+lRBts5qQa9pv2/W6caYPGaj78MIudOW/hrr/+dpy4Ln+GkzzLiHYOCxRrFmERZdBJ+/cDkN3iSTlA7YF4ZBXK2R6iVASI4MrhERDr3+k2sgg5lt6Gf53lDiWGaWmlDRuvNaJ52xyu3cHIa1a3QgWKulA3ReuQptmi+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHO1HZ5M; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee130237a8so2159681f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758535315; x=1759140115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=cHO1HZ5M30mU5lJ+mWZ3CuIc02V2Kw+aRK3u+qJ6OaPpYZ8smMH0dyYT9aBV+j5G3A
         5RngpuRemNRb2YCNUzP0pJxaX78uxGNQLguZ0yyIh+JBfbANGjhPZKwxGrntsMUzTWLc
         NRJeDWPfTtYQBs/HEpOUUeVHjTSLKGDAgm4Hu3A7+tYwLVpjk1G2K46X9NNey6VL5K+f
         dohhc3vEM7Oi4lYHZQ2Wjn4MVuI2GpkSoOuoSIV+OmuRxuoVh+SjNY1kjNuchAEF5vcs
         jdPQl+7bVFQsuuvHlfB3KTCLmKUHtkduO6xgd1qX+whD6UJo1QUDV77jRLywTeqCYSoV
         Z77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535315; x=1759140115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=E4McZVrnQObqqRyw0teIGC+n0p4nRoRzFGhMaoQRH7XTVparywdc3sQFeGOl9C5OPd
         rD7Zpugf6YPD6p/nhOgrUozmlgppoSImTP64U0ia0ToHH1jNoTQVpz5cNXntlT24iOEy
         /Ppm23OjrUuox1bOOtKXYLErbBeawqGzM4I1obkUmFreziRmwdB4kcptwKNA90SB6I1F
         Rvjdr0RcHxyJLdO905OYl/xMNPPL0rF9BBxbH0IPokOp2i7LPQkc8I5IlIxMGUBRE3OQ
         6IdEQ8QqQqllZ0bhB4FCXS9RL4K7KW35RVTsQfFewtA5xoQB4N5w2/PD9ywkmIQxlfdI
         yIrw==
X-Forwarded-Encrypted: i=1; AJvYcCXQUqs7cc22Dhpl8p5gNUp3ULVsFReLQ2aDJi9zP6s+kWC9Fy5eAVJDUwO97CV1wbyn8i/u0QhfCFi8veBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9YBLpfyG6kerb/7R2PW5nL4ZWVXP/UFSs1iMaO5yttcKOYXeu
	PEXyRGNDrX1TxhrtpSllPL8IBFZsNl+g4FDBKitizLJmEwNQCZPqk8M6DROiyW25bc0=
X-Gm-Gg: ASbGncsccz0BVZw39sHA9DI5sfDuJZ6BiQwZIpTeKapeiTpmhkCcO6UTqzmCBUC/86t
	235gD55JKdmsAABAn5Pg6vgs9z3n1bq7Suba5ZQrz9J21G7wXovAL6FlLZ+Jzm8smSHapASDKxh
	yGgY1TKcWqU07a4m6WW7xA8d2ltxGL6iKFQ8DHmN/6PYvi9KN+CFP7aGQ0dQoz1j7QmU/xRzObe
	+dG5qxcfTxJM4bMB4nepNKeNF6y7cisJeGxU3bMBlmY9751jh1rKUZRknRrmPfEzQWuNUiYADOm
	wfHLWegYoaYwj8rg3O+/jwtCJI8l9yZXUTT6QDbBZvzw+JVwj1lteZS3jEa4HcS1PlOvb9mUsWy
	fowl1sL4NPeDeQDzhMOO0ooO+HLu8FOBd
X-Google-Smtp-Source: AGHT+IHyiSZQlLreoJ3W3Ph8Q291wVJ5XeiMCjmBz4nM2qvfV1a5GmC8lVHC1BmJs2M+jyBWopho2A==
X-Received: by 2002:a05:6000:144f:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-3ee7ca198bcmr9624896f8f.12.1758535315118;
        Mon, 22 Sep 2025 03:01:55 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm18419549f8f.24.2025.09.22.03.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:01:54 -0700 (PDT)
Message-ID: <c0a0daf4-e9e3-4152-8e5e-c7b52a30dae9@linaro.org>
Date: Mon, 22 Sep 2025 11:01:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, david@redhat.com, mhocko@suse.com
Cc: mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, jonechou@google.com, rostedt@goodmis.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/12/25 4:08 PM, Eugen Hristev wrote:
> Add Kinfo backend driver.
> This backend driver will select only regions of interest for the firmware,
> and it copy those into a shared memory area that is supplied via OF.
> The firmware is only interested in addresses for some symbols.
> The list format is kinfo-compatible, with devices like Google Pixel phone.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  MAINTAINERS               |   5 +
>  mm/kmemdump/Kconfig.debug |  13 ++
>  mm/kmemdump/Makefile      |   1 +
>  mm/kmemdump/kinfo.c       | 293 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+)
>  create mode 100644 mm/kmemdump/kinfo.c

I tested the series on pixel 6 and I could see the backtraces correctly
decoded by the bootloader:

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!

