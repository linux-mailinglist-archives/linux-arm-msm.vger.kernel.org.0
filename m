Return-Path: <linux-arm-msm+bounces-103631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGkoHnzd5GkibQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:49:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3EE4243D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D454300442D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 13:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA3E37C10F;
	Sun, 19 Apr 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="sRVkW/Lt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE333998;
	Sun, 19 Apr 2026 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776606083; cv=pass; b=cvDYmt1DaoT/iXUW6DvyrBCrw6oTNNnHxy5A15acSjUZbeVbEIbfbI2nkoL0kUD1QAfzg1OijoN4FNVKh1TGIe21NyLsRyj95+ZfIZ3aVT/sAD79s1KYi9vZAgmhLP+evPTH1Vx7SUzw8Gy0/8FPc7j9rLdacuPKhzYOiHv6G6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776606083; c=relaxed/simple;
	bh=VnFxSTJogffl2XE7uVUb6etkwqqG5nQ1gKXcU/nILEs=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=TP6XY5kTjNIqdljvSE2I21ZuniIPFlL9D6kZ6hHgsQEReaFVAGs1/4HePJefxk38ZiRSd+sGAVhoXD76ghYmiurWGpnO9ybqaFDYSMqpKfHod/7jWbFEjkX46Ri4KoN/LFgYiErsiTgt/3HnncF97p0ESJPgBNS05BaLnKNCM54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=sRVkW/Lt; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C4BC176216A;
	Sun, 19 Apr 2026 13:41:15 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-103-3-248.trex-nlb.outbound.svc.cluster.local [100.103.3.248])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A806B7625CD;
	Sun, 19 Apr 2026 13:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776606075;
	b=5DiXgn5IjiaI0LEZp3wLsuPdKvUrdNUIf79gh3vibkWPKpw91rGAEoag+sHismIrahBBzF
	BqsbBN8ylHhF/XcM3W1UOqfzdYyfydqb3jDo3qy2CZtHHMB/FJO+k/XACidaDlMp9wBB82
	93vwsSHerKgFoFYzvMjhg9PAmL+OxyC0pgjZu6/m3o3jWvMKy4aMlHZ77pJfSC5D53gH54
	fjrgHtl6XajdibIL3I88CLpl/ZqfpJjZUBqX3F9W3m/m5gkFIP67bpqa0AN4kzNnvxIMNv
	9gUf65hTVai5bzmT+Am+B4oPeaODDTyso/QDZ0NMMMPONqB2W70qi96H7SbX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776606075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=k3ZegHV/Cy+Vd7QHA2PrtnXvjHee6c7TW3JGeMrYaQs=;
	b=evGteiemUyJ7t424zGfbZWENhvr5iuVUAlzDFktk6z4lmx0V7ttnV/avvUi0qhma7yCOEL
	ZElRAumGAGo/WH+x/TBcx4mQZJ62zgkGkFrNz9U8wGlViOz/13T2YZmXrNUDA5aNDBUn9B
	F/c1nnOw4IorkG6VNE2vZLURoJjIo0Iz7eyKC1FoOit0LBNYrvS7bzp/ql1OMOSnIz0wgG
	H42xVcSLaSae2k2aUX1guN+Hx8CjKbt3VeI10uozeu6AnXmwakL08Abd1Q/089NPy2S/Xd
	mDXjj+OBfVHIMP0tvbkJGvuNYJdQgvTtdUbwGcMNTr6qEhdoUfczTSGhsDi6eA==
ARC-Authentication-Results: i=1;
	rspamd-5895b9784c-cklvk;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Tasty: 6f71109443f2d5fb_1776606075658_2962281406
X-MC-Loop-Signature: 1776606075658:2584535058
X-MC-Ingress-Time: 1776606075657
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.3.248 (trex/7.1.5);
	Sun, 19 Apr 2026 13:41:15 +0000
Received: from [IPV6:2001:448a:c020:c3c:d097:d42a:836e:79a] (unknown [IPv6:2001:448a:c020:c3c:d097:d42a:836e:79a])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fz8sH2FWqz1xml;
	Sun, 19 Apr 2026 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776606071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3ZegHV/Cy+Vd7QHA2PrtnXvjHee6c7TW3JGeMrYaQs=;
	b=sRVkW/Ltusmhkvn8dBC2v/Kcm7c87/nVx+exry90S4iyrTOLzdoozM2Xn65wmlYARLgZDw
	nUJf8xW+Yg9aot3JHQ4Q8BqJ8HcgHml+h3JLnbqIE4zdziGx1UDJVUoIhy23cj032DeBuT
	v52b9b3nb3v+Oy58YiVL/SrPAXerHLU9/eJJp39hBiTyY8ZbWss67iihZDOsIgluXQ/uFq
	TCPrfhhyMINeA7vcCCQ34dBNnQSXb+6vXuRyyJpisn0qzw2COt/7sq+2zwxbf3+nVfW7k0
	DyVqV0jMdobi07i52PGU4mFeqIl3gPPHcX47MWfRBwXXvBIbZei4Vex5rj/VFA==
