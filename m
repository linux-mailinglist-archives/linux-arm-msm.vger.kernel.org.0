Return-Path: <linux-arm-msm+bounces-90889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGKeBbp1eWkSxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:34:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AA9C4E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D5073008C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 02:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF1429B8DB;
	Wed, 28 Jan 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPm+lA/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BB2857C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567672; cv=pass; b=R1uS9YklJjeQQu4DrFul8jPVbPqxcQRjj4WKO+eRAu0sB++YjqtU9Sh25dSDDGQV27ES9BGm+4rBpXseq3bGgq85fsRPXeUKZ8r4H2wUv+GcBbyC2ZesRU5PRZX8FtnioRrrfkjTgB0OVgm/qNbvvWlRjwZWv6UycYddN2/TQUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567672; c=relaxed/simple;
	bh=OQ9ERZw0aFH9skiRk7zXjPJIUOYGGWWyYRziXcY7ZWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcKOoqTFxiMWXXGo2qD6gc163ue+so7lH9pj2KJ2xYSOFs1NYFVsIN0q4ZIU0wRsk994WYVqAMxGa1Z4wYUHTyp6viW+XgfiXRxQ49UBgscd21nhXlNe7q40nHbNXoQjfiqUTjPD2T6qBjdeAuudLycE9LZP1ID+/vvIz2Nfmmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPm+lA/3; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352c414bbbeso290189a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 18:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567670; cv=none;
        d=google.com; s=arc-20240605;
        b=gc3QCr1U0bh77jkID3VRI4vc9f+ujRA1OkC12irgrA3dU/rQvLjCQYMA3uP8c1IPBo
         hmQhwMS5RF1NE3opuqpHrWEkXx7xfekZ+e5mTghurJKwzD5wq9G2CPZHLAwSJhwg+YJ+
         GOt9WagVZx1xp2iU4IR9Mx5s2S2McsJdtUi3QCEQdEAxh7+hl2psgj+eU0ao9437P67C
         p7tM4XcDPxar3+nvch5BEremREhfZrzMyfk5l55TpUN7UcDjVVsbixnhKqHdpsaAmouR
         K/Lv3JMMrskwlJNjEMjrnXJnH5yZma/MKPw6Gp2rI83L7jwHjAOaMXJwGeCO964AlkMm
         FS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
        fh=p1/J3VxDvTkOpRz864ZghdOAs64nPG1au7Jsa/lLkjw=;
        b=XMQub3NsYJw83rbq2z2F5Km9KDSiZ/ndEvKBBq87IeYZRF7RNcwj4UyqpqzZFdk/t/
         Kj8vqvAvQXGxWS9vvqDCR23Oq4q6sWcynTjXHYn9/4eyBa3i2s+r31h+rWuXJ1hrB6V9
         K+pjZiqWf8NHZhDUaO4KWwZqHQVbuKd1vxMP6SU8phkWQqyZ5J03tQpavhUYVuH3XJsc
         dpiRCG4oeX+HQPhjScNkRtfPQtTk+6fPDt0nDXCXkW5w39ITaQaIGBaZJX5XnvMiUHxu
         NufcRqUMcma6o+vcacx4hOrGEOIRg+lWLYIlOYNvVSlgQuP/9wdhNHGbdALeiNtomanJ
         LoaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769567670; x=1770172470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
        b=bPm+lA/3eG9CMpL3S42KL6cR/RUX9wL1DLh5f9amJ5DxvZLYBUrbVip1cGiR4U6V+l
         7/DZlDVQmKrVg7YpozqnCF2lzqmuSvniGPTuMF2SnLvC2uc0yvkXpPHIeOl7f6X43aNS
         szO/P07A7PxS063eTbdchlsOIO+J/Sa0jBdYgwbnBlYVt7jXeGsQSvNL4ebRR5i+YPAi
         j4y+cBqfO5/bxkOdFnTx0SlkG5OrJR9+rgQSuGalgscMtoh2RseausgRamHsaebZ3led
         l6pEIRIErNh0gw0YKuUPEtPa+fqDDKMgnBZQyED7xarUcJ06+tVuxR3NVN8Y6Pvf4IZQ
         9fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567670; x=1770172470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGLoE/NeejzA6sB9YstMck4e/gYW8IxT2c4DWJ+XiVc=;
        b=gBhi5fyZ2mb+A7tfupcmDuaZkam09wdYrtebSSPe2rzxrWJd1l4WBXJEFRT/RD+NMh
         kmtWcZ/vxf1rCWD1Zyu7vdzD5WOpn4neWJEA8rD8ETB1JA1iLHtvWX+LseTvnG4jfnOS
         6ipG1oVaVal0DTjqvSYXWtBJMWHeCCFb8GpcP7v6HaMRlRoCeI8lX3BtNsLlLr1LHuep
         CpW81/qh3SPmKIWhzEhIzPQbLzlS0njeL3VJ01LIPYDWC9vH1YYGziNSh3SjNg2+gXTh
         nKQ6HU6yKkE5vWmeSzmj+YlNApwXLwAqFE8x5Cc2DrTdTEc7rR1f2+jDw/VIpUC+dAZt
         c1HA==
