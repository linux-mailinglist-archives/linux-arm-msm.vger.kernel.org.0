Return-Path: <linux-arm-msm+bounces-43695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7229FEBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 00:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2603A22F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 23:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B54C19CC27;
	Mon, 30 Dec 2024 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVX4km9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4A189B91
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735602768; cv=none; b=YOJwf+7/Nn3tKwniKOoCbo5z9t52zQyAw77kXmNe487ePHaTLuFq117g6E9CKlA3/h1EiK7jsiHjnn0/L/BxxO4b2T1rqshrnGcvJUbklvGkvJe4ntMIWTQOYVzzxozTQ/Y2o0ZQGVVjKtaX2mTh7MTmQO4bXDtKpCRr7OxvbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735602768; c=relaxed/simple;
	bh=6fPE61wLB4Cp3cmMgDUFpdnOrNXiy7DFFxUQcD+P7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gT0JQm3KTMWtQEX21pJkegg5WvjqWKCIhRtEt57Vw5PcU/0/kVWtPjWeuVu7zNGjkSG2paw8Ik7dWTinNDh2gyGMblQdRpMXSCBGf9JtZmarQI3kqGwrMrLGgaifHz7jhmtQ+Gyr1A0H5iovLfFeGx3TCgYby6JAKGKQGHtMjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVX4km9r; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30229d5b229so102764901fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735602764; x=1736207564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hjJ2HJV3L9xtrLnK+d0RL9BtQlLhJParGyL71RKz01Y=;
        b=TVX4km9r158h3yGOGIli0ETEDbWA4+XKYw0PXnF21xD/t52VHVlGN8h5AEDY34OTUH
         JUNGiF62453IB+UcBCzOn6bYGtqo2raz/AbuLdm9g4wh60wjeOVbP243oMA1PUXH7o/+
         4RWV9FZmuLYgsqOsXhSeIZ1R+HZ6ov+UzjMb1lqSC5/rahhsGrvwJDaSUuEMNMKN6GkE
         kjNe56p1YqsgALWiQr4tfMjl0D9SaHEkuKkiQY/TumzNNgUYuEc6IQFdJD3YxeObZVaQ
         vqv1Yf5QaC11Ez7mchYiYAHOXrVsLHctel0jgsa+1OvrjrDPu/VlCbJDC5TW6VouhpDv
         heQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735602764; x=1736207564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjJ2HJV3L9xtrLnK+d0RL9BtQlLhJParGyL71RKz01Y=;
        b=ODRVSUzNTw7znCLdKolhaesIBnc+Cx3Dg01VL4RNbyWN3CPzf8ROlwJFfgVnYRrsoQ
         O7GoFyYCZGCIJn8cxq9CDqxNyeLSR0VcOJDB3LNZWNXtHm3lNZN00DuBHyAZW1f0ZhDL
         0R60k2LDP2FU6q8inrbA/VnWKg7Qx6TWDiykCPRgxxRisdtvvq6GFcY2z5mLp29setFc
         Ij7ulMfs8LXZi0Ye8ZNWGeLcxgGhqsmTto9wRWHg27/n2am//aHd7u+dpkT3rSQegZnR
         pz6ADmAzVmsiYyEFzZ8qMm2djQd6/DynSlNWePdBbbWa7pidn0exRB/6fZV8TO509QOJ
         A+jg==
X-Forwarded-Encrypted: i=1; AJvYcCWYctMWd0PZYNc4BpmNbhp9n1cAYzzmqFqPmsWx7/5u+5jioHeWclYSFyJ2yYsBLsJtEMSzM60nj77OzIu9@vger.kernel.org
X-Gm-Message-State: AOJu0YyMC4j1RuZE0MYcedI00w3ucxqLfiNBKDokwfC+fFMqEoq0v8Rm
	mwLP0lMblnk02lQj35ALtONARgOUrpvxXGLcvDUaMslx+dzFdIGcY0hV0GwVfyg=
X-Gm-Gg: ASbGnctP7jKrAEpyD71Vb0uzU8m/gRpVVLIhToSGw1rc7ybiSbACzAPT7FJt5ev57DA
	q4laDf4iOpu3VnOO8oGbW37rODymSDQQhE/VxO++M1yuLSJgXpru251xH/LQt2ufCjAcZwc1YLT
	VcbOwlcOwnvMaHjUoQQDRXNQ8xc97Deph7PxC8kitSDdL1Ti/mWcqDLTt60qSusXvov3y0qscE6
	14yA4FWOstSmRajhQTyqj3wCIYRxpEgZmyJysj5xdOGbdTQLnsqIVgp5VLUCxVfeTZwsIl3UJpT
	jEhwX4ZxZCDGa0RQgm/YqL6RxhGCYbDOnq6V
X-Google-Smtp-Source: AGHT+IGV/BFB6vOYpmEU30eIpLKGl3DsKIOAj+qmHkwztvFBVj8pI64r2XAv9vIq0lIyjnWAWvZenA==
X-Received: by 2002:a05:651c:199e:b0:300:3778:4dbb with SMTP id 38308e7fff4ca-30468503315mr103907671fa.1.1735602764455;
        Mon, 30 Dec 2024 15:52:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab76bsm35697141fa.50.2024.12.30.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:52:43 -0800 (PST)
Date: Tue, 31 Dec 2024 01:52:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Avoid out of bounds read of serial
 number
Message-ID: <ilu4xp2mqm2z2gocul5nyntu4c7eiw5wl3rzli5lmptf3hexea@2uuhuupxp35c>
References: <20241230-qcom-socinfo-serialno-oob-v1-1-9b7a890da3da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230-qcom-socinfo-serialno-oob-v1-1-9b7a890da3da@linaro.org>

On Mon, Dec 30, 2024 at 08:59:35PM +0100, Stephan Gerhold wrote:
> On MSM8916 devices, the serial number exposed in sysfs is constant and does
> not change across individual devices. It's always:
> 
>   db410c:/sys/devices/soc0$ cat serial_number
>   2644893864
> 
> The firmware used on MSM8916 exposes SOCINFO_VERSION(0, 8), which does not
> have support for the serial_num field in the socinfo struct. There is an
> existing check to avoid exposing the serial number in that case, but it's
> not correct: When checking the item_size returned by SMEM, we need to make
> sure the *end* of the serial_num is within bounds, instead of comparing
> with the *start* offset. The serial_number currently exposed on MSM8916
> devices is just an out of bounds read of whatever comes after the socinfo
> struct in SMEM.
> 
> Fix this by changing offsetof() to offsetofend(), so that the size of the
> field is also taken into account.
> 
> Cc: stable@vger.kernel.org
> Fixes: efb448d0a3fc ("soc: qcom: Add socinfo driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

