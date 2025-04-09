Return-Path: <linux-arm-msm+bounces-53636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6350A8251F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8AF18959E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9013025DD17;
	Wed,  9 Apr 2025 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBy6HegB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FE15689A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202259; cv=none; b=bJUWgQt/wTGaxm5GZJLCaiXKEv7h2gRgZjc87KdDKuwdjO71pFLLzFP9CJCk+BTfG08g/oG6ajB6GkT6djEpxk3TZSqXadUqYno2d4sbbZZuJs8jRvzBzcJrMxmHsBleUVqL8HLvqkqmlOgb3CQCRzf44U967j0J+nXOLHEDoaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202259; c=relaxed/simple;
	bh=FbCHU52l0d/J/GIAv1Lqu68fgOhCehCIE3fhTZaGyIo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UO1BIbbnbLIhtHRv98k4+lMqbXgDxGL1deQlB9/uO1hV7ZzOL8ZceRlshEl/gV85V6bMDYBghwuJrGVUeXxhCWe7A8zNWtyszgpjr4JxjpnO5yl0wBOpp3bTCi1qHhWh08g4UcsC7eAmwYUdUuW/MsVv1B9Bhy9lMtWs3zSEtTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBy6HegB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3979155f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744202256; x=1744807056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EizCsAk6JvVm39tYzO6oeh9u1h02UreZEmnOvXz5XUc=;
        b=QBy6HegB1fLcA+pLE6DV38zAEprDKDnxukpqgJ/45APQz32wppOVbzo0oAqAHmxq8q
         XCopKHtzD+b6nfjzXefFhjz+JNHx1b4xMpVkAhs5daYoFWW+IHm/nZMufvB1I53BtS+s
         B1ZeH18rvRsqmxuOikZ0V//+1jAvxlIW/PzDShTHonCEfBGdXrF1qAVRbxJNuFd+V8Cp
         ysUZ+08+YsOEHoaIDG6+gmDJcn8kyxMt22vmIRXnK8D8lnr0kU/KFfvbqUF8YUrQlwCi
         Ct/W/asFkh4O3rcU+WoI05dA2rmPVGYr+JThNx7cc9/TN1ZyXOS2gIqWjAHMbnnGVF0Q
         w/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202256; x=1744807056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EizCsAk6JvVm39tYzO6oeh9u1h02UreZEmnOvXz5XUc=;
        b=W8R6G7bdKFOzGSxfuEkWwyJSx+XE7vJtkqkhbTzb7o3U0cdpOyuLt6pwFIJiOMQ63o
         0s27chnTtILcxp3YFBikOxwFPw6zEie2D6V9UR4dDAv8p96YRRKC09o6LpIBjhLwX7GS
         FYk+gIS70ht9fhPmzqp78C5nNz6ospg9n3kycleuIGuo+4GEJ6ssTFYNPiGuey/M5bE2
         WoPodLQRFuOiTwpkcFXurYmN8NN/nIawsyklMfMokdJGLkezr5yGg/1k264dA4l3dyOs
         Ao7Ia9T8D0HrhibjSURInzdSiOHMlrIWIrWZNUo16+iBioQ5AaZnYK/DguEXFMWnYeBV
         llGw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Z/Pb3UuFKZZf4QrDVIhGmA6I3o5gEwCImUQypNTyvBazFyxsnZjnDI9op/7smRJwv3hf4EI+vwcCAj5D@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+lMzL8TdsFe6cLCTF5txAwQc9wtSiFiUddl3I6h0GwURdfIU
	DzuC2sF4x3xvVFny7CiHMEFXo9aRFbys2CLJiIEYgSQedUzw1xC/Agtt5Fed0UQ=
X-Gm-Gg: ASbGncv177ki66OqyQc2MvfFJLPCPVwwTWvcL6K7/1A+HXYo/cLxqVq84VkZCwj+oIF
	Gj7lbeUXWyrJdFBglCdTn25kkHZvEUQD3NW3aepKAkC4eo7k8VocbOmrP/Qc/usxavSgoyHmNNZ
	ikoEmDOsqu4Tg7+ONfANHiG8zbbhAHnZwJU8kZ17RkYG2NWGPdNjbj9B1Czg42bfnFoNr7Dks/f
	dqKkYS4T22E2eNLCa+XF1BswuAWumkzsFJGHahbwVlHTrLFJZ3cRmUDm2vS8OUpGqdCXvLlchQ0
	lCExJeKxCuuISiI9/ab9nro5LxWyFsb9bnC3V8/KxsRkwfdkF/oTwduoXMBDDR9PrJHJag2UcEZ
	k1T1RuPl0uqHWL0nZuw==
X-Google-Smtp-Source: AGHT+IEwZypQiJ9yeKfN2R+WddTEm4ee70zVEENJiVyTHHktMmkvGOzfz90SU4Yw0AaEPvy/vMzr2Q==
X-Received: by 2002:a05:6000:2a10:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39d87cddd45mr1788420f8f.59.1744202255920;
        Wed, 09 Apr 2025 05:37:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cebsm1534142f8f.61.2025.04.09.05.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:37:35 -0700 (PDT)
Message-ID: <d8a0f3a2-03ed-48be-8ca2-dfed622554ee@linaro.org>
Date: Wed, 9 Apr 2025 14:37:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] serial: msm: Configure correct working mode before
 starting earlycon
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Sam Day <me@samcday.com>
References: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 19:22, Stephan Gerhold wrote:
> The MSM UART DM controller supports different working modes, e.g. DMA or
> the "single-character mode", where all reads/writes operate on a single
> character rather than 4 chars (32-bit) at once. When using earlycon,
> __msm_console_write() always writes 4 characters at a time, but we don't
> know which mode the bootloader was using and we don't set the mode either.
> 
> This causes garbled output if the bootloader was using the single-character
> mode, because only every 4th character appears in the serial console, e.g.
> 
>    "[ 00oni pi  000xf0[ 00i s 5rm9(l)l s 1  1 SPMTA 7:C 5[ 00A ade k d[
>     00ano:ameoi .Q1B[ 00ac _idaM00080oo'"
> 
> If the bootloader was using the DMA ("DM") mode, output would likely fail
> entirely. Later, when the full serial driver probes, the port is
> re-initialized and output works as expected.
> 
> Fix this also for earlycon by clearing the DMEN register and
> reset+re-enable the transmitter to apply the change. This ensures the
> transmitter is in the expected state before writing any output.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0efe72963409 ("tty: serial: msm: Add earlycon support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/tty/serial/msm_serial.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 1b137e06844425584afe5d3f647e9537c6e2d658..3449945493ceb42369d2acafca925350fccc4f82 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1746,6 +1746,12 @@ msm_serial_early_console_setup_dm(struct earlycon_device *device,
>   	if (!device->port.membase)
>   		return -ENODEV;
>   
> +	/* Disable DM / single-character modes */
> +	msm_write(&device->port, 0, UARTDM_DMEN);
> +	msm_write(&device->port, MSM_UART_CR_CMD_RESET_RX, MSM_UART_CR);
> +	msm_write(&device->port, MSM_UART_CR_CMD_RESET_TX, MSM_UART_CR);
> +	msm_write(&device->port, MSM_UART_CR_TX_ENABLE, MSM_UART_CR);
> +
>   	device->con->write = msm_serial_early_write_dm;
>   	return 0;
>   }
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250408-msm-serial-earlycon-4c5dfa782496
> 
> Best regards,

I think it's safe the sanitize the mode in earlycon.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks
Neil

