Return-Path: <linux-arm-msm+bounces-96384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLJRF4ZAr2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:49:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B09CD241DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB0A30D0337
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A7136AB46;
	Mon,  9 Mar 2026 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hSe/vbBY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6PQ7E4io"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2444A34F241;
	Mon,  9 Mar 2026 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092947; cv=none; b=LnUcqNXIUFksN7hze0K0VzIcPUa9C2+xPGVPpgxecRT5Pt1qHkHsFQ0hYN7JnpOfF+O8/mLpbQHEcm+f84lnwJ1QGLPfoBBDPoK59wTegpoZy2rtuHZDhBmbrOuTGUGsniQwve6p9wIKk/WNnAVhL4MC5HvLd8YsRClXNMCZlDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092947; c=relaxed/simple;
	bh=usin7BYKGyGID/KA2MpWwRceLuxQs1ugOXr22irERWo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=k7iFvzqie9D/e+LnFuirKhDta15wUMOwTxFlKbVENYX4PSDiv6qxDDRm9Eh5kBE1beER6ku20YDuoBv/fqZP1o+1849CTSwByTePDj9LVku0ickazfircBF5lDnAnOnzFq3acb+Q9YgVR+OZy2qhyqXecJ/YwIb3y2bKfM+G9UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hSe/vbBY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6PQ7E4io; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773092938; bh=lT2AvHoLYuBoYFn2IztXqCJ
	7Z6kWDCvjetxjOt3z6Xg=; b=hSe/vbBYL9kXtPt1wa2I2gDvG8ntiWxvOFSRwjnIZ56Pa4jcA2
	VCWqfVHaUbKCJX1MueTLl7rGkotqfv3EhPtXYCKID5jOnXUSLWIM8gxVOonN5NDw9wjHNPskQ8M
	vgHL4IH8ecLbNBVf/YKjCdNI2nQfrWRWrHUhg0ol4s0u6WsfBGckrV13CTDjNMB0qPS58Yn+fGa
	TLzJY5rr47ydF/wtmK1Etu+5o2oleVb5OaFZSjXTg2TISWePEQnbjpPUR8gNxREFQvHEI3eXTtP
	AmXoggESqVmegEnJT0LB3h1djXqPLu/l3GQU0hA2jhvRb1kLtws2apMMq/aqIupHlHA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773092938; bh=lT2AvHoLYuBoYFn2IztXqCJ
	7Z6kWDCvjetxjOt3z6Xg=; b=6PQ7E4iovfFJ1MraJWChEMHirzaRTd7DE7mIH1A+zdONMmzLop
	d7EdXQHhkxCu6+BaELsDkMWbeyKue7PCowDA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 22:48:58 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
In-Reply-To: <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
Message-ID: <89ec6b4f9ff67a8ea035534da9b866fe@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B09CD241DF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96384-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

On 2026-03-09 13:55, Konrad Dybcio wrote:
> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>> it can be commonized for avoid unnecessary code duplications.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Could you please try adding the following to your gitconfig:
> 
> [diff]
>         renameLimit = 999999
>         algorithm = histogram # or 'copies'
>         renames = copies
> 
> and see if this generates a shorter diff?
It is inverting the diff there will be less change in 
msm8917-xiaomi-riva-common.dtsi
and a lot of deletion in msm8917-xiaomi-riva.dts.

I can split the commit in that case rename will be shown properly but 
riva devicetree
will be removed temporarily.
> 
> Konrad

