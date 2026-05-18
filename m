Return-Path: <linux-arm-msm+bounces-108299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPdNAhqZC2qOJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:56:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F5D574D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D9EE30067A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90862F8EAB;
	Mon, 18 May 2026 22:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQV00PvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F926A0D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144982; cv=none; b=J/dCxtyU0rkQARyRk14J6RFMQ2at5rb2gqBS5sQZXP+swV8zPCavnL7GPAUDrEvnp8pGb74iKECYqE2syG5ZqrKk4uKOAjSDfV0J68Q57z1TCWjjhhjXss3ebqQiWC9iYT+ZA4Jl1ysvsWCh+uf1qoviRon/T7Bf60V860cSq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144982; c=relaxed/simple;
	bh=IUdRJC56RBzqNCM1DPww5KqL+egKKwzZHSppoHwXz1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8dHg5fpz9M+hD4FsGQdkGUBtYT9zbXJ9/GxQtE7pkzZgET4QQKbdwrIctRobApEG6ajhsGu2ds5dUzeCPVB8o6/t5oEVtg/doZgZftR6xGXfLAp2gZH+hHDGFwymKBaQvL8zyeQ1Ya2vDAx8mvV4sc1htrq6ZCGbRtgQt5lg/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQV00PvO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2357005a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144981; x=1779749781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7+IeU1q4KF73mOQ7FypKUKAYVqW8+sQGdeWvAZi1Ts=;
        b=jQV00PvO1x7KvgjiFebPB5kgvKjzuXx1dJ+2wh68+17twJ4MikCG3FV4LYk1PBc4ez
         sRokYixVAr7t6CGMsL0U9ngTCccN63OYrVBKrD3TmxKHiUK72UrVN3aKwIHGWBZcmK9x
         RduVF+3p33qS+1FLZ7z8RYpGQhlOgnQx5sMepq6dXh6XaRTdETD8yIOsYkokDYxCh5ET
         QdanPdlN0ruy72kXzYaTeneULLyGrvHvRC9CUD3kMrdkv8eYtl29M8gPgTq/avB6kPhJ
         rqexW1jy9KZhCobtp3fTfEDd3y3WZoi/kknK72yYVZC6CksSPbxVO5D2u0CYtvkA60Bf
         1wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144981; x=1779749781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7+IeU1q4KF73mOQ7FypKUKAYVqW8+sQGdeWvAZi1Ts=;
        b=WZ4bxyZCWP5hBToBjQVjsFv3ySW9BzUHZ/n1hEluhNe2NJcoC1+BxJqRSwwi33WFrv
         YONTDjw0ZVOglPZI5LxYx2ipdk+w3mOopMzIES/IX7t8d3l7Jk9XmOkdN4mj/Yiq/WHW
         SzXyZ220XrxHPFFKLDciqfkZ2CadG88oiUHsUAh6YkeYnD+OSxGhYgxmf5oARuRxEcpc
         HzcvYJTF69pOomoh4yVR9HnXVoy8CXb2GQDneq0yevsXkUEfnGlymr7DGgpIgzvKVnca
         2lNFiT2vWxCQ/pPaQT9BxISJTZeHCEJQekDBRh7hc5UZ11BgfkH+hFJaaB9ZmY/cUPbS
         gGbw==
X-Forwarded-Encrypted: i=1; AFNElJ9hMpWg/5Ks3nTLSvf6WWsT5bGg4YC4iF2f48yIVr5MvvuHD8gFmKjN80h7mefmhbRMHpqje4g2zyrQcHMn@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNjPBApX3VSuB7Ev2gsJNGfEiqHDKf2R7CocpCMXXqn7S0kIl
	UCJYi4EYXtoJdEI7OHtzkwCoUuW3O2ONAsDbpzikjAdhmZRnrooG7PcA
