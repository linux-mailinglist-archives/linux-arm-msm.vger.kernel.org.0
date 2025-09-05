Return-Path: <linux-arm-msm+bounces-72250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11621B454D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8092D1891182
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE3A2D77EA;
	Fri,  5 Sep 2025 10:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bz8oIvF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8212C15B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068486; cv=none; b=qhzomzQcOCMbJhAIu4PDSlm33ifgWiF4uL8cODFeATqQxGzXzWqjlTGRgpiRJsaXtuMZif5PBswYiHFLNl24FteKmMD4mLVbKpsWH/UN7P86G6n+DWeRatZ4+UgGh73NNBC7kupmR3A1zNEnY80/AYD655IDXB+0zGSGcwnK5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068486; c=relaxed/simple;
	bh=QqQvkGnUPmxiy2iQwVW+wDnJWAQwKFS8eAyqs/ckEDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD+iAcGmuTqnjMGcvmLPdkh13Zd35qTq+vkWP0g+jbJj3m4Zn0d6vdk97t32s8wTld3UN34TCxCvrsCE7LlmaBINRmDzPOQ6KSnb0/oxf6ImRf0dPDCJJ2l81u3MD0Zl8VaPZitaskfd0bIJNeys8nrzsIA6IGtmoq7XdfPGyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bz8oIvF7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b8b8d45b3so18858315e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757068482; x=1757673282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qwik3MknKIfkvliiVD3n5OP5zjO5jTRPIdTlyGXR2zs=;
        b=bz8oIvF7FN26Q6ay8uv1wuDhptPln98FwHj8yYDqxu9vsAjVeuUENeTBM7oZ1ox+VO
         XOD6aCiw5vAEjyKZYM2vFZhp0HBeqYJ7vKtOSguIxx1rbv5roINs/YCI6v9epBpSr1ed
         hv2FtX9BVoTsnCFktJn36/D587qEOVgengDwFAePFJfJEFwUizIl5VPHMkePD5PWxdsr
         EeAKP1eG5hiHHRPNRaRT2k10EhOYcZpRWhqJs8yqtDqzjhneetkCJsdcC5QisRWusr48
         DSLcFc25qGBmKj0qYGUSPenQSR86FTEcUzqikwHPUF/4QgNbPhFAKpVXPImj3+eZLQf6
         +bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068482; x=1757673282;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwik3MknKIfkvliiVD3n5OP5zjO5jTRPIdTlyGXR2zs=;
        b=gF1Eu+Lxo9jI++yDieFdYjZL5Dhn6bZmacmEOp+s33WH07N4QDHCfkGT/3fld8mY8t
         Yw6exlfG3lT2tM6OGPYEIr4EOYtP+vl4IrIetzb75z44/17EOOKG6QM5ouiBafTOUifn
         J8leyZJZy5dhTIRwYt2WoatMcPO+4HatL45cpTnkYAYK4PfcEtpqusxvJJhD6LaKZvKi
         ttehJLDXXoegFFnP7+HEJb5MWrPxd/OuzYSmlKkkMw5X3rm/AmFunBaORQ/51XAJAyyb
         s6m3mVryM7fu3qTbPzhvc7OujRKEfSFB4sE0MS1qTyPiAat8MM88CQbizhYkV9cTmV0m
         1KrA==
X-Forwarded-Encrypted: i=1; AJvYcCUNf/E7JDC5N7ObYk2+Z+yKK0UlZBmp60knZYHKvTH/unRLf/BX8hsiUkyCY0dXr6DONAp3SBh57Jb6z64q@vger.kernel.org
X-Gm-Message-State: AOJu0YwWujlIjVcvwvdC/2Vb7OnSdqn6SubpWaPIrQ9ANpePzxgQXSrZ
	3iRtBsNrUd9CIbWiJ13DuegXz1h7NTu8k3++eegKmCZznHU/RFdiiONApQsCMcE86XM=
X-Gm-Gg: ASbGncvQSGqQuG6Pz8Hn3GFxr4QGQ/G41FaXoEDa/dJJ78lgZj7ckgzCNiKw/iLaQo4
	Iv5ip4xLBIEWCdbWFO5E3bKzOmm6pPv0Uq/jXPhkGEMoiUWB1yqpS/DrR9K8Mv/lLU6kzPJWQAJ
	vxDd4lmLOHPl/DjuUmtdjKuko4vlhX3jy5wStj6zvHrY1VSL4HmuT7MX6oYEDbi21vvOIv/pfpY
	ougF/9N0fDy3QaJH3AnVUdHWEIQ7h6NW0L/zlvC+St5Woz9HPtHr8s4HMzpyzAWVKmB/m1Hyz2L
	LR5r03PmKpBT5wgKjHyulL+K+O6KyjqibuLNU3tt4EubHywmM9Jt+tKwGH17m+wjPk6zXgVDIoa
	Vix0eqvuN/bsQtFtEg3KXKBSJN76qU6Ki5YJ6ZGJ9QFvcOSH73qNB0dsLZKnB5HmkVDwM/oVw4p
	uoUI1HP1WVaV0gvltXUiE1O7Csbyo9Kg==
