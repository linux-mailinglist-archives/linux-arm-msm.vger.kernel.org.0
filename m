Return-Path: <linux-arm-msm+bounces-103896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBrbMuE252no5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:35:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39C4383F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7E84300278B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C139C38B14D;
	Tue, 21 Apr 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="izYgBXCI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p6gVPAhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF14379973;
	Tue, 21 Apr 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760350; cv=none; b=fwmg67d70FK/YweV8Ai8d8NQLh37N5ryNVTX6u5zd2/idNsoVo/jw8O5JL5MvOmpr7UP5Yijy1fY06PaKWoqdFgY/TY1Q7sTe8VOdskOxirhsYZsjrjKs7W+sogDQPwgSrdvCvF2zzvnnf81qYM73YeocpkJhKedlBdgo+zVQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760350; c=relaxed/simple;
	bh=6BHMH8mEr/0NOe6m1qw10Yn/BZF98BlXaap5gN6nvH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdScIl4Hh2rY4/w0hZmXqnWYStddOnWEUAzUs7qlDyLaCQHu7bktRZchoAinYrPvkpvLxpHi8gw9LVv3N0Gbpkok1jUfNsHyZSFUGuhtj+z12iLPQlbRgXLD+omLpbFXR8sc3v5HzYYVKO43QFp8yWnf7XGtEExAzd3JBvzkuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=izYgBXCI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p6gVPAhF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776760331; bh=G7QDpUBwk9YbJvVoe+zZtV5
	mQuVtlP71VBKXVRm/IQM=; b=izYgBXCI2m9YmXbO45jExsK00zULgY78inxidcx1Y9XQ8iS5n1
	knL2OxoRPmcIE8aXa9U/TBFEtNf+GTCuY4mCphQdqt4bd8Gnm/rvD+p77gM1d8MyJJqHFRqcvxU
	v+dHrQIEIW7iMJoK35fvXNEQsBuYW6AY4rCh+fqAcNp3FEaeM38VP6X7vMs17z6ZvUOVXQv8n48
	I59VvwCFV9ttrE0aM7/ywlh8SwpnOAEI1+NKm2ZzB1roLP5HwBe3/06R4Z5pWqNN4P0v1cvMVfa
	sM/m+fOy1uMvB/IkEU2JX4LVE09zVCE4wWR5iM+znN1q3r/KN6/hdVEOY0TxhurJpAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776760331; bh=G7QDpUBwk9YbJvVoe+zZtV5
	mQuVtlP71VBKXVRm/IQM=; b=p6gVPAhF7Bgi5JCkIb/5uPFw5ckAzvHkr2dY/iXAeuMmNg3/19
	3a9TDIMn6TnoVUhMoB/4fceiL6d2DvTEMjDw==;
Message-ID: <a32fda72-6bf8-479b-bae3-2e551671945a@mainlining.org>
Date: Tue, 21 Apr 2026 11:32:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 quic_chennak@quicinc.com, quic_bkumar@quicinc.com
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103896-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,9f800000:email,f6000000:email,f6800000:email]
X-Rspamd-Queue-Id: 8C39C4383F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


21.04.2026 11:29, Ekansh Gupta wrote:
> On 17-04-2026 20:45, Ekansh Gupta wrote:
>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>> Downstream [1] this region is marked as shared and reusable so
>>>> describe it that way.
>>>>
>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>> +Ekansh some insight, please?
>>>
>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>> and I would assume that making it not-"no-map" could introduce issues
>>> when the OS tries to access that region
>>>
>> With the current version and the upcoming planned enhancements, I don't
>> see any major benefits of making this as not-"no-map".
>>
>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>> entire memory-region to lpass VMIDs. and un-assign it only during
>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>> where this memory is dumped in case of SSR or audio PDR using minidump,
>> so marking it `reusable` might make sense there, but that dump logic is
>> not added upstream.
>>
>> Upon checking the DT, I see a bigger problem here, this memory-region
>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>> Please correct me if I am wrong about this point.
>>
>> [1]
>> https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
> Just had a new finding on this. There is one more reason why it is not
> added as no-map in downstream. This audio PD carve-out region is not
> defined for most of the platform's memory-map.
>
> With a change to qcom_scm the memory during boot-up, issue was observed
> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
> was causing boot-up issues.
>
> So defining it as no-map might not be correct and it might need be
> changed for all DT files.
So It needs to be set as not-"no-map"?
> I don't have a history of why it was added as a "no-map" region on
> upstream but looks like same has been followed for almost all the
> platforms. This needs to be modified based on the memory-maps and the
> region needs to allocate memory in a dynamic manner.
>
> [1] https://github.com/qualcomm-linux/kernel/pull/487
>
> //Ekansh
>> //Ekansh
>>> Konrad
>>>
>>>
>>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> index 4b47efdb57b2..13094b5e9339 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>>   		};
>>>>   
>>>>   		adsp_mem: adsp-region@f6000000 {
>>>> +			compatible = "shared-dma-pool";
>>>>   			reg = <0x0 0xf6000000 0x0 0x800000>;
>>>> -			no-map;
>>>> +			reusable;
>>>>   		};
>>>>   
>>>>   		qseecom_mem: qseecom-region@f6800000 {
>>>>
-- 
Best regards,
Nickolay


