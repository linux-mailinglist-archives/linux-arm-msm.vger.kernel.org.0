Return-Path: <linux-arm-msm+bounces-58652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C4ABD16D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4306D1BA1CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8741325E44E;
	Tue, 20 May 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PslVIsdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D225B69F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728339; cv=none; b=dCrpakXDOSxw74x5iil1odM10lIDsHXsuoV1736ZtqA2f+BonR2ui700masit90x2lc3Nn30jz3aufYHbGFjJ3w942eW4m8Z4HVgXDwgQencMMZf5bxDuq96n+wgOktqoVcmXm1XY9zFJu8QvOv+xiD+ysCPcdZGNTRKkp9WqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728339; c=relaxed/simple;
	bh=U+fdJ+LN47DCRlLdlkpJ/e8m1KOM3FbjfTyZPhRrfH4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lJqgf2NhC92FXq0tdGhMrpd2lRA/K0u3FmT8Sc2pwKJTy7V8HlgD46pcGez7ko1ZpPyIuzMUUeKuxbYWaTbiSdkYgZ+MjTgnjaGOA7l4E/I9yjCqLFPXXrYgNgmnIKJgfLjhyXMRkvEgRu8oPMQlgbIL+yl7mntKL+gb0ilowIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PslVIsdz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a35c894313so3224086f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728334; x=1748333134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tob6RuC8dgPV7JIzMkiLHumK10RCkOp4wHKrmtVQAT8=;
        b=PslVIsdz0n+6FnjD21/icd2w/zmDwOuM9qPHT8Sx9SCnf9Ajqgwb48fNjUJFgFfRgS
         R+rt4IQtmFbiZG/m9fVal+h0qU/J3DM1A2UDt2Q2RlVptULS1k18FvX147gDpW+qj4Ws
         cHD9HGOAuwvlemMbSmj1Id9YYiqcOJB0kfsnB3lROIm/tS4TLEMiFzV36h3DuoWw2c4Y
         jEEUDzDiwXLS/3pBZqjsNOyDNgj5LPWjSko4v3Yt1n6Wxjz+JwfoQK0NrAcw1+Kt8XLj
         5us0YjbFeToZm34YDM1LOGc9Nno49e8flHRBL9BsUJiipsAbGND0S4v0ZZf20/DBrM+l
         vP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728334; x=1748333134;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tob6RuC8dgPV7JIzMkiLHumK10RCkOp4wHKrmtVQAT8=;
        b=myMeGF18o3TMmf9WjbYOs0ELzhi9fjyMmyR1MqpRbs6+wZsXli63Ao3L2ctDwbQxeD
         BezD6xD3LGP29TytwBYMmTOODuam25gVHT7aP+JPzrlG3X3d247KPl+5Pv4tLfSUv44T
         BHPZ84x8cjHmi9S27EI62Yi1DmAFsjhNio3QTfqPFQJYbeaBKPwY1JihQV3QsZornRSQ
         zss1fNMwHpL+SpGnQtXvnE8k1PRz4e67CjFYX/RdIJ4WsuaNnOFxcjAMb003H6F6kHVZ
         zhjADbnvLkeNWckbqESonU1W3IrYL4rxAi4wOTt/N5jXpWk7bvFGKUlSBoEB+moPBpM+
         5iNg==
X-Gm-Message-State: AOJu0YxrrgAsaqzb9a8g2hctma987ftWN5N4wjn2D/LGXr45ntjhAtV4
	ABBYr3PUhVD7LTWKGES2iA3luRf3+wy+4vyuhEOGdV/5ourQc28LbvpUVHTW34gvTe8=
X-Gm-Gg: ASbGncvJJ5uJ+oYBANd1hezEDalpo4vZmTuqw4/qT16wCRmXLZ7QCJPTrH1pQk6OrGc
	qaChNI/oyH+Nwa9jfoGY4bkPCr9ifmpEJ9tHAYuViWXDNbMOREMzmRdMdL51P+2XwGvORwOfmIk
	D2eI37IyB5e7AoSzahR3ctfdLLSdKPSt2vkKYGqdz9QNExACD75EmdeAMy6fXoP51Xfo16T6cpe
	BzEGKRkgI8zhA92AnxB5FdiG9B2q9JNbo1BWq4QNL5LousQYUDJkIIv5/2/giJNeiFVyeaBScsU
	QXgz95XcbSZsjZX6SM+/HA9/0zins2a35QgPfhwS+mUQFzum7piEirqfHB5BYjcw0V2ADhnh1p8
	SAxRB2NogdE56HpsYkqy1IXmSBWNoPDu5W4jeNuI=
X-Google-Smtp-Source: AGHT+IHdSxS2nTGrvLuropA0rHENFxyZSFHMxOh0OmlD62ZrexTI0z/dDGvjnhVs7yeJPczsIO1oqA==
X-Received: by 2002:a05:6000:c0b:b0:3a3:5c64:c60 with SMTP id ffacd0b85a97d-3a35c84beacmr9942754f8f.59.1747728334579;
        Tue, 20 May 2025 01:05:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36c6eeaf8sm7997434f8f.48.2025.05.20.01.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:05:34 -0700 (PDT)
Message-ID: <476a5609-ba9a-489c-bdd3-c6ca949a9b06@linaro.org>
Date: Tue, 20 May 2025 10:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Drop unused LM features from the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -66,16 +66,12 @@ enum {
>   
>   /*
>    * MIXER sub-blocks/features
> - * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
>    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
> - * @DPU_MIXER_GC              Gamma correction block
>    * @DPU_MIXER_MAX             maximum value
>    */
>   enum {
> -	DPU_MIXER_LAYER = 0x1,
> -	DPU_MIXER_SOURCESPLIT,
> -	DPU_MIXER_GC,
> -	DPU_MIXER_MAX
> +	DPU_MIXER_SOURCESPLIT = 0x1,
> +	DPU_MIXER_MAX,
>   };
>   
>   /**
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

