Return-Path: <linux-arm-msm+bounces-27252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66A93F4F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4AA9B20A1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF2146D51;
	Mon, 29 Jul 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVQY8JZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF180034;
	Mon, 29 Jul 2024 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722255204; cv=none; b=MgBrOOFTV4a1Y+dO+AeB3vKVIjfuXbK4XuX14wlJVh3b3X9G274U+Rl54RCgulLrutHHk4J+un8+5wJ6HfjA/wI+UNqYFtvE9AUSpEJR0hWfD4wm7Yx2osaFxqeJf1dIiaTmx4tHUN1Phtpbo+v3bDdXuy6qOHjRhwZW8EBAd9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722255204; c=relaxed/simple;
	bh=bmKyeNJ8spozwo0XX+T9shKICyNJDGinEDD400P3wjk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Sr7vawxVGFX+DdM39MAkgfmTAyOv8n8Gh+k6Th5upFvCmQySeXS4DpsrXMTzumhPzATCHgCfdb0SEb7FW+iDWuF9glyoxOp5ZANyuByczrXhMorESBexzqVHUsefKmVuw3bviVPPDrvEfnXs0ybleekv5FFnLdsanNI5XLOwBtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVQY8JZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C0FC32786;
	Mon, 29 Jul 2024 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722255203;
	bh=bmKyeNJ8spozwo0XX+T9shKICyNJDGinEDD400P3wjk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=SVQY8JZUx3BiTcOuDCkpsqvnzYYDrax1Tb2+N1qiaJtgcE855KPcaia8wMFkEdKiw
	 E9M6rNuCnTQ4RZcBLZ6I/d8agamn9yTMsmNc7lSlp/nyRB2c0UQvbnAv7tVk36DoPf
	 CxfLpSClORNG+LOIvtRzJxioAdqHLMRD8zybUrBWLNezIthOL8aCbKUasg7VfkAnqe
	 0QmUls2CfO+UBeOkjT/1mtZcslKc10jHTZ79cpEeYgcur+L/DCH+VJvPivuPsiih1Z
	 eXrbV3yot1eyw4lSxW4izBNkbErRI23vSVyEitcpbI/nXT7Y/8V0rcbduiDCHHox9z
	 n1JRASoFnmmAQ==
Message-ID: <87607d2c-a4b1-4923-ba9f-9cfc56a0aa38@kernel.org>
Date: Mon, 29 Jul 2024 14:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
From: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
 <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 JDZelR9Xqh8=
In-Reply-To: <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 1:56 PM, Konrad Dybcio wrote:
> On 15.07.2024 10:04 PM, Akhil P Oommen wrote:
>> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>
>>> Add support for SMEM-based speed binning, which includes getting
>>> "feature code" and "product code" from said source and parsing them
>>> to form something that lets us match OPPs against.
>>>
>>> Due to the product code being ignored in the context of Adreno on
>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> 
> [...]
> 
>>>  
>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>  		speedbin = 0xffff;
>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>> +	adreno_gpu->speedbin = speedbin;
>>
>> There are some chipsets which uses both Speedbin and Socinfo data for
>> SKU detection [1].
> 
> 0_0
> 
> 
>> We don't need to worry about that logic for now. But
>> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
>> It will be difficult when we have to expose both to userspace.
>>
>> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
>> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
>> so I think we can use the rest of the 16 bits for SKU_ID. And within that
>> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
>> reserved for future PCODE.
> 
> Right, sounds reasonable. Hopefully nothing overflows..

+CC Elliot

Would you know whether these sizes ^ are going to be sufficient for
the foreseeable future?

Konrad

