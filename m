Return-Path: <linux-arm-msm+bounces-82314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B60C6997A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9D794E5AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81364353891;
	Tue, 18 Nov 2025 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prvo/pWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3234F490;
	Tue, 18 Nov 2025 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472350; cv=none; b=r/MqGKsbOxo8cubhdsgUnbfD21Wix/qUvhC+dvijedQvYjzMI3CY1R1foM7PzKXuV0sL9u0FBM3vKIRWuXFkSDrvX1UDwOPMpjWVisHJW8M8iMrvb4+cupV0Jfmfub4BJUGNBa9d+pIm6vDRp9zi/GFYoSuxPDhJHiQPJ1OUfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472350; c=relaxed/simple;
	bh=x2Bh3eTSzSdkREcpE9REhcZdsNLWX3O194BwuQxxPNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ye+JknsKUab9IiLo3GKdc8a9KkBNpz1WbmkhLrOdfEHCHmrFWURNifVeFohW427Bh73/pybUxjTC5CAWzXb13rP0xWyPO4pSJBy39z8wzib0fQ1euWuLvmWvo2LDKLJc1eLK/4b0pStmcxuojJQYH88O/Fj8JwwXgzXcXCPuVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prvo/pWX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79E4C2BCB4;
	Tue, 18 Nov 2025 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763472349;
	bh=x2Bh3eTSzSdkREcpE9REhcZdsNLWX3O194BwuQxxPNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=prvo/pWX+28QfWq49D80twacWVlNX9zvtPkZOHqGvrdwz8bk3uD5B3g+sO7Y+9g/I
	 H+3q4fHViMibfDZv6qvoYHasNHLod9QA8Snz4ZVCxWD2WVmF9AzG8Nf0wzviYjnORF
	 NmXzaoCZDBmbx5ekDV/B5EgweCWMp1F6A9vBYNkfMcRTtIlMkf6BzojkIw/iWABUTa
	 Zg5rY/eU2yNXI1CDDXFTUWqjOSPKWizQo3TKPCz+IfMOZd5E9m+tTiidRWdmu/kgvf
	 cZOn9Y9tZdGRtZdL3d3R0ioHdwkvNoPjl0gF7CZ2Y2GQ6HZS/5l4M3wXl/KfwiKf3n
	 o5mROSvatKCiA==
Message-ID: <9fff160b-e8ef-4a28-8445-e53cc5ffc407@kernel.org>
Date: Tue, 18 Nov 2025 14:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
 <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
 <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
 <d5sn56mlwaae2hou7t6pr24h2pojvjcv4ufsxg4lbbnk6vlpfi@xc5e5uekofbt>
 <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
 <l4ay27t4jbycohdsf4epxftq43kceuzymb6l2tx42lxyol3btk@vsof3bbmvrrl>
 <c89a2cae-ae96-46ee-a990-0c0ef13fe4de@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c89a2cae-ae96-46ee-a990-0c0ef13fe4de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2025 14:16, Konrad Dybcio wrote:
> On 11/18/25 1:52 PM, Dmitry Baryshkov wrote:
>> On Tue, Nov 18, 2025 at 01:32:51PM +0100, Krzysztof Kozlowski wrote:
>>> On 18/11/2025 13:25, Dmitry Baryshkov wrote:
>>>> On Tue, Nov 18, 2025 at 12:39:51PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 17/11/2025 12:35, Konrad Dybcio wrote:
>>>>>> On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
>>>>>>> Make use of the __cleanup() attribute for device_node pointers to simplify
>>>>>>> resource management and remove explicit of_node_put() calls.
>>>>>>>
>>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> This is obviously wrong and not helpful patch.
>>>>
>>>> Describing why it is wrong would be helpful (or having a pointer to an
>>>> explanation). Bear in mind people who read email archives and find this
>>>> very brief note.
>>>
>>> I gave some rationale in other patches, but summarizing:
>>> 1. It is against cleanup.h - author did not bother to read it - which
>>> clearly asks for constructor with declaration. This was discussed many
>>> times in the list, including many bugs and explicit checkpatch warning
>>> (on LKML) because people don't bother to read cleanup.h.
> 
> Looks like I didn't read it either.. now that I did, I see that
> _free(x) = NULL is somewhat of an anti-pattern, but none of these

True

> patches seem to introduce any bugs related to it

True

> 
>>> 2. It makes simple get+put code complicated, not simpler.
> 
> Here I tend to disagree.. 

of_get and immediate of_put is really obvious and easy to read. It is
really a common pattern.

OTOH code like:

	struct device_node *np = of_parse_whatever_which_is_get()
	...
	bunch of code here where np is actually used.
	...
	... more code
	return;

is not simple. The lifecycle of this variable becomes very long and
where it is acquired - at beginning - causes question - why do you need
to acquire it there?

That's why cleanup.h has VERY specific syntax different than rest of kernel.

If contributor does not know this syntax, don't send the patches. They
are wrong.



> 
>>> 3. It grows the scope of OF reference without benefits.
> 
> This makes sense
> 
> Ultimately as you've noticed, this is mostly a cosmetic change and
> I don't mind it going either way

It is not cosmetic. It is anti-pattern.

Anti-patterns, even without introducing bugs, make the code WORSE to
maintain. Worse code is not cosmetic.


Best regards,
Krzysztof

