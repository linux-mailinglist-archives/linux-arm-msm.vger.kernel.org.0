Return-Path: <linux-arm-msm+bounces-107709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMpfNN+tBmrImgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:23:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96053549827
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6821302CEF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E973D31A556;
	Fri, 15 May 2026 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXS/9HyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902032868B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822621; cv=none; b=rmkp/oR/mmH/mONzgLWqnOPNgPWcXq3nFonMXVi+CyCpt5Z1KxPDAqWtsvwdRXAd+yDNqfFbUWNuVNs7gK8Ibq5PabpezAF8OtaFYyGXbX1IeJ/+KNQXpKBnCbUUVLuUN6v+1xEpOxJZhflx7YUR1PAxhE0GHeZ73ybxAqtAx/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822621; c=relaxed/simple;
	bh=ixr6UTkPaqIoywLFWnbYraaAvOuKOaos+d5WnYABLqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmg//RIOQeV1iIOBtATydskOqNsFJ70YK4H85YFk99Eo+0wP03n7Pxr+PY4ZbhvaBedGsf0q5wd7JE5/rX5WCwIB2v4eQyIhyWNP8LqbypjLCWbUkDCYFko49/8fScLaoxKW8eyu2SdqiyR0U4hLEy8DTdkYdncgqk1zYLYRo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXS/9HyI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8367df48711so4180982b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778822620; x=1779427420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpC4Sy2ohSEgf27E/5DP9PBOmyJ/jHfS/ZObuxuM5HM=;
        b=YXS/9HyII+gjNAw7nos9AiSFiNG/l83Aq/THq5ma6LQjB33zPfZfPVLZT1CwaLTT78
         vNg+93x8CIAiQ0+hndlVgdTgnRY+2H8SUnfqh/Hna0bPe+aBzDY4baPFDW6DYrBwvJvd
         JT0QFjAEFLchJ3bHGUHdTfaBRKZdtBSBpZsSUMGi0k5EMhfXk1601zulPaaduWrEyffZ
         5n1/C6vH9NBPuWMbexIbKR7jU/Z7b9xgSugJVTvG3xrza3oY4g21yLzFlXuNlRWrIaDE
         MhKeUQhkBg9Dvh4hk5S/FP/oLymazQb8ipDlE5rgpdeGASqpPATlMG7ctfnhgDpAlBCy
         tGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778822620; x=1779427420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpC4Sy2ohSEgf27E/5DP9PBOmyJ/jHfS/ZObuxuM5HM=;
        b=H0vFDDFv/Gi/4/NaF5SMxggSTytPjpvq9pe34pwrKBBOsg/mCc68x/UMfdypglbk7E
         2GB0fmqPL+4s15lGgwVBlwUmf+evOZ12lBtYTXcOyLCUcK/bdagp3xwLzovrTlj7IuF9
         3XHuvyhPhT+odRntdzqhRdjdsOcKKzYoTh9hVrd4tAG76e8L9e2ON4ydOTBGm/pj3RV6
         HBB+7RgS4nsjL5IaEjgOkQxzBWV+b76KLlqNHA5tvFIimbbLk4ufgdgHYsmSzuqV8tXx
         76XEWqwhr6stxVtgQJDXdCyyYT4LNEXKUGlRMLPQmVRqOu905Z46nAnrYXQO3q+gghIs
         h29A==
X-Forwarded-Encrypted: i=1; AFNElJ/BipVBbwSY8/7KmJZnxtOpVfBHcStE9c/8RXQ1AJGpNXbtesCqGL2GE4DE23FapdVumQNvbkHHjOCOtoa4@vger.kernel.org
X-Gm-Message-State: AOJu0YySzm2SHYFRRYleJJt7TQPgBHe2mIy/37uOtwOcfzTVyhczb8GG
	xyIuPh9+KzD2I7IP1wKK4mNRbeSpOTXLWvGR7SyAyc1dt6T1snsGatAD
X-Gm-Gg: Acq92OEEIz2rhS47i3JhgPb9O0gPu/13qxZCBD5V/I1kP5grkNMcNSUryHv/MR5ep1M
	y7RtT4rPtlOXSVMCNukVxfDrNzf8sLBPvYwglXu3yl38Qka91PnG5vs3IKVfVNHvs3f/tcoOk1z
	aC6lVQoeAmNN6gZ3FPhqJzosceVd3kDxNfutgaukiesBm85GRGmGOYXInziC6LEciYcHWcs5+2H
	EMos7wYSTAFrvGeHgFJvybleF5a5uqPx4lXekoyyB7/4XhKbXLglqwP3VA4focpUi9SgczZI8LX
	/R5fa9K3XmSQk1xYyK9GVaWqUeJfTZP+uqw8ox7tli7hxGyojluUwPfjeiY9JjBFsziaLLPI5Zy
	dSUwuUvigssrNuUJy7GR8riCIiWEkUzOGauAXzvKg0F9y2vpC0//6TITSh0cJhBKJ8BU3ns4oQJ
	2FnYuSEcHG8KE7Ct/XIDx5rgDaJWM=
X-Received: by 2002:a05:6a00:2a08:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-83f33a18fcdmr2722540b3a.0.1778822619721;
        Thu, 14 May 2026 22:23:39 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1942a83fsm4766005b3a.0.2026.05.14.22.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:23:39 -0700 (PDT)
Date: Fri, 15 May 2026 12:23:34 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
Message-ID: <agat1sBHqkGWKzOD@soyboi>
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
X-Rspamd-Queue-Id: 96053549827
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107709-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello Amir,

On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> > qcomtee_object_user_init() is a variadic function and when the function
> > return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> > case, there's no va_end to cleanup "ap" object initialized by va_start
> > and that can cause undefined behavior. So make sure to use va_end before
> > returning the error code when there's no dispatch callback.
> >
> > This is reported by Coverity Scan as "Missing varargs init or cleanup".
> >
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
> > I don't have the device, so I am not sure how to test this change.
> > Thank you.
> >
> >  drivers/tee/qcomtee/core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> > index b1cb50e434f0..901a31e8201f 100644
> > --- a/drivers/tee/qcomtee/core.c
> > +++ b/drivers/tee/qcomtee/core.c
> > @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >  		break;
> >  	case QCOMTEE_OBJECT_TYPE_CB:
> >  		object->ops = ops;
> > -		if (!object->ops->dispatch)
> > -			return -EINVAL;
> > +		if (!object->ops->dispatch) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> >
> >  		/* If failed, "no-name". */
> >  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> > @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >  	default:
> >  		ret = -EINVAL;
> >  	}
> > +
> > +out:
> >  	va_end(ap);
> >
> >  	return ret;
> >
> > base-commit: 5d6919055dec134de3c40167a490f33c74c12581
>
> Hi,
>
> Forgot to mention: how about using a break instead of a goto.

Oh right. In this case, using "break" statement is enough. I will send
the v2 of the patch. Maybe something like this:

	if (!object->ops->dispatch) {
		ret = -EINVAL;
		break;
	}

and then remove the "out" label.

> Then feel free to add Reviewed-by.

I want to confirm first, if I changed the patch using "break" statement,
do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
still not sure when to add "Reviewed-by" tag, like can we add
"Reviewed-by" tag when we changed the patch?

Thank you.

Best regards,
Robertus Diawan Chris

