Return-Path: <linux-arm-msm+bounces-63095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E37AEE31B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6233317D599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0960128FFCF;
	Mon, 30 Jun 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aL9hfgBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814F28DF20
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298931; cv=none; b=P5pnl18Zk6X7GzY4IU4Fkd/AaePXG7b9GeRXF43lm+64nO1Q4AGx3UZgLh6kHgBYKQctfRCOm0ySmdyZ92e2AuxUycdCubSxMB8wRZ0ReP7A93LA/ESsdB9gzs8a9vY1ewhpWt6Q7oakvxYqvV38buU+Mp91jf8QdjX9J9Iq4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298931; c=relaxed/simple;
	bh=dkm1VkSYIXq2i+j+TBxX/R3W+5XAHuqA0KPiJGf+tk8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eg+CX4yYE869TxLznbeNZLcRSExJ7I6V45u7GeOniUdXTMEO9CllgfjbW9dhz9pctq82urWMaVMUii8noJKOWASBD3eJfU/urc1i8X+A1kjFNjLG0BagPtUDU1IUNcCPCwjOmVUUdUGDt4GV34igQklZbAdDtn+MhaIJpHy3EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aL9hfgBd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso23601105e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298927; x=1751903727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKu8cGWr+68gHqtckpC2Luem6Zfvd9abbXfE5F+45NE=;
        b=aL9hfgBdNmBJVcNQTcFrSjBqhhGLPsQ+ivPqDU7zD02Ll9KR5BTIKrOeZsdoAqf2ry
         eNZrbwspZwzrO/dXvepqanY613HLl2hcnoLURoAh7A9Lf+qfYRUcSAIGw8NhsXa7otC4
         SrZwOinW+MeMdH8RvTCAqDCU6HKhvlRByPuQ09m2+6Xf+O9TexQ1vSkc6hdUHxZUHHIb
         AI9rA4mjBoN+wE54AMHOkHEvnftr2Z3p+eLeAWvpv2/sFnOm0adc7ZIpBecfE0audU2k
         MJMFFiDLz3R9lzmTOyPgI795Vf16+5JYLmRaZpbhEfwNSb/KDWtLF+uQ25qTPFqKHdMP
         dWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298927; x=1751903727;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKu8cGWr+68gHqtckpC2Luem6Zfvd9abbXfE5F+45NE=;
        b=nElsTcKLRjOkjIxpc14xy6AfR6W+UmFIw3pH0sYXSYchb4wJk9ANF4MlBWbHuImIez
         9UG0aKSho90XlztNIF4NNl77joyAYLC/2lvl2VEu0/waLuUaB7efFtMQ+LzP5yJJPPet
         8ftsUTY6eolN75r2Dvhp3BJrYvi8SdKdqRd+zjpdlm4l/pcFjARnjG7nWfOcRSlhFVE2
         a14XYaytFvZ9R6RDd/lAEJxL4Hvp6HJ//ndhcXIVatqFk81JdEjIJ/8cb9XNvEGPHE5h
         4VMWFWZHUyZeJNjSwhr/LUIauFhEP5Lvlgo43BoTADCwGuOkiqbt1nOOoOP/2CMZtKyI
         gfxA==
X-Forwarded-Encrypted: i=1; AJvYcCWbZh2F8t3UDqpzYpkT8dH/m/ccPcOZQUti4njXK7rx6gydnXFMul2HxhZSv5/eLbFfr7yH8WYCjKFZXEyf@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhrFWh5klEkZR8NusoevuUdNKJqQ1X8z2nkWv7iDlgusccxj/
	mTJ4b2mLQAAG0VA+tPMg7AvDrVFOpEdfDssQksvBiycKCEdVDw9Y5o/Y/ym1sGNZ+PY=
X-Gm-Gg: ASbGnctmKg9Zd4cZrEPZGLWmVprkqLlcd8gd4CpSLxMcU1iP9z26zRFFUmP0VHnSVpu
	0rGa37bz0EBA0CalaZaLKmCZ4IgkiD7iyXZP1I30S9durkynI+NPnVKoy78nVdkpXgyS+0l1NfN
	DhL4y0fU4cVgwDsvMYE3fluD9IcIQTri17L5WQpi8v/1yLt+y4qi3ALe3aQHK1+fHzng9ZKQ33A
	9S75ayXQhgmN+Tqv4gnGOFQsP+tPGDkkQnN74iV7q/DPmAE48WKSX3nFGe22Jrjfb0AiW6EUSyq
	JDC2KuiYwKH/Hs6ElphpIezzXGWbh2NoA7gfi/+vdp4LWcjWRkWjr1bddIOxAzf9JPWzvK5lqD2
	XO3/bgdZ3mgJeLWAZK0dPFkCvBPJCKD5s9ZDpf7U=
X-Google-Smtp-Source: AGHT+IGcZJvqgodwu6og/PQrCUHlDvqPoVw5PfMCF40QrXxTmeW826ig0xIT3x2Elxqae+KzMW5ARA==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr137016225e9.8.1751298927122;
        Mon, 30 Jun 2025 08:55:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e599bdsm10530457f8f.84.2025.06.30.08.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:55:26 -0700 (PDT)
Message-ID: <8089100e-ed0e-4f79-a1c6-d06955c8d8f1@linaro.org>
Date: Mon, 30 Jun 2025 17:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
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
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/06/2025 17:48, Vikash Garodia wrote:
> This series introduces a sub node "non-pixel" within iris video node.
> Video driver registers this sub node as a platform device and configure
> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
> and internal buffers related to bitstream processing, would be managed
> by this non_pixel device.
> 
> Purpose to add this sub-node:
> Iris device limits the IOVA to an addressable range of 4GiB, and even
> within that range, some of the space is used by IO registers, thereby
> limiting the available IOVA to even lesser. For certain video usecase,
> this limited range in not sufficient enough, hence it brings the need to
> extend the possibility of higher IOVA range.
> 
> Video hardware is designed to emit different stream-ID for pixel and
> non-pixel buffers, thereby introduce a non-pixel sub node to handle
> non-pixel stream-ID into a separate platform device.
> With this, both iris and non-pixel device can have IOVA range of
> approximately 0-4GiB individually for each device, thereby doubling the
> range of addressable IOVA.
> 
> Tested on SM8550 and SA8775p hardwares.

Is there any test to validate this works correctly?

Neil

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Changes in v3:
> - Add info about change in iommus binding (Thanks Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
> 
> Changes in v2:
> - Add ref to reserve-memory schema and drop it from redefining it in
> iris schema (Thanks Krzysztof)
> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
> 
> ---
> Vikash Garodia (5):
>        media: dt-bindings: add non-pixel property in iris schema
>        media: iris: register and configure non-pixel node as platform device
>        media: iris: use np_dev as preferred DMA device in HFI queue management
>        media: iris: select appropriate DMA device for internal buffers
>        media: iris: configure DMA device for vb2 queue on OUTPUT plane
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>   drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>   drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>   6 files changed, 119 insertions(+), 12 deletions(-)
> ---
> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
> change-id: 20250619-video_cb-ea872d6e6627
> 
> Best regards,


