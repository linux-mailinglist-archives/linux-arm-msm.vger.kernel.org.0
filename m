Return-Path: <linux-arm-msm+bounces-62860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B0AEBE34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC7536A110B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBD52EA482;
	Fri, 27 Jun 2025 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAoAoEBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1932E88A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044127; cv=none; b=kA5yoXFo/8JMXLSLsORKIvisMCkz84By9/p2A0f4e+Mpu0jG4qrs2yh7aDyz6CBSAXLs1/oRok0/HOworHO2d/buS1CY5rPZrtid6g7riCossuFnmIUsLZlVxK37palyGOW6WH/c35dz+gYi2RGlk2nNO+OWxYqm3tNTZFSF4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044127; c=relaxed/simple;
	bh=CPhVKvvRZP2RoqPrqurlpapAK8pKjBMB2Uzg2l9MDA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1VGepoZ4vSqHh3SjEC7LQYkG4hlIihQMVfBssYtt7seZOq+sopAxJeelBhIuWdXt+dYuBUo8zXqUlhZSXi78AQW9iusSSfir2+Xo8EjD3md6AhfbfZN9EtMORGu/DbzdMAdffXEF5AetfmwC33SjwN98ovupWqLksm1GPixQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAoAoEBX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f379662cso52190f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751044124; x=1751648924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDt7FHaT4ZSAQUnGiAQ3GxGI761JPEEdyCi6VnGIO98=;
        b=OAoAoEBX4vj7D72EUFTWRGncv2TRq1pENASDn+7xpFpcSy+k5zAnb53zjL2Fh1GCYG
         AJG9ZX0a43EQub9aeVYT8RMJ/bDZ7rTJfPe2fM4LQpzDt0XuK3d1G7H8M8wUzfNtCqYA
         lBE2Es0gpznRubOvbxbD7wdR7AVS9NKq/djL331RYLZ0qIX+SH16zS8jdACEwJej2kUI
         TbD7cAalo8e6DXeK8m6h85YAYE0y8Y0JvPIp0o9gjcob4QESFFcbJYoE9sgfzcUMwJAX
         JY3TbMM3W5cnuWRjdDx6kXN6GReRn4r2KKJskQ9oFbc4pNHfVJ5u8h0YVZRbDC1/jZkp
         tiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751044124; x=1751648924;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDt7FHaT4ZSAQUnGiAQ3GxGI761JPEEdyCi6VnGIO98=;
        b=FD3k2MrvAGUzTEL4zPO4cUcgjEXEGnDeKR+gbLuBevBGqoKOYpPWx7AG3ZlTPvCqit
         9kujmT80SND8ptOFd1Gloq1QFc0jkoI/Bc8RxH2OfsRhpRoui9YCW5nIeBomaypspIIJ
         ssHxQ76/CbGB0ceh3G/BGIwPknBPFlLfyDqNCekzLI/sIoNBRR65kJ9r11HjBAcQ7U9y
         xhRVUPC582SgSaV1JeTsjuBczkDVIxpoPJNkl3/enxKAkJjeOh3uBG5BY/5YahUmqdG6
         ibmfUtvonjJVisFDp4Em4DCFRuzF8rinpnWezGuwcm4OMMxKrfHiz4qWgf/R63+roFKS
         uIqA==
X-Forwarded-Encrypted: i=1; AJvYcCXSo+SvnFGbdYXLhUQF9i2/8pQMFytLRw//ZOitCMRbzuU2fUEPH7qv6gFa2A6fiEDxN0GAAFHJHt6CtHwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOwYpGskNTp2w1L6UHgCF0Yo8T1+SxyLZex2b/OSEmENK57ir
	WwVfyZBTUCuCoI2OG1DqYYjlW/4NcC4Aw2vPIBLyi7yVSJYBEUnaUCD0WGYHMsSEYDLbLOOdjjz
	pWcvPokJJ8g==
X-Gm-Gg: ASbGncu/n1Y/mqTgohxM8PUqEzbd2xXjufRKZXZxWb2oRYMEg+eGA0zgJCJRjMgVgSV
	/AQZoOHHgTSls17VqvaSHcrY1L68G2gghYmBPhYWg2hTR7Kv7runjKAW2p6EFC1CXK0drJPIQmn
	MZYJnNnJtJQH/JsUtQFGWSqk1gnYqLe91Rp51HVPo0fmysrJ4JVnTRyFAlJJiIoBKHe8NAF0nE9
	JgEJLkMomaPsTfiEbUxFvCix3cVPGJHetR1ok2ngEa8vk+G309kTp8JEZH7BpGakuqypkjZziGQ
	CVolPDsXBmtGydTtD0lQbjLR7r1gou5sRLw8GKSug++QmXzOOYes7pw6sO+cAx5m87vkk7j8ygB
	BhMhVpj7ZKOhswxnfhey9VQgjhrU=
X-Google-Smtp-Source: AGHT+IGEiTAHrFznmF82/P4/I4eMpiYo52DQEWoZMaOuj4n48DFOabR3xu9XY1qKoygvdgxJdEBhoA==
X-Received: by 2002:a05:6000:42c1:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3a8f435e0acmr2642026f8f.8.1751044123666;
        Fri, 27 Jun 2025 10:08:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm87196535e9.23.2025.06.27.10.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:08:43 -0700 (PDT)
Message-ID: <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Date: Fri, 27 Jun 2025 18:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> While setting up the vb2 queues, assign "non_pixel" device to manage
> OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
> the non_pixel device(np_dev) when available, falling back to core->dev
> otherwise.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>   	*num_planes = 1;
>   	sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>   
> +	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
> +	    q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		q->dev = core->np_dev ? core->np_dev : core->dev;
> +
>   unlock:
>   	mutex_unlock(&inst->lock);
>   
> 

q->dev = core->dev;

if (thing || thing_else)
     q->dev = core->np_dev;

---
bod

