Return-Path: <linux-arm-msm+bounces-4815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBED8139CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E9BB20AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1568B68;
	Thu, 14 Dec 2023 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAgstMJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4410C114
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:18:24 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso917920e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702577902; x=1703182702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUXxNIE0oyhaGNjYhqDm71JIvcw2/l7lxWAlHlBLujc=;
        b=kAgstMJo59Uulo15INN4HDJUpYM5JnIK6OhLAqGBKXFXoFlG5KzO0OKnGvj4x4U1Bt
         99U6Uvg4F/Zk1hRyp2EmW80qYBzV5GpZEbazT3cPB6GdhyfI2vcVP+4zQfavpPs0nE7M
         U8V/ngLyCpW8C5xBQEv5+IExNEGawEBMITF0FyCrq919AnehwLZsPVTQVUUdGk7IOuTK
         sAPpyuluR7T+QQxIqxbKHFT0N0boAPJXS83QT5uW5RDGvkZl2sRO3pNENlzq/BNMDq/Z
         eiweJL7VX7z7LWsbTokpTJTJuaLxe6UQYEDWr7d4GJKkbUuBsI1XmZmhuatJ0aPW+SKA
         mdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577902; x=1703182702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUXxNIE0oyhaGNjYhqDm71JIvcw2/l7lxWAlHlBLujc=;
        b=fegPa4rHJsQxkXzq3t8kaiVn3qcFeqZA8beWPT7hEZu9dIE8GFl1WgWb4RQHTLXLPp
         DPOqZTDyooTMoLSJGL7q2Ihn7S7m9WrFxFWLw7xeUGKlJAKCJc0aUJRgUFdJsoSWS+dP
         NTa2vy9iRNhbr6cWcWY0hq4OESP9TGKlw3HAe7pJTJbAM82BPI8MlukcVM3DMLiXmMxG
         tD4Wm3sSl9a+2v1zuHbBEb/boTKtMK7I2brc8aWP195+xmVH8YQGydoeBCZhj8twtEWW
         29A95AURpzhtQpwTR78eJnru5Set6sPISZVqnC/BdAPpsXQkTnW+M0yyIHGploYiRhQm
         WjhQ==
X-Gm-Message-State: AOJu0YywfTMiQiKZoEIVTvNMj8sWS1D2tEkV+TLdtBYBmit8WVJ2UujA
	Soc7bwLMeCzhzYqsqbuLdfqCdw==
X-Google-Smtp-Source: AGHT+IHPvoFv9KvPlT+AD1GWaLtelWYGlfY72peH/oBCnqzIcbZPrWCVcWP96N2Eo12F9Pm8pvzRCA==
X-Received: by 2002:a05:6512:398f:b0:50e:15de:9931 with SMTP id j15-20020a056512398f00b0050e15de9931mr1257549lfu.24.1702577902567;
        Thu, 14 Dec 2023 10:18:22 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512105000b0050d1a0e7129sm1659686lfb.291.2023.12.14.10.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:18:22 -0800 (PST)
Message-ID: <92e9039b-a0e3-4f93-aaa8-226ef9e8b613@linaro.org>
Date: Thu, 14 Dec 2023 19:18:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: ipq5332: add support for the
 NSSCC
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231211-ipq5332-nsscc-v3-0-ad13bef9b137@quicinc.com>
 <20231211-ipq5332-nsscc-v3-7-ad13bef9b137@quicinc.com>
 <c4034715-53a5-468e-914a-3f19d0618c42@linaro.org>
 <8cc2a8ec-632e-4e3b-b13b-d1523a61c136@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8cc2a8ec-632e-4e3b-b13b-d1523a61c136@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 12/11/23 14:28, Kathiravan Thirumoorthy wrote:
> 
> 
> On 12/11/2023 4:02 PM, Konrad Dybcio wrote:
>> On 11.12.2023 04:37, Kathiravan Thirumoorthy wrote:
>>> Describe the NSS clock controller node and it's relevant external
>>> clocks.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>> index 42e2e48b2bc3..a1504f6c40c1 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>> @@ -15,6 +15,18 @@ / {
>>>       #size-cells = <2>;
>>>       clocks {
>>> +        cmn_pll_nss_200m_clk: cmn-pll-nss-200m-clk {
>>> +            compatible = "fixed-clock";
>>> +            clock-frequency = <200000000>;
>>> +            #clock-cells = <0>;
>>> +        };
>>> +
>>> +        cmn_pll_nss_300m_clk: cmn-pll-nss-300m-clk {
>>> +            compatible = "fixed-clock";
>>> +            clock-frequency = <300000000>;
>>> +            #clock-cells = <0>;
>>> +        };
>>> +
>>>           sleep_clk: sleep-clk {
>>>               compatible = "fixed-clock";
>>>               #clock-cells = <0>;
>>> @@ -473,6 +485,22 @@ frame@b128000 {
>>>                   status = "disabled";
>>>               };
>>>           };
>>> +
>>> +        nsscc: clock-controller@39b00000{
>> Missing space between the opening curly brace
> 
> My bad :( will fix it in next spin.
> 
>>
>>> +            compatible = "qcom,ipq5332-nsscc";
>>> +            reg = <0x39b00000 0x80000>;
>> the regmap_config in the clk driver has .max_register = 0x800, is this
>> correct?
> 
> As per the memory map, 512KB is the size of this block. However the last register in that region is at the offset 0x800. Shall I update the max_register also to 512KB to keep it consistency?
No, it's fine, I just wanted to know if it's intentional :)

Thanks!

Konrad

