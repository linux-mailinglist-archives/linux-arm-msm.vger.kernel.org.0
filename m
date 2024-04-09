Return-Path: <linux-arm-msm+bounces-16955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825BF89E24E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2EE21C22A18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159E1156996;
	Tue,  9 Apr 2024 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQpVK86p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED16156986
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686400; cv=none; b=MAF1f5FUkvAXavUIpJ5Aslk+5LJJ78daZ/cM+vMc5EzslTA8Nivgbapvnf4P+0a5KdY1Q2nUKY9TwDKyJUrWMjrYfz5KZFSCmK6v3yJYdqa90uqdN1Z6ltQyHoVw2wLtqRaPLhcBxDtV9yPdCVPsx1kHFNp+BKM3SyfvVUEhP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686400; c=relaxed/simple;
	bh=uLNeg1qHDIQyx4DVMEosgXpludE+lVP3yhaBpeYJCHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+eJKJx2n+UncFrS4TpZhZZe/qmmNA2+JGciqrbItXz/TuGWDZTbKN+xE7vb82l5H07FpIMrG+Y0DFfRYF2G6NeCj+apsoj1fBCvKDNbc7Hawx24zuDYPVWj30KvbQBc4vdt/n46Xl64JQsOziFB7ZUu//B6AyKtlGjPvTQhhcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQpVK86p; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso74893701fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712686396; x=1713291196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVvL2F1G6X1zePnKsaGHFi1ccfudklq9eqO3sqLfMAg=;
        b=pQpVK86pEd72nTJgHeERw/U99JtL+PyvlMEZOly41ki8pL1ntemFwcuP1glvkaIGK0
         zsDEE3OgMNf7DtPDXAnkg9va+umiKFjOKRDK8qkSCuFLhg31sxBQ+aIQoR4hRTzrIke7
         6uEf9/dyfrWjamM+DXDAXDp6jm3M3hIh5aUjCJcFbxLK23688Vwza2arS7P22d262GnR
         SlB81KrQhHXU/uK2HdjzgWDviAXvai3/WdbXcnTW4deQlS957sN6+LbRYJ56WkrQNjqN
         KzAm03a1vSYtoZ23Va+vtUEADUWUncC2t0e0V/LTGn6ijyIaAy6qTPObMtchxrvY4Nox
         4iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686396; x=1713291196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVvL2F1G6X1zePnKsaGHFi1ccfudklq9eqO3sqLfMAg=;
        b=KNIlPZelQOxncTi6xPe0XI+Z4ZrjurEdrcbiqoI885dhd2mFcT4fWfbTSedW0UOS2l
         Jsi3fDfmsKAEyG2hOgW6K9eq/HO9j+7IFZfQeO5KoZa2f/9VsSDIb8NEcgUKGngxFdNr
         pCN3voge1F8VIcPWDTvaWOy/IPDNVjzlBJHKz6uGK0St6bwyP70sIo2P9QRYZdER6One
         2p9RmjTLuRaXRk1mPh9gEBohpErWBgIzXfSfRYLFg5yw1fQOijiiZdRk69H/EcDS0Om6
         mneRT+8FuYMkYI3y+WIR7wVtlPN79jAaWq+sTbamKN/PtGSx7RMdB0KZNIZbOSfV6wsY
         3O4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHC8/C5st1k1yrBconYguAwbNY9Mpm+1zpdoE6NPLF6PLpAd1CmAPkCDq19Uuu7z4AnHq+09KcvR1B95CjKAzRu1bDm2Y14DVWn5KsuA==
X-Gm-Message-State: AOJu0YyNCq9yqacmqsaqYH1yOn12Sm0/oiz0U8I8QWz2Sc4+rDJflrts
	Tw/ndXXBKeo2dtm1Hdw5CgV1e0vcdyQLbG9zmH3FgVDsGSPV8LotTZI1YJtvE9o=
X-Google-Smtp-Source: AGHT+IE9IkoN4MIEa62W5SDOs6R2IZNM/Lb7/qVpQfgom65bemgoHxP7/c5kJNTK3D/ZbevsozDIkg==
X-Received: by 2002:a2e:6e06:0:b0:2d8:63a2:50dc with SMTP id j6-20020a2e6e06000000b002d863a250dcmr374922ljc.48.1712686396194;
        Tue, 09 Apr 2024 11:13:16 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z25-20020a2e9b99000000b002d869fec5ebsm1535892lji.79.2024.04.09.11.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 11:13:15 -0700 (PDT)
Message-ID: <fbfc2d7e-2120-428f-bb1f-60aa606b261b@linaro.org>
Date: Tue, 9 Apr 2024 20:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
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
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
 <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
 <4ghhtxjtkfjzxeyrajn26get4d6xiq57swwsjmyialcyfivui6@se3ukxxukspt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4ghhtxjtkfjzxeyrajn26get4d6xiq57swwsjmyialcyfivui6@se3ukxxukspt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/9/24 17:24, Dmitry Baryshkov wrote:
> On Tue, Apr 09, 2024 at 05:13:15PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/6/24 05:25, Dmitry Baryshkov wrote:
>>> On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> index 901ef767e491..c976a485aef2 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>>>>    		.zapfw = "a740_zap.mdt",
>>>>    		.hwcg = a740_hwcg,
>>>>    		.address_space_size = SZ_16G,
>>>> +		.speedbins = ADRENO_SPEEDBINS(
>>>
>>> I think this deserves either a comment or some info in the commit
>>> message.
>>
>> "this" = ?
> 
> I see two types of speedbins here, it would be nice to understand at
> least some reason or some defailts for that (if you know them).

"one is slightly faster"

sorry, qcom downstream has been getting increasingly cryptic lately..

Konrad

