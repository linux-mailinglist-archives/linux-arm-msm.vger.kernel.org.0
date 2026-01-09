Return-Path: <linux-arm-msm+bounces-88209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC02D07C3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0FBA3007640
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD3730171A;
	Fri,  9 Jan 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJqv7fl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E8F2FF14C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946870; cv=none; b=Lbcw97GCyiQ49v2anKkXEL10rAsIo7FkjcEbNGmn641VIkcrhiupJAOsxXh020uO6x/EvQ7pB3UeDlz4j3DthsfPVuy7FuOFBwHaIKLUJ0/L+6hHTrcPan7xTpjeXJ8Tgm6I3uvagasNd9rAzcfliuAt9qL1w7lGA1BtUPuGUa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946870; c=relaxed/simple;
	bh=V+nTC5fnYyAOKAK26TFNavyMLrrdiUNFL/Z+gDdCvi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obhFGs6/j7iBi7Bfu38/xPLquIcmk1BJgzbNNIstRc+XO0N4Vaz7xZQhtO79T9Zx14iMqpsvrM74fSofOsrq5HKBbUELsM0DtB+hxMzcyHWg5jLhDt4aBzvipEGJRLuGFQO7MOj3vxcaKHKzvUCY9YfpZ/ntmfm2HmYJmMejOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJqv7fl4; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso42684195e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767946861; x=1768551661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9uKMSt4+hDezkXTZIi9m3T1AtMKx1vNqIx/d02r4Ps=;
        b=YJqv7fl4paMm4GeTI/uJ+ymJmki0AAl6cVMa8BG6GO8arBlr4pxHKz4nlQKRcnmy/5
         QfLLQFq1UlBsUyzs7bEf6V+hZ6Vo6v1Q3pEz7Yk/aUzlnrpKoCAimtevT8MmaPvXpGsv
         MYCdi2FRErwHOLTD9BOFu812bh3WAIJbaVCuCYAQ6baTt4KDfup4SclQ6gXXuFKEw+7u
         LL6Sr8KmTIVudztdQgVVxfjRJpxrrD3E723Gi6+9PrPFgDnqjNHmQd+TIKj207y13Sm9
         TFrDWu+rm9vbdgfCT42P5UZj/KocJw64Arf4eYZ2NxuSVVSeSVLolAWkfNQGa1DOFo+t
         LXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946861; x=1768551661;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9uKMSt4+hDezkXTZIi9m3T1AtMKx1vNqIx/d02r4Ps=;
        b=mrnkhgYY367a8gsdq3yUGgHTYM6TEc6sDLLCOGZuUa2ZGTl7+ePt8sKUOZEwh/XNx+
         33n2mNWGTeCa6VG+zwCzVxS+4gdu/S2CjriqXQxzgggiSlYtRxNzEbiUu3BbBczMy82b
         AYv3BYOCVcKGMvUe/yCXRmWFRjpPCCYfzxJG9wmK67mOw9HkBVjvcH6Ynpvx9WmKEEkp
         y0O4k/Q4xaPS8+Mz25OAMgB1NiCo+goSBStNOG+sJrEEYqchClpKMjqC4JBQmxvQ61PX
         1jEEv422V9KUyo9T74eInaRMYIairhzci1obHvGUX9rlCRUDiT0mBNAo4a4mprC/WVQJ
         jj/g==
X-Forwarded-Encrypted: i=1; AJvYcCWDciwB67Eg6kTjGFRu0fA0s6ScJyeGeEq8avhK3kavm4urmh9qv7N62KjtKP33qXy2DlgdRKhFwxujYw7W@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHstFRVMR6ZV1k5XuESxZMHGhCY+lK+DecDPdtaUp7nDWZi1P
	RN2tF1/NSUsnvo4IXGOLk7R6qTCD4P8bB3bU9izEwitW8gMxovLK/FTTszzmIwRdxik=
X-Gm-Gg: AY/fxX4PEFr59VxgCClTKNokqJ3/NBc22TbQgP5JbGi/mfBFbzjwrfZFw6Np3RI2nof
	q6SIAMV8oYkqzqKwh9vQimCeJ/H9QIKxVHZtwTOIbsjyvbDrhJv4z8D8yESpGGNJseOki1EmiVL
	YpFyO1G0QM9DdRHiv1QHHlruKy54uDIOBsot3n909hPqb67ljhQ/Oq20gOuD7Edm9n2Q642z/6U
	12hPuHoTRbuWL/LCNSFrsMDb8Us6SZjd8nyaDX1Fc9pNvvDhadATTeCFHLoTjWtwl83FclYIk8Q
	pv7PiqcXqc4jTgtHhzvrKYXztMJJwk0kJZfj673Y/84H2oCpdD0u/c9zQ7tHMHe9Mqa5s0s8l7D
	LfpQedQVU1174Dhfl13n44XzINSIwaWyoXJCKZwgA4YpccPyUT7AYXNdS3J5SumYuNp5nz4b++7
	EJgIy6uvekwkoxWPvEJoUntJI0ooCvSnPz2To8O08rHttmhaRAQRfSYJI2osd5EsA=
X-Google-Smtp-Source: AGHT+IH0OJfkjAgMzQqRakprSyrN6tCPxBuCGvpfdT55BzOyLssSQCuBpAQ8A1Mu0tIEefB/dW4VNw==
X-Received: by 2002:a05:600c:8b43:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47d84b33b7bmr99212625e9.21.1767946860895;
        Fri, 09 Jan 2026 00:21:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86c6ff40sm123761785e9.2.2026.01.09.00.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:21:00 -0800 (PST)
Message-ID: <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Date: Fri, 9 Jan 2026 09:20:59 +0100
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
Content-Transfer-Encoding: 8bit

Hi,

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


While trying it, I got the following warning:

In function ‘smem_dram_parse_v3_data’,
     inlined from ‘smem_dram_parse’ at drivers/soc/qcom/smem_dramc.c:380:3:
drivers/soc/qcom/smem_dramc.c:216:31: warning: iteration 13 invokes undefined behavior [-Waggressive-loop-optimizations]
   216 |                 if (freq_entry->freq_khz && freq_entry->enabled)
       |                     ~~~~~~~~~~^~~~~~~~~~
drivers/soc/qcom/smem_dramc.c:213:27: note: within this loop
   213 |         for (int i = 0; i < num_freq_entries; i++) {
       |                         ~~^~~~~~~~~~~~~~~~~~

Neil

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


