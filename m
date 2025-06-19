Return-Path: <linux-arm-msm+bounces-61795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81036ADFF6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 10:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18889188C654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A9E26460D;
	Thu, 19 Jun 2025 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckGS5+M0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E24261378
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320409; cv=none; b=dEbxswOsf7+Xq68U4gjmzKrTktbH6eGX+EoHzmcaRoWw8DhUnJWb9uyE5bRtGAs5NW1NmiTZXAdtp1EaIvCDrIyW0jZRKe77+4jiWvEnOhQtp/nI5cQ3pBkywq5JYy2mP7R5qqA7xD3hLuUuzwFphmX/lD8Y2FW8HDsd8lEU7B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320409; c=relaxed/simple;
	bh=a+rcVLKG5LogbRwc+21ftsMiRlVNjgK1wni99iSuW3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vg4pMZtWOtq6cKpoE3SXkVEzmieZDXbhXw+dJ9kIwSBCa6oaZTAlz3hhBn494B+C3QmHYNC4wxknYo9EqKJnZvHdSW6DMnOvD3cIJXkttw1OWSbSRJvCo2/rq3/ZoPAsH9JY7yyUCoMYTSzOLkoYly38oYCjCHFTAfJXx300jfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckGS5+M0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cfb79177so2518895e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750320403; x=1750925203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=ckGS5+M058gnTKUMG9RLGD96zj326GLXJa9omuttPur7zjwxhgPk9TniSH8spzi2V9
         uHXvKcgMlSmqCIwNxDDW+U2kN5aHUR68n9Kk7S7BlMG82MgeEVMm2YJbBXCHxNq+hCyE
         UQY2qPAQegXZ1ghDFEx2J7vBVspeB6aBEC65wS2iFVt29LvxCNsh+/dsmYlvcM2O67zI
         fU+e43gInjYIh2TxYsmEQ8fVC3O+S+MlupvQdfXWbqF8+MqWLd9NmJ2y3DTmsYV/Ku62
         caFygxMhnvKe6VQaAPNu+IuzulGLpuiT+jDim5h9bdaWeuqIDB/Zve+b2yA7aZGaCVrc
         5+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320403; x=1750925203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=awqlOjSBeusYpMzBSmac/TjKBX84B5YcZxakDiHluCVbHcA/1IA4+3dyguJEocVmGU
         sPW1t24bQZ0932gv7pzL8X9stzMKJwSLU1+4Vxk1s43KHphG42cwyOYjv03fbF0o3sbT
         FhdQ626HPr7yXg1YGZma9LwYTmeQkm1QHB1oJX0FX0UTBO4TSYhTtXOA1tMDQiDwv7Ia
         3iYDy7eY9VcsDZcrRZzAIWH0AF1X9ZiYi+puXZcjAO0+/lVi5uRvsZrpjWPKS14cDK9H
         HbhI5Pldq0N8qGM5obEW5yHj4bu9y2qAxyJk5g1GvykW9PRW6HDWWsyIVvntAFMU3JaS
         IzOw==
X-Forwarded-Encrypted: i=1; AJvYcCUhBuCPTc32hdiboC3r1fWNMbIlKVTtrL40gVHeBudB0fYxz7AwAHfY+MddhKoD71QLOZSt7n+OCy7S5hYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0CeVzBU2rE9hRVXH1dmA+Us0N0K7xW1fK+bAog+vEDKfjxbD
	NMvndJi30ymJVx5RIlS94NFG3lRWNkzg/4iEBRJXmZmsvdrmKHF0akkUelZZqo0bFtk=
X-Gm-Gg: ASbGncvmY/HRC6MbNe1+IXA4mnQoPgPIbVHjApvf2b/4ipRqtcg6AvjSDafXS2UO8Xn
	i3Y6VIQh+bg1YurqgFho7ZESbnqDSODDSeRo+dlMoyosozO33dvXA+EKUy1WA9TEkQGyu5wqCxF
	uVuqFAuiC+vD+IMaPFmbLwTRlZ+kYZ+0S/URKTyvIMEYzZD3rOMVYmwrkLncJ20ukxp7q39GpHz
	p358MgY/njJxAYddxwBZ6roUlSl32l25rdSFm4xRmfjDmxG4dO2UB40Ham82qdofo7jLeScmPPP
	JsS5XCbfYFqs5iN43X4bXZS6g87+Dx7gFALhDfo+GhkGv5Y0GYI0EaClNbgATQqsivqF6f7NY2D
	UPc053FcnxNbIUXFArQ+hARQP0eE=
X-Google-Smtp-Source: AGHT+IFWX8/s2AmWjw7FnW4683L5SDBApq2DrAPvcaPvOV+s02ya9PajScAuugPZCDr89km6tcZARw==
X-Received: by 2002:a05:600c:8b51:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4533cad630amr205407535e9.16.1750320402887;
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99cdcdsm20490695e9.34.2025.06.19.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Message-ID: <af44846f-8e1b-493f-8023-b96348a95df4@linaro.org>
Date: Thu, 19 Jun 2025 09:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: hfi: explicitly release IRQ during
 teardown
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 08:48, Jorge Ramirez-Ortiz wrote:
> Ensure the IRQ is disabled - and all pending handlers completed - before
> dismantling the interrupt routing and clearing related pointers.
> 
> This prevents any possibility of the interrupt triggering after the
> handler context has been invalidated.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
> 
>   v2:
>      disable the handler and block until complete.
>      allow devres to release and free the allocated irq
> 
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..ed003adb0282 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>   	venus_interface_queues_release(hdev);
>   	mutex_destroy(&hdev->lock);
>   	kfree(hdev);
> +	disable_irq(core->irq);
>   	core->ops = NULL;
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

