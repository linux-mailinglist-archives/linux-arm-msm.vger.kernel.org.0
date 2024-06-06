Return-Path: <linux-arm-msm+bounces-21872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BE8FE3BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AA67B27A91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2110A178CE4;
	Thu,  6 Jun 2024 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anMOK0Iu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4B178CC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667261; cv=none; b=ppM4QfujpZVE3r3Y2lmrvvwkSy7yqE6C4fH1/eKmpezbB3xD3RyiOV30Uhp0e0mUKyYzHy6NrfQ738KmebDXfhyctbGdwIWteCye1EmlsjdrAyuYMylfz6SNrk8VpPm5xoBSHR09xQEg5xzTiOg5wW9gQuzeydb3u9k3AnNsAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667261; c=relaxed/simple;
	bh=Hi0neK8a5ZCe3IvW2h1FQfZB7W5FmPki1KuXMEWVHEc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jdUTGqjljoGspphhKiBkEJOWoBdeAgTXAGeJZt4iP3gLVVX/vu3MG4c9btGh7aVsjTuqjHSy6GJdZVtLd1KrrHc5Wr4oPeyodiejiJjOh/0PQwug9izwbj5ZkwVq+8TPZGTQ+0jjNS45IIEHQUyFU3EifMDVdJyeEex7qO7iqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anMOK0Iu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b976b5d22so1090106e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717667256; x=1718272056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEOxwJ2kGSzIBxrSyY+xehPPjLW7bypGPaSh+KZyDyU=;
        b=anMOK0IuCTZI5l/kZ+oMqBxGqrEfrhY20k2ZOvOg80X0jfBitt3D9fimwrDTMwEHJJ
         wO2Jw5SFVzAatg6g6ZR4jBxIK2z9tEcpGv0B8BxYIMqNKkp5K1cg2VUZUsWlSW7M/a0q
         xHgv7LlV1Eic+WwbfDLCDmfSSxPKgW/CaQKiaRQNAvqI0Wgb2mz/nkiuXBuFQslJiIkZ
         QCZI0/2omxwMlGFCFT3MsuzKIg20+lTxBK14Q3H0Qze3QX885LjkdyrHjS8VahxsMIBA
         xOlpkK+b97h1mjeOxekO7O2L8m6cOT/JHbnCfNgu4v6kwUI1bxCUs6dO0q3hDNoaA/hh
         aAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667256; x=1718272056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jEOxwJ2kGSzIBxrSyY+xehPPjLW7bypGPaSh+KZyDyU=;
        b=hGbA/wQ9yAlt6YB4Z1doGYXExHJEayn6jqjdQ8clIPwWZMc2C5qPzKHgFv700gZjkG
         E/fJLAPKLXhAxeUCMyX+UXSyHAMCrhnha85dH9SJTunIyVbpWB5NpWdYX67hEtYzbGuH
         hJNDK0sVrUYTBQAx24fJJeXqv7jVhEP4NtwbkvEy24ReQ+ZBYRo0LSBAxIjI0yrIoKCb
         rZpKoWW5TWy9yBn9x5vWcz1Andxz/m/kEmTMrrI954NbkgIug3bjqLJCgQVoxIWrWOKl
         uUWQbdlzPUUEskBj3RtLvHJuB5SRqpuzxDb5bxxfKMuRB5C4L6chm/14TAZ6tLUuGw5N
         qVUA==
X-Gm-Message-State: AOJu0YwUdfIM5X8uU0uTlz2QScjsCIGtuBQUIsKNdt6r1FnwGEe4B8UP
	LYU8FReZAO0VWw2a6Pm4v9V/ylhU5FwdQsooN+QxRTzGv42Uw3zpCPMPzTffN+Q=
X-Google-Smtp-Source: AGHT+IG0yvEL0O3oat+GTMYZEZNdBMDvDLjdTiuRfzC3KCgGXCSd1rKmECmcW4B/bNfy74c09Rvnzw==
X-Received: by 2002:a05:6512:234a:b0:52b:aa2f:d8a3 with SMTP id 2adb3069b0e04-52bab4d813amr3391217e87.34.1717667255898;
        Thu, 06 Jun 2024 02:47:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2? ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158111143sm50138045e9.20.2024.06.06.02.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:47:35 -0700 (PDT)
