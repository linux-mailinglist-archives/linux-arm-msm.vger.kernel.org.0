Return-Path: <linux-arm-msm+bounces-113417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BuUPFldKMWqhgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D968FBDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=smankusors.com header.s=hostingermail-a header.b=Z2qqUze5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113417-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113417-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=smankusors.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45FBC30329BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5327936493F;
	Tue, 16 Jun 2026 13:04:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69741363C60;
	Tue, 16 Jun 2026 13:04:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615067; cv=none; b=ic8VHHCdJ0znVPvbgQF+teQt4K0WKuQ+ffOJ93fNET4Ju1bg5vNY4xD72A67+HH56/YD298MZAFF3Xev3f4rUV4lk0ASyBJPCWBoO6HMfWdXhHTJ+sQ5GcKc/r7jwiRBBTT+UYExXRk3LrnJuh0ppo7ljc2fNveCK4MOrrCsiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615067; c=relaxed/simple;
	bh=c5RLhd0pv/qy9aOw+NtTeZaxpm0PEArQyLcIVpByJvI=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=pcToPyUtgxFdLIr3kgvp3FeElnbO4YqqMsoM9d15a0j/CMhKgBzyQnzlB5gJrE/MbWkRZ9lyZffpfec3oQ0ljNymlnKAWyxCfelRITSQgIgSCTt9MVXjVncIjJa0oPevqtYvhH0Gz/NLptEnYeF8TyqMPPXch+bP2InqSH3Hgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Z2qqUze5; arc=none smtp.client-ip=23.83.218.252
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BBD9242C5F;
	Tue, 16 Jun 2026 13:04:24 +0000 (UTC)
Received: from fr-int-smtpout30.hostinger.io (100-96-18-11.trex-nlb.outbound.svc.cluster.local [100.96.18.11])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 70F8E424A5;
	Tue, 16 Jun 2026 13:04:21 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Chemical-Belong: 0899592a12290798_1781615064512_1783352526
X-MC-Loop-Signature: 1781615064512:2047984018
X-MC-Ingress-Time: 1781615064512
Received: from fr-int-smtpout30.hostinger.io (fr-int-smtpout30.hostinger.io
 [148.222.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.18.11 (trex/7.1.5);
	Tue, 16 Jun 2026 13:04:24 +0000
Received: from [IPV6:2001:448a:c020:2a8:554c:bca5:67cf:e873] (unknown [IPv6:2001:448a:c020:2a8:554c:bca5:67cf:e873])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gfnHz6Jlvz36TV;
	Tue, 16 Jun 2026 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1781615059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGd1zuDTi+bSe+zP/6aAb0cGHADAqf2MS5nN7u5oByw=;
	b=Z2qqUze5xVULrsfM3g7+ttoxZt0HfGcqaf9+U2E3lEEj1OFOdZlzyQOltnpCjPE8klpoXS
	bu8Qg/ALEzC60q8ZxOabM/WMO90FugahEZsdZMLQ2ffIuHwutIAGAgPSYlEXxuqJr2yS+p
	5AMdkl5LoUW9VeJLy9pEiFIJYtZ2jK3uNr5KRuWXKhr/k7zVjHrGG7q8lXdlckB/0MF5tz
	6SpfAaXJQ4TTNCaLuxAHzojFC8hXq+J/t7IgZqtqmSluCOqlv1jEw58eylgGkeiW7c7jd5
	2ojFVqvq9uSP/nY8k30mDLO85pJmpl4QHNfMbMYC0UXRTKG715+CJI/DZb66SQ==
Message-ID: <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
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
 Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Jun 2026 13:04:15 +0000 (UTC)
X-CM-Envelope: MS4xfMGt5DdMydW3uIPhgYplPP3RQlAvoCMCLvWADebyxZcG6iGjkKDfJni7wYZY+ktJtd1fOeoniSmAgbu+gtLjClcLOzQD+Vy3XFWUYHwG7sYwuaLgR2vq tlccJGg5BXtItIG2ArCpO+k8uR9FnNit7frt/WucJV26HG345/ddYUuD5I/2M6vtPNs8YFMjZXIAPtG99njsL9YTAk9yVOiststXM1uavAfiyQGpzlgcra15 72G2ei2OkkDOvGAjLOQRy7dMf7grGR9CWJ811Kn7pGULQqMB2RW0aeX3UqBTmurlitC7WvdAtB0R8KucuHpaIvJYzd606BYjofoA47qNuhhDhtF+WysO9Zfe PHZUBoEVb7dMM3cJA4mhyz5y7c6JqXBtf/gval3PTD2wiltPeQaj581l9IAixvt7HefVVMxea0YmRvyPhdRF8ZgykEDjU3KKDMoAb/yonwLWjCT6Rde2xo43 SomoAiq/9o9HG4UX1nOcvT4d6Q3RNxfzMqGkHdXdqs/bRO1ViFHjYGtBcaNbSPW3iI7c87rfaAmTXEeImIwevW2m2DC3+EKAAJbOGt672Bdi+bp54/NYYshD 0sn3tE1E79pgz2jKdeeDs7drrrdn3OS0dO3biLxdjgYZ+D9vlz1xd8PxdkkOP50p4YFhVYNaaI4xuCNyM0rf/NP6Zu4fa4y7L+PpNUlbjtBFSYh9+HS96Rpm dbue7wg2rMQu2ChaJA32XzkMdxevvd1JEv8rwiKUsFbezMh3uj/3NCB5tydoOgCFfB8FDOO/sXsOk7u/AlFVzqs7z94sAz68
X-CM-Analysis: v=2.4 cv=BvrPwpX5 c=1 sm=1 tr=0 ts=6a3149d3 a=8/eyDw5ubstuqcxBRnK3vw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=_uSVK5vcfbc3LT-eoyUA:9 a=QEXdDO2ut3YA:10 a=Db0iDgFn7o8KFbWQUzvq:22 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-113417-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B14D968FBDB

On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>   			reg = <0x12500000 0x200>,
>>   			      <0x12500200 0x200>;
>>   			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>> -			clock-names = "core", "iface";
>> +			clocks = <&gcc USB_HS1_H_CLK>,
>> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>> +				 <&gcc USB_HS1_XCVR_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "fs";
> 
> The bindings change you sent changes the expectations - "core" used
> to be the first clock. And I would guesstimate that the
> DAYTONA_FABRIC clock is not really "core" - does downstream do any
> ratesetting on the other two?

Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, 
DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I 
don't see any clk_set_rate for HS1_P though.

Would you rather the other way around? Like "core", "iface", and "fs"? 
My concern is that such a change would result in a large number of 
warnings for newer SoC device trees.

-- 
Thanks,
Antony K. S.

