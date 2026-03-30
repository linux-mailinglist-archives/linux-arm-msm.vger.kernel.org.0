Return-Path: <linux-arm-msm+bounces-100824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILKnEkCVymkR+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:22:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98935DB83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D515930F660B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2CF334C1F;
	Mon, 30 Mar 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="I4nZllhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD3334C05
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883045; cv=none; b=XqUSANyp9+jZ45Ch1JHNrqJBA/+29ndcRYl/GH8eEbn4ICEAXYd9k3uD+oVECTOnQTBXKnx5iuw3EXhBuPWStAO9CXkI2r7u8iix96o+c4CmSPuataKKl/WlOtS6RfJbkBh0TOUea8o5yeaZMSslKDzikyx9ONSHUuhu5tb4+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883045; c=relaxed/simple;
	bh=gM4Ie7Og/iKoKDDWUD6FDDjEozPqyYaDYFwjuTmOVFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OozqAlJoB/9psJluZuZIZn7RrT9PSox0O87yQJaUzwBTb596Y41MKBFSFUqMj6+oSfpNFC9z00lUubwnjNlVtvhNcqHXm6n95R6NTU4ekARLl3dua6W2sNoaE0ZVuUjKiMRgA4W5UKoKApfId1ddaBcD3qk6v5OcH0Zy806v28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=I4nZllhI; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <8c7bb9f3-2c4f-4dde-a91c-893817070346@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774883031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUBhiMS8tYFBBVF/gWovrIjG9TCN/cpqKdIqU7eyxPE=;
	b=I4nZllhIT5Ca5kVO2IoCNBDAxpI1XRw7Xa5hB6aGnVztKvjluPHKi8i6S9u4Ykg7eaj9a9
	zBYfxHi6PuC193VrwF3Pqn/W0Fc4cob015AsgiYiiWNIjjXb7rYiXW1UhmqkDKH0PkuTyy
	R4h4pJQD5Fu3AsCwC+sctdairlatPXN2ZAZbwo7em3AzD5Apf7M3ogZa1JYsRr5sVO3AHA
	iqU5CU+O3uLnNfYAgZ+rfb5Qp4P8Rlc2lnh8PGC1SGfsYdu0JcZK7+m84OFr9FuBaq+ckg
	BtIeXz6h8jM+BCz5xCUrMW8/5MmhjdmyH5/CIskktHioO27OlLZf//q5IlkIxg==
Date: Mon, 30 Mar 2026 12:03:41 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola edge 30 (dubai) DTS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260329103055.96649-1-val@packett.cool>
 <20260329103055.96649-2-val@packett.cool>
 <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100824-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,packett.cool:dkim,packett.cool:email,packett.cool:mid,e1000000:email]
X-Rspamd-Queue-Id: 8F98935DB83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/30/26 7:03 AM, Konrad Dybcio wrote:
> On 3/29/26 12:16 PM, Val Packett wrote:
>> The Motorola edge 30 is a smartphone released in 2022.
>>
>> This commit has the following features working:
>> - Display (simplefb)
>> - Touchscreen
>> - Power and volume buttons
>> - Storage (UFS 3.1)
>> - Battery (ADSP battmgr)
>> - USB (Type-C, 2.0, dual-role)
>> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
> [...]
>
>> +/ {
>> +	model = "Motorola edge 30";
> nit: Google tells me the 'e' in 'Edge' is uppercase
They do the lowercase thing a lot in the marketing materials but not 
consistently. I guess it would make sense to ignore that and make it 
uppercase, sure.
> [...]
>
>> +		framebuffer0: framebuffer@e1000000 {
>> +			compatible = "simple-framebuffer";
>> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
> Let's drop reg and use the memory-region binding (also drop unit address)
How come no one told be about memory-region for simplefb before? :D Ack
> [...]
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
> SBU would be @2
I was wondering about this, now I see it is specified in the bindings.. 
Looks like many other dts should be fixed too.
>> +		cont-splash@e1000000 {
> framebuffer@
>
> [...]
>
>> +	thermal-zones {
>> +		cam-flash-thermal {
>> +			polling-delay-passive = <0>;
> that's the default setting, you may drop all polling-delay(-passive) = <0>
ack
> [...]
>
>> +&usb_1 {
>> +	/* USB 2.0 only */
>> +	qcom,select-utmi-as-pipe-clk;
>> +	maximum-speed = "high-speed";
>> +
>> +	/* Remove USB3 phy */
>> +	phys = <&usb_1_hsphy>;
>> +	phy-names = "usb2-phy";
> Is it really not wired up in hw, or do you perhaps have a fake cable?

I didn't even try testing it myself since not even all flagships have 
USB3 routed these days (hello oneplus) and this is a cheaper 
upper-mid-range phone.

USB0_{SS_*,DP_*} are actually NC on the schematic,

and in downstream dts there is maximum-speed = "high-speed" and usb-phy 
= hsphy + nop.

~val


