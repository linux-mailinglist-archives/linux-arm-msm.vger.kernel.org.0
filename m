Return-Path: <linux-arm-msm+bounces-88297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A333D0AC84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D9C302B745
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA0631A06C;
	Fri,  9 Jan 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3DGHk+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C833148BB
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970977; cv=none; b=Uo2CQwCJ0S0L5tgVy/ZkAZjwTdB4kIsYSWzUtbQ+2Mb7+GTvcPJgPxpGd1lq/NBEY+fKQcMPWrhXJy1X5uDGQxm4L4M2GWyAdm1EPDLTfjga5Y1i7Yageg6C+f5PGx3iNwe9Xm0neAigFqq6WJHOUwUe/xBKxuzYWFq3dmKS7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970977; c=relaxed/simple;
	bh=Q1PSA+KTIWzaxImV8bCVubeKclZw5gOYXZd8yPNAHao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhnnW797iY4BhGs0Buj7JKjDCjhixU2mR2JR+zOrQ6mHDJcbN0eH+f/j1Fi4+b2sAS1lBHpFckWiL+lC53/BTF/vHcaHA7yjAYui51fVyDZN4qtNSiPHFQAW9GJZps3GAEw/mCFlclD0KILpDumfkNgQKy+ZEHcHl1GYHh0gPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3DGHk+J; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so34027735e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767970973; x=1768575773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UInAfTLG3bhXA8eBGbFk1r1PIteNQKVb+tM0MGYhNw=;
        b=v3DGHk+JzHGQ6ok3qc6jpuTx7b5q7sPC2qzypS7k8hPKZHRdKMRjz3dEXW+rXq36+I
         nE5NuU/nopAr/vW03fqmworbzKUlP+Xf+cK51f5HxYQu/S0vV6Bn6li8wa1fhnUvmUNN
         bgRNDFzh77ez5YQLxdFNRX2LynSJRekYnidkHX0Y0WKEcUuJkDw1c+wXcedByrDrLSqP
         h+MrEXwdDtdKu8JO3RGwqhlMOoHUNus0MqI73tD4bPe38DKmbq7/8qI4hMAUNYDLkcP5
         AFM1UEiVnJHcsj67vFRAytsvV0FLnAlIJpNsNeyufkelqXgo+c+dQnztBoCYFXKqNLD+
         JuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970973; x=1768575773;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UInAfTLG3bhXA8eBGbFk1r1PIteNQKVb+tM0MGYhNw=;
        b=FMg+ytqw6ZPTwOKf2pbWCvkaANZP1qRZ7FR6GTPuUH3vr8VXEs/uavGoxquirVUgTz
         na9Hz3F7ZOPF6k5bq7fivmSqWaCwklcKKfWxXfioakvAyudn/f6nKUM069Q1iamFAwvx
         IUCe9suHBi+6hBvQmXNFE+guqDzwngDtJil3ThiDrQCuQod/e/tyQFiAwjVJJJkw5xvT
         xQmNLpqATEtbx2ElYZY4SKFnwxCk7ww18upcKl5JZApTPynIZMMoY1a1YWg2KnWtOGXv
         Fmpq5Q2xB3sF7t4S/C91/OSx+42IyHK/sq+uAgByr4DBLTzDts/8ODs8PoCkshuHDGZM
         MKJw==
X-Forwarded-Encrypted: i=1; AJvYcCV7yKs23ZwK6Hi2aZkLxtr2Yil7H9NCyyWSkMG5oZv4UeGqsvuHWMzNYaahjARrHPDpiAQ/FkmQIXb7WoL/@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrj14aUFMA3d2xWyfNoeUdE9MUOXBLIbp8WMxpuSETq++o6Dm
	5BkesgxiNkUqsS9XUCJcl7orc9ZVyPXZeLCNijfsqlY+1IA7pAVKiW7kvRd7TRHgpx0=
