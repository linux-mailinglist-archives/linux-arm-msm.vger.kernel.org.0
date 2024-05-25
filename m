Return-Path: <linux-arm-msm+bounces-20470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B338CF0FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F851F21467
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CA3127B51;
	Sat, 25 May 2024 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1aTWdzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A77125DC
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716661754; cv=none; b=WBHQk+YerrorkPdSUbgMmTpN60pjfEpiNJ75SZSN86MHkCGMvzvogw/f45jj13yNI9VEUjMhEZj8NblfLwgSWXuXYag8IwF5TvuA7VidWS1cMynseYtUpg7n+WKi9sKpqJ939bQvmx9H8IA9SR8rFny7emt0x5J6QsqpB859IwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716661754; c=relaxed/simple;
	bh=jTdege99R9Q3cjjZDkZno85AtpCjNDTnDiVN9qI7BC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=peP5j7WWBjo8FgQADHWOD04wkQMnSak8txUVmeDyLogc+/Cvh2bQ08I2+jhKk+UHo+EidLtwnv9vltFQsWPj/N1gI7esDhjUROKDEbfOCjBH3yjyh1VhwC3+GSJOTgZ1A3XKHHAEdczKsMkeV6oKXsmQJmFpkaLY77qeEELxypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v1aTWdzr; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-351da5838fcso759401f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716661751; x=1717266551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xW2sIduJwcVHrsxOw9YEA2zdD9FyTS9ik+ZZnrTpQHE=;
        b=v1aTWdzrK9unND/yK0XVb+bWnJUvVJo//F92pGh/94mKtOWiORmNHhrl7+kJjCVWNA
         xPLYFQrXyb4l+laD455wzdrnlCEan0K/DJRpt299qjRAOWddmbxet2dLE5+4Huc1J/gH
         wVG7Wx92n7ri+ZsAqPbdYxlMEVs0NZjRWXH0oHBDj01wVYBJsSNV7MB6X5awYf8YWzKV
         WBvMC7hHgsmTdx4vwtzjYoPZZKS+9Nch+cxm+abH40ihsLbQkwFcMyuQU+CcIkciaLqU
         chJaxbuLa43XIB6btm5eVzyPpYoEpwaumRjB022V+PV7QFKj5moKcr9wOu+igDAIfprx
         aHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716661751; x=1717266551;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW2sIduJwcVHrsxOw9YEA2zdD9FyTS9ik+ZZnrTpQHE=;
        b=hZFaksRrQaIIeo+DvE8C8O3WrM8UdkjEPLfoudBz18hyGYLwgOshaK0bzxIKt5dnD3
         LHiYczzZvF/GQqdcmIX323E34nM8TA2iX8jtG4gXmYDpM3Jm5vzCTiBItPoENWpl3+hg
         XBS3s4iP19qQ6H8Lww9wTexqbFvwV+XapjpZy2f74F/wGfHZNZ5xEYpuJKXnlhck8nBy
         0PsdL5D8L58UT1KdgW1IYydVifVSWMyEXAHNdqSFLxp5+Gn9sJcxw+Rhg48iHKpDLFz4
         nHu+877Z+wiWTJHRUyGWoZAHP8HgCVRIzQ3Oq0SMIJ2IC/SQwhx1pvUX6thI+L+Gvaba
         vM8A==
X-Forwarded-Encrypted: i=1; AJvYcCWN1MbbF5Bxn3C3oE/i7qlqFAXoRPmWwZOG6d07fX5MD2m5Tr+/8dJRL0FGUUmTxmjH+s3+kPkmqdWODvOiLmzoV9TBvlKlthM1hPZEwg==
X-Gm-Message-State: AOJu0YwvNRJq12Vq6/bytSh/UY7Aleau2RL/CZJxbEDXt6n553ZZ7wvJ
	1tTgGrQFwiFrLc8q63d7GzOYeU685MFqyFrfbOlSqmK0sU11+laArMmdEWk9jOk=
X-Google-Smtp-Source: AGHT+IEcmRVgoRrKj8If9fjB5p3Ks9X/CeOQ8uNEwi5DFsH3tNn5HVGahUnpfqR9aPsvYRdH/KbsrA==
X-Received: by 2002:a05:6000:1acd:b0:357:f0b8:e701 with SMTP id ffacd0b85a97d-357f0b8e7a0mr368754f8f.61.1716661750642;
        Sat, 25 May 2024 11:29:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-357f0c88894sm453421f8f.28.2024.05.25.11.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 May 2024 11:29:09 -0700 (PDT)
Message-ID: <f817aa2a-e0b5-49ad-92c5-bfa49cea4a5e@linaro.org>
Date: Sat, 25 May 2024 20:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add reset for display
 subsystem
To: Markus Elfring <Markus.Elfring@web.de>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
 <0a362e81-1e4a-4c4b-823e-e84c6f408630@web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0a362e81-1e4a-4c4b-823e-e84c6f408630@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/05/2024 20:20, Markus Elfring wrote:
>> Add reset for display subsystem, make sure it gets
>> properly reset.
> 
> * I suggest to use occasionally more than 50 characters in lines of
>   such change descriptions.
> 
> * Please reconsider word wrapping accordingly.
> 
> * Can such information be relevant for the tag “Fixes”?

<form letter>
Feel free to ignore all comments from Markus, regardless whether the
suggestion is reasonable or not. This person is banned from LKML and
most maintainers ignore Markus' feedback, because it is just a waste of
time.
</form letter>

Best regards,
Krzysztof


