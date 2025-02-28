Return-Path: <linux-arm-msm+bounces-49827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F48A493A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1638D7A2F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C4F250C0F;
	Fri, 28 Feb 2025 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke0jKEpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D62505A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731702; cv=none; b=tJd+O5CVDqmv7vhLE2EeKbQjuOtuxM/cjpll8jwOasUGrKQxzq02z4k71vx2YRcMO6JNS+QAsyy7gBnmUaBxgermNk2/8VlY28iRtaD9TXr44M6z/rok2wK1desQT4/D9qcxzddQ18b3CneCokORUDzz/SWsGYAhopUsVKtzbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731702; c=relaxed/simple;
	bh=DcH6u2XgobX20/XCApb6BtM0I4uBXU2xAeUfGr8Kx4A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V6juFCgra2SUFo/anoZGNiKZsek6lJZbgp41sQsPyrP7iTq/kdqNgJXgiYSFCLYR12qhVFFhTgRBHf4B/THKTGGWCmpfrgyZRNRfU3HBjZDLbK+EvfwLT2UC+Yi4OXM5D9LZ/I189deJUmP21dUKFalvQGg9VuzoHhlwpKPuO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ke0jKEpS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4398738217aso16230965e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 00:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731697; x=1741336497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORkzKEvck1HQHJSDGsDM0EnateW6ppAyaVvLCKXR2rQ=;
        b=Ke0jKEpSSttHS+KuMGVC1nw4820OGKW1fX9k229myq3JbkA34mJme29KILFPDrABYl
         zaN9iEbchFlSKZPHPAIUDjCFii8e4XQb95MWc/g4CSrd1oaNDVQsia4U3/cnm5xYbs9w
         /P3N/8xIz7TAN9VWR/UtGXiRgMuaJcRzBAPFS96r5yHykq4enlI9xrlwTNwY1lfEdlVa
         zD7GezktPmCdwrV/ydWAinIqMuGjE8Xpj/oac1vKlIEIT8S8TbIanSRIFmn0y8IuXRnz
         jQiFOBMsL76EbXPhSkD5jfhlFfSQ9C+9dQzQnIbPOSruNTfS8Tz8/QH+d3WuCuI+gMk7
         GxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731697; x=1741336497;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ORkzKEvck1HQHJSDGsDM0EnateW6ppAyaVvLCKXR2rQ=;
        b=k8T6gyid+LqR3UPM78QWgGNCBH9iN4axHd0TbO3z03hwKMCRTQeFH9q9KLaMPBHTrq
         xW00Kp/qmDntdh1MA2zdNNzkp6rXUk40NPWNV14FwlBiEucEoNxEE9Uyf3LVeuT1mKbp
         Y1xYbrw2vaPQ2r+viAOqtBYScTgZGi6sofiQuxQWUC3mLGJ6OrqxrpyQ07s7bVcGxVv1
         kh1ztb1L/SHv1sEQiCEtyMlOtimzPQcwxrBiuMhlRflMUBf/tjhH2IzsPYPpKE8pWWDQ
         OsSppoTDWScOL00qReovIWb9d7S7O99qpfNoTB7s3+ocoeobx1J2T8J6VDxI9WuMwjZQ
         XoxQ==
X-Gm-Message-State: AOJu0YxAhymoKKQcWrSI9Yg2renq7bdDSo69E6ZzB0AWjc1S7Bz32+Qx
	Y8+CauQr0ftMUjhcH47id7/2CggF+tm2Ux00jISD7pChw2C8b1YqZGaQBQ31YeI=
X-Gm-Gg: ASbGnctyIKpRfGcgcUu9yN0mr3duaVUto/AG9QiUMQFofE7hyM/clkk6K9iSuTl4e4m
	Fef5rfgqfb3L1kxtAY6ePyE3/S+mGQ9zu3uAbBAVcFG6VKCbkzJEgmGIoW7fZRlBuJUPiggAnhY
	vYaZiAcfBiv954q7h4PLnDQYUMt7lEk9M6KArqJmsRSrWX7Kl099DswEZZbPvq3PZf6Obow0XF3
	x0xyxafmVBWEaGJvOD7dOS2pOz0B6ro3MJLtV+OteNVS/VGofQ/gGDv7ponVnk9rtpJm5d0PgnO
	f3PgMGmGlZA1+jN51BwJ63Zz7oxk2b4VlyAogXhPzP3cnjX7ACS0jmhQnePRw0F9b9/+bG/LWbD
	uoW4=
X-Google-Smtp-Source: AGHT+IFdmFEna3crd/T/BTFxEG6Spc/EH5R3cReUqC66z3dsLR8Peke+TaeF096gTUqsxyCShEVirg==
X-Received: by 2002:a05:600c:3590:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43ba66cf24emr17659275e9.2.1740731697410;
        Fri, 28 Feb 2025 00:34:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c728:ed22:3bb8:f351? ([2a01:e0a:982:cbb0:c728:ed22:3bb8:f351])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6d31sm4394392f8f.42.2025.02.28.00.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 00:34:57 -0800 (PST)
Message-ID: <15e62852-c896-4790-9de9-835136d30df0@linaro.org>
Date: Fri, 28 Feb 2025 09:34:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
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
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2025 05:14, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
> - Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
>    (Marijn)
> - Added a patch to drop extra rm->has_legacy_ctls condition (and an
>    explanation why it can not be folded in an earlier patch).
> - Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org
> 
> ---
> Dmitry Baryshkov (8):
>        drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
>        drm/msm/dpu: program master INTF value
>        drm/msm/dpu: pass master interface to CTL configuration
>        drm/msm/dpu: use single CTL if it is the only CTL returned by RM
>        drm/msm/dpu: don't select single flush for active CTL blocks
>        drm/msm/dpu: allocate single CTL for DPU >= 5.0
>        drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
>        drm/msm/dpu: drop now-unused condition for has_legacy_ctls
> 
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 +++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 20 +++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               | 14 +++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h               |  2 ++
>   18 files changed, 65 insertions(+), 39 deletions(-)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250209-dpu-active-ctl-08cca4d8b08a
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