X-Gm-Gg: AY/fxX4u9CgVd434xHjjflpRFyGbDp7/XEDwYLV7dnWKzsd5a75BXEvoAdkM8ylNUII
	KQqlWpov2pps5uILb+aSlZz1vepUidul2nSVTJPppRaptABw5UwIiGco4Pg4N56oIs49HYAA4Qg
	7NY2BgprZbCIXcuZ2olJmlrZM1ehBOjHcRL6dftGFzEi5+OVQL8bNaukzNVppIETcqm5TQjObOr
	SLiIMcH58/bkQGVpyPCZnFIU9QX7bvFO08PojssN7sEI3yK71q4NLUAA2QbtJYhHC3npwH939VO
	+hHuTxSgQx6C26PkvinEzHNxvvjzAZeioFIoyaoIsjPzj4VyOjgxjS/0tv+sKxO1OfQMVYHmlRY
	fJ9kAMl/LsGUaAZIL8LjjtPyWHKvExU2upuUamW9HhwIOVg1QIVqRN8Rr8pNDtBkRFwbHd32CsS
	fqDgO+nROJ4XnOxHILQhy0la8zsKZsz/fT4XXnUtPjbU/RHGAdf/fZ79UpfPQyhj0=
X-Google-Smtp-Source: AGHT+IH/NJl5YNDDszh5RDJz8ycIB4dt4QOaETanMOhHZPBAuiNgRAzR2j4mOHDMhxoAkS8sFPPpPw==
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47d84b1faffmr122102735e9.9.1767970972957;
        Fri, 09 Jan 2026 07:02:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:6f64:6b96:cac5:a35f? ([2a01:e0a:3d9:2080:6f64:6b96:cac5:a35f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm63507875e9.16.2026.01.09.07.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:02:51 -0800 (PST)
Message-ID: <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
Date: Fri, 9 Jan 2026 16:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 08:42, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>   video encoding features.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> gen1:SM8250, QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.
> 
> Commands used for V4l2-ctl validation:
> 
> Intra Refresh:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h264 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h264 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h265 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h265 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> B frames:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h264 \
> --set-ctrl video_b_frames=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h265 \
> --set-ctrl video_b_frames=1
> 
> LTR:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h264 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h265 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> Hierarchical Coding:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer1_3M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_1_bitrate=3000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer0_6M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_0_bitrate=6000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding.h265 \
> --set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5
> 
> The result of v4l2-compliance on QCS8300:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.18.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 52 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> The result of v4l2-compliance on QCS6490:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.18.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 33 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Dependencies:
> https://lore.kernel.org/all/20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com/
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Changes in v3:
> - Correct the maximum value of IR_PERIOD.(Dikshita)
> - Use 'codec' instead of 'standard' in the calculation of COMV size.
> (Dikshita)
> - Verified these patches on SM8250.(Dikshita)
> - Link to v2: https://lore.kernel.org/r/20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com
> 
> Changes in v2:
> - Add comment for ir_period calculation.(bod,Dikshita)
> - Correct the maximum value of IR_PERIOD.(Dikshita)
> - Add a patch to optimize the calculation of hdr size.(bod)
> - Correct the num_recon calculation.(Dikshita)
> - Add a patch to simplify the calculation of COMV size.(Dikshita)
> - Catch the result code of session_set_property.(bod)
> - Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
> - Add support for layer bitrate setting.(Dikshita)
> - Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com
> 
> ---
> Wangao Wang (6):
>        media: qcom: iris: Add intra refresh support for gen1 encoder
>        media: qcom: iris: Add Long-Term Reference support for encoder
>        media: qcom: iris: Add B frames support for encoder
>        media: qcom: iris: Add hierarchical coding support for encoder
>        media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
>        media: qcom: iris: Simplify COMV size calculation
> 
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 476 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>   .../platform/qcom/iris/iris_platform_common.h      |  31 ++
>   .../media/platform/qcom/iris/iris_platform_gen1.c  | 161 ++++++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 224 +++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
>   10 files changed, 1101 insertions(+), 41 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
> prerequisite-message-id: 20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com
> prerequisite-patch-id: 2b77a7b9bfb436751da0bf69488dbff567a38479
> prerequisite-patch-id: 190f29ef211b046f0d031e3a4b52f2c3bccd0cd9
> prerequisite-patch-id: 92ff1a1958eeacd53d70e155bb8214f9987ddf85
> prerequisite-patch-id: 0dae6aaa8db7df0729436cf9268d29ea363f0eed
> prerequisite-patch-id: 6382693f5a5a7438660f2e592b30163551d92791
> prerequisite-patch-id: 9aa16211c36540a61d219eb25f09b7625b9bdbde
> 
> Best regards,


With the following reverted:
456c99da41cb ("media: iris: Add support for QC08C format for encoder")
causing this: https://pasteboard.co/t8HmeNaIFMDR.png

Nevertheless, the changes are functional and output are visually coherent with the parameters, so:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

