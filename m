Return-Path: <linux-arm-msm+bounces-32427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470798528F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3331B20DE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 05:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2AE14A0B3;
	Wed, 25 Sep 2024 05:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BotfmFAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF284A32
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727242757; cv=none; b=hSxe+t+YozG8y3w2c9im8FhGqTmSRhM8cDjUeOOAVUJ/46J6QwR55fDnmglR3Ly1MQeVJSS11RqbulPG5WixXJnQqpXC2gNVl4fKy9+8lTkz4bT3dIM/qvNc8mhC1U99xQuPndgUOreWhqaOkykA4HKgxHPrBC6QS8Ug+w/AUSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727242757; c=relaxed/simple;
	bh=ioBjncIRbnomi2/T1x4IMAoeQBg0/qKRK6KzIkmrYpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBvhz74rxNqFtHwTYMNHCUf+x/ZKLtsQIxwHCkxQapmENsCmZJGMfVwXIMohGH55f2AvouIWdUPtHc/X+rjNKwIVTg/qlECWMTXT4nmoujfi54hIp2burkdWBdBALpkTZeGRstsLUzbnqI99g2/y8EIYpbouLkZwxqn0IoYik9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BotfmFAG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53652c3bffdso922704e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727242754; x=1727847554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuoTbNYEXcRzlHV0UDmWGbYbWThePpqhU/Cw4g62gBU=;
        b=BotfmFAGLE45b8FzqN/kT+IcV5FsiX0+l40BrsV5Nagbg0bECCdLRMn40Z2D3ydtDP
         M1wb+g3wC/7qrRNpfaCQttbVXTCiiCgzxKJl8Q8mJKfmMLPMfg9UpkB3pQrchh7xppBh
         n2/V732CGqyI5FT4WZPZsA+s1QtIwwEPBCBbIRXVhm4eRQzxewSpzeI5hyKIuL0IrjCO
         YGgfQ0Q0jOtkSe3Ioovz0jwhuKU42MYGUSDbFwz6CAUmtISQtRXtskAVbvWjTfjJwWfj
         kcSNxaNPnmnSm624Gcrh5WKG2AbHByVPvg4NV88zW3E3DVwVW6Rn/Y5ocKLFjy5I1XfJ
         ACFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727242754; x=1727847554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuoTbNYEXcRzlHV0UDmWGbYbWThePpqhU/Cw4g62gBU=;
        b=Sl5PEe9HizVhqDPFRFZwoe87qz496UjRr2cwRvJCWEXyPOo3Bg1g5ZVp7MmpcZwpZ2
         L/4PmtfAbMVAkM2+ShS6Ul1OVMOglVlCE1QIUmZ/fpBqBrzK59cPdYwki3gn7m7pC2aH
         EYmvYsJE/STEBRTedYEvNz9dUfdqBzp+z0paPeZ3ENjR8l96LZFG2nz2m42gxGLXOmUl
         gwmX6rgzRuICkij7t5BA3DyalDOX1izzjOZILhLydH71jKAr5sYofTCvoXUURluN9/tJ
         nLwtAMyB7/PKKNJSw6ISAxZug1vcDj4/nwukmFR04OpMIDFFB4XW1kySJ2GpciMy7FRX
         afOg==
X-Forwarded-Encrypted: i=1; AJvYcCUE7OyhpBdbcEot6KsRO0oIFYj3Jo5k/QlET/Sbhy+kEPSBcX/MpblQwBZ/K1Prk5sAFhMVj8KBgg3h0+34@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Py7XCLx/3wQI53/svhe+cfHnvMJVvlk2bD9y1JmnHSw4I020
	X59M6w6LPKSZE4iXlghdzPlfDJxRVj/Wpai7ga687nJE5Oy9T6FxyUDWnoIcShc=
X-Google-Smtp-Source: AGHT+IHF3QiJxER+VyGdO/3Hm3IdA+yzkNdykvDcKwwmnQf+UaG3+ePGNNZ29XjKb6oMtDXt0vv/KA==
X-Received: by 2002:a05:6512:3b98:b0:52f:c438:883c with SMTP id 2adb3069b0e04-53870487e54mr207685e87.1.1727242753829;
        Tue, 24 Sep 2024 22:39:13 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e0b8dsm418150e87.61.2024.09.24.22.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 22:39:12 -0700 (PDT)
Message-ID: <4de5ead0-0d66-4e57-85bb-cd8a6ca29fcf@linaro.org>
Date: Wed, 25 Sep 2024 08:39:04 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
Content-Language: en-US
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Manikanta,

On 9/24/24 09:50, Manikanta Mylavarapu wrote:
> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
> existing map table is based on 19.2MHz, this patch incorporate the
> clock map table to derive the SCL clock from the 32MHz SE clock.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..bbd9ecf09f4b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>   
>   #define I2C_AUTO_SUSPEND_DELAY	250
>   #define KHZ(freq)		(1000 * freq)
> +#define MHZ(freq)		(1000000 * freq)

pleae drop this new macro, please use freq * HZ_PER_MHZ instead of MHZ(freq).

KHZ(freq) macro should be also replaced by HZ_PER_KHZ, but it's a separate change.

--
Best wishes,
Vladimir

