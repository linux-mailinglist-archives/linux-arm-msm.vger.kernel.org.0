Return-Path: <linux-arm-msm+bounces-91231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKYpGYwgfGmgKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD69B6B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37BA53003EE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B13346E72;
	Fri, 30 Jan 2026 03:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWxjmgIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67253345725
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769742472; cv=pass; b=WrpeBFJOM62iML8NrtSPYBBfeUQ5yO3OG6FmlIEnnfDhwpJ2gKxa9cCEvVU7AYo3uqP/3CGrCWibBPuCT/otqqHh9rE28Haj0bYbm5f7qu/x/bQOLTy5XPeNUz+FPqZBA479BWck9q6VDQ8lX7VV6L7O8hLcz8nrZF1+S+SaT1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769742472; c=relaxed/simple;
	bh=s/STLv4aZCVQPadjwS93+FSLU3JM9aAkolAS61wE/sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBYtd+iUGRLIbivm7yNyMs2bAzqstIHaU3vcYw9OzOrt3BItINeTyObHY2KDS2nwMvuj33VkzkRwPFx6jn+E14wH/7mYWq6MFmDJP7tRsrWkbeBG5ZGnkx97rfaC31nWwDltTUytjVluW+AJsh7L5QPYm46QslKob66QLcuvz+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWxjmgIG; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7786d7895so11889545ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 19:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769742468; cv=none;
        d=google.com; s=arc-20240605;
        b=dDQcrqVXU4QBo2XR6sjn4v63JLWV4kcKyXOoIc4OZkmeZ9bPYC6xlVD8areNtFoCAG
         h4sZQKsUEE3N0BH6zaAzhuLBCqe8aWTFMgCsaYx6ewAMENvKWbj0OVq9L97X6hRdCtfh
         ba1DMIUeoKb4c9o+vnEdwyb+6ifwMPXHLRh8Q3mpZ8maW7H59VA+8oclW277Yulb4BIs
         HIOFSfg2uyXX3tKzebre74iePe5B43r5ItO+CBPC7rcn0rCPfLNAVP/YpPHRsWwEuOWw
         O5AKi0krzbiN6svvbwF5bvweTE/IMMs9rhWM/52VNHKpu3UfsLfxjLePjdfJz6grkvOW
         AXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
        fh=A6NUCP2zaEMMQNlq0M84rShe/4mddFuzu5U3yParrt8=;
        b=TX8zkR5OHsWbftnUptMr6oQiZA3oviK25jB/2khcAFX1ZD8x+Ex7QsbK6y04g2GkNG
         9ZAUS5/znkYcFmhT3Xzl9A1ouI9WH9Yllfpclf670h3RIld5q+3Atx3JqUTWD/QGrsil
         TY2L8FZHXTdcMQHDUdOCoZTCvOg3AxcqDLAgme/e76HPVfYxYqOcvSHI54MgWjgRKAWJ
         IYlPNepujt0mXHusS36dDOOdKimM4GNo8QqP8IJ/ETtE1GCw+gEN0YQFiMPY9qPrM4Wo
         C8pTVLbse8w0h48tXnGmbzZQLfT9JN6J2CEtF5ZUjksqaiEoebqKsYUt813TS+8pMkyo
         DTAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769742468; x=1770347268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
        b=XWxjmgIGNtUBTjd3PL1TphWtJWP3h/q2V/mD2tJ3NZ9mdFMuFi2y7XVh6IfcJi8Gg/
         7WPTJ32TVE7g0AsrPw4kxFYkUsFXOkUeAmqb6UjZbla8Wb8VTcDiSoCqRe4KgotbqNOw
         n3b6mk0zsqiIlTsNJLGJuKzEm80AIK3EmYaLXzvV+PHPl+gYc0hUaUCmo1pYAl4J22wI
         scn/E6bt+D3ft+4Y0c8CLe//ExNfYBAMwOBXMwI7LjsNDePOe+x8a8J8a0GmdpTTd4lR
         rkG6zSesXmNs+R1L+hgKC3MCSMckGFfYoIfIsz7VZjKTlnoYDyQDFUyut4jl9Vkc3LF7
         Z/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769742468; x=1770347268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3mlnZZ9VIBVNPrLG6woBCVSdTzsbdrDbnf9ljSQpmA=;
        b=ORNJpe5B3qBUaLOSUoiX1N/mIFDWfVWFhUIIzKj7l60D9WHSpAqqU50iEk8Lj76LWi
         cZKhk8voJ4CQESqzA8noRkMZ59u4QQDhyJfV/pAWT7wJ1S70V2nCvGa6ohaV2df70rYA
         5O/VyqLfhw6pdXKyhPOkGWJQBeAVql5FhM4tQw9MDS0bUTP51DV63XLfPkjZ9KvaqqRM
         bDJ8zdMuLiSByW/d1JPebAG2V9B4veuNB3zUu0oO652PFusv9jrKAEtbNEDWUWPHS+yB
         rZtzcQHq5bRPtKTFQyapG/tKjYiR4dXZuMqIESd4qPKh4Tm3DcgA/1koqe1i9w4gABcT
         L1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV9OHR6zQjDrUFlZHQYqi2bzjhqfZjDymBcT9pfsW/7zPOHG9USqhGoHrFzxAL1+JXKZBVLmNuadwOVzlS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq79BQ/ndI7Nk+wTXo/HkCqxfWB95dakv1EKNeIguqroN4ocYB
	so2tjLpmGB9EUbGouPwEVIgosflhIiiBlLQMunmb9Z/P9M7nOHmeAraDlPBs/WtaRlQAq62vZzO
	FFGQHDNdqe5f9c69hfjzTcFh7kUXbCE0=
