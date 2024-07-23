Return-Path: <linux-arm-msm+bounces-26912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CF93A1C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98C9283050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9323153575;
	Tue, 23 Jul 2024 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TE5OFNxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CD15351B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721742165; cv=none; b=t8+pkS3f+D7qAUj08FmngndQs1RBnQ3/mV7yAPJOlI9YsnLp5LG3H0o7vMyG8euWDrC4McHaAxOOv1W/DVZhB4/tSzUYLUNhElKXBl4KLeInWNJgOT4w5Op9tARU07pG7EmmN4Eb6R7ra2GI/y1TNqVrOhI6aR40nXMstAgnEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721742165; c=relaxed/simple;
	bh=mUQzPtT2XThMQKTCSV3aOtTGerG3ylAPdr3dhYMetBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tz//fp4+eym5DTs6MtXYEIJQ5Gy8yTtEstL7lpeOQiMYGA2haMwM3Ev7xTvqMAjf74Yqs1c4XBPBF+/baA1mw2vCEUmyaeGDF/30OFREzFAq1KiQV2xlweVTgP/r8AmE6hineYtUv0+NnlJrTtfNo+7BsN4wymO1HGjvYFhxymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TE5OFNxZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a20de39cfbso4886382a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721742162; x=1722346962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nV4TE2hHk/91FnY1EU/k6szISDYggtUzta0pEuTGF4Q=;
        b=TE5OFNxZNCiDEi1Xksb5f/9/y8XsRTaFS75KT9gifCjIgy89wnJJYya+f2W2Wh0HgN
         dSPhKVvE9Kis9AjaY3HpHhTVMKNbe6NNs/5bbtEa5qpKh3+RQK14DUznwvWNFJleU6UI
         RnijFiHJbFYSAPVYO3wwvVKd783BbOzP8sJEaKmYh9O+Ov2xcj4/IpMaaG13pueH8Eyh
         C9CAEVrZEmDApm0ZaFKCR5EM+TVQBo2yYJhamZ26oHjLI2s+YeU3SsYy6EDjRh/MXJ/C
         KARqpxvSVRGY1bgeM0Chn+laY3I1fG58ZJSdi9w3Fve5nPjnWp5x9CWhIMdhqmeKo8cf
         edDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721742162; x=1722346962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV4TE2hHk/91FnY1EU/k6szISDYggtUzta0pEuTGF4Q=;
        b=rL/ygfaHvGeoM42qEvgv3ZpiJhTbmgZAbJxCqoNL0QuZ+vTs61PSzrCU8S2HwPQ9+y
         kEbH7w2Ee3WQjx2JKJvISS4Osp4ovczBcqQOOWhcfXgpw+VN+ClImiDCVri9KdvA0FIA
         aIraTNbUVfDSyXkf5BspV9KdHMcDhiQbPnN6r+EvgfN56y8zVwV0+aex8Gnf81QlL9VP
         kpnjz6/9DLnmbTZXdTmypaVH+87J/U5QsL7ZZ5MEbYy2dJQ0+OMUvdB1O6BAkIh/Uxl/
         ey4dJTJjvYiACL1BhPsFWhEnATqvzLx8EVZq/ZwM7fVnA+L9CE9qGtySyV7K6i2blM9n
         2Uuw==
X-Forwarded-Encrypted: i=1; AJvYcCU9nNLTjEPlShI1j8i2KTZhiyz7fLNkmyrsZ/dJoRBSgOJiGiYAau9pZDYos9T+grYS8vtnnd2ahIwG02V79C44qpdCuY7hbs/xtKQiCQ==
X-Gm-Message-State: AOJu0YzM4ni5N8h22zYOowwKES4YbyJbJJUS6HDVYRgdhBvl2jexCjHc
	nRV3vrq6v6fNqwqPD7alhN4p3Vzbb4NEhOxhrNlg0sLZSLsLZnIokbVJfF7dgkQ=
X-Google-Smtp-Source: AGHT+IFIyfv/xsCxjz9LEuJEre81NchieIPIZ6Q4RlznZaERXPc2L0McoQqV6TklQByyAQs2tqDrJw==
X-Received: by 2002:a05:6402:2553:b0:5a3:c00c:eafe with SMTP id 4fb4d7f45d1cf-5a3f089da5fmr7627498a12.23.1721742149420;
        Tue, 23 Jul 2024 06:42:29 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa253fsm7524519a12.23.2024.07.23.06.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:42:29 -0700 (PDT)
Message-ID: <a1c12920-4217-4898-b23a-1ee8d91b5961@linaro.org>
Date: Tue, 23 Jul 2024 15:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Enable the
 touchkeys
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, nikita@trvn.ru, phone-devel@vger.kernel.org,
 robh+dt@kernel.org, stephan@gerhold.net,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240723131142.1703-1-raymondhackley@protonmail.com>
 <c5f8cd32-d5c5-4c29-be8b-571804a4b088@linaro.org>
 <20240723133916.1947-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723133916.1947-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 3:39 PM, Raymond Hackley wrote:
>> Fixes?
>>
>> Konrad
> 
> Hi Konrad,
> 
> the issue is not reported or discussed on lkml, so there is no thread to fix?

See the "In case your patch fixes a bug.." paragraph in:

https://docs.kernel.org/process/submitting-patches.html
> 
> Regards,
> Raymond
> 

