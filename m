Return-Path: <linux-arm-msm+bounces-24483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED491A952
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4E98B24E37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205B11974FA;
	Thu, 27 Jun 2024 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rp+DlHSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2D195FEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498900; cv=none; b=YAPN7+IQyj+nJRyOYjdkypcGfbslfmHqJntZW7yJfEluCfTglbbb1Lz2O9OYARLJW4aVkgDBy1++26FNZS8yGlXFLiz2XfGbQdkp3ZfgxcriwHE9gMmj4mVmilwQVfvenuomwk+qW+5JL59AgAmWOXPQ6rInIma8BdAkCmxE/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498900; c=relaxed/simple;
	bh=zguDLaxzEP5ll5x1PQ8QZ4iJg4eLozqPD1M8fbq03jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHIZVx3P/DWltkiSotrmOJdaQYYF9gR5namiBUke9dmK8W10QKY68N+Y5PEfRI31rhFsFB3Z6n1nKl2EgQ8lpAbxRdgsDzshd8apS3uxYpMqjxHNJUHfGA58nx8nL/OGLUrCM7J62/gEUHLQz/ZlMP6SwePbdcwJpQ4freIN5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rp+DlHSg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cd8897c73so7141005e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719498896; x=1720103696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jz1cCr8L4wELlDLV7TgHeFnSV7RSZaDycktjZG7y30g=;
        b=rp+DlHSg/SQW56Nx+dcc1GBJuObNp5wiIgIFznrqeIw/ugSYS+fScZeeIjDEHx2HG1
         f/gY97W0+uII4s+j0ikL0oCyxd+fMB6lUNY4Sej0xJ4qQsJxEsHd+h/1lABXO/FIoaZh
         dUxJbiBBtWEH4m+nOcDrPH8A9wFo0T1P1RJgvAn4dnLUpEevpetuZ5f4Nnpys2jJvqxw
         d4RbpFLzyYY5AbPfyycWY+ZA+sybs/t5j+FJUVxnkMnMj8k5e032G7QhhgnTefoR+2UL
         VJslsR3WxmDDdtQPdJZj168hlOdN/bvZ3CvxUBqTgqrdkOgpphifsgM309TffokhLBrd
         74Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498896; x=1720103696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jz1cCr8L4wELlDLV7TgHeFnSV7RSZaDycktjZG7y30g=;
        b=WXnEwdzj578+e47EGlBt6AU2ry3m9phHe8wNVLmEVezBx7P8vXdQ1RgkIIA4LHXneP
         jJLEmAMpbISF+2EHKoWb6oMrIkaYphbCo46D+P4gmxfAdql7m9D+1n+WVYlkA2ZbQz68
         buE/snOCjQQUnnCwOGUxDEkGB9Fbr0/QQ5P4ElOtKib6jajIMIml/QaeLKFjhPLY5/kQ
         Fm3yY9kUA3B/hgURbS4E/mYCZX6VwFGFW7qsUiyQWxGLW01iJG+wfVtfdWatvIra2Z11
         M6DPIr2zIuMhuaJLa2OmwjxdXlEAG3Rpba3ws6DP7XRVQyw+/C+KR2e8JvnK1qdKke9K
         mvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtUNIrnnRJnw5YU2+Rbi2IkHQtbeguwl4dMlibjv/8QGwkA1rO9XgYbnafF7t4q1JIL4TJxbZwGQmmvw73S3RJn1Lzno8Nkkbh6ucXRA==
X-Gm-Message-State: AOJu0YwmZrNcoLzgrSqwvYVe/lFeq+fBBVEJZ2BBS0vmaDjlEXST9tvW
	FMwSXJcEr4Su+uVmkCQo+w7041mkcOm//mgsp1pHxbD2bUnWN8FRyZ7DyUUr3Rk=
X-Google-Smtp-Source: AGHT+IHgZ1tGepEs1cMlh/0EwKv7vLqC2jcAsTAPu51Jor47f+778HanIWr3gvAKeMkBNwQX0VdDSw==
X-Received: by 2002:ac2:528c:0:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-52ce18350e0mr7717882e87.16.1719498894488;
        Thu, 27 Jun 2024 07:34:54 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4249b132fd1sm81927285e9.0.2024.06.27.07.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:34:53 -0700 (PDT)
Message-ID: <8bfa46a4-b18e-4d6f-856a-acbeca9398bf@linaro.org>
Date: Thu, 27 Jun 2024 15:34:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
 <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2024 14:36, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 12:55:18PM GMT, Srinivas Kandagatla wrote:
>> Add support to parse static master port map information from device tree.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/wsa883x.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
>> index a2e86ef7d18f..43156d39480f 100644
>> --- a/sound/soc/codecs/wsa883x.c
>> +++ b/sound/soc/codecs/wsa883x.c
>> @@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
>>   	wsa883x->sconfig.type = SDW_STREAM_PDM;
>>   
>> +	/**
>> +	 * Port map index starts with 0, however the data port for this codec
>> +	 * are from index 1
>> +	 */
>> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
>> +					WSA883X_MAX_SWR_PORTS))
>> +		dev_info(dev, "Static Port mapping not specified\n");
> 
> dev_info looks strange. It should be either dev_warn or dev_dbg.

dev_dbg should be good in this case!

--srini
> 
>> +
>>   	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>
>> -- 
>> 2.25.1
>>
> 

