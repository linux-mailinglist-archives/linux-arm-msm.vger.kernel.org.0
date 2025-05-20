Return-Path: <linux-arm-msm+bounces-58784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDDABE3BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 823351BC2523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E741FFC54;
	Tue, 20 May 2025 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMsYIeeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE4211710
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769437; cv=none; b=B5upotVqeGlUoWE3XxefBcKK83yqfD5W/fQ/3Ht3QAZIXk7O5IdbOiHxNgeQSAKolPv6DxDtd1CBclOn8/iDo6aeOYq+sK/11/ssuhWdWSh9DWvy3nzvez4h11Eme/EqDR77koOm9PlKANC54lBa6g1gQ4Wx+DK+lb8/NrH3PB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769437; c=relaxed/simple;
	bh=x6AxyMhQqdGqFN1K69xSDMF+wdj9jfMXh15jVfyPOFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9bZH4guRcCV2eCzS/FEyIZmDcelET7kJrHt7c4OFPg9Ath6cHqM0BUhuw7KXnvSBh6MFdV6PCdgNtLtlRoRZIf2MkB+wQNLxijNedwEResJwhUPTFfi4nTolCphk5CMIgxcnDIfOPZH/YsI//kmdFrBA7ninSd1T3EYi6a4EOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMsYIeeb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550ed4a6374so538936e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747769432; x=1748374232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=nMsYIeeblcIh1Ony7Af43AZXWN6eYaHh5VwH3oLBkQE+/DK/4l8STejhdEvja6AeL9
         HWP9vPQG/6JWMuK5+1tL6JngchNJcDZMtXCN6/OnRKK+NHbUTr3E9b3csIA038npQX6k
         g2NK3c2YuZAmB4zCSC5hwJT0SB4Utl1EV32/im33TRGIBjXGzPv4aaMV+bSiPU0Y1HPr
         AjVW9vT57Z7H6KgELx2bp0HqFJtQ0/fM1CmIceOpnWmZlcvszOCgxXjMynQmiasz/II3
         hi/cAyXLi5DsSrnoLvV9c6hbhqp8Nmq85cnt6au7RkVz0rtQU/UJdHzEj+9d0lZJdXH2
         ksVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769432; x=1748374232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=kS1lFc049TlBVO2/bXRH+98AYpN9KDA7Q9THFTGBXbRA825dbWJYqOUaZlar1ehPtl
         DYvqbrmQxK2YCu4PReIl1BaQHaESGdH8kgLgZ0PnV2oOZx5+YshIf6U91qWw9i1An+Fg
         9pagAh939M/CVYyE801BAanzD6Dx3GO4fqasMc/ffUf+Y0lddXzFhOz3swkBpONsAGgw
         873UfJ+Lgct/xeJU3/2yX6gJfBRnYLRkfvD5VgvW35p/norlBZ2ded4XoJvXcN9GACIs
         NfLreRAn6sGFkJUQ2hGwLbUiAA2yVltwNSP1j2rBObpXOkPdFnVG/KYVy5Bhwj/Kxo/7
         VDrA==
X-Forwarded-Encrypted: i=1; AJvYcCXhojyNxXKRu/gutK9n9ByqRF+EzXTypTY9Y6cB5fV7H3JNgtSgC/Kqs3hwEfDycXoptlbtTQg3lvW8EjOx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/d0w6Pqz2FM16Wgk4I3HAWdZMByew4nyvPR76Tf5cIeo0AOyU
	WQ1nG27w7gbzGttLlCQtqP4tx0o6PfR/Cvd+vT9x1VDXnHtRWqUbu+Kzf0opaDKa40QmqeHNGn1
	UXJ5O
X-Gm-Gg: ASbGncuZudItO+e1xhWUbKQj0yh6p43EjFtDnO/s9rNmX/z5DpqWVKEgw2ikLUDVa75
	+h/Q6TGBvVNCJSqRH8AxgBMMhT/k+zWPweEc7riEeXHEin3g05iZA5i5YbFCeoGfc+GPiYury9I
	t2T3MEPRyLaymk/ZUDNPiC5wRN17qXK0hh7HzSFxhgTvHHWplhfdR6tu0dUos9gjoqgJqOAaN/n
	vuVcC/KROakc1//8tLBuW261YZIPfRVD81zlNRL+IdYJKSwW8b7a9ARDbRqUH8ts5qE+LHlJ9qF
	J2SgQQ5ppZibHt8zpU6cXCqToULifUU00qIsWC5GIFonQ3Q9f+OWEvixjpNH+XbbLKr9X4yjkqe
	fM7/eNc2OAj/wHAQEJhpQajDYsT2Nng==
X-Google-Smtp-Source: AGHT+IF36LoL0W1B2tdbhvaX+VoqQRr0ZxEehxaTQy+98wAF5xfwJrfsSoWGXqZoOmJCEe1+CmJLiQ==
X-Received: by 2002:a05:6512:b9b:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-550e71cfd72mr1915127e87.7.1747769432371;
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dba0sm2442502e87.199.2025.05.20.12.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Message-ID: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Date: Tue, 20 May 2025 22:30:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
>   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++

Please split SoC specific changes from the board specific ones into
separate patches.

>   2 files changed, 156 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> @@ -11,6 +11,10 @@
>   #include "msm8939.dtsi"
>   #include "pm8916.dtsi"
>   
> +&camss {
> +	vdda-supply = <&pm8916_l2>;
> +};
> +

What is the benefit of enabling CAMSS on a board without any sensors
connected to the SoC? Likely the board specific change has to be removed.

--
Best wishes,
Vladimir

