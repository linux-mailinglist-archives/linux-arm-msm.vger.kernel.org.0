Return-Path: <linux-arm-msm+bounces-103010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIUBBj9A3WkubQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:13:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B93F2854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B3D30372CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75D7390CAA;
	Mon, 13 Apr 2026 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Z1Llzc+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36C3446C8;
	Mon, 13 Apr 2026 19:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107480; cv=pass; b=jMzF3uWRpu7Ij5IvT+NweQmRbeedqef4K/6rvD9CbuIwdaEKzGpwkocABbSC6JEn3uU4y71j2RnPfKGtSxC3ejI0fnvfknhM3qwMaZL4G5hxlcHYGvFE0QN6W88ZNI+s/5kjyw2JDcRPSgsCcch+XrFu9atvsvrR03ezxU/aQAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107480; c=relaxed/simple;
	bh=oEHAVHTavvoLhe+9Q5wIFfaTKrAfnTixvvgK8+7im7E=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=OB6lHxIbBNo+cdBCM8TZw8LlKADCckkf4b9PYlIFmwjcPkDvDM139DTZ+81p+t0iTnqToubJITkcN4YLHE+0OcxgCQEzmg5z04DPK7ALCNmqqpb3diPMmVIGHJYtuS8HeGLtWDjZd4LcytUF/z6142IPwZZC3iaQONNZ43eUfXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Z1Llzc+7; arc=pass smtp.client-ip=23.83.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|out@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 273E1403BA6;
	Mon, 13 Apr 2026 19:05:39 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.101.172.36])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0F39940263A;
	Mon, 13 Apr 2026 19:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776107138;
	b=dHvZPyhgarpy8K0oWk4RwFxQMBmSK9Z9UKi5KLFVHF3nyYYN3zXx5gBzrg+G2JR3deqwWb
	hkbwja+GMPej3HJB+AVX2uwLc/o1mQq0mJ24EHjS+BsGFy8Zmw088XEP9BXH16kfSatiWe
	5J8Ec8XfR2oHgmUqw2W2B60bMOhkVZZO3x0vMTp/u5lDNygP/fERcPB/RKRPbTVG+7rdTc
	y7ynvcybPXqw2tHt5MqZyFpqfc9T7+Z8dozUR5hX0ob4MPG9x23h0BUX3VIAUNqq7e0XNi
	z/7kWEjdv5b/JUSw8i+ux1fNK6Zv+AXnTDmU9kVbNcH/OUFS3rZjZUO38jnSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776107138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Mb03Qun79nvKoYJuC14dHNfcQQ+U6Xx7SbmHwyMvdfM=;
	b=awBZl94NXvMozCX688MCrT7hkp6TxI0k+eKRRbFoc6BSCZakJaq9855HKXEh7Oe1vgp6ru
	LY0vgLUOQ3pKfb+LRMBUNzCmPlh8JyoYaFwtcPuZkzyXJAG+eEFjEGGlEA6IAo1v6dPYRO
	8SZfdbQiGzHlcEyuw4gC827IOi56zvw3pIGGXh608lW2GPtz9QGyVpfgCjRgZemcTSWj7p
	gDHDbZ8z93l6L1cfavS9i1bS4QFZ3YRZPm8Bw8pSrtHrQycabFcLPVI3yG26jxil6c3Bkg
	ZpeqNGoR+bJ7TM2It0HoE9Xi38yoTFvsxk1dfzL0eWuYRv4MNl3+T1URDhBdFg==
ARC-Authentication-Results: i=1;
	rspamd-6c65dd77f-9kwc5;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=me@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|out@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|out@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Minister-Tart: 6bc34204165bf2d5_1776107138976_1112550725
X-MC-Loop-Signature: 1776107138976:1469222741
X-MC-Ingress-Time: 1776107138976
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.172.36 (trex/7.1.5);
	Mon, 13 Apr 2026 19:05:38 +0000
