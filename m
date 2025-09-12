Return-Path: <linux-arm-msm+bounces-73299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F40B549A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E54B1CC70D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2662E1F13;
	Fri, 12 Sep 2025 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGV6b3uS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA52E03FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672668; cv=none; b=TOcMcG4ng8FilwshYI744OTnIrwaybjZM+kvtf5aJWS7dp/h3ZyrBMGqDVn/7U/vm/lF7QCW3EJ3NOpq9Y1b18Ym+2fMays2PEMoyysEO3u6cLE/13wWSkKUsD8YGoWx0qLkQ46nrBzDZ0eVburLPvmOowuFTELdfKz4zxUtEgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672668; c=relaxed/simple;
	bh=Cm8AGHoNs36CjaW+QUDCUcm8hiYODo7Px0m6IAy/mIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHQXeSR4l2VhFhunwD08of+IEOGDs58E+fBY1sUbtYax640FI05JmK0D1wFSMx0RD8x22unOBVAeNN7vztwA84lrA029kdSFXFpLZhEqwXiKcOQv18ISqiuRaMPSFcGU6N/fJM8PkPJb+pX8DxYSH9eNJTa5zz768US5Q+g3jkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGV6b3uS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb5492350so12990185e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672665; x=1758277465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbUxpX3q5xMx08x814zZfnZ8avY034qyNif3tjChLWI=;
        b=uGV6b3uSYjVsnktHEu/Z+m5lnDCML4npfK9sFg2e68L7YmU56GAu9eQnKC1PKiYMQR
         tulHSZQBp225hwnkwepIiICXs2l5wgiFXLnB6hJ5exTERtYvMPWtLgnLLSjcFcWyEtgX
         7N1NC2bSP7sqgnLy42157Y6TBDiFb9f8x3tAE2tVHoEVFXyVBnxEQD0NxLrqbUg3zbfs
         jwYn3mq6TqVhoUJVijxyPWHSxlKtXKZMIjwucCa2XcIryn8hDuEq9JcDLvorWN9NtS6a
         yuCHX8ZZYMq1iK4SY01Z2OY+T7cWCeEMYM9kZRwllqSDWAHAdBcF5AYbydh1D1HcgIl5
         1pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672665; x=1758277465;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbUxpX3q5xMx08x814zZfnZ8avY034qyNif3tjChLWI=;
        b=SBLDJWuP1yOgmjm68HwqYksz6QL8eexxbZ5Wv3Pr1q3vODFadBJ7FABzXQGGYsM0dm
         0nR7ICoB/SNJ06zAa1pR2I8Kuv+r8BQiMCPGIp55mYnKTNh3nleo2NLGFKZ0GOs25gEt
         +zj82GwGf3DYHNoGBYp0jVvozhFpCNgnFQfeoizbC2IzeqDrcOjgbyY+uLwWoNpjst6Y
         xUuJXudGwJapdTjiONxeL+tZsq0r/cNXf+krRY+XWBKoEAyaivmtzunSsx6UX+EgCMnF
         V1D37mpkVSZaAxzv3q5ct4jiX8QFWr7qBkz5zjN17ddzvTC/m7j58dYLkqelsOEAGH3+
         gzdw==
X-Forwarded-Encrypted: i=1; AJvYcCVlXnTsKWy6On3gswF/4O0uioMyR/wE9QzLI/g0TVGP67CngaQlxBrkWvNMctYuq0VfuCR6wzRUYD1R1G3l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+eWEUgjW9htBigUQFFyND6wWbDXvll/73SGa/0aHQP5UuEk4
	kzFyjb4Y1hzThfKGrNRrmrl4otcrtyrDrphLbA67bVZZwqKgaB1F/azThL4lb0a8Yrc=
X-Gm-Gg: ASbGncvoTP0t4UoyMiav7CwJbcHLOSYpMniIojSYwvslAQBGVpQSszWL/tyWF7QF/Vf
	zIytbxKNvpHSL8xp0cljAdGgrBAsbSRa/QOWQqjsgmpfcsx49wUMoasrPFNT9NzHL/77R89XQEh
	i/E8rnxY+Asv5AkiLFWXENGDjk6iC1LSXJ0uEt1NC1HdPgqnZoia0IQ1mGMu3XCPCun0WFvNu/I
	FyyyIKWdfwi0JMYobtfe7Vgggo7zoHZv/+ahgjOzLzOh51WnPrw03DUhAg4jrujDLbqWBrN9FOW
	8geJnhFuWhPUmzGQ8kV1V0TXtR8VCurkmHbfsmX5P6aglGbn4ZuBTxtus4/TY4HPtdEk4Q6Y5yy
	892Ssd/QunSrbdffoM2gywfd6L1Lk0opHIKfzzOaG1d4tIHBJ4ByGpH5/HJYQjMp8bJuyNsskGI
	bJoT/qHrWBmGf5bRvozQs+3fQPG72JFw==
X-Google-Smtp-Source: AGHT+IEj7jfi5/gecFugEbT7EKtx3fH+ixZKBaAEuJdWl25+AesrKJ8jqjGjd6JOh+4mHUsSSjYdYg==
X-Received: by 2002:a05:600c:19c9:b0:45d:d291:5dc1 with SMTP id 5b1f17b1804b1-45f211da6aamr23950765e9.15.1757672665252;
        Fri, 12 Sep 2025 03:24:25 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607e1232sm6059022f8f.56.2025.09.12.03.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:24:24 -0700 (PDT)
Message-ID: <980b7247-e8a5-40bd-ba20-c9c72c8a397a@linaro.org>
Date: Fri, 12 Sep 2025 11:24:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <rPv92n3EVkoRrO1v7nlw_tPMn-nHUhpYhQP_FjmQsESL752mly20FWQqPHLs8JHGC4mklm9wfPABc5kd-x4LYg==@protonmail.internalid>
 <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 19:38, Stephan Gerhold wrote:
> Add the necessary definitions to enable the IRIS video codec for
> accelerated video decoding on the X1E CRD and Lenovo ThinkPad T14s. The
> additions are largely copied as-is from sm8550.dtsi with some minor changes
> necessary for X1E.
> 
> The PAS interface used to boot the IRIS firmware is not functional in EL2.
> The code to start it without using PAS exists already in the Venus driver,
> but was not ported over to IRIS yet. Discussions how to model the
> video-firmware IOMMU are still ongoing, so disable IRIS in x1-el2.dtso for
> now to avoid regressions when running in EL2.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (4):
>        arm64: dts: qcom: x1e80100: Add IRIS video codec
>        arm64: dts: qcom: x1-el2: Disable IRIS for now
>        arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
>        arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS
> 
>   arch/arm64/boot/dts/qcom/x1-el2.dtso               |  5 ++
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  5 ++
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  4 +
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 87 ++++++++++++++++++++++
>   4 files changed, 101 insertions(+)
> ---
> base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> change-id: 20250909-x1e-iris-dt-eb0494a130ca
> 
> Best regards,
> --
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> 

Could you please include the Dell Thena variants in v2 ?

---
bod

