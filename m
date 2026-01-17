Return-Path: <linux-arm-msm+bounces-89509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E8D38EE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 15:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBBDD3010CF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 14:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503E317993;
	Sat, 17 Jan 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyQgWrob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01E1D435F
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768658699; cv=pass; b=WNy66aqj91ncw+h0kOwM+E1niV6KEsbl2awHbgLGrOJ79MK4Kl/OiXl6dCez9LmZXDQfSTDqFqlbWCRiRgSC7SaiCxRyDVHLM0ngMh+Tld3+VHhnKm9WRBtbEVG1S88A0z6UTcRboVtXpLRG3F61gOEbrWolrt3YWFHw3WOAQeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768658699; c=relaxed/simple;
	bh=dPffX/Hjf2xeOHFSD5TL9rrzGqe9UEiDS2SnXh0+ZRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sc3X3eZw4Z0BLQ361NOP0y/Cw8i7yXcELgmb6O33HcccQhuzPHqmnSCfad/a3tqHhabz63EC/DRdFeXCfX+T0RyDE2V7HrZbfeRnyj9m2T/rc43I1Zr7s+93vmWd5Guo7shC9gmlb9mhhnSi1coJfoxRN6gPpdrrVYat/6O0wFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyQgWrob; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc0d7255434so1156207a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768658697; cv=none;
        d=google.com; s=arc-20240605;
        b=h7v6FHj3shI8sKMdpAM74gnQj6RZnQL2XSMsBJQal5tmWzxgs5QnJzdjToZirIc/41
         Dj4W8pfb/A83AVYbawduI1/hYEC38UM1u2LhrTqmVsDnQM1QTv7jeiZnmTCm9YzWjFv3
         aSXtBSRNl3Zf5jWzAdmrSB71XqomUXyeuh6mnIWS0Z0bWxBCJ+m7iPajS2677NJTSmnt
         XTySKrGhssHrl0yiLJcNMdkUlnMTX93dSG/CfqheLnjotej7XB8inisQakaFuvLG/EiF
         qXxQ887xBK5PnCzmPZjgbERdf78iwjz4t00tTQN+oNZEC5JAzQ/ZzvujMthM1CDjnikJ
         d8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
        fh=DrF577UO+KYwtVyphSDOQhpNAK0YNwNBiLz24J8WQHA=;
        b=ORxHn+knK8kVs1Grsq/JJRk4yZVSoS536Czy78XUNpmeCT9ABNQ+ulni3AgBOQgppQ
         VFkGX3JJc614ar9kuwYMt0A7hBfivYG9u1jFO+05ameVSJJMCq43o2jKT4ixHzVzpIa4
         mGqUaUmrcqSbxhpBJM33pRl7bg8LDFqI1h6RtuNT5RK2xY6buiQ3FxmfSw46pdwFeR5/
         AfDAPYGTATCzdxrUy5t6Y6ySupabaaD8pSfZeXZT0jmzT4R0hKmVCG/lA92eO0RQkUix
         g6szTScZivRmYSRAKS7rNLJOhsEQ8c18CmUht6HhS/ghyR01Kv4DvDbP93l+0KvScfv+
         Ukeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768658697; x=1769263497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
        b=XyQgWrobcnA61W4gJFKiV4kObZe3/XFglnmuCmoXiyKwhgFuKb6B5Ri0lQWqwjP67g
         FZPnWdIv5rYOo14x8VJT3jrMBt7uuwcuZeG/2Gvz20mk/nwvZ6qr8vZfjrpnu67RDWA3
         5gF8+s1zuLmCQbNooafrqiwaV28tN3gePOOD+GEZU68pDoHGETgo9PMidJ68MxCV/Sed
         oasE55xXNxSr8aLieje9sU3v6lBYyGuZxt/Px5m/GNHGkZWOk6+f7cSqW9T0CxkfvPBa
         sO41cA1TD3D6Xp7UcisprYSdHfKeMpEZcreb9c/Q2rIfv+W2IGXVX66MVoWSvwaGq1ru
         6BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768658697; x=1769263497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0zJYKIcOw63QlxDIuh/u4oMuj+/FORjvTxLIWOQ0zw=;
        b=hIphHsZ2fCV1csqrkwebrCVR/CAXK6+CywTNmcFmHrjwJc1G2guKRwE4aEayX0i1t6
         v40mrd1re+UJxdXpBsEK0zleONwUfujJSZNv+3AnXaTnctrQTRN1/3Xqn90xPuIzhr9t
         4UQhfWLC4U1BFU+fFISesZD5ZIw0xoB8kNlqG3R16uUSxqtX8zXXvvlJKOc2upBx2mDf
         qiUun9UTSjYgQVoudwD/NwukZU5wxHVk6mxjIkATJjtDkUjRZIKYT9JBVufvkpjpr39i
         VoYaew4vvHqDF3FBwj/Fwj5xbl0b6AGl9nN3Ivc+IAn5tpDk+G09HNX2ZRzW5wwAQ6q4
         cWeA==
