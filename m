Return-Path: <linux-arm-msm+bounces-54237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBADA880CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BC211897325
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8F229CB47;
	Mon, 14 Apr 2025 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAJEOtjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF591DFF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635025; cv=none; b=eBk1Ot6X4N8H6BFcI+uJcLQSacvWAy4ptZaCu6EE3RKSeuEAtPv+eHqLm8yIAYF9unENvRn2NDxs0xVX1UriAlA/vcvUmzNFnb06QLrlXRB8UcrjlLAd+eojVyBK9UExQa2ZM9watPBjndufTlBBlJMQkNFs39RvvMNvPExHn8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635025; c=relaxed/simple;
	bh=aauT3GXVgkpvi4e640lDkwhNh379xrTu4THGAGH1JXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5skr4KCBXBqFtLeXljkzDJWz0mCseU8wCNek4gjFxNRVM2hyKkYidxOFjdHHe4pNsoeMAOInSiM3318rPL6PoE3zz9X0deHZzJ/L/X5RZThjyv9zwkjR5FhebJRuXiu1eG9WIbOgDJr6JvpbzTK+wZNcpLdgz+JhNPhT9g4MP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAJEOtjE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34466685e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744635021; x=1745239821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+pAXTJjBGvhFO5Jgnk3HRVtR9DMXrzjv5IH0mVyBfI=;
        b=HAJEOtjEEnQzVwVqh+buhQv+P1wc8JjRokY/+gMnuusihX39fYrqbVZ43ucWmDsrp1
         1RX+cqOYZaordPadW9TD3F3LqeCGxaLW2FoSKx8bfT6uYrB20c3P9mcQuH6q5KiAYrnl
         shw+tGr5e7aaOu1fo9YrukXEVnbUuRLxrheKO7NTZv64m35BxHO6/Q/pF65Eva5hMlrC
         oCHENbrCfjFi2v1sK1XWyW0gAq2uu3MEDFoUiL2WhCtTCsq9bldhAqs3LGnC67+H+dNL
         B91SYpQTSnApsBaw7t+xWiG3mwEturKMZyXq5E/4n28TMmGoMufMbCjPOpZIIyS65WSa
         bwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635021; x=1745239821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+pAXTJjBGvhFO5Jgnk3HRVtR9DMXrzjv5IH0mVyBfI=;
        b=W62W/G1G1OOlpYAISvDMG5h1eaRLmwrM4QccV9x3ijOj6r2rWJYpy08xIR9K2ivOdA
         NoLREuWvYKHnl4tefUi8JKZ6Uj8J0t1dNvqQGC39XCdYWW9RT0MUafx7RcjeOiGaf5mb
         i3aL0Mk9jH4xTB3GdDy+AmrOa2xO/bpucDgLFSxDVzI0P3Rim5+nmnZ/32aEj7j2sdQM
         BeiVqmVRdt2fC+dreFJoDijKOj5fnM7kxNyrve43VkHnlKZuzNW8LBArL3qjOXvoiKbV
         oLv+r2FOkMFnw2srb3GF2pYY97+X/JWk68GfJAodppJsrxiiOwTGjBB1yRCxFhSxJV7g
         p6TA==
X-Forwarded-Encrypted: i=1; AJvYcCV+BCvzdMrs1a9PNYL1VtJORoT304thQbDbaS+9u/lYrl7bCPWZQXUJa2vQO/Q1H8Wa6pacGyaAiA52E9+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YweyPyPARgrud2fnZoLKgHBrBJvou2Sxi9cG5GndazDyPvF1lWK
	3yZMIu21+RG0gMF39mIrBQSJD6Jqckz7dbauCMGVkh01+k2/D5Wr+/YrpvwyjqM=
X-Gm-Gg: ASbGnctdwXkdasPw/hgndVHJTYFNXepA+OLh+T2Pj/a9k0xUYQklBpe/+P8wysjEztd
	335rcM7k6j4HfRGb77TnLUbLsLDlB1MflOaMcqRFK5Yj37hxN7MpyuQdo36Bml+fdNwCWDjNx3m
	06RtnaTIATxUuCqORMO8fRFQ2YGHXD0BgqDQPewT652satnZJaj6zSRneJyT5PYxj1vQ46TzRlr
	p3KEucvokpgcYSPbTG6NWy8AhhnHeK5y6jwEdU0hrWdgB6AOHFaOW3u0b/4PHG3dajDAdIEBNRd
	BQg9I+wzF91L5lIndgCEx0pWa2fQBWRFvhre2++OB0jJ1Q0tH4BZpgwtrI1lmtbLIe7xcjg=
