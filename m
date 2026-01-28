Return-Path: <linux-arm-msm+bounces-90888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDDpDVp1eWkSxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:32:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C79C4AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79D00300DF5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 02:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6642629C351;
	Wed, 28 Jan 2026 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j16rXNZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AAB29B766
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567384; cv=pass; b=XIBaiA565tnLxZ77FBrZi6tVCPI3XCePz4oXYT3Am8CRVrB2/WR5x5I5lONy5zUux/30YzyNRAaMqMYzAswkp3fVILax97FaXYO0b2qTrmywOVhe3auQLrMBUVpwyD35YqzVAunIqgpVODeF+T0OSiEb5PUXwcuUk8E2ua+DHf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567384; c=relaxed/simple;
	bh=V963d3b3AD9Oy2rNmVtDx9e9R5WXsPaM2sd5/Cu05Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kmb+wtQWDB0iuPujmVdw5bzef9gSJqHJzusdFpJMSv2PWQCf04IsZSft7dZWjzFaMetv1T9PKFoP8dLdGedj/A9EWCSWTS6YfIOYR203qFGNwSPthQ4rbiusWmXdYdszXTARemkEhC/FV/1Fviu73XY3HQOBNgM5sx0DV+b1MNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j16rXNZO; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso3116961a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 18:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567382; cv=none;
        d=google.com; s=arc-20240605;
        b=hDZek46qzLtn+QuBVJMlPyWBXtEcpVu7bfnyn3Mt5F1jF12krikpg1I1kNoidArCP3
         3OlmE8M6UBQWS6anIb3f9roU9SMUJzW5yeUHuLx+eDvleGMNhqDlvmww4huTxOXX5lxp
         oneahv+hUpShiy4VPXkcXQqxXadIPSKI+42baOhtAejd7DCSWKm6E8zjAcRMkJDMIPMX
         4tOMGqvlLHVeWPOxqtRwhY8Yok4yxSljGDusqNf1JsHqu1OTE5c2CKZKgA2gIU09UjST
         MRIaswBWGCkOrwaSLJGyQ6vt/BC2y2eBqr5NI1vQ6ZbTUnSWh3X2ShkbjmMchrPygNw+
         JOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
        fh=POmIhKhZuAFZ55ghmE5u2DdUGRKtRLQjrA25bSaIOfQ=;
        b=QhqZcm8RcopgT87ZB7IxZTHLX3f84+VjKsJR7YyQG3V2figbWO55RmtlLX1O0nGzvx
         yyiD2Myxvm5s1MHVtVWnnYUfIrI2jhwVYsYgAJ0BUzsTfl2fBfpZdkWiEoN66On7g1m5
         fKNDceS0nS0DDl2U5fC0KtTQApqePxzPAYvL75w+ZthM1mZ2cMvIpXu2yZBOZCraFdHx
         bKaeDWTeCwOOIA1rLPQckA+dYDwMj/qLN3WnJMgfKHsoWz1IPryZHcd9b76Nd2hW73p1
         bdRRSFwSDhbuw/xASFMgkY85Rqqj0chzUkdZx8RLZroypG3S/2hkkh/1HJ3PwJ1NzOJy
         AZ2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769567382; x=1770172182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
        b=j16rXNZOsoHTXsUDzi33cgtcnICfUq30RwtYmtlO8S6yt4oNnD7itABIyMBGTmHIb4
         GD5zoArMeeHIzV8pppRl0jNB+pEBx8bWYya3jzh4nrGV1zYg6uWMYpw+WHX5UoRMrxzP
         /7DVmshyvwZEFl0rS6vSiJb9Hr74VTqiDbuKBfZlJ7hKzNk0UY04xy/xLO8V4sAvaMDr
         J4hWf2qfHmU+BLlfMZzgbRo/wj6nS4rBqpAwcQ/JpN5x/zEMOS2YI31JrQK6egC43lLH
         lQoAdkEHsDZrF7LQLu3hgvQM++F6B2sodaqFvkkq68+tVyaK2X5S+pBnEN7eVMlMRWlZ
         +cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567382; x=1770172182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqR0EGH0s+NDWAFGm/wPUPQe81g+9pCgJbwXCpHmMJA=;
        b=TdQZqEjbReJ83Kw7wcUx9TpWFegW2RkGCHE5G3vP3/5lmeFne+qCEWTTc6xNEUGWoZ
         IACuzlhIPOztMUsuS5v5R8gJELmcav/fo8gEVoieS+ysZyUnbYerQc34FLR+dy+vx0n+
         yTJiV6H3LCkvkcfO5on3KpAiM2k8OElE84GpHoiRHas93s1J8Z0aRx43z5tC3w6Hwo4D
         b3KLSQum79eFX1EVqWWGDRhFC6v08/HSwWysZCftgVPepQQPUJG1+uTO6O0U044CH2MR
         BBfR89zmpWElDfUFpoaHW38VrBWRBfQcJd3qgnQzPgGwIpGfSsCC5v+/yrdRw1ErZVB8
         yiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzGTI18BlKhDVsGIF1oEa6NP2EQlwCMw4YttAAD80RbKFB/zLg18j5XT7qvbQslBBsc19Iljy1xb6fw76k@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWg+GLSe+n6SbrqJfRAeETty2Wa7BFOtbK389E8YMh7pDGM7r
	9zgepO6mEpPyxNDRsiCuFHXwo9IOqVxYJO3RO6ZBqM/y+0dEfN58qOIMCDcXoc2a9TYe8IZaWi7
	uAE7k0d5THfpZNfq3lds/4k/jdrpznZU=
