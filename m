Return-Path: <linux-arm-msm+bounces-23131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9C90DBE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 20:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFD628471C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4559915ECE3;
	Tue, 18 Jun 2024 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1CnBC4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1B15ECD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736662; cv=none; b=BMeH2TozPnVcJnj3sBU1SgC1S82MLNLavcrUhxjszIou2hvPkZN9/Uynq3Iqo0P0otDxnBUClYLMs+4puQkkla9B0hsXhAXhuHqfzGJwcM4X4HiESCC08E35GSS17IrNEDyCt273mTjYcCzEuzmbJAy7jR6s5Up6VDasXlrSirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736662; c=relaxed/simple;
	bh=NkHkzXa3IOCwA/bnH2ptoDEs9xXxwvdNDNIjWAKEBgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V64yMD64NYmAxD4Yv0IRunwZKGn1SWs70UVShSBrd+3mVec4gb+hNNL3D3nlBcube/Egwu29P7fcFtaOsUsB3QPREEwUzx6r+TVmEl7p4bkCthWxjZYWGmjbbvh4AzzyPh3MOglgYy/iKP/PgC15h1GL9H9g9oXveX1Uq8u8ADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1CnBC4l; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f236a563cso4493101f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736659; x=1719341459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=B1CnBC4lv0uxVhTJbMMGvOs0BWMpAcBioHJ2pf2C56XX4fYvC27/QDtazMbHCar/ti
         /kjpXDCVZcgA3iRYgkIaDHEEdYrP3oD+smcGm85WdlfdoaLXgUjAGnUrKbLiA8hg5P6R
         +Jl0IeOt29DLT9UrjIieWa6Z9EgT340zxob6iBgrX7g8cYxCeZ4QXOKeQZVD/eELbsq0
         cIviw/Buu7wB9o708z3WKx9xr40FCnBMjvzHg3IU8XDIPHZKkI6LU9JZzoWqJvSPaH4D
         8jdP0z9r1b1nDK32Pwa2ABEl8jjHKR0vycOf9ORWyqU5pJ5KxdY4BOTUNJcH8XxxV2AT
         OXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736659; x=1719341459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=ThKZjxI4/ebHGQxWdJmy1/aisnkdOftllUrbzQEoV7/qV79my85X6qiY7SVNfYaGnP
         bxAQYWOkJ0tDfgbY7//6yTqjtkmn28BboiYqOk8frGpU1B82cXlaPxPA22ZyFyvCEeWi
         NtXPDOEyBk8KCBLw3165EyiXEYBOjknAel3N6VitcdQckY9+j7IEi3n+mqNSDSjlp0hu
         XKvToLNtVMHANxkIkIaityVIoQwMDMwZOu+ehR0ajuLxQieJ/hwygqdSBJZdbiBpcogM
         vc3r2bbSZUPJovi1DLWynY7GIMnTlyMpCvqcBT5boMwZFWrGFt+SCkRic9MVz/vbMjkT
         V30g==
X-Forwarded-Encrypted: i=1; AJvYcCXjz87Z645ij90jBT/da+K4uxzuRY4OCsWvqGEDSxLjHs7VnyaBzKFJsjLdu454aJhcqcuxj6ymcXnV96+EYdfLBIttenWT38+0EqkJXQ==
X-Gm-Message-State: AOJu0YzOiEF2OJXdzRzN784t3dgzI46ugxdI3lMURWeWGvtYOXsEN/Ck
	DCE1NjjkofyxZwrDqqoTyJiW6zfmn6XJVxTT/8cRnUsBBhW9w/pIXvwMnrrGWcQ=
X-Google-Smtp-Source: AGHT+IEQ5dUal8MlXaC9EXR+oZ5/RpW012l22b3onGYiqW8pfuRDA//boP9uvD07m2VUMQn/ucFrhQ==
X-Received: by 2002:a05:6000:8:b0:35f:e0f:69a6 with SMTP id ffacd0b85a97d-363175b925cmr328399f8f.27.1718736658756;
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c8fbsm14732083f8f.43.2024.06.18.11.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Message-ID: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
Date: Tue, 18 Jun 2024 20:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 19:50, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>> sdm845 has "General Purpose" clocks that can be muxed to
>> SoC pins.
>>
>> Those clocks may be used as e.g. PWM sources for external peripherals.
>> Add more frequencies to the table for those clocks so it's possible
>> for arbitrary peripherals to make use of them.
>>
>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> 
> Each time I look at the table attached to the GP CLK, I feel that it's
> plain wrong. In the end the GPCLK can in theory have arbitrary value
> depending on the usecase.
> 
> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> allow more flexibility than a default clk_rcg2_ops?

If we can somehow get max m/n/d values for all possible parents, sure

Konrad