X-Gm-Gg: Acq92OFOBunXCLkDe/e005lMuJKJVNWdOdNib50szeXAIeXSplW5eu4XNndL/AWubm1
	I1GZqd7vIowgbROCjiF5JFaD875vUpXMCfwb+3BvNBRwokGvVAN2HkRksemEj2Rz1Wh37c7xlkK
	aDEFfrc7Ilv8JH/w6g3+5n1c9pEOkUA+kdoY6oqs3aS5zK7Gc0xNky6AFV5UsPcMrvBDdjrsFMV
	enxYF5bTBr/wpob5EGyar+z++ghk7I22j95OOXldi3/cKM+3JXG4GpNeF0iC/pVqCLksn0/w9K7
	1rlVzN8PSpDZAaLY+ijZ7b6HWxufngeKbI+hUGWwG7KM9Hmp2mKKSX9F+w1CadD0wVX/l82oUz5
	0yuFhE4aiTdOJZd96Kx9m/JucIXNnp9LPLgWiQSD16uw6e5C6vXEnFEhA1sNlTN19WoPf422Pdy
	cF0zJE+7xBYrvVLbN7wIHXQpF9bYc=
X-Received: by 2002:a17:903:2c47:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd7e933cafmr193650485ad.30.1779144980702;
        Mon, 18 May 2026 15:56:20 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm161487735ad.13.2026.05.18.15.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:56:20 -0700 (PDT)
Date: Tue, 19 May 2026 05:56:15 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
Message-ID: <aguZD_vcJCwXY--l@soyboi>
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
 <agat1sBHqkGWKzOD@soyboi>
 <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108299-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 61F5D574D2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Amir,

On Mon, May 18, 2026 at 04:36:20PM +1000, Amirreza Zarrabi wrote:
> Hi,
>
> On 5/15/2026 3:23 PM, Robertus Diawan Chris wrote:
> > Hello Amir,
> >
> > On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
> >> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> >>> qcomtee_object_user_init() is a variadic function and when the function
> >>> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> >>> case, there's no va_end to cleanup "ap" object initialized by va_start
> >>> and that can cause undefined behavior. So make sure to use va_end before
> >>> returning the error code when there's no dispatch callback.
> >>>
> >>> This is reported by Coverity Scan as "Missing varargs init or cleanup".
> >>>
> >>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> >>> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> >>> ---
> >>> I don't have the device, so I am not sure how to test this change.
> >>> Thank you.
> >>>
> >>>  drivers/tee/qcomtee/core.c | 8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> >>> index b1cb50e434f0..901a31e8201f 100644
> >>> --- a/drivers/tee/qcomtee/core.c
> >>> +++ b/drivers/tee/qcomtee/core.c
> >>> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >>>  		break;
> >>>  	case QCOMTEE_OBJECT_TYPE_CB:
> >>>  		object->ops = ops;
> >>> -		if (!object->ops->dispatch)
> >>> -			return -EINVAL;
> >>> +		if (!object->ops->dispatch) {
> >>> +			ret = -EINVAL;
> >>> +			goto out;
> >>> +		}
> >>>
> >>>  		/* If failed, "no-name". */
> >>>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> >>> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >>>  	default:
> >>>  		ret = -EINVAL;
> >>>  	}
> >>> +
> >>> +out:
> >>>  	va_end(ap);
> >>>
> >>>  	return ret;
> >>>
> >>> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
> >>
> >> Hi,
> >>
> >> Forgot to mention: how about using a break instead of a goto.
> >
> > Oh right. In this case, using "break" statement is enough. I will send
> > the v2 of the patch. Maybe something like this:
> >
> > 	if (!object->ops->dispatch) {
> > 		ret = -EINVAL;
> > 		break;
> > 	}
> >
> > and then remove the "out" label.
> >
> >> Then feel free to add Reviewed-by.
> >
> > I want to confirm first, if I changed the patch using "break" statement,
> > do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
> > still not sure when to add "Reviewed-by" tag, like can we add
> > "Reviewed-by" tag when we changed the patch?
> >
>
> This is a small change. You can add the tag when sending your v2
> as long as you include the change.

I see. Alright, I will send the patch v2 with the change and the
"Reviewed-by" tag later. Thanks.

Best regards,
Robertus Diawan Chris

