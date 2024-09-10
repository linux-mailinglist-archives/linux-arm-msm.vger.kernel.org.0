Return-Path: <linux-arm-msm+bounces-31384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E089729C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 08:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1DBE285360
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 06:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A601737143;
	Tue, 10 Sep 2024 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7Lw8K/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357081B85FC;
	Tue, 10 Sep 2024 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950748; cv=none; b=kzLNlLik/SoLJIPZPGGo2F+Ybkkh2+ijlwCO0WKNlfmFwwuwaVCGQlYpE/FI6g14n1fK39JV0tSAnB62Hn1iMFz1uv8/E4//dKpN2TqFssb/PXGcT4ldrbeXEaYZifnFsTAu8FhCixt6Qn9LJRVaJ3RVL+FG3cTFogXLL4Y7R2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950748; c=relaxed/simple;
	bh=3y6PFLxQCiMh8y5Rd/T3LR9oGtnGRH/rs4QNzBUtlHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHLqy+pNg402sZWLYn5WBGx6UuiJ1om0CD8SbtduwswtIA+2qe+djQQA1CGrbBNzzWSLMVohixKb+KQblWQsNh2gVOHgva4KTeeznpbdenXEcF8mybkYh18/gGwgH6sSl5iNK5TbRfbFrTPbxJBTFym120OfP2meizgNrwixV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7Lw8K/4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2053616fa36so4810695ad.0;
        Mon, 09 Sep 2024 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725950746; x=1726555546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3m4F4dxC1HJvN3/9jEjH9B7BekK3OOSMWjP7By/DQCM=;
        b=L7Lw8K/40SrCa8E7dc4TqhE/KhMPPsn9ER33LcC/4Z0/Qxm8XDCJLcbL4TqmERVgs2
         0Npl5NPXit4WzYje3FmMzBOUqb/fMFQdxQYoZ2qxMo8fcN+yx4f91JWCSMhK88ORe8EU
         BDn8YZIgTqDlYCyr+kXUJqkff4I89CNfBRdKIvuEoY9e30A2Lzej7gK+0X/PjtkWXMBM
         /9N39xhDOlSwjqink5/478OZ3jwwPj8bX3gBBf1KeRNRf/jkakYtRicAgmWbzQ5pS1LB
         vrWpV36VpRjp5KkfawHVfmIEd7jW1KtPIDc5JcPZ9/+XYFDLLOXixSsCwcgK4e1CC2y8
         +EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725950746; x=1726555546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3m4F4dxC1HJvN3/9jEjH9B7BekK3OOSMWjP7By/DQCM=;
        b=tQH9dDQ3HK8CXGazDdJC4tXcM/kAaKFi3WHum1VgRTPrG/aZZN8Ibo9Rhewh84NdRR
         z4moO3Sbl4RJtMPQn/TcoUTSThAPoTnPThu48Kb9ggfHRhhHRph5oXUL7YAOXkQaGCQV
         ohCWXbeGrTxoiWZPSksOnYHDQl64zqV+nTnkioalebGoL6AU5Dn94iLIVJLXq5Pg4HVq
         +LyXnhxdo9bO/AylcCAVrJ6kC19o9RPuI5M50fyUgn25a0BnCAMwNGZJyxrximcfn3FP
         P+0RYTYd68KWhTFmHa4+Mi6aCOXe69EDMGjxoeI3vH4Bk04CTfvUHxWEpHsHze++2dln
         TGFg==
X-Forwarded-Encrypted: i=1; AJvYcCXGWqD0ZKuVCtXcwvJ1EF8mbLRnugM1bdMjD4GizWPk+qu6cj0VM4VP/aL6o4I66JdfR55mtezqECAZ1so=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhjVsbzDOJfxI7OoHmggwJHgxt8TYCdnXRaOiEA67wEzXopQg
	TLMnMpJEmRIrIibf8eWp/avGrjM34gIE9bEYAoFuEXIC2N0vpdWY
X-Google-Smtp-Source: AGHT+IExFNCAJz2GjXDBGK7MOe0SAcUbYIWIMdwuLceG6XPIq2/hYewNjQD8UNzuvll2X89hRhmCJg==
X-Received: by 2002:a17:902:d2c1:b0:202:35e0:deab with SMTP id d9443c01a7336-2070a553dbcmr104430295ad.32.1725950746249;
        Mon, 09 Sep 2024 23:45:46 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1c5easm42637245ad.182.2024.09.09.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 23:45:45 -0700 (PDT)
Message-ID: <3ef933cf-af58-4d0e-8e81-69ec5d0bd65a@gmail.com>
Date: Mon, 9 Sep 2024 23:45:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: fix a NULL-pointer dereference
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-1-96526c421bac@linaro.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20240909-tzmem-null-ptr-v1-1-96526c421bac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/24 11:38, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
>
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..8bac4915c211 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -216,7 +216,7 @@ static DEFINE_SPINLOCK(scm_query_lock);
>   
>   struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
>   {
> -	return __scm->mempool;
> +	return __scm ? __scm->mempool : NULL;
>   }
>   
>   static enum qcom_scm_convention __get_convention(void)


Tested-by: Rudraksha Gupta <guptarud@gmail.com>


