Return-Path: <linux-arm-msm+bounces-92018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBCnMH3HhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:50:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B36CFCD10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2858C301FCA0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BCA38F249;
	Fri,  6 Feb 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugsp2+eV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6736E484;
	Fri,  6 Feb 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375034; cv=none; b=S7mlJDzy8RsCCCMrmwOCzXaA1Tg3tV0DYJsH9vir5kO7U/fmk4BDQppulTPewe8EFuSnCwcTCAVhjhwsko/sIG2KNnrLNd2E97OIDjiTQz7TQSlkb569xHsMuYBy3YpW/EHX32/2ITk8mjX1yfV3v/S2dQLgDhi1YuAkvbDSyVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375034; c=relaxed/simple;
	bh=34L2SW/qxeY9BE4lfUsgbL+hNBIIFynrgo6CO+UGVf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He8ccZAWbbZlhUGZLzJL1DgcPJg3InaGJDdTbiy2n59M6u4qgjo1FkyRjz0CrJcoQY6m86ZfAYIrEjVWUJY7cozPhihjYdWoWa/92D1SPkh5dsm/IaDg36n4a08soxIekGs5uC+MfM2m1HgSCF6DJMgzAPuYP+EmNXU+qxNzVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugsp2+eV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC44AC116C6;
	Fri,  6 Feb 2026 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770375034;
	bh=34L2SW/qxeY9BE4lfUsgbL+hNBIIFynrgo6CO+UGVf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ugsp2+eVBrc8zbeCNb0piLAaAGZoDfqoSx3ZpKUK0RrRM7y8ShIukNgtegBPB7GpV
	 /hFD9yreKvMvB7nL4cRzRIdi3iXiUKZ167by6YX9cOqCbzxDuG1LwYuvY8oTW8VCIq
	 wudMY1i/9sUIC7Hw9dgoEaOycX6lZ+e+F3EKGPdfvs2189/qCqnuhUgpzgfwjJTQ+a
	 vrjwC3jFqcZmsKROGvIOn53Y3+XVBBG1L0AsrzFGOQxTv4VDZ7oMrW1yJEaEm2jA8j
	 9NqeA308vXV1B9J+M2NbwctbSareGHRcQ5a8x35ifwJG6dPV26aUhp4x1xSfBs/SUP
	 lrqz/W/QQpldw==
Message-ID: <6efcdf51-bdb1-4dfc-aa5e-8b7dc8c68cd3@kernel.org>
Date: Fri, 6 Feb 2026 11:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require power-domain
 and iface clk
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
 Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
 Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
 <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
 <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
 <7216c86d-2b87-496c-9548-ccdcb3c98b6b@oss.qualcomm.com>
 <1f99db18-d76c-4b87-9e30-423eee7037e1@oss.qualcomm.com>
 <dd34525c-0a25-47ae-9061-c4c7ab708306@kernel.org>
 <2830a189-a5ce-45a0-92fe-7a01c3b012a7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2830a189-a5ce-45a0-92fe-7a01c3b012a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92018-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3B36CFCD10
X-Rspamd-Action: no action

