Return-Path: <linux-arm-msm+bounces-4427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B62CA80F00C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 16:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71953281B71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ECC75424;
	Tue, 12 Dec 2023 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTQfc8U9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE416D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:23:23 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3334254cfa3so3289180f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702394602; x=1702999402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLveY+Pokx5uDRZES3S6PKB5X3Hgy390Dfo3ty9xqJ4=;
        b=vTQfc8U9HISCw/PAv10osMjSMrbCZ3gjwIghpMESVFD7adzzENdJUP9jY7sM+SfqKC
         6C9DiaNYs9PGudMfqXGtrpVvUqaM+M5csReKiem1gce5ZJTD7bUo7XC+Xf7OTvG4pgjR
         hpt7LJ+p45E04emK0lVH8PKq8LCTxsN7JvEbGGD+gvd/7fia83IcPy8rZ9R9HsYAnaJA
         wBgNMhLQxmPMjkL5yhotuX7N1zIyUWruyy5rMf6gkzRryjsNGPLLapE29GJizcp8OFtg
         RmWAhdq6amie7ihb1B+GKXBusBeGEWeAbCHoE6vaZdo+/rYGrg5b/9rm3ZCdKxblFzxz
         FUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394602; x=1702999402;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zLveY+Pokx5uDRZES3S6PKB5X3Hgy390Dfo3ty9xqJ4=;
        b=WBqApBIQ8HGOkwJhMg22ib5zZ+P4mjN0b1n7K05WnnKfmUCHFTcfvvJZiz+7vYnYMw
         hCQ+w5apuMqC2AIZW7S1RGhbxydTy9gUJLbjIBDU9VI2mr4rO9x9ZI/s5B7Am5JB0+Xd
         5VH8K0do/DwSUzcGmqIZhd9CEH/XiUNzQ+lQIa+0vwP9PM7Y9rO1m91QS9S18CEUaaEw
         pXzfaIflLxXNGGeDXFp7/kUPoa0PT37hT9219fvaBE1JN26mT1kZPouMjTbKZGX8VhL8
         C4j2uqeL+PGHUasbTALeato5YjkRDrEurXJtfws3dtXgXKKlcIZ8ol/wA3WmfRm3fjWV
         eujg==
X-Gm-Message-State: AOJu0YyCHiaX0oJespfDc2bWlKVcrEQjursEFy+jKvBB66y1P2O4Mku/
	0csPwRYoPiaRPLu0CPLrfddNAA==
X-Google-Smtp-Source: AGHT+IFUb7bFOx5K6DFKyfihkfLZazP6IQifcU/Xu0gfL7S8lh+VQA/lfkl5MOCJxZMFONr0TPImBQ==
X-Received: by 2002:adf:fc07:0:b0:333:2fd7:960c with SMTP id i7-20020adffc07000000b003332fd7960cmr3221601wrr.71.1702394602171;
        Tue, 12 Dec 2023 07:23:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5894:fa62:26b4:bf82? ([2a01:e0a:982:cbb0:5894:fa62:26b4:bf82])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d54cf000000b0033635d121besm725476wrv.52.2023.12.12.07.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 07:23:20 -0800 (PST)
Message-ID: <320864f5-fdd2-4345-a0dd-b97bcf17f473@linaro.org>
Date: Tue, 12 Dec 2023 16:23:20 +0100
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

Hi Andrew,

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

I never experienced such error, and no CI even reported it, can you explain how you got this ?

Thanks,
Neil

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


