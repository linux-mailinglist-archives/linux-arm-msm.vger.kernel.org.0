Return-Path: <linux-arm-msm+bounces-60891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4FAD4669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 01:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C201896D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 23:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489AF280021;
	Tue, 10 Jun 2025 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1Ulayps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24C23AB9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596454; cv=none; b=IoIfjuj6DRsywZ1SWfPy0Axz9rxe7vHTJCjpOaNb92ZAx44/GcZWyOIrq3GJAc+wM6CoeH4nkQ6VrGpqzhjwrXG1rd/CObXcF/qkP0OQlG7TUAd4Uae4UC3Y0nCp9s/X3BIRi8ZoQCMwHs6tfk1ngt+EqoiNJ8DpeXDt6QlXPS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596454; c=relaxed/simple;
	bh=YGpY68rA/JhjEp+LxAFTrZMk9ii1rggbyBCVjH5Hi/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBjcUIxgxLmnqCzjCjkcwLYDVi3zHQxugVEWxQwqQTiH607Eo9YLOXpAmPccMz071GmQANFMpWRU75GqV88JnauOEKnJF7HNyqFrftcDLsC2sOhHreSMwz8ncLDN+ewkg1w8bqDQSkyCPAeBCLOAVCC76GzAoRFROHoQnBDpGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1Ulayps; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fdd1c4b3so831430e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749596450; x=1750201250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv6eC8BWJe/QC9w4Z6dJHOpH2uERhEZbO922xRkpRTM=;
        b=E1Ulaypso42LWSiGsujPuX+rpA6xoQfdDwYYL0bI+3Y23Ptx5xiOCiV0vD8IaFhVnx
         mGeefsNjmdCZvIxjiDDfwk2EmhuyW7G8BTq4n1Qa0kRj2AVvQxoWy5NqNdigbRTkm132
         9P13jlQ1D6fnVc1pSOmFKcR9nPHdKc3DBDFlfOu9V665f1bF2VBo6AwHhNvIrbfE62VG
         8WMVcioP4Z+9qAkYFrZ+5m3gwC37gu0TjEFYqP2hqzYBArpfQtgHuvayjLyHlfUkGq18
         PvA5pv7CmWp5vwG+PjUh50vf6tmsr75NfbZkMuP0d9topJo1To1/8X9zkXqkNFCYuBgG
         kLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596450; x=1750201250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pv6eC8BWJe/QC9w4Z6dJHOpH2uERhEZbO922xRkpRTM=;
        b=enIuF8V2032tNuXxhehjGPV6rVZZDQJNDcMW6N/4o+DC8X4/T1iG0JTdT1q2ImUfMG
         ix7RLh5W4yAo63XQk24PfY37rjVczpoqrDH6NFB8Ec0c12qGiEcpsB83Tw8S8ZuNkw8b
         d+y4jlzdkMwFjTunZadqyNzS0HvZ8/IeGM0kKQQIjK4f+NAYVvVTIu5p6s8kbPKH9cDD
         p3fJPaWlUsGrxXmVC4PlLgxM2lzPfrmnEFCYbmMX6Q2rNElB7fNoyagAjtPfdtedb44j
         4i6YGxItPmtMH6wspwUutHMDJYzcEIIYRuYqE5vdi4XLzH5eMbBH+m7b2t4IlJL+ne6q
         zCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVKYaqRSeJO4MmPuHflUr/S3k4kFGRzTsSFYMK3kAiAFPl8NWvodMdvDXnOfzZw9csbHXgyxFpeqKZ1LDHq@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6rQIonKnU1l/WmYFnm1QpR+bLzc+PV3f6GErbPq7TPKWfpxC
	9bm82/4eUrq6vnhMs3i+gBSJLydDGxID5T4CvCHb5C7QJZR91ey8huyj0W/bwyO6ezs=
X-Gm-Gg: ASbGncu+C1trAebkk+M0xHC2e5z7D/WM7oXkpTGJtltHSCmTAt/HswYfxhzYW1CJ/2T
	Bv5HG4SpKTT4LT9f2irHXOW4oTRoPXeWuKfE4rlYmexVy6GRBAZzcJbO1wtmbDu6zq+hJOaTB1+
	FqTch7wlzbhhMMVmm1+W5blFt8qGQyDmjxYJvwQ1p/OiutzNFL1/5UPnU2PQZCU30S5f8UJ10Nv
	sPqRFS+Msjm4uBtxs8ofdHeZ8Ao2xwWtD9N82jhDxvv8CmuXs11A3LDocWM4IxwrdO1mEtL0Q+p
	pNy8Mp89wbzMJhKle1IovaTy3BQ8jz87ISq5XyThRfDHaeTy6mA8D4BLWQrUsBYgwM5rkF2aPLc
	x/T0usi+z61vCFEqhz0hMOTLraOaZJUg2fYRVX6y6Gi0nTEAi7vk=
X-Google-Smtp-Source: AGHT+IHxOB/GIvprDibRGH8b/xJoWimp0/bpa4Tr3aOnKL4YrIP9uIWQke3mgMvMH8CXv6c9NpUI5A==
X-Received: by 2002:a05:6512:b09:b0:550:ecdf:a7f9 with SMTP id 2adb3069b0e04-5539c246fb3mr134143e87.10.1749596450228;
        Tue, 10 Jun 2025 16:00:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553926a7d2dsm578480e87.157.2025.06.10.16.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 16:00:49 -0700 (PDT)
Message-ID: <0943821e-603a-4ee6-9bcb-e5fe690358c5@linaro.org>
Date: Wed, 11 Jun 2025 02:00:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
 <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
 <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
 <35muvo7h7ynfvzjt6jomasr54xaomfgt5etjc3uuczhfxww2ds@u5xsayanthx7>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <35muvo7h7ynfvzjt6jomasr54xaomfgt5etjc3uuczhfxww2ds@u5xsayanthx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 01:21, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 06:10:33PM +0300, Vladimir Zapolskiy wrote:
>> On 6/10/25 18:02, Bryan O'Donoghue wrote:
>>> On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
>>>>>
>>>>> How is this a Fixes: ?
>>>>
>>>> I call it the fix to the dt-bindings documentation, then what is this
>>>> change, if it's not a fix?..
>>>>
>>>> Anyway, if there is a strong disagreement about if it's a fix or not,
>>>> the Fixes tag can be dropped from the change, since it's so secondary.
>>>
>>> Since we don't have a committed upstream user I don't think this is an
>>> ABI break.
>>
>> Well, Dmitry says it's an ABI break... It would be beneficial to come to
>> a common understanding here.
>>
>>> But I also don't think it warrants a Fixes: tag either, there's no bug.
>>
>> There is no bug, but there are Documentation/ changes with Fixes tags,
>> it's okay.
> 
> Fixes means that there was a bug / issue that needs to be fixed. For
> example, if there was a user for the bindings and the user had these

That's "for example" only, I don't think it's an all-descriptive definition.

 From Documentation/process/submitting-patches.rst:

   A Fixes: tag indicates that the patch fixes an issue in a previous commit.

In my opinion this is quite applicable here, the "fixed issue" in the device
tree binding documentation file is well set, and anyone can get it from
the provided commit message.

Anyway, per the ask I'll remove the Fixes: tag and resubmit these changes,
thank you for the patch review and discussion.

> values in a different order, then changing schema to follow established
> order would have been a fix.
> 
>>
>> I will resend the changes with whatever updates requested by both of you,
>> if they do not contradict to each other.
>>

--
Best wishes,
Vladimir

