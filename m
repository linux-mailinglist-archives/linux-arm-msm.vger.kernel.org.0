Return-Path: <linux-arm-msm+bounces-4520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA3810E87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 11:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34135B20CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98524224EF;
	Wed, 13 Dec 2023 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzZGiDPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4199A10B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 02:34:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so26651745e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 02:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702463677; x=1703068477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4iHwSi1orpKZdBjvEhFkZBhQdysnUmpyPPK1U/Sy2c=;
        b=IzZGiDPbU/3QLPcAtg85PkEWB92UT8LPC5kCFBsg+F7zgFFnSP36e3HpvaH8Iq6MVM
         xinhFqjrUgTQunqHx03jbdnASS6eyvrFvRxxITYw5ltbhY7zNLTW8GJc+MQaxu9lVpdO
         ecLEBzLgJUzvIxSgx6IoS6j+iaEFvbo95jZIQLIDe0ktlEY9U+l+fybR5A1mqj9Pt/Zh
         1UDXbQivx+8QLcebhriCcpNyxidU88hrFcFPbOZ6vuhSCqfAsPtmO+tpfEgL1uSoO7/f
         zhdUE8WKugKcDMZgZwp+UaEDHefgbeDInfGcxYHY700JUKny6iWq+/Eb/QGKY17U2gFJ
         JjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702463677; x=1703068477;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C4iHwSi1orpKZdBjvEhFkZBhQdysnUmpyPPK1U/Sy2c=;
        b=fsaltqmnLzqOpso+ydnM0F2k5zAQg6K8Lax8MNjIfRvqdCys4vPZA6DK3YqLxHkHyl
         E/QuBis1zG4brq8Dcsu2smdebhj7eLD10PYFVB+s90bIeHBuXFMu1GjGm9qfBhqsEIu7
         +qw/JS4tzDPD9fixSRUvwJbYkaB0my7FGICF4sH7qNDZimR3bPS8VU2D56lRBSzh1cVr
         avPLXkRVzQtxLEtwSwtWWQlY/PwHyauw/dVTButCz1S0Z462YDegZpExsSRIAto84Cbs
         K4XtJ6qu/o2jwHjosQaXs/xbDK/b8GVERQURx0vwYqGhz9BCv+B/2DECB/ppdrC4A7UP
         odCg==
X-Gm-Message-State: AOJu0YwQCnHGyLb2lhvuEXRKnZzImeINEhwOSy/Pik0TV7FEeB9ioHpz
	HB/wcoePE7iNSRpZjf12IFfODA==
X-Google-Smtp-Source: AGHT+IEWrQvGXDSyxXqaXF1f+EAzOJFKjPH7ZFU/HjQgMdjslGSprih7nNhvsmKw57QCZClYojIO8g==
X-Received: by 2002:a1c:7916:0:b0:40c:55a7:7735 with SMTP id l22-20020a1c7916000000b0040c55a77735mr1160485wme.118.1702463677504;
        Wed, 13 Dec 2023 02:34:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65? ([2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b004042dbb8925sm22075386wmq.38.2023.12.13.02.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 02:34:37 -0800 (PST)
Message-ID: <ffa8a339-6415-4c6c-913f-245deee9e046@linaro.org>
Date: Wed, 13 Dec 2023 11:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] soc: qcom: pmic_pdcharger_ulog: Search current
 directory for headers
Content-Language: en-US, fr
To: Andrew Halaney <ahalaney@redhat.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
 <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
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
In-Reply-To: <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 00:05, Andrew Halaney wrote:
> As specified in samples/trace_events/Makefile:
> 
>      If you include a trace header outside of include/trace/events
>      then the file that does the #define CREATE_TRACE_POINTS must
>      have that tracer file in its main search path. This is because
>      define_trace.h will include it, and must be able to find it from
>      the include/trace directory.
> 
> Without this the following compilation error is seen:
> 
>        CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
>      In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
>                       from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
>      ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
>         95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>            |                                          ^
>      compilation terminated.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>   drivers/soc/qcom/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 110108e23669..05b3d54e8dc9 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
> +CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> 

I was able to reproduced it, and it only happens when we build in-tree, and checked
over the tree and indeed all the other trace drivers uses this flag to compile:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks for the fix!

Neil

