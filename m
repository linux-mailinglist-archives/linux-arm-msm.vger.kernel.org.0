Return-Path: <linux-arm-msm+bounces-69428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33EB28CC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5EB31CC7C62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0600C2918F1;
	Sat, 16 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ggbz/Z/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09E31771E
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755339329; cv=none; b=CZg3k6HJLpYHkenymeOITEWk209YvAv8Zzr5WZ8d7hXywoRzeL+J4Q2X+3itvjA/IYBh67bKmX3xWsGbkTW636LLmBp0NIC5cBbFdj8ElyTjJWt0/am/NznI6g0lslrZTuaEhejMRyWBZBH5gn9KCLRKpDOriUQCNHjzhq32HIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755339329; c=relaxed/simple;
	bh=Nh3NrLx9OEag4aosCiVt6RzyBczUYLkKTLWOeNhbtQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyrqfP2tCMonMt5Idy3ssWWMNGaPPFD9is2VUpJquHsLZVBn9ai1uLPcc+dfNWU4RDIjewT6qjjO76M9/4FSXjfWnrLi5QQaLVVmObvvHU3n8+hXF5jfJoRcD5UbRwurvTrxEWPP8QLBtR0rPUG85Kohp4dRit91FxAwSueJXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ggbz/Z/p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9edf36838so1702088f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755339326; x=1755944126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGt82GlIKWDzCqErqhiqhcXLyT50Jvw2mM2mW/AA2Dw=;
        b=Ggbz/Z/p/nBIjYYEAMC69itrPy04Uw77np836rOtmdq5YPDh2v2TYrKzt4qDWtUKc3
         wmn7bKpE7wtqOTqeEAflMooNtM0YuLU0hLvUrvinalQ6JI0i7/FJ77FZJvlSms5Wh6yx
         YLImcbfxnNQr6hC8A5ZzsdhwG8ETaKZi/haREoE8AOGQ/fGTWKZN9Mdk0jc6Q0lhz73u
         MlsEF31lKZh6RETIshtWuYm3q+CHmrOnmgWysSteRaIATyZMn2f5tyzFWx/Kt2FDVkvw
         JxPDMKNoZ/MvhgBjjUl2ZpWRiM7OqSuYcLeYLkbz8cYxv/hISLVI7DG3NP2kkXs5h14b
         mOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755339326; x=1755944126;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGt82GlIKWDzCqErqhiqhcXLyT50Jvw2mM2mW/AA2Dw=;
        b=ZNBfKhqx4SyoA3h3qJngQjaLi1xp/NDCUXesGqP+k43mlich7CtmhaHSI2W9q9F1vn
         XHsg9XSEYa9jJDaeeNKbf6ua/3jHO/8ec+JQdP4OPWxe8H+gEpyy0gZlh2wJEl+/02jW
         5xEx/yMPhvf5bQg3Wl/Eoj9dT0N+3knEtPs7yh00rPs4ErUzr60CVs/1XHjH0mHhjwrI
         95HXpXDS9rzY30JMvObvYGBzfNxWhR+0IVLcwZYaKz/RRTfS2R/2NMyVXjtbKLU6VtXg
         cHyPYVx0bXjAwjuXzjzK0E+Fpttjd7I08Yr6kC5mma7N6C4D3esHa6RhaBCfHWmVGALz
         Wy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM5tH1uEd65H7IXrQTpIujJ3jsSfsZDUhLW+v6xlxBvwUPYpyTJc7jI9B0d2LuIKv6RaQeNofPFDO25YUe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0ASNJGKnteM5FPd+f4Pi/OgkQpHeIbNnbLcEHYrI4+snHNqW
	+1ZudNn3C9t3V/51Roujc2it31WqBJHO1/AIvaqunZoAPvJfyZIA5q3jiSsK1dQuveo=
X-Gm-Gg: ASbGnctU76Zz97/dR6kYsbrkSMMcpfrwOBRvPvut3V0qWLQLFrROwPFVugcAXMfIhWf
	GOQkW2wYy2p99+E8Dx2ncA235sD9VXDn5oQjFqPJG/dfrSkANfimPDBWmPkhIk16hTp7PqmwpQA
	trfECB4H237i1393KCekTKdZD1K2h/Zv5xPvHNoKynoy0nBBiFzAJWI4c1CGMuDcw66O23nozrE
	t2sc9uNXfjfcVeQso+zcv5zkFdgkUcPouQB+vy2YitfA511eVvle/zru3p9gE86gXYHqFv+pxBP
	F0MtNVhwpO6b8W3LUHaUcKdQNbKnyfFT2CerRW+RfKD8wFzFZKegLeW9vC96UW7FwKbHEthiCiV
	t77umberNqNXMNefhtTtY3RNbE3WZ8VHkKgR5rzU1z0TyjD5A1NoMOFQfclKyrF6U
X-Google-Smtp-Source: AGHT+IGmLANuUFgyoBXIF4SnP+CvmH/WZED91QLhAbarFtBDm+auOklS8ukCHnJhlG0Pcv8G6VzDtQ==
X-Received: by 2002:a05:6000:420a:b0:3b7:886b:fb76 with SMTP id ffacd0b85a97d-3bb6636cb0emr4085932f8f.12.1755339326328;
        Sat, 16 Aug 2025 03:15:26 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22319780sm50655435e9.7.2025.08.16.03.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:15:25 -0700 (PDT)
Message-ID: <956110cf-d309-430c-b30f-a9c442e015cf@linaro.org>
Date: Sat, 16 Aug 2025 11:15:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/24] media: iris: Fix memory leak by freeing
 untracked persist buffer
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> One internal buffer which is allocated only once per session was not
> being freed during session close because it was not being tracked as
> part of internal buffer list which resulted in a memory leak.
> 
> Add the necessary logic to explicitly free the untracked internal buffer
> during session close to ensure all allocated memory is released
> properly.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
>   		}
>   	}
>   
> +	if (force) {
> +		buffers = &inst->buffers[BUF_PERSIST];
> +
> +		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			ret = iris_destroy_internal_buffer(inst, buf);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> 

Why is the logic here not to simply release every index of the enum 
iris_buffer_type ?

If I'm reading the code right here, len indicates the list of linked 
lists to free, adding BUF_PERSIST appends to the list that may be freed 
if force is true but, then what about the remaining entries BUF_SCRATCH_1 ?

Is it valid to leave this routine with force = true but BUF_SCRATCH_1 
not specifically indexed, if so why ?

---
bod

