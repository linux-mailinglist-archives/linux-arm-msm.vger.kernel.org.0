Return-Path: <linux-arm-msm+bounces-50520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE1A54BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDF043B3B17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68E20E01D;
	Thu,  6 Mar 2025 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDGW3yh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AC20E33B
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266948; cv=none; b=TQ8BPqbzMBBEetUT4MEqFg0nX8QzHfoarUTkitXSRuLgsxELQ3HXNAucvPEAJh00u8paIkeOxHqFus/jU9wtRFck7Wp1Z6vgzJthbuvg1nXBibIHE6KKmt9ITLv7Kc9yTTt7xyxtbtw8qtD5cpGehpd2XpOdQKJXe6IByiciZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266948; c=relaxed/simple;
	bh=iCLwruORYDxCtsWv+hcP88C3gvbW1fbzcoS5L/5ij9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LN5UJH8eyYkTbVhrsbo2acwse7REdZ1aqTVx48eeSZVoX9d7bRMBKCEG2uWVAhp3Ll58pDR9+HYoJTmsHlxpk6MX1UYjG4zp48V+fgU+9Sap1p049Z12hVcvDszPsrRZnjS3knafX/08MHVjMxkSyut0vFC99L+syZ0SSzgIM6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDGW3yh7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso132392466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 05:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741266944; x=1741871744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odFKhUpOD0oBGtCw0Lzrsic1VmySccICXYvC2207ePM=;
        b=LDGW3yh7Szy45/wsV/IUGCy955wA2YdwhlkObqZXBdaFySMt+6CxeTpxiKstDcZCZI
         AY3D+v9gSjK9h80eTPYUtwL9wLJUKC9/LFX0w/I6Zj7HO/1ia3R+Etrw4PCbBP0Bfm4c
         +ymNGYklrLlgrqYXIaLJqwba2yFWTMaSfks0mUIDPLqgj/8t2nSt+Fr9bN01T0J5/3f6
         g0dpGSF1Sc8BqUkmP2Fixw/mvwGixhdZmm7MJ9sQMGV/LITE3mCm5wBcTiJxMu3AsLUE
         xu72cyYprwaDj5bAXMvh2QyzBEMEftvj3cWObJai4GBLchItmKjt2/2DMfUc5S/e6D2g
         V1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266944; x=1741871744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odFKhUpOD0oBGtCw0Lzrsic1VmySccICXYvC2207ePM=;
        b=kC6NmMPOy/qj/WcZCztuaKkBckr7twATUnUNRq6IHIPxKoiffRzmFKppcJUE8UnJAZ
         QvYNUOCBduyJhU0dcVeT5U00kR1bD9gF0Qjic8RlGRblbB8/vApykgSPZM69e+AGNxDA
         D0dSdpom/iiipBEGS/bD7vInCe1jclzdJRmsyf/T6iAHX7eg6q3xoO87wmo2o/Ur+NO7
         8QpEchIdKt+Tp8rOGlElNQiQHdMDSNgYDDajgTPZOsg9gtpnJEBkyTUK0cwLLFwCS9ve
         VIDVkDOqH+6elCS5gLQLgv9bF1jKmoOLXBeg0SkTuhrBlSmKrAeHsfgPdxGKefApr6t2
         m8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Vb0jvBgqu/Hg0D+XylsZ8E8uyKEOiqUsOseGTwaCFMaQdTdZXjMLUYALfK577bviaKcam3KssO4avqbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt82sRsku52vf/ajymH7MOAdWj41Rs+Myk9r50MZBIl8rXAVdY
	RYa9oLthhlOInlDXDMEpFK2OuXn2gJlYpK5TxYW3wht6z6EHxB9y0eFT3WdxiRVPbVTn0cc8Ws7
	s
X-Gm-Gg: ASbGncvnv+D9MqeLAyUn0BiMqmoG7kK4DVbeOuP/uuL6zSgIGWvGkreuW7ayWw1xkBj
	Rt6RWK5zLeyXIKghvTuBQlbwvCIOWP4WI0UZrRQD/LQOxKyKdBxvhAXT6kjEC2yQVcebUTUFggt
	28jUANBwWJspvWlQfRrstoxoNoPiVfmFWpH419jIxFUtAT3iP5r7S5sYUIpOK22iRmjoYrxk/1K
	Atu4JbBVT7KcoFXWXumcjupob9i0GtOU/4mbCeO/eFlu5Ky4ACzhSJzUi+yMfFFtu3RV9Zv1eSu
	yPpRBjU6UEMsSp2RnQ8O9VnBNSmo6TNbcFU7Jz3CqMqUONOcMLfc24LMGvGa+Ts=
X-Google-Smtp-Source: AGHT+IHMPmbTge6zDjHa6859H1+k4sdDZ/gMAiX6FUPawQ8PGqqQPLxpyvCVwbjTBKNQwMK3CnzSHA==
X-Received: by 2002:a17:907:72d6:b0:ac1:daba:c6c with SMTP id a640c23a62f3a-ac20d8bf12dmr589079966b.24.1741266944582;
        Thu, 06 Mar 2025 05:15:44 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac2394fd578sm94632366b.81.2025.03.06.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:15:44 -0800 (PST)
Message-ID: <9b4fd423-a463-4d50-a597-dbda532b6b61@linaro.org>
Date: Thu, 6 Mar 2025 13:15:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: Caleb Connolly <caleb.connolly@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/03/2025 22:17, Caleb Connolly wrote:
> Hi Srini,
> 
> On 3/4/25 10:57, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
>> both recording and playback. These patches fix issues by
>> 1. Adjusting the fragment size that dsp can service.
>> 2. schedule available playback buffers in time for dsp to not hit 
>> under runs
>> 3. remove some of the manual calculations done to get hardware pointer.
>>
>> With these patches, am able to see Audio quality improvements.
>>
>> Any testing would be appreciated.
> 
> This totally breaks audio on SDM845, and often results in a hard-crash 
> to crashdump mode on my OnePlus 6.

Its not possible.. as SDM845 is Elite DSP architecture, all of these 
patches changes are very specific to Audioreach DSP architecture.

Could you please share the crash logs if you have any. It highly likely 
that something else is triggering the hard-crash that you reported.

thanks,
Srini
> 
> Unfortunately I can't get UART logs right now. But I imagine this is 
> reproducible on RB3.
> 
> Kind regards,
>>
>> thanks,
>> Srini
>>
>> Changes since v2:
>>     - dropped patch which is causing regression with pluseaudio.
>>     - setup period sizes only for capture path
>>     - fix underruns/overruns in dsp pipelines.
>>     - add fixes tag
>>     - add patch to fix buffer alignment
>>
>> Changes since v1:
>>     - added new patches to fix the fragment size, pointer
>>       calculations
>>     - updated to schedule only available buffers.
>>
>> Srinivas Kandagatla (6):
>>    ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
>>    ASoC: q6apm: add q6apm_get_hw_pointer helper
>>    ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
>>    ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
>>    ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
>>    ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
>>
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
>>   sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
>>   sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
>>   3 files changed, 53 insertions(+), 31 deletions(-)
>>
> 

