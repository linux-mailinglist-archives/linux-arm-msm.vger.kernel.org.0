Return-Path: <linux-arm-msm+bounces-24733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F991CD53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DBC61C20FE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96789811FF;
	Sat, 29 Jun 2024 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjFkMWjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B745BEF
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719668554; cv=none; b=G28M+5MfomqW+5xyZtTB7Mm1x6pJWJYdz6Br7Ntp2wPvI2oDN/R3Wkr/HXHAIBr4H+r3caTKGe0UOZVcTSI1MDpT1S+9WH9W3Yk6SVI2wrCBhfwm/LMqUcnkO7aoKqJ2KqddnfwA/q2fpiPDnBGi9JnMigDCBON8bvC+lEM0W+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719668554; c=relaxed/simple;
	bh=cXPfd0fEa4S+VFemAZ2d5w+WNgzF42fOneK5lp8jG9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+1uQjqnoU3cqU3UoYUrm5sKeujz4xYFuPqV4KkJm1/J23e6Ua9rQNO2T3FVH7ObJRocFEyi7dRi5QI4wZiTUYVZh9QzmhqF80+BlmMueLiCB2rav3gFfoCoaj9gDWi0MxWs3bJhx02cEc7VNj9b+VQNfnbrKTgb727wMCOX1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjFkMWjV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a70c0349b64so197217066b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719668550; x=1720273350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=89hU81MffUVomnG27nax1DyzxTndt9qlamfVFczEjJY=;
        b=FjFkMWjV/93glYTIps7HTbeLGOaW+juhf798WQzC0Fb2u3KqShgC77qSgF5zgjYobv
         2a/Q71mcJGEQs9tZtJaEV78O47VApwYHV+T0J2s6YdNaQPSfWEX8SaaNxj5OKpAZZak8
         DJ9kpalXAirzQRY4RwYvRC2EDOloyF5THofe6uUPPZH6fRZFlui6wXf4vklNlyI8De46
         djj1YjrtQsnMhDpW20BDWk4nReF7FT92VbsfqvKNph6VgYiJDAKcEB4tdTkBKK3cYpjo
         fjGW1+fiB5ys869sbM/K5rLx5ZMAmsKxeEKsm+B0vSE/jFW690oa599jAqv5DNeIeRJM
         NXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719668550; x=1720273350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89hU81MffUVomnG27nax1DyzxTndt9qlamfVFczEjJY=;
        b=ideuT0UBixqzcoJI5ulnHpbbdBhllu47mQsXGhJ7lNS7SSqUkwc4ZJYJs2j3oQHxhe
         N+BexdnlqtmSX5o7F/BOWgpZFvt1rY9niN3lgTxb2m7ACVEclO6dXoqrldKWntk3vxX3
         v77Am6fgDPK0FCuIEYRmMpzP7cDTyMhKWuaqdrAFgpxrzpKY8sMxlZG21EQK355+C+A+
         S03+oVzndBjAUP0Ge1waxrp2e6wE4QAFAmcugoYSWJfhCpSP9tX35EEc3wMqGM3rLZtQ
         sxdFlU1v8H1ggJixm/xwuvs9zPNUVLwdlFB4AoOxZI+//qbSCORu3d4zh4XduS5yWjWd
         mrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlV30faSYYZSg8248tM96F3Gn5+25CPgfo2zE3yIfZbN90ov21Cd5uLPvCshFFheG91cxe18QlOOIx1bzdIRgpjFT++IeguS9zqfxjKg==
X-Gm-Message-State: AOJu0YzHMILXGX+2u/bcfDZoExBHBUki79UmP5I7StHb21CAIcBGk9KP
	TX9hw62u2kv9iJeaAY179TtZL4NmQtccz/pnsDhj2zkmtv0SdYaP35BJ9+qLTJ4=
X-Google-Smtp-Source: AGHT+IGkI4CdDPFLm5hkOo2eXhclVzqaDP/BK686i7v6/fhp22g57DOv+8mTR622ezzn20kugpZ60g==
X-Received: by 2002:a17:906:c0c7:b0:a5a:6bde:c3fb with SMTP id a640c23a62f3a-a751441e94amr70454766b.28.1719668549740;
        Sat, 29 Jun 2024 06:42:29 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065187sm165453966b.139.2024.06.29.06.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:42:29 -0700 (PDT)
Message-ID: <a392f063-3914-4fff-969f-1b9f6de71241@linaro.org>
Date: Sat, 29 Jun 2024 15:42:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
 <20240628101549127-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240628102726231-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240628102726231-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 7:31 PM, Elliot Berman wrote:
> On Fri, Jun 28, 2024 at 10:24:52AM -0700, Elliot Berman wrote:
>> On Tue, Jun 25, 2024 at 08:28:06PM +0200, Konrad Dybcio wrote:
>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>
>>> Add support for SMEM-based speed binning, which includes getting
>>> "feature code" and "product code" from said source and parsing them
>>> to form something that lets us match OPPs against.
>>>
>>> Due to the product code being ignored in the context of Adreno on
>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---

[...]

>>> +	ret = qcom_smem_get_feature_code(&fcode);
>>> +	if (!ret)
>>> +		*fuse = ADRENO_SKU_ID(fcode);
>>> +	else if (ret != -EOPNOTSUPP)
>>> +		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
>>
>> Probably want to update a6xx_set_supported_hw() error handling to ignore
>> -EOPNOTSUPP or do:
>>
>> 	else /* ret == -EOPNOTSUPP */
>> 		return -ENOENT;
>>
>>
>>
>>> +#endif
>>> +
>>> +	return 0;
>>
>> I noticed that if SMEM isn't enabled and nvmem returns -ENOENT, we still
>> return 0. That could lead to uninitialized access of speedbin in both
>> users of adreno_read_speedbin(). Maybe:
>>
>> 	return ret;
>>
> 
> Ah, I see patch 4 in the series now, but I wonder if we can do something
> better so that this patch works without relying on later patch in
> series?

Looks like rebase mess on my side :/

Rob already picked this up for next.. Guess we could ask really nicely for
a forcepush there?

Konrad

