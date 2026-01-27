Return-Path: <linux-arm-msm+bounces-90630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDHAEM4geGk/oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:19:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D58EF5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E8DF3003BC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A209C2BEFF6;
	Tue, 27 Jan 2026 02:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbqdY/Na"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD223815B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480391; cv=pass; b=DbsfSY0fjelnb6JcYoMpbh0NVorCZezJeZXk54AqbUTy3nRjHmXE+E7ybIyrXXYDfEbm7nl6bbwCjPSFJve7njJK67yhfqWo9SIgK1cDhztHJkn2pRx4BMpXQPxvcakAaWHxe3n2RiRTikmvr38Rm/K1Jo8Wou8nqV3wp6aXEe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480391; c=relaxed/simple;
	bh=ds2MKOYIaPbKgraiif9OmBCAOVwuarVvu6z0WwORmds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf0xdjdoGj7kaG8AQlPadH81h3Dio2PzUTOQOJ/ioyJZBgVzMzSqMRQFq1rFCq+VfoB0caV/OjiQQctBvGQf9J/Lmb26EDwbn737F4iY5C/aqN2oB6w2me9+lLByoy6JkqPGofLOSWVyDaAKEOPjdXTRpiRr532aIEN1IhEzA/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbqdY/Na; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso1961079a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769480388; cv=none;
        d=google.com; s=arc-20240605;
        b=JB13fuiB9pb4Yg5yHoLwU6/vEBnhE2bKbfO8/rwuuMji1rZ/C8gKIQUjsM5TQyPCcO
         AgKT7RRfK55keGv1VdlJeQcbr1GCKKEG32Wgkm/eV9zjerunUOqd/t95yy/p3XfHtI7p
         fxUqk97IWC8muOMpcwaXP0kk1YOAIGh6fw243KjFZKDYgU+e2fAWeLLv5rLAZ7A7Rnxa
         svfQTqktIAZUz5wSIrVu8bw/Y83iD0XPKx1nqJGX6Aw7xpUxm+8lAhrf7ZcOstCWd6VZ
         XjnfQ0bpNBZWzPCLU2h+jMpKZDqljoJcruQDqWkJD6U6LaVwtBSbygLo61E89MUBEX/9
         u3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
        fh=T/um/mhSzaNNOlH8k6JvNZCriGFxC5WZT3W6dWqDhjo=;
        b=ioR2v76JliGfbRFABJFp4Z69SSE2smw9lnlnhbleuYI5lIwId5oASQQdkjIdYc51o5
         B1wmhYpulFe4kDNVJieZMLlGOWAZzMJ/1mZpFYAwhqYe4FgrtayWRApZKZsmkS44pxwL
         O2NoL6xncWxjht929qDFfl13oK/0IoW4qA5LO66UVVLlhQSciyH8ABRejEffs+e1iKcR
         L65uXdE+xx3eUkfeyKMLTlJuufFdsiBBxwG3qmoJQWhnhkq9CbthStK2Uf9rTDejpLFK
         Sk5FPTng3CCNj3MQ8AmM4s9IepdKUf1VX5nZGTvgRyyuzvp0FbHjmey6q1O28GWvcqeF
         ODMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769480388; x=1770085188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
        b=GbqdY/NaT0StNpZzhbs34YyFWRsnSIcmcjqnW/2liKPoKHQR0VEmoTFqBADyuVlpz1
         kk1rq0Nnq1adF7vGuqc/2blEwTMyqCyKqD1zT27yd6s3EgNPwhvqQwd7rHjh24YdYIbg
         g3VKsgLgm9DEchbjWOckiVfyA0rrBTnuGu+4e6KI6M17CvgiOrtdF0aoB1vzZeZrj8is
         AK+2L21Ixx4Ri7zslOhH5JcGOeVIXiqancB7eCgZTROrYTSSnFLdDXYoRDdDsHQYfVDO
         0WdeltN2LgmSJVLEtFJbhavKLDULLagzF14EeEjA+MULxjN6qRNeESZlK41WMmpbhUvf
         GClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480388; x=1770085188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
        b=OAGc7L2xmV4Zn88j8MN8uSev40ns0Gm6Db/lQp9Q0wSeTlbODeyogvx8Dph8b5Fnl9
         G7QYsN0tWeFE1yyKrQfPioR/bgXkApFp0WVKO5FJ3501Pk/BM8Uq1LSvxT7VsTCE3ZDK
         /tThOJ8nDO+0oNQ8IRlPCrmWgLsV0Ap/JtBFJKMAdL3ZZrIaCdZxnzme1VN7DJe+gAoH
         F14v8LHaQR3CoDLdv7dlfEtjacU+gKOQbVXGrVYZIhOpV6Ye7pxSL5yNTroO/oaIQDF8
         SVbURr5ye90kIoGiEtHTN2zFw61XPi53c+enGNHmPfv3XGESfic5n58qAqHoH33Y5Yxl
         gonA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Qo5V4NJsHxNb8JYEHf39dSAkGHIPYs6RdEWcbS1ekTgr4JjIkRr1gYYdmA2lvCfOOjiQchpqTfDIzM6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPXPP+w1vWQ14iXaEGYmQnECyoy00gtMijvBixkxTEKENhOwR
	Oh+G8aZNGBgR+aAfStyhlRhc/1/WeutJD0/xwKltVyWqdOlL+eShoav3Cl0f6nObBjsyCvCG8YV
	mnUK98fO8GcD0RCAllabVILM4xD7utgc=
