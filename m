Return-Path: <linux-arm-msm+bounces-45785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC23A18EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99ACD188C19D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8361F8662;
	Wed, 22 Jan 2025 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTz51/je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2FB2101A1;
	Wed, 22 Jan 2025 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539347; cv=none; b=ouPnaHNp9BB2gQfZTp88Lok1KN58pbVqCHajeRRfd0doiBa3J14YD+psS+IVyk8BxkHInlxj5DUF5Ghc4NIMDQ7s1EJWYu+UYxuEQFZwoZP3Prz5wk0L3zRJevUuSvaw9TZq+CvnzLwZ2DZsl34ARH5eBvM/q8BBZjbi1D3zYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539347; c=relaxed/simple;
	bh=Fy3OsI4EP/JY36FAr8INgu6Giqe1hb34w2b8bIPYiWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJbLd/62H5w3vByUOpWBoFoziFNiL5O1bJsEGh0OkUEmIAcurKcJBX+1w/BOYPaRFD++gKzPMptIQ9pYmsKWVddyCHjKfdTJKrU6bXcbfxVp6ttdTtJ4UdUbj0wlyjrRsa75R+2Eq4NRycUiSHmA4L7I0cTvLAr3rnNzMuzA5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTz51/je; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DD3C4CED6;
	Wed, 22 Jan 2025 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737539346;
	bh=Fy3OsI4EP/JY36FAr8INgu6Giqe1hb34w2b8bIPYiWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jTz51/jeWFOWhwWVZvd0vft9o9KWH6kJmD+shWzhciaM8iBVFK4tuEqwtFOXDaNS0
	 UchAJIMYDVIoISU0kk4xWpz8TXwW0qRxIbZ4vk35c4UnXfFUGs85EUgtP3B2yvgke0
	 XJ3gepjbzy4uDJglS4DScytZVFztVgNMXDiyiNcafS0furvXN7EJ/T5yELZ9UFtkEl
	 lDf27aAyDyoWbJclm7Ko8v2t6XJlkxHigp30ZVoO1VjTNUPzDFaf1zzfaQgAvHZmNR
	 VXJMvc7yU7/0Sglk8bv+xsJTbCTTtQC3xwNWUJQHguuIzCkKCUT8YPOI8ESEp0Lns5
	 /YMPuIiHT0qRQ==
Message-ID: <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
Date: Wed, 22 Jan 2025 10:48:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Yijie Yang <quic_yijiyang@quicinc.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2025 09:56, Yijie Yang wrote:
> 
> 
> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>> On 21/01/2025 08:54, Yijie Yang wrote:
>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>> the PHY, which is completely opposite to the suggestion of the Linux
>>> kernel.
>>
>>
>> How does the Linux kernel suggest it?
>>
>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>> the definition.
>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>> phy-mode.
>>>
>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>> ---
>>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>   {
>>>   	struct device *dev = &ethqos->pdev->dev;
>>> -	int phase_shift;
>>> +	int phase_shift = 0;
>>>   	int loopback;
>>>   
>>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>> -		phase_shift = 0;
>>> -	else
>>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>   
>>>   	/* Disable loopback mode */
>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>   	if (ret)
>>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>> +
>>> +	root = of_find_node_by_path("/");
>>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>
>>
>> First, just check if machine is compatible, don't open code it.
>>
>> Second, drivers should really, really not rely on the machine. I don't
>> think how this resolves ABI break for other users at all.
> 
> As detailed in the commit description, some boards mistakenly use the 
> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and 

That's a kind of an ABI now, assuming it worked fine.

> added the delay for it. This code aims to prevent breaking these boards 
> while correcting the erroneous parsing. This issue is similar to the one 
> discussed in another thread:
> https://lore.kernel.org/all/20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com/
> 
>>
>> You need to check what the ABI is here and do not break it.
> 
> If board compatible string matching is not recommended, can I address 

And what if affected board does not match the compatible, because you
did not include it here? I said this code does not prevent breaking ABI
and you did not address it. To my comment you need to consider ABI, you
repeat the same, so kind of something irrelevant. I have feelings you
want to push your code, just like in the past several of your
colleagues. Learning from past mistakes I will not engage in such
discussions, so please really rethink the concept and comments you
received here.

That's a NAK.

Best regards,
Krzysztof

