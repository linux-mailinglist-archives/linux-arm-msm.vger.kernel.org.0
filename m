Return-Path: <linux-arm-msm+bounces-82134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82FC64F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B1C434C8D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF958296BD3;
	Mon, 17 Nov 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fL4ZlDXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E721A459
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394451; cv=none; b=pw9mjTaML6EkqYqzjy1XJWmENjLB6ue83TuzWogc6mChFdSyJ9CG6Dl4rMvmv6BGQzvPrm0riI9PwY8nHUG6wpwsxf8TnnMVLZazF4Ur9zNCLs+b64WkuUWNP25kfASKYGe7DYQW3OLf3mzVj68RcgRf+2IhCRL1LkcPLDNoLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394451; c=relaxed/simple;
	bh=tpRLIfbeLbDXJGi36ecO08cM+1ezGwWqf+jBoZ4NjKk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jfXJduCw9CRknwpVUChORWOn08z/pFv2jflNcI1I1cXEzOJT46/94k2v4c6CGGNs5RUhjdnk1Q6QvwwOO4N42I4Yjm+NM8t15nK1RUh5iNnrSIJ6swjNkpo9BLMVxWHxUOjf2t7y3gSbR7xafaBl3ZmHUb680RrB55vXkfH44m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fL4ZlDXE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632b0621so29737995e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763394448; x=1763999248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIgBKPIhg16h/OqUa/f0YqwJTctSG0gGZpea6OLuGEY=;
        b=fL4ZlDXEDxoXwoIJh6pOHgvRHFq1cgDS/VMId5IBY/EQ4PPYI5tHoHAaYPd27PAVyX
         fr/TensEgrN9x3qdY1dpygLLBBImGrJjQieoB3qqRe1+LnVWGBKDbfjz4m349GsLveIK
         UfcmvzXrZovOq3yNKcE5zY0az8XKNh/r/+AgfQgksxV6u5ISZUOsFkcgeBHXKf5m4X13
         LnaVX0lrOpNZ+6k632qSnvp1Mc+SB9JKUHsawnO3/Plg/Xn6h9yPlHakZG4efAIzIQGc
         mWn7pm3h+rwcU8LTX3QWNwQD8kVZBpD8zpwdzXO3tgTm/BMtZ/BWiEp8mVU1KNWGr+JQ
         /A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394448; x=1763999248;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIgBKPIhg16h/OqUa/f0YqwJTctSG0gGZpea6OLuGEY=;
        b=WFIdGHqbf6dOHziwxveEq+MqSetJ0G1dFolNTfXGOwjtFpcs+QSQcXOD6ZcBzRlI67
         ZgTG7i1ziqExUaOZ8x79KzLtmMDIMRafbk06FagtNUcwkHrR6HO9VS2PmZAAsHk8zjtw
         heasNoBn41I2osa2LGds7aB+j3aQw5BGbxfyNsgWPW+MC3CQmSAXBp+nMp4ylawOqrE5
         hskmEQ9cINA57ZyDKQnT2RnrYu8Sv9I74i8llzkMeEsbJjrscQrdmcvdpjhFtx9t+FKk
         7pcZY7bqeHUQT/qCvsFlGus92rbjQdoLhbvYOytVK0nIJyY4mIklQ2svsENMZejBHaj6
         ma8Q==
X-Gm-Message-State: AOJu0YxrLxUowPgIjONZOitAEpYZbzyu7W+VPlDH1C/pU66SP2J528Dk
	zgz1L8GY70X4jJsbRzxExQWF/EYoM7mXtIeEwOolMtlaBpQJqNSqm5tDN+JLnrNzc58=
X-Gm-Gg: ASbGnctTnUHNb4cTKTDA4jAJXv14/xcuh29221Z/amqsbO32QE0Itb9D8t3sfvxz2Fj
	bc2JI3rSI+OZNqQ2VoY2Puh4RVdnbtySjetdx6hQI9EBTgzX6cbTfWdpA2xLb04VqYeGHMPkkk8
	mQ8Maz5PPn8JnLIriNMHmKjvfhaYkhiqAhmr2bLw5Ji5H4ITMsAKNiaWk/utC6zy9Rhi3dShGMl
	Yft9GwSHR/avu+kunb0m3Xi/Jo+dhUyU+9Ot+OVw2zo74ZVpK2j/g6JucDOCFCWSNhjWyeOveH5
	wiDLdBu2B0DYOfZsweh0oUiPmIuY5fiiRoJ92DqL/C8Cj6D/+qMa6ggPh3eap7kJiks0sFhYbK/
	YTcltXPxXdRB15uhe4gep4Yh9bcqJu/5vRrI6ETqQprgge+V4A0ZCFfif1YtASTWGlnJUGf6dut
	2S4Nf/zh7bfBKtG2WT/JeLZTOR6HhhyVBdWqlAvjhp+VHzjmoKyzYM
X-Google-Smtp-Source: AGHT+IEBd79a6dYljA3MZX+cNglY3uITavEkQzyznMYyE7VV+eFYzQzCVuHaNRfiwfZAjPjWNzJXLQ==
X-Received: by 2002:a05:600c:45d4:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-4778fe5dde3mr157686805e9.16.1763394447511;
        Mon, 17 Nov 2025 07:47:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm96547835e9.6.2025.11.17.07.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:47:27 -0800 (PST)
Message-ID: <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Date: Mon, 17 Nov 2025 16:47:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
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
In-Reply-To: <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/25 16:02, Konrad Dybcio wrote:
> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>> a kernel crash:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> ...
>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>> ...
>> Call trace:
>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>    adreno_load_gpu+0x94/0x1fc [msm]
>>    msm_open+0xe4/0xf4 [msm]
>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>    drm_client_init+0x7c/0x104 [drm]
>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>    msm_drm_init+0x1a4/0x228 [msm]
>>    msm_drm_bind+0x30/0x3c [msm]
>> ...
>>
>> Check the validity of ifpc_reglist before deferencing the table
>> to setup the register values.
>>
>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> I think it should be fine to skip calling this func altogether
> if !ifpc || !pwrup_reglist
> 
> Although ifpc && !pwrup_reglist should probably scream very loud

Sorry but why? pwrup_reglist was introduced way earlier than IFPC.

Why would we be skipping the a7xx_patch_pwrup_reglist() because ifpc_reglist is not declared ???

Neil

> 
> Konrad


