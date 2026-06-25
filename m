Return-Path: <linux-arm-msm+bounces-114479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hd3WK3nwPGrcuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:10:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DD6C418C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aAGm8Gyr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05AE3056511
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF08E221F1F;
	Thu, 25 Jun 2026 09:07:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F237C91B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:07:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378431; cv=pass; b=Hl2BxaI88lNrNeMDe8ys8ClAUtpG0qbmqdxmH4nCeZfMVqIN5FIxeArfZXLOj/mnv8SZJfGuzUHf/ckPJk60BtVHgejaqX+ZSeyOX/NzoAPSYQUgEPyv8KxB9RR113AMRalpuompCoepcLyhRMeNx2qBHNfKHzDQqcy8BVGTfc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378431; c=relaxed/simple;
	bh=YvbDz6sWa3AWCmeTnS19savIdeLNARxTK6KFvXLsCYc=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM6U+KVNknOjgjkkZFBYyjz0K5KdS0Z7t44DGfMcdakwnITnH3vF6a8TqNwCmQMH7v+jnBDHQ8uUKkfjs68VYm27iAyfJ78LK9TBMT14J5kFIzm2vOR8qFV8Tlu0Gy1PfAaAeEbyj/fa5XHYvP3S0P7lHhXXvoMuQZz+jVty57A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAGm8Gyr; arc=pass smtp.client-ip=209.85.128.179
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7fd8446a1cdso19045347b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378429; cv=none;
        d=google.com; s=arc-20260327;
        b=oSeVyY0JVGxm345CHyM+CMYDi7dFIwdTaY4pWI68BrRV4ljbuJfQpXd6fHio9hK1ia
         Sttlw0Vv+vnd5PD2PGMwYSmOtKhr66Zalsb9/3vLV1ZrRV5chwDAByQPLrXg6Bq+MyTO
         VGL1hD65btptWCXHIXmr7KyGNPUIte+xVcqexQ44mDQPNIywMFpP0dTMx7tlSf+AZWYe
         zXgvEiX18V/Yq+rjr//2bZCsPHGNB3STtgeM1zdQrl0ji1kVuKDZjciZb5/25J+5pazw
         0+dXSVGUZdmd1s0y696U84QxPHPxKf7hKmFMFDOxtMYOUJ+wa2CyeVU5kRjpdYShSQQc
         sajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=YvbDz6sWa3AWCmeTnS19savIdeLNARxTK6KFvXLsCYc=;
        fh=BjLpy6e7oTzDbfHN+jn9rwfyumQTCL4tkHLgmkX7YQc=;
        b=hllfstAT6EW06/LTDUGZM9Cewr9nnED162Ih5i72dJ05R0mdbo0cQP5McUwYkCYJwK
         NDta8YMn+rQHzckv7UOaFLe2tNOF3et8wEi/IpSfeCNhmZNpIuClYWpcQhFJR8CGuZYC
         WXcac92J8ZUaEQgzld2uV9q7scYz1ianf3GsJmQOOjNag1ag4tx+3F+tFal6Vch3Cz19
         8IiqePw+dX50U+AY2EO05tOoe7FRXmzQ/trdh44u6GT4uYnazuyhzCZf+AQRtwbbmCoS
         hSV8UoKY6ZlN5qI26O0J3685hbSyJtVZE04S008sjw+VrT1s0EKds6QhZzrkcWS9vIAe
         oFJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378429; x=1782983229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YvbDz6sWa3AWCmeTnS19savIdeLNARxTK6KFvXLsCYc=;
        b=aAGm8Gyrcwi3G2/2Ml63Bq2CZi5eoaNBF4ucopxym0qvfY4kiQOe57wfy+WbT28IGp
         wl4lCarb5iqR8eREVgyVh+A1TGL/67g2la1cxek+XSbiZY3nivrAfto7gcx00rad4mk2
         3n5lTviU77bNy8ofAZEKknUw0d5QUteI7/mnNJY7sw/X+UrFh6J+B/PpBWKG4bRMYH3U
         KfvrC0JEvLdvRpif2iHpOZFZ5dlP0MG3fxN7gb5uZXvKUARF6IFJLotIBtgVg//qW9xk
         DsXRpASH4EGEj/t7QZ7GAPo605CzO17dCvadr6Ms7gFY/yFgjNvmEEN/k5nHWr7wsdCl
         9gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378429; x=1782983229;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvbDz6sWa3AWCmeTnS19savIdeLNARxTK6KFvXLsCYc=;
        b=sPQFv1f0Ctl5tSasjiXnB9H7i74cHHxj9tDiJqN3M+F3w27JEuIR9Hw2ovJrih5DMG
         IxHRVJGs1wqcpElkK17ygzGAC4Nxl8o3o6WiHlWfwrRwwhDbddmjxw08/1ZeFXLGi+sE
         JAg/YBDFPJ5Q47UyhPJC6OEIqfzXf8J92epNxoupzutC+JdbWkrBaTN5cFmqg0yXjTbV
         AhODX5+I9nAdyOcK48j1T1uHNekAnYReUQNISDMr2+R3Qhd5WXNELUEY9BFgc2CG+OYM
         vbwws1swsMptUb3EJL1O/q+G5ka1+rr6fd7i0Gd5a23mNnL9egLtn9FvFy9QZ7paxR/6
         5jOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/lKcpYGB+0Llpvg6FM7ebK/FDySjFZWMpj6IwdxTr6EIGj80ae+Zxdgv6lX3JYvze++sShxyZvkSqUf8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4bVzevBu1wKwe2MrHKSNE2bYN/KTlUXX3tfrGKxfLYpyIK2C
	L5Bq47jaDXWxnULLdbX1kpgqbjSHDfQe2VNmb9q9SnFWDMmKDJaHCMiSofj9R4aWF/9ZFwJAs3C
	9uUoZo2tvv7qLGjXt3BCxDO6Zi5zFsVA=
