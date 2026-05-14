Return-Path: <linux-arm-msm+bounces-107665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8bGxJljhBWqNdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:51:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FA5437CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E76203048624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028AF40DFBE;
	Thu, 14 May 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4WmqPBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B33E5A09;
	Thu, 14 May 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769813; cv=none; b=nldwxwYWF9VdPlJVomyn22wVP36xjb1U7e5uj2a33opCYMalW+RgwjAeZ3HASE2Qq9GsGCzAt8VwB0dDukRWdzrhij+A6O51cAmpr2FVOQmKIaxN9rxfc8kq6Fi6BqP0Wg2L4qiq4UjXsP6mAinlkPbOm/UHnRh2SCGry74jXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769813; c=relaxed/simple;
	bh=i/jK49CxT9oEICFn8p23oUEK5wmemyon/94BmVW39cs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sxPqbfPLDr5YEF2jHhBYetDVHkEMTpDHnvfVcr1FzsWfhyqqQo3EOYkdBUlORO8qm3Wlqq0Z73Lu0NAFPkpFVDVeUoKBr/A9Wg+iU5Q9vaLqFFgOi9DycpLeDIYmQTObs+0QusguRhMDPkRatQf1HcUWI0/dArYAFB0Fkqr2bH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4WmqPBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF92C2BCB8;
	Thu, 14 May 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769813;
	bh=i/jK49CxT9oEICFn8p23oUEK5wmemyon/94BmVW39cs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=e4WmqPBFGltctSkP7hkYFoILiyVQ0CjDHtUNMhKg5NzJqYCpJqw+AfpzetBt+H9PF
	 Pq9L0rDbvja/SVfyJA/3OQMFFk29B/2pHmYkcpAC4XP04mDB+ZBIjO0iL9TU62R9rz
	 3Om9EVgx9+YsBG99PI2ub+4l8BO7QHzlsN7EoU94slfxpYZgRjZS8uHjveFoQRczSa
	 sT2NieiwSrmHkWKBeAwQ5P3h/O35h5FLJUz4rXgxX8yaLjkiNo/1w9XH47Hr9HVnyL
	 CmdIrQar5YLvQyBlV/dckBnpzR9pb+Det6ZcHOZHLuYPKLGAv2qv/1PFQ/nxOPWONJ
	 GCjZAyz5yIJXQ==
Message-ID: <e5552777-a449-4640-993f-5cf9bacbda56@kernel.org>
Date: Thu, 14 May 2026 16:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
 <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
 <eebae734-3b03-4848-a728-a29d8a210e57@kernel.org>
 <dfc3039b-c45c-44d3-85c0-0d131bb5e55a@oss.qualcomm.com>
 <27cc44d7-b3d1-4610-8257-4aad4115cd36@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <27cc44d7-b3d1-4610-8257-4aad4115cd36@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 096FA5437CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107665-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 14/05/2026 16:39, Krzysztof Kozlowski wrote:
> On 08/05/2026 18:03, Imran Shaik wrote:
>>
>>
>> On 05-05-2026 02:23 pm, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 10:50, Imran Shaik wrote:
>>>>
>>>>
>>>> On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
>>>>> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>>>>>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>>>>>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>>>>>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
>>>>>
>>>>> The entire point of having a generic compatible is that it MUST match
>>>>> all devices. If it does not, then it is pointless to push that generic
>>>>> compatible.
>>>>>
>>>>> I am speaking about qcom,cpufreq-epss.
>>>>>
>>>>> That's nothing new, I was arguing about it already, but now you have
>>>>> confirmation of the mess introduced by generic compatibles. Solution is
>>>>> not to add more generic compatibles, because what will be next?
>>>>> qcom,cpufreq-epss-lighter?
>>>>> qcom,cpufreq-epss-more-lite?
>>>>> qcom,cpufreq-epss-high?
>>>>>
>>>>> Same was here:
>>>>> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
>>>>>
>>>>> So that's second time I object and do object for every new instance. No
>>>>> to generic compatibles, they are proven to be wrong at least for
>>>>> Qualcomm.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> There is no functional change to the latest EPSS hardware
>>>> (qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU
>>>> frequency scaling block, which is a predecessor of EPSS and is referred
>>>> to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the
>>>> maximum number of frequency look up table (LUT) entries.
>>>>
>>>> This constrained EPSS block is not specific to Shikra and can be reused
>>>> by other SoCs that implement the same hardware. Hence, we have added a
>>>> separate epss-lite compatible and reused the existing bindings, as all
>>>> other aspects of the hardware behavior and interface remain identical.
>>>
>>> I don't understand how any of this is relevant to my comment. I know
>>> what you did.
>>>
>>
>> Hi Krzysztof,
>>
>> The intent behind proposing an epss-lite compatible was to describe a 
>> common hardware variant and avoid introducing SoC‑specific handling in 
>> the cpufreq driver.
> 
> And I already objected. Look:
> 
> "So that's second time I object and do object for every new instance. No
> to generic compatibles"
> 
> I provided arguments for that in the past.
> 
> NAK
> 
> Best regards,

I already provided the arguments here:

"The entire point of having a generic compatible is that it MUST match
all devices. If it does not, then it is pointless to push that generic
compatible."

so if you have generic compatible, IT MUST be used. You cannot keep
adding more generic compatibles just because existing generic compatible
is not generic enough!

I gave you detailed reasoning and even example why this approach is
getting ridiculous, but you just have to keep pushing your solution to
maintainers and keep asking the same.

You were given the answer and the argument. Now you are just wasting
maintainers time.

Best regards,
Krzysztof

