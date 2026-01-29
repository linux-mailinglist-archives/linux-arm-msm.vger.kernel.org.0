Return-Path: <linux-arm-msm+bounces-91197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO70OFyIe2mlFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:18:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98CB2094
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6B0E3007896
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EBE33E379;
	Thu, 29 Jan 2026 16:18:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8258F326D53;
	Thu, 29 Jan 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703513; cv=none; b=tkarn/GPUSKrZCBxQ7K5qKfu/LFYzo+uGqV4K8fs8Cw86QPUHHNgrUjQUzhouxlFr4dfxG+qNEgXBVndY7vTmvfb8QFA/tP/MRnoAL7hfZ5H9mtYe2kf8crChg4VeZiSNz9cYteJk+VQHFsDv7751RHKj5A1lIWue9Utlj8SgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703513; c=relaxed/simple;
	bh=EggWaypS0xDUElOgXjuA/Mh+bWM7LI3BNFGtKj4jLhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHpES8EVvHR9EpmY2d3bZalBNJZzg0Eh/V1aJIX4w9MRALxG8ricZbpja4r80oH6pN9UOVoPMJU7ndekgZYjj3FhDsb2ydmxgJWF7m5Xah6mQ5Hx/HYO3TPdV7NnwqqQiwd1krE7QM5//fjzjI6QANjXO8Ox6jPrR7Mou1nz/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8CCCC4C442FB0B;
	Thu, 29 Jan 2026 17:18:00 +0100 (CET)
Message-ID: <b1c51aa9-19e5-4335-9b70-bbcc4d6def85@molgen.mpg.de>
Date: Thu, 29 Jan 2026 17:18:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string
 "qcom,qcc2072-bt" to yaml file.
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>,
 Mohammed Sameer Mulla <quic_mohamull@quicinc.com>,
 Harish Bandi <quic_hbandi@quicinc.com>, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
 <d180711b-7957-4252-b34b-81312705555b@molgen.mpg.de>
 <BY5PR02MB6946637904902544E6767829F189A@BY5PR02MB6946.namprd02.prod.outlook.com>
 <279d96ed-865c-4f15-a67c-ee1a94ea2c3e@oss.qualcomm.com>
 <fdc9cc27-aa12-4b62-bece-8bcc8c680ace@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <fdc9cc27-aa12-4b62-bece-8bcc8c680ace@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91197-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,kernel.org,bgdev.pl,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mpg.de:email,bgdev.pl:email,holtmann.org:email,quicinc.com:email]
X-Rspamd-Queue-Id: 5A98CB2094
X-Rspamd-Action: no action

Dear Vivek,


Am 29.01.26 um 06:59 schrieb Vivek Sahu:
> 
> On 1/20/2026 3:38 PM, Vivek Sahu wrote:
>>> ________________________________
>>> From: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Sent: 17 December 2025 19:44
>>> To: Vivek Sahu <vivesahu@qti.qualcomm.com>
>>> Cc: Marcel Holtmann <marcel@holtmann.org>; Luiz Augusto von Dentz 
>>> <luiz.dentz@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof 
>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; 
>>> Bartosz Golaszewski <brgl@bgdev.pl>; Balakrishna Godavarthi (QUIC) 
>>> <quic_bgodavar@quicinc.com>; Rocky Liao (QUIC) 
>>> <quic_rjliao@quicinc.com>; Mohammed Sameer Mulla (QUIC) 
>>> <quic_mohamull@quicinc.com>; Harish Bandi (QUIC) 
>>> <quic_hbandi@quicinc.com>; linux-bluetooth@vger.kernel.org <linux- 
>>> bluetooth@vger.kernel.org>; devicetree@vger.kernel.org 
>>> <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux- 
>>> kernel@vger.kernel.org>; linux-arm-msm@vger.kernel.org <linux-arm- 
>>> msm@vger.kernel.org>
>>> Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT 
>>> compatible string "qcom,qcc2072-bt" to yaml file.
>>>
>>> WARNING: This email originated from outside of Qualcomm. Please be 
>>> wary of any links or attachments, and do not enable macros.
>>>
>>> Dear Vivek,
>>>
>>>
>>> Thank you for your patch. The formatting is off, and the summary/title
>>> (subject) has two statements – look yourself in the archive [1]. Also
>>> the prefix seems wrong.
>>>
>>> Am 17.12.25 um 12:28 schrieb Vivek Kumar Sahu:
>>>> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
>>> Please elaborate by giving more context, why it is compatible, and I’d
>>> like to see how you tested this.
>>
>> The compatible string "qcom,qcc2072-bt" is defined in target dtsi file 
>> and it was tested on the hardware. The corresponding target specific 
>> dtsi file is currently merged in downstream.
> Please let me know if above statement gets you the answer of your question.
>>
>>>
>>>> ---
>>>> .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> index 6353a336f382..197248d6f7b8 100644
>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> @@ -28,6 +28,7 @@ properties:
>>>>          - qcom,wcn6750-bt
>>>>          - qcom,wcn6855-bt
>>>>          - qcom,wcn7850-bt
>>>> +      - qcom,qcc2072-bt
>>> Lacking more lines, I am not certain, but I maybe this should be sorted.
>> I'll address it in next patch of this commit.
> I just checked that "qca_btsoc_type" enum contains all the soc type 
> which need to be enabled for BT enablement on the target device.
> There are few places where logic of framing packets transferring
> between SoC  and Host depends on the which generation of the chip it
> is, refer api "qca_read_soc_version".>
> Do you still suggest to sort it here ?

Yes, I’d prefer it sorted to easily find entries in the list. I suggest 
to create a separate commit to sort qcom,qca6390-bt correctly, and then 
your patch on top with qcc ordered after qca.

>>>>      enable-gpios:
>>>>        maxItems: 1


Kind regards,

Paul


>>> [1]: https://lore.kernel.org/all/20251217112850.520572-1-vivesahu@qti.qualcomm.com/