On 06/02/2026 11:07, Harshal Dev wrote:
> Hi Krzysztof,
> 
> On 2/5/2026 4:47 PM, Krzysztof Kozlowski wrote:
>> On 03/02/2026 10:26, Harshal Dev wrote:
>>> Hi Krzysztof and Konrad,
>>>
>>> On 1/26/2026 3:59 PM, Konrad Dybcio wrote:
>>>> On 1/23/26 12:04 PM, Harshal Dev wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
>>>>>> On 23/01/2026 08:11, Harshal Dev wrote:
>>>>>>> Update the inline-crypto engine DT binding to reflect that power-domain and
>>>>>>> clock-names are now mandatory. Also update the maximum number of clocks
>>>>>>> that can be specified to two. These new fields are mandatory because ICE
>>>>>>> needs to vote on the power domain before it attempts to vote on the core
>>>>>>> and iface clocks to avoid clock 'stuck' issues.
>>>>>>>
>>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
>>>>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>> index c3408dcf5d20..1c2416117d4c 100644
>>>>>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>> @@ -28,12 +28,20 @@ properties:
>>>>>>>      maxItems: 1
>>>>>>>  
>>>>>>>    clocks:
>>>>>>> +    maxItems: 2
>>>>>>
>>>>>> This is ABI break and your commit msg suggests things were not perfect,
>>>>>> but it is not explicit - was this working or not? How is it that ICE was
>>>>>> never tested?
>>>>>>
>>>>>
>>>>> I took some time to educate myself on the point of DT bindings stability being a
>>>>> strict requirement now, so I understand how these changes are breaking ABI, I'll
>>>>> send a better version of this again.
>>>>>
>>>>> As for your question of how it was working till now, it seems that
>>>>> things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
>>>>> flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
>>>>> depends) initiates probe _before_ the unused clocks and power-domains are
>>>>> disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
>>>>> isn't observed (since the clocks and power domains are already enabled).
>>>>> Perhaps I should write this scenario explicitly in the commit message?
>>>>>
>>>>> To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
>>>>> When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
>>>>> before.
>>>>
>>>> You must not assume any particular kernel configuration
>>>>
>>>> clk_ignore_unused is a hack which leads to situations like this, since
>>>> the bootloader doesn't clean up clocks it turned on, which leads to
>>>> situations like this where someone who previously wrote this binding
>>>> didn't care enough to **actually** test whether this device can operate
>>>> with only the set of clocks it requires
>>>>
>>>> I believe in this case it absolutely makes sense to break things, but
>>>> you must put the backstory in writing, in the commit message
>>>>
>>>
>>> I took some more time to think this through, and I agree with you now Konrad.
>>>
>>> These DT bindings appear to be invalid from day-1. ICE being an independent
>>> and common IP for both UFS and SDCC, it cannot operate correctly without its
>>> power-domain and clocks being enabled first. Hence, it should be mandatory for
>>> them to be specified in the DT-node and the same should be reflected in the DT
>>> binding.
>>>
>>> The only reason I can think of for omitting the 'power-domain' and 'iface' clock
>>> in the original DT-binding for ICE is because we failed to test the driver on
>>> a production kernel where the 'clk_ignore_unused' flag is not passed on the cmdline.
>>
>> That's a reason to change ABI in the bindings, but not a reason to break
>> in-kernel or out of tree DTS.
>>
>>> Or if we did test that way, we were just lucky to not run into a timing scenario
>>> where the probe for the driver is attempted _after_ the clocks are turned off by the
>>> kernel.
>>>
>>> Sending a new patch, which makes these two resources optional (to preserve the DT
>>> binding) would either imply that we are make this bug fix optional as well or
>>> asking the reporter to resort to some workaround such as overriding
>>> CONFIG_SCSI_UFS_QCOM to 'y'.
>>
>> Either I do not understand the point or you still insist on breaking a
>> working DTS on kernels with clk_ignore_unused, just because what
>> exactly? You claim it did not work, but in fact it did work. So you
>> claim it worked by luck, right? And what this patchset achieves? It
>> breaks this "work by luck" into "100% not working and broken". I do not
>> see how is this an improvement.
>>
> 
> My point is something more fundamental. It worked before and it will still continue
> to work if:
> 1. We pass the 'clk_ignore_unused' flag. or,
> 2. If the Linux distro is overriding CONFIG_SCSI_UFS_QCOM to 'y'.

I do not agree with this. I already commented about your driver. If you
do not believe me, apply your driver patch and show the test results of
existing working device.


> 
> But that does not change the fact that the current DT binding does not fully describe all
> the resources required by the hardware block to function correctly.
> 
>> My NAK for driver change stays. This is wrong approach - you cannot
>> break working DTS.
>>
> 
> I agree that this patch in it's current form will break both the in-kernel and
> out of tree DTS written in accordance with the old binding. If this isn't acceptable

What? You just said few lines above:
"it will still continue to work if:"

So either this will continue to work or not. I don't understand this
thread and honestly do not have patience for it. I gave you already
reasoning what is wrong and why it is. Now it is just wasting my time.

Best regards,
Krzysztof

