Return-Path: <linux-arm-msm+bounces-73557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FAFB57781
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB24F1894498
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2560C1B4F09;
	Mon, 15 Sep 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jahlDWKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD2301489
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934086; cv=none; b=bJhoZT0H/Id9G4U9MZeXBibk25iGINLeHGkitUzNPptMxV7OosD1F7XofJ2JfscjvIU4+ZQoOovV2QocnKxXkQ6yJ/YNiatC6gfSzlhDOaVuCpSCSmkVG68vfv5w94hxFCZNtG3nOL7w5RsN+flfX2asGeB3yxT0qv30HMNgBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934086; c=relaxed/simple;
	bh=+xw+xFdVsHtu1zD1rilwuvSTdD7/B9mEEYjrzi4uMe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFv8S91ZlXlHIHIQt0PKqzO0bkB8qQx7eMo5CiG9VdbGzFVJtYqJrkekSsmMo65yowwG5XyAHthCyV4SpiIcBxonGZmrGJ0r9Vvjl0ZX3evRsCq/3e33LvUiNoID0Hjty3RZnpirOWx4SWgFaFVyDjBfFLMw6ElxK7KA9wpu4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jahlDWKC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso3563665e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934083; x=1758538883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8oIXqr3dPAcqClDjfphWnzGOsz2ovd6WwhHnU/sb4k=;
        b=jahlDWKC0UK/QQ2qwQCtYzJ9rX1UjOoVgcO8b4UQuENLjfDRJjFqZoDYFJ7NqDmX9/
         MBC6So+XLT7+PhyJlwnM+8xMMxXs+jRQit1LtI4nlPhdpp+NsusBYfDcxcj5C106qa00
         LBPF3h+T81XJWFjTuPX3lnDDObOgV66MzftqOWlffFxApiHknvfFdAiC5E8jITB277ry
         gImWi/AYjggLFLYALSd9UFQxFcNxqj0t+sxCdfxSAST3TSy0aAJJm5SQ2wIikCAhcbE9
         OuwKFqfbWmlaZBCv1JpqDZpNKwfR5bomt3xru1/PG6MnZpCEMoagkXqHeWaP1Ip5yI/7
         bhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934083; x=1758538883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8oIXqr3dPAcqClDjfphWnzGOsz2ovd6WwhHnU/sb4k=;
        b=xRgt6dwzQTxI+bHuSoWSA5wLtITCqfzIOkKZPLfiZ/6arorvBRL7rT7LCilDmpEgsJ
         K1LgTomTbfN8hoQ31weZwXYHBhx2CLwN5TyhOOJfLqY0sv66mgFdSwWEMs5Qfu9Owq4D
         AH1Jiv1/wCBmA3/dH5kS/lA+cxlYxN5mOF+ozLJHR7eSCPAb+k2vgnURMRS2UwWUpeeO
         /pjTBVs8bXYMIMNv1IxqHqCS77YhyKAISblaO1/XO+cj75qWQqHNgbUirfjXdb7SXsIg
         VbInAdfbBxSb6dwqRvr4ghwS9xE0mENcrqUXieZSfmtIFWl9Mu4zo2c+5XqIo64+aXNJ
         TU9g==
X-Forwarded-Encrypted: i=1; AJvYcCXOJ5bRsN2Ol2zLr4yDdo+0E8JevsSM7aGDymRs/ubRq/m80lKtXPgWgugpzyqERh2eAQNC09t/DL1nXzTe@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ3b/EWgM60T3bMSGOxaDrQHpPX1O1PMcVsHn2cz/dqNyTkB49
	V+Yba11I3GcEMz/Etn5enscv2BBMQWCmRwmI/J5GBgV1yj4YVmF0H3Ihjv6Rd/J7V2s=
X-Gm-Gg: ASbGncuWPFvptXRPBjGHOh3D7rQn35nWtB67OIrbj+gkAYO2nBSOM67A54P70pOgf+o
	q7gKtCq49aerOukP/DGHU02o0Za8KWjS9+rSZ+ozwBhdivpkQmzi66311jMvBcNTGWB+G5PRZ6j
	vTrC86MpHSJYCrrQkKWJrFjMcea+cmETxeFFwEkMrPKA8qflc51yS3uSLXGFDN9vse1kwKMB/ov
	o4uCp1tSuqmIqTps40U+QaJH8J/Fk5vmyj3r2mjQ/k92Si/Iaq2tViVfUmRLz4ejkFop2YVA25a
	K9GP+KAs3iJYD/AaPobg7IdjHmwbLZv1W3NPsfmE57G6tMhlhrtIcoS3tO9WIEDfnqK4MkB2Lqs
	xsblFLloKClQ3fv8DEwjOX+omE28U0SpyyQx0ZW1FkJHGLPZpPOxS0sIn7+cjKm0uSQCbWRKGlc
	vWbiHNsOSCTQMtKde18rA+L5n9eFXHIyXAEilNCkXG
X-Google-Smtp-Source: AGHT+IGhUiTErRJMkwIOQHIOBTtyreq7jo0zoyWEEW8wbkAfUFUJ2Pg3JyaoFNKl+Dg3YdUplJLZzg==
X-Received: by 2002:a05:600c:1547:b0:459:db69:56bd with SMTP id 5b1f17b1804b1-45f2710c252mr59087885e9.20.1757934082527;
        Mon, 15 Sep 2025 04:01:22 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607878c9sm17402678f8f.26.2025.09.15.04.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:01:21 -0700 (PDT)
Message-ID: <5cb6b6dc-e5b6-4677-93b1-daefbba56d5c@linaro.org>
Date: Mon, 15 Sep 2025 12:01:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: x1e80100-crd: Enable IRIS video
 codec
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-4-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-4-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> IRIS firmware for x1e80100-crd is already upstream in linux-firmware in the
> default path, so enable IRIS for the CRD to accelerate video decoding.
> 
> It looks like the X1P CRD might need a different IRIS firmware (possibly
> even changes in the Linux kernel driver), so keep it local to the X1E CRD
> for now.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 976b8e44b5763b2d6c0f4786bf5809fee29dcecc..dfc378e1a056a8af27ef4b646f7589e7198dbaf8 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -16,3 +16,7 @@ / {
>   &gpu_zap_shader {
>   	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
>   };
> +
> +&iris {
> +	status = "okay";
> +};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

