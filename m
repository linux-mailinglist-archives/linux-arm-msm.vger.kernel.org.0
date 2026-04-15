Return-Path: <linux-arm-msm+bounces-103305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPfJLtK/32lOYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 18:41:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1A406739
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 18:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 950A53082412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 16:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD493D75A6;
	Wed, 15 Apr 2026 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="lDxBsPIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cornsilk.ash.relay.mailchannels.net (cornsilk.ash.relay.mailchannels.net [23.83.222.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927073E3DA3;
	Wed, 15 Apr 2026 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271194; cv=pass; b=TZkN5gYkDj2m/pYUy2Sh0zYddGypDs3Rkltp1THfJPGzYNycjuyrbzClAd+9cyHlhQj/1wgxbXI8B66dTdZkIzcWKM4OMsuSf252L62dCSy4b0WVBfYUCYooSGtXSmJGKvVWH3ux6SOVYRBYRJlwgUENecj25qUoKUjooIcG044=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271194; c=relaxed/simple;
	bh=+WYzEfzLHubdqx0fWn2UBfsq+Ag4FeaKeCuT/+YGbX0=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=HsRQK4GTsfQlMIMdRrolFA1yiISDqm3yICro5ZUf+NQIoKOsAs/K7y9/O4NE86j8+3IYN5MDd9++7HK9diApWdK/61/zn4JDj55dp+NK41N1+orc2/MOITFiCJL74Hnv52robnNPBE+i4iyQNlJZzWEEaFa24DGaqU82SZpGfRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=lDxBsPIa; arc=pass smtp.client-ip=23.83.222.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8EB828C2652;
	Wed, 15 Apr 2026 15:20:55 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (100-101-170-129.trex-nlb.outbound.svc.cluster.local [100.101.170.129])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 434C48C2A8E;
	Wed, 15 Apr 2026 15:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776266455;
	b=25uoSoFF+bgBpsv11KQWbuzMKn/yTm+5kCnDht78r1L3BXAmE3b9GS8bFnaVOxGpHmpBYC
	gcIZJF/jp/Dfk6DBtRdP8dKuC1/CcBAwu+4WMXHq7SKyA2stwSidvXy2CS+U4jEdE28K8w
	WJxoCR2jdXSRP8kYAPrfs/ZWRdsKnpEpjv8U0S4z5feXkbmE/TwNta8JZgVIHVxSUWxxUf
	lM7r64D/jibMJkziTQJiRYGSzeNF7c+kF+haOjAmM/woyFi4ziDiYOroCQcSuzvyWM62JH
	c7ND2J7JI71bus14tX/q8J8tywnt5t/OvFcn4T2MfkDaGWL0Bsd2LBUVosOfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776266455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=snluGqQP7QMHLqXPP6DrgIlyfEWJ6ROQdbtKBxFTO2Y=;
	b=W52wRAJOYDdFo0/mHk+wpvQ1o8hzpPkdyeo+YWJROHbztdTOpIrx+IZgBvWtt+6WSlz3Mg
	AadPu/Yw8kdnp3JLMv+IuiNdIjtORoLf4QFVU0/7HmX/Jgqm5b2bxpghc8A1wytLFGkA8X
	nvXVTmsXqJlosUfCJS6XeRz3nB8pID4UtApkMNuGdpXy8C3ufWNCGuC6dM+M9AdY17vXTw
	B/51wA1S/QVudGT6FCEjMiW/WuthQmYsgqWqxNOijSSrK63poPATrScTt2HDmRUjRGgo8N
	3QJgVJE/296lnWaHRucbKdPHH6qh9dOO4H43RH2KNsy2uf5t3yA3e+vsw0SvQQ==
ARC-Authentication-Results: i=1;
	rspamd-6c65dd77f-mhjtr;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Rock-Name: 49e245f656abb596_1776266455365_3373235585
X-MC-Loop-Signature: 1776266455365:2485615051
X-MC-Ingress-Time: 1776266455365
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.170.129 (trex/7.1.5);
	Wed, 15 Apr 2026 15:20:55 +0000
