Return-Path: <linux-arm-msm+bounces-60311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97148ACEFED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB6433ADBDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359BF22A4D8;
	Thu,  5 Jun 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mulHPlET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A322759B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128652; cv=none; b=UTrh8bYxAWEoJvq3uyfSyp9fgLPeqbtGX5XhMTUoDsYDTyApiUS/j08mKcB+NQf4+oSQhBqos4wsnmTSCjTRM+/ZQih7sqvBut3iFrLz6Azh5y0rdF6d2kfWW1VbNA6sa4lGLPAk+M3ELhKAnhtJyR7oNbFjApcH7arxt1xTuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128652; c=relaxed/simple;
	bh=t4faCEII9JXsy8bQ1teoJQwe81rcZnPfPN7AzMQqsho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuUl9c9uUpFLLc5FMalsfAkKiXDkDw9U3MgeA7SQIye8PmUoub/wBI1+48o0DDKZcAR8p8mf6EEayd8bkzVh/tG82HZIo7hu/6A9SRXfBEgHgQeYvxqWONtaFyc94rfDOyAEeW0TMppuD2rIF+SZ4jEIk0WLXkoJEz+9xx0ymMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mulHPlET; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so578864f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128648; x=1749733448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=mulHPlETvc4CWLowZXAx5uUDZhvngCJrGFk/p/Cet1lOuVmoi+EAvSmzw2gNd4yvu+
         6mhcwzKBqWNKF3r6jtQVlGUWKI+wCEFNPFQfI3BL+5DjPTHsDun50c5K99Xtni1G+/Al
         GT+/L3vzl9BwYO9jI70XqAu22Pa+2VQR3C6oiS0d+/EvS0Bj1roCL2mjcSHOAFDdtoAK
         SyqkpcD8wHWuRcA/HoyM12OMUKbm2PmdhZYIMB6sQrCJ3Ue0GU/RqsFMrrrZkgZxbjs6
         CrIafZBZLKUt/+93GgV43C8p2S8A/HJKaTY39iSCtcLldaitux4nxKD4ij4hG6+SPibT
         6YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128648; x=1749733448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=Gf5KRQmq4c1R6wJsOclVIDL186/hnVYtpsQ7IQCVFJ+4eqqCyXbxQQ3Eydxi5m/eBB
         TAZJ5Cp4rbWHHXylEnJDDThmqlu4I9Lpq8v4s4NZOPkRq5yhnRtfdUIoVFNqgI1q4hiX
         2GwidVxxpihx8S7P6zDckkcSxdwQjwYsTSklnRCRzkTk0mRuOZv6JtI6TU2NYYhyCMfQ
         FK59pI0AijkKDdOcC1UrZnlZ7IU7Atc++IcrzOVCBxsAyOENvNwjkhonaSuCaNm1Y9yj
         Jt/NR+BDayYqcHaU5Ttg1jhpdLIH85gsyO1aqEBcbbEKjjGR06FkFPUPlgRkmI9B+OpH
         oypA==
X-Forwarded-Encrypted: i=1; AJvYcCV6H1Gyp+d0OgDIKAas1nlWosnn47zQ/0LA8A2an13NzW3KSgQ/2kOYLOxUT1WkY6cUa7pbx2AucJ1Z5Y3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzEkPI7fGLemdE0x31Axz8ehRCX65VsU4QCO8VUwkK3x0tUfflI
	B+oCBnUz9FgS4UZsFjtMVVdbU4nj4j1Px07TMlOXSZyZO/lWQnegCnY9lguysZtmTok=
X-Gm-Gg: ASbGncuOvSQfw4mQQfgSZ+yQVb4OjYTyrI+AtjGPvkGMq3T8Fvc5Vi3btWXodQMWtuz
	PK7OMGw0aaWEMTtMuL/tnC8LOWiD4D1ahLXr0cjROKNEezbEyRWC0UB7KCstrtFbpe3NbH7vOWZ
	6QJO5TwZtx4rEVE3UG8+X8f9AhLAj8bN7tHtvMZbZFHWumdB1zdRUuWe7yiqTZ0920d7h1w301g
	hxvfcJaKd0BqRwS1G3kT5tBRqvmrFtqSrQcQzkeEZzuD97wsQ+gyoU56fdSJ4zPonbqskDrXgPF
	tQVCdTyyJXTtFxfzEUmGlMINsrfXWOgFrQSRPMCIGWdhlcTW2DQNsoKDT0o=
X-Google-Smtp-Source: AGHT+IE/BmSVdL4tbFWwRI8QdSGrFvhSPvFKD3SoCTJ/6Nr+n1FoiYUpOSD1J4F7Wnuta6OWoz81dA==
X-Received: by 2002:a05:6000:40e0:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a51d973c93mr6275072f8f.53.1749128648387;
        Thu, 05 Jun 2025 06:04:08 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a525da8e66sm2814969f8f.38.2025.06.05.06.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
Message-ID: <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
Date: Thu, 5 Jun 2025 16:04:04 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-3-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() allocates a handoff FIFO, but the matching 
> hidma_ll_uninit() function (which is invoked in remove()) 
> never releases it, leaking memory.
> 
> To fix this call kfifo_free in hidma_ll_uninit().
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> ---
>  drivers/dma/qcom/hidma_ll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
> index fee448499777..0c2bae46746c 100644
> --- a/drivers/dma/qcom/hidma_ll.c
> +++ b/drivers/dma/qcom/hidma_ll.c
> @@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
>  
>  	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
>  	tasklet_kill(&lldev->task);
> +	kfifo_free(&lldev->handoff_fifo);
>  	memset(lldev->trepool, 0, required_bytes);
>  	lldev->trepool = NULL;
>  	atomic_set(&lldev->pending_tre_count, 0);

Is it possible that the handoff_fifo is freed, then we could observe
reset complete interrupts before they are being cleared in
hidma_ll_uninit later on, which would lead to the following call chain

 hidma_ll_inthandler - hidma_ll_int_handler_internal -
hidma_handle_tre_completion - hidma_post_completed -
tasklet_schedule(&lldev->task); - hidma_ll_tre_complete - kfifo_out

?

