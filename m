Return-Path: <linux-arm-msm+bounces-39430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB389DB737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842F716155B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7487719AA56;
	Thu, 28 Nov 2024 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tS3TCf9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E62CCC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795923; cv=none; b=Ic6qf87jdC6Sz2Tnb63T4iQt0jADDRkJxjAb5OyheHeeEcai2SqLOsei7lCl33IRScHp3cXEr7S6yijM87x/X4aTu30YtedT/KMhrUIvvUuDrhvqd3x7AtFhF8Rbzn3uL1+JgDgDevzIFszYEO1hF8U+7q5Wzde401hjkLj5mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795923; c=relaxed/simple;
	bh=0MeGc/7s/CWBQN05R+oTUtFBb/goOcovHE356j/Oszg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVqwLgPmKnPr0sasoxN6USyGwkaxP7RR5BkdP5drhZh9qcdT4+LikHUecG2RSr1zwh2fYK3tI+qL7tRp2SfYCVwKeOgnn7MN5Q7SL/FVnYagDL8cG06SsghxZsugSrNIBkgZatAURoeyIBYZEW0iaMh5Wf/NpW46k6mwHZ2c+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tS3TCf9G; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cfc035649bso898340a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795920; x=1733400720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlagLEJFtywwVUMe1dgXgwPpKrkSCr7O7E/5icGZLn4=;
        b=tS3TCf9GbJVM54xegz7nf2GORR0cBMfxRDySJhFON77Ma0hMri69nqnIR9Ib9LtmaM
         jMCE15QfBVHx2dugiNIfuFN8omGzdXEorwGSLZTj/u/XOZsVhm/+NDts3qOl5vam9XzP
         psjleL5Fx/kke0pdY1a2UnMLbCSr3J3d/NVkNpRGOrLWdU3uxqDFVeRiZhrMq9FYjKdS
         j67QErPvpwTUKPy2xjdTGlP4ho6AYsPXWd55rhYabuPGb4dSTuoQizgmnuqXZmCedjhW
         +vVrJj/7/qSnZoQKRwVbX4/akOQVcgTU3P/U0Z670theUBZAidOyfpR3ZE4SChdjxck6
         nofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795920; x=1733400720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlagLEJFtywwVUMe1dgXgwPpKrkSCr7O7E/5icGZLn4=;
        b=lzTXRYxcQxnSqhTEZBACY6k9leMJTMG08uMwW7JTnzpNpQ4U7m0mbZTl5vTi4r4XeH
         DKcsRlEsHB+DZ2c7E8ZbL2CnQw5EMwS82rhNvYCt9Kn0LweN8xu7/1JbY9YjeOsZ9m03
         diNGKTvXUbALJwRVLJN8sXHe1B1arQdgjyZ85S5YHjuDWP5tBHNh2NoQTXBxzDoG3NjN
         1Z8VBNZ43T1dYtzFZmeSL4+7Jf7JdnmzkocpLGf75IhXBSLeqP6IVsj0A0L78/9ZMhjI
         8ElylPAgpGhq6ab8DqLa+1OlP6mjtWyJkB82bdTDEQpfVcSt0N6K7Ap1yu2BB8GLdsT+
         5QgA==
X-Gm-Message-State: AOJu0YwEnQIeG+V3i/l50pjAiPHGAczCNmIU1pLyOZz5a953+3SZjC26
	SyOdznLJkUcVp3l4lbRt/dymeyDv6Yi92elWWUacmbCAy9RDuCC25baGJebtfPU=
X-Gm-Gg: ASbGncsQWq2wdbkI6rWBnF6Lza7cSNPhCu2mrfwCUj4a67ZpUD17HKl+vqkLW8OFY5p
	laf+mslh1rTT9kNJboPY9Kz0HoDy0vk7Qjj7E2qeqfMmoVIzxTthUVChglTphmXJuRfBakGynb6
	EcBatO3QSzgQkmpwSHpBCQdyaiNClnCvRMOJIql5AZ8Vtdjm2lEMS+kR7G4xSdeIlLpqqSpOAaP
	07KPKuNzkdhhXab9RKJ7XyPoMgRFDUfjyirwQ7roPler8Wtcl6c3/AmRCV36A0=
X-Google-Smtp-Source: AGHT+IHvAUIzZYTgmNUEdyRVWk60wm4MmFIPzbhwhInYSuwK9GJKfO8YoQIj0jmD405fTVDHMr0VFg==
X-Received: by 2002:a17:906:b3a4:b0:aa5:aa3:8c45 with SMTP id a640c23a62f3a-aa581055163mr464111866b.48.1732795920072;
        Thu, 28 Nov 2024 04:12:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e63a2sm59846366b.113.2024.11.28.04.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:11:59 -0800 (PST)
Message-ID: <b76cea3a-b330-45b1-92a5-844aa081b0a3@linaro.org>
Date: Thu, 28 Nov 2024 12:11:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
 <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2024 12:07, Vladimir Zapolskiy wrote:
> Hello Bryan.
> 
> On 11/27/24 01:44, Bryan O'Donoghue wrote:
>> Right now we support one power-domain per clock controller.
>> These single power-domains are switched on by the driver platform logic.
>>
>> However when we have multiple power-domains attached to a clock- 
>> controller
>> that list of power-domains must be handled outside of driver platform
>> logic.
>>
>> Use devm_pm_domain_attach_list() to automatically hook the list of given
>> power-domains in the dtsi for the clock-controller driver.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
> 
> Is there any particular reason why my review comment was ignored?
> 
> https://lore.kernel.org/all/8a33c0ff-0c6d-4995- 
> b239-023d2a2c2af5@linaro.org/
> 
> There is no signs of the change improvement, unfortunately.
> 
> -- 
> Best wishes,
> Vladimir

In the cover letter I cover what was done and not done and why.

I made a new function because it "looks neater" to me that way.

I implemented your feedback on ret and -EEXIST.

Passing NULL instead of &pd_data doesn't work unfortunately.

Let me know what else you'd like covered or revised from the cover letter.

---
bod

