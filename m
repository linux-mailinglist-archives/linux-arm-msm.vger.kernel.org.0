Return-Path: <linux-arm-msm+bounces-16879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808989D5CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 11:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4951F232C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 09:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0455380024;
	Tue,  9 Apr 2024 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXZnQXLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7E7FBC2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655939; cv=none; b=X+qrlJoDSSfyVxx9qEDUqZ6qi2yLpu4k04/T8TWZsP/nd5QpX2rEPRInGnBjpEDYv4lHSCQaf55yxDm4hAEBCFgkB+VJM9JQBe8EEYXDaxKGMkCNS7nvAkQ516W3dpba+Uy1LqlJj/IEWnM9GKjmsFkMlm4VSAptYQlEzlsjNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655939; c=relaxed/simple;
	bh=vXHPhWoqvDe9SoBoLnbihQeKn1FbJdKLOtbiMVbqAbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jrm6M9GPatPs+I29DPSVajd8TRp6cNYxS6F6qU3jOJhU4exsqA0xgbL3uX370UsBrsx9R3naj9nqFV6j1XFa9P5dsY12Cl14RX4sC/WvOCWoHOxUP1S3Ufd0Xsa9NWdtJIYIL4h0WSIUw+nGG82Qq++nPXhNQnyULlRTSR1a3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXZnQXLy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516c403c2e4so4632316e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712655936; x=1713260736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJVBzSjAv8j+mAl0LlHvG0rXd1n1n6iiW2X1MSaq45c=;
        b=MXZnQXLygJIljcY1B7fe//uaAhDX0iiCAR6HVLcQ1hYUcOquXT+UJRX/Uv6AaS1hHS
         fqwcS9CVw58t8VXEIsd/Gm1vkbePpHtuxr9L+7vhVInUvVPJmL8GDB3zquJdFPQCtmyF
         XW7WxQFXF3WLgQAKOBl7gT0F2e+T9ugKgXWA8flVohrgkVVeHQ1TB7+g0cICHkWOagai
         BK6xPiMWTbISZQ7dH2XuFnvlqxQLnwFQX2B1l5kj8LJiCVno8dVzdYxOgXLz30pty+c+
         v/2Jkxz1k+lWsFyiLiLoOwi1IDJjAzzqIg1kjXqI77y8yPmBrnbPpxWz4Y7ysHSN9IaK
         AQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655936; x=1713260736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJVBzSjAv8j+mAl0LlHvG0rXd1n1n6iiW2X1MSaq45c=;
        b=F+yIRcO4ub+LIuNzMG3mWQv10gYRzag4V0b6ES/wkfJIzLjShEvSzuhyWM4UjP7vcC
         7oqmZABMRnIBvMptU/qfaT153EwD3PCSlFsHMCvjFPnujE4vI31pKU05IkPXjmyLUG15
         fUw/AIFMCJjFXR35lGIpZamZDKVN38O9WSvXPQzn97azNwU6+3aTfRORgSR7qckNzam+
         +IEyUo2WCNliBKL1XA3UeMNWvTrVAq/h2TBbkslTsSrSaBuLfOklgbD4RCNXkKF0krCq
         D4eCEA7uwh3AMErblTGpPzXFBs2Jg6QKI1/5AqtgbLhwmEMiKkXyDKlXZwWF8CbRrX/6
         Zx3Q==
X-Gm-Message-State: AOJu0Ywr5rzGrJxpev791/RfbccJZVuYCVXQD38NezzIUBdDYTi8R/oc
	xA26xh5PkXKJvva3kwwVOcxsQG/TKrFaFIQ3Rug1ACCFZaPpaXE8fcnV2di2Bso=
X-Google-Smtp-Source: AGHT+IFVQw3hTm/r82e57pPJEd//3j8umE7yW8hXMf5w/xNKd9bHXRunOWLW2qOur1/VjZnoHstVkw==
X-Received: by 2002:a05:6512:488d:b0:516:d24a:3d71 with SMTP id eq13-20020a056512488d00b00516d24a3d71mr689091lfb.11.1712655936555;
        Tue, 09 Apr 2024 02:45:36 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s17-20020a195e11000000b00515d4f70b69sm1504520lfb.98.2024.04.09.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 02:45:36 -0700 (PDT)
Message-ID: <0520fc7a-d94c-4204-9c4c-070de1b75be0@linaro.org>
Date: Tue, 9 Apr 2024 11:45:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Add device tree for Motorola Moto
 G4 Play (harpia)
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ruby Iris Juric <ruby@srxl.me>,
 Stephan Gerhold <stephan@gerhold.net>
References: <20240405-msm8916-moto-init-v1-0-502b58176d34@trvn.ru>
 <20240405-msm8916-moto-init-v1-2-502b58176d34@trvn.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240405-msm8916-moto-init-v1-2-502b58176d34@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/24 16:06, Nikita Travkin wrote:
> From: Ruby Iris Juric <ruby@srxl.me>
> 
> Motorola Moto G4 Play is an msm8916 based smartphone.
> 
> Supported features:
> 
> - eMMC and SD;
> - Buttons;
> - Touchscreen;
> - USB;
> - Fuel Gauge;
> - Sound;
> - Accelerometer.
> 
> msm8916 Moto devices share significant portion of the design so the
> common parts are separated into a common dtsi.
> 
> Signed-off-by: Ruby Iris Juric <ruby@srxl.me>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Nikita: Split up to common dtsi]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

