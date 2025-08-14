Return-Path: <linux-arm-msm+bounces-69105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D176B25B94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CBC5587C64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DBD235044;
	Thu, 14 Aug 2025 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNeWby6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293A1BCA0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151643; cv=none; b=EGUjC1nCUzhZQb5YxzgCaOwCIyG+obw63geoA/z9f0isNZSnZUrD4o2BQPgiQWd18SeXEjCLj3QAWjFBe1P27PLpDgZE+k81Zi5VT7U9AWnXqN4lVn3LSfRklc8ws2ODrg1lTmqzgHAcwa4WmO6r091hvZN+fGZ7gszDXqydWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151643; c=relaxed/simple;
	bh=qd1dL4KjsD66W0eVfF0C+v/X0urvtophmCzwfogiKeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am9f1/dFcZ8iDVQ2A3bzogvNUw66kj+ivoG6JSHQQGsoABbCRSxNpErVsfffs400SZo1nNSZ32+ELj5AbQugZystofcUsbu+oWBIGAEJxVbxzDklbrnM6S6RAwBLGOkplOdzYD2/w4D70EEo2rMkutd6u3o/vZ/h5X2nghLDfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNeWby6t; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b668b52so123912a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755151640; x=1755756440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ci+IGtiZbOmlJlE3zlaa7XgorYlIQP8ww3YDEaztMAo=;
        b=QNeWby6tZiTNcWn4QZ5+kcMB9W2tFjPauRFUmL92TUKzDocZSEVWF7gCByCHPPHO58
         /ZOkya52mbmiP2BpqYp7zCKQOEC0CXIiWZnV6CAZL4XGx5uXgZaoQ9up0XdS0fVu+reI
         CR/71B8VDimrnM42pxRubrInZAvWRFPxxP8bubVMK1RAacB0zvdq36/W+7ojtr01hzJn
         4w7bp8MYG83lDa4ZOzPWBvI5Z4EU3sGBoEEq5H5fHSfWgYUJLidr7FS2dMvRUFzvxMpl
         kVjHrBpKmOzODhNlEu91RqSVsjncm5+O0MRrSnyvz0BG+l0/QFnq0XrRAT6jlZIwVMY2
         j0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755151640; x=1755756440;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci+IGtiZbOmlJlE3zlaa7XgorYlIQP8ww3YDEaztMAo=;
        b=e3VEatOJK1gJXhU4+QDxyKMerQPl7f75L3RzQwGiCFGrpBtnNfimZDjF50m7dqocTK
         YlKh0ztHUNR29Rc4yPWRMP6t0uev633MxbbF2yvSWfKtSNCmzpVC9UiYG3fYtBTEfC5O
         xpXlOVCXSfEn8lo2hDSPMZ9R0Pl6UDQ0YUCA5ejK3xUjV9cWEy8bNk71EJg5MFZUsVkB
         ++zL6gqBc0xhesxZqkZOsQndNodkiQ9GssOxTpiHOIWngo06ejmn8hI5xffjmqTtGa2H
         7pUSHVfkjaQr5wTQFUnSHGRzDUhjgIj1Vgy286EYak4E/X6+7rT2MhJdGRA13wtG3S1o
         Qk4g==
X-Gm-Message-State: AOJu0YwCr4E1YskGg4aQKbMR7tia7rEk5NFMFjWr2iGzdWy5j7Ju1IVj
	gXaCyoXL1SfDJ7f5O7fWCPoaU8ZDDcD3+hej6m1eL5RNeu5XBYQUtPx8Y/Qzrf+nffXwqdPLsj4
	iWOQb
X-Gm-Gg: ASbGnctEGd6qJ3pXaPEWKTdLryCzQh7f138Jdmr3GmwtFMCpdroy2q8kILQSJp4NtUg
	Y3d9X2kSBoYwBRA8Pop7HVyrp611VvMzHIRPTpGkRu2c6vThTkM4sHAQlMY2IIEc9XaM9DgFFZo
	XrDG1oVDrJ24vcB9qfdiJxI8dCA9Y2YaLkosTkXG2HfDR6Nx3x8VjZclo2N1tQtUZ40TdOJW+9m
	EB8AKpBGEW9wu9KrztxxTfBNe4cdIt1LtMdRtTZrZs58UwAJ73ogK+JD/y6DhGUJbKxpXVDoozt
	O5YobvNp6SpqbEUmxNGUYfTTBkcbX0fFC9sJX5LrnYcWVvNi7i+43WMFpMF7Udbv7oeZ2QS7uuK
	fU2VxjVQ3I/lnL73d71Rksq0Ll963GWc0fWMxwjhCy94=
X-Google-Smtp-Source: AGHT+IGbBKN8HHglRaoVxVrKTfsUydQbHF8nbqWbq5ui9lqBbkDlBQxwrjLsLBHPSQc6coSgkLQwdw==
X-Received: by 2002:a05:6402:2351:b0:615:cf53:cf35 with SMTP id 4fb4d7f45d1cf-6186c249fa0mr2129188a12.5.1755151640071;
        Wed, 13 Aug 2025 23:07:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6186422ff6fsm3124967a12.39.2025.08.13.23.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 23:07:19 -0700 (PDT)
Message-ID: <c4a63197-9fef-4261-a0e0-9d57e009263a@linaro.org>
Date: Thu, 14 Aug 2025 08:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] arm64: dts: qcom: x1: Disable audio codecs by default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
 <5de00c2e-2b81-42f4-ab17-6db0f1daf7ff@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <5de00c2e-2b81-42f4-ab17-6db0f1daf7ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 01:09, Konrad Dybcio wrote:
> On 8/13/25 5:58 PM, Stephan Gerhold wrote:
>> Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
>> However, they do not probe without the ADSP remoteproc, which is disabled
>> by default.
> 
> FWIW if the ADSP doesn't start, you can't really consider the platform
> working.. It just does oversees too much of the SoC to even seriously
> consider using the device without it


I agree. ADSP is supposed to come up for every or almost every platform,
because it is crucial for USB and charging.

It's true that LPASS macro codec nodes need resources from ADSP, but
still these are resources internal to the SoC. We disable nodes in DTI
which need an external resource. That's not really the case for LPASS.

Best regards,
Krzysztof

