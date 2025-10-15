Return-Path: <linux-arm-msm+bounces-77317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D560BDD208
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3EB51892C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827AC2FE57F;
	Wed, 15 Oct 2025 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3UgX7wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C182153E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760513220; cv=none; b=svwsJU/msEIb0U9SatXEdqkq5tmyQ7fE2WcBL8+tm1zqWV82yKnXiwmIH1DHYZk3nw2rU3K1gbotJd2p/+DGVCtiHEQCe5LMRZX0W5QdOiPYAUW0Ec2DcmbA+axkSRzm2xJIOBifmGoS+WwuJTRp0Df/07WZ7F+6IVtQz9nV+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760513220; c=relaxed/simple;
	bh=RIBIcru890Mj6NODlam9vou4/ncErTmaLNlElPW1hVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WRjv0Tjl3XCFT/Luq1vVy14i/W89B9Exc0uVesHwyI9w+fqOlojc/3k0l72yYaSnH/g4j8VBNnHpVKBis2gr5caA+Weg7zz4L4iG2yYcXXaI3OOFA6/WmlZkHk1EeiCw9Cizf6y2FKIt/nHSEV4J90nrUlYrL56UUf/y6RjXCGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3UgX7wz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so3689815f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760513215; x=1761118015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
        b=S3UgX7wz//QQP/Aiv5HxU1gtvmxCvlHu2w4QwP+y6V8subSvgAuBQNaPbiOE4Bt74g
         amrYTgtOPDrwZIn1pMd5otvzS6if7Uxxn7VERJG92sH7t5Y0euB+CNybwg0NocAGW9Xh
         igEQdIAlCOijutehkZgQKDcg1BVpmr1/fPI2shvu9e3aqcj/BGgl+Hrn/tpXAKPw4Wyr
         AMbOQQ6bJjNc6MQOYFT/sVoYzdru3GRaAOE6B2ZqAELmt6wBU3LPexLgAbLXIJD9ps36
         7xtPT72L1MFR519FmfOxXIdcwiC+KLqs4uG5qMfUETTmnTkeIpqn/kQHIDxc/LjBd4IP
         VUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513215; x=1761118015;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
        b=XA/9yp2c0Hhwt2DR15yGzPgz/5Si6ahiXq+1/zrLoOmtIkJ5v29NsWSlLaqdDUyGL5
         OrF1bSIpRDLTmk3Er/nhmNR5kfjKXEgP/gz3L/+qq5XCD/HvQ3ybMeeHF+qa5hyY0vOL
         I+yBkao0t02HxpgX/Y+uXpSuL6H0H0bWF626krspQUb96VhBc1oZ79LHwiBM/cE8iCnN
         K6b2LQ9GZI4qp993pNPY29Q9KMbZjhKj+FgbRUpHAhJ+p/YgU6Z7IJZHy5Fj+ay7QXcc
         FLMgaJOf30wK5o/Yp+JalcEY8tpFrA94XjKjg9GPp4d3zcfIFOI+dDMDltZ0Tk9cHTmO
         xVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWvSJJxaiUgirmcubvC0HS4Bl8RpdSQX1uPzCdsV9woqlKfz+aubMTvCWfXo5zjc0XJHshkd8ZksGZElB67@vger.kernel.org
X-Gm-Message-State: AOJu0YxhU5+R3ET2aZMDQt5+9ak+fRKx8kKvqLuuuCysvfa7v8IPlZmP
	1I/MOrKOmXcyvDPwbz+fxiUuX+O0U2szzMk9J6LYK90xA543YeVLMJzDSZEfotO7hxk=
X-Gm-Gg: ASbGncuu9gsUEb0uF5oKo5CN+8mIM4uyfgikU0Mgsj9Dh+oAAE94ZsHlZlh6e7jGnF/
	/3Otyy+5zTzLC6WraWksPVS7epA+ocbStrqrxyWO+nH4LSoNsmav46VCNFXsNXUER+4kFXEK8v0
	fnXl1xmAKX0WpcZFCAJJDRFVLWRDKwYlKOzi4NX8PPdqAziDZ1Bu5EnbBcxVmgycleBka+qkzNY
	OEHyxLzeEjy1NNU4atKflMm+iiO6+hpj5vJWJjhnm2Fpah8/P1MauqyejIgTJLXgRXvBmm5OOj9
	mLlpH1mD9CE9LwTMKRu+xOOUa3XaD5mvmmRdVX86vfYRA9VQJtgeQd0BTGe8XDTtsZbCSTPnrKh
	KEiRlJsmTXNjpQ422LOAV4AThTbZYlov1DxXNZ5GfikqXcj54sL17yZavBaPHi9Y4HVn8ZrEZo9
	LGslqo6Znyrz5NIxPWlWW6uHNQ4pL+Pkf14isqG/kx
X-Google-Smtp-Source: AGHT+IHHwcCTmm/vrgRmtvSgxozxppcZledDwbcL4KZQXqwFqDlzftxRdw5MBdI9t2oHDJ1rb68IEg==
X-Received: by 2002:a05:6000:22c5:b0:3fd:bf1d:15d1 with SMTP id ffacd0b85a97d-4266e8dde71mr16693928f8f.49.1760513215308;
        Wed, 15 Oct 2025 00:26:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa? ([2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm27556373f8f.44.2025.10.15.00.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:26:54 -0700 (PDT)
Message-ID: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Date: Wed, 15 Oct 2025 09:26:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/3/25 01:57, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9..7a712ded8f9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> @@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Could you also update .mailmap in a follow-up patch ?

Thanks,
Neil

> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251002-quit-qcom-5125b64a86aa
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 


