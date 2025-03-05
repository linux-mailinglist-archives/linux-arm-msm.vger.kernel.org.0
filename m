Return-Path: <linux-arm-msm+bounces-50381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBAA50595
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 17:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55B143AB046
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 16:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0F51A315B;
	Wed,  5 Mar 2025 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgSd0ZMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984B1A3153
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193153; cv=none; b=ebDqlS8Di5VvFaAzx1eHkEtElZsrZI2HF7VJRO5trAEvPxhL/ONYPE8GcEtkRHo9e7h4q+Tr1P0ZNVKY+1V+cMrbIQw7gDREcguvHB4Ju3+VXtffDRfOVtqMBBDd9r+Yonemh4qbEwRJdONz9thHaSGkHxFjouBbnbWVASoJO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193153; c=relaxed/simple;
	bh=y6LvlKB+E8Eaqk78TbU4Bx5i/6G588bMGmdS3FZF4oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQK1pdyVVgsHlnTagfzDtFWkMvC4yGUvw12N+xIpP4o5rQZAGgEM+Bniya/E0e587BvICuga96Zz1XyFYLo4KQMknIkPtFw0v7FffvFVch1HI4uS/+ounMaw/12ydy31J1TB0w9xYqCQH3oDUL6hEz/aa09VLif2OexrXUUGTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgSd0ZMW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bbe818049so3664135e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193149; x=1741797949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YyMHo9r/avYVNZnF91GE1nMhok+f5jBSDHoxhJJyk2k=;
        b=GgSd0ZMWojw6nYVS5ZVMkKHseo+HbHlSYoqn8LHJSItzLOUn4AHN+SFir2XFlSgwSM
         AX7kyS9uy2zO5L2478yJ9OE7FZtGxak4/M/E+Ln6WH0Mpo6SlrQE0/8l5PHsuNmGWuLC
         QshxQPcaL8XFyYQcv80mYNJyJ5y2BGhLHkfz+vb2xEJlZa0mzQEQ0hsKiqBk6tUVWkVL
         BLTczCc+4jiWTVviYxOApycc703MEUJq3Dr8iAkNEqb2pGaI0a4CZu90aFjvAKncANUp
         ViBi22bGxbrwt/BUBjsSwgz+ToxRyhCfLVV7IiKuT/ODqBp8zQklZli86ggEAGi3UjGX
         6a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193149; x=1741797949;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyMHo9r/avYVNZnF91GE1nMhok+f5jBSDHoxhJJyk2k=;
        b=l2VGuIM0kVSjoOJ2ytkfdjSrQvyD1wWA2mXgmVG6ezVfX5RVKeS8fwk9vNPCFVaCXJ
         Lbz6ypecY11m99SX5qGKDWElFLS/mJ9bItxpDH7jIZstYe8p+8UFiudseCEEu84b0Csb
         BDPicsqA23+d06rKPftJ0UiWKqIaatzHj6+A1vbT/ZlkkfzBfIMP3ozYCxatXnlciLqg
         YLWw4wwWSmKD3i6jNAnt3oj4/J+4LKkyXx3d/z22RMguw5Nv8e1ZwySRmKISH0FoESok
         QvdAtPX36NFeiZ7X45PxMgEXKxRtlcHryZz2OlbvL2g3CaYlxgvbGOR7qYDRFqYXXy0g
         49BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr0uu42oQUhfhhXZ6suqy1Vp65sHCqXfibNaU8IPyGkyPHNWbDIUEBaC4lfBj52ErDkariiq6TCQ1sSECQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzuS5AafceEH9xa4CWLfyrQc0c+aywWO30LColsFHNObFTvJqAl
	d6c7N/BmHyCLOijWpdYdlKOqGAKydyXQevP8s4ak5IoitHFJLY8+sevsGQpniDg=
