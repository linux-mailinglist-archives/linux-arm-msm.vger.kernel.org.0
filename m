Return-Path: <linux-arm-msm+bounces-39424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D89DB71D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25B3B21724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E696B19AD86;
	Thu, 28 Nov 2024 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0eL6tqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A451581F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795625; cv=none; b=D1Dvpmnou14IHOIa28GQSC+12DK/d+i+jqnI3arSN4dXzx9ms723RrnglYBdZWdg0/aD/URiM05j6bTfNG5p/lHE7u2j7xWGeF7RYbrsYdmVXyQjyaj1ie8y70PrqtOoXHDQQQ+tkP8Si40bPrEgeteJsoCPRWcoxdVCtPJObGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795625; c=relaxed/simple;
	bh=fQqYngYQaBH4nRkWFH+2RCIgNp656eo5Cdwm61nRK/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g74d3PE4W27fQMStnaFJqj/8vOOYI2mZLvaulWMHKgllsVJLplig3PDODDwdlGxLkPf2m3kNxaNCmPSXqnuCoN8Gvfn2RIAE2FCRjymXXSSuHGY2381MOWKdOgalsSYrqqq1eGg6d6aRJJmkF0aT8+kPRkGeN4ui3K4WYaaMBkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0eL6tqo; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-53ddf9abc5dso99649e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795622; x=1733400422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SF5OHl6Q6ZggZKWiO6IZg02nSrf/YPTh7wLw9TpiFw=;
        b=L0eL6tqoED56UuVeo8BUpvq1uVWouDW7OAGiMvAB7S3Qg/xg2bAEVQmwkXiVO6RUI7
         lhqRpp3YSyldoEWXue9piEioO6lLycrzfJeIhXDku9wVclYckX9KfmfkCSfa/HWsgOqv
         YbmDb/UJa8CAXKmrWBcDdOpmainzuDJXdQ2Hw1kKoaBpRUUWQpWcQGP1yBQsDcVm12Vw
         UbVYcTE68LRE6fBp8XO2Im/iQQ9hx6bGjO1+uBHxgOMv2j/2bkfKfdlOl7QQfYYjxDbb
         K+uwLg3QWfNRCIjIqoIt9xOhJAXLWCwCloZ1GUm7V77ZoUVC/Sub2Vsis9/P9XJ6AILR
         mXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795622; x=1733400422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SF5OHl6Q6ZggZKWiO6IZg02nSrf/YPTh7wLw9TpiFw=;
        b=ctGodB40C3B5FEFPKtFyElD+iAseWkE0EeR7DlmtUZl5k7oC09J9gCqcTuGCZ1lNA/
         4HooDabb40e+GdjzWJ0uUgGBVlM2bzDKI74nGU96bMUoUOJkRIhARv7G5Uv0QA3/CjPg
         kkkwvrxMepi8jBQl2t4HsXa6zV70vAoAL5/9/KcuIijcekLkET9GBMijoOXxyYcY6zgY
         9g7Yn84F3HNdWv59BzxmHnjrCsXcUtBXf++AAgxGGpWVrIfzbvJzjDYXsvnHuKFVIKoO
         eIOO4cGV2ZoJlSWfTpdYlldHFZTcWlrnScMVe1Z2wQkgexSFghxz93/CPkgKj8KMT+Pg
         B0Dw==
X-Gm-Message-State: AOJu0YxGbU2HkpBhWw8EW5+wZ1FoaP5ayOVIqRc+bf2F0i94ffA2MVzg
	n9pwqwGtGIqR2tEe6Xy7drtDF3cuhr1sB2hLFuvxa8jJsLntVwzJ4jd4k+kAnfM=
X-Gm-Gg: ASbGncu78Nhkpbpx/JkV+la/bektqjFxf+RxE9ztm+iEFDOKQctl+16CXmUjNzyqTkW
	zxMKlcTzY0ViN0rXAmYU54IRhREclDEsc9CoL6SDLl2thjN3J8CzRYbz2NbOpeZ3Io4UIpuuPFx
	uKAoQ41hU0NbjLQmjxHHwqpHBMwEZKrpsvMMXvbrSs55LA9k/tlSOIGXjJmQ+ZMwEVUH8/4AZPC
	Ixp94RFbOB+UYdyhL4zw/IuI2q0itJzxhYIpz8bZG76VszH3w8ClVJ5wdxWbISqIm+zekOeZz45
	8LCwUJL5xqJ4h6M/SipufAokXbVV
X-Google-Smtp-Source: AGHT+IHsfbfQFGYieKwKAf8ZPiuL2mZxi4Zqttbg2UBokuZg6RjtXSHIhC857ys4GHZZnwz2KVhYng==
X-Received: by 2002:a05:651c:b21:b0:2f7:5c23:98fb with SMTP id 38308e7fff4ca-2ffd60dbc52mr8337221fa.10.1732795621780;
        Thu, 28 Nov 2024 04:07:01 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc097c3sm1756931fa.54.2024.11.28.04.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:07:01 -0800 (PST)
Message-ID: <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Date: Thu, 28 Nov 2024 14:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan.

On 11/27/24 01:44, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 

Is there any particular reason why my review comment was ignored?

https://lore.kernel.org/all/8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org/

There is no signs of the change improvement, unfortunately.

--
Best wishes,
Vladimir

