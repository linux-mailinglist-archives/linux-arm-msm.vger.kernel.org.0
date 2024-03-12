Return-Path: <linux-arm-msm+bounces-13884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC75878BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EFA71F2115E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463038F45;
	Tue, 12 Mar 2024 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKWwut4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1B8BFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710203089; cv=none; b=flET7YFPAFrjAGK+QaRcyk4/GvaDJtP6kObPDR0EqydLeL+nIyu9rfhBCUr6WlJfomYMwbWlg5p1v0RyQBRU31NrxqH1w69jCCaC2H05LMNj0Pom9Oe4ihSg3CvPXiDm8pKNh5LFk3qATQkW0Y2kCdXN3geEJmv0fG1YYVNg1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710203089; c=relaxed/simple;
	bh=oVopQaOOfzHY3UiFPdcWCjf76IMwbZpTCloyXY+7lDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY9iVMOixFMIwFaxTkpJTstlj7k9Wwh450z1rtXmJL5YOera5Ol1O6pCMVN+VSFgTCbqDC5rlFejrv5ECOEX8LARPJM/5x0Pi9q82PclR5GKJ6TiMH56RiFypdan1q2afW5wSlsF2nf4u1Lx2Ms7R7KdfkGZz3+SedkEN31msig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKWwut4k; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513bebf7411so5427e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710203086; x=1710807886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWhat7e2j1dWBbmXMTlUYz5GM9qOS0BL4XnLXY/ZEPk=;
        b=OKWwut4kg3tAwLpbwXY1s0ciHFH2UiyDG3GFFY4CfywxXAigzHTL/4yPAIud8gX7HQ
         seZFVZIYKPE1NDXgqReBUSNvPJ2pevi7Xn2hHGJiTqipLqkj+2NmlBcOmovHGC2PKM5r
         lY0JsjoJtmWSOcC71CE86w7ESud8zyfv2/oodyRBdiG4iiPNknaYXJam5KEKnhciAERG
         TYl1obDqFZ2cNKMoH235tSMSUKeEO2NXzgqe+pAe1by4qvfdyj9IdkBR53x12IYUqNbH
         naS/CCgTnKqPcp+gKqfZECiLmgwsPh5SrzZMR3kDFMuwnlJvAMRV3/eaihT8qbZ4ih19
         Rk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710203086; x=1710807886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWhat7e2j1dWBbmXMTlUYz5GM9qOS0BL4XnLXY/ZEPk=;
        b=bycpQpJ/XXOLTF7ezqeN/Y8sgsAPbfPbVSnbEcaX0wWfjfzcTwzkgqHYCQbFdKf7A1
         /cpL76Rg3CAy1yc3gr7Xt/M3zTN+gTHqr0/HFJ4BjJ/5MfugvWdXryqxQeD0MYZZAX56
         xD/TgORKJr8n/loX1Xb7wdr4USDbYFxjnrQzcZfKy0UcP7Q6OO18iJLpYe981DidvkIS
         XbHGFIV9xXa0Z1XMeo6zEVoalqv6mtzv2DDodZt95WbX1DoE2J5SqBFK2L/OfXyFUliW
         dwrW8QAFkm/+MVv5HnYTxBjr+VJZiVGZzwn7xDSbi7yWig1OdAaUEr0eQdr6zCHP+dFK
         xZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVzIjE1FnI3lUt2CUyC5NusTDJecWr5N7zXYIiFEX5b7V/3WkCRdY01L1lKkedeItGISOx9Cz5IU6Cm3/l87zESW+a1SYfChUiY5lS6rA==
X-Gm-Message-State: AOJu0YzdKKyjD3PoilqS0jnvltCdGV9nvM6O+I80Pt55Nx9VMm26sonz
	U0ifgdmBtuoUzwjfFuDE10xesZGc3S4xTeRIHgAKzYeJHYbpiaCit3SryBbSf9g=
X-Google-Smtp-Source: AGHT+IHm0GQQWslHHZzfBF39V9xf6bEVsajldQARNOhLXmx/EqaE6zH/wfXQL1fl/FeEaOfWwIn/Bg==
X-Received: by 2002:ac2:46cc:0:b0:512:fce4:327b with SMTP id p12-20020ac246cc000000b00512fce4327bmr5110185lfo.39.1710203085891;
        Mon, 11 Mar 2024 17:24:45 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m3-20020a05651202e300b0051327cb3a77sm1308626lfq.247.2024.03.11.17.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:24:45 -0700 (PDT)
Message-ID: <87709bd5-f985-485e-a2f4-9bdf4de5e40d@linaro.org>
Date: Tue, 12 Mar 2024 01:24:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 touchscreen
Content-Language: en-US
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Joe Mason <buddyjojo06@outlook.com>
References: <20240219113823.4189-1-raymondhackley@protonmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240219113823.4189-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/19/24 12:38, Raymond Hackley wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> Like msm8916-samsung-a3u-eur, the Grand Prime uses a Zinitix BT541
> touchscreen. Add it together with the necessary fixed-regulator to the
> device tree.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> [Raymond: Move to fortuna-common. Use interrupts-extended]
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

[...]

> +&blsp_i2c5 {
> +	status = "disabled";
> +
> +	/* Touchscreen varies depending on model variant */
> +	/delete-node/ touchscreen@20;

Please delete the node by a &label reference and keep
the bus enabled (if I2C5 is used on all models)

Konrad