Received: from [IPV6:2001:448a:502c:8e5:e9e5:13d2:5f1d:65a1] (unknown [IPv6:2001:448a:502c:8e5:e9e5:13d2:5f1d:65a1])
	(Authenticated sender: out@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvcLK14Yrz14Ld;
	Mon, 13 Apr 2026 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776107134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mb03Qun79nvKoYJuC14dHNfcQQ+U6Xx7SbmHwyMvdfM=;
	b=Z1Llzc+7Tk3805XDGi/qhacfiGJ4SCBoRAvV/eEcJ7FZtnI2XLEuHTjyMQz/GlJwsMqrb2
	pRWUB3iRqU93CGOPCQYMO5RbOiBXQx51Q2SoLYDcA9svxujaFymDVxNgFHUVt3XmxMUoM/
	adS0odONyHuLdtJEf9SAlLdlKDryZd9grvHu3/2acOm1JTwLB4NwC6wwtqFJjWiufBwzk8
	whvc5QUdwxUIORERqV7ODsGF7qR3DevOGOq5NklcPz/SR1FhAUC0/qaQd+BDQY/a6mZs2z
	zc4kHwFeJ5ivtt6HkFfl0Af7EGZ3klJ/fehz4EXvLcXgHEHL3xMEXKFjVAh+Pg==
Message-ID: <8bc8dd37-e77e-4505-bbd8-633b0e4e9007@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] ARM: qcom: msm8960: enable WCNSS (Bluetooth &
 Wi-Fi)
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <me@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Apr 2026 19:05:28 +0000 (UTC)
X-CM-Envelope: MS4xfDNO8OWWj3P2JKTCEzCMvFuDsJWOr0iwj65VXOpyhY8SIhSizormh2AcZQEnQeFbfNdOj9+GXykr9jpCQ6eRPhj2581kUjEefoHYa6Ur/j88OJc10hku gGXznFlbfGT6AQZl6Qexgu1ei7MEHIiznXkmzlUZtohUkK3HhV47H3Gfh9lf7LRsBy5CODFNeNrmDrVrguzDsga57kKUHwbkfVvooOFUPPTO9FZyp8sYNS/X 4mY7llQ1o1GNMDXXl8nmQaDvfjj6JxSdgRq8MCkb8VoSMC3UPbLSXLC6b+aulF6PrSO6AA4HoAH6k0C9ik5e1txlpNErtvEgdcteDdgB/mxjh7DYTp3JGYbo zqQhzl3+s1XUjUXr8uqweZJd23nz27LkBG6d5OikltY4fF6FH8kRxBXrnCoYKg818QHEwpwRCUGg5q5auWFgQh/5m5qbFQ6JibmU30jX8zFooo6j5ycBAxvX Ii9xkPgpEF8XNzVoa9i47pdfeKukjDGOjDOhPrPKNIUJo/8jReYaoCOEyufAX81whN5zN7T/P5PcqOvBBRcKlZarhzI27fPIccRZW9tr5tIKKWkwHIFpE+8h f7lJysGSwCMaJLE+d2Lcatf76NAb9EBQ8Shzy0GHRSAFCqvFbjNw7w8MVKt0fmwHQw5YIRNOhs2U2E9G/OV2IyYlR2xWN9oBR7p2YmDMSdB0s2las7oahIBZ X2CFpVz9AF9Vd5x9qvVWPmeVUMkmNKQAuc0H/E2xYFu96CnN7jZ6iA==
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69dd3e7e a=H239xnUnC6kRV8DKZ+RfXA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=9tgS3qGh4eboj16gPlgA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-AuthUser: out@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103010-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F6B93F2854
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/2026 1:32 AM, Antony Kurniawan Soemardi wrote:
> Enable the WCNSS (Riva) subsystem on MSM8960-based devices to support
> Bluetooth and Wi-Fi.

Sorry, please disregard this partial patch series. I encountered a rate 
limit on my SMTP provider, and have now resent the full patch series via 
B4 Relay.

Thanks,
Antony K. S.

