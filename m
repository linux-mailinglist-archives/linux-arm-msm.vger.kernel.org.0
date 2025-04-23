Return-Path: <linux-arm-msm+bounces-55225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79CA99AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4CD3A9AE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF2D268C73;
	Wed, 23 Apr 2025 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLR4irnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B6242D75
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443679; cv=none; b=VWQitujMhnwbfMiUvtLewXLk5gqQTC7Ao0zNZomT42TpT5HBhIPdLYVw3K9fkvcisukMtN0HGG2KoTORG92o8Eb0ST9VBvh3p3iIRA8xYkxEvuxJbJtPYJPUG1ow4owZfteuCD+/vBZHUW4LazDwhnZMaSdPMmpzm9lF3c9j2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443679; c=relaxed/simple;
	bh=UoXx4tGES9OMPPM7oZI7K3CxI/4ypR1vyn2KvyB5orQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROZZuONy1iX4V0AgfFAh3Iw6/jgXE10FTaQwuei5lPuR9iqOkrSQXf1oqbPZ3Z1ZLZRydDvr3xgxGleyEwlnWMixb/gmMyFPkDEFmRfUz9uqPon/2rpYfLeFHhF8dXeRnydRLckHo+RPDxeTEKttte75svHBrEmynTlan8n/0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLR4irnJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso1852835e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745443675; x=1746048475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=XLR4irnJGnxyNuZJ6qrJIHxW9ByjG7kEGsip2cYdSXNLY0bXFDqhrI4MuyNbs5zx0z
         mGebB66qlTp3hbnLAnc7vTXRRJQraZ2WVouJ1ZnAHEcXIZpMcMWeLSC4WSWOEZwTzdWu
         HiungUpCZQeqT1kf2uKx57pHtX8GHgu9ZpWpR4cthVo9sfWANysDKCpZsfBqh2A6jsy1
         w+U93jdT9XL4IxBs0eOE57A1OqzaZjI8t7g2vptWdR3Q8Cd1eySulhKwksIq2VGIb+0Y
         v3BqZBoI/i65YLZQy06t2wa+kBT65uzU8ufl2IAEr8Ch9y62rmKK8N57eJEVg6MSUhVr
         LR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443675; x=1746048475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=YnWdICkNn+avhEa3RT9PU6RgwO3iMpAd6IUsof7Rix8JqMwcXE/EziALj5XxoC3EDt
         8RGOsSdGIZAFI13vnoewrlU++L6OBXuck71rd7z3gS7ZgrHAYuhr8FMej6jqUhSNCyqm
         tSPxH+fMXR3NDrgUowbhcK576djefuEYiEPqimQRJ/hB51f9hpPrvUcR0SBZs5A6tySP
         qgXlB/+Bap8xxI4ffd24fhFFwW0S8jixdbuNg7Y3jXBuoSC4+AXc9QwJMJc0Jjx9+UZE
         OCOXiP3Gdk/mKpJCoQJpxdPeP/6yDi6eDHExtSwgfXbrdT9/VIMChJZUhWDEpAtIvXvJ
         f6qA==
X-Forwarded-Encrypted: i=1; AJvYcCXqaTEEnhZt/+p81k3hAmqrS0NmmuH6AcKbmC1HfxPgkcc/4TCjjtbo6vXyn9mqIo/CUjmw3WAHo666UOf5@vger.kernel.org
X-Gm-Message-State: AOJu0YyAs0ubevk6gisp0Bef+o9zZLTz9qMwUDo9NLOjVfA97EWNc0AC
	PC9xT4d/Pkdr7F5Blq2ir9GrsYWf43nOk60dFOGwqK6TgDMpSjq7B7lyp6+zS5o=
X-Gm-Gg: ASbGncvoqI34yaBvkCGuhxLwgaTBanCfUIHZmzSwZD4H5Ms2RODxV74gICtWICO9Ppk
	fuNbo2mvPqpDVIrc+qhEPQwdYGxFo5mgHYg0dhFgcTXLuswfaPVMghTP9xmo+Ed/Rs4EdSMsMCg
	MFdC2YrFzjW9tfXag50/LszPNvE40VmNjs6LKjwA50c3McepPfbrEMtNFbICm5mavYXRNMDofp9
	UbHYJd9t0hxPnVbU8OJoF0z+0EHZvu5ntEdQ95CU2Tlbat2lnBHD1xMQgZitxsgYnU0G4IqQGG3
	ygjtd+JoCQoMIrdHdvSlIPNt+uSdclqqT6BeskJ4uznMkx7bDGq+nPh/U3jGCiOplgXT0DuvC4H
	/Y7II4jUf9zxNDlSN
X-Google-Smtp-Source: AGHT+IHqb57GnB8kDuXYgg2wy9NjvC9CrGI7gkJ4N6LcFpbnWl0SOhTR/Fqxf+gYXyCBGmhSP7sFMw==
X-Received: by 2002:a05:600c:4ec8:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-4409bd051e3mr1119865e9.6.1745443675342;
        Wed, 23 Apr 2025 14:27:55 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm20389750f8f.62.2025.04.23.14.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:27:54 -0700 (PDT)
Message-ID: <198b6f8a-8502-4b57-a1ba-77bb585aae65@linaro.org>
Date: Wed, 23 Apr 2025 22:27:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: iris: fix the order of compat strings
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Fix the order of compatible strings to make it in alpha numeric order.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,16 +335,16 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
>   
>   static const struct of_device_id iris_dt_match[] = {
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
> +#endif
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> -		{
> -			.compatible = "qcom,sm8250-venus",
> -			.data = &sm8250_data,
> -		},
> -#endif
>   	{
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