X-Forwarded-Encrypted: i=1; AJvYcCU4eY/kRFeKFMJHF2map8bIV0twjI34z4ZjP+pAgXPIFrmjTQw5vhlHZZjZYxs2zZKFRZghW4Z6f+oCF892@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpIUzMArHTPoqxIqcg8gzqvwcqY6UC6Ry/P/hxiAmxIFPTgmn
	FE/klknfuN+IdTZZYoepSJG7ctJkGPd7IlYP3OP4Vg8weMH5xXCSTropAqi/MZL7xOfC61mmGc7
	EVnqW4U186/wgV4eIuZbTe5xeBL9JKKY=
X-Gm-Gg: AY/fxX6AQRIVSIBWAS9+AF0xfDFgcy9zOmL5i0eRAhWuoNy/3+xtotJ2s+yDaL5dS6F
	a94TmKI3Rr14jZeyI8jGBwNS/HA/uMZtQnvcwVKek5Tw54x+iupGlke+CAk2ga81cNLwGm1VcaT
	WANHmXSzydKvWO7u8Y6H0VL0mgGfyOtLGQ4161r0HqFT8EUN5scCkZLv3MSMv0TyY7N7aU1zoqj
	rY1RRViE0u4ktItm65usdIMJjXdG9HM2Xg+9WhrD8gZfKCwgOmerHc4zhgY+10bLSYC7Q==
X-Received: by 2002:a17:90b:2e8b:b0:34a:a1dd:1f2a with SMTP id
 98e67ed59e1d1-35272f6cea7mr5369420a91.20.1768658697170; Sat, 17 Jan 2026
 06:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113143445.889031-1-xjdeng@buaa.edu.cn> <2026011637-statute-showy-2c3f@gregkh>
In-Reply-To: <2026011637-statute-showy-2c3f@gregkh>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Sat, 17 Jan 2026 22:04:46 +0800
X-Gm-Features: AZwV_QhMdhXRqpAUPwcrRQXzIqnB78fS_tjtJ65FVa00ZjjEvdH2FAt11GktpJQ
Message-ID: <CAK+ZN9qE7C5E-17hKsoFiBUm8fd7JOLc3oJi=75=8DzBhjWBDA@mail.gmail.com>
Subject: Re: [PATCH v4] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I have released v5.
Thanks for your help.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=BA=94 22:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 13, 2026 at 10:34:45PM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not
> > checked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v4:
> > - Format the indentation
> > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72it=
rloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke=
47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> >
> > v2:
> > - Add Fixes: and Cc: stable tags.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029=
635-1-xjdeng@buaa.edu.cn/T/#u
> >
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > ---
> >  drivers/misc/fastrpc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index cbb12db110b3..9c41b51d80ee 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2339,10 +2339,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_dev=
ice *rpdev)
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> >                       err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> > -                                 data->vmperms, data->vmcount);
> > +                                                             data->vmp=
erms, data->vmcount);
>
> I'm all for coding style cleanups, but don't mix that into a patch that
> does something else.  Also, please indent this properly, checkpatch
> should complain about this.
>
>
> >                       if (err) {
> >                               dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > -                                     res.start, resource_size(&res), e=
rr);
> > +                                             res.start, resource_size(=
&res), err);
>
> Same here, that's not right.
>
> And I don't see the real change here, are you sure you generated this
> properly?  This just looks like coding style cleanups, which do not
> match the changelog text.
>
> thanks,
>
> greg k-h

