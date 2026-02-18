Return-Path: <linux-arm-msm+bounces-93277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCX4LK+slWlZTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:12:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C81563CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2052300BE30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3CE308F39;
	Wed, 18 Feb 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="CQZi5aJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3B3064BA;
	Wed, 18 Feb 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416740; cv=pass; b=SE6CM7Ix4MzGJC/W9rh8OvaYZDtKxq2QFCE+DyEKvX0rmnSG5sBilour9Jw3PRX4kP91WLV34S7h1kqYnr3+lRhijtS6XdLL/Qs3d2/0asTgnCoevAsHxf/n1mNlfaCRyjHVXTbVows0dptB2QYmD2XohgGk9zJG1j/fWdb1mGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416740; c=relaxed/simple;
	bh=DUhthZlWxgLc+u8XC0DuEYtuketyEUoQp+seSACpnRg=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=ml6EhQ/d14rlTdUDauETVp9oHG90Cg8MGuGbmqhLyHNJeJHcdtEa1AAg16F7uEkSIEOufq9zdOpTFKDGQAbOn6cLs3qybsWa8qryTbnlvEBWUoJhUFaj05ihU0J8KF7tmIC5eiLGoi7IXx6FvmKszSlB1BncCcmnGK+a3GhLe+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=CQZi5aJ6; arc=pass smtp.client-ip=23.83.209.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 01210161171;
	Wed, 18 Feb 2026 12:12:12 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.99.184.158])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 55D461629F0;
	Wed, 18 Feb 2026 12:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771416730;
	b=XQAbhmuGKv64i3kyFwMUVMYLVEBJTe8R49N3vPJkpp0hJKRbVZ54dzFfaNCao1c/1PR/Tj
	m/VqWBK9uVU/Pq/POCbnKHf7/t0BaFLLcsN2DUOSIz8Vu2UhJPsarbKb8e+bQlJD7e2rwy
	MbN9H6Lc58+DiBX19YKEXrBTpKfqmWEgIA0UhJ0KW94z2yi0BQclKKeivvqeLi0+VPxM2D
	zV2HmJyGmbDND5EJFqUDDJ9GvYMWO20oynkcltW7mh+Z4St0XsG0U/KYRA4XHi7jW0l8I3
	jJk39DyzwBnD1mXl3BfSpmHz70SiBJ8Djd1IJBSMbHxtxIo6db6n9fyVcvmsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771416730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=DUhthZlWxgLc+u8XC0DuEYtuketyEUoQp+seSACpnRg=;
	b=3eptZoEbid5bdiGV4iaPoYO9Zu8awbwmz45NkHaM57vFYOTNdFaPxeWZmfjAvM9VU6SgyW
	zNbsNxMSPbXIl4bdHXbqIQP2WtMOhqTdwygqqnw2q/1cq4830V/qlPKbM0fhp4lZaQiwwe
	z/pqIAA4n+f7jSpKJk6KPnYtmlCMbIrPS1xIfn7j7UDfE0ddDObHxipB9S4OsG633h+NLc
	3hqi+3XSyesBBHudPDQbHQPpostElAggCj0SSlm1VHhU5C6dT2Gtq6nExs1BIGxliAtv+F
	zZBd/RLCgGCrGl2Xh8AQ809GIRe2aFCo16a2Pca4boNwZZsGDsnKEdP7/OD+Mw==
ARC-Authentication-Results: i=1;
	rspamd-84c84ff4fc-sjj9c;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Spot-Stretch: 6faa6caf1f7e38be_1771416730321_654544285
X-MC-Loop-Signature: 1771416730321:1444518429
X-MC-Ingress-Time: 1771416730321
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.184.158 (trex/7.1.3);
	Wed, 18 Feb 2026 12:12:10 +0000
