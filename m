Return-Path: <linux-arm-msm+bounces-1578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993C7F50F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57FC0B20B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08D91CAB7;
	Wed, 22 Nov 2023 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tvaT9HmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9143B191
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:58:53 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso122762e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683132; x=1701287932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=owGEeKQSkUhkxsVwujRwMFyJouN+ra21rm+Zo53wjqY=;
        b=tvaT9HmKRdWu84mo5ZPHWsY8T9pmn1kNg0kicHvaDcySX/AY4EBXLHFBAPShQ2dKnH
         aWjjKBBhnY2SabxcgPt19YuIAE3vlIdYpRQtY7G4byKJxj0e7qVC4YVGyjyOiSZ0/zWb
         04yTfH/DkJEbargl75isHL5TOP+AJsas9MLcpQTwndFTFhEZfuqs4AEpFdThrx5l37eb
         Z6t9CQAreVFxVWYF7rHtlMHnHw6HRAKsVRnlvlUOrCbywTrglqpXob1kl9kAl8XgUpdl
         7CUer/lEy2akSBEj3B00r5gShYAUbezhLQJ41cDT7QHFVyWuDJoz1ngD6k0npX7whSRp
         voeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683132; x=1701287932;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owGEeKQSkUhkxsVwujRwMFyJouN+ra21rm+Zo53wjqY=;
        b=ElN01RN5hP5y17o7EZEWQEFI00kEtM5uY6mEAZjvJz8Jq0hBnpZib3Q7MJCWioEQa6
         yoi3gzRQ/gY9SVpPsrNM4rMJXjAQmTX5W/sctJkdW7z+Y5bsA9E97LW9zi4EwaNdAkrw
         416fU+JfHrQllJf+R6geQ9UXj6pVyFWVGVa6YjhlSaGUqhL4fquRcOzAsNRmLK7ou2qW
         b2/3X/rYsSS+dS1laqQlqosztqYp9mSWmoF+KpragBINpFfNN5s6R+q/Y3CFE4CrnL4k
         /AAcK3+i2Xz2Qi4XjBc19LeNWVqAF1Hfi4lFukCm0p102gWlMtfLOCtPkgv4iaISccjW
         KAlA==
X-Gm-Message-State: AOJu0YxG9Rao+SQ6nlp0wVN4GZ1NLhi2dfPcd7m7ZlqMtEd8nE1UOZuL
	q9LMUHG6aWD+XXi7XXAGDFwRCA==
X-Google-Smtp-Source: AGHT+IGYqOWN7ZE1DBlANCP1hywbHhcJvA+AMBnV5R5G1Kpc69S8u66ZkA3X4OqbdUjjha8Wo36dKg==
X-Received: by 2002:a05:6512:b86:b0:509:8fbf:7af0 with SMTP id b6-20020a0565120b8600b005098fbf7af0mr1044667lfv.69.1700683131795;
        Wed, 22 Nov 2023 11:58:51 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.11.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:58:51 -0800 (PST)
Message-ID: <b7b7db08-7294-4085-8249-e7b1741dd796@linaro.org>
Date: Wed, 22 Nov 2023 20:58:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: qcom: move sconfig in
 qcom_swrm_stream_alloc_ports() out of critical section
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
 <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/20/23 20:07, Krzysztof Kozlowski wrote:
> Setting members of local variable "sconfig" in
> qcom_swrm_stream_alloc_ports() does not depend on any earlier code in
> this function, so can be moved up before the critical section.  This
> makes the code a bit easier to follow because critical section is
> smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

