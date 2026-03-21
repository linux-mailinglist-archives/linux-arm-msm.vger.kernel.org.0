Return-Path: <linux-arm-msm+bounces-98991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKS6OcFKvmmXLwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:37:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D3D2E3FE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59602300F5F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49901A682C;
	Sat, 21 Mar 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="wga5Vray"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A39B25D53B
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774078645; cv=none; b=XKArjwwHtuCqi7lupcCpWd/urMzjuu/WMHEf+4CwChJCZI5yzE2Brml7kBjV/yZA2ICZHGoTgSz5zvkQd9fXYINZYDY6Ft/LnU1dEUG5WNIV6AlqWzzpkG82jXzdtlfWA/zV3iVlsfMBOI9v4ZbSovSJ/iCYSmdqdh7VXECAwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774078645; c=relaxed/simple;
	bh=QMM3KwrskrVMJ6T7vb3jZ/l2SDa18aenq3clLzmpVa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKA9XTxyeOZenq7bcWefG3CDU1UZYmdBgu6TycGPB8pPpqvEoyzmAKWUnz1A+9SxKr1QmGMwU6kzuUgMBubhRHR+AaETyKn78CPpnNrRA0LmZuRl3xTnzlijcEz8XEvAn34Bhu9+9FwS/33G7k3r245SwA68bC/OyRLV0S9LTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=wga5Vray; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774078632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnZTzyArA1UF6o+rOeggLESVVxpBXLlSzECOhpcPCSA=;
	b=wga5VrayaH9c+LagNeLUpd9ULHLJ0w82Y+lwBxTwUFkLPtRXNOycWTqDNWHDlKgumTX0Lz
	0i0KZwn7WH+1Jmds70yzBCY8Dvyeia8Hzebt+/FPT+g+IDahlPznvVYCDNpuploLA3erFL
	b++He7sXHq4++0DoNUlS1oNjFaKwCWj2dyaOBNnRXjOf0B8MsLJMVwa54PRAhBf5YJ9fsC
	OcwUUNOOw/52HFJizsX3beBNQOjB0GCx7JLpGxvXr86g3DN5aE4FPOqaIAA6HcmzmIDfmm
	H4SUNC+ZwaQNY2cjD+q7y/CgOMGlPqqtxry15qDX7hrO02CZR0QCr/lSmXVD2w==
Date: Sat, 21 Mar 2026 04:36:58 -0300
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260305093941.305122-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 48D3D2E3FE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello again :)

On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> […]
> +	touchscreen@0 {
> +		compatible = "goodix,gt9916";
> +		reg = <0>;
> +
> +		interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l7c_3p0>;
> +		vddio-supply = <&vreg_l2c_1p8>;
> +
> +		spi-max-frequency = <5000000>;
> +
> +		touchscreen-size-x = <10800>;
> +		touchscreen-size-y = <24000>;
> […]

I have noticed this previously and started wondering why the size was 
10x higher. Now with my own device (motorola-dubai) I actually found out 
why…

With the actual 1080x2400 size, the mm values reported by libinput are 
10x higher than what they should be, e.g. touching the bottom right 
corner with libinput debug-events:

  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
(1067.00/2370.00mm)

(2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
on-screen keyboard was accidentally detecting super-fast down swipes as 
I was typing normally, and suddenly closing the keyboard as I was typing.


Let's do this in a more acceptable way, in the goodix-berlin driver:

https://lore.kernel.org/all/20260321073242.556253-1-val@packett.cool/

so set the properties to 1080/2400 in v5!


Thanks,
~val


