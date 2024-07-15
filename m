Return-Path: <linux-arm-msm+bounces-26240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF3931B51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C96871C215EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54DB13A268;
	Mon, 15 Jul 2024 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwDmRQRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29436137930
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721073557; cv=none; b=KFy95R6J2vbNhkPpxDnr3lnr9NhQ30WNf97MtLZHBfs5tJ8iLD0KXrF5qH7ZDmgyfvbp9M7DJ3KZFLxSyUbc1QjSdumCVIVxzUn1QDOfyrJyt3ANiyVrSCeJ7S6Lp+uBxefewhqdpz3RT04Ol5GkjkEiVsDoQz8SZfC+Ye3arCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721073557; c=relaxed/simple;
	bh=LvT98sF2KGBaUwQ9XXhg4j+QuNxnwUeyHbX4nEJ+Ca0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyV0lvshp5qhjmQ8eWzw4/jlpRBcirANH4/UheI05JJnkU4NIHF3vFJ49pe7naz+S76UUjCGIRb/mnqOIpBT2JW4eQT1TFs1LMOxCTpx8T52dChUr0qwYmj2EDtAveOqZE/bokv6WwOqBi0PBpevS16V+Kuy9CfXV5oC2Cjzwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwDmRQRF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77c7d3e8bcso597005666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721073554; x=1721678354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJSdqNV8qkcPGDPpEA5DZ02C9ugF9YP0oGhD6/ztbvQ=;
        b=HwDmRQRFgkYh/EseaCQIQcIgd/Qb6NborS1qgW03OxnUGu6BnTQysDQz328NmFMmog
         /trKIDVjZYbq6EBajQaWPsjjtLC/Rm4Oh6TLp0BM7e6twRrCD17N0CoP8hC0h/wpYPlB
         awHw2qaVBj6+uHZNQbhF5u7YWjEhIaPia2WSWg+imKCkRfgrzRGANPiORTLFONkWIoxP
         TpeI60i0gfOyEk+idcU3dC9eLPPJFullK09IIn/UPl/hSYWyw0VJcFzgvMjdM/9O7vg7
         A9pLDkZ4MRKZhUSj/kaAvwCy/bATjyT8MZZk/uG7DYqFxYhgxWre32QVFQP0t7MATkVX
         APRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721073554; x=1721678354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJSdqNV8qkcPGDPpEA5DZ02C9ugF9YP0oGhD6/ztbvQ=;
        b=Nd+s6AsLrdsfl+F8KPcb7Bmq80cUp2e99CSaLMdr10h6YtNTToXEv1oDLWDeHXFEw2
         v1vDjy6M+pZHhKGnrbDmn6/p9nRTibccHayNMKDsYM7ThkFOIpzavlCQE2Y99QqPPlpQ
         iCFi6r1rrN/FtdL3fTZgTDHDoAdtZRYdHwne1AjgMTLyQg0pz1aFpKAFjtiCaq4F6u6e
         C7s1JSqSV6yDJ1kw4CVIzrTw0MrijbxZj2kV4DfBnczl89osqEg0eV9SnlIL8Rtez3Jq
         LSn7yVlgXh+B54DZI62TUtK0HdHH8cRvuA1V2673UoBMKkexkDFLTXwW4/68JMWlqkIX
         bp/w==
X-Forwarded-Encrypted: i=1; AJvYcCXu3q9RRuWLF1Y5QpocxQCMfiYS4CAbQE2gZ8kfbLo9W+MqWsTojrD+USUBKqF7zvhNisrtTid6sGypBepY+74uFPQJhpsH3gblUXtE7w==
X-Gm-Message-State: AOJu0YzXyP6Glzcq71FDChNJ1woQH4dwIS4VrVS+hhpJVnXHdgbrrQDY
	XYGpcWuWvhyw6R7SUKNRFct3tnepJVQyFMyO4VuMbqUhTwT8NQ9FzGFLqJT7O0U=
X-Google-Smtp-Source: AGHT+IFxEzYwkC/3s0ewujhxHLZobcQN74JupDqw+z8hkTQN+1taIA6lpHP0CQ9gAFjHy1LxYVzcDg==
X-Received: by 2002:a17:907:bb99:b0:a6f:4fc8:2665 with SMTP id a640c23a62f3a-a79ea934437mr1844866b.50.1721073554184;
        Mon, 15 Jul 2024 12:59:14 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5ea443sm236644966b.91.2024.07.15.12.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 12:59:13 -0700 (PDT)
Message-ID: <0690964e-fe50-428b-aa84-be298cd6dfa0@linaro.org>
Date: Mon, 15 Jul 2024 21:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] dt-bindings: PCI: pci-ep: Document
 'linux,pci-domain' property
To: manivannan.sadhasivam@linaro.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-4-5f3765cc873a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240715-pci-qcom-hotplug-v1-4-5f3765cc873a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 7:33 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> 'linux,pci-domain' property provides the PCI domain number for the PCI
> endpoint controllers in a SoC. If this property is not present, then an
> unstable (across boots) unique number will be assigned.
> 
> Devicetrees can specify the domain number based on the actual hardware
> instance of the PCI endpoint controllers in the SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Hm, perhaps pci-controller-common.yaml could make sense here?

Konrad

