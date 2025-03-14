Return-Path: <linux-arm-msm+bounces-51451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA1A61839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A671316B81A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B04204598;
	Fri, 14 Mar 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoLqgRv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D32040B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974011; cv=none; b=WvhB9LFSrPB8TGJIXpjSPJiTTcSqRXSQ83XYYIQEiq2K6kFs7AHg0cBzfZXfixKgtykJIgYLUH0SbscoJrmNDHogIApIhGLqxkiy9OHWCgsATdl6BSkwiTnpXwDU5tKRXbA2uhoeZW8MbK4mxCpN876EgKrPFggvAqcfy+Ltlgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974011; c=relaxed/simple;
	bh=+y5PhC4XzO/VnRIwG5rJiSt/p4JA+JB3Z4/wrDzAWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNUiqmLY12hcf8P2q2GM+0CIq6VtuxNtxGQHNg+sSvwKF2sh5nz1fMk8S7D/HbMNXCwmT1HblMrAUMKqBphT1QYq68cYTy/yF+xqsDGhdyNVC+6fv9M3L3N/mkmXwQYZqiql6vCBXsXWW781sjvXvLd3U/s5CcTJ9RHPzuBYy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xoLqgRv4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39143200ddaso1547466f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974008; x=1742578808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68pP/H0ssSIUIb0wMm11zyV+DWPe8FTOSDazoy8xF8o=;
        b=xoLqgRv43DEFE8NTmiEA/MhNCCgK6xJqIZ3RbqVbOWKDrcK55lgBeXNbDFV186sd8a
         ooWc/jhZWUmFCkdixADFP2aN+qS7JhtkepiKIgBFFVLEuvMVvmksWIo8wjaJ6Y+vV8t/
         PqDafPH/8ACk3gP3HYiHUzfHhDI3RKd2wDPfvfcTxZeEA4pGGDPkAI1KaqV1MLdHGKRd
         N4PvT7Js1m7EH0Q+zVa7PniE045AdMPY2LWA/DIjpsrzbPzjaQsuzD1af1Qk0Gmk02DO
         N07gsTE9JyqTJDPH8ErRsJXbYuW8aBEbWBTmyZZCod1c74M0ggMLHXg11DezBikId/g8
         x0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974008; x=1742578808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68pP/H0ssSIUIb0wMm11zyV+DWPe8FTOSDazoy8xF8o=;
        b=T1XGa2D56aQAE2ie2Fwkf6hHvQaKPJGbFHtl3BNaNLbkc0gteWwq9n3ai2BzAtB7mc
         8m4nUYfz+jYF6qpeH4Mt+/2yl/euIdGgd3ZaEzPXOdcDM0PPJ/caU6uB2xC5AFcZbWee
         bCBvY/tSGKaZLWvArqLOIblZ7iyrZZ55D6faM1cUL8dUDF8OXJO3TdCM0moAP0TxM/Sd
         XjnJObH9TmzOD19heTuqfEG3t3CdRrZ4TXqVBBXIV1a5keX3GMGlnvIkQOt7Ufls/PW+
         NoePVtFy278wCCQ4NM7HMtQAWZSXCZUABDbmSexb837DH/GqeLCa5SdH5CQamLn/HXzQ
         lu3w==
X-Forwarded-Encrypted: i=1; AJvYcCW+XnT85qHEBtpCF1JgFToaPIG14SPSzngMYXqcSjctxnvpJCxnE45RhMIQKplHbfd+EvrcoQecnPDy6pxg@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTcRgcPoPRrD4cGZqaP7TWuWIA0dbza025lKRNEMRcngoJoUi
	I9+gVCq9A6lslFagbRhgn9wvuhbDipJHBNKifX4C7qpcqffbaV5yQUwibRTEQUc=
X-Gm-Gg: ASbGncu53sDiu+nOV1hWuiccsDtHOfykUgQAyVj4FXcaQLdNicRKVE6/DNhJdKMYxhD
	r29vSUx0726MRyjsb9shQOolbg7uWn7ektvFq+dUpraAHIbSRRUA9FfEpTDIJmVdXeitizHP4Hl
	Fid1cSzr+seR4ULOsmh5JDt1UEgLedeJxkGuLjhoSSsw4SVCu2LMrNSPpG6EX8o31lb3OD093QG
	2Y9SugKrW2cvxaIlGTKCLFGIMpKA2AF8jyTCmKQYMKWAbntuH/Zal5C4aobzZMrYhMkCoeRWTxF
	sXMw24VF0lxX1/37FudLsrhF5KDvkyKPkOeMXjNAdRBsgYjPa0vlDouD4MWhMjQ=
X-Google-Smtp-Source: AGHT+IH78OxZy3COSxNQ/R2QpNx/WSsG5NmsZ858z5YdVxy8Zi13E8ydSZy8fnTU59kmbAhJ0dXxlQ==
X-Received: by 2002:adf:a39b:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3975de869d5mr3233289f8f.41.1741974007940;
        Fri, 14 Mar 2025 10:40:07 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm6339791f8f.60.2025.03.14.10.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:40:07 -0700 (PDT)
Message-ID: <9e42378b-b9b6-47f9-a7f5-0e003afc3ebb@linaro.org>
Date: Fri, 14 Mar 2025 17:40:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and
 buffer alignment.
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
 <20250314143220.6215-5-srinivas.kandagatla@linaro.org>
 <Z9Rdc-EWhEH8IQPu@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z9Rdc-EWhEH8IQPu@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/03/2025 16:46, Johan Hovold wrote:
> On Fri, Mar 14, 2025 at 02:32:19PM +0000, Srinivas Kandagatla wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> DSP expects the periods to be aligned to fragment sizes, currently
>> setting up to hw constriants on periods bytes is not going to work
>> correctly as we can endup with periods sizes aligned to 32 bytes however
>> not aligned to fragment size.
>>
>> Update the constriants to use fragment size, and also set at step of
>> 10ms for period size to accommodate DSP requirements of 10ms latency.
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> 
> For all of the patches, if the intention is that they should be
> backported to stable they should have a CC stable tag here.

Ideally yes. It would nice to get these back ported to stable.
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index 90cb24947f31..a636f9280645 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -231,7 +231,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>   	cfg.bit_width = prtd->bits_per_sample;
>>   	cfg.fmt = SND_AUDIOCODEC_PCM;
>>   	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
>> -
> 
> nit: unrelated change
Fixed in v5.

--srini
> 
>>   	if (prtd->state) {
>>   		/* clear the previous setup if any  */
>>   		q6apm_graph_stop(prtd->graph);
> 
> Johan