X-Gm-Gg: AfdE7clSTppsWICxDhzk7ybW3pSd6i+5myL15IbbT0GXOAEM86vAJf8m1DfqwlUetno
	TEy+4dfPjOrmdekFRrbyxM86ss2YYKqA5DBTdI9rfrECKvRRMNsr9uQH4oP3mUT+jlARPrU8aDV
	8ztarSG9plQXl5B9M8S6LiXI7aFaXaJUsSivZo4s3BjcnXV405xEd3A731G1m0EdWjBNE6xCsq2
	b0dQdt1rgxClmZjPVSiEoXrFFsmndRbfzwipGyXDKDeVRC4CtZLbozd/jTor7zBWuSghUH8Tg==
X-Received: by 2002:a05:690c:f01:b0:7fd:fba1:1589 with SMTP id
 00721157ae682-80a6cd77157mr17457367b3.47.1782378429208; Thu, 25 Jun 2026
 02:07:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 02:07:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 02:07:08 -0700
In-Reply-To: <c1984f80-f8a8-4ee2-a087-c49ad3ad1e39@oss.qualcomm.com>
References: <20260624192700.5388-1-alhouseenyousef@gmail.com> <c1984f80-f8a8-4ee2-a087-c49ad3ad1e39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 25 Jun 2026 02:07:08 -0700
X-Gm-Features: AVVi8CfXcO4Xqj0xfIbkRCaWdoxuKn4uA6lq950FpuO1Yg3xRaEV5QuIM4uxQ7M
Message-ID: <CAMuQ4bXSG5piN9nwLoTcAOCRoZppmJegcPwghikdbQWGuGS+sg@mail.gmail.com>
Subject: Re: [PATCH] misc: fastrpc: release pending invoke refs on rpmsg removal
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114479-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 028DD6C418C

Hi Konrad,

You're right. These touch related FastRPC lifetime and bounds paths,
and several of them depend on the same state cleanup. I grouped the
follow-up fixes I still think are valid into a small series, and I'll
keep any further FastRPC changes batched instead of sending more
standalone threads.

Thanks,
Yousef

On Thu, 25 Jun 2026 09:40:53 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 6/24/26 9:27 PM, Yousef Alhouseen wrote:
> > fastrpc_rpmsg_remove() wakes pending invoke waiters when the rpmsg device
> > is removed, but it does not release the send references taken before each
> > request was submitted. Those references normally disappear only when a DSP
> > reply arrives, which cannot be relied on after endpoint removal.
> >
> > Walk the channel IDR during removal, mark in-flight contexts completed,
> > and schedule the send-reference put while waking waiters with -EPIPE. This
> > prevents disconnected channels from pinning invoke contexts indefinitely.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
>
> You sent ~10 patches to fastrpc as separate threads, do they have
> any sort of co-dependence? Can they be applied in random order?
>
> Generally if your changes are even vaguely related, it's best to
> send them in a single series, if only to reduce the possibility of
> a merge conflict
>
> Konrad

