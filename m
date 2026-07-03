Return-Path: <linux-arm-msm+bounces-116298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id raQOKN2bR2qZcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:24:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19922701CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:24:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DzG189z8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116298-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116298-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 759823040421
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2AD3C4563;
	Fri,  3 Jul 2026 11:19:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304F3C3458
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:19:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077589; cv=pass; b=lIeo0EZDlE8iW45TjClnNmaQJ/7FpqZAtYTW56wD+tAAS5Bqs9gZrigCQ8bdFUrCI5G7tiXfNCjj0SF5tpuYFOQQdqempInhXIjAoqWprLPxmrPuj/YH/FAQQb6Z0RGLw/YUe1I3g90zJwSG4svsP7tCEBJSbxVhxHXGb4TnXOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077589; c=relaxed/simple;
	bh=8TU4XadQIjVSNyYnv2+Mkm/Ifb5yfUsgGnL8EhkLlso=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ipt3OVL5VZPAPgpivfJRcaPm8UWSgb2AV/ib6X8WhROgT6m1EOCIGSPErY0JPbQRFv0qyS/G5aiTlT1DHObQ0XETVzoO6CQDTyB+GzwMzHTuOrgLco3Xlbj5E4VLdkyng35SOcJBhA39F4NWR41OTZgAvwfzBriJxxsIMHatL/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzG189z8; arc=pass smtp.client-ip=209.85.128.178
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8143d904b01so3985697b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783077587; cv=none;
        d=google.com; s=arc-20260327;
        b=V9iF8SN5yTmuv8x/iVRywhG5nywUn3c0Ony6h6ibphBPki9Gb7/lDJbLJoarLD6AIY
         cJpfLm02eJpjwnKbbTOS05J0I3bt2sPgZ61af23PJPbUvJkN5fvM0sk/OVGxWoKfDGpg
         lEstmsyJrM0vnbaBs3k/QkMTrl0fuB4gJqJp80cSPANbdtGgIxdrvxTGqcSX4HfvVwgz
         36Cswp62ZyFgoWrwwwMcSpuhtpaIDQmGT+zroGcsY8nAvQzw1mWEHX7mtnNQn5jHtAyV
         tHnzhj8dbwg+LoDBWU/JaQUIwggeHyNEXPJNJ+A9p0CG5ATXVPi6YOA8LU1Qxtsm6YE5
         N1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=8TU4XadQIjVSNyYnv2+Mkm/Ifb5yfUsgGnL8EhkLlso=;
        fh=NdiO164G9Zf5wnOwjzLmMJpBpcOYXgGyFhfg3ZOEvcE=;
        b=ksPeYsn309g1YDuFNO0AUHFOFbP7ySFNr7jIirXpDKS+KdpeuOWjJSy6qx5wKIAHos
         JHTV1GhA09p0VkJi04CKUudKgt8bxPmtp+RyWKZQfXIWsnbCBW83y+S4eatAp2OA2GXs
         VGtDQkJdjewrX1DTEfs233hNwjSsZW0NFpoPZJ7jQiBoUukf4dV4OvKCuN8YyoTP0yjU
         PM2xnquJ7rRCLqVkFYVpSAva8eSNxHxLblqb6EtgSbCYAwJ0f9VKrJZ1aXXWODMa6Cro
         /nDVVEUgk0sZqwwwzwpPxu0BOIZlIgZSjlwjIWdOnIQT0t8IgA8/TWwix45ZHOhkDtqJ
         IK5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783077587; x=1783682387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8TU4XadQIjVSNyYnv2+Mkm/Ifb5yfUsgGnL8EhkLlso=;
        b=DzG189z8ybat/tXgI7bnckrrA6uEDp4dHyhC4XdYGg6gkvaBtFeV/uu5ahoIwt4DMm
         gH+O12Nl3rPLFoba/HXTKWgXhBHM6ifZ8pibgGA2wNFem88y111XsX+Mwv5XHuXtgUjD
         g8fHy5BVLv0Y2cUgv4u4zMDRI7Rd5P413DRiYPUpTAuGPMiKS6cTmaTrnE3Ah0HlPlSk
         Zs6Jhf+9CMXJwDZFixnm3T6UGlrp3L6NrDP8mAx55Iriu3xLX/6fDrhar105gB/IVJkS
         8LMclkMuCWtI24GtjChBGiswIKQEL4CRNMmeecv4GXmfv2w53W4UmmvFF7TdNmK/wkvu
         s+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077587; x=1783682387;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TU4XadQIjVSNyYnv2+Mkm/Ifb5yfUsgGnL8EhkLlso=;
        b=RvGmmY6a8df0lNFYCmIprUVnpceUUtEwL1HsPfU1OW2lFO+41l7hi7dFpfKbtpZvPm
         QjvPhgcmcTzVe8q1p602ofbjNeO9iKc4H0YhVHaqpVQBUC6rkRi8CzWnOoesJwKtRtN9
         HF8Em4cNfYCL8OrMtcJzM244P4AURVJeMF8E5NRk7DhM9Lcx08gZL9aLMhJhzX9anrcd
         GuFMkp7RIDrMQD1e8ghTfcKRM6V0DhSy/pePBwXWH8etCAdXMI3YM/X4EvXQPTnbIoRp
         7lwLFhgWSv150keFTdMVbUtqbexU+0lKe3pTTJqrAb4BpOY6UtGG/H7XKrvYO4UFvQOa
         Z9fg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5n61QdaMhFmFzRE/84ljTeAgP65aS4ctN8cBPdgFfzSVTdMtBbFoueQ4jAGqTnWZU0NL/5lIcORljq9j1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5B+ysPgbv1XVenLTrKqnEoKhbfhMI+jQXQ5wfDcbe/0Lkyp/B
	Cko2lh05aXgsHkWUPRemd0Wqoiurohua7RH+2nEnADVqFPVYkcJqS2V1KEcy34i1Fph/ylmOZ23
	3Q3IM6/JKX7mXWQR4nrTbWztcbktU+SE=