Received: from [IPV6:2001:448a:c020:52e:7820:f884:34b8:246d] (unknown [IPv6:2001:448a:c020:52e:7820:f884:34b8:246d])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fGFkB2h0VzyQ6;
	Wed, 18 Feb 2026 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1771416725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUhthZlWxgLc+u8XC0DuEYtuketyEUoQp+seSACpnRg=;
	b=CQZi5aJ6znbj5YB1V9CP6uKur5LO9ZqP/NIZumvay9pEWHkr89Qkuc+XdhKupZlWa+LfAf
	3Rw4yEqhonR4UxYh15B7ZwJI9BLDI6YYu0LQB/v61O75DH89VPhPpgoD25U3KsNZMNKX6H
	v+TBuHN73kcfaEyQyjLEkkDxsnSTlYCqXUCQotbdulekano8mcUZJA72xUmrvun6A6oQru
	gjz98vKdkis1d4sXrlehQjg9AUQNRbsQnNjpNRalvWMKD7gboPIn+FSI+luet0aafFzwSQ
	UNSdgRyfKATiN1R8VromUCAciyeuaLM5zchvwJJl1cn0JFkX4cfpjTo33HhoZA==
Message-ID: <f1948d10-2327-45a6-9634-cd9ec01419a3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
 <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
 <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 18 Feb 2026 12:12:02 +0000 (UTC)
X-CM-Envelope: MS4xfN/gSSoXlEuY3QiUa+BBPmhReYyZd74eFYQd6yiWMwCpSrMSrKxs4DvvxGTABNlmL9atj1oAJk9x2FuLQv3nEVyY60IzqC9jY9ngIXLbfRWXvl4zdle0 8oci860cqtNK+ZVv6ABVdBJ47qIGBI0iQOt9EHoaeWphOmCDYkUYN8WUviLz2AJ7Js0bHdXIMsvu2yIYF6GjXgHzXFCkjKg+hvu60xWEEYWoGsOYM8b8g86P Ao62yndZnY5OcDXJmKgJeSuAVWJxi5D0tFf3FoCUws9Ep9Zd2cuP76PUmqeoLyv4m+RYWlpGQKaKjwoxBiQ7iZFDK/ocmFGofzT3rPu4grAWnwyo97rt/s4Q y75ZYMWSrrd0E+u9FAJMNVcwiRLMx36+veMJFD2SpZfqRjbNF9Lr8OA41zQi2mO5GdFAEo7VsDo5YsHoh8C/UHo7G9xyG8/JhXYYUUycr0gz09Gjel/IXIY0 XtWqMsvV6ykdtq+05RbFFf6YzUK1wYmeeT5o6afDYLb75jvgDToGch7vNyWi8KAhcAtT93MdGj2jw2LZ2lqL28MrqSStnhCdHqS1isuSCyrckkvE/qHPTG3d S8UJpRhBYWjDnj1dDwvARcGYzdPq4aFBf2p48B5CNRNCNFxZ1wKEQk8HKzFVzBkkCzqZtY+HUwsO0VkXSi8g7WaduBCZCIZ8giPmRo5uRwEcCAxqXxt0nl/4 BD42einc5MWNLKH1jEBdT8K42l3zxAp6tftB/LswPqY5kXJbPOquOzTGifzcLMo8IKmB3RbdAXs=
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=6995ac95 a=XHuy+qXzPRwA4Bik7sPwZg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vI95pzUp9MDcBy5qOgsA:9 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93277-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smankusors.com:mid,smankusors.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D49C81563CF
X-Rspamd-Action: no action

On 2/18/2026 3:44 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 06:59:05AM +0000, Antony Kurniawan Soemardi wrote:
>> Document the qcom,rpmcc-msm8960 compatible.
>>
>> The MSM8960 platform shares the same RPM clock definitions as
>> APQ8064, so extend the existing conditional schema to treat
>> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.
> The way you implemented it, it requires driver changes which were not
> included in this PR.
Oh wait sorry, I was misremembering thing about how I should sent
dt-binding patches. I'm planning to send the following patches:

dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
mfd: qcom_rpm: add msm8960 QDSS clock resource
clk: qcom: clk-rpm: add msm8960 compatible
ARM: dts: qcom: msm8960: add rpm clock controller node
ARM: dts: qcom: msm8960: add scm node
ARM: dts: qcom: msm8960: add smem & hwmutex nodes
ARM: dts: qcom: msm8960: add smsm & sps nodes
ARM: dts: qcom: msm8960: add riva nodes
ARM: dts: qcom: msm8960: huashan: add riva node

I'm concerned that this might be too large? Or not?

Would it be better to submit them as a single patch series to enable
Bluetooth and Wi-Fi on msm8960?

also +Krzysztof for the same comment.

Thanks,
Antony K. S.