Message-ID: <1d9bf8bb-af00-40d7-9c58-fbb6f6dd9e77@linaro.org>
Date: Thu, 6 Jun 2024 11:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 0/5] soc: qcom: add in-kernel pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Xilin Wu <wuxilin123@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Steev Klimaszewski <steev@kali.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
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
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2024 23:56, Dmitry Baryshkov wrote:
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
> 
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
> 
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Sibi Sankar <quic_sibis@quicinc.com>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Xilin Wu <wuxilin123@gmail.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>
> 
> --
> 
> Changes in v8:
> - Reworked pd-mapper to register as an rproc_subdev / auxdev
> - Dropped Tested-by from Steev and Alexey from the last patch since the
>    implementation was changed significantly.
> - Add sensors, cdsp and mpss_root domains to 660 config (Alexey
>    Minnekhanov)
> - Added platform entry for sm4250 (used for qrb4210 / RB2)
> - Added locking to the pdr_get_domain_list() (Chris Lew)
> - Remove the call to qmi_del_server() and corresponding API (Chris Lew)
> - In qmi_handle_init() changed 1024 to a defined constant (Chris Lew)
> - Link to v7: https://lore.kernel.org/r/20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org
> 
> Changes in v7:
> - Fixed modular build (Steev)
> - Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org
> 
> Changes in v6:
> - Reworked mutex to fix lockdep issue on deregistration
> - Fixed dependencies between PD-mapper and remoteproc to fix modular
>    builds (Krzysztof)
> - Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
> - Fixed kerneldocs (Krzysztof)
> - Removed extra pr_debug messages (Krzysztof)
> - Fixed wcss build (Krzysztof)
> - Added platforms which do not require protection domain mapping to
>    silence the notice on those platforms
> - Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org
> 
> Changes in v5:
> - pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
> - pd_mapper: reworked to provide static configuration per platform
>    (Bjorn)
> - Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org
> 
> Changes in v4:
> - Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
> - Added configuration for sm6350 (Thanks to Luca)
> - Removed RFC tag (Konrad)
> - Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org
> 
> Changes in RFC v3:
> - Send start / stop notifications when PD-mapper domain list is changed
> - Reworked the way PD-mapper treats protection domains, register all of
>    them in a single batch
> - Added SC7180 domains configuration based on TCL Book 14 GO
> - Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org
> 
> Changes in RFC v2:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp
> - Added missing configuration for QCS404
> 
> ---
> Dmitry Baryshkov (5):
>        soc: qcom: pdr: protect locator_addr with the main mutex
>        soc: qcom: pdr: fix parsing of domains lists
>        soc: qcom: pdr: extract PDR message marshalling data
>        soc: qcom: add pd-mapper implementation
>        remoteproc: qcom: enable in-kernel PD mapper
> 
>   drivers/remoteproc/qcom_common.c    |  87 +++++
>   drivers/remoteproc/qcom_common.h    |  10 +
>   drivers/remoteproc/qcom_q6v5_adsp.c |   3 +
>   drivers/remoteproc/qcom_q6v5_mss.c  |   3 +
>   drivers/remoteproc/qcom_q6v5_pas.c  |   3 +
>   drivers/remoteproc/qcom_q6v5_wcss.c |   3 +
>   drivers/soc/qcom/Kconfig            |  15 +
>   drivers/soc/qcom/Makefile           |   2 +
>   drivers/soc/qcom/pdr_interface.c    |  17 +-
>   drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
>   drivers/soc/qcom/qcom_pd_mapper.c   | 676 ++++++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
>   12 files changed, 1190 insertions(+), 300 deletions(-)
> ---
> base-commit: e5119bbdaca76cd3c15c3c975d51d840bbfb2488
> change-id: 20240301-qcom-pd-mapper-e12d622d4ad0
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Thanks,
Neil

