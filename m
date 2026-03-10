Return-Path: <linux-arm-msm+bounces-96674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PEyHQwnsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:13:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEB251880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1F6933F08F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5713D397E9A;
	Tue, 10 Mar 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aeYD1Zfr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zuprYGBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14357391E5C;
	Tue, 10 Mar 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149201; cv=none; b=fKZpAOmuExgEdCE5jYXZPO383og7m8FmNZJXVqzumJ6KL0RfAL0AgJHtzC9LMNzOcLBFWfgJ0gW93MZAgrVsHp70eXEvsfy2PCUYsxpphsThVVAnh/Ak/hTcDAsrTN/IScF0g7Q99Gp23ETqb0Yns61y+4C0ZFVBiwhSI2k0ZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149201; c=relaxed/simple;
	bh=IMnuUP1mDDDVn8cmGiep4hQ//yzXqOeQPK9cjdkRnks=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=sCl6MIuXKjY9+vr3LDi3gF5YgxvbSMo9VKcKoA4QMzVRN565erw1DgUxy14ik4YIlR+4rBmk30dvxJ7PSoPj4vgHiHXZm1L8Nbi4MLl0EUxOU3zexaLGyyFB8Das906QDGJvII3Vuf00+lq/xLeJJedxoudS9qcJ4BeXzoK2JGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aeYD1Zfr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zuprYGBe; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773149193; bh=Yefgatn7L7v/FCptUmJOo7I
	3XLKjozge7Yu8hNJc2GQ=; b=aeYD1ZfrFOCu2edOXHXpIxkxN68EMutaIgefMyqgRhanF9rPpw
	Y5F8jMARaRtH6g6CvCDBZx10NpOpWCn311+s5ubFGIdB1f5m2FSFZJiAlbQrEj+Bg314+Tce0K2
	7CejDJr4lcZgRFUfH2wS6sTGf+jiMBpskER/HJ7p01uoXGZXhHhvOK9WcIltJo1LdMHM4tS3JTs
	5uCtLyehS/fHGwQltdtsJeGDwhUeDZ3nWSjTJI6ldUwAaYkLHgRv2XoUfxVl/7x++ZccAHYCbBT
	R4M5ZaRyRjYb8nUyr/pLhv/V3DmCiV9z0Ddy3aYcolMAqmPRROCcUZ4/tqsYJLtnp5w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773149193; bh=Yefgatn7L7v/FCptUmJOo7I
	3XLKjozge7Yu8hNJc2GQ=; b=zuprYGBev3oyvViHXnpIrT5b/5hqH1e6Jau22VU9CkGeZRJka6
	kCow6AC76EkVNKwVYibRlkKE8lTQU1PjBxAQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 14:26:33 +0100
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
In-Reply-To: <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
 <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
 <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
 <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
Message-ID: <70ad0b19dbeee89c04c17a0618a9cecc@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DFBEB251880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96674-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

On 2026-03-10 14:21, Konrad Dybcio wrote:
> On 3/10/26 2:11 PM, barnabas.czeman@mainlining.org wrote:
>> On 2026-03-10 14:04, Konrad Dybcio wrote:
>>> On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
>>>> On 2026-03-09 13:55, Konrad Dybcio wrote:
>>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO 
>>>>>> (tiare),
>>>>>> it can be commonized for avoid unnecessary code duplications.
>>>>>> 
>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>> ---
>>>>> 
>>>>> Could you please try adding the following to your gitconfig:
>>>>> 
>>>>> [diff]
>>>>>         renameLimit = 999999
>>>>>         algorithm = histogram # or 'copies'
>>>>>         renames = copies
>>>>> 
>>>>> and see if this generates a shorter diff?
>>>>> 
>>>>> Konrad
>>>> One more question should i rename msm8917-xiaomi-riva-common to 
>>>> msm8917-wingtech-common,
>>>> they are wingtech devices. Which naming is preferred?
>>> 
>>> I think xiaomi-riva is easier for people to associate with a phone
>>> they may have in their drawer than wingtech-s88503
>> What about renaming just the common part to msm8917-wingtech-common?
> 
> I think it adds more confusion without much benefit. Probably none
> of these devices have been released without a Mi logo on the back.
Yes but riva codename is related to Redmi 5A and naming as 
msm8917-xiaomi-common
could cause confusion later when i would send Redmi Note 5A (ugglite) 
what is
none wingtech device and have much more difference.
> 
> Konrad

