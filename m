Return-Path: <linux-arm-msm+bounces-115783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3oPHupzRWoiAgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D579B6F14CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:09:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EXBCJmcb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C01C3008E29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A001D38E8B1;
	Wed,  1 Jul 2026 20:09:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA8431E5C;
	Wed,  1 Jul 2026 20:09:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936542; cv=none; b=j4TDkqrJlh3Er72ZS3GsRM9MOGnvB0uc5wz0LXYfbE2Obd/x30//h3vylLTHic9Bdonb5Q8fDlFUPE8xNc4KOlVpAWWWPwK9DnXEZdjnPYjbTKPGOtFkdzxtB2XTV80pnX/N/6XfWODarEtb7EWJLX9TJAGsvI7n/mMorQsgkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936542; c=relaxed/simple;
	bh=AcLjc22Sw/64qloW5ZNpc4LBEJYDNuRdHzkPWuS4lEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VybbH30SuxrZ3jnB2J5QN2XKN3nmRUwIYMGdlC3As5LPhv2Q+QKxbFS7zqpvAjwqsX4lesto6eL/s5eD/y7Sh+d2muXwX4JzcD0d4ZJ05UoXzt7MRoCBEu3oWYN+J2vhZwzea3k24JmtRAA5C6FBjxNMRBgY+EbGMfVI8VrJ/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXBCJmcb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC83F1F000E9;
	Wed,  1 Jul 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936541;
	bh=96jvHTeDCxR7+XirD0BwNbewxZDFsoQe83dAJZ5Y+5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EXBCJmcbAvYPFqFcBHQO2r6ZqZwgwUddvkI9gPT7NLVOsImpXL3HDd6PrstGD6Lq6
	 cfeIDkj7dEFVZZULAW1dTbFQgzx4rZ6/4XVBr2FGMh/+FXIJJK5eGDawPCpu9s4Igq
	 xs/iIq1X3Kr0xmjXsu0VyJTzyoMYM82kK8fG3PEZY+u5s9depmm8O3qbqysSt+ocJJ
	 TTqq456rc5j7FcKAE/rky5u4fYHgdJxR8KfO0YiJFiqoOufCKaqvfwNyku7A9KJyVu
	 /JxdFoi85x2DKjjGOO4Az4XTjjI36aglvg+YymUKsPxDtSMaNdhSvAByUIAGf+fRON
	 Gu9WbdAhClKXA==
Message-ID: <a176e929-9e2b-4123-ad86-0aec712c3cb1@kernel.org>
Date: Wed, 1 Jul 2026 21:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: release pending invoke refs on rpmsg
 removal
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260624192700.5388-1-alhouseenyousef@gmail.com>
 <c1984f80-f8a8-4ee2-a087-c49ad3ad1e39@oss.qualcomm.com>
 <CAMuQ4bXSG5piN9nwLoTcAOCRoZppmJegcPwghikdbQWGuGS+sg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAMuQ4bXSG5piN9nwLoTcAOCRoZppmJegcPwghikdbQWGuGS+sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,qti.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115783-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D579B6F14CE



On 6/25/26 10:07 AM, Yousef Alhouseen wrote:
> Hi Konrad,
> 
> You're right. These touch related FastRPC lifetime and bounds paths,
> and several of them depend on the same state cleanup. I grouped the
> follow-up fixes I still think are valid into a small series, and I'll
> keep any further FastRPC changes batched instead of sending more
> standalone threads.

I also like to understand how are these patches tested?

--srini
> 
> Thanks,
> Yousef
> 
> On Thu, 25 Jun 2026 09:40:53 +0200, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 6/24/26 9:27 PM, Yousef Alhouseen wrote:
>>> fastrpc_rpmsg_remove() wakes pending invoke waiters when the rpmsg device
>>> is removed, but it does not release the send references taken before each
>>> request was submitted. Those references normally disappear only when a DSP
>>> reply arrives, which cannot be relied on after endpoint removal.
>>>
>>> Walk the channel IDR during removal, mark in-flight contexts completed,
>>> and schedule the send-reference put while waking waiters with -EPIPE. This
>>> prevents disconnected channels from pinning invoke contexts indefinitely.
>>>
>>> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
>>> ---
>>
>> You sent ~10 patches to fastrpc as separate threads, do they have
>> any sort of co-dependence? Can they be applied in random order?
>>
>> Generally if your changes are even vaguely related, it's best to
>> send them in a single series, if only to reduce the possibility of
>> a merge conflict
>>
>> Konrad


