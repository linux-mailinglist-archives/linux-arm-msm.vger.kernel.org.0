Return-Path: <linux-arm-msm+bounces-42414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B909F3DAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C1A16980C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8851D89F8;
	Mon, 16 Dec 2024 22:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGSMpGgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688E1D88D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 22:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388918; cv=none; b=tT2Wn+yOx179DAqNiWzZHhm5dwhoRnpPCruP+27E8PQYFYrqOxiiAVeBWlwz7jDKM772m+tI8JuxrG9M2KwR4xyRWko0uHdoVJ/snpas7Re6DCcIyzZqhr5aYDhzWA0H53CG/DU9P2pVjyTk9tCBS3gmrXVjPCy3EYW/Wg4Qm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388918; c=relaxed/simple;
	bh=VvwhMEH8kUe66+qw0Kg+jfPOcaLaStC6shKRZDsBkeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+TlkeCCme9cr/Gas9x7czt0sR0SkDXwIM1vvSYZaqdqJ6TbdA5mu+BYJBzU8gGKO8pJ7pI+kWQ8rVmKqzJ9zNlrqCy11ncoDWNYQyfO5myGzYvU9POsY3bvwsN68jf3fBZXfeT2bYvBzOSmyOJ7lXyshXgHiJvPt7w59mO6tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGSMpGgc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2259204f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734388915; x=1734993715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=OGSMpGgchuPODsKfOcoonTqeww+nA1zSDPN/yel6xCPgB2tT+DXNsxgJDxs5pYK/7V
         6dhcCdQgyiMfuT4Nu0V1DhaMZ6G3qRLyba7UIVb/4CnKxWK18n0uoZX5hZQjS47e+vz0
         092iPrVRGdATGWis7PimB6e1wdRAQ1AY2yvLbtVDbpWNgVDf4Yo6I54bIEZH1fiQrYch
         uFn1RiTTyMnJcxeNC/TLN+KeTHXT01ma8pW2vLnHg3mAhk0rTKYuJUE5pysoa1tkq5jI
         WAElUgck1HUnYxYSlSNDR5VwIiV7inxgR9mgxmyOSK8vRWMFCAn64MsOoxpr2MgtWlzj
         jC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388915; x=1734993715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=NQ2dFwbLhSOIhLFsjhTF0aCmR0LcNFBm3TOlmHEZF0dQCPjV2olCWGO83siglSZeKl
         Nu2wb3sbpvVVlYZpSH7FeNHEjasXjZMCFz3XF4czXHXsC89Qnvd1r2zHiCk4M/2ICOnj
         LlDNA0jDt7HuZ+vzN1h7gTyqLB4N8E2WuheCq4V2Q6bqdFhTqt0j+RI4wdcvyQ3Dlm0R
         l5i+UDtfDTrg7ttN0dKwsoc0euYxLzWhLsphxt5SitZpFEQTPouz4yxb4UMLjsjB0F9J
         Aqmh++XkW2Fir7LbAfj1amV2amekLAzmzqSlg0XaESYL5j/PKivyLKStBDadAn3CyVZQ
         07Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXoFX+zC60TVI5mAsTT5l5Y4GUY61UYMMr52s4I1JH/cvVF/haywRkm8OMRAMNWHtGmJ/3Oovqfyx62epmO@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp1k/qDO589oj00d5keIV3hxaS7zokb4u8uXuC57Li4ZOvZhh
	vF8beT9zl1Jzo5a0zd+Q3a5Fg13pcn+BnbnDNNNxActBoxWkTtb1akmzMnhF2w4=
X-Gm-Gg: ASbGnculJpqmBCINFo5B1IwWms+hGiq2xf3uHyHiZMm9FBUtM5GAXVPKH0Orh1drXFl
	8vbOMlXGC8fGuk+w9R1GX4cQqHls3cjpHez1w+kJgPQAqoOtCoE3q13MWgdnU9bzl3wkPfHXbA+
	l4uDPviOFh/xCaUsdzrR1jevAz5jrbFoW/7YJi3UZ2S2nfpE+ezxDsIraK97A+14CUfs7apEe27
	hovdL54BHngldHEJqT9ei0nfED6rDBeKmwWlcBJRpLEF9+CkdX7Z+IvbjT0LcbftmQTUQ==
X-Google-Smtp-Source: AGHT+IERxSebFar5uEuhs3YGXdu/HdonjGhSKASUlK+LCSz+kd4iODulYlgl5ClEwq5A1hDOA8kHew==
X-Received: by 2002:a5d:47a7:0:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-3888e0ae608mr11291437f8f.27.1734388915425;
        Mon, 16 Dec 2024 14:41:55 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8047151sm9190330f8f.66.2024.12.16.14.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:41:54 -0800 (PST)
Message-ID: <56f606b8-35cc-4bbd-af39-106277530928@linaro.org>
Date: Mon, 16 Dec 2024 22:41:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241216223019.70155-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 22:30, Richard Acayan wrote:
>   .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
>   drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++
>   2 files changed, 227 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index f8701a8d27fe..892412fb68a9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -31,21 +31,6 @@ properties:
>         - const: vfe1
>         - const: vfe_lite
>   
> -  interrupts:
> -    maxItems: 9

I think you've had an error squashing some patches.

---
bod

