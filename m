Return-Path: <linux-arm-msm+bounces-17608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8668A723E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 19:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583331F21F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 17:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B016A133284;
	Tue, 16 Apr 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaArEITL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B3133285
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713288404; cv=none; b=ihjxkfK/59IV3a4wn8mrR3uec+jC5Ook2FZ6hGFlbgOCuULV9VmYqLLlcR6MeH7PLFyKMy00TxU8CYCdXBX7ZPCWSQjJ7zNExtGD7JKG/4eHu/wpMwXWZzVu0MYBZOtrnUjEXZPMBs+D5EDTaiGtaXS3FLLdxUtrE89sCLUG0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713288404; c=relaxed/simple;
	bh=yDIkoCCqZy8KpIEuGMp9fwluS74YQ+qtjkGJ9Pukq6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=siqrOlmgcTr2ZlDlTyQgkbCee6jlANzX8gGqp0T79D6KSEFoxAZOKLirbeNm9V52D6tNUqF72EWjKRnWlGWMCs6AsLbazK+cxbnx/teDfRssKwoE34S64RVyT1n8A3RIvxyY6r62XUvgUrDTsZEkMau3TqN6mtBED3vv1koe4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaArEITL; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so3113607a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713288402; x=1713893202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvyZPxNBO+CCxhPPduaW1lszeS8Hl+R0uQxWHJXgpu8=;
        b=HaArEITLveXCNws2xAKgtaumTYMHcq9krq/cgiB5x+bOGmUxzdAfL0x1FXjBm3SX3F
         NeKRBA8qF+0tM2GvHZhJr3anTLblls+vRfIkkjnFfz/GXERgKXiup+qVgz/0eJTcuW/b
         QcNsVs+skKzxA+vop8t5X7JtyJS6TpjSUl5fGBXWmF30BlWZgBqYMlU5CoS+hBViQRV+
         PUrHBm+x1OPGw3tslXA3utaAn4YU+id1CpEVUTYBtnaSw2+S61YhVo81FQ4WNBZBCRFU
         W9rcaTiJex3NFNrdGYU/YCbm/TMHS3OVacbZs1JLUSOQNMsu6j/DmR2lAocE3GZjpcNF
         s6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713288402; x=1713893202;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qvyZPxNBO+CCxhPPduaW1lszeS8Hl+R0uQxWHJXgpu8=;
        b=oeeeYrP8wF3l/6aRXkOOmosUu8J1iXKn79dx1UqKoXqvdUZyOQYGL6F7feApL/x/8X
         tag3m1kqUlbvl+joHn0D2l2BrFLdHGtzLBHXmXBenhtGZhESwEPMxkVx4AaImS4bj4n3
         CDeI4B4+Kql1x+S112oglQskcl3vu2MGM1Zm4KlAuhVMtfNL6tW4P2Xx95TuB0AJjDqj
         RscNbZVrXPdk0Dw0pWMmlQamYt2rw3KE0bqRAbLVm7QXJj2x0sGR61Z1SGrmVs2ETVPy
         nbcb+TijNSgDmIr5VUwkrWBgZ+ibCL7qXJWVNK5XNUrHST88TorF4GwPKLSgCO22ctDN
         FRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUQu14TxwG5ZxVAvaNjuP9HwAkuAbXLfKx2RIUQ/rYSn6mXxRe2nrpMIk6n+jUBqDBa7VFh2H1mJsVE2F8sFpj5wLJdrrU2SPAbNYS74Q==
X-Gm-Message-State: AOJu0YyFyrohBqPVB0drr8hBORmznM/pn1lJliCRyZZR8k7Dkfpkrsw/
	2LYrWipS0hqrZO701Rx9xA0CgFbbPu6RACmQ2ZIVZwekrC1BDeo+vtLICMkFejo=
X-Google-Smtp-Source: AGHT+IH+0YIFkodFoJleZkDWl2xMpPo6FmuTUX7Gin9tG2YYQDyZWrgRscix/FzGY/3b+sTDgReqQQ==
X-Received: by 2002:a17:90b:3786:b0:29b:b6eb:3c0d with SMTP id mz6-20020a17090b378600b0029bb6eb3c0dmr12168255pjb.36.1713288402041;
        Tue, 16 Apr 2024 10:26:42 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090a051000b002a2e4b593cdsm11861124pjh.51.2024.04.16.10.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 10:26:41 -0700 (PDT)
Message-ID: <c1af623f-055a-45d0-be30-8835756c384b@linaro.org>
Date: Tue, 16 Apr 2024 19:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/8] usb: typec: Handle retimers in typec_set_mode()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
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
In-Reply-To: <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2024 04:20, Dmitry Baryshkov wrote:
> Make typec_set_mode() also handle retimers in addition to muxes. Setting
> the USB mode requires retimers to be configured in addition to just
> switching the mux configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/class.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9610e647a8d4..28d395535bd1 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2095,14 +2095,21 @@ EXPORT_SYMBOL_GPL(typec_get_orientation);
>    * @mode: Accessory Mode, USB Operation or Safe State
>    *
>    * Configure @port for Accessory Mode @mode. This function will configure the
> - * muxes needed for @mode.
> + * muxes and retimeres needed for @mode.
>    */
>   int typec_set_mode(struct typec_port *port, int mode)
>   {
> +	struct typec_retimer_state retimer_state = { };
>   	struct typec_mux_state state = { };
> +	int ret;
>   
> +	retimer_state.mode = mode;
>   	state.mode = mode;
>   
> +	ret = typec_retimer_set(port->retimer, &retimer_state);
> +	if (ret)
> +		return ret;
> +
>   	return typec_mux_set(port->mux, &state);
>   }
>   EXPORT_SYMBOL_GPL(typec_set_mode);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

