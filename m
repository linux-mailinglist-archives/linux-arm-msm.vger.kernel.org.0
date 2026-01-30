Return-Path: <linux-arm-msm+bounces-91249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E7cN+tvfGk/MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:46:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E3B89C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EE4300B473
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 08:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25631987B;
	Fri, 30 Jan 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFA6DgYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1262D77F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769762756; cv=pass; b=ClsWi5gN85oFD4OyO07KaOVAYif+wx4o66jJylLw872io1j4WBFzyfmLKA8WYbqN21uAZDi0/t6LqYUvcbxmunE8Uzb6EQdHPuUkj5pIhGJPJlOqO93ZQUX8I8HkvAEGQypfn01o4FMj+uXNwMfx+nuAAkMO+cXrTxkZgPfwPe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769762756; c=relaxed/simple;
	bh=mDnGzrchXvJn/pw7nT0cssXOZtkYxKOWE4V2rTMp6oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rmgft/dlVAE+N/6qzgwLCK7LDtTJlsPXW3f4xFLm5HHNJm2n9QmLGKa4nNrlMLrWLtBe9QioRM++qKde1TeC8coDd4e6C2MymIcz/gCxk4Ta+cnOEQ5uikt1BjFByASvE0pTIJduJgGq9aPUH3qIU1ICTXnf8FdA7FhB3toPbCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFA6DgYZ; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1054719a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769762754; cv=none;
        d=google.com; s=arc-20240605;
        b=UmIWps6Hdjf3fP6MVPpHBvljuD/tAlMkUWvOnGuyp+kFfwBVsYs7iYgMRjyUC+fFdW
         uWd9rT1aWV68zFB0N2AAQ9s7Xf4Pq+xqjmK8Zz5uVYMbfTKw6zbdiXi3pLXB5psTOV11
         ela/wq125yGgikDqD+C7L87W0lBHRILT3YXuxcJ4FDFUx8s+3Jl+F+MySo3Be9EcXjXI
         xFxrSrKjCdi9fyjHnLQzxxEnvOOnzGwC1+MOl+VDmTlgDKa60aFEx3u1aDF1v6/LJ/u/
         kW+BqQq04uNvh6yVOdOZKER6Iyamov8Pq3AE/WRSTSnkeU3TbX+qqZ2UP+5Gb0ozUjKI
         EHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
        fh=bkpqLE6LvjJKxzAcbyPhY3RSe4dr9BwRHADqiUzQ88Y=;
        b=kHWlxwrWulxSBmVFLRidH64i1n1Q2fqrXVyiuAxdA8rkEcwIk0br++8mvAMCfGaciU
         irSfIC6gdrXZ1TNYtEmj49m0NGWtY0jRPypTx4qKIlzQYuIkgKzM2CNIZKJ7FvtNYBlW
         1CIgNn3lwPlWcum5qtob7K9RT+kNfbb4G6vNxryyBy2sr5AF5U5XKL1RYWJbjFHR2eWt
         wSTNOfxLSyaSI7P/h+HGAaUwsa7jvHlkU8f3oLM2sD9gz4OMPFvwvUbgKDtF0r2KYGO3
         p1crf4ZfVnzow/x9uAPXm0UV4F+Ubdvzm6uDNv59WI4X5YzaEqir2o3H+OX+3lsHVsJx
         Gw9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769762754; x=1770367554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
        b=KFA6DgYZh8IMsKDxVagpfW5cDu9Fi5fkDgpVPmUkJcsFF4FfsYB+aJ19iySDE1GtU9
         t74o2G2kpHd18Z/Pn4qRAvP3RtLXu+Rkum/sOp7cTyZzyyWWcgjd9XEG1qR5fG6ElhaI
         pXDL+Kidof+UQ++2vmHAhbtOja1sCJOmVS/xwOJtl2TBW9sojUfKvs3N0IBf18w1SvKo
         J5iHQNdtF9qT569Bc5pE4AKRdI8BzbxPgeZlin2169ULJirMEbRGVujhVwmYRCnws++B
         PjiyYqFpUWoX+o8osH8ujgace+01gyTy4oh//HZNm15jLSeoFplwYSrBzZmhKRc2oqyV
         CLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762754; x=1770367554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEAW01z9JQWBTM10b2sP0NfwiccdN1/5P+EOzAVhSFs=;
        b=p64b9XYxWOEgk9GKYYyMVNpg42FAm3Lqo2wJKshA7upG4jp/N9j5E3J+Ey5OEkWoNe
         xcm12QQRyPcvVKT5TWxNMObsge5ByIdwtkV26ZxT+4m1p2HKUxIbhs9uct5XEEuf9A2a
         rhpDXAwodbDX7CslayxTW7u8u1SueXQZP7hvlXkQ6FEJ+FUO3kWNaDChZ3h4+Hveg+hW
         VQzOHgkGqpQw5C9WtK/gEoENnjPHmUpz1pZPNuz0ZYRalyF8nmhehkmEAHQRX4clMqCb
         C8Q3oJJe3mtjsrU7SAarvo3B4QNdAKFIxf2OVq9Tq0+yOjbvv6Cc2phGkIGDmqqTsfTe
         XgaA==
