Return-Path: <linux-arm-msm+bounces-114322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4TqvDJ20O2pwbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:42:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEF6BD720
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="bxv3j9b/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6580300A396
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB7824E4AF;
	Wed, 24 Jun 2026 10:42:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D51DFDA1;
	Wed, 24 Jun 2026 10:42:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297754; cv=none; b=q9yZSta+XQLJFg+SMw/P3ynqEQBBkMBAC9q/I+PvOM1X5ia9dXFPBib9nsO/Jw5DbqfpZueuT79Z9gM+coHQk3m/AT+mvcF0KPKlH64IJgJS8bJATzPFt06bOGE9DBVRGGmgrWhqfXfjJ8EfreoA8rv2eqQRYpAtWZI1vUEywzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297754; c=relaxed/simple;
	bh=K5uIVF+4t/Z6513AKE88v9COf2lp5twbOGz0jK+e9NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h26TobBstWd78C/tzRUn+x+D0zHQzz7yxmgFX19rCbYD53SV3LfTVfqOeE7/bB+v+n0za0wcwmd3mLTr8SGFFAOZXaFtblZSnJquszsRyHyKwwrOdChDLQfMMv0R0qVt8BC6/g8gSyNV+KqrABl/D0UOuZp+h3VMwmkQP69IVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxv3j9b/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9002B1F000E9;
	Wed, 24 Jun 2026 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297752;
	bh=TgCW18jrTi0lhT3B0VojewiKRfLj/+SgsYtizrBflhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bxv3j9b/krygNokHUkhESnjxu7WUcA5YghHnD+LEn7iD1rNYwM4CAGNOH+zkd6Urr
	 uC/YWjowzVVE5/6q6p0CIKEGbBwVYsKIKa0icXGKKgFR7ruA2j9hdOdoAV+bVrDlOQ
	 rI0oWy1dUwjUjw5i0A+V8pKS3XzHxia91B2rt65sJHcj/KbPu+aaoidIAYxqY6RI06
	 bkNfZH7m+Q7jyDCLfC/vtnVk8YTjhQQ/JSwm8+xi5pD4XSdmof/PAjhCFjEukco7Rh
	 3qyjOdtuqv+gJMH+AAZWPApmlB08SFMasPCq/cV0CCzn6kljDrRJRlz4o6sB19I9Vk
	 nLaj8Cxy2NqPA==
Message-ID: <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
Date: Wed, 24 Jun 2026 12:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83EEF6BD720

On 18/06/2026 09:17, Daniel Lezcano wrote:
> On 6/16/26 06:21, Krzysztof Kozlowski wrote:
>> On 15/06/2026 14:30, Daniel Lezcano wrote:
>>> Hi Gaurav,
>>>>>> thanks for review, shall i use driver data, which is basically pas
>>>>>> data structure like below:
>>>>>>
>>>>>> static const struct qcom_pas_data {
>>>>>>       .crash_reason_smem = 601,
>>>>>>       .firmware_name = "cdsp.mdt",
>>>>>>       .tmd_names = (const char *[]){"xyz", NULL},
>>>>>>       .num_tmds = 1,
>>>>>>
>>>>>> Is something like above acceptable? and this will also help to filter
>>>>>> tmd names as well?
>>>>>
>>>>>
>>>>> How the thermal framework will bind the thermal zone with the TMD ?
>>>>> (node pointer, id) ?
>>>>>
>>>>
>>>> Hi Daniel,
>>>>
>>>> thanks for review.
>>>>
>>>> With id only, in this case instead of taking tmd names from device tree,
>>>> qmi_tmd will take tmd name from pas_data(driver) and register with the
>>>> cooling framework with id only. Please let us know if this looks fine.
>>> May be I'm missing something but:
>>>
>>>    - The QMI TMD returns a list of names, not ids
>>>    - The QMI TMD may return the list in different order than assumed
>>>    - The cooling map index points to the name of the TMD in the DT
>>>    - This name is used to match the name in the aformentionned list
>>>    - The index in the list and the id in the DT can differ
>>>
>>> Krzysztof , I don't get why having the TMD names as properties is wrong,
>>> they describes the existing TMDs on the system and the cooling maps
>>> index points to the one to be connected with thermal zone.
>>
>>
>> 'xxx-names' have a fixed meaning in DT by convention - assign
>> identifiable strings to the 'xxx'. I miss the property 'tmd' in such
>> case - its definition and meaning. Where is it?
>>
>> But maybe you just want list of strings, so I am open to discuss it - I
>> don't understand the need for this property and commit and property
>> description tell me nothing.
>>
>> Really, this commit message is basically non-existing. It explains what
>> it did and provides that much explanation WHY:
>>
>> "- tmd-names (thermal mitigation device names)"
>>
>> Really? This is the explanation why this change is being made, why this
>> property is needed?
>>
>> So sure, describe the problem being solved and WHY this problem is being
>> solved that way. Maybe it will fit DT.
> 
> Ok, I understand
> 
> Let me try to clarify.
> 
> When the QMI TMD protocol is initialized, the list of available TMDs 
> provided by the service is requested. They are identified by a *string* 
> not a numerical id.
> 
> We can not assume the list is always in the same order because the QMI 
> TMD is a separate subsystem and the interface is the protocol. The 
> protocol does not refer to any TMD with an index but its name. 
> Hardcoding an index here is not possible.

Still given device (remoteproc) will provide a fixed, one name for TMD.
That name is fully deducible from the compatible.

> 
> The name identifies the TMD we connect to and in return we receive a 
> handler to use when sending the QMI messages.
> 
> That is for the driver part.
> 
> I understand for the DT, it is possible to not give the tmd-names 
> because the it can go into the driver's data structure.
> 
> But the thermal framework won't be able to associate a cooling device 
> (one TMD) with a thermal zone because the cooling mapping must point to 
> a cooling device in the DT.
> 
> Initially, Gaurav sent a description where each TMD was a child node of 
> the remote proc node. And you rightfully told us it is no longer the way 
> to go as stated in the documentation. And you suggested to replace the 
> child nodes with an array with the tmd-names and add an index in the 
> cooling map pointing to this array.

There was only one child node. It was one-to-one mapping, thus I don't
think I suggested using any tmd-names.

Here is the code:
https://lore.kernel.org/linux-devicetree/20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com/

and I clearly see one cooling only:

+  cooling:
+    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#

Therefore I still do not see the need of tmd-names. You know the name of
cooling device, because you have strict one-to-one mapping.


> 
> The thermal framework has been extended to support this new format and 
> associate the cooling device with the thermal zone. This change is now 
> upstream for v7.2 [1]
> 
> The resulting implementation is the driver gets the tmd-names array 
> property. For each name, it connects to the QMI TMD and register the 
> cooling device with the index corresponding to the name position on the 
> tmd-names array.
> 
> On the other side, the thermal framework parses the cooling-map, gets 
> the index and do the association (binding).
> 
> The tmd-names array property replaces the child nodes and allows to do 
> the mapping between the string based identifier with a numerical id.
> 
> I hope that clarifies the approach.
> 
>    -- Daniel
> 
> [1] 
> https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/


Best regards,
Krzysztof

