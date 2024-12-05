Return-Path: <linux-arm-msm+bounces-40504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A19E5580
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 742BE282452
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C3F218836;
	Thu,  5 Dec 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AstnWdgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AF3218828
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733401711; cv=none; b=a5jU3KDX5F8rxmRz4ltOMEqAHexajyxf7/J5OQuNm27K461r8WYHLAtTZOTfQdksc3NC7tfuGI7VsbY4+3StaVKYtkku4EUFHOE4KScg5Kl2ahVFkdk/iqVFU8NJj1mO/McQOFKkJTzPAYGidcOYAjsYt765LeOcn8qdF+52T+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733401711; c=relaxed/simple;
	bh=18bpV5A/4haIrWRQJEDM74qxWf1ybq3kSy/rlI4CMR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjFC35AMl6suNyf1gq83Fn+KmgJwJW0rP8FQ/Ws5/vjObsXeeO61ymNfjTCrpDJ6AZUlHIXdGVtg9Dtrmljm9wm8x0hsAFL/OF8ovDZDa7Fm9eGUv3Z2J/0VJr8n/GC2j1D+AApa4jbz93t6CrVOVBZJOYeRlwstI889Oz3jmnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AstnWdgY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a2033562so8662215e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 04:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733401708; x=1734006508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/z0Y/or6wVIG3eV60xxWRF95SZcxwisFQI5iGbciCs=;
        b=AstnWdgYcF9rIfZ3krtwW4N0xjeEtGWuj0/s1/pcO4jloTNUI9BNPUo1MsaDCkRDFZ
         x+kofT7OIEWH6OE4wtjfPDdwy6vaW1ahRVdpyITI0DDMFm3BUmUys67l0B1piUismqBD
         RAJ1+uh56N+YE6+NdIftuokYVEg8qK9sBGTTfaNcwjBaJ5QBs4iJGKuMLB91fiw+LJI7
         o2PM4LWC4NB1XUrFEvcUX3JpeOVh8+se3FG+bHc1XYonNTfKOSnVPbbmwfWTRnzzZu/q
         OaYZOhmv9xrauN8o+6gRNJCxhNMQgJqHVejoGJp5Sgq1ZnksEA/AiMJ4QHdY6YaaQwQz
         pPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401708; x=1734006508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/z0Y/or6wVIG3eV60xxWRF95SZcxwisFQI5iGbciCs=;
        b=axT16oKM10MKUQ7yr3egjr4CiIlnY1C++dxPqBSrJrbQk90y0AKMihbRmbn66uhrr+
         sw76BuZNHApp2uWWn28N6nMW2w2arcxPd3cre4LWPYOZSOBktZBTZSGoRVgZ4yRZSTPS
         6xdtvQWRCoaouNkVSBhL5aQi1Y/NfagJ+72ElR4okkMP/CCuPS7PGxMbVdZytn+STRJv
         9BWvGt3quu77wQI3EPjY4DSVqK1gdcSADveS4YYhff8twU2RzYZsJGQcMoW7YRqw58aE
         FUWpie8JNNLVkRgHEa6Zaij7Qny/EX35gobK85a3oIu51oooAxISgzm5ubYxcI/squ5R
         KiKA==
X-Forwarded-Encrypted: i=1; AJvYcCUT1jBLzxLGTE2tA+7umeUrV+InodmA9DQThb24gxrUvo+co1/CNkeIUDEc44TdJOMEICLQPUyHGt3Mg910@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3dcMjuxPvXWrtRsr8L2rlvhPS40mjXeWwx20i+VJRbvcbnkz
	292x6fyuQT2xOKonIRi1Ry2FpvBgH4fs+2vm9S7QAlUOBifVr8fYCYNFZrDA+Qs=
X-Gm-Gg: ASbGnctQatfFZ8nGlBb9Du5gvwiUeh1cMjw8umtLVTBNfTZCk5o6nRrmJYp6F7GGFM7
	2y8BTEkGDP9gn9w51pbG6MyHHZCpgtxnFY9RnnjlkzHNyI50L7Azx1p7J1C+8MvI5A/8b+KMFms
	fbC+u4+EDTP7t2jBdS2FgSAtb0chQmtKIG2nQdIEv0oqq0fMMx5/Icbp333gMUmRgqFqwzojyza
	F6A0SL7Yi4yaGg4MzI8b/+G/qP75SSTYfNJtC6rcWtyd/Pnh0vLDM12WsZFciI=
X-Google-Smtp-Source: AGHT+IFhSy7QZi+I3R64sZovAcTtAbg/HjBABy5kQ0+6tHCowzlGyLUtEVz4AzlfM38dgl84SsqQ3A==
X-Received: by 2002:a05:600c:4f12:b0:434:a962:2a8c with SMTP id 5b1f17b1804b1-434d0a03abfmr84962955e9.22.1733401708213;
        Thu, 05 Dec 2024 04:28:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d2698sm22267365e9.8.2024.12.05.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 04:28:27 -0800 (PST)
Message-ID: <2afca6ca-10eb-43b3-8730-386d6ca84b60@linaro.org>
Date: Thu, 5 Dec 2024 12:28:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: bam_dma: Avoid writing unavailable
 register
To: Md Sadre Alam <quic_mdalam@quicinc.com>, vkoul@kernel.org,
 martin.petersen@oracle.com, kees@kernel.org, av2082000@gmail.com,
 fenghua.yu@intel.com, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241205120016.948960-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205120016.948960-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 12:00, Md Sadre Alam wrote:

The commit log:

> Avoid writing unavailable register in BAM-Lite mode.
> BAM_DESC_CNT_TRSHLD register is unavailable in BAM-Lite
> mode. Its only available in BAM-NDP mode. So avoid writing

and the action taken in the code:

> +	if (bdev->bam_revision >= BAM_LITE && bdev->bam_revision < BAM_NDP)
> +		writel_relaxed(DEFAULT_CNT_THRSHLD,

Really don't match up. You've said in your commit log 
BAM_DESC_CNT_TRSHLD is unavailable to the LITE module but, then you say 
if (bam_revision >= BAM_LITE...)

How can checking if the revision == BAM_LITE match up with the stated 
objective in your commit log => _not_ writing to DEFAULT_CNT_THRSHLD in 
lite mode ... ?

---
bod

