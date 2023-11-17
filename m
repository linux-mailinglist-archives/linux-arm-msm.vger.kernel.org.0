Return-Path: <linux-arm-msm+bounces-1016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD217EFC3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 00:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73247281331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 23:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A944646553;
	Fri, 17 Nov 2023 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YITZQTWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B3A10C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 15:47:34 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507e85ebf50so3360373e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 15:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700264852; x=1700869652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wM1V3uKaxmMfTVNrngWaOySMlzElI42CeEpsG+l1pg=;
        b=YITZQTWlANVnWGW8Ochntl6IgCfSOeYbxCZulV+blBKr664tkfZV75r/n513c231Mc
         XUqsfW3fnH3ormjillLoept7DhRXOLKjoOlSA1Fbbm1IlSRW12D5pBMRMkVTKs8JEFrs
         gnYALStXuc+pGf+lr1JqvUpExmmAZv99VZ7f6Dx0moXBIJHlvkTDGT/iAxw/+QJo2ssW
         1ZmlXOGFLj4MJ/x8t0VaQ0slm8xgdyXi3i7DNmVPXuQvaYh1A6ZpWLRS7ZZJRjqVys/G
         GVaDXIdghcadJ/fsr+Q6Tl5ONiJ+jHxTrja5VH34TwhNuzjaaRY+Og54nrpqIuq6zpMG
         T9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700264852; x=1700869652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wM1V3uKaxmMfTVNrngWaOySMlzElI42CeEpsG+l1pg=;
        b=v1d79xwzyTu/CmPHJEb5qQy8f1UbU2PviLTYdQ6G+Wpyu9+j64zMTTwKNZNHPHW242
         lYwUV6645+V1n09u30/cAD/gyAzagblyeCB8C0saQAnVkyuqXPwk3nHuCKv1PdfsvVHb
         0GTrDeI+dv2vAcsCYCF0rg/sKXns7NlziIoOZFDKti93Hg2eXktQ/QFnMJ86O2TeSAX7
         7cDrg/qyHr5908n2YCchjqMxNyRNkOuREAoYh/dMbMRYDJfnnNjlSQ6L/ES5pV3hNaeW
         iWZ/xdYFM1YH+as9RwH47QL+09HCfXTp8mgLlBRe/RwrRnY2l3mhI9Y8o1mqzxsSlMvK
         nQ9g==
X-Gm-Message-State: AOJu0Yyf/hU1B0S25CBD0btB8C/MFPbuHxebY+cbuoqJcCdyKKbUsgh2
	XF+n/iUe9F5rPUURI86aF15/zg==
X-Google-Smtp-Source: AGHT+IGIKfxOtqgZs5izGy55HN7ISDuZsGjfLyFS5WhsxYavC1F0ubnkuOIXAgsoQLeJG7M7YVnV6Q==
X-Received: by 2002:ac2:54a4:0:b0:507:9a49:2d3d with SMTP id w4-20020ac254a4000000b005079a492d3dmr766293lfk.31.1700264852473;
        Fri, 17 Nov 2023 15:47:32 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id s16-20020aa7cb10000000b00544f8271b5fsm1168871edt.8.2023.11.17.15.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 15:47:31 -0800 (PST)
Message-ID: <041f239f-7b40-4681-8c6c-2268f9c2c684@linaro.org>
Date: Sat, 18 Nov 2023 00:47:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231117173650.21161-1-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231117173650.21161-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2023 18:36, Johan Hovold wrote:
> When reviewing the recently submitted series which reworks the dwc3 qcom
> glue implementation [1], I noticed that the driver's tear down handling
> is currently broken, something which can lead to memory leaks and
> potentially use-after-free issues on probe deferral and on driver
> unbind.
> 
> Let's get this sorted before reworking driver.
> 
> Note that the last patch has only been compile tested as I don't have
> access to a sdm845 device.
> 
> Johan
I'll sound like a broken record, but:

is there anyone in the world that is actively benefiting from this failed
experiment of using the ACPI tables that were shipped with these SoCs?

There are so so so many shortcomings associated with it due to how Windows
drivers on these platforms know waaaay too much and largely use ACPI to
"bind driver x" and I simply think it doesn't make sense to continue
carrying this code forward given little use and no testing.

Konrad

