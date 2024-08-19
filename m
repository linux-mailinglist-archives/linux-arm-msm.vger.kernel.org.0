Return-Path: <linux-arm-msm+bounces-28955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468995669E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 11:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23181F231E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 09:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A00B15B992;
	Mon, 19 Aug 2024 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jC9Wn8vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798D15E5CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058992; cv=none; b=JYpXs7p4U/DnCVoqsRVZuqY6mZkU1G6Uw87IXKSxQ/v7x8IH1oYpuT/vRHVF2HGZIEzEQSzATfOcv4fN4MIcXiQcHsNvWCeZ2+LfIm7+jlFltwKQujqfLX4rzdkIvDAE6Is6AsNp3keQMGDpYz2VpcNDiySHjrdHf9NsDQ+UiMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058992; c=relaxed/simple;
	bh=M4HxD41AxnpTCiLQTaEKtdJBVGPgtoEks/DEOhlXdr8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t06Bsetivfk7xnWW5hyaj1eMeTB+1WvuKQekk6s0Z184sPRGh5Z4owrwViQHucHqlIcPmI1R7VmVUv1sLpmXTs7i37hRn4HnZC25L6/cGBXzF8kRwViWD6f7I3tTfdqd6oQwKNbZPG2MO2+QzSsX3zqAD8WWo3qf+oTIYGbxZ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jC9Wn8vf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-371b015572cso1345453f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724058989; x=1724663789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhdgRPhROCnX5bLFVFYvhFCrgNIlRk5KqPEmPhOey3g=;
        b=jC9Wn8vfgzlHlFTqIUo8CQFm0rsu0NK2cdKUlRtgkZzh/dKc+JDgjczkmkSMOmT0fu
         vZuue28vw+giHI4xr6zFRr9+kOw1XMCR35fDE/u2FPdbfK8iu72PYcY4f33qICOVDR2s
         jkSasE/6kpW9ue9DkDymAH3SgSfIBMCHPzo9WBDz5TyKqF4nAORfjhHR3PaClqbRF2AC
         rAKsCBsm+QTWMFdFdNr5QEbk1zfntiWvtUEh41q9/px1y03tvVdS2fiZc7gvZiugQ/yD
         nRhH25FVm/wBHpFvd/9Ut0KrV9Mk1oiColmI/eZN91C3XHlGL4b+mX9C8Qcnf6/7Yb5V
         itSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058989; x=1724663789;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lhdgRPhROCnX5bLFVFYvhFCrgNIlRk5KqPEmPhOey3g=;
        b=jDu1/I8CRGIwcdOkWBGpXUMX5VOvbAvLgViEHIUGGNIGzQGmgN04LsNUXqBKMAps0g
         z0r67B0X65NFUrrEVVEfUIhzYWD2/0hhrQ3EWKQBtYdrNchlLd1+eCy3nJlwnqC+XyQH
         of95TztDaismBOQIjsb8uk8ZKq+Hmr0DeNdDygq0w0mvWhtx4d2ZvGBsJ7BBVm4uxe6U
         WOHugYHN1i4Zu/y7aDHhxCVGeKa/VlQQepxnadxqNEZ+XrSCmkdEFYYpqSGz/iBrRXP3
         Ol+rRRMEIA7iFbRZNLPr0L7RTCWdQHi3r8nqYmAN4Sa+8KRmW8xaZjEOUfOJLikUizXy
         /ztA==
X-Forwarded-Encrypted: i=1; AJvYcCVXD9N9S3iLYVuJPRBsz/b5owVDg2i2y4udvvfbzZn7mka7Q0BIGyjWUIKeCQegkjQXNjahwRpIhN+dgm8adt8OAqQFmVxgFeBOnBytJQ==
X-Gm-Message-State: AOJu0YxEg2LMw/AB3BDQey8lwK6IgkLDCkYMeiFX6roupJRTCshOqz6g
	PF0raVOp/avtjsM4jFbqnivzKwKy+gpE4kyNsoID/BBaVRncBLU7dXpDNz0IeiA=
X-Google-Smtp-Source: AGHT+IGlLNnWnVua3EpqWORlOr9KVT/7tXvAlVwexe5VlvrIqMwXSW6fc2+//ghkrLZ4/+R2Z9303w==
X-Received: by 2002:a5d:4e42:0:b0:371:8eea:24b7 with SMTP id ffacd0b85a97d-371946a04e6mr7617699f8f.50.1724058988631;
        Mon, 19 Aug 2024 02:16:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a397sm9970491f8f.24.2024.08.19.02.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 02:16:28 -0700 (PDT)
Message-ID: <d84c8f87-5f7c-4f6d-bcc6-d20b05b1755a@linaro.org>
Date: Mon, 19 Aug 2024 11:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] soc: qcom: pmic_glink: Actually communicate with
 remote goes down
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Chris Lew
 <quic_clew@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
References: <20240818-pmic-glink-v6-11-races-v1-0-f87c577e0bc9@quicinc.com>
 <20240818-pmic-glink-v6-11-races-v1-3-f87c577e0bc9@quicinc.com>
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
In-Reply-To: <20240818-pmic-glink-v6-11-races-v1-3-f87c577e0bc9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2024 01:17, Bjorn Andersson wrote:
> When the pmic_glink state is UP and we either receive a protection-
> domain (PD) notifcation indicating that the PD is going down, or that
> the whole remoteproc is going down, it's expected that the pmic_glink
> client instances are notified that their function has gone DOWN.
> 
> This is not what the code does, which results in the client state either
> not updating, or being wrong in many cases. So let's fix the conditions.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/soc/qcom/pmic_glink.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index e4747f1d3da5..cb202a37e8ab 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -191,7 +191,7 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
>   		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
>   			new_state = SERVREG_SERVICE_STATE_UP;
>   	} else {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
> +		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
>   			new_state = SERVREG_SERVICE_STATE_DOWN;
>   	}
>   
> 

Good catch!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

