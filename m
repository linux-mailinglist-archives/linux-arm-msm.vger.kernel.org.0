Return-Path: <linux-arm-msm+bounces-40294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D279E3E37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404CF282565
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3EB20C01A;
	Wed,  4 Dec 2024 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LT4VMiVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38431199EA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325930; cv=none; b=EFicq1fydiWFy1QYadFJpAS/jWCXj2kS/NGU0dEM4IFvVeyYkm2QetQvmvOMJxtO+3mB/WFdPx/ju6E93d9X1BQFCYEaLmsqr1V83VcrsoeH3HcBZP8qZLnlsVEhD6kFnIUPz5aRlV/0mbsAYz9yWV/IAsAR5lFBE7TNJTo2p3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325930; c=relaxed/simple;
	bh=ItfF21lgCpkme/udRWq5VgMzq0q4roB7rTlqXhTLIG8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QDtmwR0sgxJXDpxWuECLoyXI7MBk6cSUaMsU3FCxrSqSUFWGXvLzv+pgJBrKHeBaOYEZdavna3v73XWCCV7W87bxx7lgSuUrc4KY+W/8IwwJnke3gm4EepjzMSqU//sBWmQQWHU78cyMTQP6FOMUGzZ0WgrQZMxEe1iA9/waLS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LT4VMiVw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a8640763so57113545e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733325926; x=1733930726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8/NXif9wJVFj2hQElb83aSq+sssv9oaN1dht0koEM4=;
        b=LT4VMiVwV9n/VgwbBo7nHKV4aG1r5hOCvSDgEijFyOkZUMwhXmqb7FFy0bqcb3cHku
         Pt4ugU0bflv/xeQn3c2ld0UAtbZO7VzRiKBUH5ZUF2F1BM9nIwL9PLsz8jjwYZDdzTHy
         lstoHHwcTMnHsL2NcljgG0PDEFnlYPuExeWTPK7X6e2tOiL6nSLmLl6lkcN8Bcq+F2FQ
         u7lSdb+gv8cOttffoouSu2HeLJSwyc0i5VK77g5dRoilMnLRq4OPEkilqjOPZHpyCn/Y
         DCQG7pmrvWeqrCpcYNqcHdA9pU16BDDrxRgLXXZ7oaGgvQyBmGvZQEf4iPnYhdlErt80
         VdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325926; x=1733930726;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S8/NXif9wJVFj2hQElb83aSq+sssv9oaN1dht0koEM4=;
        b=BcDP+H11PKAGutdC9waTiexj+Y/OWW8l58DTI4sBROMZ9s6wL1IDght+u0Z9PqwEUb
         h0hee5EEBvg06CRLaWlPVMc+W9sD52+skVS7nFGFMgBzJVExa1F9EPUYdJOX96K19YjX
         mEznnNKla+y9hftMM6LuJ+dNUjolgz8qLZjT5p1q2wKewRHy3zQ7a83pC90se5pVbtbd
         UCuKIWHRy6vLyd/UDtrG0Bhysf93Q/IJBC9hxXQyOc4sYGIMQbBqVzKOTdMp6an0ypJr
         UvWbY38DqRMbdHOj1sl5AcEXVHyTEFX8ZHNH5ay0O+oj8cLDHpJB1J9w+3nbEvdKXbng
         0tqg==
X-Forwarded-Encrypted: i=1; AJvYcCWPJbxi5T8MDVgSTLOUbuRfa7j5cxm/ceHoQb4UVZOVg7cY89xobxNnLtPChS3ustX7lK8/h4u5nbW/zpFE@vger.kernel.org
X-Gm-Message-State: AOJu0YwIm7tjFJ0Me1YwrMQqGEW4ltBLSeUoRaICfAU/eerPIUo208o9
	MkWRjCE3hc7wCbepBq3gDGa34HtgBIPHdQtr5KP/ki7kA7bAKsw2rF4moXp6tO5HgeUvzo9OwOE
	IogI=
X-Gm-Gg: ASbGncth0+NWt8plaAVRuIrXHktcS3PGiCOa7WjyYkNlo7SuQjjFSkjUpTXWDbB+hPU
	b1FmKWgGfj60Cg/o97pjtmqj7yWxBZYoafM74ujGyqnMQ4rujBwtKRbHinjIcvVP63itdM60sf8
	zlkqsDLKXKkeanHDpJLbQT9CTS/s2Ha65pN4/b95frNvRvqkKEwSQHIGtRrsvKD+jU7/Qj070fs
	f8Ue7MaCufwUK72/f9wGgfUleZTCjqHOo5481a2h+yw4kPF9F7B0dZle+5lkMm4TWoWLSDufq3z
	C/Ljxhs3VQ+F/gs66w04c3rL
X-Google-Smtp-Source: AGHT+IHZdt66nSwUCQIPlgcKC9J/gPvEuCIw+nsx+zth2Wzv3Qbr5bQfnlxx8iimG4axcn5Pscuwug==
X-Received: by 2002:a5d:64ae:0:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-385fd3e9e05mr5689269f8f.27.1733325926545;
        Wed, 04 Dec 2024 07:25:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:740:b323:3531:5c75? ([2a01:e0a:982:cbb0:740:b323:3531:5c75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d80a77a0sm16812983f8f.58.2024.12.04.07.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 07:25:26 -0800 (PST)
Message-ID: <0a85859a-9487-48fd-b1cb-a4a4195a8e63@linaro.org>
Date: Wed, 4 Dec 2024 16:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
 andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
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
In-Reply-To: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2024 16:03, Viken Dadhaniya wrote:
> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> support SE(Serial Engine) firmware loading from the protocol driver and to
> select the data transfer mode, either GPI DMA (Generic Packet Interface)
> or non-GPI mode (PIO/CPU DMA).
> 
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..a26f34fce1bb 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,15 @@ properties:
>     required-opps:
>       maxItems: 1
>   
> +  qcom,load-firmware:
> +    type: boolean
> +    description: Optional property to load SE (serial engine) Firmware from protocol driver.
> +
> +  qcom,xfer-mode:
> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]

In the code, FIFO mode is default if not specified, please precise it in the
bindings aswell.

Thanks,
Neil

> +
>   required:
>     - compatible
>     - interrupts
> @@ -142,5 +151,7 @@ examples:
>           interconnect-names = "qup-core", "qup-config", "qup-memory";
>           power-domains = <&rpmhpd SC7180_CX>;
>           required-opps = <&rpmhpd_opp_low_svs>;
> +        qcom,load-firmware;
> +        qcom,xfer-mode = <1>;
>       };
>   ...


