Return-Path: <linux-arm-msm+bounces-61327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF95ADA2F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7763AEB98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271682609FB;
	Sun, 15 Jun 2025 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIh+KBm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5223B25776;
	Sun, 15 Jun 2025 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750012154; cv=none; b=WeGQd4WeHD/fLxGkv82s05tRfK/pjRppSSr4f/FlJGcJxRImD9+70Su6kMVFWaoSAlmc0TgoHYV8qniZ/WPyIt7YSYZHzKku++fFP1qWgeDa96lU2VAz5BGe/KQSHxO00H0QpAR169cTIxvK36y3BJ/Hpg4XgsjLZ4E8NRWce2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750012154; c=relaxed/simple;
	bh=C3lOkzqrABff39iJT4/2npmJrwhUW+QYorbNRbYTHBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJQLikW5AeAowzj35YURo++B1cHoDNh56xayrD6v0lYbZVNr0uxPO+gPKS82m9dxBadGZZepySAr9Xvrr980MSUj1Q1R7vx91PyRNO1/zoQXeX4H5IHrVjs46aCtKBeERYsEEFdAxAk5igoGkYLorQLTTc531LnZ3A8QKIdR1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIh+KBm8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3728053f8f.1;
        Sun, 15 Jun 2025 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750012150; x=1750616950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foMShdEYfYc8JBQ1H9qjE5Pp7YV/FWiy7YlvAva/c1Q=;
        b=YIh+KBm8z9zZMjlOKcE2DjKyeIM2AFIWGQWD0E2NSd15lca6GyXvkvVKriNzpJBQuR
         AvMkystGQMHuVkNZwBuJj/VltNCKmLpiDzw9AmiZqAVSICjK14OMAHpxlD4MahklfWyX
         u/Bp70DpnjMGw0DOX1HTGe/5tcq89BlipZ1BTmjj0JGxDdjZLPc+qrY8Y7zFQdZ3RGGM
         ZYh0CtFqxt/8VTlINktdcM9PwhQXim3i/kgnA6Rv+tdXCXxV8voLEbZPX7omAFjGt5uU
         5/qjTtOrqz0e6xAAK5CVU3Fw3Pr/IzRkvcMn7eeOhejRoJJY9wIsDqK5OLsXwqe3kIxk
         4VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750012150; x=1750616950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foMShdEYfYc8JBQ1H9qjE5Pp7YV/FWiy7YlvAva/c1Q=;
        b=niXRbSA+Ba/xorTsOEEJFD9Sm8eAWozfDOK063YIr9v8V+gb6lRZG3y4VL5WO7MHbU
         574F+43BMhRrpR2CRHC/ezNNxR/RpVP1KtyEbMMfrbzjlUft/5gzhGDRA6Z4NdxFu4tK
         yMs/Nn4VkHBew+crv70+FR/avWG4HFGpLx8DkdpFLqzqYhUGy0/A7NErUnBtQBoTSo2K
         AavFPcGueKdzU4QzV3mgNDDBzVbLKn3UiwCn6XUylqVBOOmkgIx5VzbmaOGlcP0U8bnZ
         D0FVTPkQOwfo/oqLaVbtb9gcpLnjjH2rEsoCVW/wzDoL5YleVvefiymw4NQ6uhLBKY5v
         4aVw==
X-Forwarded-Encrypted: i=1; AJvYcCUucov2lmIjGLwCXkWy2lf39hzLj7+tYXuzscYpb/SqGcVA9DwErsiRszhATg+MgoBozYo23gMWr7gaUmxZ8A==@vger.kernel.org, AJvYcCVoeWwE3R3eCizDJdjcytZmTpjuAPssoxoWcUBN1QdhfvB9UyXQ/xxL+5r1gpB1h+64AR1yzm8CHtrZ@vger.kernel.org, AJvYcCWQuppP6QFfT8jCHQ/59cEUPgXt4YA5CgVbMFuOXhK9BliyMFvu6EgEniFjR5SHC7UrJICgQQEQNPn9He2T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yBKrKCfjU10pjb71OR7iEvmGVIDXoUIf4KMGlJ84OhFfcmNh
	dCQAnn2BhM0k8oEdwtUJjwPTC0np9pZEoVyKGPTmvq+KmHmEqEDnMpI=
