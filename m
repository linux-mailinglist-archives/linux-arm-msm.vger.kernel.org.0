Return-Path: <linux-arm-msm+bounces-77501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2AFBE1085
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 01:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8D1402C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9C73164D7;
	Wed, 15 Oct 2025 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpVCN8fg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97F2D47FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760571142; cv=none; b=Y0Ok1vlOvz2vKmOpv4G/z/mtsThRHFo0ae7v1e9wWTppYlIKV8Pwjuh9pJpq5EwwlSzZGrhJhtxGsQiAC4KQa4TkJYqDX0iayyOwOrLeOzxKAepzzxb2CwIobSMlgrVYcxsHYIyGvs0wxYY/flzrnyyVFOzMlUXVNW99ROMAK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760571142; c=relaxed/simple;
	bh=E+hpu09ROQFdd1Em57oWayPsfVLzQBtFlkrFf6LFmYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOwmE84QjQL9Afk+qVF56JpjbYlM8EasehN59mxhLlEqzm3uAG8UUIFpWgAymicDvnyTmRH5uLgLqBroHLKdrVw6IrR1PN/S8IRswJuZIbKbBH7l/1lhYDHeZBH2uxMwmQPNQDH+jRkuOSsb5BLmCkVyW3h3OAY12OwhmQGuu8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpVCN8fg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so15761e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760571138; x=1761175938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpPxh0gcuqDsiBGhGT8nfnZ05AHmMsVAlwdJ8sk5caw=;
        b=KpVCN8fg0eKg+zdhFi9pvlUG710HlDdM9sObq1jqHgTkTO3Ygjm4sKpnY8I63B2aaI
         QX6BGdY0/A/RfprOLYqyuaCrIfVE2N+tpQZ89WJ7BOJUuKOFqBQt3LoXpr5plqKcIk/v
         YBZ5vpfrSOTY4V4JlM2uEqtny6WW9AKCHbxUOniJliz3Aa/4cMgkFk2DUpNuLnUwmc/G
         l1mgpnWyH9J4UcRAy9M8POCKBihBmKBAkG4hqv3BiFYxV0VG6J5sRThHoRwuMZnqiCWF
         j9N6eHE6pf/KM/iuFgf+5bGbCUFiOAhyafIXlYEtgmmRXOkYP7cwAEpSoeoO6jFcx0Ha
         OVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571138; x=1761175938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bpPxh0gcuqDsiBGhGT8nfnZ05AHmMsVAlwdJ8sk5caw=;
        b=rgjngKC8b85862gGtz85N+6ahNYcWsZ7UmIxnS5sr5/vitrgmyXjQTuyBvQZTnNEgw
         yzRhqVPNt8YeIVmzfpMsxJtBfS+MFXvxkQIMkHJbyju2Gv7RS7yZ5/NlebPiV+SMTAHu
         L8KZFEJ0KQhx5RuqkfHuki8CdNikP+SSyIuNZey3+Vajl2jHjYJ/OxRcy2i6rrcUKtTX
         1PZbj4lMoMNV9ONnaLoOLUTzkOWejKFQ0uhHfV6EUx8Sw48EcZIt6XWg/ucT/5IPyesd
         yhFwzD1CQNOPl3sp63xJsFamPOj0E9cwSD1Bg75w1DIAeExWk9L2SvtvVEWgM7KK/TNd
         WCPA==
X-Forwarded-Encrypted: i=1; AJvYcCVP4A9IGvHDhjnaOvhBtlR3LQIbFFvut38ksoRySy0UvwBiaw0Tf/rjvFUqKPWbkBtvGdl/NCkOLL60SPyD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmxdp2BATRah4yUWSb8fsVc5HNSApKSzw+UvHqpyXUy5a0WAI
	ksNsRaIgLVPEUlZpAsNlrWyWAHQHjd6ZyQSgHLZOGVl69YXsGPKkGFeNJTZAIhfwUR8=
X-Gm-Gg: ASbGncsbDml5bLKfhMVfZvIMYO8lHfYWCYs8HwyA6DQ7SL3KDo8hIVLHPHSqtJtkxoj
	ZOAWTy93wKHbS2uJSGgZhB5la+Mm8tux5Om2v4kthXGyBFmaiiM4zxP76fdGirB+7Au90EONVY1
	rl1kCybUx2i0IgtV0D2qfZi0ZwIfC0UKFiqHXxkBhjCaf/DdisQ9RpbKe/KwxGIF0OJE1fw3y3k
	1ZQxcNrWuW/z9oA+z2MwZYKYumNjyfO+dBXC4QJIcM1z/DM+JeVJRukXPtZp+lRn5VnpQsW1W+G
	2WQOWQY7vldp1CUzwKCcYS945iokWIiYMwcUmGqcmV6JMBXveZJbtcpTvuoSEoJiCYIaE1NEjz7
	n4Kr9rCFk60LpUSQwfOn8MhnKX0A+rqU+AVva7WOgAuN3UzSUBikzXDWtFys9h1oylVcVVCSKf2
	6k8nEYGcqQONi/N2CxMZkA0dhjCsX/VXyu2kPGuWUNxMppwQItfOf5yk9fw8Y=
X-Google-Smtp-Source: AGHT+IFhmCfc/iqqM/lx8OD9acToPRRAMIUni22wMDWOAc8jc/Nu4v4J+9jAJJcyPXA90FdVyjEthA==
X-Received: by 2002:a05:6512:682:b0:57d:c562:1f78 with SMTP id 2adb3069b0e04-5906d8ed17dmr5015764e87.5.1760571138323;
        Wed, 15 Oct 2025 16:32:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77cc6asm50763801fa.2.2025.10.15.16.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 16:32:17 -0700 (PDT)
Message-ID: <a0d9389b-67a5-458a-858b-ffdd95f7ccc6@linaro.org>
Date: Thu, 16 Oct 2025 02:32:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 00:43, Bryan O'Donoghue wrote:
> On 15/10/2025 20:45, Vladimir Zapolskiy wrote:
>>> +  power-domains:
>>> +    items:
>>> +      - description:
>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>> Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: tfe0
>>> +      - const: tfe1
>>> +      - const: tfe2
>>
>> Please remove all 'tfeX' power domains, they are not going to be utilized
>> any time soon.
>>
>> When 'power-domains' list is just a single Titan GDSC, 'power-domain-names'
>> property is not needed.
> 
> Each one of these TFEs powers an individually power-collapsible TFEs.
> 
> This is also so with the other xFE power-domains on previous SoC
> generations.

This is false, for instance there is no management of SFEx power domains
in SM8550 or X1E80100 CAMSS in the upstrem, neither there is no management
of SBI, IPE, BPS, CPP and so on GDSC power domans given by CAMCCs.

TFEx is no more special, if it's unused, then it should not be added.

> 
> You'll need the TFEx power-domain to process any data on TFEx with the
> 'lite' versions being tied to the TOP GDSC.

When it is needed, the documentation will be updated accordingly, right now
it is unknown what a data processing on TFEx looks like, it might happen
that there will be separate device tree nodes for TFEx.

TFEx power domains shall be removed right now, unti; a usecase in the upstream
CAMSS appears to use them, I haven't seen such code at the moment.

-- 
Best wishes,
Vladimir

