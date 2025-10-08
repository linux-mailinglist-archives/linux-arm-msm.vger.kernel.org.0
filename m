Return-Path: <linux-arm-msm+bounces-76506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92313BC6F39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 01:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 766A64EAC46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 23:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212EF2C3745;
	Wed,  8 Oct 2025 23:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4WyePDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5A2C327D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967538; cv=none; b=Fmb3wNyJatRLuX0HCGKelHx617aCcuKgTMtaXn9JfkFhlMJGa2+2QR6wt7AjNLVpAyuyTu8r290MBEAveY5rhs5qlVlMv3l09nVuVBSDrztfHwG3uem9zCCFRGwtozOkAXnmlImwaCS6Y2hXe8EQk6+zN9DzrNhZQIFNKJmwG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967538; c=relaxed/simple;
	bh=TBQISZKH/GjwZoJUXF5TfT7sT2bjyy9kewRKzJAXMIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKZuJIuA9HME0DMTang1bYKrpGkAHb5OD/Rgx5ERnOplr0fb3nlzrmEfdo4rf5mqRJlb1hCBQ1W8WDvrHoLLuj2Kkxvzi9dpQwEowWUteI+RtTMqYxT+rpe6OG1y/Hq1+e068+my+s5ljzvks5w3XRfdkwlxd76zvNAvMFz4lj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4WyePDA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso2111095e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967534; x=1760572334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMEZbdYmBxBwQ2oYSgatJMEkEKkxHmlBTl3b0l/F90s=;
        b=V4WyePDAe26Xf9zFPSKeqI/9EJqVhdNIws40ku6BiKJIi9nX5s8/gILWdjGAceq5P/
         qc32mHuG2NqUJ8SMhtvQRz2WMlFo9a0dRQDkE99g9z9eyZ9uHpU866OYRcWIxtfQmgaw
         wv8yjBG7Fuks8YPCJ9ypYKdf3Wcv9a+JVNayNnchpmWxqXNyWLkGzvhfJ+U8Harqln8J
         +JmcOb9QBibfKPm1pvKsvGb140+U6OydEdsf3y5YkoHI+gLmHHSK1i8k/zZB9UOUmdkS
         doAbWmC071Nqpj7pLzb4uOON+e1F8ldYPols3q4Pdb8CJ7X3jiMXlkIqIman/b6wIG2K
         LCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967534; x=1760572334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMEZbdYmBxBwQ2oYSgatJMEkEKkxHmlBTl3b0l/F90s=;
        b=d1JF92upTowd64GnduqbH+M4FGDjvKQQSofvITudlh7Ara98LPjUzpGaA9H3piTv48
         U+slsbfQM5+9Y5TzclSTN6RVTbMUQ1ZPxtq8cyQ/0N+BsSIiQ21lCejQP7AX4FaIAh/d
         OhcyXPlFchk7j0Y8P7IelBw/kT1/6pIEHa80Ym8Pl+eU0YXlNosHwAMUP1GtkJvz8my2
         bWjIx0uNPTvTV8KS5u9NtuP2CVhzZfUwgTRWVCdIucbZhjRp5v+fR/jPrf1LXQuNS4BS
         TLfdSsMqwZkUO5dhWCE11ij3RuO+SgK2LYvET7pK4GqWbFzI7lOTOfphWicXyrUDFoBM
         SW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX464HPKlKt4/xbzy5TiQmm34dDi1oFxY3izzB50gs3yUcNHzi0WHyhAdkKSebpyLnAxCScgOWo5ZdWPJSC@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvTzOGnXPh68zRHZwIibaLLhDNERN29PdWE0u/74acvWmmXKa
	7fxAg83hZwVSARTg5mh0US74wBsG4gFDBzQLLJX0r/jZWJaJOU5jtzEeBaqkoSpmxjw=
X-Gm-Gg: ASbGncvdkyVTdehedZHzE6bpGqUCCQQHMM4ygGtGggPePbbCh5iCj9mM7qy1L9kcoxS
	5e4PBkcUWt+uk8oozY6/qGhCtiNigltJaqBiPiNZzK4TRNFyEzEWGL1PKaM95DmKoxXTXUEwD5A
	pOfFNAUFWMnV8UIIwbRcWp3kb/cXiDpTx/KCTaKSivfvWVf//UVsQLtrSWc6CwciD3gq5ClkFQM
	rJvB7jsaTxrOgzhprti48vUYQqGV5Kh3mrMiuMnQLEdpE/dEQIuenkMFvcKAh41fSvBvaLYnbYQ
	/X0iCUsXXeV/YKD0a+uQgWawVSbwjBvW/fyAu4xT9jS87auozdTXU+N0SV8D+wPoO3L/xAJ/gGF
	uXMpZf6L9wiJAnvOdhTNcvYluue3DHdozLOutLdRVTIP8pMAVAgzZtfOc/5FceRBmU2DZ3w/Pw3
	vmb//u6P6ZD66wSXA5
X-Google-Smtp-Source: AGHT+IFsEChlVG8pxTMvthV/pJR2MSo7vf26zXxeNj4z1rkuzP1YOYr4eDF+lU6Q5uMCn0N4JWGQZQ==
X-Received: by 2002:a05:600c:8b52:b0:46c:a569:71a0 with SMTP id 5b1f17b1804b1-46fa9b08b46mr37296905e9.26.1759967534532;
        Wed, 08 Oct 2025 16:52:14 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm24120165e9.1.2025.10.08.16.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:52:14 -0700 (PDT)
Message-ID: <6caf62b0-e8f3-4753-bb1a-8083f0753431@linaro.org>
Date: Thu, 9 Oct 2025 00:52:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 18:50, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 --
>   drivers/media/platform/qcom/venus/venc.c | 2 --
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29b0d6a5303d..8c77db0f6e76 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -329,8 +329,6 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   	struct vb2_queue *q;
>   
>   	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>   
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c0a0ccdded80..0fe4cc37118b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -241,8 +241,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   	struct vb2_queue *q;
>   
>   	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>   
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

