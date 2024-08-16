Return-Path: <linux-arm-msm+bounces-28781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 208049544F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91871F239A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B76813C673;
	Fri, 16 Aug 2024 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBjZURWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463713DBB7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723798764; cv=none; b=mWVF8qk0S6eR+U+VZjf9k4AIHiocCGvEJJ5E7NNs3ytV7cXHEZIWiTQdeZYRBU/6ymAkifZsy9KFBVmGRGvpGrzGhDknyp0mQkqEFN0fFDvZm4ASZNCnV/Fo0Hp7IHpyf39EdAymTlJnJ3ac81E30+GI3BfqUD4Gg6nC574Mgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723798764; c=relaxed/simple;
	bh=LfWhagoS1pzhxx1zEMgk9yX693yvb5P3agLUzpS+cLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ry3VXlQTC4NjaQflinMAjy+m+vpy0uH8/5PcnEDQKbGg48NOCxcOL/wPoEiXTF2rpxcAAQvCPv6xc+8Am7FedGDHjSzuCyCT2zIhPjZpcGBb2+j2aQq4i2kAqzBtWpMriqvioV3T0Prm5hUIlk9fKosF9CA68+l2lPCtcy9hZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBjZURWF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36d2a601c31so922968f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723798761; x=1724403561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AmXrAopEZ7cvd5ZME2fjOsPUxShdExph5aHyt4+s1I=;
        b=IBjZURWFen0PSDsziWXzQe8D3ubokxRZiHB7Ohv1u9l8Nv4ZFeBrwHZjD9bP47Jy8w
         KMEGUTu4MkfR8l8k9HrA2u2eDFrPYbaO5nlgS3IOV/ercMrcNSElMNbDxnoV91phoO8x
         A/iMaLRTXZFlfPIFeL/e6nPfruQYSVcACBVvFOsyVIi0rH0SqAWCeCrQJ/nxSLJRxM/M
         hrmh/wsT3Ze1UlstU2LtySJX/fT8RaJCNM74dHEI2y3L0Rlijo+IT9M0bEGKv9T9MQP5
         aYAkvwaNJziigQc49sFSRgiI/9DHOZ1DgA6EO4WVzSfDFwRc/xCVGebNYyLleuHUH00k
         i1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723798761; x=1724403561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AmXrAopEZ7cvd5ZME2fjOsPUxShdExph5aHyt4+s1I=;
        b=qZqKo+w6zu25x0sjj5ctoGeSyYDZmKd4hixMNrWiHXnRXfo8iTBOMcfA62w0NF6I9+
         T45ih4vr+NogFW2/cauBFUntBTr9thL2fBNxSmBohSdcjQve54Voc1G4pYEsbQt6bHpM
         hhkU4XpIlRLOC/swsS68xVcMAdkvO0GCBzU0BpxWg4xt3VyHYPXvH04Ay5z/1J/24gqh
         RpRt4dpl3RZbTryDNIQo0VmLon5XMg8x8TNPANOJsF4My/hzZVKUFbvs0rZQ7Cym21mu
         xRu+sMyk153noyHnRyEa2X9wsyskRkqJdEci3qkc1V5y7xPeiSDXx3i0SgJ/clii5fwC
         ewew==
X-Forwarded-Encrypted: i=1; AJvYcCXWQtTxwqQ7ygOGQ6qXFjpbDOE9YmdKJ95cmibShhhV6T0aeZmAuw7EfWQOmVwwWDONH9brDEhWS9nuOJaMl+iFX5gy0EGbm9xRASfj6w==
X-Gm-Message-State: AOJu0YwVgV1pOXVVGzou3hGGHHiQTlqFngZ/7Yy4ZYDuQTgxxsphmeu/
	iI9DK1TafCWCJUVK7ZnDRSiVL3C95sNrv31lQXpf1j4AiY7l1YjAYxi8vkb9ZiM=
X-Google-Smtp-Source: AGHT+IHVCiR8NTXQ5hS9+VCoex9bI3QB+qewq7KwuHB78ooUCG5gvzIThlb20x3W7WtZMN1AJE5+pQ==
X-Received: by 2002:adf:b307:0:b0:371:8c76:4ecc with SMTP id ffacd0b85a97d-371946a358cmr1367713f8f.46.1723798760507;
        Fri, 16 Aug 2024 01:59:20 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed658d32sm16997105e9.25.2024.08.16.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:59:20 -0700 (PDT)
Message-ID: <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
Date: Fri, 16 Aug 2024 09:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
 <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
 <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2024 22:22, Dmitry Baryshkov wrote:
> On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> On August 15, 2024 11:49:03 PM GMT+07:00, srinivas.kandagatla@linaro.org wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
>>> platforms, they do not have a reliable way to get the codec version
>> >from core_id registers.
> 
> I wrote that it looked good, but maybe you can also describe, why core_id registers are not reliable? Are they just not present on those platforms or is there any other issue?
> 
Sure, the comment is correct because the registers are available to read 
however the values of those registers are not fit for dynamically 
detecting the version, like what we do in the driver.

one of the reasons is that the codec evolved over time, I think starting 
from v2 it has values made more sense to determine the version info from 
these registers. This is also evident in the current code.


Let me add this detail the commit log and send a v2.

--srini
> 
>>>
>>> Add the version info into of_data, so that it does not need to use
>>> core_id registers to get version number.
>>>
>>> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
>>> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
>>> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
>>
>> Which commit introduced the issue? I think having just the first tag is enough.
>>
>> LGTM otherwise.
>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>> sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
>>> index 8454193ed22a..e95d1f29ef18 100644
>>> --- a/sound/soc/codecs/lpass-va-macro.c
>>> +++ b/sound/soc/codecs/lpass-va-macro.c
>>> @@ -228,11 +228,13 @@ struct va_macro {
>>> struct va_macro_data {
>>> 	bool has_swr_master;
>>> 	bool has_npl_clk;
>>> +	int version;
>>> };
>>>
>>> static const struct va_macro_data sm8250_va_data = {
>>> 	.has_swr_master = false,
>>> 	.has_npl_clk = false,
>>> +	.version = LPASS_CODEC_VERSION_1_0,
>>> };
>>>
>>> static const struct va_macro_data sm8450_va_data = {
>>> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
>>> 			goto err_npl;
>>> 	}
>>>
>>> -	va_macro_set_lpass_codec_version(va);
>>> +	/**
>>> +	 * old version of codecs do not have a reliable way to determine the
>>> +	 * version from registers, get them from soc specific data
>>> +	 */
>>> +	if (data->version)
>>> +		lpass_macro_set_codec_version(data->version);
>>> +	else /* read version from register */
>>> +		va_macro_set_lpass_codec_version(va);
>>>
>>> 	if (va->has_swr_master) {
>>> 		/* Set default CLK div to 1 */
>>
>>
> 
> 

