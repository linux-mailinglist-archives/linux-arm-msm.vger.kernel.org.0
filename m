Return-Path: <linux-arm-msm+bounces-101097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKCZN0sHzGn+NQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:41:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FB36F231
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7625130C7202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2D13016E3;
	Tue, 31 Mar 2026 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="JyaKvKLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB822FDC5E;
	Tue, 31 Mar 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976715; cv=none; b=n8RAfkRmH6DNMtAY+eUCos2fX0brB1CD6aY3SsyH4RGsLCQyVu3OkbptLbKx/MBRtmA0b4WjxjJT056DNhC+aQgs725U9txOzQO9Sd4ms5+LBGCXXiBg6KWh/86ZOsri1bJCBktK3ZmSLMAaoh5++6pmHVRJzmM09i969tAbn3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976715; c=relaxed/simple;
	bh=p91wn6iDlOyNDvq7BGjP8kMFRBLd/B/AzRO79xA2sFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDIuilvd11LhmP9h4dnmIc+twEwg/TvMLTtWj6fNk0v0FXudbv9KlwgBbtSfV8GkmQ/PGcXxSg1Qz4pYQGQOoEk+ucjjEEYL453XeH2qMK5mZktlcur7dvlGqsJZe8cyFIdG+VZ7evsqARQUUW73KEPQ7kwalrP+0yuPKsXyHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=JyaKvKLa; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774976710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DitiYmGa03P6cnaADhTmkOMLyZ82FG+RUrubTXpBKds=;
	b=JyaKvKLaSrQo/X0LDC5H3UeOq5dGVtIM9N+kTknXCkQeKviVXKKV7WiC47YzgW0gNXJ07y
	DaYcrVV3SMmNzrP7qLLf04c0mCgfJniCuZbr+glIfhY5z5+lMAyN9F9WpJsdrRU6qXNYhF
	f37ooU3CiV3Us73Ed/4sAWq4GFTj+jPA8KH0I7QoQiwV91H5og1tr2Zq/NLNUUO0bxRsJZ
	Amvx6qEHYQIBIrXmKmoIhczCMPvb6gi9PLx08IojR/iqF3YgYGXdT90WnSpTjDMJxsV0YM
	J2q6+thH480h4+P+Sjy6PCdV5Mcb8YGqFxoHeLsZX6/+JAjleFHwYggEjbYPdg==
Date: Tue, 31 Mar 2026 14:04:56 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101097-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: F26FB36F231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 10:36 AM, Aleksandrs Vinarskis wrote:
> Particular laptop comes with two sets of sensors:
> 1. Motherboard: accelerometer
> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>     sensor
>
> Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> typically controlled by (A)DSP thus allowing for great power
> efficiency. This however requires DSP libraries matching ADSP firmware,
> sensors descriptions (must be extracted from Windows) and other
> potentially closed-source libraries. Opensource tooling includes
> `libssc` and `hexagonrpcd`, but they were not verified to be working.
>
> Until SSC support for X1E lands, bitbang both i2c busses to enable
> accelerometer functionality. In the future if/when sensors on this
> platform can be used from DSP directly, this commit can be reverted.
>
> [..]

WDYM by "support lands"? It's a userspace setup thing, nothing new 
should be required in the kernel.

It is amazing that this bitbanging works here, I don't think it was 
expected to ever work on anything newer than msm89x7 o.0

But this is likely inefficient… and "stealing" GPIOs from ADSP like this 
sounds rather scary. And would definitely break SSC initialization for 
anyone wanting to bring up hexagonrpcd/iio-sensor-proxy.

~val


