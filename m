Return-Path: <linux-arm-msm+bounces-9351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75057845D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 17:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E027228EEBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 16:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115E7626BE;
	Thu,  1 Feb 2024 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyPU7UJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189B5A4CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804284; cv=none; b=CwtX7blITNYkdrEDkwzmIHTh+34tK6SYddF7uiV+RxlnY05Mnv7RNbxyYu6RA13lyLphoyG9GSzlARyvt+Pi94lyosG9URaQFFbdBrM73CxpkjK6NpEKumwZAiAYq/sgTzZqeyGbI+62aIYGwQAgvy5Ws3vwcYeE6CAe/YrJZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804284; c=relaxed/simple;
	bh=LLOy43o1IKCG6lvcpGk5S6aOFaUkVbKs6qG52qJmO78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ym5xfBt1BS+tMC/6TwPPVaWKb9ZWMeCugnnPpTZvV7Wfg4s9m2sxbWqzDtfSAxUrchHAUjSpFdUTIsrgTV79ea0rOWQkAkiKhyIhEuIQIhkk+o/AVI3EOeItTD3gdJbCsQNjTk8ZPRhiZe3SuwrZUCiwlJ8yR9wy4sdCjDsp6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyPU7UJY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a26fa294e56so156427366b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706804280; x=1707409080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3dj/H1IuBU23vrL194BpUJdj9lzyvxpzTsVz86zBCU=;
        b=EyPU7UJYOawXMF2AFtKCBmyiHYn4OH9VjTCT1eu8t7oIB9YraoawOvr4tK3CSN0wxL
         Mw5uVN8KRmA4PXGpQjFRtLhhaqR7kKLg7+pF+fBQHTsb69gSmADl8Y4FtuVU16tEnGhf
         rpLCYXNojhzhU4yOPLAxGE9bpVKoWxrc+Of/qF3yBub0raCXjL2JUBVC/qwUNmRSQSYQ
         yoWKX2JziUi/nolAUpFXZPvGkkIWciDpJLgYvFZqYm9kin/wQ/ndXZ5RjQnTzYlAUikl
         kgjKTfq524QC+gYfRZ3g13I8RjuEpLhq4zSTMrmqRXkqAL2feiNAbQtaxD3nVVQapOKi
         27zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804280; x=1707409080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3dj/H1IuBU23vrL194BpUJdj9lzyvxpzTsVz86zBCU=;
        b=xQNIqOk53clkjpTjAvOesmT+O4wg4w1rgpOfNmY+5AavSRFlZiFPig+MWN04/6KLFb
         9jZY4YFVmXED7ozbnDQYlBzsiavx+XYXhz/q953Y+T10EUwmGBzlMK7voQyAdr2DJDSf
         eO+oVO87Tz9131M1vde5AELMAR/MY/Jk8Njtz9JC8F1fmQxTEjx4XSjLcdG9Ms6qv/+f
         Hb3Uv/0B/5sBBRYqAqhSN8tev/v5YTy5Q3lNSC6GMDT49hRWOiyoBZLvWujjUNDKF/r+
         Z/ZyeYwVU/tQR9LkRWpsMOfhbKyE3ke2gRstO2IuwFoRF0vdKskR1pYGaVNshacoxjfg
         IRew==
X-Gm-Message-State: AOJu0YxTr22k7jYbj9PGySHwhO7dLM2uOj8be7dCmhERy/yf9c0jw+rB
	OMU5mh0rg6pybd0ZBba+Zzw0FlKPDxRMCZRoqAgWdCHEiLeQor5B1O4pdW7XJ2E=
X-Google-Smtp-Source: AGHT+IEYvJqZb1In/kLaJuq+/tYpmMzUsu/MNaRYV6cfRbNXTMjyyuH7W1tEcWRgd75fB+AJHmzpBg==
X-Received: by 2002:a17:906:5290:b0:a23:6dd6:7eed with SMTP id c16-20020a170906529000b00a236dd67eedmr3564079ejm.77.1706804280457;
        Thu, 01 Feb 2024 08:18:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMybzPVIsgrOy64dExcvFPNIe0BTTFZJIrvrf+yk2Y2uybcN3RBrEVl82+dKOZ9apcXNM52Vw+wSu2fTH2kTWYKdsfN8S+9eKK9Qxc4y9f/Ha0Si1gq1rUH969ggXAcKwbFgL9IWGFdzxrWkYYxfTn2IJJgjizaJzIuPF6D8ZUcWCzb0JFQMgTooqzbGq/p2Mn4CgaNySgAvtbVmZfb7QJrFl/5+8joBVmcLFH/MxP46fXBrVfD0D0bP46iANOS+XB0VyjFseoN+ObtmxuSqcx+hx4gTY6a9s4jvnL/eE6kZQepkXoF9bDq/gs/H/dAGErR3mNt5nIUy5zO6EuGkGOwWuwxhUMnWMIRbnPO3dMB2GxvdT/tzbHFl7bD+5puJEE0wI20Fm5hb5Ebcxmg0asykrxFuwtlkoHBM/7X8SE4sg=
Received: from [192.168.159.104] (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
        by smtp.gmail.com with ESMTPSA id e12-20020a170906044c00b00a35aaa70875sm4788419eja.42.2024.02.01.08.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 08:18:00 -0800 (PST)
Message-ID: <bfe5effd-0ad4-4c72-b986-e1a02599fe00@linaro.org>
Date: Thu, 1 Feb 2024 17:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
 <20240130-pm4125-typec-v1-4-e8d0097e2991@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130-pm4125-typec-v1-4-e8d0097e2991@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 20:42, Dmitry Baryshkov wrote:
> Plug in USB-C related bits and pieces to enable USB role switching and
> USB-C orientation handling for the Qualcomm RB1 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

