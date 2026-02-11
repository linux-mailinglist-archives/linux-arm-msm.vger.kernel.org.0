Return-Path: <linux-arm-msm+bounces-92616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHlrFWnXjGm+tgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:24:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B00127253
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25117301AB8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8F9329E6B;
	Wed, 11 Feb 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAViBgB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7B2352C3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770837849; cv=pass; b=t1nG8X3el9ORBp3LZwIsWgegl8PVnd15qHBtGSp1tCda6fARn8rmjyzcOoDwotBIm5O5S8vN0JpjJaZC+pd575DMAbW7CSeQyYDSkusnmpWPPfh+gl50gyvoqM2bguH5o/QzgbTKrGbr2WYT36JXCF5lBUGmyHceZNdhzDQRVbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770837849; c=relaxed/simple;
	bh=HaJDAk3mIX9LRxG8QNvxqKNRvtTw9xWVThyEOEHtLlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrL7XdmCDVcel3XZD3GpjaTNbAxpAUge9GzUEhAu0sKa33SE5z6rNtUSz19i5MySykN6JcVaH+RFjPqBHpg/QoKh6hLZmtBJGYvnzNpc+I//tgEQDaBdgWYIWL3UL0dB5PqKiwdfjy4NFDIgFF5bUNXMo2xc4Z43KwaqcE40rmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAViBgB/; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64aefa98fe6so2556524d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 11:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770837847; cv=none;
        d=google.com; s=arc-20240605;
        b=I4tOutqrXQvcapq0nU+hRM+9dbGLrGmPCY6CU0EGfE0yVT/vCXnoQ4VIQ5wIoIVfio
         X8DdOq6G8gU2fFSVqUKznqDLo2LoVNnnDgXZxo7ZsK6h01d87hLFVsFAzO9Uq9AGkIip
         a3M4wEcH1yhQK4tzvKg3iyDRtMcvx1DGZpSpesEzos2N30I4yGWZi437iEFf99eGrAuu
         Z9JmRqE/zoDva7Cxn3O0LAesueiWlVbVig6gOQbzCZ3a9S8Drlz/PwQbx0y29Vs7X8A5
         Qk47IF60kpkawV6ifqfHwIIbw1J3xbduwtIk+s1COngIMRHWlPpqjBj5+38SAaaJSeTt
         y1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJnoBv8wPxr3CnPnohq7c8MjeZhtuaqwUQXnscm8xaQ=;
        fh=Dhao37RxmWCEEEHcQBKbScTJZYXB99xNfvu248x12IE=;
        b=Ot6H5wM9+PK4zzJEbd0vBn8u327Jg2UGCD2TY11cZwqH4oksi1blpIbBOH2CRtNLjD
         bX7dwg5TIliTHboeJ/39DUl5CXOiZ8+Nmu+oxl5nhOWf3T/ssg828ZIpZ57zSRqCINCZ
         hBXSoX0CqeSx+exwB52hpTK4aDO15t5mxJHmYScFpoLOW7RoChNPyy/vbTbDhsYIAP1d
         RrhJ0xwPVtZzuN2UEC/vhFKntSMzaDChE0ejYWUcRtmFbsKKFkmgNKkVMudRffFKAhpE
         THtSxxR4udBlDHEZxzDh8e5ekYActxTkE1mTK9CY9YQeDDk9NKak5rHpyuyQZSGiYAM2
         RSOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770837847; x=1771442647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJnoBv8wPxr3CnPnohq7c8MjeZhtuaqwUQXnscm8xaQ=;
        b=IAViBgB/BpuQXupko04njcr4QRCCmbmb3OipPUPxbgwfFi1NvNYdellYyy9J1MhPGy
         6dRWmipvvRWojB7og3HJm1rU02tg7I8YrZu7fQp11KwPgU8EWF9X9R/DDkW+z/50233S
         QMWkjz+X02Ip89w6QLjJ4G63v+yrKGlgj8WGlFiG2G86giqhHpPUzn8iE3A2J8UCdjlW
         6AQFlEXPZqTGNV2585cANZrip5VTBrUZ25wK+dNDaiFid/YZPFRGqKRJo5oxgwmm0wSt
         56hQDDLdE7IFtJ6xzzYQyQWjOl9t93FvAHw4aKfoSfQcona0XN0+fCwTpFShUNDMG1e0
         Z6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770837847; x=1771442647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJnoBv8wPxr3CnPnohq7c8MjeZhtuaqwUQXnscm8xaQ=;
        b=eZL9qTjwjKvn54of2jY6gAWWGDm73KUQa51f8j2TcINgfv5bw+tyViZtZo3uEKR5Nv
         ktUNaXgZ3TMdzkV7iYAqLB8XfX8SOlpNfW8AEl3HDs3Vtocz3aYKXfxU7cG718G2TmX4
         euxERjzpLnKlB/GJQjhFF4KdcJx67UP1E8M+wel8Ridk4ISQNnn6uf7896i2u1HhHinw
         hwUQOzWiAzBIN/HxuDLz/ItrhPx5EER1LLspDrN5NC7+LQOcvCck29duMMG87Z9C7RES
         RFJ1SrthY+FuH+mUaZLNQUGqDJJVbS0rNdErFKBG/r4CHmgD1jitOnDNKmga46IVEg0F
         oxlg==