X-Gm-Gg: ASbGncsq3twla81MxjCf2EI9XyfeBJ3+O+D3uhbvUnzQ5HwIx6vEzT+GIW1K2fv9P27
	BnWpuP53MGNQjfwg6eMZ61z7tsHhwHNfcuUV1+9TfJBs8J+nqaOk19xODoxGVSzfeNCAKX/jtEA
	Z7EiHB2Q3rSJRk6tYD/Dqmr8Ns324XCLTLVB3V4YJVKsLMNRFY3PasxVxH0ptUQannsmRtxz8Ky
	FE8h2dUjwv5iByj28Od5PD5nwKnV3jZsrUiRq0cquvXOTM6hEWG66KBP4OncEfGoYwQSEjaDy7x
	yQKI9S1rIvcJe1rkxdxe3AnNRusJbIMgrwSLpgxTgj5SVDQxOKIdnWQ0Hw1L6/dwIlrdkMv9qSA
	=
X-Google-Smtp-Source: AGHT+IHzcr/OQUl46bEd3VZNisBnnNoyG1XYdc0O5SgHL7n17Rwe1f1L0hLWYYhUTLp21maBk1d3UQ==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e75f:53f5 with SMTP id ffacd0b85a97d-3a5723a26f8mr5623912f8f.35.1750012149242;
        Sun, 15 Jun 2025 11:29:09 -0700 (PDT)
Received: from [192.168.20.104] ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6389esm8351124f8f.27.2025.06.15.11.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 11:29:08 -0700 (PDT)
Message-ID: <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
Date: Sun, 15 Jun 2025 20:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
To: Bjorn Andersson <andersson@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, laurentiu.tudor1@dell.com
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
 <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/19/25 15:00, Bjorn Andersson wrote:
> On Wed, Mar 19, 2025 at 11:06:12AM +0100, Stephan Gerhold wrote:
>> On Tue, Mar 18, 2025 at 10:17:02PM -0500, Bjorn Andersson via B4 Relay wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> The Qualcomm X Elite reference design uses the PM8010 PMIC for camera
>>> use cases, but the Dell XPS13 doesn't. Disable this PMIC to avoid the
>>> error in the kernel log caused by an attempt to access it during boot.
>>>
>>> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Usually we do the opposite: disable nodes by default that may or may not
>> be there and enable them where needed. E.g. for the 4 SMB2360 instances
>> in x1e80100-pmics.dtsi.
>>
>> I think the same approach would also be preferable here. You shouldn't
>> get an error in the log just because you didn't go through all of your
>> DT includes and checked if you really have all of the components listed
>> there. I think it's okay to enable PMICs that are more or less
>> guaranteed to be there, but clearly this is not the case for PM8010.
>>
> That's reasonable. Have there been reports of this error from anyone
> else, or should I go ahead and enable &pm8010 on all !xps13 devices?


Hi all,


Revisiting this change in context of Dell XPS 9345 and now Lenovo 
ThinkBook 16 [1] (and upcoming Lenovo Ideapad 5) as these do not have 
pm8010.


Perhaps safest and easiest is to simply disable pm8010 in 
`x1e80100-pmics.dtsi` as proposed and _not_ enable it on any devices, 
since its known to not be used anywhere _yet_? As its a camera PMIC, the 
only submitted upstream (did not land yet) change that utilizes pm8010 
on X1/X1E is Bryan's CAMSS series that enables camera on CRD [2]. There 
are a few other laptops that have patches to enable the camera (my 
Zenbook, Bryan's branch on Gitlab for few more laptops) but those were 
not submitted yet, so can be easily changed to explicitly enable pm8010 
before submission. This way we could simplify this change and not have 
to figure out which of the upstream devices do in fact have pm8010 onboard.


On XPS 9345 specifically failure to probe pm8010 leads to power button's 
short press not working for shutdown/suspend (only long press kill 
laptop power), which is a minor but not irrelevant detail, hence 
bringing this up.


Thanks,

Alex


[1] 
https://lore.kernel.org/all/20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz/

[2] 
https://lore.kernel.org/all/20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org/

>
> Regards,
> Bjorn
>

