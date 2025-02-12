Return-Path: <linux-arm-msm+bounces-47810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA45A32FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627663A06BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF711FF614;
	Wed, 12 Feb 2025 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u08cFnfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173B1FF1C2;
	Wed, 12 Feb 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739389193; cv=none; b=NqsG5rrwmZfn0XxZMoXKrC68U4thrtw3F8g2fgu2j/NBXmsUioRDl55x//TuDiRIXM1y/AXjI3qrqXvWU2njtCQOGhHqTNUhRA2yBCG2ymAeBBnlkyUIrlaFrYJClt7t2C1sF+HD1pTjKBvMwVV1rKv28vBV6Z4A+NP2nOnq45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739389193; c=relaxed/simple;
	bh=SKEGguCNFnBUDcYAg99eBIV5SRd1L+gWLuESvm+jriU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbJtnPTjaQpTCNWyO/svUOJmUzqLlIDrpwusMQzbC+9fmJIB0y71JDaBhAn4G4A7fyhQESSu4G+M/tPqvVxcP/QPQerio3Z+IJIsG7dKrlXdGQex2lX3hL3+GbYZ2A2xHnC9sMZIzCSczr41uZbBkCngKLFOb3Rhoq9yzACWssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u08cFnfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AEAC4CEDF;
	Wed, 12 Feb 2025 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389192;
	bh=SKEGguCNFnBUDcYAg99eBIV5SRd1L+gWLuESvm+jriU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u08cFnfR0E3tShLRBTcHH/rkq+B4omTx4c7LZ7uaCVXgoASwXoiazcLiNMMk7t3Oh
	 K1NdH21uWK5MHMo1gEBSQT4ci05E7N9BcCAAenZpLc5JMUvfqWcN6sXVliotnMNRus
	 /+cXZlWrGQ63ZJZVUinsRCdLiGsGHv1u74IooK6ERle5rvPtxcLdyEDUtiES0zuatT
	 MJ3ECMZxLhojsRI5V6/kMcuWLmKT7byrrChCApPflBVjd6gOjOg2GK3nS3uyylQ6PB
	 KZ6IQxcjw/HzVwxh96nAeeCOAAY+7wsqIvjtX+sSeFAhebrMbFxLAZNF7DS1ptdo5F
	 7iDbzKnveJlLg==
Message-ID: <5ae2fc10-c5fe-4400-8f15-de1fb7ef7144@kernel.org>
Date: Wed, 12 Feb 2025 20:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Rob Herring <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
 <20250211214128.GB1215572-robh@kernel.org>
 <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:29, Mukesh Kumar Savaliya wrote:
> Thanks a lot Rob ! sorry, i was late to respond on this while waiting 
> for other comments agreements.
> 
> On 2/12/2025 3:11 AM, Rob Herring wrote:
>> On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
>>> Thanks Krzysztof !
>>>
>>> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
>>>> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>>>>> +		return ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>>>>
>>>>>> You never tested your DTS or this code... Drop
>>>>>>
>>>>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
>>>>
>>>>
>>>> And how is it supposed to work? Are you going to send us your local
>>>> internal DTSI? Is it going to pass any checks?
>>> was saying about code was testing with MTP. DTS was tested using dt-bindings
>>> check.
>>
>> make dtbs_check is how you test.
> Sure, we are running "make dt_binding_check 
> DT_SCHEMA_FILES=qcom,i3c-master.yaml"

Hm? Please read it again. You anyway have it documented in your company
guidebook, so I expect you follow that one *very* carefully because
reviewers repeating the same as your company book and then repeating
themselves three times is just too much.

Best regards,
Krzysztof