X-Gm-Gg: AZuq6aL+70TspO4cB8V/2++Au+BYAj2wSzoANyhYBSdGFXSaRLvtm5KEYvLFEsZGnf0
	vrvPf9u2ovhcSY76iyfcYIQ7rUPhA8v07O+WwQA2ujaF8xGJB1dvMXSrG4qfQwi33bhnt4JUnI9
	w7Ya7Qc1hZjfBYm9Jf0dBbfN8quqHU/ugqbbY/cSXvUkKqM4/q/Z3ryo6jj9OMtTx29AX4s8HQ6
	37r+FVnljz4RHufMNQpotiVxUlAsFc1KWEU96Hl47VbIH3T4F+ihVi14HIzYHVgt8zpFQ==
X-Received: by 2002:a17:90b:268a:b0:349:7f0a:381b with SMTP id
 98e67ed59e1d1-353feccfdb6mr3408881a91.8.1769567381930; Tue, 27 Jan 2026
 18:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn> <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
 <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com> <2026012758-sacred-slouchy-45ca@gregkh>
In-Reply-To: <2026012758-sacred-slouchy-45ca@gregkh>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Wed, 28 Jan 2026 10:29:31 +0800
X-Gm-Features: AZwV_QhYBrCrfZR_nULpn7Nxu--kk-dx2_AX7m36P0tiMnJ_cLqdnNHjxHvj35c
Message-ID: <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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
	TAGGED_FROM(0.00)[bounces-90888-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C26C79C4AE
X-Rspamd-Action: no action

I understand the current situation. I need to record which static
analysis tool I used to identify this issue and clarify that no actual
testing was performed. However, I have a question: my static analysis
tool is not open-source, so how should I document this?

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=8C 15:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 27, 2026 at 10:18:38AM +0800, Xingjing Deng wrote:
> > I identified this issue through static program analysis. All other
> > callers of this function validate its return value, so I believe a
> > validation check should also be added here.
>
> Please don't top-post :(
>
> Anyway, you MUST properly document the tools used to find issues like
> this in your changelog text, as our rules require.  Please do so.
>
> thanks,
>
> greg k-h

