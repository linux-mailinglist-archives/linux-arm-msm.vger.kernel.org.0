Return-Path: <linux-arm-msm+bounces-115365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iqeEMEecQ2pEdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:36:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0386E2F85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:36:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TknVawk0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF92D306E65B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1073E3F4102;
	Tue, 30 Jun 2026 10:32:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4413EFFBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:32:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815535; cv=pass; b=A5isTorK8/e5DIdAd/gmqWPWxgDxIAAOCa175rvEnTx0jGe+F6pQ6yZHTeMG1GG2vRxItMSiRIOII98F/WLaVgjA5w3iAJlSyJAD/GtPAaZ+xAr64ikalYcM764DYybaw39rmgjcQzv7xi/XT8tFj/m2oKDo7WUBx/wrMhKZv4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815535; c=relaxed/simple;
	bh=iaiHu6W6GnKaNNpb32KibdKR2UiO7AgOuNqniQ0O9Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kldyzdlQp8ktSW1m1cuaZw53+htA6JDy4r+i8/vhQwVCPsIIh/F2cxMLKKPN+qj4z6j5Iu6KcmhethdLRTW99ao4JpyoM9l5df6CyEgHr/wimqPYx5/CUxJeZH3a+FP72fb32O0HsQ95w/2VdwW7hlJDc3N2wBWcU43GZmuwKFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TknVawk0; arc=pass smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so3238315e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782815530; cv=none;
        d=google.com; s=arc-20260327;
        b=M/cGbee1JLct7wQxzrOPLMmavdBoaARO0BCvuKOZ/Q3H0PVpa/0ufdgxjYjNAEknqI
         Se4TSmfPOmYEkxZUvEqwO0kYCTmxAV20plQBLLisrCINqfpUmeuVJQgnsv5rdV4vpQsP
         Rbn40xnHQ90VokiM3GwlZefnOv1nnVoMWf9bKQp6t4kVMuv4fbt0V6TVr+QbPBgRw9fR
         MF66lVu7JLkzVadaNUJ4eBOim8w7EgYsJ+wMkunVEQvaEAp/RNAH6AaL8Twd5m4QxrBN
         01BhJsYtPJAdDZWRZuST0GTq1dQlOi7y702Rky7XR1ZHH0//tQzwojBq89ksLN1KLJqr
         FdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        fh=5E4YDJVvwJAnrU+kYf2XxG+AW4Q9X9r+Cyp2UKGXAQ0=;
        b=IJzDlfk34QddUTpGntpR4swWAP99WT2mxeNp2wbMQnwrnsthSKriOTbJbE+YAP4Z9E
         mnw2F77mo698TSCROzazLtShwiHXQdJXfU5IMz8d4N+fKvyH3aHIVNtUqBX9y6bTp+MO
         0oDq2KQv9RXUzZBuqxuS4db6Cjz+GZegAlOd2p4zRr2O8q5JgN/02v1NPz0I1I3/toVV
         9pNEkn8ATGRQ9aSrtuJDgakI6Ph7nUNl2lT/aKE8T5DwysEluDal/c7mKBvRHGoE8Jiq
         WiuY0ZVbeV3bWmch2WCta/cXHRtYggblaUuTLD+wjVID4PSH5QBOe/DcdTAuzLb9877R
         5IJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782815530; x=1783420330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        b=TknVawk03XaiNYvvi2l1zmyWGXt7iVeK0pcEc5nOV3BxfikM7v7ECJUIgcE+zwsIZX
         JG14/ezAYE1rqKtJtrNmqRGzPyqJu4iMfeAqkzT5II3VTCT/chljUONKLRRQsu/qCISa
         ZlfbLfTmEXT9ipSqywP6dwwKREjMSr+ABlficxfFKjDhdv3jH1BrRmsWGrAhRjIbM2yQ
         fcLxe+SxMJklxS7fBKsxpiKFrNIUHFFd7iJUXYmncLC0JMnKXpH96UWt22dYugZ89+Fh
         d253soQQFzQJXrz6ua/IzzvxN5/h2XLYwGkshvwbGDF4a20prYwD4qbIYjvigETh210o
         vi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815530; x=1783420330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHL+qHFUDdbeMIZQEuTaVwIEq35Hl0MbyNWHqvq/S80=;
        b=NYP/cnvziFNpx3sNDLOl9dYv/yY7T0hGvu+lwIr8xdQuqWOZKUDica7gsrcqbvRjEA
         8UBJr4h5AbHLlYBH7jIwiHthb8qAbbZQq2zPA9TmJPJmYyDhSjqI1TBOMi609K/4NMmu
         nktwfb+DpS4XXWfy1QRtYDOvxLnX0L1GiDnpE/izVJCHFhNNPRtJuuyYyvxYVdn4FvFg
         a3FQzIWvnI7OHP/dYKbgWLtgDGtXp7LG2FmXnxlCYlINF9YlYYYH/LUVg9XE5bS8g0Xb
         f6/28KstUTx62PVnQLahYc2b8j6zkgBnplmCQF2hS/mKTiWIzCOU+eMeIsFHPhudZPgj
         K+/w==
