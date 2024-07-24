Return-Path: <linux-arm-msm+bounces-26980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817DE93B655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 19:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A532DB21D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 17:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E71215F409;
	Wed, 24 Jul 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="qLljPGvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5502E639
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721843967; cv=none; b=WXQZO2ki09hIv+ppuETmP6ftFwTi2XtjyG7ioah0pDyoUCnJ8C8U7BK/3WVRKHZefCFBTjGglJWB1C2aNJ/yJtjpKo0yfYTfKs3KxM9hfp6UK6jc12XDFLtRsmN7P+P1h2PUaNjetMp8yZgMlfVUIPhwmGB9MtmYX2cX4WWvr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721843967; c=relaxed/simple;
	bh=WtAPgXVP/j0nWz8Ui8mgHJah+Yb50ePWbM4ijI8nTn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWop6i+DxBRoShpYOisOJ4sn9Q+ztzqRfFpLt9dvyxwiXyAHX1edybHASpMRu9ceS6ApVJrmi1N7z8CwzZX+cuup9Z+0Q1iBq9pvth3eGQ2AxJsKmJMS16v9lYqr7Mr3EgK29qUc/H+fQVoSJDg1VO61/LvhpeuTzFqjlghrqv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=qLljPGvq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428035c0bb2so1081765e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721843963; x=1722448763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bB2QAOI7VV4nz4PEqDaYS/ujHUAYYtna7nIFDg5mVV8=;
        b=qLljPGvqS4Tdu3MRNK6mlgZ2ES3/3+GOaC0YzzIZ7W34rxiaTuKKnjDbDBWpduHmiU
         6rKfRBHUixG1Qu8wfTyBjsMEvZALZERagMLH2UQjRfLpLtY5wsSq0017dmuRUwjWwGOY
         DLATqlFLNIu9uS6RCfaRt3FyzqtC4eCXIkW2zbpSsBp9xY+3NfRA5LYUCC5JLHvz2M1C
         ioNfTo50IhfnX4kvTZEhwchCYQgw7JcYdvzo1K9w/hQb/WzD3Urhp7y2qdiYCGUpMR+6
         4iLV6wKxUuUbziLQ2T4JCgJPgmBXCzBDjCk/AvXQJFHnGFaGbAURvIDhfXX+iwbtQvSW
         p+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721843963; x=1722448763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bB2QAOI7VV4nz4PEqDaYS/ujHUAYYtna7nIFDg5mVV8=;
        b=RnDe2OMXXjGW9Vhp+myi3AXOMnADDKa816H71prS5kLEa/4tgFlu8gvdzxOpZyQjIt
         lOimtqGIhez1Wgo8U+EggGeIcZ83L2MUJmDNW6rrL6kLDffGmAU1UHjV9v27yXlRaiK4
         Py6/oPyGgbsULnLzCwxT4ZUHA5lMLRIoVT+qv/j1Y3dIIekPy1rtwebk0h6IQM7zTodV
         iuozFHh+RTKotpeSp5pDF7audz6BjzfX6NH6U53+tOnx/Dsx6Lnn35ym36FB4Z8C2WxJ
         uF/JwiJSmSklUixT/9iWs97LEURz59gKovAKjffF5LrE0BLP5N0RlEDlPrE1+lUHSf5p
         RjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsf6UMD7Jabl1o7Pgyc0ocBmcY6XjMtpkYuMqAV8CIChWRag2muAyCUtZ2dfKcdeyXZ9PgCx7v/2H/emCLUL52V/6Bogiv8uiHibpzQ==
X-Gm-Message-State: AOJu0YzG6k8gVjzGu5QRRJ99Uis+RJZRORyilmInMy4Uof7Q30ljFmGA
	fyaAMwVOlw7j35YVmOXrMQ6mpx0Wkbs2Ub8lDiIIjGXbijCBtnu5bcWO2xvW2d8=
X-Google-Smtp-Source: AGHT+IFYzshvY6vOeAFXLV3Aba9jnBfSJVOk5zJI9cgMfhJjkemmfOUrnmKShd36XZ2Mek+kPAuwhQ==
X-Received: by 2002:adf:e001:0:b0:368:6bb:f79e with SMTP id ffacd0b85a97d-36b31b3092dmr333633f8f.4.1721843962600;
        Wed, 24 Jul 2024 10:59:22 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8? ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787eda2fsm15265721f8f.108.2024.07.24.10.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 10:59:22 -0700 (PDT)
Message-ID: <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
Date: Wed, 24 Jul 2024 19:59:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240715-stirring-purple-toad-7de58c@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2024 16:40, Maxime Ripard wrote:
> On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>
>>> The i2c register access (and the whole behaviour of the device) is
>>> constrained on the I2C_EN pin status, and you can't read it from the
>>> device, so it's also something we need to have in the DT.
>>
>> I think the purpose of the I2C_EN pin might have been misunderstood.
>>
>> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
> 
> Toggled, probably not. Connected to a GPIO and the kernel has to assert
> a level at boot, I've seen worse hardware design already.
> 
>> I2C_EN is a layout-time setting, decided by a board manufacturer:
>>
>> - If the TDP158 is fully configured once-and-for-all at layout-time,
>> then no I2C bus is required, and I2C_EN is pulled down forever.
>>
>> - If the board manufacturer wants to keep open the possibility
>> to adjust some parameters at run-time, then they must connect
>> the device to an I2C bus, and I2C_EN is pulled up forever.
> 
> How do you express both cases in your current binding?

It's not that I'm ignoring your question.

It's that I don't understand what you're asking.

SITUATION 1
tdp158 is pin strapped.
Device node is child of root node.
Properties in proposed binding are valid (regulators and power-on pin)
Can be supported via module_platform_driver.

SITUATION 2
tdp158 is sitting on I2C bus.
Device node is child of i2c bus node.
(robh said missing reg prop would be flagged by the compiler)
Properties in proposed binding are valid (regulators and power-on pin)
Supported via module_i2c_driver.


If some settings-specific properties are added later, like skew,
they would only be valid for the I2C programmable mode, obviously.

Regards


