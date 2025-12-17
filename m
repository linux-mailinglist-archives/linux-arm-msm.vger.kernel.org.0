Return-Path: <linux-arm-msm+bounces-85431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2608CC5E77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 04:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CAB302EA3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 03:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AD92C327D;
	Wed, 17 Dec 2025 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4W6ua6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF12C0275
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765942144; cv=none; b=VhpWxnh98e4oc3Hkji9I/U3jJgvW4NByzl+HFWtI1oLR+ISmmkAY5KJu2w5GKJTTV+iItMC0K04MBvaYpGBchee5y+at4bg7Fl3Lf0gvInyf+XEmot8qIRS2QGuVVI6OV78UzoXBIqn4j8GopS/Qotpptbol3wghT4AvHPT5I0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765942144; c=relaxed/simple;
	bh=V3kmA2E9ohZVX3m+GKcNpy8+AR6Kqr7yMcKgMsOJbAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkPSPd9ux01mxaFkcLWZyObkPPoeMOOLBIakI3qUgEug+pH/RybztJIY9NbqBBBgRXHG7kXfkv5TPZRzAzykyzgLOpN88mXd7v5VQXsAP+uefSb4D2Et+UsVg8XEfJpTppbm9GaK8y9SmRIBRR2it5hQGGdXM613Enjegw0iJBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4W6ua6a; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so63899425e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 19:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765942141; x=1766546941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8f8X3JIRm3Pu78dQiBeWf0yThxM9A+ZJVpoSaOPU8dI=;
        b=E4W6ua6aDA4BtJpJ6OBL6gwj2MvsT8Ci7RLLq0AiJwXyFJEdkLUQzkqhTcBsaEN8rp
         +TNJVwAz8TkMRMz7e77R5YrBlqMCO3MwZa8jS+R5DcNte/T4LznH8hOkrK/DzacF/BWu
         X9cjj9RY29JGbjaMHZnyQ8nBokSe+z+UD2Xco7XUnWZ9blYHEprWF0WphhYxfy92YrPM
         eCIlHr2FgoSAB0NZqlXP8tzoWmkYWNYFeHtzDsPzBthto533xZxzRWwWsyS56MkCAeNC
         HOU3IuFD66aL6/DWdkadR/OiBZ5AA/cQaVvr4AxHJIF5+Dc52OxMEwK4cugfHBSa/VbJ
         1x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765942141; x=1766546941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f8X3JIRm3Pu78dQiBeWf0yThxM9A+ZJVpoSaOPU8dI=;
        b=iHpDGKohc2dFjWcFansPNsY111l7V3jZpCAqr5kxaJq5TCmqhIe4G4DVspqxBgWpPC
         AGlKzzQSZOzYpkrQ7UZBARmt/4fmuCohOXw/hvXHN/q1cV8S4dDqGd48YBenEBZdBmOm
         7Z+c7wC4BVG7Ev5EAruYyf5nmygTzk3lRP9IVmYWgBgkmnEPAKvSzQB7KR5lnGtWs0zC
         EeQwU7yJFu+GFLm+4xAhsyOOmROrneiVLCK05SbHxrH6Nx6LXVbagiBo+DYc6ZncYJtZ
         PuyB6qVVP4PIO3SbPO9QukfW5IKfKNzzrFxcylAW/TcPDIoYexdt0Y626lJttUMiPjYl
         cD/g==
X-Gm-Message-State: AOJu0YzRca/Il9VeuXPc5LzG9CXpiNS5ts9xNln/DLtBhlSPD1ksGZi8
	3bij1yexZkSbLUtcOQIY56FY+RsbjphKWA8bXhdTC/gvtHOrgUHRNxDG/SYX4nlhOs4=
X-Gm-Gg: AY/fxX4DYKlHmmLA1aJ3XMIHgvLFiM9otv1FaHgAG/UXCT0jD/sKM9wstopBcllGCpV
	HGLK/iPtHgU0In+F2YpmZHwCNQHJP9NKcbGDI4I38sy86urVn9eQFvpR9XfdvdoIgWk6jZUQgdc
	7gVeMZfyyota+X44VbYLHHzE5LXYWT6udThm0o8SDAqVPrjd4pFRqddiYuSldCiSMm7SOxLt7wd
	XEWk0ylzVgcfWDinpZFmMvvTtKHse2rBo72bQBLjl7vZ0CfuAlg9S88MpT+U2U8OmEVnU/c/5RW
	i4Tz7wIYjGyFh4h5bjgVDeIFLXhE8Okuklbn+5DTwmlothwdvs2JnRxJsglTc2E+NXW97Pttqpl
	DJ4EurX9U6VTsmfoboMiEbCaGHrvl5HAG3ExSzaJUEiCN6soIl17VpCgHoo7YOlRsP3/TvMUrzI
	8OQS1uI84rn9v0jHGREddVpnTFnA/bt0PEV44oe2Bnkmd8rxL5fy2I
X-Google-Smtp-Source: AGHT+IGvo+/r8DGxAk+Qp2jL/mIEcx7HGJlSXwVwowUCWWlLWmWtzRam145/XnamXOC9odGtDbhRnA==
X-Received: by 2002:a05:600c:828d:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47a8f8c05e7mr190963935e9.12.1765942141400;
        Tue, 16 Dec 2025 19:29:01 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adf6eabsm2191990f8f.38.2025.12.16.19.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 19:29:00 -0800 (PST)
Message-ID: <2ce4e296-701a-4354-8988-87525769ccac@linaro.org>
Date: Wed, 17 Dec 2025 03:29:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
 <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
 <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
 <c2125dbf-bbef-426e-adf9-7767ad822ae1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c2125dbf-bbef-426e-adf9-7767ad822ae1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2025 00:46, Vijay Kumar Tumati wrote:
>> I don't understand a reason why to do worse for the upstream, when 
>> there is
>> a clear and feasible alternative not to do worse, thus my 
>> misunderstanding
>> and my grief for upstream CAMSS are my concerns.
>>
> Thanks for the comments, Vladimir. Bryan's and Krzysztof's argument was 
> that the bindings are required to describe the full hardware regardless 
> of the driver support and either way not modifiable in the future, so 
> they preferred having the HW properties of the key functional blocks in 
> the bindings. And we were specifically asked to add the properties into 
> this node in this patch series. Having said that, my knowledge on how 
> the bindings are handled upstream in the long run as the requirements 
> evolve, is limited. So I will look for some expert advise from Bryan 
> here as he strongly advised for these. Thanks again.

I see no technical reason why describing the whole hardware block 
precludes any further work. How could it ?

Anyway, I'll repeat my ask to describe:

- The full register set
- The interconnects
- The clocks and resets
- The SIDs

---
bod