X-Forwarded-Encrypted: i=1; AJvYcCW1XdikqFXmq0jjZBXdrSPPS7PKh5xFmmiw96PxChNvsa3Bhc9ANHLH9QmARcURdz4tA3Fo7fA2bEYlNCjz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24aV3Vwohj0V3TIa/ldcUERP4fFf4pgNYetkfoVvUZX7donYm
	Y5re6wgVvpGJEnAOlBTcvvZDVnfCT4SR08/oNC1Db350d2jIK132S8+QsOODsLFodoy3oUHb8P/
	pzn+nJjugskWH1cjAjkas55IYXz2t9zc=
X-Gm-Gg: AZuq6aIQ4Ct4mYtoEwjaAK9aSC5Y94PqxAJm+RuE/rBGyfCfOWbSUDyQPaQaz24MprY
	UjzHsm2KZhsf0html7FUHSb4OQh6lvQolxdDFxASm/BY1dHG+HWKkho5iDML0f4TXcyI/fQCUt/
	WQ53kcwb5HcrgkeV3K61JMMb+FCCjcxzi/z3+OtFP2AoNJLhwxBWtZ6xoG+0KFFrEEf9itOjT7z
	jkbRI8wjUK6tT7BPfTv/SkNvagF3ZityR9NMvc1b7TFBUYcQoLhlehMvzif+j4mQ97ZXF2D6Y+Z
	yuW5Rck9YOta3ofQ3uBEPorPj6cr
X-Received: by 2002:a05:6a21:a42:b0:334:a11e:6bed with SMTP id
 adf61e73a8af0-392e0053615mr2227722637.29.1769762753855; Fri, 30 Jan 2026
 00:45:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn> <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
 <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com> <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
In-Reply-To: <4rfalipp5xyejwappzi5gny4muetuzrr2q3sunctfmsvb4juwf@64kdxjrakr5q>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Fri, 30 Jan 2026 16:45:43 +0800
X-Gm-Features: AZwV_QiaVUxZYp2r3LsMEsEBTrYjWrRMw1lgAjNb8iVpASaAPEQ6nzSN-ssydZk
Message-ID: <CAK+ZN9pDpvf+29quNptrMKoti_E5m36XHZJP125ctZmBk2w3sw@mail.gmail.com>
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91249-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 431E3B89C6
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 12:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 30, 2026 at 11:07:38AM +0800, Xingjing Deng wrote:
> > Yes, I found that.
> > I will release patch v8.
>
> You have been notified once already. Please stop top-posting (aka
> responding at the top of the message).
>

Sorry about that, I just replied the email directly.

> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 10:38=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > > reserved memory to the configured VMIDs, but its return value was n=
ot checked.
> > > >
> > > > Fail the probe if the SCM call fails to avoid continuing with an
> > > > unexpected/incorrect memory permission configuration.
> > > >
> > > > This issue was found by an in-house analysis workflow that extracts=
 AST-based
> > > > information and runs static checks, with LLM assistance for triage,=
 and was
> > > > confirmed by manual code review.
> > > > No hardware testing was performed.
> > > >
> > > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool acc=
ess to the DSP")
> > > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > > ---
> > > > v7:
> > > > - Add the detail description of how the tool detect.
> > > > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.=
2614886-1-xjdeng@buaa.edu.cn/
> > > >
> > > > v6:
> > > > - Add description of the detection tool.
> > > > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.=
875511-1-xjdeng@buaa.edu.cn/T/#u
> > > >
> > > > v5:
> > > > - Squash the functional change and indentation fix into a single pa=
tch.
> > > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-stat=
ute-showy-2c3f@gregkh/T/#t
> > > >
> > > > v4:
> > > > - Format the indentation
> > > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.=
72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > > >
> > > > v3:
> > > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > > - Standarlize changelog placement/format.
> > > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.=
e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > > >
> > > > v2:
> > > > - Add Fixes: and Cc: stable tags.
> > > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.=
4029635-1-xjdeng@buaa.edu.cn/T/#u
> > > > ---
> > > >  drivers/misc/fastrpc.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > index ee652ef01534..8bac2216cb20 100644
> > > > --- a/drivers/misc/fastrpc.c
> > > > +++ b/drivers/misc/fastrpc.c
> > > > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_=
device *rpdev)
> > > >               if (!err) {
> > > >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> > > >
> > > > -                     qcom_scm_assign_mem(res.start, resource_size(=
&res), &src_perms,
> > > > +                     err =3D qcom_scm_assign_mem(res.start, resour=
ce_size(&res), &src_perms,
> > > >                                   data->vmperms, data->vmcount);
> > > > +                     if (err) {
> > > > +                             goto err_free_data;
> > > > +                     }
> > >
> > > I think, checkpatch should warn here about unnecessary braces.
> > >
> > > >               }
> > > >
> > > >       }
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

