Return-Path: <linux-arm-msm+bounces-18907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA38B6E7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 11:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F050D1C21DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731E9129A6A;
	Tue, 30 Apr 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHDkqV55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BA12A145
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469736; cv=none; b=tlKz+011k3BydHsp22NYiLx3v83eXIPPSoMC2cKxweaEDGwBe+AZNEJSafuHVglEWuVZFrGJfAHvGzZQeIrIEUb9pawQAAJYH/tEV0N6laqqxpuzkOvZdTWDmwYMC7BeHJJZrCgj8ApreUU8soOjhqMqGTKwM/hGH42NlSCCkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469736; c=relaxed/simple;
	bh=33Rf/Q4mTFg6RFxJXUQRTedJL85dYQMlT1EZbJvAyVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnHB3rUYYuSiO5j6kXnDGTvxvQff9sFaovIqf4YJaprC8EsV1TIdYpwpQQ9oFBOiWYlthddkwwf8UvfDD8xbqvmuZXNaG88gTXM3r2kRQ1l0vme6w1LC9x/YzNQCKbNBm0yhlsfE6SUtdozuq/my71lRBasvbkoXiA/X7+qInxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHDkqV55; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a52223e004dso586770566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714469733; x=1715074533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UFWY8WyxTQuDSnMUxmwZ+xKlaTZIMKhbGsma4qMFXW8=;
        b=bHDkqV55PyBCYx/QxZhEUcAUxgwdzHHetlA4TPbR6Fii1Y5OaFlxP+t9RX6hFrBgcm
         gVTSplINKK0v+NfrErDXFKm3ExFp+SSe7qb6GRcw48i8A3D1OtH03QNbU5hspZYux9xi
         BHQke0lpErVNrYEa+zdS8cp/sDgK0TdyUqTaYWM90iF9bZoIiekEkaPmtmi3wNYFbfh/
         6323bNaPbzrYZQIxjPIMjF0oeBMdIcW7B+UqlmenvPwhkctCuhosc5i6Hm5cRYbeKaS7
         0kVpD5TqnS8kUAeUMJe1jDLJX6uq0j7y0JyiXv8fw3NgSveM5CzhkKVGcoDbewhzUGhG
         UN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469733; x=1715074533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFWY8WyxTQuDSnMUxmwZ+xKlaTZIMKhbGsma4qMFXW8=;
        b=ZO1qT5SLnLI2oiIjLwaz59nW+jz8sO9tZDTgrjVQSnZP9Mf8otUj4m6QQwzRLAm8Xg
         BAQJjchmjf9snf5JFhw0u0wWoP/eIIWw4cP14EzT0vF8qOIUKaUZ6b1fcr+o9cpmmMTN
         +6uTo2evNkMHzS6c27p6YoF05dKvOedApMPyxzd3tBEy2nCld+zOEaWIqdE2dRNFSNj7
         CcVgxejFE6+CpznnLA+h0lXRvWh+LeEWIsWqF3zSKD6NDjT9s131d3b0KTxcGBFbXc4P
         +HK4sADvo/u7FY1Pfq0IvX+zvhec6TCZGnbhSsYQ8ai66Lw++IE6Be8qzHhZ3w2YA5+2
         Lmmg==
X-Gm-Message-State: AOJu0YwDmh+kixNa2LJT80Woy5dHzlNi7b/atx1mpMsElJwTQK0beIO5
	WI8SyhVFZAPwi4zd9Jvm3oBAE01FNKAPAzDUkZg8jEPh/Av1HXsAeTdFXW3Tfo4=
X-Google-Smtp-Source: AGHT+IG1AH7I+HN1ff1RTyjmdhQI2nui45/MDH9/Lx8G8pFfSo/PlCQvFpcRssVrUHwbIiZCOGLo5g==
X-Received: by 2002:a17:906:f9d9:b0:a58:7c50:84e4 with SMTP id lj25-20020a170906f9d900b00a587c5084e4mr11494276ejb.2.1714469732805;
        Tue, 30 Apr 2024 02:35:32 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm14810742ejb.8.2024.04.30.02.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 02:35:32 -0700 (PDT)
Message-ID: <cff7a9b5-9df1-46cd-82ef-83001d446e0a@linaro.org>
Date: Tue, 30 Apr 2024 11:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] arm64: dts: qcom: sm8650: move USB graph to the SoC
 dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-5-87c341b55cdf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240429-usb-link-dtsi-v1-5-87c341b55cdf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 2:43 PM, Dmitry Baryshkov wrote:
> Move the graph connection between USB host, USB SS PHY and DP port to
> the SoC dtsi file. They are linked in hardware in this way.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

