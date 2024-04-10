Return-Path: <linux-arm-msm+bounces-17114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33889FFAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE951C216AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 18:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D764A1802BF;
	Wed, 10 Apr 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDSA4vJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05F1802A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712773503; cv=none; b=pwoXlkqBcUeVH3nfpHgKmvsQqYxEv6uY5p/XLszcYpurcqRH/qDvK4aKwMq68dPLNjbaNmmwxniPH2pGTbQGHEJOe+d3aNRIlupR6jZl20YSifDyMwEGCTGfWfX2lIhKnjU5RwNOpO9t2gXUCQH7IIesyxc4UKkmNXpn1GpfDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712773503; c=relaxed/simple;
	bh=+Ct4X0tI1ng1fVCdDgz1bpL8NF6sg+gCDiBH35XT1aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqG5FBf9R5kMd5Xm5LnkLFgFeMFRUhA1n5GA2XEO1sj+VsWtNZ5F/SFFUgDrNCSY4AItIr8t1LFZnbrQlSdQN6OdIGieA2xXRUOI1ZAPBoEB0EPaCWSHHkUGUKZmNrcPMpf0QDeuiREO9Fhmh9vMolvsKRHDBENP1cbcXDS8oP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDSA4vJO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d04fc04bso10917985e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712773499; x=1713378299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7cDQX1E7JHBxDHMRv3T+Nrz0RpKwP8cLHQVWQ/O5c8=;
        b=DDSA4vJOCwc9rd9+azVwGTE8xAtbDT6x6lWX+dkj/URSmThMg8nEV3l7ULj/SCxR5S
         qFyuhiIZwjRxaO02doNWPM7yQcnbJZ0nSZ6kvjSxL1rdGa92lmJMB0dKJ61lhTDbq/1W
         vjB39DjbPfmotuyMvdn92zxfEXBR14g806Dbw6oQRT1JzsWcaDisAZugAl6ZCulP53ss
         F48QGd9eM23d5pVRKe+/H20P/O1oFcDSJhD6fcLNuHN9925w6ZXGpIj/EdrkYIpWehXE
         fCznn/aZoOy9M+X0tzz/Yn6nxMg9FUAzgctDXCMDIM5wXx7pTpVSo6xB7OhRWh+TCktb
         tsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712773499; x=1713378299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7cDQX1E7JHBxDHMRv3T+Nrz0RpKwP8cLHQVWQ/O5c8=;
        b=oRMQjp8IYfZKooMHtk+9ALnqxuGck6MtGaw4HWt7TSIGcKI8uAPA4C8Jo3aTRfkFbY
         HmJNh8AGNEGpW6ghxyGf3c7T+T3f+Jkh8FVzMnT1O6Td5IirTSqqZqSa6VjzXjcOLRcQ
         znObIyFgqxPDgRcft65BlvK2QW0IaGZcb+s5o6+hsyhd+UhxoA6Umfl1cW25WtBF0x6J
         wVNjG4aPBRF3KpGolgtSuq/lPciiDIKsUuYj9aVtRwOv+ha/55xKn1b+J1OhSWmaewgk
         8hpFqs6DVCYG7vXQh/eW36HR/PZhZKobqW0OqIjIe1vKLlUU2RrgUrVI94zEt8szfcZD
         /qSw==
X-Gm-Message-State: AOJu0YwgZaPP/SxxXoV0Bjcp72lloLKhaVrDFWg5tlcnRzLXFD19+A+Y
	HXqt7fg+szqB0V0y9n00684GaQ+MYtjVQFDk7HxbvezXt9BPvuonG+lXIBT+39c=
X-Google-Smtp-Source: AGHT+IHHsorZM374DGhCZj27rHHW+mrIzUul6dvnT3mn8jRujeEik7hYsj3u28RfHUS3/Q/NeasJhQ==
X-Received: by 2002:a05:6512:3c81:b0:515:a9d5:aab6 with SMTP id h1-20020a0565123c8100b00515a9d5aab6mr3666969lfv.18.1712773498951;
        Wed, 10 Apr 2024 11:24:58 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y5-20020ac24465000000b00516d4d27c9bsm1862973lfl.102.2024.04.10.11.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:24:58 -0700 (PDT)
Message-ID: <3365d84a-1b1d-4b1d-8be5-6d8d1039e6b9@linaro.org>
Date: Wed, 10 Apr 2024 20:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND
 region
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240329-llcc-broadcast-and-v4-0-107c76fd8ceb@quicinc.com>
 <20240329-llcc-broadcast-and-v4-2-107c76fd8ceb@quicinc.com>
 <d6b0f9d2-a489-4c0e-9c77-0e3eab49d3cb@linaro.org>
 <13ccc36a-c3cc-469a-ae0b-71fd0d24bf63@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <13ccc36a-c3cc-469a-ae0b-71fd0d24bf63@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 21:34, Unnathi Chalicheemala wrote:
> On 3/30/2024 4:46 AM, Krzysztof Kozlowski wrote:
>> On 29/03/2024 22:53, Unnathi Chalicheemala wrote:
>>> Define new regmap structure for Broadcast_AND region and initialize
>>> this regmap when HW block version is greater than 4.1, otherwise
>>> initialize as a NULL pointer for backwards compatibility.
>>>
>>
>>> +	struct regmap *regmap;
>>>   	u32 act_ctrl_reg;
>>>   	u32 act_clear_reg;
>>>   	u32 status_reg;
>>> @@ -849,7 +850,8 @@ static int llcc_update_act_ctrl(u32 sid,
>>>   		return ret;
>>>   
>>>   	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
>>> -		ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
>>> +		regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap;
>>> +		ret = regmap_read_poll_timeout(regmap, status_reg,
>>>   				      slice_status, (slice_status & ACT_COMPLETE),
>>>   				      0, LLCC_STATUS_READ_DELAY);
>>>   		if (ret)
>>> @@ -1284,6 +1286,16 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>>   
>>>   	drv_data->version = version;
>>>   
>>> +	/* Applicable only when drv_data->version >= 4.1 */
>>> +	drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
>>> +	if (IS_ERR(drv_data->bcast_and_regmap)) {
>>
>> I am pretty sure this breaks all users. Can you please explain how do
>> you maintain ABI and that IS_ERR() is applied only for version >= 4.1?
>>
>> Best regards,
>> Krzysztof
>>
> IS_ERR() check is done for all versions.
> If new register isn't defined in DT(for version < 4.1) it simply sets bcast_and_regmap to NULL.
> Otherwise, for version >= 4.1, it goes to err(in the case bcast_and_regmap isn't set properly).

b4 shazam <this series>

booting on 8250, I get:

[    2.794850] qcom-llcc 9200000.system-cache-controller: invalid resource (null)

which comes from lib/devres.c : __devm_ioremap_resource()

Now, this is gonna get you an angry Johan(+CC) response when he sees this land in
the next release. Perhaps, this warning could either be removed from libdevres,
or some sort of an _optional variant that doesn't print it could be introduced.

Konrad