X-Gm-Gg: ASbGncvFb6XAio0xd90e/B9Wq17sazHAA8P1FpOtrir8IVgrfuDrklzlJx9sfjB8A3t
	Zcevh4hCp84e+OnkiQmm+6iMQi8SQvYyiYUXg/lz1xLv2k5fwdu7Qfx76kXq+YgZU+ICoUsYyoF
	R6p1iYT0NNChUKFK+4+b0W1p83lbguEb94UIlTjkRYH9qCUE2Mmkhls4jXT4xvjp4VD5ezF5xZI
	Nw1j/4+FtoZTAZ5knogiYKLVPMvE/YLeY2o9Ah/DIRbhZXqh7NYQqrIYZvSVz6UBAzPNrWX0G4f
	B0q5HJMNtg5sxhFFQHNvAoUPnd4PNLnBQlemP177PJnO4n8ayBC3LZPLOP03nXTI
X-Google-Smtp-Source: AGHT+IGP+5v75DlRia7McsAOS6Jlq6ajxiav4cAZDeDMWWlNZIzDp59fn3LSTwXBVF4ILwZRv+NrGA==
X-Received: by 2002:a05:600c:1f07:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43bd2ad9b96mr10818245e9.5.1741193149430;
        Wed, 05 Mar 2025 08:45:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd431070dsm22515525e9.34.2025.03.05.08.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:45:48 -0800 (PST)
Message-ID: <1c7b05a6-c139-4b68-a723-651de559dc73@linaro.org>
Date: Wed, 5 Mar 2025 17:45:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
To: George Moussalem <george.moussalem@outlook.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 andersson@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, kishon@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, kw@linux.com,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 p.zabel@pengutronix.de, quic_nsekar@quicinc.com, robh@kernel.org,
 robimarko@gmail.com, vkoul@kernel.org
Cc: quic_srichara@quicinc.com
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883E7167E44F92DBC29FF3C9DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
 <a95b4c01-9d8c-49eb-8242-93ae411caec0@linaro.org>
 <DS7PR19MB888309B506D25ABA03F218EB9DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DS7PR19MB888309B506D25ABA03F218EB9DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2025 17:41, George Moussalem wrote:
> 
> 
> On 3/5/25 19:51, Krzysztof Kozlowski wrote:
>> On 05/03/2025 14:41, George Moussalem wrote:
>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>
>>> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
>> Nope, that's not a correct chain. Apply it yourself and check results.
> this series is dependent on the series to add support for IPQ5332:
> https://lore.kernel.org/all/20250220094251.230936-1-quic_varada@quicinc.com/
> which was applied to dt-bindings
>>
>>> Add support for the PCIe controller on the Qualcomm
>>> IPQ5108 SoC to the bindings.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Also not really correct. I did not provide tag to Nitheesh patch. How
>> the tag was added there? b4?
> the RB tag was passed on from here:
> https://lore.kernel.org/all/20240830081132.4016860-3-quic_srichara@quicinc.com/
> but I'll drop it as it changed quite a bit since.


You linked v3, but this is v3!

I think I was stating it, but just to recap: please keep versioning the
patchsets, so if you ever do any change, it is next version. If you do
not make changes and keep the version but send again something, then
this should be RESEND PATCH.

>>
>>> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 49 +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>> ...
>>
>>> +        reset-names:
>>> +          items:
>>> +            - const: pipe # PIPE reset
>>> +            - const: sleep # Sleep reset
>>> +            - const: sticky # Core sticky reset
>>> +            - const: axi_m # AXI master reset
>>> +            - const: axi_s # AXI slave reset
>>> +            - const: ahb # AHB reset
>>> +            - const: axi_m_sticky # AXI master sticky reset
>>> +            - const: axi_s_sticky # AXI slave sticky reset
>>> +        interrupts:
>>> +          minItems: 8
>>> +        interrupt-names:
>>> +          minItems: 8
>> Why is this flexible?
> I'll restrict it with maxItems in next version, thanks


This was not in v3, so is this resend of v3 or v4?

You are making this process unnecessary difficult and confusing.


Best regards,
Krzysztof

