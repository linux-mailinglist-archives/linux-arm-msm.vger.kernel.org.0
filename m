Return-Path: <linux-arm-msm+bounces-40292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340319E3E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE146166500
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8BF20C00E;
	Wed,  4 Dec 2024 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxILafI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD920B7E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325883; cv=none; b=kM5tOvXjO7E7zoTBESCWoF9iqGCvPflPq1OCaniqm2sFEAt1XJoYo7hqRqmbRHpOp7QV+xp/Kh4P+H9fHGV8ozdRkvI1gr/REeHAHj6q3KFLAgodt2l86zlAp5PqXzhMsNiHGJK/njjxjv8m2NiLSnkE/bIJzH/4jWX4Ez5+cbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325883; c=relaxed/simple;
	bh=S16P0GGasnPzLoyJ+ehPn1yGLMLx+zwDl70/2m0gk4Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nR8BzK8d4fTTMn45CCt31rVGMn0leFRqwfTAsyTGsH3kamdrqVwgcx/2Z8ryRlgAmrjrMmMRhlGvP5fTBquzz4/e4hhZ6uyTgvOziFO6/NjCQ1vbrlAhoOc8lmSfJcTXCMUoIW4JKQLzPojOdX3B1vKtJJYWVyCEKIljq1haEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pxILafI6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a45f05feso84760145e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733325879; x=1733930679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcDoThk5nkP9GPoOLpcXYjEJmqHuOxUV4Ii6iLnvCQs=;
        b=pxILafI6aSny4oT0tSndtrTqITff9OePa3y0mDjcCvJMOr4BF0DVuWmu9DjyyfC1jO
         eDb6GKDE5QyhCzjlC0wPp7cFDzBi8YNpeMX2bvYt0HLpt2lpvJ1HivoseK23ZxnzVgN6
         3+xgd4bAbBhE+8KYPnRbFaGyccAG6dlTohkXZjjnR08JbmDwIORVV6fOlhKioO6ShBXE
         TTnq6orucvr7O5nI2cIJbAwsfHXwcHu2cmfV7NNyTY8pmu4i3nVc0kT0wPg3vKsP7Rgz
         c/BWkn+zW7w/b73jWcyHHlBKKJIbAD5J7v1aygOlPxuNgK1VXVIh7ohj88/J9Zm103cq
         zaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325879; x=1733930679;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pcDoThk5nkP9GPoOLpcXYjEJmqHuOxUV4Ii6iLnvCQs=;
        b=I/lHS1nTsyWgKZWPv7kkkTbaTU037ot2k6jOvfkazgLs+VyEVVzngcwE0CjQFVMCoZ
         FHqZk4zPUjtm1+Xs0FSDGyN3JkqMM5fK9M8UowVDYpXOPmd0uBNOfmXCRaA4doL5lUFM
         Nu0ozrebjyAYuGN5wqjRcEXFWhpuRndt5s3KRYvETTksU0d3mjvtlQ/NbXpJv5DmnH9Z
         qnCsBLA4zutjwHywr/JhZqU+Ztx2O/BWSuGgX5vPC7xeMiRmtXlRWRUJgRT5hjlthI5D
         b3IKyYQgcFn3cq4b2IsD7+/XfzNBos3QcfiNebfzdUqRXwUxWkv3bTeKcUs8yKM++9Hs
         43Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXtyQUAYFNqZvuU33E12ErDjiHmU/he6e1rpRx4x2vMF5aEmUWeB+MZynQ7mlOmlyDLsWt/+tf5APdhNLAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88QQDQrPSXH/dAO+Tov9FJ3FAtDYBATH7gvAjBTXeq08J2rLc
	f1kTaaJhapovfP4Dw5AB1PfwADwjjvQV901bat3lQCGVco/h3QrRprKRgGNrccY=
X-Gm-Gg: ASbGncvaR+hm2PTkQx90zrLQYif5feeVBioGe7HRxAPqjzkXU3e5S7TtDHQUO9ifWqK
	ZPkZdA2TljhwecReegc84wiTi+UMUuL0SAAI1AWxJ1OXzY3L+nKRE8ctlZ5lJETJ35XGkAmYskE
	L+AMkJq10wz464Nr/KMCOESwu/AxrSyRPgYIi6SDNAtlBjPNtPfcRq92mjbLdYOQZKD0Ua0BuQ2
	xoVAG81x9Obl0qRbpRvJ89KJbWFVLZe8BMWyOktLQ7j2It5eRFhYejOZX5zLn8QY7aRt41olzJK
	/XXyXmWXDFFxFevS6hY4myxb
X-Google-Smtp-Source: AGHT+IGzZgVutv3m9yqKptNTE4FEmFL/zGlx8ahUg57dJciZ6G4bHRdy7JyKr6NDvAhD5P+RLYkMNg==
X-Received: by 2002:a05:600c:1c8b:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-434d09b2e53mr63022025e9.7.1733325879600;
        Wed, 04 Dec 2024 07:24:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:740:b323:3531:5c75? ([2a01:e0a:982:cbb0:740:b323:3531:5c75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7f103e0sm16938977f8f.19.2024.12.04.07.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 07:24:39 -0800 (PST)
Message-ID: <c19e36cf-b041-4eaa-bbc2-007b30460963@linaro.org>
Date: Wed, 4 Dec 2024 16:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
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
 <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
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
In-Reply-To: <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/12/2024 16:03, Viken Dadhaniya wrote:
> Load the firmware to QUP SE based on the "qcom,load-firmware" property
> specified in devicetree. Populate Serial engine and base address details
> in the probe function of the protocol driver and pass to firmware load
> routine.
> 
> Skip the firmware loading if the firmware is already loaded in Serial
> Engine's firmware memory area.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   drivers/soc/qcom/qcom-geni-se.c      | 445 +++++++++++++++++++++++++++
>   include/linux/soc/qcom/geni-se.h     |  17 +
>   include/linux/soc/qcom/qup-fw-load.h | 179 +++++++++++
>   3 files changed, 641 insertions(+)
>   create mode 100644 include/linux/soc/qcom/qup-fw-load.h
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 4cb959106efa..423102fac3fc 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>   #define __DISABLE_TRACE_MMIO__
> @@ -15,6 +16,7 @@
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/qcom/geni-se.h>
> +#include <linux/soc/qcom/qup-fw-load.h>
>   
>   /**
>    * DOC: Overview
> @@ -97,6 +99,9 @@ struct geni_wrapper {
>   	unsigned int num_clks;
>   };
>   
> +/* elf file should be at /lib/firmware/ */
> +#define QUP_FW_ELF_FILE	"qupv3fw.elf"

I supposed the qupv3fw.elf is SoC specific, so it should use /lib/firmware/qcom
base path and also a SoC/platform specific path that should be specified
with firmware-name in DT.

With this property, "qcom,load-firmware" could be dropped.

> +
>   /**
>    * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
>    * @clks:		Name of the primary & optional secondary AHB clocks
> @@ -110,6 +115,9 @@ struct geni_se_desc {
>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>   						"qup-memory"};
>   
> +static const char * const protocol_name[] = { "None", "SPI", "UART",
> +					      "I2C", "I3C", "SPI SLAVE"};
> +
>   #define QUP_HW_VER_REG			0x4
>   
<snip>


