Return-Path: <linux-arm-msm+bounces-21588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8F8FB198
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7751F2362F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42682145B0A;
	Tue,  4 Jun 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="isktdlzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E8144D21
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502386; cv=none; b=W+RnUZ8UECmtk6Zn2XZRQRG2QI/fTpp9AyRxBvLk2tRnu1+YahPfFB19GjQdmJxlL6zN7fMo9nviGoA9ucuYXJYNJO7djGSdb1echCgTXWitHQLe2uKL36GIMeZ4IufWXOYEqk+DidJrQUtidQeTd861zQdINN+5dh522Y9cWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502386; c=relaxed/simple;
	bh=IboMlhpbZgY77UARdsNwPYCdCDFUNvVUu9bjXh2EJtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qLz5F2egW0EuqMbN5gt0HIc7cbuXSx5fqwYGDRBI5gAeERZgH1/5WXk4D3uP4QB93efPLDo/cMsW2rVGefBlTuZmXS+fhLVm/rCdPkNPS6wSarzCzZHO+1dz5VuUkUdEtETpginyQW7rrM29q6ebIG4GT8BQtWvFPYHNJVbWHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=isktdlzz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35e5c6600f0so1846622f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717502383; x=1718107183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LqVtf1DRQgSu4aZSeFDmu9AyfLGIgKUV3UYrGs16ys=;
        b=isktdlzzZ1JGwibVbWys9JVfSdMAfAnUR+fbCuOnB68mCiwWCtDtL73n7rhvOEFVut
         +ANPBeCwnK6p6nffHCPzZ1R8skVShmaUK+5x2bjEY/8PIBANhjVvDqa2O6ytZ7N/8mv+
         HJLW4L4FdJDi1tlAQf73NEasxENI5SVZvfSBDqpTw4UTtxyLU2za1QyBgHHrpuEhwuH7
         z5Vu9yZrmc7jo/cRAENXvmVbWcXCwWwE1HZCgZM7+tAdCp52v7/JseLonLtpFpctEqcS
         b5zxxMnbCo9BWB3WvsnWFMDRe4iaaDeogLfhGgnIhNWh+sp9hFPY1vcQX9QCK1Amdj2r
         bfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502383; x=1718107183;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LqVtf1DRQgSu4aZSeFDmu9AyfLGIgKUV3UYrGs16ys=;
        b=Htu8RZoUCxAfxcjL6tdOVmC03phcHgzU5NB/dkUZD4EH9zdzs5ZvclO2mCGNQYur/P
         eBp6hV7VegDC9Of5mfsnlwRH20KyOWJ2q84FmfQVa7Enx/1SjXHZ28ryiGABybDhGQA/
         QpIK4/Qf8pP0mzVZaM/QpASH0dv0L1b2pp/8sUCkDPYZM2PAQdjeyK7woQl7dDlPWxJ4
         PqhtqmAiEiSa1/QOzmNCDY5LaDSaAKSn/EOkMeyae+iyDSxTmyya+aRFDF4JK2MLCmTl
         U1Z/SfutffX5cLONOREZU0SjX6Hm4J+FInBlhCzPUKsPs5djB2gah1hQwosvNZ2yNtRQ
         N+7g==
X-Forwarded-Encrypted: i=1; AJvYcCUhBQNN1TFAVH84KfElnRTaxZGe/meecVCg3uNKFo7s4eL+GsCQ84q1uVNeoUgm6cnertVRPnpmm5XMzmccC+IW4jvlHxL1/4iEB0F7qA==
X-Gm-Message-State: AOJu0YzL4GQNAHoCshZ+Mu4oM1jRp7lDQ8UgcN3NRVQza9rGW/yfx0Tv
	0PPMAITpsPlGWlAV63+wUNcAnfiHD5yrdfwkv30QxhW2NMgTDtxrzVQa/RpJ2LQ=
X-Google-Smtp-Source: AGHT+IEHvetS3xHLT/3KS6igiIqFnyxEgJlFaaHCawQvXx1XmQOI9CebRTH+88Ek6jFF2mT1wjBtow==
X-Received: by 2002:adf:fcc7:0:b0:352:f27d:525e with SMTP id ffacd0b85a97d-35e0f3186efmr7542932f8f.47.1717502382892;
        Tue, 04 Jun 2024 04:59:42 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0d98sm11291541f8f.24.2024.06.04.04.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:59:42 -0700 (PDT)
Message-ID: <a0051325-02ef-48e6-ac7e-57c18c8abead@linaro.org>
Date: Tue, 4 Jun 2024 13:59:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: add USB DisplayPort audio
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240604094947.98191-1-krzysztof.kozlowski@linaro.org>
 <c3a922e4-0b34-4b53-bdbd-a62817a68db2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c3a922e4-0b34-4b53-bdbd-a62817a68db2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2024 13:56, Konrad Dybcio wrote:
> 
> 
> On 6/4/24 11:49, Krzysztof Kozlowski wrote:
>> Add support for playing audio over USB DisplayPort (the two left USB-C
>> ports on the CRD device).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Looks sane. Are any UCM changes necessary?

Yes. I already sent topology pull request. For UCM I will send something
soon.

Best regards,
Krzysztof


