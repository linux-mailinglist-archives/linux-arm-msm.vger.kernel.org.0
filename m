Return-Path: <linux-arm-msm+bounces-99405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPViEZKnwWlwUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA72FD714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812B430347A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714FB3E0C6B;
	Mon, 23 Mar 2026 20:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="hx6nvCth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384313E4C79
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298990; cv=none; b=INM68nLY8rqvEvaimz2podBGX3F//7Tw4p2kakBegHrqHXUc4xn4NiTDYtFroCdTY0aBDqVJnHWoMbqiyrILV5jRS4EJ8Wmo0Ffx3ZA/UIGGWktT8nMZLTQ/rgIN4q/Pxx1wbD4SnLkOgzavSPWL1Q0f2hsrs1Ukcu4F0jMlNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298990; c=relaxed/simple;
	bh=0pmS5hAUDlu3zrsSMoZh4tzsSSQ0hXIW0rgxBdqIMms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q44Kdn9T2kKfoiHqYcLxC3jCMoF9BHaWxLgUcOCK7oRpnmtjoLXn5Y0vXzhaYvzwdp4Hg1n2sUZf2gAyWj+vN8nm6ZDBfI/T/m6Uum+68ZYoZ8BP4ilqe9YJIaE7x6ewk0bVzhO27/739Qi5ope5bhiwGTn67p07jUBF2pySS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=hx6nvCth; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774298974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPxjR0A9YEFfzmWROX/GNepxauCty+GI2uhi8VJRg5k=;
	b=hx6nvCth27I+eo36ypG0ha7DLF1IlDWY/FuhM0ZMkBUCGlOqNGJpw/bJBrmvgUgruQuVTr
	s+ofqWbnZ0k4jxBDFUiV6+qBh92ut3XBbdOq0eH3K89K8LI+hVjTkz3nBbKqutYWOs1O2V
	ECttbmczMMDBCSWkkEEh8KmnU2W97vNxwsWpqavso9EjDV0Iv7xk9s7hec+7LBFEt4Fiou
	GMvyYcXs7G9/4I5ouW/5ts/2Br4vpqpVt9w1TRPhNspIguNJQ297FNvE00j5nZEeaQc5dz
	w3z0ogD8it0H3TeVyDL6cXBi48Wd0Horoyj3yRnphtzs1OY2Bix6BQocAXDltQ==
Date: Mon, 23 Mar 2026 17:49:14 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
 <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-99405-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: B5FA72FD714
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/23/26 05:04, Stanislav Zaikin wrote:
> On 3/21/26 8:36 AM, Val Packett wrote:
>> Hello again :)
>>
>> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>> […]
>>> +    touchscreen@0 {
>>> +        compatible = "goodix,gt9916";
>>> +        reg = <0>;
>>> +
>>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>>> +
>>> +        avdd-supply = <&vreg_l7c_3p0>;
>>> +        vddio-supply = <&vreg_l2c_1p8>;
>>> +
>>> +        spi-max-frequency = <5000000>;
>>> +
>>> +        touchscreen-size-x = <10800>;
>>> +        touchscreen-size-y = <24000>;
>>> […]
>>
>> I have noticed this previously and started wondering why the size was 
>> 10x higher. Now with my own device (motorola-dubai) I actually found 
>> out why…
>>
>> With the actual 1080x2400 size, the mm values reported by libinput 
>> are 10x higher than what they should be, e.g. touching the bottom 
>> right corner with libinput debug-events:
>>
>>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
>> (1067.00/2370.00mm)
>>
>> (2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
>> on-screen keyboard was accidentally detecting super-fast down swipes 
>> as I was typing normally, and suddenly closing the keyboard as I was 
>> typing.
>>
> I wonder why some other devices with gt9916 (there are a couple in 
> mainline) that specifies 1080x2400. I don't think we can make this 
> assumption unless there was a mistake already in those mainline dts.
>
> Best regards,
> Stanislav

Not sure what you meant there..

I have not seen other devices do the 10800/24000 thing. Please set 
1080/2400 (actual size not 10x larger).

~val


