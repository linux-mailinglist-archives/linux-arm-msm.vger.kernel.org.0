Return-Path: <linux-arm-msm+bounces-90440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKJhHi8LdmkNLAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:23:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70980820
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283B630048EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3CA3EBF21;
	Sun, 25 Jan 2026 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANXpQ52X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778F31985D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769343788; cv=none; b=XQ2oygl5Swevj99qHrnAlLcjpTDIjaU5aC768N2ZtFGWYstxuFZeTUSotuwMA7bQfaP5YcTUjDy1Y/BxB1EQQg/viVJwbNkvjcbTKjh1LmO9OG0H0tgX394KdwZ1hu8CzsfMqTpDFOIr32OnGUJotMm3CqijdrI1egWU4RUOJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769343788; c=relaxed/simple;
	bh=MjODaE3Lldnik6r+EEQtGnJOY4MTKCdK023v8j6gmIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm5gYP2PSAxOLpAmWyJN+KkO5B5Ovt7o4ce2vx3RTaVTOyE9ne0U2b7d2T+PmkwlYhr9bMwebUNAITQT7MzR+Rj+XKOMwgysw+ZcvLhRB1MEzImGIKzayjYH0FCwIoqblOLHKm13Ib7I5dQETFrx/mTzoguTMjcaI0Wir1SvLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANXpQ52X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso14355025e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 04:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769343785; x=1769948585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVKNG3fLvRMwGik/QcexO/mF/X2rpGl4bwfxbl4mRR0=;
        b=ANXpQ52X0iG+F5phJ5j3IL23rEtWDC2swd8237SdvF4EtGQieokhr0zSGqolaCTRWU
         8fKx9FSDPK97Ii4G43DMlKyKXvxa5sk5N//gqCPWccoe48ntr7tS2c72DRoXwDoxfrWY
         bFdc1n5PjzQ81PL57noeJr5YvWu52d9Ns4tcDkJ8Q3esbh+5Inv1JfevnQDoUtoF349f
         ZWfjsh4ZV2f7FTfJjgOylyXfg9/cchtUj0FVrwl5C8Th5/WpHaPJTDHZU8FPnJ4VVqrz
         RxUYpZ3ixUkpnwUzYkA/3lgorcT1WHhvoeGjnacq5/sCmrxkla3duPMS3EUglf8jGGxD
         uw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769343785; x=1769948585;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVKNG3fLvRMwGik/QcexO/mF/X2rpGl4bwfxbl4mRR0=;
        b=CDFTHtMyKq6BTFXLIWi4IgwHSSf8rq28TzyA93Wg38IsuA4xLq+pEch3eqAgLLk7Po
         xpHgc9ipZDgqtXw9ghLbgmZbr1+QQXLjtT76GNV3XnmuShaFT2L4jWWhdHXmJ/pJF6k2
         XEI2VVsHwZkS2ZJ5sn2bTTR+tLZnogykZljyAY5nLNH3kQU7Z0sjtm3XXksYVkCNIvQG
         UoRAJcmP2HdanEH5j/H6nKo/xOzFiIZmyRyT19rIKuq+MFkSk/7vP0U3DXP45aLNAmAO
         ZNj7NEuSxxhne4C30Vhb2c7XzQO7NYCSJaMwvRzs8tFw40yCJpYmAngsoUTAIr/2s99T
         PsoA==
X-Gm-Message-State: AOJu0YzNqnge1VtZPgt9TwnAC587TiPg9RPsoJzvYmfcPvl98BU57PjZ
	0+tSFXt+tVUkdOlX4gSkB/GS2KtTc+rSAP7FPPTxxPwiSNWHphdLQM6awH7A3L8+9baOC31FtV8
	LIBB4
X-Gm-Gg: AZuq6aKgMs/m3TeOLPaiVXVgYHw8J9WQnqPAcl9cQ4WGEEfEEr6FdMz6/G61t8UQCm0
	iVTnu+tLCb7I2iTetv+PfaATUySe6ooCsE+cbilAy8/iaQLZG8TSBka5XBK9viybf/Y6Xij6AEg
	pA6QNnDHctYpWN/NaIr0U+Yri9ctf9pd0dU7Fb9Q2ygpbLlCGDH3PbPZ4Mazi30f72ylFHkvBWe
	tppk3+HaR9i6hn0GQdjEVpzf/z5hZKEw9xcj+NqtO6iotHv9BGvQemogQ+mQvhpFhheAcZZsM0o
	40keukWYlV3S4kEELnP648FtAdVhW/M6VaaI5A/e1d87xY+tSdZmWY1HvyQHUsPWYnEOrcCCvQB
	TSKxHrSPXOpTh92yE00SE3ItPZber+GW8gr5a4d0PlT2+1ljtX7fRcAnfX3ODZL2RlfshORcmvP
	vyrqYTeE/bQ5/1ZrJabQNPcSzTJ9JfNv6uHmOBKmrxXLthw7rmyxDk
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4805cd45b9fmr25115925e9.5.1769343785290;
        Sun, 25 Jan 2026 04:23:05 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470474cbsm274962825e9.8.2026.01.25.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 04:23:04 -0800 (PST)
Message-ID: <689df9e2-da26-440c-aed3-21c8afdc9ae8@linaro.org>
Date: Sun, 25 Jan 2026 12:23:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Fix pipeline lock leak in
 stop_streaming
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-2-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260124071751.5885-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90440-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D70980820
X-Rspamd-Action: no action

On 24/01/2026 07:17, Saikiran wrote:
> When a browser or application closes the camera, if any subdevice fails
> to stop streaming, the video_stop_streaming() function returns early
> without calling video_device_pipeline_stop(). This leaves the media
> pipeline permanently locked, preventing any other application from
> accessing the camera until reboot.
> 
> Symptom:
> --------
> 1. Open camera in browser (via pipewire/libcamera)
> 2. Close browser
> 3. Try to open camera in another app (e.g., qcam)
> 4. Error: "Pipeline handler in use by another process"
> 5. Camera remains locked until reboot
> 
> Root Cause:
> -----------
> In video_stop_streaming() at line 315-318:
> 
>    ret = v4l2_subdev_call(subdev, video, s_stream, 0);
>    if (ret) {
>        dev_err(...);
>        return;  // ❌ Early return without pipeline_stop()
>    }
> 
> This skips the critical cleanup at line 321:
>    video_device_pipeline_stop(vdev);
> 
> Solution:
> ---------
> Continue stopping all subdevices even if one fails, and ALWAYS call
> video_device_pipeline_stop() to release the pipeline lock. This
> ensures proper cleanup even in error cases.
> 
> The pipeline MUST be released when streaming stops, regardless of
> whether individual subdevices report errors. Failing to do so creates
> a permanent resource leak that can only be fixed by rebooting.
> 
> Fixes: Camera permanently locked after browser closes

You need to fix your Fixes: tag

Something like:

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and 
stopping for multiple virtual channels")

> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite, ov02c10 camera)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 831486e14754..578c0ae3d997 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -312,10 +312,15 @@ static void video_stop_streaming(struct vb2_queue *q)
>   
>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
>   
> -		if (ret) {
> -			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> -			return;
> -		}
> +		/*
> +		 * Don't return early on error - we must continue to stop
> +		 * remaining subdevices and release the pipeline lock to
> +		 * prevent the camera from being permanently locked.
> +		 */
> +		if (ret)
> +			dev_err(video->camss->dev,
> +				"Failed to stop subdev '%s': %d\n",
> +				subdev->name, ret);

if (ret) {
	// do stuff here
}

>   	}
>   
>   	video_device_pipeline_stop(vdev);

---
bod