Message-ID: <71196906-0a06-4647-9080-ac6e7d2741ad@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
 <u7buljdmiu2kf5unlqs2jh5u24ymteyrfvbb2drc6ntsei2mqq@yuhjpchgpgh3>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <u7buljdmiu2kf5unlqs2jh5u24ymteyrfvbb2drc6ntsei2mqq@yuhjpchgpgh3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 19 Apr 2026 13:41:07 +0000 (UTC)
X-CM-Envelope: MS4xfMHuAEyLu7fY7qdSQn1P7SJ3nktyA4wwwWmntaxPCTCwN7T0+fI9gq32cd86IoZ/CZizMu9sce47R5J3igRoOF28ezWgc9wwSPvyvZoZ1sfzAW+OqiLj 7kfGFPYbESJC1Pkmf2Wczry1JSrPdkJ3e/YPcJ4SdlqCKFBlEG+/j2TXDiPi4CLslY12rRzZc98aUp+kcJ5TJdvfzhY9l8RGhxlYcPH+O1CKh0J8yuENAr5I grNidR3JB2HsiOoA3Okjk6kxcPBINJLhSWwTfcZbeIXMpy1ptJDaVdNIGa40Bm0PaCis1PCR4N2icVc8g+gUtpAlppmNzhSyrAgLFylazbqlrAhj1t16HLn/ YM9Pf0cLDsSUU0LVsSpezoq+lEiG22tLBp4EDwHv72RtXRjnB5+SZC+G8tVnaEDq2Idizx0nB5RDKKEintAYEXzp3DvZRtu1IuUPGoi8ot9gmHnHN4lE3QW4 NLu09iyGkxnyW5AiZpx4COulyw9PhY3cMaJiPGtKJOw+udIu7eJtqMAoDkZ29/sGcTz1b+Ku9oVBCH4CtLUVyL6sX2HbjhIlFzKqWx82FxoUFqShDSIX+8sd EWo7tFRbmZNWfziYCei1XNGUMJiHl3nEn13BifEym0CXZIg3SsGFImBvz8Ejf04Ju3q06x0PmwmibmETOtagncmkvrcASO4OTcdCeKdyLtuLyluNpZdZVDXm m184KlolMWJASbtZ6Lc6yh7fMib1v6/V6yxfhOrkeXZ0PK45tvbMmaGfNVCnI+TufFDxqH/GFQnhauwMAnGuRzSXoKU7iZJL
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69e4db77 a=q8XfeKLTkGORBkIvkVRlwA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=2Liv2LJbaJilggPZqoAA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103631-lists,linux-arm-msm=lfdr.de];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[smankusors.com,none];
	RCPT_COUNT_TWELVE(0.00)[16];
	R_DKIM_ALLOW(0.00)[smankusors.com:s=hostingermail-a];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[smankusors.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,smankusors.com:email,smankusors.com:dkim,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.536];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E3EE4243D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/18/2026 11:53 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 01:55:35AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>
>> Add the Shared Memory State Machine node to coordinate state transitions
>> between the Applications processor and the Riva subsystem.
>>
>> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
>> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>> ---
>>   arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> index 218cf3158dfb..107c5613aa4a 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> @@ -109,6 +109,31 @@ smem {
>>   		hwlocks = <&sfpb_mutex 3>;
>>   	};
>>   
>> +	smsm {
>> +		compatible = "qcom,smsm";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		qcom,ipc-1 = <&l2cc 8 4>;
>> +		qcom,ipc-2 = <&l2cc 8 14>;
>> +		qcom,ipc-3 = <&l2cc 8 23>;
>> +		qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
>> +
>> +		apps_smsm: apps@0 {
>> +			reg = <0>;
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		wcnss_smsm: wcnss@3 {
>> +			reg = <3>;
>> +			interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
> 
> Are there other SMSMs (modem, Q6, DSPS)? If so and if you are going to
> send another revision, could you please add those?
Yes there are. But I've intentionally left them out for now since
they're unrelated to this Wi-Fi enablement series and I currently have
no way to test them without bringing up the modem, audio, and/or video
subsystems first.

I think it's cleaner to keep this series focused on what's verifiable
today and handle the rest in a future separate series. What do you
think?

-- 
Thanks,
Antony K. S.

