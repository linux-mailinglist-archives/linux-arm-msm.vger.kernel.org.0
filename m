Return-Path: <linux-arm-msm+bounces-79857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17472C24A12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E98AF4ECA5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781713431ED;
	Fri, 31 Oct 2025 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzSXvO/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5F342144
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761908052; cv=none; b=utTd9zrskbNtRNwXGiQcJHla0L+M0boPXIrntPFibt+Nm+aEWcRSa2LVSMg4/UKYs7BvrwRlPyr0TyO9JdndE1QuRU/wZs40Lt/HKyRXUFfXGSNHZgVCSmjLurnrpxEMZrpkVmBA3yxSNdgK0hVjPd23u8J4YU864KGU6TBk6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761908052; c=relaxed/simple;
	bh=7gj+cJp993vl4WqeEIh2j9IeyvPhgDaGr7szSC/7jNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZX39MkmZALCimTfe09nt9Phb1s2lUuImxu0/DFo/OmQtJ/oR+r1c0Ahz+LgRB5biqe0dR2w3jByuBqjHSpLJZC/BhO1xxRTYZegakbNv3AMiaDO9zMGoPRZ5i6OqkkA6EcjsTuO03dQv7MmVrjbHPnJwV9/kAbuDjzdYBLegcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzSXvO/r; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so21368715e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908047; x=1762512847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWbb9jOM/Npy1NvqoXYiPbS/pGYcdA0QjCqFUttooEE=;
        b=YzSXvO/rfHkGZcOGmBOTI4SCHCgoKd9kxeqoRwItaIxAzDVb3Vj5VYMg/TAhr2fP5k
         Lpsvj8C4QUUqmf7gWnpHBgBsv1HqGyNDEiXeGE3M1/2A6xYu5w/nOR414rNn/466loV5
         FxxypZpwNIic8oMRPRGmJ3oGh+HV6nNE8AXzJjtYVWfcPY4osGbyqUTlrb97ntVOKT98
         QYbSs7exerFw5En3j1+dR4Psw9a9rI2CDuuPrWE/UAPt9eGTwDQ7hUkCmAsbXB3tsqw3
         de9hk/qV2sgY+b8Q1rNXv+JY4haY6VracyEvAS+ydLCrXdqUTsRgMj0D2g3PVRF78PkT
         SZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908047; x=1762512847;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RWbb9jOM/Npy1NvqoXYiPbS/pGYcdA0QjCqFUttooEE=;
        b=d9SfZQ5E41XU3Ne6lQkQErXIaIWkfQ4022ee/xwOwBn5nweyU1ZjHj0KIMH9cM4XdQ
         zut1ybB23C59U696GxQR4gErtUg/X6N/KGL52NaRmO8pYOgWQAZYjO41BwKFXofMRKIU
         q6aJcrsvVBYv0vIRnhNWL87wt5rsvj8SF9em5dKRzYb6okK7T2d7NJI68MtOdr/TXD4K
         bhuOda6zod4uGxIA/cUxS4hRHSmdDBnUE9EW/OxI/VfO88YnCFsPr2YBYMrJfG4/Fxyj
         ZoAkd9xaPbqJDN/mj5KzQzB0XboNzAK0a892qnNmEfChJilGN9hYLZdBVQjPNY3GvQmM
         RG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoyhtEf6gE3EzVVRG+wt8juVatNnrEL/pv7QPMb28JmpJfbzjs9r9J0fdikgunmATOSnXnRyDQdI99Lyo2@vger.kernel.org
X-Gm-Message-State: AOJu0YznuvC2qjPvCXUfyDVv/cY9CSFr1wSwnnOt4UQ84uKsQbPHt9If
	kV34Kpn1ipUtdbj93opLwvnoLlncUN8GRRk18c5OoIHVxIb9iWtz/6yi1wTD2Mk6GMI=
X-Gm-Gg: ASbGnct5n4ZXo5NRUmKzVwpSS+rotPVprnMrhMK+IRfXqQ/xtzADgRzHvq+12Ryk1NV
	HfanBq+WjijzkpGceh8Zsxgx19LnsruPmkcGsmxOPZCes12O4QSfFZiCWZoFH6wUW7f/LTpbnrx
	ca5W5Uw5+AsQ0z90FY83DtTrty4kPutEimnolrtM79Ku9wNS5bYGma2i6t2ep6746sw2n9RjCEr
	aSEcirfnD2GXXfQGX/x3oh4IUS5mI82vtbEcGVTDq1w/0Xx+h46cTo0aU0/ju9vnHRNomrQF2r9
	xWwPpbhh18bjBGIAm+pfJL0VPK6azorhHQBGl+pPWBrhxrvnwxxgjnFhy2yWFvt0kD3DqTlkVQF
	ASSOviIkHQGqw7+nGy/3/aVq138cpHTmz5opK3QPeEtYBZIpjSVjczUbrn7tR2fo0YkV2H6iOPk
	xWDiSRig4ROj+eH0WCNTKmVoL/zV1yWZt0NgmaTKA6sS55hszBetb5
X-Google-Smtp-Source: AGHT+IEgf03Oe8z5ZRRjt2A1xMwk+m5WTt5D4goSc+aPwc6gLWO5KYIPhJMUjFiAxPgG8kTDW2eN/Q==
X-Received: by 2002:a05:600c:841a:b0:471:672:3486 with SMTP id 5b1f17b1804b1-477307d7648mr28413185e9.15.1761908046700;
        Fri, 31 Oct 2025 03:54:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324? ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47733023256sm27522635e9.17.2025.10.31.03.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:54:06 -0700 (PDT)
Message-ID: <b03b0efa-e342-40f2-9633-2a365ffbe26b@linaro.org>
Date: Fri, 31 Oct 2025 11:54:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/5] media: qcom: iris: encoder feature enhancements
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
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
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/31/25 10:50, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>   video encoding features.
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> on QCS8300 for encoder.
> 
> Commands used for V4l2-ctl validation:
> 
> Scale:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=width=1280,height=720,pixelformat=H264 \
> --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/scale_720p_output.h264
> 
> Flip:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/vertical_flip.h264 \
> --set-ctrl vertical_flip=1
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/horizontal_flip.h264 \
> --set-ctrl horizontal_flip=1
> 
> Rotate:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate90.h264 \
> --set-ctrl rotate=90
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate180.h264 \
> --set-ctrl rotate=180
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate270.h264 \
> --set-ctrl rotate=270

I've run this serie on SM8650-HDK, and all test works (+ visually confirmed)
except the rotate90 & rotate270 which fails with:
[  113.494611] qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
printed on dmesg.

Do you know if those operations are supposed to work on the sm8650 hw & fw ?

Neil


<snip>


