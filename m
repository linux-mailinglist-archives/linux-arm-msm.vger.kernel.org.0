Return-Path: <linux-arm-msm+bounces-1577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB97F50F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1A81C20A47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353C81CAB7;
	Wed, 22 Nov 2023 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSYrgAoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539C81AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:57:15 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507b9408c61so137633e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683033; x=1701287833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3eKzYiaUPur0IhJyaSZpFt+RCAlVJJsNbMkeIZr53A=;
        b=oSYrgAoAD7E7HWiDD3/6emjf+SZ6wssePKx0/pvPXKq/HThtopipCHnnWQaiDCbDKb
         d+miICMqkxzC52iUdr9YrgjPGEkjlnJ2lFSU0YxiQXAfvxUnlDQ3MJl7dqIfoEi81NB1
         SKEkFFHX+DEcINvqozesRHYTE0AWjReXNZDeXklvskm679DsiDCHqh9KMKWhKgu8RSuG
         qahLfB6ASZD5XqoAQBRpUAO8O4dNhGQ1xfU53EcK3mDmkWND6i78a+ROqlFflWd4iDHY
         Ld0EZEWoSkDGVcE7cnLCpNA+Lw5r0ePnx6Wd4US3y15TZdbzOzm4PaP1Y6GQLsrrDXgq
         jOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683033; x=1701287833;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3eKzYiaUPur0IhJyaSZpFt+RCAlVJJsNbMkeIZr53A=;
        b=HYd8RVShdnyQX6XRsaiRMXosTefVd8J2ePQiDrsLNQBiKCUuo7lDjXxMQIOefQ4e6B
         RNnVTUCGHY2M0wZPgHb7v6J/h5tukW57v4H6/b8lqmQmS59PReUYI2OwFg1wsVstHvmK
         6FJpswG0lXU3bCebW/hUzMBxG4o5nJCWuUKqKkdo+CEmqVRwOZX6kepOo4Q2eyrxmY0T
         t3FLfTJ5EC0lMeuG6A724iptaahr8vfy8+s+HyGNzFbjahHh2GM5bbJTRkkqavZkqFsg
         TZi4Nj4FugG47nHjQp9+9K7y17BQw2ba9chh7Kn85IeQyg/nRwCBiWUG0jrmPhN1tanV
         JLMg==
X-Gm-Message-State: AOJu0YwWZ92Mpoe2EyV8Mj66s1JPAqIZctWkW8gWE8b3brWimNVUpzEL
	a+wf9UtvlJm0UNSg5HBhV5I/tQ==
X-Google-Smtp-Source: AGHT+IFXLsNjyGl1aWYWlgDu4MftGSAqzRIBwU82aj9LRkzZJs8EcwuYv+qq3oVWL6RWFELs3lHO0Q==
X-Received: by 2002:a05:6512:3254:b0:50a:a571:88 with SMTP id c20-20020a056512325400b0050aa5710088mr2424023lfr.61.1700683033496;
        Wed, 22 Nov 2023 11:57:13 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.11.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:57:13 -0800 (PST)
Message-ID: <4fe84f86-b7e8-4f71-8a01-dabb835959c3@linaro.org>
Date: Wed, 22 Nov 2023 20:57:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soundwire: qcom: drop unneeded
 qcom_swrm_stream_alloc_ports() cleanup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/20/23 20:07, Krzysztof Kozlowski wrote:
> The cleanup in "err" goto label clears bits from pconfig array which is
> a local variable.  This does not have any effect outside of this
> function, so drop this useless code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

