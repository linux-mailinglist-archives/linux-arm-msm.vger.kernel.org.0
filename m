Return-Path: <linux-arm-msm+bounces-24325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B291861B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8058C281F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BAD18E757;
	Wed, 26 Jun 2024 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BisweaEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECF18C359
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416548; cv=none; b=YlVvQuAguaq3z5YN+KogkL2yNYVCSQ5RURbdJQ9kxvKDMarNp3nrtEDKmIms+8EOAg3AH8STPPIxAb/8aE+tNqHuj3vUrd84UaXC7o2nC3U0rhhOtMwWLlq5HMDfDG9fOidkQUkVCih04jcOH5fbtMc1xcth31B1vy+9Lca5kIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416548; c=relaxed/simple;
	bh=XRowxFSkrysMUs9XyN0Exv9sB2feFYzAvaPvT89v0go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqhh2ZZJxVYCZqOjuv7pB+8pKzWpkdqRY32lRzBdPeJh475rPfed/HeDiRczJOpWUpgiztr+qggCfgqri9acMQYlSYDjykRLH7OW63B2waCKkJWKjtU9tNqS9ZGZRRx7u+e3+g5Vg/cs6LcWsvgvCCIGBJxFensjYXmmBD5LGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BisweaEA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso581202a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719416543; x=1720021343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz4Tt/Ks/Na1pwZwDOP6Ac4gN9u4dueDw72ykvSRJ3c=;
        b=BisweaEAztHt03VNrk88j42Xe8Y50NPt+yWiUoVLjRz9u2gLcEVyquP5U5YRDGMzDY
         6GflCg1jcFoCJIQ8CzeLdvIVvlfDOFRH9x5wp5DzcqtNBRR7jBIliaZsER0FfM/y9Ffe
         UMLDqKuujBu11mq1E3E4q1Q3N1JXcCeTAV0+ayJcaEP8RjMG0mz9dzSAbzAFSRxnQklp
         rSyVpEC0RT8E0G/Lyi3qKT06prUp5lt57MOgkGYgCa66y7SJjcAv23BqYEgbVvjUr5lP
         4i5wA5NF9G28fmEy6kpgTILi7J+7u58PFwkfsJWcrspGjZTDiHZn1IWyA9CEcng+Ibew
         CzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416543; x=1720021343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz4Tt/Ks/Na1pwZwDOP6Ac4gN9u4dueDw72ykvSRJ3c=;
        b=bxWLgq98okQffXpz2ID7vgn8haBpFJ7pYdSYroSCbR3llGDgvzbSnieJSFWV5Lsbcr
         Fmr1d+Mpc4+oHU/v93QvjeFn9o22B8uUSFZ1I4ZdvgVN6hGUwotzOw7jkMI35mXQcskg
         VMdqedOXCmyHX7HM0IVXhDK+WSYPMCl49NXTkQClSwzVKNMSxGGeVluyZIB5hVysP89w
         Z9PKewYQq5pfc8yySrskirAxigcL5IuxbAPeKTAZKc3IaeH03zzE0KJe3JNHF+6Njuak
         1PXAIbhbHjkHEyd/VB1g3OxvSuMwWp2JKV366NcML0/fIY+CJT8ALrlKJ5xQ5U88wFaM
         BCCA==
X-Gm-Message-State: AOJu0Yz2kVBllaXzLdrSPSfcRznrWUPbu2q7BGrbQOPLERg43Q3bYZuI
	b28aaV4Cvml0ynYDTF/55aC/wSSzpsRq6Tu0FOuxjXxAhAIXLFB7BaQwflOCyXY=
X-Google-Smtp-Source: AGHT+IFZgo0qywXUrbYFvzsX7j5NG3UwUTK5YD3F6ShNKbFTpBUUBLsG6g1DyGpehW77M6FgbbubwA==
X-Received: by 2002:aa7:cb50:0:b0:57d:4b56:da11 with SMTP id 4fb4d7f45d1cf-57d4b56da8emr10735227a12.11.1719416543275;
        Wed, 26 Jun 2024 08:42:23 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da2b5sm7362066a12.6.2024.06.26.08.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:42:22 -0700 (PDT)
Message-ID: <45c95955-51a7-489f-993e-252e8bd63dbd@linaro.org>
Date: Wed, 26 Jun 2024 17:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdx75: update reserved memory
 regions for mpss
To: Naina Mehta <quic_nainmeht@quicinc.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
 <20240618131342.103995-4-quic_nainmeht@quicinc.com>
 <e5b7a888-8ca3-463a-a2de-cf719e58d7a0@linaro.org>
 <c186bd2e-a132-fbe6-2212-dcdb93a6c14a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <c186bd2e-a132-fbe6-2212-dcdb93a6c14a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 1:21 PM, Naina Mehta wrote:
> 
> 
> On 6/18/2024 7:08 PM, Konrad Dybcio wrote:
>>
>>
>> On 6/18/24 15:13, Naina Mehta wrote:
>>> Rename qdss@88800000 memory region as qlink_logging memory region
>>> and add qdss_mem memory region at address of 0x88500000.
>>> Split mpss_dsmharq_mem region into 2 separate regions and
>>> reduce the size of mpssadsp_mem region.
>>>
>>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>>> ---
>>
>> Alright, we're getting somewhere. The commit message should however motivate
>> why such changes are necessary. For all we know, the splitting in two is
>> currently done for no reason, as qdss_mem and qlink_logging_mem are contiguous
>> - does the firmware have some expectations about them being separate?
>>
> 
> Since different DSM region size is required for different modem firmware, mpss_dsmharq_mem region being split into 2 separate regions.
> This would provide the flexibility to remove the region which is
> not required for a particular platform.
> qlink_logging is being added at the memory region at the address of
> 0x88800000 as the region is being used by modem firmware.

Ok, now put that in the commit message :)

And I suppose:

"This would provide the flexibility to remove the region which is not
required for a particular platform." - but you still pass both to the
remoteproc in patch 4. Are these regions mutually exclusive?

Konrad

