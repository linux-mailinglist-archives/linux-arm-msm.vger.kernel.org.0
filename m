Return-Path: <linux-arm-msm+bounces-89594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D42D3A3BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46A0D30123DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1E31624D5;
	Mon, 19 Jan 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNyPDsjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB73074A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816383; cv=none; b=ExYLj7e/exDCiJwuwIIao6Ug7rL/WiPATsA+8UeC6eHwXZjFWFphMRwd7B5XIBBIlhpqByps/rKayRdtKBPYwwnaR0437GH+IKmn61uD3I6oaO9iaghnify5+jrk+ScJ+ZFa1RwXA2EPRQL5k2otUT7tuNHtBz5BvBrO9HFVdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816383; c=relaxed/simple;
	bh=H8KWZ8KVxCXiaSIhoETauk57eCO5bTYXFT1uauOZecc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k39LfH23WcORebhQzyKpe6DYknZubu6hStqQns4+tx4Y9ozosgG0/WGwjYuUhUzkPbkyAG+xzzwM/SMwXzZmcPWFANwtpCKxQ0sWR3Qr2sVcJvcFfCIE16RYnd3dPR9vw2DChOLgoz3pB3QN9iuezvDo7K27LXkK/xswDWooAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNyPDsjc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so29434745e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768816380; x=1769421180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHrLEM47rl+N5Y6sByRjJVHzaTdXJR1i9eBaS8A9Ybg=;
        b=JNyPDsjcI8Xs81zx9zrkWC3iGLl4USDBGd0LV0+3BbB7wJUPvszLU2O3tFMUYUc2J8
         HN8VT8edvX9Ld/+IcajNU/EtD8cJySusaoLXlxLLeJKFFGAPEUcJhfkpVYZlqd+7r7Dl
         kUi9N1EH7jholiyOdRjGf9Oc1EzzfDBTacxUhHkucM8xjHrI/wUclZijuG7rbfNaEdnk
         H6aolezF0tGj3ccLgr3xj8aPN0CGqGcaR+/xow6cBeJI4OOcnc0T7qqd2Jn187vctT9o
         pv4vmnMl0CIKtBcsR/HXnE5B6FbTf98HjEm2YVk294BOCx7HalT/S1tgE0jfbMH4P2sJ
         prUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816380; x=1769421180;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHrLEM47rl+N5Y6sByRjJVHzaTdXJR1i9eBaS8A9Ybg=;
        b=vlKGjNkkZ6WQZVRmP3T8ZYd7V15KuCReMNiUSGhm6UInJn3lni3hp22Ozu1iukR2nm
         d635evGrWVz/lmDp1FcdDDjHTgbaYcyTbHh58PbFbs+F8fRtsQ0sLo69Ix3Q6v3Gppf+
         RN6B7E+1y1ExZmiPH6avmMPxtab6fMQ/cpPxT3TSJql4wwBuuLa0Y1hbqTW27NEbUuYc
         CVG9GYadJH5t3WqHnFzuPcllWWZhBEKbYEnW+zhGyxkeLGI2Sj5HTGcZBxMmDWboBdvn
         XX3/EQsiiGHDH1hmkoQVlYRuBKudxZlDqmKZVGwhGe7oUUd55cHSBg8Ue7ghw29GdXvF
         6uXA==
X-Forwarded-Encrypted: i=1; AJvYcCUITpenESUUPNk3SHwncpQzGoHs4Ko4fUDM+i3UURfuMQbGyKeZxfdFwldjuART1JvBABB4/aiQNfHeYVh6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TMu8wqqQnsevVFFAY7M/D2jU5Vf03RqeMaBBo6SAzANMQJQE
	CzTvtDbEfz8VMeDX/m6e8NF1Ci0ILf1z2g0cQmcx9csQsE4yd3olOpn8zYfqYXPzjss=
X-Gm-Gg: AY/fxX4RG2IhO/tLuKWuuWuT/VmmBHwkQqerPHOcpwek0IEBQqtpsCc4t1VKMFpaczU
	l03IFnkqO7/sw34nD9iTwIeQhMgJloBCjiVjeZZM1CXEE1Flp5gFd6dnZJQyKKyXkMfka/ijrPC
	YiaOJADqP1YRlNsEnOoX8B6VLPqARseC7hD4bjtrfepV+P+6OSZPdtlcFUNWn2NPLfaJYvpRMmu
	IUE91/wNyffSqub8rqdDQ5MGs8ua3icCGflIinkrqpunGHtjJB2NT18qkq6JOtnDN3ljhhkJiag
	C8GpmJVPVk7LAu7yA9QgjWMfL4VSVojR1zL8mCo/fhj+H/3SNBzRaLTld5tF0jsrPq7X4CrmZHk
	Q35W7JhouMqfWROOd+VnSOpLzY8y/I46IT5hGqIFasTiW+nWiovn6gwB19hS6XF4LUNXXQggkWx
	BB5X61riDdKS3HsdUsSqThFnn8FmpeeVi4IiPzD8+bg9t6+ceAEULX5I2kdIk2vPn4T9ZCdMJY9
	g==
X-Received: by 2002:a05:600c:8b33:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4801e30d72bmr126816825e9.10.1768816379681;
        Mon, 19 Jan 2026 01:52:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:e47f:1b04:e631:9f20? ([2a01:e0a:3d9:2080:e47f:1b04:e631:9f20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dddsm22831999f8f.6.2026.01.19.01.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:52:59 -0800 (PST)
Message-ID: <f9df6973-ae8d-4df1-ad4d-e918f0ef0820@linaro.org>
Date: Mon, 19 Jan 2026 10:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
 <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
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
In-Reply-To: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 07:29, Wangao Wang wrote:
> 
> 
> On 2026/1/9 23:02, Neil Armstrong wrote:
>>
>> With the following reverted:
>> 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
>> causing this: https://pasteboard.co/t8HmeNaIFMDR.png
>>
>> Nevertheless, the changes are functional and output are visually coherent with the parameters, so:
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
>>
>> Thanks,
>> Neil
> 
> Thank you for helping with testing on SM8650. Did you revert commit 456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in v4l2-ctl that needs to be applied, please check.
> 
> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

Yes I applied the v4l2-ctl fix and it works fine. Please retain my tested-by.

Neil

> 


