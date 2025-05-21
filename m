Return-Path: <linux-arm-msm+bounces-58890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78713ABF4D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB84175E89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45249270ECC;
	Wed, 21 May 2025 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeetkTu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBF27055C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831888; cv=none; b=Hnlq1J3VqNRJ485eJQFYG0r8neZcLzXxHgNFiwMq7ZRcZOqCE0nL0HV5LpvsfYvOCEII/31EQHEVUmVZgCSjtMhztLdXCl8Jnghd4M+JvHRSXKpWSz8J6HiZo77W6lpvXalFvy0f07f5RRBLVWfo7AmPcuYmSVuR1bfkHu7EZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831888; c=relaxed/simple;
	bh=RpXIv4XP5GQbx2x/ivsSKrbBklFUfVf3wXJHcRFWkos=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rDJrofThRwb27LrcsqVS/cWnuq2ePtzFyYDvcBslCx5BRAmz4jj0RPpwn7SaO/BO2ZmVyowe64WskxVoGcuVRgtkQkMChewDTLF2wxuchjT9yx+65Jhver2upuu5i00SsW27aM16p6qjrqxvlQNNNvPEhN1xWDbwH4IuD0sxlkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeetkTu0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so76357085e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747831884; x=1748436684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/jHmzzVj7avj1EieVfvkWdGnf23YVTEruZCNzw90qE=;
        b=oeetkTu0qPm4mN9XWNnaPTzt0Sw6iMCRCUaRWVmHSJq/Dzz7TBwHrRhjJ3MDizQXVO
         CTehW9jHEYegD2ZxKdALg/2IEIH7IcEKbL4G14+QBtztR06O4T6oMrs57Bm/0oAlthjx
         VCzdXpjwd821HbNUdkpow67fQrWH4zfjAuq94F4GERlVQ8Pr7Jg5fHUxMyDkJ8ErPK/3
         LrwrLpHK6cI1ZeK+WCVJk5FGYcKmrIEO7Wj8AAbbivSSkkC01Iq/ZjR0eJoDqsNECV5l
         SXso5xJPCrsAeNEhz9iokn77XQN3k5Kdh7htwE7qsAunDf5NcEzDqPmFEOFX7FaJ7MN7
         eIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831884; x=1748436684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/jHmzzVj7avj1EieVfvkWdGnf23YVTEruZCNzw90qE=;
        b=mBRZ5DIdN94ZKpdeb4E05tposxDVsdZpbDQzrftQq8o/S2srhVz7HbzohRUO7v0MHB
         1yBCyJreK1BIjMR4aclt55KNcW2cNVHrwe6V7UA9n2AeitmL8slcrbPF7NGpUA4XqEoB
         oZNSSLBhxmvX49WhzMIQI3qayUVRvDH/yxnI3NM/IoN6yxfmDC6h7ChyxMVsnOBmo91e
         ujUI9XhRDU03njj98pzEDdwtwa/sDIA1VWw12XMN/vNRQyKdGjm/i+9Hvfpmxzdq7wyB
         O2EqGNPJtYiLdCJb8FYUFnlUmFP+XW590Sa9PkBuqDmeew2VXeBtxXdUO0DV0MOzrEe2
         L1gg==
X-Forwarded-Encrypted: i=1; AJvYcCUC8GgPFLjY1ljYxPgjdqXBuQwTTZSuOgAS1oKi9CmMUV8xFuJQIaAHhL/nI/DnHjqr9FG2UAx/0fJR33aA@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMU/4a0X+aX7YqSjSVhGtfXFiJz4uSfM5JjRFVb9zolwKhPqv
	zlstRJquYNU4vW8HvADd3XVkNZk086evwLdhiXxiv7DW24o/wq/KK71kmGVaODsykG8=
X-Gm-Gg: ASbGncuihaxJvOW1eMv9za2ufweDsnzJtyQbDww1Tr4fDb4mu41lIGCe08wSv3F8tpw
	/FwIe/UkPG80btH8GxnoVDB/3m52xtdDJi3Bt/SarRC5uRsYwIcBrK8KC3vXZY7oXnxh0Zl1wwH
	7Pe2kHec6NoULnvA3B2JYBWO9TzxoZxV3HrmjpaKhmPV974FQLl3t+2yK5mAjc7RGhUQOPjGA34
	JDkrkpbaT6S5iqqicH5j29G9wETjPjV00UiZi151eJMIh2JIJxyY1hL78z0GryJ5fHMwHZUTfIs
	JmoMPz30Gd+5Gnuj1b35XdZwVFhQ2ddThjhIrNPAahlkuUNJQCQQOiEVMmlm64gX15LqsJ4Tsw3
	Ur4rmcpUv3MEJPporAFqw7Qx1RwTU
X-Google-Smtp-Source: AGHT+IFnVyqqduGLFeoeuylj/zZQ1NZU8qcb9cwDLm6nbxo5hFKroW6gCdx5Z9rdFWlJAbhHaS7W0A==
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442fd622c81mr210080505e9.8.1747831883562;
        Wed, 21 May 2025 05:51:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:80b6:c1af:bc94:958d? ([2a01:e0a:3d9:2080:80b6:c1af:bc94:958d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3ce483bsm67820435e9.33.2025.05.21.05.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:51:23 -0700 (PDT)
Message-ID: <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
Date: Wed, 21 May 2025 14:51:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
 <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
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
In-Reply-To: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 23:29, Dmitry Baryshkov wrote:
> On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
>> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Continue migration to the MDSS-revision based checks and replace
>>> DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
>>>    17 files changed, 6 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>    	/* setup which pp blk will connect to this intf */
>>> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>>> +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>>
>> Why did you drop the version test here ?
> 
> bind_pingpong_blk is only available since DPU 5.x, the same set of
> hardware as the DPU having DPU_CTL_ACTIVE_CFG.
> 

I think it deserves a comment in the code or the commit msg.

Neil


