Return-Path: <linux-arm-msm+bounces-95485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DPQJpzaqGnGxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:21:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AF209C4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43B38302C308
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 01:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543B921767D;
	Thu,  5 Mar 2026 01:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Dhtb/eof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991651684B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673687; cv=none; b=qc4dvbdSdzudx6qFlLPzWXHLs/VVr+8NhTttl2obWtekPcsjRINZSwsHldfX3Swgqx9K1ZK4+kZ2qxu35FJmtM9gN/tKLph0JTznk0gMlt6Hb7vTVM4eXkDAPjvRa0NtAvVwIsDAW6FQab6WLPhId+ucJDqPqlM1zT6B8+cJEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673687; c=relaxed/simple;
	bh=mBLbd9uo5NWnxjU4LeK9/wHBemppxn7CSuA0d2uXBYk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mu6XHbWsPAIKpNpMX2xevsM4o6vI5TCXvE446CCdEl98Lq2w98D+U7yYu88UQzSMU7l4W8G/V9TjAbwhwyVe+AJPW1pxqoZmXKTNTvzcz7aKpUtcxwDee6POkhjnnoc7GJejazD4bGr0QkG19dYhWXw1n8H8f4rc3GKAoHnW3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Dhtb/eof; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7nxb56qssralvbv73nzmtqrf4u.protonmail; t=1772673673; x=1772932873;
	bh=mBLbd9uo5NWnxjU4LeK9/wHBemppxn7CSuA0d2uXBYk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Dhtb/eofli8ZSu0xsdZs4EDHEBt7I17JxsuP32dCjviasOwycVxSv+DS1sHMJBmTi
	 0P1kZS1pBoWKPpq2Bc8uPoMmD4ByQr0cHX9/+uQQ2lLt/WGJ3dFWGZW1zLVwg2Ykoj
	 Rk87V6Onh9fibRKfiVtcYd5uyDQ1yzATiFD2av7E/904E8AixRGPNZ8P+cU867TFbi
	 vNekZE0X9MFXyQIuHwe3a/CVpaboy94mBRTdnTcY4zz0NKgPG1FaPeDnyu78s3m4oH
	 8UTpbyYAYKKiIPGKhw2VeLQsuxisoeYrUotK4QSHpDhfsahsTn9S7+g2nHTGketNgK
	 H064ZbBVoTQ1A==
Date: Thu, 05 Mar 2026 01:21:10 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
Message-ID: <43c4dfad-be25-42e5-a04d-060ab6be7f5f@proton.me>
In-Reply-To: <a74affaa-5cad-46dd-be46-82c3b71dc512@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me> <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com> <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me> <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com> <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me> <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com> <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me> <cdb322ed-cb1b-4c7a-900e-31bf5b13cfa9@oss.qualcomm.com> <11bdc3aa-fd9a-44fc-b416-b3d6157aae37@proton.me> <a74affaa-5cad-46dd-be46-82c3b71dc512@oss.qualcomm.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: fc6d09017c9864c89395c93e6ab5951dd1f9888b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 136AF209C4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=7nxb56qssralvbv73nzmtqrf4u.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95485-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,proton.me:dkim,proton.me:mid]
X-Rspamd-Action: no action

On 03/03/2026 11:04, Konrad Dybcio wrote:
> On 3/2/26 6:52 PM, Tj wrote:
>> I've shared all my results, configs, logs, screenshots/photos - and will
>> add further research notes - on Debian Salsa at:
>>
>> https://salsa.debian.org/Iam_Tj/galaxybook2w737
> Aaaah it's the slimbus driver crashing..
>
> I believe someone is working on a fix for that
>
> I see that the node isn't enabled in upstream, so perhaps you had
> some additional delta
>
> Please try to disable it for now

I've been doing some intensive test and debugging:

I've moved over from mainline to the sdm845/sdm845-linus tree yesterday=20
and although it still doesn't fully boot there are no kernel panics.=20
However, there are a lot of deferred probe timeouts and sync_state()=20
pending that I seem to have, tonight, tracked down to the DTS having=20
those devices set to status =3D "disabled". I've worked through each=20
setting to "okay" and am about to try a boot with that.

What has been frustrating is it now reaches the initramfs shell but due=20
to no devices there's no input, no USB, no network - so cannot even=20
script writing the kernel log to storage or network !

I enabled EFIVARS PSTORE and kernel log but for some reason that doesn't=20
seem to be creating the PSTORE VAR - at least cannot find it via UEFI=20
Shell's "dmpstore -all".



