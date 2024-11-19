Return-Path: <linux-arm-msm+bounces-38402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAD9D2E96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 20:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D801B2750C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402DA14A098;
	Tue, 19 Nov 2024 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="crWNbWEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510D1487E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041934; cv=none; b=Hu7dCsjJEaOcDQkf6KVd0pRMo3GZanEHavXRKQe/KeyeJLfnTmcx/mlmM3MjaZq2fEbzZw4dLugb9oQwnGCjyek0R/Cd8nRmleVC5QUn7c6gwH/2wmdILAKlLTMVcW/1CbT8jDJqZd8Wp5Ewv0g7ggBICf5bN17jpqcXw4dNW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041934; c=relaxed/simple;
	bh=asFoX3ccsoRwXNxFa/3VfHc8pUiFKaoK2MAeDszEGhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXoLkx1PkDTDeajrhey9mjG2DqSvINkAbMC6gk6h/j7dl+D5+rHmxQTDIEJV2nqsC0z5rwj2uOChMaqdXCg9Cb2xMQlMjJTCCEfNtyaLvkUGOKnZ8rQRWcue0rpb5Gp26ck/U4P+QwWtYEgopMTysjuNA8vBRYpEpphbPQeIy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=crWNbWEJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431506d4f3bso3498685e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 10:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732041930; x=1732646730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kjLNN0dLMBygdXzOcYy9iar3A4IPmxazRXBVg4HbYVE=;
        b=crWNbWEJiCk9pCW2QcFUJTrnZxrvu92Zz5HBU/fI0iXIzzT7bj8VPH/Wwesutogwby
         +4RY2gvxPXsgJHcSp/m/kZnwXKgauIMDHQzSxUoHsX6j2movNVTiV27l0qNyClbatDJn
         /aijq9kMTbpy/bb3SoI1Zav6/mwV9vqnpe2/TrDXAyBUnzIpUcRvtomzp7xhYQuOTy8k
         pUDTBavJzU1gomrfelaOjvEL4qW4JPJxfWVHMNxqG4qu8tjo+igM7S+nzng0V/vuIeNr
         EwAmsu3kEKDbd0Q8r4pAuWZlM15d1z7bVzrqqy7Ug6hkdDd9yV4Phk0CPcDf9tKOUjNX
         X4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041930; x=1732646730;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjLNN0dLMBygdXzOcYy9iar3A4IPmxazRXBVg4HbYVE=;
        b=nYAjbNKUB1UTBZeC0+qmu3/bFFHC3qvIz+l8vFNRqpIZl1oDo/5qS6xp3uKHyhbckk
         DpWxcD2ROZ9gDtt7CUVyu8RYy/ctw0Q8SjAMpC2N67wLb+WI68DXb5/B0T0qOEgfSpzc
         0LfFSazQdElGKW3U7OlsqAAC5yxRlEpsuAYmWl6TM8IXuNZflb9cIXf4sq80ghdKjCK0
         sZ0e63jX39+vnfjKX3dZKNdtQn1AAn7SKxVhnL4nlQHSRq6c7JB5RAwyFZn/L3k3jdps
         UAPHo0EualdXinEYFDzptGVaFX+aBfy/CdjuSuHX5A3COn4tB2CgWFeFYFHMkQ6uG9od
         zNEw==
X-Gm-Message-State: AOJu0YwWSVxyFikQ9NIEirGNYWosBMx1Ea3ZTo4EZ8gHMVPkShLzwTFt
	arBxiwA2LVoJDZfDmRHACm0XrE58zp9tPsbksWQ+66EgPTTTnA2v64y4XSzwmS8=
X-Gm-Gg: ASbGncuBKS+4CuZRBDYFjhfnCgNDK3rz7D27mW5rl/ewgxVVT1GguvGa+eMVm7NMaOi
	sjWD58Dg3c4dEzCrs9JUp2SaT4Y0btI9M8pMEcHTmOGP1HEnVuAMX3mIE8JgUZmyXULXJYmRDcl
	rwRkfz+OUbuZwRBpjMJdjIiAqLTgXo81zwO8gSrnm+c5mq1X8blbwFs4UxekUEH2ZoCxGa+Mo8D
	UmeNj96ZItsza/OiCGpSrih1ePeqzAIBGtMx0f5Sr6NFIg1lZCUUUasAxazFx8AhKjZ1Q==
X-Google-Smtp-Source: AGHT+IGOAIwAnDD8aAJQUYf4tbO6AXY39LZ9oVJ6TLerkWheSyXDTYeehoQjHC++cfBWbBWtF0hWGA==
X-Received: by 2002:a05:600c:3c92:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-4334f025a9emr55585e9.7.1732041930588;
        Tue, 19 Nov 2024 10:45:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2800absm204826515e9.25.2024.11.19.10.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 10:45:30 -0800 (PST)
Message-ID: <290bab51-26c7-4e78-8b21-ebba0cc196d2@linaro.org>
Date: Tue, 19 Nov 2024 19:45:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] firmware: qcom: scm: Fix missing read barrier in
 qcom_scm_get_tzmem_pool()
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha
 <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-2-7056127007a7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-2-7056127007a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2024 19:33, Krzysztof Kozlowski wrote:
> Commit 2e4955167ec5 ("firmware: qcom: scm: Fix __scm and waitq
> completion variable initialization") introduced a write barrier in probe
> function to store global '__scm' variable.  We all known barriers are
> paired (see memory-barriers.txt: "Note that write barriers should
> normally be paired with read or address-dependency barriers"), therefore
> accessing it from concurrent contexts requires read barrier.  Previous
> commit added such barrier in qcom_scm_is_available(), so let's use that
> directly.
> 
> Lack of this read barrier can result in fetching stale '__scm' variable
> value, NULL, and dereferencing it.
> 
> Fixes: ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer dereference")
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 246d672e8f7f0e2a326a03a5af40cd434a665e67..5d91b8e22844608f35432f1ba9c08d477d4ff762 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -217,7 +217,10 @@ static DEFINE_SPINLOCK(scm_query_lock);
>  
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
>  {
> -	return __scm ? __scm->mempool : NULL;
> +	if (!qcom_scm_is_available())
> +		return NULL;
> +
> +	return __scm->mempool;

I mentioned in commit msg that previous commit adds barrier in
qcom_scm_get_tzmem_pool(), so to be clear:
This depends on previous commit, because that barrier in
qcom_scm_is_available() solves the control dependency here, assuming the
minimal guarantee #1 ("On any given CPU, dependent memory accesses will
be issued in order, with respect to itself.")

If this is inlined by compiler it will be:

scm = READ_ONCE(__scm);
barrier()
if (scm)
	return scm->mempool;
else
	return NULL;

Which should be even safer than standard guarantee above (according to
my understanding).

Best regards,
Krzysztof

