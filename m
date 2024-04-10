Return-Path: <linux-arm-msm+bounces-17004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D793989ED68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 10:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A0BCB20F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 08:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20931119F;
	Wed, 10 Apr 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdPm3IL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3341C0DD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712737053; cv=none; b=Uag0a2ulvPPyHFL9WtTqkGKmBy0kjmEdnRxnFhNR1j7GUe+aZN1B8qLzEpA+qGyAtEwBePvGmnJ7qqGW4lvCViYyhRQiqF29u6AHk8iTJtB6fqPY6ks1N/lSLlw1POXebm10KpXRWcJS9h+6c8ab9IOA1UNLC/DdYtSB2yJxanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712737053; c=relaxed/simple;
	bh=cW7NvmhhNuW5621Abz+8pVHnvcf3F4CsX4RCBKm/FcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGko3kwkoRMqTBGrNkEVCDN9a4SGnh7/yFt+XunGFCiPbu2NCGjSTIa02hPFCJAY53xHrIrDPKnpRLdfbE/CKNYA9DGLZrjTh3GrSV4PG/2UMzxaMTFkIkXTgj8c6P/q2THIuUsxeHZTaro1NGitq5w3OG5zRi9o05AGwQTCL5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdPm3IL/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-345b857d7adso1965117f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 01:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712737050; x=1713341850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENPCw3N87mBaVy+YDHdi6mGEuYrN7DGsHHajboooxPs=;
        b=mdPm3IL/lRmzDin6beDiAMDAi9tTh7ye23/K0sJb6QAeTpIWT8Jp1Qdd7PfYaewr43
         PRLMeP34V/4KMHe5K2e6ZRHxVhBnjjKdPo0yPI79rxY0xwjKbhQ1FMxM1Hcqd5xFPDL+
         a9ejNShjYRZK0H/BxDVE3c/o9MA/jX6X/ZlOvPfuw2m3PdCTWIfVt0vgNUiloQ+7I7aj
         0plW+4ZnMcLUrUT3ZQsja+fejteXSyb4MvDKx2GvaNNfDPRFYv8Az1iLdBrCXm10Q9va
         Ht/3yb3bKO2G+VMpabQii7PHPsAJHIv86XOWKF4WwzUC4t+qghfze7E5bnJ0B6/G6+w4
         0SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712737050; x=1713341850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENPCw3N87mBaVy+YDHdi6mGEuYrN7DGsHHajboooxPs=;
        b=ekf3um6BR64wjh75mzwsfKMAPY0HZOzscwT3KQzzvV4G+u5308/VjGB51ONzvAr/st
         nH0ctE8fWi0rD7h4XLogJwDRx2OFksBaE8gtXBEaT0THN3xuXI44R0GnUTsRIovUrYhC
         AFRIck9cxIBG/+UVkHq5zbgLDsUxQFDq/Vum7lW6TZmq2RCeoIoAhyHFcwV9Mi68ndUk
         qFx1AHajtlULDfRo/132xm/xoURzPmirkZ5IAWy1hvNpJmd4gNiu4Homz8b6/JYo/eXt
         4yUlkZolZioPWXt/h+orKGsdzl5G5DzoUSffGlFqnMyPG3rF0VijcEGobU3AslJAB3XT
         6gJA==
X-Forwarded-Encrypted: i=1; AJvYcCVcwNlq55AxcptjFWE6OeWMBaXPp6oFWfFkO2CQVy1b/w/6ViP+sgAjratotoUdk8l96bokEwtk0N6uJujvo9HE1VpVN+Ut4/+Swl/EpA==
X-Gm-Message-State: AOJu0Yz23z35Tvf1GRbkHkp1pvWsDyy234gp2AVRB6UH9UIaUQCOO/+y
	LTbxk1bDZx77yq+/YNVMnRqIMph6gGJZ2OXk4CHI1jcCUNTyRfz/EfwoyIvf26U=
X-Google-Smtp-Source: AGHT+IGC/7qlcvyjTvLlwM5pq1IENV0ccSsLT2QqFB0ebyr4faNXwLxcwEIDE3XNV+D9cCXXjvEUMQ==
X-Received: by 2002:a5d:47c1:0:b0:341:b9dc:eb03 with SMTP id o1-20020a5d47c1000000b00341b9dceb03mr1950760wrc.3.1712737050294;
        Wed, 10 Apr 2024 01:17:30 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id d2-20020adffd82000000b00343e085fb89sm13201151wrr.2.2024.04.10.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 01:17:29 -0700 (PDT)
Message-ID: <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
Date: Wed, 10 Apr 2024 09:17:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
 <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
 <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 17:53, Marc Gonzalez wrote:
> On 09/04/2024 13:27, Bryan O'Donoghue wrote:
> 
>> Can you give it a try ?
> 
> Random notes
> 
> For easy reference, I've used this command to test:
> 
> $ mpv --hwdec=v4l2m2m-copy --vo=tct --quiet --no-audio demo-480.webm
> 
> And it displays the video directly in the terminal :)
> (Rendering speed depends on terminal size)
> 
> I'd never played the video to the end.
> I notice I get:
> 
> [  397.410006] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d7c000
> [  397.410114] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event session error 1001
> 
> How bad is that?
> 
> 
> Sometimes, decoding simply fails immediately.
> Must quit & restart.
> Will have to script a 100 starts and check frequency of failures.
> 
> 
> Will test with higher-resolution video.
> 
> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed demo-480.webm
>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> Using hardware decoding (v4l2m2m-copy).
> VO: [null] 854x480 nv12
> [ffmpeg/video] vp9_v4l2m2m: capture POLLERR
> Exiting... (Quit)
> /*** HANGS UNTIL CTRL-C ***/

I think there are a number of different resolutions across SoCs that 
will exhibit this behavior, I've seen it with lower resolutions on 8250.

Its a bug that we need to drill into in Venus but I don't think is a bug 
that is specific to your setup.

> 
> real	0m21.467s
> user	0m3.795s
> sys	0m1.914s
> 
> 
> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed --length=30 demo-1440.webm
>   (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
> Using hardware decoding (v4l2m2m-copy).
> VO: [null] 2560x1440 nv12
> Exiting... (End of file)
> 
> real	0m16.433s
> user	0m1.764s
> sys	0m1.118s

If this higher resolution is stable for you, I'd say this is about baseline.

1. The GDSC change should make no impact on playback or available resolution

2. Higher more "normal" use cases like 1080p should be fine.

If so, then file "low resolution is broken" under a "known unknown" and 
scrub your patches for submission.

If not, we need to do more 8998 specific debug.

---
bod

