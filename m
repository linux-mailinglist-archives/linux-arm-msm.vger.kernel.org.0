Return-Path: <linux-arm-msm+bounces-17295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D88A20FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFAF0B2103D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF9B3A8FF;
	Thu, 11 Apr 2024 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cV6397BP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10C2E3EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712871350; cv=none; b=OB8XG/7cZRqKtW+r7eNlf3Yh+znyvJ9OWQVan3XLJEYz73jiAIx/DBChSgcVKfB6i6s0VzsKSapwPMCSiIuiSaOtRfKG1tkW8xbszfQCb8/mgH47CNFT3bAMWsH51emP7WFJjMUbMQ9DcUXmdajX2PEmY3JSkKri14hWgrJ8Z7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712871350; c=relaxed/simple;
	bh=v3LeDlsw4fd8KemXMGl/9RHF7axUWT3DS7QRxveZaQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcJ53dL9xPkqUgUqTbcU6c96J/KC4J4slQqQZGZgpY9dc1AcK1FJ/1+AkaKJAr6oMVQl/vYwjSKkD9BEoWgtee1p+RoLtlOxlZvrfo9NA4W31UVQKlZFC801WbvB/mpBM1cD7eofQngY2JN3TfoSTkCBoa1J8LQLP9VfeyTIC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cV6397BP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d2600569so392560e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712871346; x=1713476146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5T4iIVALzwPejh7d3S8enGWCx89OQW+dXm19IHXNjAc=;
        b=cV6397BPh82Y+brjJR0wOpAYAyFVGPZJKbyxp/UXiggum72apciI+zRZajujY5QRV7
         OgT7V5dXxibyUhBM06MxxDf4d8n6S3aHxYzHWODlO+hICIWIOTftZvd3abJHFLFbD8+o
         YbfQgT1sxvoF5wla/GuU1OUbY9KUk9G7WBzYYwvTKBRNw1txRZtzZRpsFiMApAHmDxdo
         NGmQaB2m3II1FqFCOtLMKic6lZnIVW+a5xhaSzkATdIcrmugn/AkzCN6NJtI4ABPqVmq
         TlIKYLQC2Zf6RIyVU4yyuNRQjrxHvoYghs8PuowTxs6wFZC13FPF8VXTSf3PuIrsJHSH
         Qxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871346; x=1713476146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T4iIVALzwPejh7d3S8enGWCx89OQW+dXm19IHXNjAc=;
        b=C8gy/eTNog/UOAEPYWbVR7Yb1IZU9TKBwGdMA7zjC1yjU6pb3BjcP+IKxNN5dIfEhV
         hk83a1NaA8zGjTnY5RZmQh/HM4h/s/CuHmmmlBmSM2RhnRgxUexeD/hLJQFWqFMd9/WJ
         /pw7QXDzPIJK6TKOlrB2CnoPdAGjzviem191oTG1Zk5tYUWlIqonenMViE22aq2x0riz
         s8oE8Ge7RiYIlcy/OBbVZQTfFGRbKuKXoiGMmb5RKfPA625pvmD1WpdSwawilvWmphEV
         M1QHrjeHoODms71/wFFaX4j7mWJcfZmj8UEK4ID3WHYc3W9Sk1E11Hl3AXb7eU8rGIuW
         9mMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX25NiminE6zXOrgzXrTzck6RqkYAh259gFLtWnBoaP3LsCL9yUwsu8cxmADjtbYmDSAxJLOkSQP0T+Lz0oTDPnfp76ZpEsFmHb5q0zJQ==
X-Gm-Message-State: AOJu0YysiN7DwIuuLn2z8dBEM1eABBsp9meBrf1z4TB1pvuKfGPL9ogu
	5HkvXVeXqk+dUaUpHLzxgALflmQUbCmes3IhONvcdA0sn1I7bUYE4veXNSISLZM=
X-Google-Smtp-Source: AGHT+IHhPtTM6MDSSMKdH0nmnBGG027XDSi/RtJTrsfiuHSI3CqYwZHdp/t6eiZd5QJ+PqzWtrodtQ==
X-Received: by 2002:a2e:8084:0:b0:2d8:5af3:bb43 with SMTP id i4-20020a2e8084000000b002d85af3bb43mr511195ljg.41.1712871345700;
        Thu, 11 Apr 2024 14:35:45 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z4-20020a2e8e84000000b002d8e42c1b5fsm314682ljk.42.2024.04.11.14.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 14:35:45 -0700 (PDT)
Message-ID: <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
Date: Thu, 11 Apr 2024 23:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
 <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 21:26, Dmitry Baryshkov wrote:
> On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/6/24 05:23, Dmitry Baryshkov wrote:
>>> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
>>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>>
>>>> Add support for SMEM-based speed binning, which includes getting
>>>> "feature code" and "product code" from said source and parsing them
>>>> to form something that lets us match OPPs against.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>
>> [...]
>>
>>>
>>>> +	}
>>>> +
>>>> +	ret = qcom_smem_get_product_code(&pcode);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Couldn't get product code from SMEM!\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/* Don't consider fcode for external feature codes */
>>>> +	if (fcode <= SOCINFO_FC_EXT_RESERVE)
>>>> +		fcode = SOCINFO_FC_UNKNOWN;
>>>> +
>>>> +	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
>>>> +		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
>>>
>>> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
>>> details there? It almost feels that handling raw PCODE / FCODE here is
>>> too low-level and a subject to change depending on the socinfo format.
>>
>> No, the FCODE & PCODE can be interpreted differently across consumers.
> 
> That's why I wrote about asking for 'gpu_bin'.

I'd rather keep the magic GPU LUTs inside the adreno driver, especially
since not all Snapdragons feature Adreno, but all Adrenos are on
Snapdragons (modulo a2xx but I refuse to make design decisions treating
these equally to e.g. a6xx)

> 
>>
>>>
>>>> +
>>>> +	return ret;
>>>>    }
>>>>    int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>    			devm_pm_opp_set_clkname(dev, "core");
>>>>    	}
>>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>>    		speedbin = 0xffff;
>>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>>
>>> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
>>> case. WDYT?
>>
>> Ok, I can keep it, though realistically if this ever does anything
>> useful, it likely means the dt is wrong
> 
> Yes, but if DT is wrong, we should probably fail in a sensible way. I
> just wanted to point out that previously we had this &0xffff, while your
> patch silently removes it.

Right, but I don't believe it actually matters.. If that AND ever did
anything, this was a silent failure with garbage data passed in anyway.

If you really insist, I can remove it separately.

Konrad

