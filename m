Return-Path: <linux-arm-msm+bounces-97098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID0dDQsFsmnCHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8726B8AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01DA13063A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FB9279917;
	Thu, 12 Mar 2026 00:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ3aR1Nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D826ED35
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274375; cv=pass; b=n0LJv/otqbc+klfvaJTfxmxP5jqZ5ANL3+2YATyCHvjAyqrIp1aYuQBGTe8oO2BYLtg0QMYMycSi9AeCRSDPAYQ0ZhrRl28RWfAcMohsRuWwSIFgAsK8QTGG2AVWih8Uj54RPgo+I45+ocGAhSCNpWUd5fE7rwJHTBdYX7FT+NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274375; c=relaxed/simple;
	bh=Z45OterBDP2JSXE73eWoxcqRXimE3kZG3qq1BZ+cUOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIlJeJjZY0pT4yCMQi60UMJtVVbYb90REfSSrSi22onlVLIpXRvqnBdTXijP100/VeVA3y6/Pa2VkqQVwNIdo0YW8JcStxUxSSFc61ONJQKb5BQkJB/qhhvgfP0pjx9AR9+EMF7ZFCV5asAxx+LG2NQXDj9e159DNiR6JD9PlYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ3aR1Nc; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f9568e074so56335666b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 17:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773274373; cv=none;
        d=google.com; s=arc-20240605;
        b=iUv2gMy32b/4/CQnVHnsaIOYhuN2f5k8jE24U++0QfKe/i4zCaXt5tojeEnUOkTV79
         T5GLbkuj+gkvAGtClucj/Hc2A9K2vV6K6bsGEhvzqcwASwgj/ZUe5SJVhgO+6jKjBgYX
         Aof+SHiErSvOCLudsDcDJc9cdJJlY0pmE25ySJAkNhTMG8zoH9v05MDuiuSl8sEBGDYx
         t6GWJPJpkT21brvedm2boxFPGcIl0QU7Mdi+b2xzHAbmMq5+q9uT6mt2PfQzLW/jgrCn
         DuAAEsQHFSid984fuzYdzIIwSbhqMHqIUKGD7efj+biemm7T5s+fDVjM9LdTogWjKvYD
         xBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        fh=92soTNHu/v6eq3u6Ec3hiqwNuZD71W827DBLZrcdilA=;
        b=CgsNKrOFwsstyVP2geznMeRuxzPzyJ5eF+zA4FD3y7w5DTrhQPPxuHv68VrFiW5aH1
         PkQ+vPICKW9ztU/TbSrl5r9bwxbzrgBg2hcjuEDRT4UMIVVZOVPok/CTW+dg2rTBoXMS
         mUOTYJZxHoCCNmNHwUhLS7Hk+syVzPRpA7cxVhKNh0HS2zktb40E9fgVqtfjiROmZmRl
         bKWNxVNlWmyKtgRldfX8hg+2c2sgf3ez3y3o1qig/TaiGVLXAgb709zuqGJvlC2Wvntk
         hCwqccr+X2NCDQegfSttXOUdbzi+kJtZLVEwqT3kgQ0QArbvgwWrVYJ5BXNFHeRnW+Dy
         /dSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773274373; x=1773879173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        b=AZ3aR1NcSvKowoC7vCMUbwYhYwkOHWk9/JlEANA7iUPNiqriKekHO9Wb2A24QF0isy
         myoWAKNlnbhiWsUQD6+PQkESuKz/hM0rEc8IkaQFoFCA4NeHb5yOJ2OYPmiHAS9foxwe
         rG9kS26g2UgwBw/yn28FDC2Tw61b+OoAB1vzGD/Th5Om/HTdoQvgkcNnaqZQ+wyT0Tr2
         9VWLEks3NlaKuTqXzDo6vll1NB61aMN8bVnFSg6K7kX4xw8ePQdE0I6mQ3DqFNa09EW6
         1vntmo+zyEAE/+dMs3WobCRTOEOjuUjs8glqY4MpsrUBMkgqYU3x7RkXHIAYarBhQ5gP
         hS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274373; x=1773879173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        b=aQxvW211Shq6+vyPZ8qNA9DTn2XhgTsktLkZhfwp4Murv4agxc31Y32zMGOIWAYypB
         5PnzEaOZYwAofzhljSDbDioS77CDHry7oGQLsKRUEnFajtQYJfw1ukpf1tHvX2MRJGCL
         Bxw98xAKgIpel6KYecyDPYjgUgffkQ+jawO374pa91MwV28Hs/WFtRVHo9ApqEBRUF/C
         xCw/sprAPb3zLsPWHoQ1F+3ceO0tPsWC4TJ0O8cj0VgtDn3YGCSNIqw1ssUOCBOBBi9a
         nx3uZfnIbCtTCSyjuIXNS8L0OvD9np1BYk6HOZCNgWDBa7gcKEK6y/cgSL0LDF5pf8TK
         kIeg==
