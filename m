Return-Path: <linux-arm-msm+bounces-21076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC278D48E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0E311C21F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 09:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093E879FD;
	Thu, 30 May 2024 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="RTkoO4AL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101114B084
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717062484; cv=none; b=Fwln6rdTLeKFtOsfr31rGobZejrQLI6bslG44QmZf8ra4EkEvAHyhZKLVDyX+TiRhxVRro5Y9VdG2/+6RoKZqEjMkhSClakPDp2FMymmxr2iogTaXbUUM1gmtcyiv6iR1frvXoFnMvQqWDBnjHn6MR83NDGSCZ5vE3dg56WE1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717062484; c=relaxed/simple;
	bh=YATmH40oB4qgdcAInJg9EAo9JMTjsJPP/ZOthKAQp2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAljmhVlXNA6gULS2ChKUHu/tNBCqfS+JADGJJojKSHTTqpf05j0y6/ovDfhOcxZ3HEQSk9kWdSBGrSo3xWI37/vSNKUPBqBRon2gAFdjqfBtLnHm8g/k8ilqODtPdJAzbOapqEv7OWY44FKn5X+/4VvKW0XY+oqYTPeXHCudGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=RTkoO4AL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso666668f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717062480; x=1717667280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pMMndQo0Yg4u3ej2HOS1ixNtUd/Tv/4Lxi94E6B51k=;
        b=RTkoO4ALwY0ezNUoRovH3RuaU03G797cuDjvLdWMtkzccN9dO6SugZAHVG8ywbugow
         3r1PkHo8HsbG+NzJM4Oi3QTNLaKORlVzxQRwyCqOvigyyj8tXq3FJLz6J6SMMi7mhB5O
         biEoL8W0ZbmStIneLXExST2a5Zz3ps9c0xlYATbT2vIte5T8yzYdeGl5xK+Fu2mK2mVD
         82dJkdPM8uelu2Or1bVXmBCebfBwJTnO6gbbrA/HTC16sS0JLL6IV3lvvDyV47yt0IFY
         nWDPW71F3trCgeSHpc2jT0n3fF7d72k3jRMC1aHruMfu83C/QWSWdAdueY3ZLMF1DekT
         gTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062480; x=1717667280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pMMndQo0Yg4u3ej2HOS1ixNtUd/Tv/4Lxi94E6B51k=;
        b=VenTEgr0b6bdN48SdEDsZQbZ2B6e6BC7Ak4vAq0Ci2bVArek/F51qoX6SFlwYisZyZ
         gDD6k7odRYZIoEDDrgfwIZ/xO2CH5ID303k26HEN7D9BhBjfHCZ9aLjyvuk0N0gS+zla
         VBUPDkwB62TrOiE/h6Syby+a8ZlZMYPG+/Dmr4LA0MwOgGIqA4fj4qL1tykNG4VuYP5q
         tLNRBV4SHNwfALhxybXMmrTxOfoagYDXu4zTiINKfs3EZ1qEhcRzrJhF5BLrGujNvScl
         wjnemkYD42DDNBNd2YTHYvSLBufc2suFcAh+zU0SGTeied1GfhRlRujxRtKoOL9HhTcY
         SI1A==
X-Forwarded-Encrypted: i=1; AJvYcCW1OWbk3kBIkpp7tFiP2obQy+NDzyizYvf6AMS9hQ6tKkZbPfUSQOGHLhzFx7ty62x3m9Fl6G/2O9+wYfCc2HKLRr4htMNIEEVfZkey/w==
X-Gm-Message-State: AOJu0Yxn30nIcWv9yyu+MVqvPNyhvMroLMlkWjJVq6pN6frbXHEGfQ/2
	c+QavOAGqqAwC5mt3eyheDHV7/q1WfXvdvX5rie89NuRW0UIIucH/1i8kHLKoq8=
X-Google-Smtp-Source: AGHT+IGmVWJIHpVS6zUzWQMTWFF7Uf2JRClJM21btErmVANQCNf/7aiObxoWiYzf0ACbQ1o7s8mC7w==
X-Received: by 2002:adf:e30b:0:b0:354:f3f4:c007 with SMTP id ffacd0b85a97d-35dc0095526mr1477892f8f.29.1717062480021;
        Thu, 30 May 2024 02:48:00 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557dcf001esm17118609f8f.97.2024.05.30.02.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:47:59 -0700 (PDT)
Message-ID: <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
Date: Thu, 30 May 2024 11:47:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2024 10:43, Marijn Suijten wrote:

> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
>
>> When create_address_space() fails (e.g. when smmu node is disabled)
>> msm_gpu_init() silently fails:
>>
>> msm_dpu c901000.display-controller: failed to load adreno gpu
>> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
>>
>> Log create_address_space() failure.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> 
> Thanks!
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> And, after checking the below:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 655002b21b0d5..f1e692866cc38 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
>>  	else if (IS_ERR(gpu->aspace)) {
>>  		ret = PTR_ERR(gpu->aspace);
>> +		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);
> 
> Maybe this wasn't done before because this also includes `-EPROBE_DEFER`, so you
> might want to wrap this in
> 
> 	if (ret != -EPROBE_DEFER)
> 		DRM_DEV_ERROR...
> 
> But then dev_err_probe() was built specifically to be less verbose about this
> (and track defer reasons).  While this is an init and not probe function, it's
> called from struct component_ops->bind where it should be okay to call that,
> as long as you have access to the component `struct device*` and not its master
> (IIRC).


Hello Marijn,

I have moved on to HDMI.

Feel free to take full ownership of this submission,
as I won't have the energy to get it accepted.

Regards,

Marc


