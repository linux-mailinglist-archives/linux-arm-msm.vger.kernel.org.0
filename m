Return-Path: <linux-arm-msm+bounces-90631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKJDDBoheGk/oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:21:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B218EF9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B3F7301B71E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60B29B8FE;
	Tue, 27 Jan 2026 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcBqqPL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF2C15AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480462; cv=pass; b=Yg4RVBjC3LKOBl3QgPHxHFhx21Rn+7xQVlFjbWcC8h6gjlRa7qacrSOf+pBtLr4Ak8rPfN6vDMddA1jv9gGxo1ILugoLYhK/vKygkQoa/aCfHG1kR7dqqEs9pbPzKYlg3ZC3LVGZvyOhGZGduoY5G2WtBx7z/UZUSYgeEYASDlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480462; c=relaxed/simple;
	bh=2xa7t934Gp1isrMfck2AbkuEZPWsTHy8u/nAZgIxRvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjpLE/bMt2saOopdwmA6x4EVqvOmZ9Zc32/1QDn3w7E7IetHtEW4kRzZghiS4yclUYBD27fQ760Fk7yCxz/gbdia+h+mWuUzD/4N9jL7axKtFYEz/EufeQqnF9xn08HFS6Y5wdbvFa6IlMsZK3FSqPBJone3KziBIVZG4hLw1p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcBqqPL7; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-352f60d6c2fso3354278a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769480460; cv=none;
        d=google.com; s=arc-20240605;
        b=DqGkH3GRpMvzYdbl82CE7r9Km1xuWJidHHw4hn7J3oTfKKsS0/MlDh+dj6nXihxJ8h
         nK0L9nrj4aI84wB6c6MIRrMl2C/OSNXJ1/9HqWdl2YqsCtUisc52CU3V8ry8uBL71+ei
         aGg+4d6uVoy3lo70F092yhhOkGYH3HWtAE43O5JW2cT+hImJyFqsV0RbjaQhEjbPxC3J
         5+MEovanecgYBbKuQMt446Ji5HxiGSSuH6RWLj3JrOlB0CatjDdXIJM8KJC25bpHsXhO
         ihVfY4U7YVFw8NdgiTB3NbkGRu8CnAvXo8B4LloQUgcPbRhilXIWnWCKjyss27kNzVCx
         fndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
        fh=jhnnBmyl5WddY+r9DDUBSlBSPa5UAT2a7G4Zrc1aCoM=;
        b=MUVX6Lq9NYWyIi34RITwwKnDGnAd1NK6XLUxVoJkyV6jSMbKHdOHFexV7n9v4uabwy
         VFdyfL2OWsW5cnQVY598K4mUBEmCS6hiw5YOXEA1JnHE9hyHXUvE8quFJR+n46YptYvL
         9vEcsk1MrYWhJbj6fDPV6zQ8Zfr2hyQE92M2rj7TBlsGckK2G+a+meaXCgJVSnre76i0
         4AjkQm9SIRIitjTprg5F3ex9z9RnwZKY9b9Yr2veCmE3QYG/U4JkI12maq/OdiVkciBV
         1gW7pAIGgsWWTNI7O38tMvU1v70Lm3BOcPgC9C5lDU3PaCfXIInl66zN+dMxgB2Y/Mlz
         lK0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769480460; x=1770085260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
        b=VcBqqPL7r1TR+i9l2b6geb9l56CCyX2FNE4jOK2V7Q+oyClCJNReH1pKM7dnSqR18v
         Y0ni1STW7+4RGdFwZVt0xa+byNUkZHV2DyzJfaup756SD99C1HZuFDMb93xKSyVZbvoi
         SsxLmzeu5Y3B+z+M6Zf0HHphn2yf4VWkiGqOsK38qQewSKtir653ykOJUW6OqCzX4qA9
         qFsX/LEyLSnBtwstuSFMJ3+Td01i8wYAWRMwanxq3jpHjCZntDRwu3E0grD0hzDKJ4ac
         QoyH/ZtTt+u/kw4Gq/Bd+yIRGUS/YxsZsJTpGoZidYJKlkIIIWBbGPb6gG2s1FR01DnX
         3Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480460; x=1770085260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
        b=Z35qK/Q4hGOjnDfo19XXdbTFZtEO2Uo+QCMi81rJ/BwZrTV2IosXjiq6IvqfLJ3ajW
         g6giCi5npKBYBHgSELrOFW5fhaKsreVfztwpDkDs0h9DH0vwx9ncGaTHEHBdr5dlcE/4
         W30Cl5mOKCor2vuOTNG9n6qyblWeMhWLP3f/dGfOb37yR3PtkSQjzxfuVz+kVcw1j1J0
         i2N5CEdrIV4ac75BB/OYAwQT4txW6CPvn0Xz+g2tFW4wLFSyIuLFDBu6r71Av19d2LxI
         l1gflci+n+CpPR/y37iT9NaYebBk0AzF17lw8mUaOP/oG8oyfqX1nI5NdrvMiRQSo11w
         AmtA==