X-Forwarded-Encrypted: i=1; AJvYcCUoPGfbMuVUEa1YNR5Rmr4rM4ZPGYwGMqcWLDJt0Rs2sRi4fQuiHtALeo8ufetbpQSGaaKm3Gam8Uq/k1+I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+807laD6hZLpY4DPLRPj7+u5fkX0hfLnVd983cg9v36UDFdlZ
	FX+iT7S8AzqG4WYxJV9jnzxIMpp9b5P85ZAJ1t/uwRE9ofqI7r7PM3DT14qSx+8phnBy8CyP2qH
	oLoY/1AC4YQfrB1GYK0IrMpXc0CURt8I=
X-Gm-Gg: ATEYQzySjhggjzkqOtQWw+53/XSWmIlxkcUfk0SpwMrGIUeDtoa5NRt+fcNuWsCVPAK
	NgFCo2oFIDPZN7GW9lBSUf7qFJivglm8JegtAh45cvfWpYvLXFoGkR2BEtTsHo0DlMxtz3YyE+4
	ea4clQFHc//tqaZJv8cx5sCPuEIbS/+e9Q4Cbe0NrTjbkn+0+V+S1RO0UjCNFQEMCuUYThsN0tZ
	o4pwNonil7zVmG0MtkvUHVI2rmOXFrkOnaZa+lGnBEfR5JDXknufMWCaoqOa2yoYDDEu5Mpnpcy
	G1iJ1aN8GutAFND9SJU+0H0KG+pU4FqmD4CzD+DNO+conpNrNzRyxqnQLU70rmCa1pzO4HvfVjL
	gIIOo2qc+QG/XU7HV
X-Received: by 2002:a17:907:9307:b0:b90:e278:a09a with SMTP id
 a640c23a62f3a-b972e58e86bmr270124266b.55.1773274372542; Wed, 11 Mar 2026
 17:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232347.18257-1-rosenp@gmail.com> <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
In-Reply-To: <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 17:12:41 -0700
X-Gm-Features: AaiRm50BtfKrrZAVcIzzrO96lQ6VMb4xLc1b96uWGTVyrN4JfHuvhY5_y_RqJhY
Message-ID: <CAKxU2N8_ZsHR9Uzpw=XbnsFiBoY=ai7AZ2_LbEw72ouCVwKb7w@mail.gmail.com>
Subject: Re: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88C8726B8AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 11/03/2026 23:23, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Move counting assignment immediately after allocation as required by
> > __counted_by.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Hi Rosen.
>
> Thanks for your patch.
>
> I have the same feedback as Greg gave you previously on this.
>
> Each line-item in your log should really be its own patch i.e. v3 should
> be three patches
>
> [PATCH v3 1/3] Change kzalloc + kcalloc to just kzalloc with a flexible
> array member.
This is probably the only one worth anything. I'm getting requests
elsewhere to add __counted_by though.
>
> [PATCH v3 2/3] Add __counted_by for extra runtime analysis when requested=
.
>
> [PATCH v3 3/3] Move counting assignment immediately after allocation as
> required by __counted_by.
2 and 3 as you laid out should be the same. 2 without 3 breaks runtime anal=
ysis.
>
> Or something pretty close to that.
>
> There are several reasons for that
>
> 1. Bisectability
>     The ability to more easily bisect patches.
>
> 2. Logical separation
>     If a change deserves its own line-item in a patch
>     then that change almost certainly deserves its own patch.
>
> 3. Mixing stuff up in a big patch is confusing
calling

 20 insertions(+), 25 deletions(-)

big is wild.
>     I look at a commit log and see lots of things going on in one go.
>     I as a reviewer or say someone tracking -stable and deciding which
>     patches to pull into my tree can't look at a patch a "just know" what
>     it is doing.
>
> So v3 should please
>
> - Have a cover letter
> - Contain three patches one for each logical change
Maybe some other time.
>
> Oh and reason 4 is the most important !
>
> Patch count bragging rights !
That's just pointless churn.
>
> ---
> bod

