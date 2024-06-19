Return-Path: <linux-arm-msm+bounces-23191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689390E573
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 10:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6CAA1F22698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2893879B9D;
	Wed, 19 Jun 2024 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYCh8ls7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BA78C91
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718785518; cv=none; b=htnbCoV+ZFQ5/+gJqvSOwyIkZphVU26kUjs0FQXqSfdWjDjpGw6znlp1LdbWcy5te1ya+Vg2rpmfUqyT+iu+Jtdi7b3U9ZfWJ6esYEw3ShWmQisKfbfWv0xA5mYePsc9DCkOqpBeNs/2UzCx33BorOh2K4g+wvWbk361Hn3qOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718785518; c=relaxed/simple;
	bh=2b/kOalqvvEh0PQENNSxzh2JaUI1Y8hXPaMbFQ6OvkY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=leQjiPicrqhX3HFX4H1bVrr8zdUdRBUCj4DK658KQdlYE3tUxlwo+VmiO8npkgmDdATQaKRm8oEnmILTG6MtTibJ9CKhcfo44shxa920xj6Ag9/dj1hEbHhPcPjsDoH1TOGFc66GresEKm+mOMuN7n1jmcrFVwD7O4qYjIonmEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYCh8ls7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f090093d8so4928577f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718785514; x=1719390314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F55+nnwPqNHPPaJdOqugGb9tOF+zMoH4pqOyNlk1h1A=;
        b=EYCh8ls7zKBhT7B20hMi6Jagblfxbe/K8PZzw4RzHDvhPRVQAbI6lP02d9R9K0XRTF
         ALA2ivQu3mnvxnnulZPfV00wyvnjTFMFgEkDShaGrBxGPSywPgJ3TfoOH3/f7061AM0p
         tft3i0bp8R05mlsO8re2rOqCJFaJUCOU23xcQJEqg8+XsuQAiOMkWtLx7a/o/HV6vXkz
         SZEmHR/hWsZOQiW2rZrvAO/kF0gnjM69+UTLzV6fK0rnBWb0H/D1Dwiv6j/kk6lg7ycH
         7VIL6swT8qHWAHFGsMM9qMVBbzUvlg6GN1r/Ohd0cBB767udn1mYgKggSH7E9Cg+Mscg
         3PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718785514; x=1719390314;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F55+nnwPqNHPPaJdOqugGb9tOF+zMoH4pqOyNlk1h1A=;
        b=bFpSZNfFj94m+R6erDcQwaMApR+XZlIlpfCKs05zmg2d7kbJUD18+eJxp9OchqfuIR
         npMdSN0pOBgMw6D3bgkNk1PJ6kLoq+Kkd56y1vIIKmgG/TirioEiUh8U2c7WfLnJ5MpJ
         rtUDcFmlUzg5QVl1HN0Lm2kbPO1cricvbLeMb48pwZUdq7sY/76E4sCuhKM1yviyw2Ne
         RA7dUMnZd9lG5ptVsuUw4z5jOyXhS7Z0SNrB4s9bQseOuEIhZGWgu9xYjRd6b8dAK47x
         /SDxiWAWxRPo1Wcu2V/ZQJc66HvqNCbh6PDxiaLTVjVzM6G4WG03VOLey0u+9nqvaR15
         qjaw==
X-Forwarded-Encrypted: i=1; AJvYcCUjjZpQqQmunlrHw7vW+/ib0X+3vnLLLgz6LgHTktVGI2dp67ZWRWj7trkWNDdvN87ZqazU/G/rxhrMAL07eYMBmnC3NqE54urVBuV4lQ==
X-Gm-Message-State: AOJu0Yz+lotLWqp5WJCrj/mvqU9sXRaZgWkonW4SFJfQOeT3woTo69e1
	T2+6bgOz8BK34NyDvBZgQJe6gY2CQzVzL0jFpmDbdGr102Izjx8PXf5/oVQqK+U=
X-Google-Smtp-Source: AGHT+IEP+PNa8W01AM9rOTtoS+vcnvncRhzezJE0YF/DMXlpp6q+MCVB7npKy32RSW+Sv+peRt24EQ==
X-Received: by 2002:adf:b189:0:b0:354:fc65:39d6 with SMTP id ffacd0b85a97d-363175b8055mr1515876f8f.26.1718785513489;
        Wed, 19 Jun 2024 01:25:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa? ([2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36098c8c596sm6197735f8f.14.2024.06.19.01.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 01:25:13 -0700 (PDT)
Message-ID: <fd49ed95-bea8-40a4-b493-377fafadcdb3@linaro.org>
Date: Wed, 19 Jun 2024 10:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 0/8] serial: qcom-geni: Overhaul TX handling to fix
 crashes/hangs
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
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
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2024 00:24, Douglas Anderson wrote:
> 
> While trying to reproduce -EBUSY errors that our lab was getting in
> suspend/resume testing, I ended up finding a whole pile of problems
> with the Qualcomm GENI serial driver. I've posted a fix for the -EBUSY
> issue separately [1]. This series is fixing all of the Qualcomm GENI
> problems that I found.
> 
> As far as I can tell most of the problems have been in the Qualcomm
> GENI serial driver since inception, but it can be noted that the
> behavior got worse with the new kfifo changes. Previously when the OS
> took data out of the circular queue we'd just spit stale data onto the
> serial port. Now we'll hard lockup. :-P
> 
> I've tried to break this series up as much as possible to make it
> easier to understand but the final patch is still a lot of change at
> once. Hopefully it's OK.
> 
> [1] https://lore.kernel.org/r/20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid
> 
> Changes in v4:
> - Add GP_LENGTH field definition.
> - Fix indentation.
> - GENMASK(31, 0) -> GP_LENGTH.
> - Use uart_fifo_timeout_ms() for timeout.
> - tty: serial: Add uart_fifo_timeout_ms()
> 
> Changes in v3:
> - 0xffffffff => GENMASK(31, 0)
> - Reword commit message.
> - Use uart_fifo_timeout() for timeout.
> 
> Changes in v2:
> - Totally rework / rename patch to handle suspend while active xfer
> - serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
> - serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
> - serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
> - serial: qcom-geni: Just set the watermark level once
> - serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
> - soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
> 
> Douglas Anderson (8):
>    soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
>    tty: serial: Add uart_fifo_timeout_ms()
>    serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
>    serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
>    serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
>    serial: qcom-geni: Just set the watermark level once
>    serial: qcom-geni: Fix suspend while active UART xfer
>    serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
> 
>   drivers/tty/serial/qcom_geni_serial.c | 322 +++++++++++++++-----------
>   include/linux/serial_core.h           |  15 +-
>   include/linux/soc/qcom/geni-se.h      |   9 +
>   3 files changed, 206 insertions(+), 140 deletions(-)
> 

Indeed no more lockup when killing a process on the serial debug console

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks !
Neil

