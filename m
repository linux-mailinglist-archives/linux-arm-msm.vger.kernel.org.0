Return-Path: <linux-arm-msm+bounces-17209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29D8A0E0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 674271F21813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720C0145B3E;
	Thu, 11 Apr 2024 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVzMczjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78398144D34
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830234; cv=none; b=Qi1Z5fxPz1v21Idz/N+fXK7XW4dphUapiiT1eiUuKHovtwwd3XYeM/BFR7zz6P3AxMKwvgfbs6HbXrMGaLEdsemOJLx9faXTSi1Qbi9TTQZz5mB9evOmw9OPoODxCuK4AJK75/DP9eFp2JZI6StV/BgYK51vQP+cyIghQnh6Z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830234; c=relaxed/simple;
	bh=c88CtbpASLW+lMC3ncUfeLi/X9N2GHnGhifVL+4uUu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMKCzpiyrLNEM9YdfBOI5EH6U/BPRi4iMzum4K/nWJilwKeIFUHMJyMQbaSbhKLY47muDHYBBvfHRMzIw0gPcsKhJoFD8pbqGTIa9zGluTIzVX9NuFhxnX7vwz4pA39nK+JGAJ0867piBvGHU9b+NJQXhewA+F1qH2MpBOkXJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVzMczjU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-417c5aa361cso6906055e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830231; x=1713435031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IbcuPYzDJIFh9oPzYtxj0nVD0h7WR7t8sWLiBPKjH3g=;
        b=dVzMczjULcTCkxLz70VJ1TlBe/wKkTozHJOvwScpfYeeA+8k+/ANXvuZAhNuYqId2v
         HijVDfQrC47SUz/ocItNBouyJILbVI4oCTNpnOIAHpPf8c0AEPCZXGKRkSRFhAPInlHY
         AhLCR3e/U6ZpHkiqhnVkQC3LlOYoO5fk/aLaZqWxcuyIVO7fOGFesBYTcwerDlKHveCY
         gdGU5rg25lHyqkC2WKjnhknwm0W5mW0d8hTY2NwdfbGGWGZlOy0vaxARjnat44jTt7LO
         bfOn0JME0YiVereUweOVxRzJYkFcKbz5KL42wZ+kb62r7AbRXIeUA1o7G7mUO53OCJ69
         J7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830231; x=1713435031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbcuPYzDJIFh9oPzYtxj0nVD0h7WR7t8sWLiBPKjH3g=;
        b=TyGlW72JhTfEhJqW1HbqBjtYe/DHDNcU1it3dIqM5TTLIAwuxZSVSdQ4y2ai1bANDh
         f1kVLQW2WXCEmv3k7g08wOBKZeXaNKanL6k+sYbHf8P3ZMUN2I47TMn3dzZDELrOK/3l
         X5IVJV8smuw/atIuQJlDETWZpvclHtmMvryWn6kAR/h3copVOtMZrJDSoy7NL2t4D9hZ
         Z6Z5qJo7TCYqYF1T/LbZ/DikaiWFn+UA/SgE5DwDNXCjfXGeWS/PyjE8pNKkeau4wMcM
         Pui89V2CyJgETM0IAJKsN8Peb3Ofylm/uGGDObBtspXTrBNwd5ZcGL2LRg2PxF1H/VhF
         UZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWVH3MESVhDcYElf7k4kRtenyZ5d4IS3PJ2nUAJE0ohWWIcAGADsXPyiz2ceCa4kmq4HlivM2+D5SCLc/gCMd86Q3VfHCjmU9i2JpObXg==
X-Gm-Message-State: AOJu0YwMh4NV6DoxjqAXteF5CFjxOywtiEiB2Vvkczj+vCqDOiNQleTU
	iCsYRWH6YPfgx8I1gYiTQdsKwF9ojigUYLplqZAoHBSUFtVKX1TRd7On0vw+6Wc=
X-Google-Smtp-Source: AGHT+IHRKrRLubhr+Lnf9ntcc3NGKnH39WbmBok4qFy8BKIHtyPtVJY8JT7mh5VwhPSvyUJk4CEkEQ==
X-Received: by 2002:a05:600c:19cf:b0:416:fdb2:fa75 with SMTP id u15-20020a05600c19cf00b00416fdb2fa75mr2614634wmq.9.1712830230728;
        Thu, 11 Apr 2024 03:10:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b004163ee3922csm5052531wms.38.2024.04.11.03.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 03:10:30 -0700 (PDT)
Message-ID: <5cad6693-8a76-4a74-92a0-00a0818b5210@linaro.org>
Date: Thu, 11 Apr 2024 12:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
 <ZheyJ5PORudx9gsK@matsya>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZheyJ5PORudx9gsK@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 11:49, Vinod Koul wrote:
> On 05-04-24, 16:41, Krzysztof Kozlowski wrote:
>> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
>> over two Soundwire controllers, thus they need a multi-link Soundwire
>> stream runtime.
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: alsa-devel@alsa-project.org
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. Only rebase (slightly different context)
> 
> Applying /tmp/v2_20240405_krzysztof_kozlowski_soundwire_qcom_allow_multi_link_on_newer_devices.mbx
> Applying: soundwire: qcom: allow multi-link on newer devices
> error: drivers/soundwire/qcom.c: does not match index
> Patch failed at 0001 soundwire: qcom: allow multi-link on newer devices
> 
> This fails as well :-(

I just applied it on v6.9-rc3 and next-20240410 with b4. No problems.

Did anything change since yesterday next? Can you point me to the tree
and branch you are using?

Best regards,
Krzysztof