X-Forwarded-Encrypted: i=1; AFNElJ/q+S8sGL7V2W69GSvagmSaMHZutFk2jl0hD/VCHtCf7YO/EUhQsy8PqMCoapK0NSHGllyrZHvkPkHtVGCB@vger.kernel.org
X-Gm-Message-State: AOJu0YzVEDZ029mEYSPHz9Uz2L9NoTbbMcJb1bXd9KQCB3fX7onEkJuc
	YcKxSsGgVE8ZsV8hARgQlEmSZULg56UdnLGe+dg6A11Qc5jnXw52DvrYdhaLH2+Gt41yG+F4wG9
	5T6yPaKs0w5YD3sKXBuqPbMy380n6NhM=
X-Gm-Gg: AfdE7cmZJLznpfWRzWFdzglNX+IwpKRDeykYszkewOY1/iL2xO7RaU0/l1jOFvNgCEN
	T6zdHDrXYIldG7rjPo5GWksHH+NP9lhKO7rUK7f1lwE803RCGn0wJYrWObkSkKq9vp2dwZHnbQa
	UWlZHcaofxlaaVRLbiwB8bRMZmLeQOrSdFq7mfTUHu/92HOCPFfkWVJ1uafLyeRrHbKK8WCA+Tc
	WwV/8UarEsb6OMD5rpeKsJXuPVC9jQW4YcYF0wCW0BVViWs53gwrjJMQvm0uTleGgB8zAta5+/h
	KyaFbWeYP42dSN9qvzwvkz+dczec
X-Received: by 2002:a05:600c:548c:b0:493:bb45:d52c with SMTP id
 5b1f17b1804b1-493bb45d5fbmr21230515e9.25.1782815530390; Tue, 30 Jun 2026
 03:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
In-Reply-To: <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:30:40 +0800
X-Gm-Features: AVVi8Cc3I7tdMJ00Bv9I4U9Yc2lCcMBT_1z4M1b7v5nzQzRKyNXteY5_feR0ihI
Message-ID: <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-115365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E0386E2F85

On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>> DSI panel driver have been added for a while, so add the DT node to
> >>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> >>> describes the wrong, no impact after manual disabling these wrong
> >>> supplies.
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +&mdss0_dsi0 {
> >>> +     /* real vdda is unknown */
> >>> +
> >>
> >> L3B: DSI core 1.2 V (both?)
> >> L6B: DSI0/1 PLL and core 0.9 V
> >>
> >
> > Yes, that is what I saw in the DSDT, however, I can disable them
> > safely (hack the regulator driver to add a sysfs to handle these
> > regulators), the panel works well.
>
> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> ends up being on), UFSPHY and USB1_PHY
>
> L6B additionally powers the same components, minus refgen and USB
>

No, I confirmed they are totally disabled, since there is a way to check it=
 now.
https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c9=
58@oss.qualcomm.com/

Best wishes,
Pengyu

> Konrad

