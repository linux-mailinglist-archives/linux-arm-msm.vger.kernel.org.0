Return-Path: <linux-arm-msm+bounces-20177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3D8CBB93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 08:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A3B0B21D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 06:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FE379952;
	Wed, 22 May 2024 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0iMaK/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC6763EE;
	Wed, 22 May 2024 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716360591; cv=none; b=g2PzQ/pipeoD0IPZWDUv2uWxPJnMdnNFc6H6pheHS0v4H0h9AJ5EZAmD5wgMu1iSYy4kngv9e1QMd2pcgsj5KJ9ZJKZbgFG/t9mCAMzS82Bfe2IONrG/BJzG/PDzlKLiCRMsAYgPwgGCapiXafpEUfWgTxfxAk+EO8TJTED4mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716360591; c=relaxed/simple;
	bh=GKIxfqewTLJtrl909K/lWYRo22JlV2kAJyJlmMIgcdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+MVE7RzmTRYErdJI+XKGyabM2qspwykuJ3WuBRybRVWxBCe/ZoLjecw3rXOnWksF0CnxSaGaw9qBCi2Prl/oRNOYOlm5vYK8M0O0l/jfd2QmCDfTnYqTdGMasC7vUbj7jyRvFVW3+aPkM4JP8iU37zABWgvcWVubaRr4fIyc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0iMaK/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1E0C2BD11;
	Wed, 22 May 2024 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716360590;
	bh=GKIxfqewTLJtrl909K/lWYRo22JlV2kAJyJlmMIgcdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0iMaK/VQKUmVBS/mUPHbx5BAqNY2L/ABCvPvsS9rgGRHuVKv68sj3R5foOr2b2D3
	 FTN7q4GRFuFDokzSvj/Uv9icsUNoN/n/UYEedheYjXUsWb0aKna2YlbmWzcJUju6CC
	 nFUF3po1fEP83Vlu9rXp9LPfNnLZZxIYp017YN8gYClJFXj9DQhYsIHnNKeBF1wUfd
	 KhzZz0U8FTJ1UHutaWA5EPPQ6UbNyudKv4mEibQIdWWFta2hNNIMe4CVN6hMICSQb7
	 Fy3B+kXzA731ACzVlnKTOS0TzcEUlX1qZq9B9XXSHTU6GHMifwqltwnsOISMATltqd
	 bRDkTio+eHHCw==
Message-ID: <12896bf6-412c-40af-9ad5-f9391ff81f63@kernel.org>
Date: Wed, 22 May 2024 08:49:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying
 mboxes instead of qcom,ipc
To: Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz>
 <12437992.O9o76ZdvQC@g550jk>
 <06565532-987a-465a-b2ab-a03fce7279e1@kernel.org> <5780452.DvuYhMxLoT@g550jk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5780452.DvuYhMxLoT@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 22:35, Luca Weiss wrote:
> On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
>> On 20/05/2024 17:11, Luca Weiss wrote:
>>> Hi Krzysztof
>>>
>>> Ack, sounds good.
>>>
>>> Maybe also from you, any opinion between these two binding styles?
>>>
>>> So first using index of mboxes for the numbering, where for the known
>>> usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
>>>
>>> The second variant is using mbox-names to get the correct channel-mbox
>>> mapping.
>>>
>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>> +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>>
>>> vs.
>>>
>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>> +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>> +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
>>
>> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
>> in first case?
> 
> Actually not, ipc-0 would be permissible by the driver, used for the 0th host
> 
> e.g. from:
> 
> 	/* Iterate over all hosts to check whom wants a kick */
> 	for (host = 0; host < smsm->num_hosts; host++) {
> 		hostp = &smsm->hosts[host];
> 
> Even though no mailbox is specified in any upstream dts for this 0th host I
> didn't want the bindings to restrict that, that's why in the first example
> there's an empty element (<0>) for the 0th smsm host
> 
>> Anyway, the question is if you need to know that some
>> mailbox is missing. But then it is weird to name them "ipc-1" etc.
> 
> In either case we'd just query the mbox (either by name or index) and then
> see if it's there? Not quite sure I understand the sentence..
> Pretty sure either binding would work the same way.

The question is: does the driver care only about having some mailboxes
or the driver cares about each specific mailbox? IOW, is skipping ipc-0
important for the driver?


Best regards,
Krzysztof


