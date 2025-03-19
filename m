Return-Path: <linux-arm-msm+bounces-52013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F0A6943B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398E2881E41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF161D7E41;
	Wed, 19 Mar 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHN+vrmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7C1DB131
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399968; cv=none; b=ZOEE6+Q9U+FiaIIAlhCa2d1mNacu0R0htsWTtrqrf7jVGTszEjZU1ImZigw3lUppAc9ik1mc6V+s864/Ify0iE1c+w5c0fVB4JACOWlMJ7TPIJhzMnbqqL1ducDog7vX4xHiK82jqUMOkTiszTNpVRIxn52m2T/VPE+bPLbhoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399968; c=relaxed/simple;
	bh=ILRmyU4myaO9C/neNMKWw4w0x2c4drxeRcZb2f8Rva4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoDtMbAuEo7APfaWK8MopjOzZF1RbljQtFtE2W0gqPxHD8q4eVQcOdARGc1B9zTdxDu+3OdOgZkYUYoTJYoTyfW6JTfJZNczL1eybzoL1QX05/md9vrEbyQuj6vqHZUcM3v0gvkpdXEwFBdxUm5z4PXwIydLdmnfPEzQxDcxoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHN+vrmg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso42972015e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742399965; x=1743004765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtY2N2Z3hL6nDVea2tco/rHxiZy4oFusiROnhy6gmTA=;
        b=CHN+vrmgMkGPvbQAT593RxBshrs2ccP7MfNzizhLORjvlBAPNJTy71I7Y4Tl4cza0M
         2w8YTmKhIE94AerAISn9RUPkSmH79q6RZsxGuikcA8b7yfDavyHs/iwvpOvZh6g2Mqd8
         bEPi9+1FWy605vqJDtmDFoLe/izRBO9V5RwVAXDR559gFfRSjGYrDUWjguO1OpnVoHjn
         9i4lwg3S1z2DaUpPejoSQrKWZzSkVBSS8F3/jzIfjJRD4OSWkGuj4ZjonLti6hbX6c8B
         75Zw7Lyyg3HsNJrMdbSZzyYVyx+3lzuUfg3D3jeaXG2YVnXG20sPGxXgahqKQO7lPxuQ
         lxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742399965; x=1743004765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtY2N2Z3hL6nDVea2tco/rHxiZy4oFusiROnhy6gmTA=;
        b=ZbIL3oFpRdtxTMEP/UkgK4evadupagmI8F+qDWI4PgfuF9oRpVwzvfkEXapMi9OiL1
         Z2NnvXb7Ji2NHCJSGEsl0YtsgVyWPWH2qnKQp6/Cd2EYTcKXy2AwIvLVEJjB9nxGZu6J
         MKBbwd7JXyeajK4/cBLyzoL7I0tr9Re1f9zC/nVNjETgjquk5r5wtO0viPK2Bp1/sqdK
         RavBuKsLZ9eVUTHybyvPqXMKrEj8MYPbJRLnJBiVYcwhMvxL5hkdaEbI84VLHYXEDJ/0
         3iQIpTtYZ/lVThTiuHIsodTtYZZLVsmryIVNqZODjABAf/FDSEhJzDRTS/M9s7ZATwcP
         VGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsHGudWobknK0BMCRe3R0or/8yVq6MsuqM0JRUky7upb9BQRe7Duk2rPd7U6jyA4XuBly/6QL2MEnUbcOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyau8/1n32B3xWBPIzGmltozbwe+9oOazEljyrdRXO6hnzouxTR
	tWwPuHLE7bKAJ4iHG1ZH8rlc2dAubUl++ly7DqUcphqmQE+YFajw4KEpDkcFF3k=
X-Gm-Gg: ASbGncsu0toBLLbf+4hn/xD/b1c6Ik4YPnqU60IVGt2SAxwyqeH9uL1T+gKlAUSLr1k
	hIXqTp4jV+SoqbPGw9rR1DXsBkEZKb1ZCS+Q97Q1a7CM+W+9Id3UuFsN5nBx/BBjGZiV08w+WoH
	PcSiJx6b3njdXYbNke14cTt5Ohvnb2DMEEKdMnjfIj1WSuwb5hHvBPX8jXXR2snAo9iijyDs9PB
	tjR0j8Z60VWiiSuC+crPGSPsYAY7Qkwm3RGS66UMo8zzPFOiFGuOMfQzjQmwId6igcPmc4Z72Qs
	atkeg/5MgDu5BTtX0omvuvflOWTkUpjsCILyTHYYR2FblnQTVBl+xH0E4qxyFC3zx2eayQ6D6Q=
	=
X-Google-Smtp-Source: AGHT+IFT1fxNfAkvCwKqbkyK9yZU0uyEQjN6KyVSpQ/fVLar6fXo6SrJ0IJJdrOVJ+naJH1oUUHhzw==
X-Received: by 2002:a05:600c:1e07:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43d436c7be6mr33579945e9.0.1742399964859;
        Wed, 19 Mar 2025 08:59:24 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d440ed5e0sm22136525e9.37.2025.03.19.08.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 08:59:24 -0700 (PDT)
Message-ID: <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
Date: Wed, 19 Mar 2025 15:59:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, lgirdwood@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, perex@perex.cz, tiwai@suse.com,
 dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/03/2025 10:01, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 09:16:35AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On some platforms to minimise pop and click during switching between
>> CTIA and OMTP headset an additional HiFi Switch is used. Most common
>> case is that this switch is switched on by default, but on some
>> platforms this needs a regulator enable.
> 
> Is this regulator supplying the codec or some external component? In the
> latter case it's likely that it should not be a part of WCD bindings.

This is regulator powering a mux that is driven by gpio which is part of 
codec binding. So I would assume this will fall into the codec.

Where would we fit this if not part of codec?

Unless we mark this regulator as always on.

--srini
> 
>> This patch adds required bindings to add such regulator.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,wcd93xx-common.yaml        | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> index f78ba148ad25..fa00570caf24 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
>> @@ -26,6 +26,10 @@ properties:
>>     vdd-mic-bias-supply:
>>       description: A reference to the 3.8V mic bias supply
>>   
>> +  vdd-hp-switch-supply:
>> +    description: A reference to the audio switch supply
>> +      for switching CTIA/OMTP Headset
>> +
>>     qcom,tx-device:
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       description: A reference to Soundwire tx device phandle
>> -- 
>> 2.39.5
>>
> 

