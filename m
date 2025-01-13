Return-Path: <linux-arm-msm+bounces-44876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E0A0B5AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E1F1882C98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 11:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBB822F17A;
	Mon, 13 Jan 2025 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxieR594"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535122A4DF;
	Mon, 13 Jan 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767570; cv=none; b=V/4g66WVRKxduCJgDhr0bJme3i3r3vnPtvzFonUkXax9cSRZTTmY/1eKJepwhrVURn4UVNyqhK+IcrX0vbkCywGJ3jE/KbyGtYZ/eEBByXHfOHymr46/FVRbBZ5MsAvWNVZTBDuZF+bP0yF5eCHBF3KJ0ZjsoI89fmK6K9fTpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767570; c=relaxed/simple;
	bh=XcLozn4zX9P4PK+jgJPOpEix1IEYh5jHwJQNST5Qp5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmzTzpNgAwQO6MCP6i69JqIevlWY28HfZTSQAKd1mTdbOUBuV0P4MB7rn7eGS31nRhgIYSUqqxaUlZstvyTtrGgjUb9rqZ+IPGegQUgW4qvzMeCcOjUdXuTks63sWDBIlnPMeHNJEMPC3fbQJaVDW70UeBgbHx/26qWcj7S3nkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxieR594; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A87C4CED6;
	Mon, 13 Jan 2025 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736767568;
	bh=XcLozn4zX9P4PK+jgJPOpEix1IEYh5jHwJQNST5Qp5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GxieR594U5Pc8sXylVWalAObd8c+jbAoRK5gbMR2gsLe7CV6WpQv9+d/16k+5gj0C
	 M3dbGszsAfYn2iWtPA0CFWKJILeJV5hQiopJnFRy6fHKpDKpZg0SjWcEfvrgVcwD4c
	 BA5NN9Ff1VIeo9thjlkM5C9CGBTv32MMlbBmtMi/YNKJCMfOrZvz+F5KK9fCJpMKV5
	 6wO3lnR7rJrBHXxnhUNGLRN8pwEevkQWXAwwrewj+q6Lh4pQ+oGkuM1i/OYeBLSS7j
	 1ouAmqiA8dfq6MOu3XSHkuQf8CDdKA+3RVqqXXIt5C3IWUjs3oNfcMnQXXGtd3jyDQ
	 uZLZXiIxBpd7Q==
Message-ID: <0d2ebb1c-be69-45ca-8a66-4e4a8ca59513@kernel.org>
Date: Mon, 13 Jan 2025 12:26:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <df1e2fbd-7fae-4910-9908-10fdb78e4299@kernel.org>
 <e2625cfd-128c-4b56-a1c5-c0256db5c486@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e2625cfd-128c-4b56-a1c5-c0256db5c486@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/01/2025 11:33, Yijie Yang wrote:
> 
> 
> On 2024-12-27 15:03, Krzysztof Kozlowski wrote:
>> On 26/12/2024 03:29, Yijie Yang wrote:
>>>
>>>
>>> On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
>>>> On 25/12/2024 11:04, Yijie Yang wrote:
>>>>
>>>>>    static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>    {
>>>>> -	struct device_node *np = pdev->dev.of_node;
>>>>> +	struct device_node *np = pdev->dev.of_node, *root;
>>>>>    	const struct ethqos_emac_driver_data *data;
>>>>>    	struct plat_stmmacenet_data *plat_dat;
>>>>>    	struct stmmac_resources stmmac_res;
>>>>> @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>    	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>    	if (ret)
>>>>>    		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>> +
>>>>> +	root = of_find_node_by_path("/");
>>>>> +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
>>>>
>>>>
>>>> Nope, your drivers are not supposed to poke root compatibles. Drop and
>>>> fix your driver to behave correctly for all existing devices.
>>>>
>>>
>>> Since this change introduces a new flag in the DTS, we must maintain ABI
>>> compatibility with the kernel. The new flag is specific to the board, so
>>
>> It's not, I don't see it specific to the board in the bindings.
> 
> I'm sorry for the confusion. This feature is not board-specific but 
> rather a tunable option. All RGMII boards can choose whether to enable 
> this bit in the DTS, so there are no restrictions in the binding.

If it is not specific to the board, I don't see why this cannot be
implied by compatible.

> 
>>
>>> I need to ensure root nodes are matched to allow older boards to
>>> continue functioning as before. I'm happy to adopt that approach if
>>> there are any more elegant solutions.
>>
>> I don't think you understood the problem. Why you are not handling this
>> for my board, sa8775p-rideX and sa8225-pre-ride-yellow-shrimp?
>>
> 
> This feature is specifically for RGMII boards. The driver won't enable 

So board specific?

> this bit if the DTS doesn't specify it. To handle compatibility, we need 

Do not describe us how drivers and DTS work. We all know.

> to identify legacy RGMII boards with MAC versions greater or equal to 3 
> which require this bit to be enabled.
> According to my knowledge, the SA8775P is of the SGMII type.


Best regards,
Krzysztof