X-Gm-Gg: AfdE7clzCE7MD1oHJP5EI2sN5+p2oFElTeG2/V9EAOZJcamPAjyak8SIm9UOTFh0bR9
	T4g6CsDKz4OnO+hF7cJZRym6phHZB8Tjuunp4bkAj/omo/m8hYWT1n0wSL87UyFSKuy7Qbw62ew
	XpWVPNq2Qyav7DIvpfKJbP5Ku3aarmxqL6f5zco7f4OV9RBv+hceoX9+lCltzV90JwkzKlezzyZ
	qzDghd583aXV5PaG4CMeNQ5quLqeinn+FlITqGQjS5WRh7H1kszMlYE9kd8R1ZxzR2g8ebtjQ==
X-Received: by 2002:a05:690c:7209:b0:80a:9f1a:d494 with SMTP id
 00721157ae682-812ebb6ea8cmr101070877b3.55.1783077586846; Fri, 03 Jul 2026
 04:19:46 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 3 Jul 2026 04:19:45 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 3 Jul 2026 04:19:45 -0700
In-Reply-To: <a176e929-9e2b-4123-ad86-0aec712c3cb1@kernel.org>
References: <20260624192700.5388-1-alhouseenyousef@gmail.com>
 <c1984f80-f8a8-4ee2-a087-c49ad3ad1e39@oss.qualcomm.com> <CAMuQ4bXSG5piN9nwLoTcAOCRoZppmJegcPwghikdbQWGuGS+sg@mail.gmail.com>
 <a176e929-9e2b-4123-ad86-0aec712c3cb1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Fri, 3 Jul 2026 04:19:45 -0700
X-Gm-Features: AVVi8CeCnz9dVym3-yo3TwJd1GlzF9YbbBllKNkTYvcb0boRv6JJd2jAn5bfopU
Message-ID: <CAMuQ4bU0p=QX3iY_uo+_S_3R9dZRtiJMHKs++Nm2yzdmkKOpYA@mail.gmail.com>
Subject: Re: [PATCH] misc: fastrpc: release pending invoke refs on rpmsg removal
To: srini@kernel.org, konrad.dybcio@oss.qualcomm.com, amahesh@qti.qualcomm.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116298-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19922701CEB

Hi Srini,

The patches received strict checkpatch and focused compile/static
review only. I do not have Qualcomm FastRPC hardware or a DSP setup,
so there was no runtime validation of teardown, reply, or refcount
races.

That is not sufficient for this lifetime change, especially given the
concurrency problems raised in review. Please do not apply this patch
as-is. I am pausing the FastRPC set while I reconcile it with current
mailing-list work and re-audit the lifecycle assumptions. Any
replacement would be an ordered series with targeted fault/race
testing and clear hardware-testing limitations.

Thanks,
Yousef

On Wed, 1 Jul 2026 21:08:58 +0100, Srinivas Kandagatla <srini@kernel.org> wrote:
> On 6/25/26 10:07 AM, Yousef Alhouseen wrote:
> > Hi Konrad,
> >
> > You're right. These touch related FastRPC lifetime and bounds paths,
> > and several of them depend on the same state cleanup. I grouped the
> > follow-up fixes I still think are valid into a small series, and I'll
> > keep any further FastRPC changes batched instead of sending more
> > standalone threads.
>
> I also like to understand how are these patches tested?
>
> --srini
> >
> > Thanks,
> > Yousef
> >
> > On Thu, 25 Jun 2026 09:40:53 +0200, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 6/24/26 9:27 PM, Yousef Alhouseen wrote:
> >>> fastrpc_rpmsg_remove() wakes pending invoke waiters when the rpmsg device
> >>> is removed, but it does not release the send references taken before each
> >>> request was submitted. Those references normally disappear only when a DSP
> >>> reply arrives, which cannot be relied on after endpoint removal.
> >>>
> >>> Walk the channel IDR during removal, mark in-flight contexts completed,
> >>> and schedule the send-reference put while waking waiters with -EPIPE. This
> >>> prevents disconnected channels from pinning invoke contexts indefinitely.
> >>>
> >>> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> >>> ---
> >>
> >> You sent ~10 patches to fastrpc as separate threads, do they have
> >> any sort of co-dependence? Can they be applied in random order?
> >>
> >> Generally if your changes are even vaguely related, it's best to
> >> send them in a single series, if only to reduce the possibility of
> >> a merge conflict
> >>
> >> Konrad