X-Google-Smtp-Source: AGHT+IH430QYM+FJhca1rtm5d/b7VTqFwzxeB45/GUv639pRmbX2Q64Po04fC/f2TeaHco+nMrWWlg==
X-Received: by 2002:a05:600c:3554:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43f3a93f2d8mr116392145e9.10.1744635021303;
        Mon, 14 Apr 2025 05:50:21 -0700 (PDT)
Received: from [192.168.1.47] (i5E863B76.versanet.de. [94.134.59.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc83sm182939685e9.26.2025.04.14.05.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 05:50:20 -0700 (PDT)
Message-ID: <6db146b9-ad63-42c7-9f33-83ecf64ed344@linaro.org>
Date: Mon, 14 Apr 2025 14:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset
 gpio's to root port
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
 <20250414-perst-v2-1-89247746d755@oss.qualcomm.com>
 <ody5tbmdcmxxzovubac4aeiuxvrjjmwujqmo6uz7kczktefcxz@b6i5bkwpvmzl>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <ody5tbmdcmxxzovubac4aeiuxvrjjmwujqmo6uz7kczktefcxz@b6i5bkwpvmzl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/14/25 10:04, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 11:09:12AM +0530, Krishna Chaitanya Chundru wrote:
>> Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
>> the bridge node, as agreed upon in multiple places one instance is[1].
>>
>> Update the qcom,pcie-common.yaml to include the phy, phy-names, and
>> wake-gpios properties in the root port node. There is already reset-gpio
>> defined for PERST# in pci-bus-common.yaml, start using that property
>> instead of perst-gpio.
>>
>> For backward compatibility, do not remove any existing properties in the
>> bridge node.
>>
>> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,pcie-common.yaml      | 18 ++++++++++++++++++
>>   .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml      | 17 +++++++++++++----
>>   2 files changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> index 0480c58f7d998adbac4c6de20cdaec945b3bab21..16e9acba1559b457da8a8a9dda4a22b226808f86 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> @@ -85,6 +85,24 @@ properties:
>>     opp-table:
>>       type: object
>>   
>> +patternProperties:
>> +  "^pcie@":
>> +    type: object
>> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      phys:
>> +        maxItems: 1
>> +
>> +      wake-gpios:
>> +        description: GPIO controlled connection to WAKE# signal
>> +        maxItems: 1
>> +
>> +    unevaluatedProperties: false
> 
> Please mark old properties as deprecated.

Since this is a trivial change, just moving two properties, I don't see 
why it makes sense to deprecate -- just remove the old properties, and 
move over all the platforms at once.

> 
>> +
>>   required:
>>     - reg
>>     - reg-names
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
>> index 76cb9fbfd476fb0412217c68bd8db44a51c7d236..beb092f53019c31861460570cd2142506e05d8ef 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
>> @@ -162,9 +162,6 @@ examples:
>>               iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>>                           <0x100 &apps_smmu 0x1c81 0x1>;
>>   
>> -            phys = <&pcie1_phy>;
>> -            phy-names = "pciephy";
>> -
>>               pinctrl-names = "default";
>>               pinctrl-0 = <&pcie1_clkreq_n>;
>>   
>> @@ -173,7 +170,19 @@ examples:
>>               resets = <&gcc GCC_PCIE_1_BCR>;
>>               reset-names = "pci";
>>   
>> -            perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>               vddpe-3v3-supply = <&pp3300_ssd>;
>> +            pcie1_port0: pcie@0 {
>> +              device_type = "pci";
> 
> The rest of the file uses 4 spaces to indent the next level. Any reason
> for breaking this custom?
> 
>> +              reg = <0x0 0x0 0x0 0x0 0x0>;
>> +              bus-range = <0x01 0xff>;
>> +
>> +              #address-cells = <3>;
>> +              #size-cells = <2>;
>> +              ranges;
>> +              phys = <&pcie1_phy>;
>> +
>> +              reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +            };
>> +
> 
> Drop extra empty liines
> 
>>           };
>>       };
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Caleb (they/them)


