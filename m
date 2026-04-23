Return-Path: <linux-arm-msm+bounces-104362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG63CPs06mk+xAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:04:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918B45410E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B13A03054BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E578435B62A;
	Thu, 23 Apr 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Fnr1ehOv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kXUbMxxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A6356A0A;
	Thu, 23 Apr 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956454; cv=none; b=B+uyeiK8mzyYqqTMIOIFtWXeoyUnz4+VdShCRjHAPd0ISR5Q1huR2IcHuM8Hgdff3hSfei5cGCSXd6uFhCp1vfdjwEinXFxbfSi0mg1SEoczD5lMr2RtUtwEsL4S/RwWTwjng5rETboTNUx0sia+8rOyRgT9mlMFVHjzEohmnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956454; c=relaxed/simple;
	bh=2l3rTPexjafIVGeQo/DBMOtwsxaQACO7NLqJAnr+pAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qak0uEqMagp7Asmtux4vSMBzaOf4VOv/t+c39oClCwWNpTsQuVejJx3zwo9p9rGJKBHlX85BFKFua1hWRGvBdquj0oFmA8/7Ow/G29hsbC9NAWpFNxfiS+vf7l+oERpSaSMNMLvFP5fUqJnr0ej/rf9SkKgrnWZb1tWQvKO1KcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Fnr1ehOv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kXUbMxxZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776956450; bh=yxRTbkH0ThQD7GDjv6mAYBb
	BxFNanB4TidxxS4bJLiQ=; b=Fnr1ehOvpzvlGVlhSuQZ2lIiyx5N+okiCtov23RjY5ylGQUJ0J
	EmgnAcD/wUpINPIsHFvmmBiigmL+AqN/TJX5DPL2OnQ8heIkbbNc/iYHYGn9Mzbb5GqTbBk6Vn4
	b6QNrcIV+DuOzbndWiUO6UzLg4L+pYEZU/Dg8JAA8Uvjnu0BiqopvPjNoV2mQSRv52TO+lttgUK
	iOhPG4/U0PAOuESYcDgePz6thl/LhD66mdZ0a/DuLm0AynrZJCCkayNtrfAet82e8wv1ZtNl+Mm
	Tzrb0o29IICoOJiBdLpXUGcPV6heifjSg9XIe+oAsSbVBQW/GUK5yR6AJlKgVK80jyw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776956450; bh=yxRTbkH0ThQD7GDjv6mAYBb
	BxFNanB4TidxxS4bJLiQ=; b=kXUbMxxZM3O+jzwTe/YIni7repEf5/w6EqTqAoRwG+jhnACnSs
	jlqHzPUmAItRW9HCzNO6nRGcFBeaKBsDoXBQ==;
Message-ID: <7ca1a729-b8c5-428f-8785-287c5c7c73b3@mainlining.org>
Date: Thu, 23 Apr 2026 18:00:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
 <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
 <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-104362-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[mainlining.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 9918B45410E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


23.04.2026 17:39, Ekansh Gupta пишет:
> On 23-04-2026 19:18, Nickolay Goppen wrote:
>> 23.04.2026 16:08, Konrad Dybcio пишет:
>>> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>>>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>>>> assign it to the ADSP FastRPC node.
>>>>>>
>>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>>> boot/dts/qcom/sdm630.dtsi
>>>>>> index 36b419dea153..af2bc29ccdad 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>>>                         compatible = "qcom,fastrpc";
>>>>>>                         qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>                         label = "adsp";
>>>>>> +                    memory-region = <&adsp_mem>;
>>>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>>>> Please double-check that, the VMID used to be different on
>>>>> older SoCs
>>>> Do you know how to check that?
>>> The least painful way is probably to add debug prints to what downstream
>>> calls hyp_assign_phys()
>> I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:
>>
>> VMID_HLOS= 0x3
>> VMID_CP_ADSP_SHARED33
> This VMID looks correct.
>
> Just had a look at the downstream fastrpc driver code in the same tree.
> The fastrpc node in DT[1] is adding a "qcom,fastrpc-vmid-heap-shared"
> property. For this property, the VMID is getting set as
> "VMID_CP_ADSP_SHARED" in the downstream fastrpc driver[2]. The
> hyp_assign is happening during daemon attach call[3] with srcVM being
> "VMID_HLOS".
>
> Thanks Konrad for highlighting this difference in VMID.
>
> [1]
> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1699
> [2]
> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
> [3]
> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L1999
Didn't find the "VMID_CP_ADSP_SHARED 0x33" in the upstream bindings. 
Does it need to be added to the bindings?
>>> Konrad

-- 
Best regards,
Nickolay