X-Gm-Gg: AZuq6aLGrn0SKfoHNJIm4csNx6LeR47Pl5InnWC2CNYZh/dTUIltl+lSI5JJIxquklk
	x2Fgb3aWvji4hXcMq/Ur9P423nlRcAi3dYlt0Zj25I9SkUKcWge2sr9QUcaSI/MVLybhZt0pPKS
	Wik16EewsQCrfSAw8keTpfr2o/ov629W3o5PefhootcLpdhs5kZ80Z/TliS9z0tGxhqSYR80uuR
	MLnwlQGM0U0kina+jnqZZGLBNuHkbybYudmzscafj/p1Mnw6CAmel2VL7/CeQsBmxFf1Q==
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id
 d9443c01a7336-2a8dc028b56mr9687905ad.0.1769742467629; Thu, 29 Jan 2026
 19:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn> <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
In-Reply-To: <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Fri, 30 Jan 2026 11:07:38 +0800
X-Gm-Features: AZwV_QiqnwM7-hO72ct3vp6624JxKkDGHIKb9BztZJXrs6IyvANn95QXzsWnLaE
Message-ID: <CAK+ZN9oaUh5PPBx5QPCya=hqDM42CQptD2-MrJvMZsypNuZ66A@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-91231-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[buaa.edu.cn:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: ACD69B6B6C
X-Rspamd-Action: no action

Yes, I found that.
I will release patch v8.

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8830=E6=97=A5=E5=91=A8=E4=BA=94 10:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not c=
hecked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration.
> >
> > This issue was found by an in-house analysis workflow that extracts AST=
-based
> > information and runs static checks, with LLM assistance for triage, and=
 was
> > confirmed by manual code review.
> > No hardware testing was performed.
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > ---
> > v7:
> > - Add the detail description of how the tool detect.
> > - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614=
886-1-xjdeng@buaa.edu.cn/
> >
> > v6:
> > - Add description of the detection tool.
> > - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.8755=
11-1-xjdeng@buaa.edu.cn/T/#u
> >
> > v5:
> > - Squash the functional change and indentation fix into a single patch.
> > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-=
showy-2c3f@gregkh/T/#t
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
> > ---
> >  drivers/misc/fastrpc.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..8bac2216cb20 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_devi=
ce *rpdev)
> >               if (!err) {
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> > -                     qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > +                     err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> >                                   data->vmperms, data->vmcount);
> > +                     if (err) {
> > +                             goto err_free_data;
> > +                     }
>
> I think, checkpatch should warn here about unnecessary braces.
>
> >               }
> >
> >       }
> > --
> > 2.25.1
> >
>
> --
> With best wishes
> Dmitry

