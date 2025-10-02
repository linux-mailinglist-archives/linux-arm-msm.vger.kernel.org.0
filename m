Return-Path: <linux-arm-msm+bounces-75821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C8BB4446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 17:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD69C1888E59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 15:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0854378F2B;
	Thu,  2 Oct 2025 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8RbWs7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EFE555
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417662; cv=none; b=U7lt24T+XsJlCFz2VTQoAbKKiFOCok3bnIxHIz1eq+bCB8jVHi/rpLWSwx0NtoNxuP3hBobgrkjAFocV2OOyZkXrrWfG6xCqnf1awgYGzJ0t/XFGGcthtxc//dTRcyTLgRosun7SdHmQfZJShqOyHvmpUe4bkCporxKZmMj8BNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417662; c=relaxed/simple;
	bh=syDziuqQRnZmZdyErzTSiDyfSgfFl/Ol2bR4kWM8Dh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAAvJ3QMN+uaDPjveMXl6nz/3rL2ad41KLW/X01cZOBM1uzkUhYN1f6OZP42UO3sLDKOAp+kXs3PtXdgUvbMDjt+BwOSRvvuacPlPmdX7YA/Xgasgbw09n3bCFPSwiUAHq4paLGWwKaSVJPwZG51S2k8s993EA/CnAWa/ughk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8RbWs7N; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4060b4b1200so1001963f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759417659; x=1760022459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=e8RbWs7Nrv4XvsaklHsoCMQPCqJmy2L6FiFOL2fdsmFhJ5DwGyX02j74ihSi542GQl
         vIwcAZfw3oQ7APK4425UzxoSSBfbwdIq8m9+x4qs2jhAWhd3dxh9kSe7XCKIjQ9inwca
         vH/Ph3uzhXr42Bgk0MHPz76rplHpO73QOK3WzowoPY36ZsbpmxHtKPyi2gejgVGEuD19
         1ndAiLfP3545OK4b2lZQqFp9QLkVOxPzuSkgZ3h8rTPI2AGY2kC4IGVqtR4RSUv+51Ao
         xKOmrKYX6qtoC92NFR18VBv1OrRojLOg8qEf//j4NxDjuS0iEoYFF6A4oHTFWrFdJ96d
         aCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417659; x=1760022459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=vgO1s8po9yxxA2wFPhx/b5mn9ap1kMEFfbtSTtbkPsJUihviVKPjLv/koPAdj56slq
         n/LuJymmHAW6/ilsak5xWkLzZm9qHJad+GYNtjhJJGxIAf5yaFAQvmm9/O6AUumVVYbM
         XZkNjHD3XQQIIDfoRuHjDBKeGGxKxd8yJny9BjZNE0eWn19vll3PxXVdHhaC7vdOBYgE
         GFIU4Q2XrmqLNkNBYyfrsqIoJ+Gox+KjgFX/M5pWsplcP4F9tE35b2d13rr1yKamaWXG
         AHIx1Pk9A+QaMdXh7fkyl+ckTUfm9f14wvbacgvfmkTG3RfUr9Hc4MXgq+dz28VFWvxz
         2NRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoRKIMpFvRfrNVeLTVxMfpn6E2VJoRm17TukoDFeG99fb8ArBXOwMwXK7FkMHcuVQ8EunWzYlJwkQo9Ggs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5IZt9Yy6bJJfyXDOHqlhmMn4ICTD2YvIOOOL1RtVKPBd0OHL
	HwzMcq495UxnMnecr1c2ZYlBKOqq4S9BJ2FmzIw58k7H9rnFXKQJY0U6lsmLgrLr9rM=
X-Gm-Gg: ASbGnct7jkm/kDOmRD/RYitqAwnEiWbtppDoFz4smz7WoMI48yvOKZh3QEo2oYLh85K
	50A0sJR29M/TWsL+1btHo7RAC6BEhdy4vEtMwdiZF1Z4rmBVZFaEu6POdsLpQsb+77AmlZXH0v2
	pdM0cqxIAfZbmvEdTmMsn0eT+8TqAk4x1HqY1ILN9AUy88sz5+1T/U29oGrSYoDey5ixZOPm2tZ
	B8bIYH/wbVQgSq1gwQjMz+vFAl/4JYgkvNpV+fLzLyK+i3MjfcISwSAqJCyck4jxOv59DA9RX45
	LpZ73uewF72hQPjcO+HilC/KEVF/lNSMkQDmKQo57QBrVAoa50lP1taeqXAl3ikKAJeF0Cf/tb7
	WNoDxI6Ey45C6RX3/jbEIP41vNty75zi18QDklEGfNEfoFBy2O3wcgV1LHZAx7xJdYg/3l1j6HG
	m+19YRq6/LOCmC60DX
X-Google-Smtp-Source: AGHT+IE7BF7Zob8VWImYE4jXaFtZGfHFdsSA4ziHHrbd1qrmktLS+xhjYgOnbKcchHYcVyfcNqs2jw==
X-Received: by 2002:a05:6000:2c06:b0:3ee:1461:165f with SMTP id ffacd0b85a97d-42557814772mr4929959f8f.31.1759417659262;
        Thu, 02 Oct 2025 08:07:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e693c33adsm37332995e9.18.2025.10.02.08.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 08:07:38 -0700 (PDT)
Message-ID: <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
Date: Thu, 2 Oct 2025 16:07:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>
>> WDYT?
> Well, I think that potentially complicates the driver by requiring
> support for both HFIs for the same platform, it requires detection,

Doesn't have to be anything more complicated than a reserved string name.

BTW you're right the main reason to support this is - in effect - ending 
of support for gen1 firmware.

But then in reality if that is the direction of travel, its in the 
interests of upstream and users to make the transition.

---
bod

