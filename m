Return-Path: <linux-arm-msm+bounces-115237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XRwsL3/KQmocCQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:41:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D516DE76D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b="LEpTe7/Y";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=smankusors.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0F843020016
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F5C39DBEF;
	Mon, 29 Jun 2026 19:41:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9033803F2;
	Mon, 29 Jun 2026 19:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762109; cv=none; b=L/ZPPiR0D40Z4vTKWec1N5hq/3jgf3FRiHjjFn50+X9B0QtdwfIVR/zU7x/s6KdR4TYX78+gVpk0oGBo1IIvLoTD9WIoUSPUwy2PMs7dxThBACKKSVjN3tjP+JzeKH1ubPkhhMEFOW37oLpZUN86JSBHm+gIxaiD6is2kjYuIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762109; c=relaxed/simple;
	bh=Fgm3l8MJA0Le/r0K5irIq0he0GuKjbR4LOeGRerkBy4=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=ejkSx4gL/8CTEvYph1vFdaPtsTPrjXlMTNXv7wpEIKzhRZhudLXfwzIPh/UwlPivNt2rx0yfB+pZvadQPro2zkJ0W1ffAbuRgumk+0oxhhd9nsoIJoG5cbEnrhzHrvmJ8+nVYUviKFdlBZG7VL0fvJkdJdU6WhlJaw/n3why6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=LEpTe7/Y; arc=none smtp.client-ip=23.83.209.14
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 743AF721AD6;
	Mon, 29 Jun 2026 19:41:46 +0000 (UTC)
Received: from fr-int-smtpout23.hostinger.io (100-99-18-221.trex-nlb.outbound.svc.cluster.local [100.99.18.221])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 05F13722DBF;
	Mon, 29 Jun 2026 19:41:42 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Soft-Tank: 6e0c897c538e6886_1782762106291_1829064959
X-MC-Loop-Signature: 1782762106291:940535404
X-MC-Ingress-Time: 1782762106291
Received: from fr-int-smtpout23.hostinger.io (fr-int-smtpout23.hostinger.io
 [148.222.54.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.18.221 (trex/7.1.5);
	Mon, 29 Jun 2026 19:41:46 +0000
Received: from [IPV6:2001:448a:c030:3ec5:354f:5fbd:f4fe:4abf] (unknown [IPv6:2001:448a:c030:3ec5:354f:5fbd:f4fe:4abf])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gpxVT2p2Tz1xql;
	Mon, 29 Jun 2026 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1782762101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mf6gsDgb6CflBLqE6QCHPCck70qrJ5bPrH4uI36lvug=;
	b=LEpTe7/Y6+z5tTJ7OgBhd5PcLDmGd8BtSo459x/z8hRT2C2AiWXCBfv+Dn4Gq9hqAAzZNo
	mxi+reBudSa0i5xkZs8FvT3DBNKfXrAX0B6icRynNcgOLkP2bpGE7Cn7EMiqsmfM7TIAnW
	rEc1Rr9wNcJj9ffioackollRcU/IpBsrGHrDDpBEZuzU7OZ8lZs2vzRGLy1csaGsYJK/ra
	moOfflYuOQ/mXMFO/gf4uhkw+viKK88+0mPhZVp9L3H7++b9gq0D1TLwmX+8eGTtVunHBk
	/8ckYNWH4Vdw4Ur9omFu4V5fdUZhMn65/AW1CBf35SGBl9JX+6mWCi2I5J9UjQ==
Message-ID: <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>, Alexandre MINETTE <contact@alex-min.fr>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
 <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 29 Jun 2026 19:41:37 +0000 (UTC)
X-CM-Envelope: MS4xfH3zFpxAuKJs4Q3JZFNQhlKzU2k8sx9RQUh6NNlij5+Gh21orHO+pJP1UlGQTgSSa0AN32wYUGsizsBeZ6hKP1tXhOsEvgsAWxbC9xfZukkhdR2A1pyA 58hQf3YGSiZscOOCV7UOYP6LgAsuTCIekKXubxI1izPmSIkje+utpX91i918DKTDaq9oByQBeHB/XsK2N/zzGSjF+eUGP+lcuB5EafUO21rlGQGXZYIHgd4j DKa0xftk2gE7BbDmZo5IXL6KnFt76RMAhD4se2QmK53MFNmgDuw6IshFWw/rSPnUM9i3R9RrvWtg7qzJXdmzI6LEF1OVobAgl/TicmzzbZJL2Rnp01xYLJpR hT6gxRiVLygpnJPJktXwuxaCNR8qnfOdP2sl4TajQAljOpgwxfyRypeSHAY7v5qyH6iRWh5hkHGmpw3CdCx9C7EKgiksfvIhrEE2hq6D7c419nUw2LbAZjnl dE0FxItPNz447YlTCQnOej0B35OYxFE92DU+52I78kJTO3nm4zle0JB9cZMzniOUF4roIGLh6KVSVh06RwGFh9QDKQB+eQJfzKVPXH7RdedYFMXQfxqEQ0xy EYa8VfHLsC/M4LQY9jbKjfRBtb4jzxHEAbqFdWgA8jMz5QVOj5NcpWIUvvDfK2lsjJsctyOpNtBmquMaA780d5nkN5il7HkWQniCLPiuTM4QpJcId+OddbTF 0CpstuDATwwQXiNzu7KVvai6wSVI5D3V9ptXhqCravpreQrmqInIQ35YRgCb5q6JbydIii3ULGiFEhjIRkpojHxnLrx6CVzmkbOfp6w9FywijDmk8MnSF8ya EqsVOF26iSBujQJvYUk=
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=6a42ca75 a=w1GBRM/3DoNZU4Dpj/menA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=mF3C4NYB_VIFf37MXf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Db0iDgFn7o8KFbWQUzvq:22 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-115237-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:contact@alex-min.fr,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21D516DE76D

On 6/16/2026 8:43 PM, Konrad Dybcio wrote:
> On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
>> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>>                reg = <0x12500000 0x200>,
>>>>                      <0x12500200 0x200>;
>>>>                interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>>> -            clock-names = "core", "iface";
>>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>>> +            clock-names = "iface",
>>>> +                      "core",
>>>> +                      "fs";
>>>
>>> The bindings change you sent changes the expectations - "core" used
>>> to be the first clock. And I would guesstimate that the
>>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>>> ratesetting on the other two?
>>
>> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
>>
>> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.
> 
> I didn't notice you're actually aligning the order with bindings. I was
> under the impression this was a random change.
> 
> For the clock assignments themselves, I think the schema reflects a
> full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
> that we should have:
> 
> - ahb (bus clock - perhaps daytona in this case?)
> - system (core clock for the thing, >55 Mhz for compliant HS operation
>    or at least 35 MHz for any sort of operation)
> - ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
>    in our description)
> - inactivity_timer since there's a BAM instance attached to this host
>    (possibly handled implicitly)
> 
> for the record, there's 4 hosts:
> 
> USB1_HS @ 0x12500000 (this one)
> USB2_HSIC @ 0x12520000
> USB1_FS @ 0x18000000
> USB2_FS @ 0x18100000
> 
> I don't know if they are all exposed and functional though

Hmm, I'm not sure which option is technically more correct.

I did try swapping the clocks, using daytona as the iface clock and
`hs1_h` as the core clock. USB still works as expected in Sony Xperia
SP.

If that's what you want, let me know. I'm also curious whether others
agree with this approach.

Also cc +Alexandre for the recent Samsung Galaxy S4 patches.
-- 
Thanks,
Antony K. S.

