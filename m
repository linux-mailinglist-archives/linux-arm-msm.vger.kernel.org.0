Return-Path: <linux-arm-msm+bounces-58654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6EABD176
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EBAE1BA1D23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D725D537;
	Tue, 20 May 2025 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="El0bxGAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AB25B69F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728374; cv=none; b=HPJ8JAeAMXgywpODRpzbhpZWj7KyGdIdkV9zHwxdWgVLQtD9e7JRoBWbIqeIvvFzmPZzS/3v+wSYlijdI1q0l23o/HeF4Q/EdLzxNiwZ+upsJSzBn5/bcYVvn92l1zu6iUkxOrGzCem60XMp82NXKFB1JIP/AGFRwczyQMvwQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728374; c=relaxed/simple;
	bh=qpuDQxaClm3z8be941HXqyX9wybTje6vApNBaYOJC6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZtVoUdkNGnBKSOvCCIJM6vETSiB9UXNyAsdDovzIIwPykJTFTPDRl4hus2W2xBJ/QttLHPIGoMbBPwVIFZVU6ccPfyMKmhkxhPliU2g0kuIyT4IpJyXusS5I03pk2n2eVghr6fE1bOscT7r9G+kBnFjrpmSKOD5jn0EKhmdHqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=El0bxGAf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36f26584bso1128670f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728371; x=1748333171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
        b=El0bxGAf2vmOasbVy2CUfYg//mQ6QR8f/A6J+fuTXLocnOTtmoaHlM+tPtIwRLMiyo
         qerVm1zXcZMbsUvMbs9qZVxltQO0IRMIW2bvR0AsRPd3mJf1mx7/J2Elqn9nMmbm5JeB
         2Y4Q4jt5yTn50rAlNeJd7Q3edwl7lUjgWG7PyjSIE3bYBSnL4i+bkWa38rqyQ1UaSCpl
         r4MvgLvdTCXHmE1KWHsS8AvamgtN1wVQLpoWjyv+3m8ZI25SouKjoBCVF5Mz9VrwKj85
         Z67d4EhNAYOCl3xGmfkSBNK7n5nV91hIwb3x+VqyTqjNDrjJwbaheIOae01YJdqBReCI
         4yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728371; x=1748333171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
        b=kjtqIStqjTIUgc3uqNkdDnHXJ9k7zsqz2ooTTVm9C6H8merh/Ovc/SevOzC3sjzrrs
         UWowNdSwkYJDfQubFnuK+/gv627whRNweDoPwY1h5KwUaMH+wTiDNC0VFkc+vj4daYZS
         zN1Jt8b9zvtohuWNqdp2d1taHeR/4YzNCyPqHjS5gZJRC9am2K1An9eP4U+82otp4vnR
         1qUzZ3u0sqUIcsxVlvu8lpSHCl0X4jza/Qtc92zY0jVYIifwZBsRX7LhELhGWGwvAcyi
         Y8Wk4EOZ4NEt+ZIZd/VnW1nFeS/HhmigAGVWr2df1bYYnZZBBZB3fdpzsa1swoBHxCY5
         GoSg==
X-Gm-Message-State: AOJu0YxOE/Rv1f0heBQxwa554mo2KVWkTgvlE0YKHL4r+cLPH6tLgirP
	rd4nXMEYmsreOtFj0D0BD/bpdTmnZyZTRndGEOk1HeZTUWccWSqwwyg4lYeVQjEqaKI=
X-Gm-Gg: ASbGncs09BeO9OTTVWFuWiNJ6rpJjFFeby8hSO65vimRpPc4vYSyo/Ip8WUmWwafUX7
	V3wxGQIJNbdpDD6YHw+9aB/nYaDXhvcwtI1+Km5AwwCwghgRyLvcsXHtuX2qwtcDb9ZKyn9853k
	A7hunwNf9wlpSqKcATkvua9pvT/rdGpWjHHasJQ5p9l58OsTDhPCWhfa3UAIx5O3BpLjUkQpdTU
	/Ne9M6uLbQOvYIMDn53i7tEWP0r0S97uc5FqLyMqvcncPNd6NXasDhBrQSYDP8vFreI7Jy5tl7s
	QTT0deuWZMyl8zKFpB4VcGH1MRcpMKX9pjp4kXCFhZhYEJ9D+ZEmWmPJPsyl6KIbhCT91Gx8hOy
	jq2epmpKLt0vDqmngn/qYcF8KKnQ+
X-Google-Smtp-Source: AGHT+IFU/KqkjaZqWA96xVqbCJbAg44BaTwi9c9qATMvcmY51YXkMbr1hDQrWO7pjZhFY+VTnRD6RQ==
X-Received: by 2002:a05:6000:4284:b0:3a3:5da4:d80b with SMTP id ffacd0b85a97d-3a3601db731mr12950882f8f.49.1747728370901;
        Tue, 20 May 2025 01:06:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm20643995e9.18.2025.05.20.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:06:10 -0700 (PDT)
Message-ID: <193195a8-1e84-4ec6-aa3e-a02d00bd142c@linaro.org>
Date: Tue, 20 May 2025 10:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_dspp_ops() function, it makes it easier to handle
> different conditions involving DSPP configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>   	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
>   }
>   
> -static void _setup_dspp_ops(struct dpu_hw_dspp *c,
> -		unsigned long features)
> -{
> -	if (test_bit(DPU_DSPP_PCC, &features))
> -		c->ops.setup_pcc = dpu_setup_dspp_pcc;
> -}
> -
>   /**
>    * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
>    * should be called once before accessing every DSPP.
> @@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	_setup_dspp_ops(c, c->cap->features);
> +	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> +		c->ops.setup_pcc = dpu_setup_dspp_pcc;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

