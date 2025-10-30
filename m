Return-Path: <linux-arm-msm+bounces-79600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97FC1EF0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E0D84E4211
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFFF184;
	Thu, 30 Oct 2025 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPkWtlYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438192F549D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761812329; cv=none; b=SvD8+IOUU3HGo2I2CisiTjhiDJazOEy0+R3/nAxJf14iO/tQf5x4vWkg4WYeSk2XnOyCEznJ0C7Dvrk5pqJwTV1yD9pYKlPOuAt9aVCTr8X+qasjY9l9d8ndtLIVAYzii6YjY0wttZk5F1LUEVdXBt/RJSdFh31pXtKYdRVMlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761812329; c=relaxed/simple;
	bh=X0R79ZjVCKro83gLlwKEEtUwluqz24nVk/lrlzVEZY8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I4EiiiM3ecOFoFGzowQNqDgZep1+eKRi+WFvX1Kjt15L9eW1GMAoN91ljxwNy8UEvg12WFSKyRYX7mPfX7q//U4w6dxHPt2CqHjU0HenMVQuREfhAbZIsut+D6Jko9Isy8gzdr3+lG47G/mhpgW0DLqZ6hW8LSteXn6otNI3jbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPkWtlYA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso3795035e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761812326; x=1762417126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n22jjnKTjPV+2WeoUAlwQeRGh9RPW9Sz0+Vh4tXt1qE=;
        b=bPkWtlYA9saSuaMtgIO85AqxFa5i3++CwX76NJiy1bkBWHJT0XjvKAaTW0RhwQgM2x
         VPU2WZ5odZUOkGa7bopTOk9EOIKttY2ZAdPOsCutYAr0QwJXqGxGDvQXVPJe3tyNUP3u
         OB7+q4I+/P7aC6lltWdGGViFPakXOul2lPuPfLnJvvCVZ7t/xBB3lNsfSPQ/iv1x+gK3
         MgcNxuwkJKnmOqtuW4AiW/UwrRDQbWQRHNBvrF0pbjdo8ydq0IuARNH2wip9gxHjQZq6
         kCetb7/FsLHuY39RUk8Ar52Do3WXQhpDuWvJ1wglL1umZ8fqrxV1zR3oI5vwwjv8D49M
         pk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812326; x=1762417126;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n22jjnKTjPV+2WeoUAlwQeRGh9RPW9Sz0+Vh4tXt1qE=;
        b=B8dXBtCUXtlU+TGkArfrBITHb+Tov+9Xinl193MSac3GrNSxRe9s2aNuaq1VeGTr5U
         tz1FvBuyvDPudAxcL4jgmWWbuQ88AZs2L8LwzAIbrUtCgyqgrLxXOJxYihFFH/KrN++N
         TgMhMS4IVIoufK4cKxnUFgsdWet1F6eCQl00DZ61uRaUp+bqhljaJ3z6TSklblqE0obW
         +99XPUWZlzgLuYv8dZQ6BjUrtC1R2QSq1QtiAtBOB1InmNcvWdYXf0q9Hg+u4lrVCUQp
         9f76UZvYLJQjtcL/aGrDd8ejGokLdl3CrT/J49vuCmvpZtz/tONeAyG2jHBWmVnInaQd
         IjcA==
X-Forwarded-Encrypted: i=1; AJvYcCX4XTwQlziYG+PbVe72IU1VwKkwUXn7L0w9EJVwg3oExs75pa0JwKeTN07bDAkI8g0mnvz9+if3qsocUffg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rcNWSoudCpTuTU1CkzyNAu6Lwji2DWUf0sKTMs1TK2MsvvKc
	qDJTvcB+KSub3ppi1Qc2crUXoombBlJIO5+BI9PyWA8uAvBgJ80cB57/6d1q4Q20iUKH6/a+kUT
	l7Chz
X-Gm-Gg: ASbGncsuUJ9mo4xPn3Tgg7ly22Dq3kE9BX2kW+EUqhnirkyTEVPDFcKhHMu7bUbacnv
	zdB0l5pSGgsDM0hCFKgd7Yw3tHkVB/PwQPKF4XDSIc1sBNCbMMoL7whmAnrkEEAqoS82Aoj9Ur8
	FZPz7DsievaOkmUIzusRyU6Jn6HQ/XR0GcMrhD+2V14eJPHUgQ8WBvnEXRG3tMz3YsaMNChXWrb
	EzHx1DGtK9IpbSdHqWc2drMmyYJsu0qOjHPwE2eq2Ik+G11NMkD3fcHKTLU2duEAiH45Vx3Um1L
	jl21adAoAc/ixJJ/o8hlXilTbj3bYNdVMYZTRkU6Hdhma/tR5KEJnalnnXIDeLpzvIlRRz+Utku
	MvSFtU8SwV8vhM6OgGrtyl6jUAlZ2esbrQZo2ppbvk6pPQ29v+UOlPSndzZKNikgEKF3bUkNy/6
	BjuxDZIedRr+N5HssZPyYKTzLL2sB/3+kjkPwDtHFw5DV2mDhG6L8I
X-Google-Smtp-Source: AGHT+IEPEKlS1MXFKcHH4eUEEpj3CY6CH7IIM3l1El1nu+O9i5LhtMn2UPjpukubmdgPWNokkI299Q==
X-Received: by 2002:a05:600c:45c5:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-4771e316cf4mr54045975e9.7.1761812325510;
        Thu, 30 Oct 2025 01:18:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477? ([2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db964sm30787325f8f.33.2025.10.30.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 01:18:45 -0700 (PDT)
Message-ID: <dc589c50-aa4c-4bbb-b481-b3a66fcba095@linaro.org>
Date: Thu, 30 Oct 2025 09:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] mailmap: Update Jessica Zhang's email address
To: Jessica Zhang <jesszhan0024@gmail.com>, lumag@kernel.org,
 robin.clark@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
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
In-Reply-To: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 07:31, Jessica Zhang wrote:
> Update mailmap to point to my current address
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
> ---
>   .mailmap | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index b77cd34cf852..1c57bd649f04 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -352,7 +352,9 @@ Jesper Dangaard Brouer <hawk@kernel.org> <hawk@comx.dk>
>   Jesper Dangaard Brouer <hawk@kernel.org> <jbrouer@redhat.com>
>   Jesper Dangaard Brouer <hawk@kernel.org> <jdb@comx.dk>
>   Jesper Dangaard Brouer <hawk@kernel.org> <netoptimizer@brouer.com>
> -Jessica Zhang <quic_jesszhan@quicinc.com> <jesszhan@codeaurora.org>
> +Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
> +Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
> +Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
>   Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
>   Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
>   Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251028-mailmap-fix-50434c548816
> 
> Best regards,
> --
> Jessica Zhang <jesszhan0024@gmail.com>
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

