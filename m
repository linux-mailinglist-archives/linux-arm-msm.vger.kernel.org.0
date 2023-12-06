Return-Path: <linux-arm-msm+bounces-3542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8C5806F90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC879B20D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB2C364B9;
	Wed,  6 Dec 2023 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PF1ziB2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD2E112
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:20:01 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso34105461fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865200; x=1702470000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+i4Ygk68LEIXvF8ovwCDnUeBvBPCrOF9ltM3kyzBELs=;
        b=PF1ziB2SIg4qc/OE5MV0auQAj/lWiY3/ZBafxRKxFSVH/WUD9JzLLdMy8jDb9/DnMB
         5MADX6vbvWyhfx1It6PvZJe+qhOp4apenPvNou5cm1WnhCHAgz8GptVOxlPD85FK1n+K
         ptDipsmIuNCrM8f1BH0wh7XiMM1VlkdkAsw5jVfcMmP0akwDye0CXlcfZdhbA1bkxHFK
         /bcRZuB+/9UtwphSDtzxTGd/mvkrgilmrBmwe76Rk7u0bKT7TP2Q8USQzz/eh1S6+m2L
         nYlsfnBnfTyBRQA3MWRH1i1pfXJNmILB3LZ3yxq21FZcQdMT6i8VAA/Oa4fdnh1/xa9M
         ezWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865200; x=1702470000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+i4Ygk68LEIXvF8ovwCDnUeBvBPCrOF9ltM3kyzBELs=;
        b=SjBI4dyg2hZJMdv9kxMFqZ61lVeHLERIgi7zBmqJKhk1MrDDN9lma26AmvjLS5t4h8
         WbXDv5prxmPyzbgkpXM+v68P14gVcnmGSmzsYrwEg2i1lNDZmFwLJguYJilYUr7yA+DD
         V5Gwu1hnFPqYmdZeEhkFWGwS3YtYdML76dYQFCBMdeD6q9XPwv1coLQhD3coKP8iaFjI
         BeSdjxaNByw2taDKcwX3JyLNpPogu3xiGYmznPgTu/z1LuTOpePmiZFiJJoJny6D1VnU
         e87Fu6vM6jVUQlWz6X/WpmxFSPIUXl044SJRVQZAyTobVefmb/DwHSVaB7Ti/ZRta7Vk
         a2CA==
X-Gm-Message-State: AOJu0Yy4Hzslmo/uja4G0bOGmi+14hEwjJBNld6tBNBVeAuD7PBVVYZX
	SOBVetmjjDcSW6B/iRNMYVCgIA==
X-Google-Smtp-Source: AGHT+IGDUAakGvSrTeFgi2nx9gIOE1y209ymR5Qb+p1nSlHQs/zqcKybiK8Xz1Q0AbYMBjC+NnL+xQ==
X-Received: by 2002:a2e:3514:0:b0:2ca:18de:5c63 with SMTP id z20-20020a2e3514000000b002ca18de5c63mr553729ljz.72.1701865199839;
        Wed, 06 Dec 2023 04:19:59 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z23-20020a05651c023700b002c9f8d8e5f4sm1209955ljn.41.2023.12.06.04.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:19:59 -0800 (PST)
Message-ID: <81b4f158-41e7-43b6-a762-1a05a0994d6e@linaro.org>
Date: Wed, 6 Dec 2023 13:19:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] interconnect: qcom: icc-rpm: Fix peak rate
 calculation
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20231205-qcom_icc_calc_rate-typo-v1-1-9d4378dcf53e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205-qcom_icc_calc_rate-typo-v1-1-9d4378dcf53e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/5/23 23:14, Bjorn Andersson wrote:
> Per the commit message of commit 'dd014803f260 ("interconnect: qcom:
> icc-rpm: Add AB/IB calculations coefficients")', the peak rate should be
> 100/ib_percent. But, in what looks like a typical typo, the numerator
> value is discarded in the calculation.
> 
> Update the implementation to match the described intention.
> 
> Fixes: dd014803f260 ("interconnect: qcom: icc-rpm: Add AB/IB calculations coefficients")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Spotted while reading the code, patch is untested.
> ---
>   drivers/interconnect/qcom/icc-rpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index fb54e78f8fd7..a8ed435f696c 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -307,7 +307,7 @@ static u64 qcom_icc_calc_rate(struct qcom_icc_provider *qp, struct qcom_icc_node
>   
>   	if (qn->ib_coeff) {
>   		agg_peak_rate = qn->max_peak[ctx] * 100;
> -		agg_peak_rate = div_u64(qn->max_peak[ctx], qn->ib_coeff);
> +		agg_peak_rate = div_u64(agg_peak_rate, qn->ib_coeff);
Oh fun.. I'dve assumed the compiler is smart enough to catch this

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

