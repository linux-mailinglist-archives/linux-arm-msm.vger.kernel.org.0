Return-Path: <linux-arm-msm+bounces-12958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681486C89D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 12:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B079C2888C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 11:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206657CF31;
	Thu, 29 Feb 2024 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M80JQ2Ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79B7CF2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709207638; cv=none; b=Hv14AIEU0NW/ZSN5f32OVZKlM7a66JBZpVwAThm9Qhmg7X/XKI2XW3biY3YabLtk7sQmeff2myErsrVP2SWooKkvUnpaPu9k81AZBQwgD0KRidLi3AbxjrzU7moDOrCncVslpSIt3wwq47DAOyTg2aRbhw7dAw341DU58FXXa60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709207638; c=relaxed/simple;
	bh=aPkZ1pZjNnJJI5Q/fiChvIDLNBuCtmd06jZTdL+Ggyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVOroMw4/NN/wxdJyt0HKIxFYEQ5PCS7k13EorIfgv3MyjMrB81Tb5E4ZoJUnqz+/8OtGp5xzramsYXkZxoBzh0D0zDimL41gIIhcKjSe5FyYlXWO2Kq6MZO7+xMEJoO+IkXW8pbV2NBqMd1Wk/GW/1s4wbPGue6rX7IOV6Sc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M80JQ2Ti; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5132b1e66ddso219776e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709207634; x=1709812434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLTFaT7Nkx/eCJKDRCtLdc30QfXkBoGZ+x/B0puoFKM=;
        b=M80JQ2TipHM6leEvcZR2f4CFW5hd2CsDU/ysmgY/4r/0Zqw1Xpoq+ALxNkoainj/4Y
         SHhn9jeQ4dYemKDQQqS3DRp6uXTs0bCZo12G8RIqKvJdm7l5BiAPDwfhwl9sv+7qywhc
         yVcXYHsi2KlmbXVgTGZei48uGGUAJAWvpggTwtk4iqgBO9RV9UpsLtJufyzmnsXkNcOd
         dnuGr6WJEW9od+9zAzCcSCz3zIJ7LLceO074VF68DyFzi8yqnbLDP0kvpgy3cd0af8zm
         jku722Gpl87onExcA1vTACxCgBAFC9gknOsuQrJw/FA0taUxtDHmTk3rFWJuqEA08bbi
         iYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709207634; x=1709812434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLTFaT7Nkx/eCJKDRCtLdc30QfXkBoGZ+x/B0puoFKM=;
        b=S3mMNiIAvkp7WpF+hv1Miwhs2Cur3yoeseiEFkJoYr+MiVJgQH9wvB1LrEfnHY9snL
         tgd4BMUvQR3a6Ai76HJqYIre+tFnVGlfCNk1899XCXvVEgsF2AXLlH1zgf+6dxwVELTS
         q9Y0JD8ic1eZ2COg5V/OK1quTbolZdw+xQApDe6YfNGTttcxEhmCXaVG9bUEiA9vBsIX
         GCmmtpkUFte2yDcKM7wQtQKrt0fVppD5TIdMTfFgmHzAHsvvVdE8BoH3HcyOoLnQVKJX
         Qdx0tpqxDkGpqCXCLjoiA6QZ4aYQ0Glhqks1qZ/NLFbdm2EdEsUFB77rgNrVzFiBwOc9
         jPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt0oRBZquDNBxWTEXXf+B8g+zy2ONjZzp6FeG7GrkJSZcb4WyQUkSwSnEKUFW/nOPFgi0rlhzMFsnrA/9OpmKauYwK3AAnuyJ3wXr7iQ==
X-Gm-Message-State: AOJu0Yxi+0pmSHmEv9r03LorlqqU+fn9cr6WycDXxny0bzFQDB04HwQ5
	05Q8WgqsXw88zfeD9gskGK10vDRM2o4Ju8e76LCu/tFGRJv+xL724JU0TZj4jyE=
X-Google-Smtp-Source: AGHT+IGP0/pA++rl3U7efvrQPpAwssqlcxwqZNQ6Tt9Nv8HtPUR9CpPCo6oXDAAXGe9esJJngWtvkQ==
X-Received: by 2002:a05:651c:2105:b0:2d3:776:a8ab with SMTP id a5-20020a05651c210500b002d30776a8abmr967147ljq.45.1709207633804;
        Thu, 29 Feb 2024 03:53:53 -0800 (PST)
Received: from [172.30.204.118] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b10-20020a2e894a000000b002d0d02e50fdsm201372ljk.78.2024.02.29.03.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 03:53:53 -0800 (PST)
Message-ID: <2f6bf03f-b0c4-46d2-baad-4047c78663bc@linaro.org>
Date: Thu, 29 Feb 2024 12:53:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Disable pmic pinctrl node on
 Trogdor
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
References: <20240229012828.438020-1-swboyd@chromium.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240229012828.438020-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/29/24 02:28, Stephen Boyd wrote:
> We don't use this pmic pinctrl node on any Trogdor devices. The
> AP_SUSPEND pin is here, but this pinctrl device isn't a supplier to
> anything in the devicetrees that include this file. Disable this device
> node in the DTS so that we don't waste time or memory on this device.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

If you don't use this pmic, perhaps the pins should be explicitly
"parked" instead?

Konrad