X-Google-Smtp-Source: AGHT+IFU17KGfBzKeyE4wlD1uJM8PjqavAeGwSZl9LOxPovl+ZLFyq3JG79brsQseSsnS3CvAn1khQ==
X-Received: by 2002:a05:600c:470b:b0:45b:90fc:1ede with SMTP id 5b1f17b1804b1-45c8e725fbdmr96553805e9.6.1757068481794;
        Fri, 05 Sep 2025 03:34:41 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda6da5casm16501905e9.7.2025.09.05.03.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:34:41 -0700 (PDT)
Message-ID: <f7675419-a47d-41ab-aa59-a70a3005e345@linaro.org>
Date: Fri, 5 Sep 2025 11:34:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2025 08:00, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds support for H.264 and H.265 encoder in iris
> driver and includes a few fixes and cleanup in the common code that were
> identified during encoder bring-up process.
> 
> The changes include:
> - Enabling support for H.264 and H.265 encoding.
> - Fixes and improvements in shared componenets used by both encoder and
> decoder paths.
> - Ensuring compatibility and stability with the existing decoder flow.
> 
> Changes in v4:
> - Removed the fixes tag from patch 02/26 (Bryan)
> - Fixed the non comv buffer size calculation.
> - Link to v3: https://lore.kernel.org/r/20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com
> 
> Changes in v3:
> - Fixed the log when destroying the interanl buffers (Jorge)
> - Updated commit text with issue details in patch 05/25 (Krzysztof)
> - Added a patch to simplify conditional logic in stop handling for hfi gen1 (Bryan)
> - Reduced duplicate code while registering video devices (Bryan)
> - Added a fix for try fmt handling in decoder (Self)
> - Fixed the value of max core mbps for qcs8300 (Vikash)
> - Simplied the frame rate handling in driver by using non q16 format and
> converted to q16 when setting to firmware (Vikash)
> - Fixed the issue with bitstream resolution setting to firmware (Neil)
> - Addressed other review comments (Vikash, Bryan)
> - Link to v2: https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
> 
> Changes in v2:
> - Fixed sparse/coccinnelle issues.
> - Fixed the kernel doc warning.
> - Removed unsupported PEAK_BITRATE property from SM8250.
> - Dropped patch 04/25 to fix quality issue with encoder.
> - Enhanced command handling for encoder to allow start/stop commands.
> - Expanded rate control condition checks to include additional rate
>    control types for HFI Gen2.
> - Updated default value to MAX_QP for all caps related to max QP settings.
> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
> - Link to v1: https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
> that the existing decoder functionality remains uneffected.
> 
> Commands used for V4l2-ctl validation:
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
> 
> Commands used for GST validation:
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.h264
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.hevc
> 
> The result of v4l2-compliance on SM8550:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
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
>          Standard Controls: 37 Private Controls: 0
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
> The result of v4l2-compliance on SM8250:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
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
>          Standard Controls: 19 Private Controls: 0
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
> Looking forward to your review and feedback.
> 
> Thanks,
> Dikshita
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (26):
>        media: iris: Fix buffer count reporting in internal buffer check
>        media: iris: Report unreleased PERSIST buffers on session close
>        media: iris: Fix memory leak by freeing untracked persist buffer
>        media: iris: Fix port streaming handling
>        media: iris: Allow substate transition to load resources during output streaming
>        media: iris: Always destroy internal buffers on firmware release response
>        media: iris: Update vbuf flags before v4l2_m2m_buf_done
>        media: iris: Simplify session stop logic by relying on vb2 checks
>        media: iris: Allow stop on firmware only if start was issued.
>        media: iris: Send dummy buffer address for all codecs during drain
>        media: iris: Fix missing LAST flag handling during drain
>        media: iris: Fix format check for CAPTURE plane in try_fmt
>        media: iris: Add support for video encoder device
>        media: iris: Initialize and deinitialize encoder instance structure
>        media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>        media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
>        media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>        media: iris: Add encoder support for V4L2 event subscription
>        media: iris: Add support for G/S_SELECTION for encoder video device
>        media: iris: Add support for G/S_PARM for encoder video device
>        media: iris: Add platform-specific capabilities for encoder video device
>        media: iris: Add V4L2 streaming support for encoder video device
>        media: iris: Set platform capabilities to firmware for encoder video device
>        media: iris: Allocate and queue internal buffers for encoder video device
>        media: iris: Add support for buffer management ioctls for encoder device
>        media: iris: Add support for drain sequence in encoder video device
> 
>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>   drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>   drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>   .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>   drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>   drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 848 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  21 +
>   33 files changed, 4966 insertions(+), 712 deletions(-)
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250704-iris-video-encoder-b193350b487a
> 
> Best regards,

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e80100-crd