X-Forwarded-Encrypted: i=1; AJvYcCVgKCluIKh+/QJyxCnB27jWV/A+AwfzxLqVPbQKC2EiXerZWs4rBJwId5gkJg+lSIdtpYCZJqL/Yr9rhRYe@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKbhaxQsyELSOCecbDWKFuZAKw4G6LmAUYK+ntBL2BJFbeQPY
	Ih1IfttpWqemnClBsVtkblv4MS6Cg2A4icXM2PKXIV5yUDhgtRQgJz5vAnM0u4YWuKjUqmVwJzI
	Tv4dfjbWoEAGTlDfykjCHW/b7+pnnD4rdjODVOWYIfPeM23I=
X-Gm-Gg: AZuq6aK4Oxdgel2qUMmoogFB2BWqzCL1QM7qb7WEs7HHV+XC2JR7jUqk3UnKgL7LfZ+
	tWsT0thMG6twq/qAERAAqegfrP+bL84aPb6TdGRs+fLFjmbqs0aMVAYQH5l/+ErE81lsnxVz9uC
	dkMi1EJfEGt2MLsJ1TO4Gji+nfhjlPcnxx9ViL1G7IzS/pHUAD9nnWF1LVa4NLudCMYg28eRIKx
	GlAVqUyryUeuKoN2a5AHT1rUgTleUuUuF1phHUuHqHMpBpYPHJOP2Sat10F1MrAjp/A8Q==
X-Received: by 2002:a17:90b:1b03:b0:340:bfcd:6afa with SMTP id
 98e67ed59e1d1-353fecba606mr340592a91.8.1769480460426; Mon, 26 Jan 2026
 18:21:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn> <2026012641-snazzy-upstate-a815@gregkh>
In-Reply-To: <2026012641-snazzy-upstate-a815@gregkh>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 27 Jan 2026 10:19:50 +0800
X-Gm-Features: AZwV_QhVJwE7Qm7Ykz-J0iorTirPRq_UXa-XtAQxlc07yf4858cwfShGkNiGTLU
Message-ID: <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of cctx->remote_heap
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90631-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A0B218EF9D
X-Rspamd-Action: no action

This issue was also identified through static program analysis and
subsequently verified via manual inspection. I believe I have
uncovered a potential risk of abnormal execution here, hence I=E2=80=99m
reporting this problem.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 23:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Jan 17, 2026 at 10:09:59PM +0800, Xingjing Deng wrote:
> > fastrpc_init_create_static_process() may free cctx->remote_heap on the
> > err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remov=
e()
> > frees cctx->remote_heap again if it is non-NULL, which can lead to a
> > double-free if the INIT_CREATE_STATIC ioctl hits the error path and the=
 rpmsg
> > device is subsequently removed/unbound.
> > Clear cctx->remote_heap after freeing it in the error path to prevent t=
he
> > later cleanup from freeing it again.
> >
> > Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> > Cc: stable@vger.kernel.org # 6.2+
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v3:
> > - Adjust the email format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitat=
e-happily-5d0c@gregkh/T/#t
> >
> > v2:
> > - Add Fixes: and Cc: stable@vger.kernel.org.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty=
-rephrase-9381@gregkh/T/#t
> >
> >  drivers/misc/fastrpc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..fb3b54e05928 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(str=
uct fastrpc_user *fl,
> >       }
> >  err_map:
> >       fastrpc_buf_free(fl->cctx->remote_heap);
> > +     fl->cctx->remote_heap =3D NULL;
> >  err_name:
> >       kfree(name);
> >  err:
> > --
> > 2.25.1
> >
> >
>
> How was this found and tested?
>
> And randomly setting a pointer to null doesn't really document what is
> happening here, what would you want to see here if you were to look at
> this code in 5 years?
>
> thanks,
>
> greg k-h

