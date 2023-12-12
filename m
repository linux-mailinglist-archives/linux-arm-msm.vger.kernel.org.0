Return-Path: <linux-arm-msm+bounces-4428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79D80F00F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 16:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E181C20B08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BF775424;
	Tue, 12 Dec 2023 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2F61MQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7D5AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:24:29 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33340c50af9so5807766f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702394668; x=1702999468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kJqu+bnuU5nR5DAckFzswh1FRnTgmkHhVyfgizfqp0=;
        b=u2F61MQYGrf1m2mz0riVsRLpCO1pVKcXda2NtltxL5neu/hBdeqh7YSVlpFjSdFmNT
         Ff7WiI8Mf23ASYqZp/QGRNta5S/2T2+yCnF2tjAsmyChDAGc+7bu8JbXsfnkgaLEVNZD
         yfl19xRBC805MmEYuvctC+XllguVumRwSjIzFI4fXnD8mJO8py9MUzUsBaVVfFFAyRqG
         pRVmT7EEOic11pN7CsOoxStwrRAX3fwfEiF/pKLfsNJTvSGaRRfxzcP/l7qLVVJcmiD9
         EhDRfBCN4fmoQaMPVV8tHKMJly/I4O0SD1aOVFhJs7RyA3mhFkKKcSZNvj0l2BbQDcyH
         zPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394668; x=1702999468;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7kJqu+bnuU5nR5DAckFzswh1FRnTgmkHhVyfgizfqp0=;
        b=mpyjQRVpSzABGoISd4U+PZDik3rCdHira69o3jlPPnxL5l6Erily9fZOmLy1JwbPZz
         74lOZbFEMkK0iiC7z75D4ArdqpDGcHQvclXVB11hhX8XjFtK21IreEaPJa/ip7BCNVQ1
         lG5HcObqlGyNebTPTI4lZE7QWbxgf2GHDZqxgzevBmbY+Q00+aI4dmDKRlorSn82PTKN
         kaTkOQ2hQXvvCHgVpNBOpG33R7+VO1AFa3NpvzGTzqpK6grrfrzQuLVysyLQzQ0tnctC
         D1HyuXLoVg5smRpAeAX3ylrWb3AhvBva2rC2goo2fAWQPcZLH9axSv1aMSlyr7kfS6jC
         ZUHg==
X-Gm-Message-State: AOJu0YzHFhB4p+DVkyaQaf0VBsNdST5YuR1QfLgLdvKZXVT1vsH8SY28
	a3f+diZcNDDUDkNl2FVw+9nstw==
X-Google-Smtp-Source: AGHT+IGVUMU4MGNHLX2arXPoCoNvGtb6iFKt5mx3GnV2rGFLW3lAZYKfzlX61YbymRc9/kLhEpxWNg==
X-Received: by 2002:a5d:61ce:0:b0:336:3651:62a3 with SMTP id q14-20020a5d61ce000000b00336365162a3mr122093wrv.9.1702394668020;
        Tue, 12 Dec 2023 07:24:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5894:fa62:26b4:bf82? ([2a01:e0a:982:cbb0:5894:fa62:26b4:bf82])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d54cf000000b0033635d121besm725476wrv.52.2023.12.12.07.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 07:24:27 -0800 (PST)
Message-ID: <44c2d671-a915-49ba-a584-83d48e6c808c@linaro.org>
Date: Tue, 12 Dec 2023 16:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_pdcharger_ulog: Move TRACE_SYSTEM out
 of #if protection
Content-Language: en-US, fr
To: Andrew Halaney <ahalaney@redhat.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
 <20231205-pmicpdcharger-ulog-fixups-v1-2-71c95162cb84@redhat.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20231205-pmicpdcharger-ulog-fixups-v1-2-71c95162cb84@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 00:05, Andrew Halaney wrote:
> As specified in samples/trace_events/trace-events-sample.h:
> 
>      * Notice that TRACE_SYSTEM should be defined outside of #if
>      * protection, just like TRACE_INCLUDE_FILE.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>   drivers/soc/qcom/pmic_pdcharger_ulog.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.h b/drivers/soc/qcom/pmic_pdcharger_ulog.h
> index 9d5d9af4fbe4..152e3a6b5480 100644
> --- a/drivers/soc/qcom/pmic_pdcharger_ulog.h
> +++ b/drivers/soc/qcom/pmic_pdcharger_ulog.h
> @@ -3,14 +3,14 @@
>    * Copyright (c) 2023, Linaro Ltd
>    */
>   
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM pmic_pdcharger_ulog
> +
>   #if !defined(_TRACE_PMIC_PDCHARGER_ULOG_H) || defined(TRACE_HEADER_MULTI_READ)
>   #define _TRACE_PMIC_PDCHARGER_ULOG_H
>   
>   #include <linux/tracepoint.h>
>   
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM pmic_pdcharger_ulog
> -
>   TRACE_EVENT(pmic_pdcharger_ulog_msg,
>   	TP_PROTO(char *msg),
>   	TP_ARGS(msg),
> 

Thanks for fix, it is incredibly hard to understand how to properly implement it...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

