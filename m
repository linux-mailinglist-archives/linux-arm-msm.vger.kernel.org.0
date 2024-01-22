Return-Path: <linux-arm-msm+bounces-7768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB9836036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 12:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54371B29346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A237D3A1AF;
	Mon, 22 Jan 2024 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NMe3Ta0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF633A262
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920888; cv=none; b=BwDth1iRTf1n/r7doKYFI0CxU2ReN/HadKkUxCLbcIKZBmDcwyfPISC6T5ZU0IUcK4xidNOGM/z+x9dRcitW2VoHDVQ01q8d3+A2G1Y7Zj0jWf/2KPT00K2eAHMJP/Lt1p/SG9XIUmh3FygzBfsq/UcBjSCraMLt11o+pUrWbjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920888; c=relaxed/simple;
	bh=lTnarq8IAg1XM6GxuzQJXH9sGVYsO2Kix1KmRraYVVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcMUXBWbjoUis3ovCMTrcyEyUsOpbmrkzXp01Kso+Fd7jQhRODxXbf/xpcLvaICA6fHoWomEZSBKvSr1HokooTVHh+GHfoliC5RhcFxyf9xZinpZ1FQSOvRMQohEF1FBR728Xx/8AiwGoJucHZ0vK9rf0NvoeKRBQaHEtcnwHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NMe3Ta0q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a271a28aeb4so310519366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920885; x=1706525685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLlrIj6M5dwt//auJ5YhalkWbvV9fgPK8UYw5u29EOM=;
        b=NMe3Ta0qnOcACRHFFv1ON2x3m5W0Mb+DXhOL0Dc6Ku59X1xmGadMrQLivaDbBYiKYH
         c4eYf7llvz/jrNdUZjos6GqkGRVpNa6+fkE31r5U/9PnSO4xld66Bgf9zUhc337zsDqN
         V1sbevvvOAUI9NNV+priwwfj48gfermQXvvDAFr6YufBvc87rVWKW7AZZbmgPHUX6WcU
         R2rZl2q7NwircYGvgDN7ohPTehtcyhxEXNLB6iDKN+iUtAxHQdVEVCk6hzlW0t+cA2Le
         4EjLd8QNqiX3Ke4iBm/PtK4O5aY9ZX80hIDfNcZmmXH8pstHIhgqfCsXCsKisT3059Jh
         sSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920885; x=1706525685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLlrIj6M5dwt//auJ5YhalkWbvV9fgPK8UYw5u29EOM=;
        b=T+K6IrWyWWo/BQyVAm/38o2a2CImagUdek3x4LZ+tqqZQVdrPAmine+pWuPdvcVL66
         Amd8kyxh7PWs/e+rZtfgx3j6UGTLcIHYW4LqT0DY+YGMGVl8bRMUeKKcylcDLxsxtjzs
         O5N28gUnDs0aqxf5QZ49sjpgrhQthny3wboFpqnlw0QW39IcbQ9/ObHzNbvPu8h533Z7
         UyL7WxL5WN0jD0RcFlhXHKyqItpmDHcWltT71RaJ5Ew8xCHBDEskOZWMbLcZY7cP4WE2
         ilZzguNZv2U6MU4PqY8Axuhzdpv4EJFzqfVN7kGP/hl5zAuyd0qPGB3fxhn5vygJMH5M
         m4ew==
X-Gm-Message-State: AOJu0YweiVUklsD0GKubk9Aj41ZFBOI/XflCM7szcQ/nrS6vZst2948O
	TMkJhZ0FjF3RZmnwTggwJ9QCaCqHnPKnyxh89v+fHUOT7MyK8VrEU7NTBKQGRQNoU2RN/6JKc87
	u
X-Google-Smtp-Source: AGHT+IEeBsyedCcVZMmrmZSF2t9z7xJutp8eKLTW8jvjhH6AzUBWIDCLo+LC1PZzVFNgQNtJS1vJyA==
X-Received: by 2002:a17:907:8dcc:b0:a30:3ba:dae9 with SMTP id tg12-20020a1709078dcc00b00a3003badae9mr1434236ejc.77.1705920885135;
        Mon, 22 Jan 2024 02:54:45 -0800 (PST)
Received: from [192.168.231.132] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906388500b00a28a297d47esm13243272ejd.73.2024.01.22.02.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:54:44 -0800 (PST)
Message-ID: <bef1eaa5-a6e7-466c-b8a7-17537838deb3@linaro.org>
Date: Mon, 22 Jan 2024 11:54:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smp2p: fix all kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20240119032859.4082-1-rdunlap@infradead.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240119032859.4082-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.01.2024 04:28, Randy Dunlap wrote:
> Use the documented notation for nested struct members.
> Add a Returns: comment for qcom_smp2p_intr().
> 
> These changes prevent these kernel-doc warnings:
> 
> smp2p.c:78: warning: Excess struct member 'name' description in 'smp2p_smem_item'
> smp2p.c:78: warning: Excess struct member 'value' description in 'smp2p_smem_item'
> smp2p.c:280: warning: No description found for return value of 'qcom_smp2p_intr'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---

Thanks!

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

