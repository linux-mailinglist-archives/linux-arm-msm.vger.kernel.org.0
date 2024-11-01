Return-Path: <linux-arm-msm+bounces-36718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3729B8F86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 11:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E8121C210C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 10:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7535819CC27;
	Fri,  1 Nov 2024 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSsNuvOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2871A0726
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457581; cv=none; b=hKBbmqzSPKXCrcdusWpn4sAyFFCC/da28AJX1fDZS202eK48lCAu6Fa/47puzC1Bf8m5I2cfzMTLy1ZndN5kSUW5H0KdwIeP+1YPDHuoBucSqgW+Dh1cBqcOGNd+3geqTcJnHAoZW3sPtrscB6dJgGKxqzNgULe2qS9xZ3w7EMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457581; c=relaxed/simple;
	bh=nIWiBwHnkqzLYf7olD7gqFwtSd6ENgt+tj/vqI3johw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpiwCeRrwZpi93/xhTlun33Kh4i2yICbkZ40h/ZfN7kmeHn4pRqHWkbuaNb1XdXSCgmCnOiMNeGu/XR0OT40aMIsjTzadRb4TeuVDSEPqNgjzyfc+0iKZ8lhADbA92pyByUOuzm31Y4kVdg91M8rvN7TT4+YgLx2zRwMuBmiwSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSsNuvOC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314b316495so16352995e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730457577; x=1731062377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpA6oZQuCmloruRIu239MJgRSbmWeTtcRHZ1zdEpTxc=;
        b=CSsNuvOCZphaHsCblUXB52RgpMZi9QtIGqkIAw3dtKWBpk/mSu5RQXaBGn1SbCCMof
         JVR47iAiQg8xMtHs38rpZ9pffcmH6V+G3tbZ21cBnRo8vZnYBB6ayfCGRHKBqSCjdwuV
         kAavmya0nZ5l/BkMOQnzRcB4Ev+wvDWFkW0QvvdxRPl8QJcVfz19ME8oLFI9jG+n848X
         b1TXClTSyAtM1neeqfchTGYtsqt6M/TaaIAQ5G3XV2wG2FNZ/sMdPLbkJ31RqtdVmRuX
         uBC4HQDEU3Xp4ht/PdbDiCbl2a/h4yEeRMg/jlp/prRLiGdFii6DVHiN1qu7Zw/JNUOI
         se/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730457577; x=1731062377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpA6oZQuCmloruRIu239MJgRSbmWeTtcRHZ1zdEpTxc=;
        b=YWnjTtgk8Qju/ANXiWMaB8N8UMEyH6Z2CQivWsosIy7mAx5gCBRnXFfVC/vhp9SMKe
         xiwGGUDnZtnWz63Q9kp9iqv3fuvUgw/1bO8XBRTbdMP0xYlwOK40/16u+vHfwulxTyDm
         /cGa4+jushGrZFLnISoV+0Wh0g8QX15ZQDGHfF92SxYS7LkmchY1Jfq839krYJP1amah
         9JC/4UqRd9iapsoCIKgFt3gloiPNvAu3behwpPoNfv+qO/u9SBBuxwMu8PECsYy0KYcl
         AFNZYmU3SrNeGJ2qIcmG+5RlCMXiegPXgbnWHelB9F7pdHVd0KCy2k+xfjXWhp5OQVJf
         EnUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3cuOBIoWXTT1sA5vjc3OQym4obM6Rc5zMq24wxm2j9ApvSFWTnlpiCQjXxFDzZUUx0m6kz2wt3umIBI4d@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1rPhzlf5V7HWf/mbfhBzOIoeiGsWMUQtQCQA94mJuW6vId9F
	r4nKy84hAg0Nj4Xxcy991IruV1THXo7yW7XE33lNgPmBd2gUSFq+IW3pOFyVf0g=
X-Google-Smtp-Source: AGHT+IGUUeraI2AHPHyOxMnlI92HlBbXuqTgbdxId0qtgQfqlUmT1WHhFGv8dsxR7gHrSyAPOAzU8Q==
X-Received: by 2002:a05:600c:3c8d:b0:431:508a:1a7b with SMTP id 5b1f17b1804b1-4327b801250mr57559765e9.34.1730457577384;
        Fri, 01 Nov 2024 03:39:37 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm55854545e9.7.2024.11.01.03.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 03:39:37 -0700 (PDT)
Message-ID: <a2c7d55b-bdaf-4cc1-a653-b398952219f2@linaro.org>
Date: Fri, 1 Nov 2024 10:39:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: amphion: Fix pm_runtime_set_suspended()
 with runtime pm enabled
To: Jinjie Ruan <ruanjinjie@huawei.com>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
 shijie.qin@nxp.com, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: chenridong@huawei.com
References: <20241101094050.2421038-1-ruanjinjie@huawei.com>
 <20241101094050.2421038-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241101094050.2421038-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2024 09:40, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: b50a64fc54af ("media: amphion: add amphion vpu device driver")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Add fix tag.
> - Add Cc stable.
> ---
>   drivers/media/platform/amphion/vpu_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
> index 2bf70aafd2ba..51d5234869f5 100644
> --- a/drivers/media/platform/amphion/vpu_drv.c
> +++ b/drivers/media/platform/amphion/vpu_drv.c
> @@ -151,8 +151,8 @@ static int vpu_probe(struct platform_device *pdev)
>   	media_device_cleanup(&vpu->mdev);
>   	v4l2_device_unregister(&vpu->v4l2_dev);
>   err_vpu_deinit:
> -	pm_runtime_set_suspended(dev);
>   	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
>   
>   	return ret;
>   }
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

