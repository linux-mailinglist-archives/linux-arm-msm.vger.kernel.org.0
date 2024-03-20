Return-Path: <linux-arm-msm+bounces-14657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 754698813B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16328B2360C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 14:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8144AEC9;
	Wed, 20 Mar 2024 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjMl2+h5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E503B48787
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946231; cv=none; b=QLdeX7X8bvmgKIqw3o4afF9YtQSJN+CCcr/+joGomAFGbc+j0kIG68FbuE2jFJr4gq110p50gQwAiaLWqpHrF2+X0Jt3eVusLRsmPCKkFHFXcFUfZrvKGztITNdcqXg80NVXrJkd02CGKGPV8DfBLgqZ/DV8+CKOr6DoEf5dgq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946231; c=relaxed/simple;
	bh=gu1hh/2Z+0zV6t+GkmDA8HqOoxe+A8nWz0/ii7dpFSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AK3x9RqDlpiHQtG2XOIjVR5Y+VHIoX9T0lNkKfJ4if2h0Lg32xzwRLOJT8XntsIm1nttudBNR1T78N35bM5Cw31gWB6co0/jlrawdIk8tm8oGp9TmtSi7kzyy71rSIt50suIyTcumIrcLDQ9s7ckBXi0kX6iCllYAKLaHn0VM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NjMl2+h5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512ed314881so4990266e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710946227; x=1711551027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDgod84KuouGxAnFRJXrI6iUoNittNU0HWVmgxiV1Rw=;
        b=NjMl2+h5xHRM2e8WDlUj2Gu7rT0kHLNE4r+J44Cxr0DIUkNaYqozsCul4+rsgF301a
         svznUIxNbliZKeDlHFl5uH1N8k15x2mr3gk2k3TaxuWyefFHHVyBc/KhsuQZ8+5pQZbz
         uuuVhobxpdMCLxyJGgrfsdPaKej72FagaU/AFW2KHgAuEsZA58ZgrKADVVF7FbH7sHCt
         IeopmZjXaSFUVZ+J+0FbomBCD+n78So0qdyH+NElys6va7ZE8ebPCYKAZRvaHMkoE4LL
         c6YR+skmNWab7ZJkNbNlMrB17RgkuKkbjgqRRQuuoLzP7DbgTG10qXvcL/eeoqTc4cXV
         CRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710946227; x=1711551027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDgod84KuouGxAnFRJXrI6iUoNittNU0HWVmgxiV1Rw=;
        b=fpQDzPX/JYao6hYq40AY9bQu9RY+oOvBMLmocBwu+59npl02FvBK6yBsJ/ly9FOmq8
         px554sTeN2meS06LG2frquGBMl6Sluzm2tAbKXo0BfmuwcDcQ7yaQLxwbXjIRud9jB4Q
         xYraeX61tQ5dBmLu7SzgovpUD2B+m4WxENYpQZKuQm8yUgou+AnqIsjPZg1MKWs2e0Xa
         sE6G3VHq78YK5rMWuLwAT49ZHRWXfBN3aRdAYK6rbI+e1UVpvI/y80S+qrkZOrrpUB6B
         GC1C8kyVYr0+0DGWLB2tU+XuN6K8rQc4rDan9AdgOlQXl2VT2IZoi2vQZnt+B2fToAYS
         Yx5w==
X-Forwarded-Encrypted: i=1; AJvYcCXvD9Il+slc4a5DHozYhgPyDHH2p2gtt9aHeDhlV6xoUYNfOQpf9cl3KnjujzGSVR5TkqrDpFAISoBEWHkBwe8TI8tcauBvgUZd0m0B+A==
X-Gm-Message-State: AOJu0YxiiW2z2gvd5Xj7FmmZ6HejnGPdv2QPd0g4gZPq8Z5FZHI+zNpa
	1dUB9jsWT7BmOdjZe4EM0r1Uin6v3b0wfHiy4GyH7v0wXoIiOaHD7t8GhscS6uQ=
X-Google-Smtp-Source: AGHT+IHFTQjjm7QJ7S68UvwSHDyyCfOQKGZm0NR4duj48HuKNYdp0Rl7Q5G+RXRzgBV/6RQivN0x3A==
X-Received: by 2002:a19:2d1c:0:b0:515:8c9e:d164 with SMTP id k28-20020a192d1c000000b005158c9ed164mr824699lfj.1.1710946227168;
        Wed, 20 Mar 2024 07:50:27 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id he9-20020a05600c540900b00413eb5aa694sm2446589wmb.38.2024.03.20.07.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:50:26 -0700 (PDT)
Message-ID: <98e0ef5c-6971-4ca7-9f17-76f932edc07e@linaro.org>
Date: Wed, 20 Mar 2024 14:50:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: qcom: camss: Add CAMSS_8550 enum
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-2-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-2-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> From: Yongsheng Li <quic_yon@quicinc.com>
> 
> Adds a CAMSS SoC identifier for the sm8550.
> 
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index ac15fe23a702..2f63206a8463 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -78,6 +78,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8550,
>   };
>   
>   enum icc_count {

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

