Return-Path: <linux-arm-msm+bounces-58650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D745EABD161
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56FBF8A5FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC8A255F59;
	Tue, 20 May 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRLXQtoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60EE21A43C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728315; cv=none; b=I1wE9rdFt9+HyVrBbc/SvzB7XawSfgm7zahle9MPQCW8Tz/G3KRe/XRSgShH423MGgeZxa/0nEpjbpZRKzAeipc4QEhSao6nCS4ca997qcW5NdXhVP3YjqVV+zUGyHD0Psl7UBfdlyeBz2zreSG81vdsnph7UmbujRaYbF+W5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728315; c=relaxed/simple;
	bh=wWkafiNEWdpxukzyksw2hTHdNCcqHphqd37cyWmEwYA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=faAh8jFGp9pK9W9O+t664QggNIBBSmlJwOb6NvIscPCeJDRQcjT5h1L3BpUkJjZMd+Vj/LJ+Dli0uvREELLJEH5alwwlCbowri4VBXMJ95jd74KAsueCMxZQvJcSzbH7TakAKwZOzZ6RGfErbJs3lHqu/eQaBNGyyML9XWPcWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRLXQtoj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso39539705e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728312; x=1748333112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
        b=BRLXQtoj3XcKiP9Nu+QgLGK2NVz90m9JFCZyvTC29GhRcYHyEh+19gNaJUfRJHxntl
         KUm9tt33iomk1SkN5s3hyoUC0DRCiLUwWb3KYMo8rHxxhIstYX9vuy0dXi674Krcvyuv
         4HbpFucAJfDGuQkEn96gIQqvpZ8e6IbAPz1stqKtZk6RdDSPlL+MI494nqvGMlbDylFi
         5C41mgjndOnKBZpvZrQkJmUi3/kjp6yhk0EtIr0VFcb05E1SAWR3AbhEN+ZmIiP78WxZ
         p4wuks0QtZw1vTQoBO95seE+QFnwo/HYtQ9B0FLw/qNLZCgkIWEVMhpx+tyKOHEH7PF9
         N6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728312; x=1748333112;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
        b=iy5bVhwPMzAYODUth3xfjg4tXcJFC2kK+lLaD6DfMpxAJeS5BIsbh2N+ut6vv7617U
         R3ydub3kLRB3Q/a2tWDFUCVEWFmH634qFBOjkeRqw1KRuUkfc77Omt8v+ldEdu2ZoJcX
         OhpAhgIY6mkmqnlRfkY7T4uWyzhpZ4RHQQjxpE0rvAFAteKXdfdp0xkAjs6mBAq4WAXg
         FZ9UOPx4KSpgfVsj+QqTflTwRsE7TL+ke1uRQMJMHuN9WvORhD84LeFY78r2HhMZZmnC
         3sqHTb85jKdswaw+Pf1h6JhDwUkvy1UI+PCFpE/kVNynNrgAODxOQj4YbiJUKOb/4j4V
         zXFA==
X-Gm-Message-State: AOJu0YyziQBK9hRfC83FPQdVDy36Uv9puId3r8ED6OlUcpzBf3y4vbW2
	+4hOIn09ovt4lxjrt7vlCBRXVuCSiNFp/ASn9Kpo4Wp7xgsdpDXM6I7JtRIETf1NmGw=
X-Gm-Gg: ASbGncuTwEhkmVr50+dGI4Ra64X0E4sLpouHfpJUvB42dhrH9qPnLY/Yz0akKOCBXYv
	ILFF0/KJRoeVqiwS8LsGzczQDqXQYXCF/JQczPDZyPjlnxeFajYBWdW3Kc/bp2aPv/vwMMIdXm1
	xGQDcM07e98OuGHAX6PFaUgqkq6dxjlyfeoMjcY0jMRmYcLKgMvMgDN2Fg9XpN1+aCsdZV8y3Mt
	sh34kjzoWZkBGPrQntI/GaReJqB2ACxDAvrhJg/C3jv3LoZkh7ZtUB7o8YT7L+OXEDNuMdCVLZb
	ovUhVuB4d4KI+iI5sOk9Xs0CzVvGtgKhfKHsh8YiI8HoM/JGiopIlyRXlvoIZNims4P4MREarnn
	kIpDhsowIrPiVKnXy6mIE0l01LCgN
X-Google-Smtp-Source: AGHT+IGP1iT2KS7C1jAAS9avfiRYegZAXZJbq43ThFN2fqZehYB3eN8S1ivyCQg/LLIAvxsCPpLRRg==
X-Received: by 2002:a05:600c:3f06:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-442fd63c7aemr176158525e9.16.1747728311950;
        Tue, 20 May 2025 01:05:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88990sm15825687f8f.68.2025.05.20.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:05:11 -0700 (PDT)
Message-ID: <7142ab55-9173-431a-98fb-a78acf0e5ddb@linaro.org>
Date: Tue, 20 May 2025 10:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Drop unused MDP TOP features from the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -28,19 +28,6 @@
>   
>   #define MAX_XIN_COUNT 16
>   
> -/**
> - * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
> - * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
> - * @DPU_MDP_MAX            Maximum value
> -
> - */
> -enum {
> -	DPU_MDP_PANIC_PER_PIPE = 0x1,
> -	DPU_MDP_10BIT_SUPPORT,
> -	DPU_MDP_MAX
> -};
> -
>   /**
>    * SSPP sub-blocks/features
>    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