X-Gm-Gg: AZuq6aLP/TxyDYG0kdfQuWY5OAkXfQ3jbI7QFIZWzxVoi2BnSu8CPwMgPLcqQjP0oNC
	uhNDnjdFJnixjy/SINK4wTsG+ELiea6k9QAbUqeaIlzswRJq35xlPwgGL/RbfV9sg5oFXGjT7Qe
	PEy1RtVnWpkSwWGYWzqMMwljCnzJczD8H4+PXXJS+6BvacrIfFqcNVMePwG1b5r4hoOY0/Yv/s6
	gJ0xFLFJRZ2mhX2GhkyNnE5n14c9ojQ1eAV6r5SQZgkaLlwXa9VWGmYVIguGpnxkjhNu2tP33Rd
	q/RT
X-Received: by 2002:a17:90b:35c4:b0:341:8ad7:5f7a with SMTP id
 98e67ed59e1d1-353fed74b59mr262004a91.18.1769480388288; Mon, 26 Jan 2026
 18:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn> <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
In-Reply-To: <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 27 Jan 2026 10:18:38 +0800
X-Gm-Features: AZwV_Qgc7eQOJipl3o8vcuglbFoKSmgdRMS1oOVCwrdajZx_HYCkl-uUukOkTHc
Message-ID: <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90630-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E1D58EF5B
X-Rspamd-Action: no action

I identified this issue through static program analysis. All other
callers of this function validate its return value, so I believe a
validation check should also be added here.

Bjorn Andersson <andersson@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 04:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 04:24:55PM +0100, Greg KH wrote:
> > On Sat, Jan 17, 2026 at 10:03:51PM +0800, Xingjing Deng wrote:
> > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > reserved memory to the configured VMIDs, but its return value was not
> > > checked.
> > >
> > > Fail the probe if the SCM call fails to avoid continuing with an
> > > unexpected/incorrect memory permission configuration.
> > >
> > > The file has passed the check of checkpatch.
> > >
> > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool acces=
s to the DSP")
> > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > ---
> > > v5:
> > > - Squash the functional change and indentation fix into a single patc=
h.
> > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statut=
e-showy-2c3f@gregkh/T/#t
> > >
> > > v4:
> > > - Format the indentation
> > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72=
itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v3:
> > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > - Standarlize changelog placement/format.
> > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2=
ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v2:
> > > - Add Fixes: and Cc: stable tags.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.40=
29635-1-xjdeng@buaa.edu.cn/T/#u
> > > ---
> > >  drivers/misc/fastrpc.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index fb3b54e05928..d9650efa443f 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_de=
vice *rpdev)
> > >             if (!err) {
> > >                     src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> > >
> > > -                   qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > > -                               data->vmperms, data->vmcount);
> > > +                   err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> > > +                                   data->vmperms, data->vmcount);
> > > +                   if (err) {
> > > +                           dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > > +                               res.start, resource_size(&res), err);
> >
> > Shouldn't the caller function report the error?
> >
>
> That is correct, all codepaths through qcom_scm_assign_mem() will either
> be -ENOMEM or print an error message, so we shouldn't print yet another
> message in the log here.
>
> (The usefulness of the error message in qcom_scm_assign_mem() could
> certainly be improved, but that's a separate matter/patch).
>
> > How as this found and tested?
> >
>
> Looking forward to Xingjing's answer here.
>
> But failing to handle errors here means that we're ignoring the failure
> to map memory to the DSP, which will fail us later. So, that part is
> correct. Exiting through err_free_data looks good as well.
>
> Regards,
> Bjorn
>
> > thanks,
> >
> > greg k-h
> >

