Return-Path: <linux-arm-msm+bounces-91644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GBTLQzEgWnZJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:46:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB8D70DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46224306C7D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0910B399002;
	Tue,  3 Feb 2026 09:44:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B908D28BA83;
	Tue,  3 Feb 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111854; cv=none; b=gPX2udONWXt7PelE6HpLZjUBzXdmYkBDChKqhzHK7hJuZwNjkJCmAQdL4UOXu/5DypsipOGVHTTdKjlhF5IZZ7sHzqNqaX6c1Z0XfCmjNy5iXkKglJZZcJRNrRE0U6Jaqo5dt9blXZDDpSHIT7+Urt/rjXrHZN6v1MsyaiaihEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111854; c=relaxed/simple;
	bh=LH85J6u+VV+g5aWO2q28Gxqi15HcIPs2peibxluuZDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvP00Y0eysWi3rR/P5/hFXYbTXJGbYCh615PzjadmHUKmTuVcEperoCthkukeidU3G3DQS70tRYv84kj9Dfmc/hY1dOpgS98ESUCy52YJm/E7w37buWIPMSOd+LZ9gHFPCVxUEsxPcRTjbsM+s9FS1rpcEXT1r0qBymS7aTr2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E187339;
	Tue,  3 Feb 2026 01:44:05 -0800 (PST)
Received: from [10.57.69.219] (unknown [10.57.69.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526223F632;
	Tue,  3 Feb 2026 01:44:09 -0800 (PST)
Message-ID: <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Date: Tue, 3 Feb 2026 09:44:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
 <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91644-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 32FB8D70DC
X-Rspamd-Action: no action

On 03/02/2026 09:36, Konrad Dybcio wrote:
> On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
>> On 03/02/2026 09:00, Jie Gan wrote:
>>>
>>>
>>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>>> compatible for probing.
>>>>>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>>    1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>>> index e002f87361ad..68853db52bef 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> @@ -29,6 +29,10 @@ properties:
>>>>>        oneOf:
>>>>>          - items:
>>>>>              - enum:
>>>>> +              - qcom,glymur-ctcu
>>>>> +              - qcom,hamoa-ctcu
>>>>> +              - qcom,kaanapali-ctcu
>>>>> +              - qcom,pakala-ctcu
>>>>
>>>> Platforms with existing numeric compatibles should continue to use them,
>>>> so that the mess is somewhat containable
>>>
>>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
>>
>> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
>> a generic,
>>
>> qcom,coresight-ctcu
> 
> It's a huge anti-pattern with the DT maintainers, since a compatible is
> the only way to effectively differentiate different implementations (i.e.
> instances on different SoCs) of an IP block

Do you mean, same IP block integrated to different SoC ? Or are they
different implementations altogether ? Why are these not applicable for
other components ? (e.g., Tnoc, I-Tnoc, TPDA, TPDM etc ?)

> 
> This is important for the case where a DTB is shipped as part of firmware
> and can not be replaced - if some quirk needs to be applied retroactively,
> we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
> users of the effectively-identical IP block

Fair enough, thank for the explanation.

Kind regards
Suzuki

> 
> In this case, we're already reducing the impact on the driver, as that
> only looks for the single fallback compatible (qcom,sa8775p-ctcu)
> 
> Konrad