X-Forwarded-Encrypted: i=1; AJvYcCV+vJ8Nq1NguvkFcDaVhtq4SoxJdnDSuKvDrYjRexga4kdbEt814fagBWYJnuVdkt+FsUWsdDv7K05Iited@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbhPHX7zS09QfFlWW8ExSYfpkrkXiOPTs7+n+7owp02RSuwcr
	46wfRZG07+cgnNK4WeOkuRJRov0J2+O4cZFNE+PvHbXEDrkQcQ/OZI22/IB+9MUD8ABu/xpp1wT
	mNPvcOPKhFYrXuvuqPM835BQNU/6xr4s=
X-Gm-Gg: AZuq6aKBP7IUhefvCA9DoX0Pcccv/HsKepwySD2bCwL837N5TCs15VJivCaSc26GAwm
	rGAUexKtIYCX/vO0h2ni31BGAjG5q+jq15yGV8ZuzTXnbzI8R0iod+pkWma1FqIHXhjmEXKH1f9
	Vliqg2yaBTWz6HulDEIh9QWTCe8ihJ7ukEOW4rs3osA6EH5mvIgjmvNWAWguqnFRbo/AAvd5J74
	nW07jXLDew8MJpN1mzgCXKBAXpmORp1Gu6kQE0c6t02fx+SV5typ6Qfz5PY7djjW5efE3de2ZfL
	XUlcqFEgBl8fQ0KJslH/AYOj33YXTigimNnj+lDZrIS2wRyUq85WtvGD6B1cCMCQfMxj+w==
X-Received: by 2002:a05:690c:2021:b0:794:f8b6:44e2 with SMTP id
 00721157ae682-79737646ecdmr8996757b3.36.1770837847465; Wed, 11 Feb 2026
 11:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com> <7cb9a945-651c-426d-8cc7-1ec1174ac68b@kernel.org>
 <8fab20ba-9924-48a6-b417-5ebd28b77cd9@oss.qualcomm.com> <6def8756-f4c0-4b4d-a20a-205d548acf88@kernel.org>
 <4b049560-94b8-4a7a-a60e-c2e0c1e58683@oss.qualcomm.com>
In-Reply-To: <4b049560-94b8-4a7a-a60e-c2e0c1e58683@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 11 Feb 2026 14:23:56 -0500
X-Gm-Features: AZwV_Qiki52fD9FbCMBTd-xyRPxluVccdPlhJ5DuMk1Nadw8GlM6bpa_i23w2dg
Message-ID: <CABBYNZ+qeXwqFj1Trnt_c8y_w_nKD36AwKbNdZ5SEtkXERuJxg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: qualcomm: add
 bindings for QCC2072
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0B00127253
X-Rspamd-Action: no action

Hi Vivek,

On Tue, Feb 10, 2026 at 7:05=E2=80=AFAM Vivek Sahu <vivek.sahu@oss.qualcomm=
.com> wrote:
>
>
> On 2/9/2026 9:38 PM, Krzysztof Kozlowski wrote:
> > On 09/02/2026 16:43, Vivek Sahu wrote:
> >> On 2/9/2026 1:37 PM, Krzysztof Kozlowski wrote:
> >>> On 09/02/2026 09:06, Vivek Sahu wrote:
> >>>> QCC2072 is a WiFi/BT connectivity chip.
> >>>> It requires different firmware, so document it as a new compat strin=
g.
> >>>>
> >>>> Correct the sorting of other chipsets for better readability.
> >>>>
> >>>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> >>>> ---
> >>>>    .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | =
3 ++-
> >>> There is no such file.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >> The patch is updated on
> >> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git" rep=
o
> > This is not correct base. Why would you base on something old, without
> > any in-flight accepted patches?
> >
> > You are supposed to work on maintainer's tree.
> >
> > Best regards,
> > Krzysztof
> Yes, I'm now raising patch on linux-next branch. Please ignore this commi=
t.

If it goes in via bluetooth-next, which is probably the case, then
please rebase on top of it.

--=20
Luiz Augusto von Dentz

