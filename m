Return-Path: <linux-arm-msm+bounces-41515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDE9ECF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52B6188802A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054711494CC;
	Wed, 11 Dec 2024 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTcLD1z/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357561D61A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733928852; cv=none; b=kle09LUsa0XcNqL4ZKBmxYXeV8/UYCiw8hT26bxFa779mkRQ1I2laN19ztwxCg+rye4KuSTOfP+fV+YS8MFYH+NbWZ3PuY8LJRZY2weOf9eDXmlBs/m/vfBwH31e5RoqClBVEow4NTqnhgfz/7Ao2FJq7+Qb6koAqDVbvBAnh3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733928852; c=relaxed/simple;
	bh=TA26KGjfUYtHcpviYZWDnnwFJwB1nA6T2oAA/scN6hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNsrRS5AkXHbcf3wzmVDUPRK3N9HImPyL+DMoELpf/yPYunja9HD1RyJYLz/Z9HSI7GMjpdhI5+lzI5+a2xh5fhm6n/BJZvHmgGGt1nfUvZ8kLIq3bTYUw+L5UQLLmsB1mYKTUe1iqflCvcU7eRlLqfhEn2nrr7hnnolgxfljsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTcLD1z/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa67af4dc60so618724666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733928849; x=1734533649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ktlO6czYcyYSCmYggj2K8QrV0XdcUJX5mHC3XGXDtU=;
        b=nTcLD1z/hx6Mz0dpJu78nxwyu9yUzZLsjYihxO0rpUMK8albX8aKyeh+/yHyxHGeAH
         EknDZiMcTt/XD0iR/35YWwntvbRDxMM0veWkpw2yj6g2G0Omr83w14ktMuN6Kx/rimRP
         0dqNXx32rCFLwuX2pH9dxIzpl8ovmFikn/WncVpVReWp6J2SdBaFQh/CZJoCZhaBvMYL
         WnwBHPF/TvtLEHJBomfGcDMXmH0EEGcYiMmrfNnMDsCFqLkYlBtXnCMGHlQIu+7LbKwY
         HkxM7W2yOQtCP6OMQhFN2SzXpkUuuzIhQniLB9Wp44Ecl5Ef1avkf1MUb/+H0+7U/uj1
         GnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928849; x=1734533649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ktlO6czYcyYSCmYggj2K8QrV0XdcUJX5mHC3XGXDtU=;
        b=QWj2gEulJci+jcKGBo9CcuOM0DPUrPPlwlkbLGAuOzTqpzK0c05mzM9vaMGEbf34S4
         XMEOK9n2uTVdivKl0x+vSlq/U5TaaoaKAODyrOSUPPN9RuczsRxmmWI4QZefb07ts0BG
         Cx76ZABDuR3k2gtj3Ct7Ix4h6hBHGOA6Ci0zlEuzt0U1QVe6nYW8ZLYl0GsyxMym9VJR
         59f4UEmPqcSCbt1U6E6QPL3XmNTH30sMU6RBaB2JDE4xIFT1BZYjQLEacIqyAJW/Xhve
         TTvDbg765HI4a7ugN91hcdQsFb3PjyOpTxlQun6k37rVNywgbyrkXHTeF2Hbp/WVIhm+
         vtDA==
X-Gm-Message-State: AOJu0YyJB4rIfmIu8Wuh2Hr40b8Je/jrXxNKiekZNbsrg1PK1tbEr9Ij
	ZnaLYLh8+xD8tzig0YX85j0C5vW4gL3lpdYKfd+Fa1Hsq6aJV/sPAbHUrvHT8cY=
X-Gm-Gg: ASbGnctdCZxakU4Z093PDVULpJWUeHCCtwBoZpkHFfh+IQ9BwaummOr9OHo7LmOXlZC
	rS2GFAnTSQY5hpGhbrYxckXaD9lQBGUZ3I14rWZYj6jdgoCtWIEi1GX88hlwJB232W5rKZO/Yc2
	PCaAzh0FSui09LRx6CINqmxBVNnjBzAFeqAO9MeFUNfjmnap0Cd/PV8liYAuGjOW+rqGdvkzDKy
	O4ChaebbzivC/5PrjYmWzjxHfP1Zghp79nCDHOwyuM3SYUMAy67ruPPkCUHQjm7MsI=
X-Google-Smtp-Source: AGHT+IExrTQgcrzFJ0AioGe6gUTXc8SXmmdedfxuT1544kYxd1QbVPq7wj4wcyNV0DI4WQLs6/DGMw==
X-Received: by 2002:a17:907:82a7:b0:aa6:9ee2:f4c9 with SMTP id a640c23a62f3a-aa6c1ae752bmr8454466b.23.1733928849467;
        Wed, 11 Dec 2024 06:54:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68770c4a4sm473262766b.163.2024.12.11.06.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 06:54:09 -0800 (PST)
Message-ID: <beaf4e8a-51a5-431e-8538-269d2db94f15@linaro.org>
Date: Wed, 11 Dec 2024 14:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
 <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/2024 13:36, Vladimir Zapolskiy wrote:
>> +    struct dev_pm_domain_attach_data pd_data = {
>> +        .pd_names = 0,
>> +        .num_pd_names = 0,
>> +    };
> 
> Please remove the added local variable.
> 
>>       cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>>       if (!cc)
>>           return -ENOMEM;
>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> 
> Please simplify it to
> 
>      ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

My apologies, I cherry-picked the wrong version of this patch from my 
working tree to my b4/send tree.

---
bod