Received: from [IPV6:2001:448a:c020:f0b:7534:ccf3:5094:fe03] (unknown [IPv6:2001:448a:c020:f0b:7534:ccf3:5094:fe03])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fwlG04vQNz40HV;
	Wed, 15 Apr 2026 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776266450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snluGqQP7QMHLqXPP6DrgIlyfEWJ6ROQdbtKBxFTO2Y=;
	b=lDxBsPIaz3WmKHq3+z0Rw236HOJ3BVNVsgWlzPCIrhLnYS/L5dM3sS1YL+4kdOVN7Vj2qM
	Ip/D2y7nABaMnQE6oUYh0JLn0rVjACWWyK5040JdMQZVngzFn17YzOERwb82MZ5o+3eft/
	XaAetJEz/Ao7k1Lx0NT7AOJq62A09KUGoemrWf3kHi/LMzPY3m2HRwqbq0mhc9w7bjZEFB
	uYDagVVQsLDCuUUyis64eyK+Fh0re7IERbxryHqnSk5p07mQa9k+pGA8SJ/WPuYpeJxP4k
	JSznJwyTZdqFYTBJuc0otxJwVbd/ovbv0WDtJ33jhQSF5FWWFMjZUV1LB1ksHg==
Message-ID: <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
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
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 15 Apr 2026 15:20:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69dfacd2 a=/xj++nRiCg+rJg+YP4cClA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=wsXp2s140FDuPjEIReEA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfNIe7XyNq1kUinlkmwTHbt5KeWqtEuq1Q1faRjAiSSBpKIf8XSL2Ucsux3PV3Rya+8jnz333aC8v7iMw8BS8P6lySqoey5AAy2kDxYdA4u8++ZyNUN1a Kw3EIFfDeAw3c5j60LzBjSx5y0xVh+GK5o6qgeNv8AWtRblCx2DBt4PR7Wq/ijWjYbbEsQGfiqwJDpajrPS4+diJ7YCxklm9UYYOUwhWEckPCTSTb5moBmc1 4WigMbyLT2eqH3xTxqbBFk6l2Xid+tOXDF/kn7trUJ8xbNI6ygvB6RuBV9vPcgj1c1iNAnyH2aHN49CaAEWrq+2uuO9Kt5yQdvBtKFidY0dGRwEVTH4q4jsG hhbu4NuemvwjPTtlffADfw/9yLK312u9ZHcTz7zsPqiqlNApg2PRQNDo7E0pqlnxKr9xT/WaiPmGgXvQMMVCb1umvloJD0fPRdPiTd2UVGKF1J/FfSQm6cI+ M69T9LxlDCLHGOnkASkZ/1S21eWaBe5DGgJDuUc8UBzzXv0HWtB55XglWXclpXMH8AMGr2ByyjWhPjSPa25ki0Tj3dOJSuQm3vmNXkXDogkDgl7IE0LWhZnT kGg4jPr3EYOoFgoe06MwyJnFaTxoF18ftlRtevoygIwexuN4ZwtPQRYxHLeLeY49yDXyTYI/QhOkTLmaGjTYOfOXH6nIm8qCaNzbNag9c0xJEslInCOFzyvG bU3JZSCpYjTHAgbbkFl3tl9BjQsqIVGchpM5Zqx/JeAATog9VFTEgJiF/NM+sGoZYK2xo+l1UYX5rUmuc/vaOwBCY+cxfAWm
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103305-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:dkim,smankusors.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06D1A406739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>
>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
>>
>> This doesn't quite seem to be the case, some fields differ and
>> apq8064 additionally has:
>>
>> QCOM_RPM_PM8821_SMPS1
>> QCOM_RPM_PM8821_SMPS2
>> QCOM_RPM_PM8821_LDO1
>> QCOM_RPM_VDDMIN_GPIO
> 
> Ah hmm, the MFD driver seems to provide *all* RPM resources..

What I meant by "clock descriptor" in the commit message was
specifically the subset corresponding to RPM managed clocks. From what I
can tell based on downstream code, msm8960 and apq8064 seem to share the
same set of RPM clocks, even though the overall resource lists differ.

Is that understanding correct?

-- 
Thanks,
Antony K. S.

