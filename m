Return-Path: <linux-arm-msm+bounces-88217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 750FCD07D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2924301BB0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FEF3009CB;
	Fri,  9 Jan 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDEzenbI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25003446C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947479; cv=none; b=aOc3xfC/+R8y3Al5kIw51k6VEMUTtA1GBUjyvgp4Quwjf3Z/wnuZwgBK2yzb2LbUdmGbLNEu97eKERQkIXvlIxRXh2xK8yxIDzOyOweKVauOxX19SPqEgZKpfQDQzhryCEeFFaw9Q+PA7j6WfxM2CDCpxYKl4F+3cwGdx7/1r5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947479; c=relaxed/simple;
	bh=8Ir031mERsf5MEJmywx1zKdown+2TYY7hzl6HdzcWPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daMtoIEM+hxgtOUiFW/oTeZMkwM8vQC9unqLoWULI0uVROQSG7yjx1MXHQXjkiige87t3AEdaKxBuKLSZ5/NWNq8vJEn5O9FNof5E0gxsvDHdsSmRj7hoYqm3Epk4fTMYXmnAk8D2BxO5sei/bKxZhECnVvmXt/2t3Hk1ov8XfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDEzenbI; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1016083f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767947473; x=1768552273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScHhY7gthksnfmgH6uljC923NNYDsVbTgY/cHmeyxX0=;
        b=rDEzenbI8v5cV495DYGLf1YGwAdMDgzrgk7EMD9O84enJyS5sXmH8QyIlsZkOBWYf5
         cFzrHdUXmyYmB+vPX0ytA95c25fyk5tpVRrUyzZJXVfcgO78UJ2Q4MGafatFvKFrjbCg
         f1ybE5E7Exr7cc7MTpvcVeijzF5/UkMEvEQvhiex9zoOB7GWW9pHN7g3qtlcb90OyvIu
         ikvn5gZ4iR6wgs/+YVHFc3vu7/csAsb0nmC23AY1N5V3Tm+8SulYcDRDm2FhyeX4t7m8
         W1rWvBTdJMZS18jOwqC8XdzF+QwAEIEGYMGaxP6fPvCYoNtwiPpbQ6c/h2FBqH2XDbn9
         dlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947473; x=1768552273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScHhY7gthksnfmgH6uljC923NNYDsVbTgY/cHmeyxX0=;
        b=HMR9DAbUg7CBVtJubvh1yCVp2s0PcYtAjbWoGBdUkSs///Lmc+cway7skWtQd1WU8L
         Egrh9TQ8oUyA6OJGr81OIviSFC5kO/hE+uLMJyP+V7SrDbtiP7ZPd8xROxaOjURZLsog
         AcgTOXciiWL3Qs+/blpZhSbbbzdwIMdrXNI/51u1AtEvkD+IicPJNQuoctWjM3qjtzeq
         ZcvHLoOKsbskxm/xAwiTsYqPS463RHHzaQZ8bPbY1q3GFBuYJmsmer/zWw5K0inZxlP0
         E4IT6T0zOu43+2cHSdBdCMWxdCFUHfJKQvyNBHer/rBx8d8Ybs+v5yfCwBZos/BKusV0
         mtBw==
X-Forwarded-Encrypted: i=1; AJvYcCXS72PX09ap9yod2ES8OWWZYPNm7ea5aw9wpaeHQAl5i0FbG6M25qskjyRQiEPjPdvoajuuDspSPlSvPeph@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKIj0xNIbXH1idxcknXQzA42JIG8vFXl4kZfl7NhEFagTcm35
	c4929ZGUp/2ED+D4FWgmkWrw2213/bCOKjx4lliR5MxTcKFRFO4jemA+DlMzwP8cTQU=
X-Gm-Gg: AY/fxX53Zxfi/sJj0L5m2msNV0Wuc18rhrsutdRlesFciedkwWiShBpgWSZDsJVR9bo
	VAceDSYWtX9X1SA36vdxQ+EsdLhj73ldZ3I79LDLhhJiTU3g7qRyogPep24vd87pb/hmZORdj2q
	fPS7LcoxN9g2dmjmEivJIC5GGqWxrJGHWI4ghsRGGiHZ9EQl5Pb5F2+1hw5+h8keo9oLAd4itR8
	XM33hEPmSFLXCh+dNolFyq/BJxqAh9GVu0QtzC1Rd5UoHmHv2fmxoJUvEt6xG02FH6+rhzOpvZZ
	2cWErCnoa3zMP3EUMio/wFeep6fYHhmMJ2LcYOlsWuLLEi7DJ2KtyXSL7TjRyLhmjLb81z4Qd+U
	e4gd9VNYz64Y3WVsKeJmVKf36ZdQjrsuGmf9B9PuN4vxDLoag4RIde6LeocuSRt51E34fOHhm/+
	Rc3t9uHk1BEUwrniBxIwlfcr4GUSQRQ6l0ro/CNOwAcN3cly+zR8bS0FJCq51cxWg=
X-Google-Smtp-Source: AGHT+IHsXjfVMgqUU883lNdJMdHku+hLNkk+zQ+G0NK84h/s8sm1XXRkmzNxWJiENK0PtpaJaMtafw==
X-Received: by 2002:a05:6000:26ca:b0:430:f5ed:83fc with SMTP id ffacd0b85a97d-432c3760facmr12321898f8f.11.1767947473278;
        Fri, 09 Jan 2026 00:31:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm21785092f8f.11.2026.01.09.00.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:31:13 -0800 (PST)
Message-ID: <34590271-0e34-45cd-ac6f-6f901e833087@linaro.org>
Date: Fri, 9 Jan 2026 09:31:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 15:21, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
> 
> Patch 3 should really be merged after 1&2
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> - Handle rare cases of DDRInfo v5 with additional trailing data
> - Rebase/adjust to SSoT UBWC
> - Expose hbb value in debugfs
> - cosmetic changes
> - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com
> 
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>    coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>    branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com
> 
> ---
> Konrad Dybcio (3):
>        soc: qcom: smem: Expose DDR data from SMEM
>        soc: qcom: ubwc: Get HBB from SMEM
>        drm/msm/adreno: Trust the SSoT UBWC config
> 
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
>   drivers/soc/qcom/Makefile               |   3 +-
>   drivers/soc/qcom/smem.c                 |  14 +-
>   drivers/soc/qcom/smem.h                 |   9 +
>   drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/ubwc_config.c          |  69 ++++--
>   include/linux/soc/qcom/smem.h           |   4 +
>   9 files changed, 485 insertions(+), 120 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20250409-topic-smem_dramc-6467187ac865
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/
dram_frequencies  hbb
root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/dram_frequencies
200000000
547200000
768000000
1555200000
1708800000
2092800000
2736000000
3187200000
3686400000
4224000000
root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/hbb
16

Thanks,
Neil