X-Forwarded-Encrypted: i=1; AJvYcCXrcjIgkZa/AtCAkP8MLNcvcQm90SFGQyhKC5thWn5sPPAwTsZlFuzvTHSNEhjJBPZvcxVFJkEfbI7G5Uyo@vger.kernel.org
X-Gm-Message-State: AOJu0YzxxqgxOTY1oQA4PRosnJIyXPugllkx8vcMo074d4fKucW5hOg6
	TPqrGtK2mq04kmVFKSCxmh8Xnofd1QJ3VJO+ZsVhFXo/CWX5AcOhas4R+bUfPT/CDQW3Ht90Weq
	rb3G63UI3+uCKQvyC0/KqUQfFweuRfMw=
X-Gm-Gg: AZuq6aKd2p0nhfFtiRzJxq64gAmmU9Rs1PRVVXajTQ/QMQeR2Pmq+cqdzwAJKA87R7+
	CMbBE3FHrmddj5SNUpheHQJ0vucxa7NkhXjs2y2HKKgPfc6rTZMpTQvcJgBqgMN0Pv+y11sfvaw
	wBTjBD2/PnqdaN14079fnIkbxENK7/Tynb3G8SJExW8gfF45TXd0u1Cm6clI4oJxCcUnapOAP7c
	53QLUlykBISejkO+Grm5OPaWWfEiuD+Wwk6JWCZ6D5yS0thhTNZhpHJcTX6Wo9yKQ/grA==
X-Received: by 2002:a17:90b:3a46:b0:34c:ab9b:76c4 with SMTP id
 98e67ed59e1d1-353ff78df17mr3373892a91.0.1769567669973; Tue, 27 Jan 2026
 18:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn> <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
 <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
 <2026012758-sacred-slouchy-45ca@gregkh> <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
In-Reply-To: <CAK+ZN9pBSY1bCbMQMoOj0qNQKvEwO_j=zxLnDcA_4O9AyL+uHA@mail.gmail.com>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Wed, 28 Jan 2026 10:34:20 +0800
X-Gm-Features: AZwV_QgKuKRcpsXe8dfYdrfpgo1e1IaTnMhWFeHo_x-lnpYaAwu_rh3UTSxMlEE
Message-ID: <CAK+ZN9qAbX0+VeA-6DMJcSY6wehSvOdM9NGu53wRYoM0j5i8sQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90889-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: AB2AA9C4E2
X-Rspamd-Action: no action

I got it, I'll note that this is a private static analysis tool, and
I'll release the next version of the patch

Xingjing Deng <micro6947@gmail.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=B8=89 10:29=E5=86=99=E9=81=93=EF=BC=9A
>
> I understand the current situation. I need to record which static
> analysis tool I used to identify this issue and clarify that no actual
> testing was performed. However, I have a question: my static analysis
> tool is not open-source, so how should I document this?
>
> Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 15:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 27, 2026 at 10:18:38AM +0800, Xingjing Deng wrote:
> > > I identified this issue through static program analysis. All other
> > > callers of this function validate its return value, so I believe a
> > > validation check should also be added here.
> >
> > Please don't top-post :(
> >
> > Anyway, you MUST properly document the tools used to find issues like
> > this in your changelog text, as our rules require.  Please do so.
> >
> > thanks,
> >
> > greg k-h

