Return-Path: <linux-arm-msm+bounces-27673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA29445BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B871F243A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 07:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A423F59B71;
	Thu,  1 Aug 2024 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNlLsaBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064719478;
	Thu,  1 Aug 2024 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498336; cv=none; b=bHv8arwY6EsGXnmYs/FGbpRxhWZkMsR+iEEb6Q+p57RolLhv7xib7LDt8SzYaKqsGzKrM4FucpLV1ylfXr0KIaxYEPeNrG6YIlLPNcXK7rPVcPNiDL5Yi69xuwImxu2h9R1TxWVYsZ+E/VCEwGbjOJwQWNfVpjFjWsYjtAG2k5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498336; c=relaxed/simple;
	bh=LUz8cuedenYeTKjyQtYEMn4VxB2XEmSUJTjWMeK7NHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsCGDwDie/iJFL/B6r8zfrZuqRDWBoqjxgqVxUX3o9qbysRu0n9E3TgigeL9wmPwTC1JGdc0xyNE4tZGAR8E+U0tB7aB2kqhCWExGZtA+jycLLgtPJFCXezqY3sA8elnWhlC0kpQQmNb8roz4yDdnZJHt+HfgJ5bcbshdAfIlUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNlLsaBk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00371C4AF0A;
	Thu,  1 Aug 2024 07:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722498336;
	bh=LUz8cuedenYeTKjyQtYEMn4VxB2XEmSUJTjWMeK7NHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kNlLsaBkeE7GeQoUPPbl2doWfJOx4JPXk6foEBbYi+NxW40oy9mHLMbqFSeg973oU
	 u1MgCLYfMWEAQNs5/1vvkSEj30VqFEVNk8OED2ybF55SCePXWVh5MRYPkS3cLDtd8k
	 1i9Vk1H1fO/qKHTVcJUSRu8ZqWqUcAYG4bni++OkyrXMLnqYkxXWcR0MOyevCgmvs8
	 rD0UdgyyBu+0rmA7TUQgt75Hx+00PfqZYm280I3zI7NQAjG/aIenK7eZYyYb604NwM
	 ahOXMK0jl0NsT/J5gcOC10GZicsCRPnfdRNcYwl4c8heg3ojdxlkIYM6Gyii3HDmB8
	 146O+514Czb8A==
Message-ID: <e7a95d94-6ca3-4700-a544-5f37c5e58f6b@kernel.org>
Date: Thu, 1 Aug 2024 09:45:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] usb: misc: eud: Add High-Speed Phy control for EUD
 operations
To: Elson Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-7-quic_eserrao@quicinc.com>
 <a2460e27-697c-495f-9106-bdb9109d674b@kernel.org>
 <240305c2-54d3-4b75-a938-7b40abedddc9@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <240305c2-54d3-4b75-a938-7b40abedddc9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 00:38, Elson Serrao wrote:
> 
> 
> On 7/30/2024 10:39 PM, Krzysztof Kozlowski wrote:
>> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>>> The Embedded USB Debugger(EUD) is a HS-USB on-chip hub to support the
>>> debug and trace capabilities on Qualcomm devices. It is physically
>>> present in between the usb connector and the usb controller. Being a
>>> HS USB hub, it relies on HS Phy for its functionality. Add HS phy
>>> support in the eud driver and control the phy during eud enable/disable
>>> operations.
>>>
>>
>> ...
>>>  static ssize_t enable_show(struct device *dev,
>>> @@ -186,6 +216,11 @@ static int eud_probe(struct platform_device *pdev)
>>>  
>>>  	chip->dev = &pdev->dev;
>>>  
>>> +	chip->usb2_phy = devm_phy_get(chip->dev, "usb2-phy");
>>> +	if (IS_ERR(chip->usb2_phy))
>>> +		return dev_err_probe(chip->dev, PTR_ERR(chip->usb2_phy),
>>> +				     "no usb2 phy configured\n");
>>
>> This nicely breaks all users.
>>
>> NAK
>>
> 
> As per my comment in [patch 1/8], phy would be a required property and hence I will first modify
> and enable EUD on the existing user (sc7280 SoC) and then extend this to other users.

NAK, you break existing users without clear reason.

Best regards,
Krzysztof


