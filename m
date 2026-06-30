Return-Path: <linux-arm-msm+bounces-115348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ecoHIOPQ2rGbwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:42:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 157346E256B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:42:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PfEQ3nwF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C8083033036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012BF37F8C6;
	Tue, 30 Jun 2026 09:30:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2D36728F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:30:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811826; cv=pass; b=UcNjY3M0xx+DmB6U0eJ2vRkNVOhAYugnaXAJBg8K08Gv8lKNqP4xsR19qUc3At5prEpwu4KNKTc33ZRZX/hRz5vt4vOTRJzIXStGZnQnekG4LHNXpcyb4jFNy+tv+oy0VrpdTm4zA7O+w9djBzGhfPvtjhHPk/iIH0e5aMPLL+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811826; c=relaxed/simple;
	bh=deamdc7e4XH52p7AGWF+ABVuNfU7iVgUE1OisqnuQV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsOu7OIMagbmtHKmy9vAawx+S8w8YOY5dIX2c8wZnpu8lJw6t6ItdrnvPGg3pMAwbmHHEEwKqvIldvXaY3KVC09dGZ29gEIMF3BWAsFpH7uaCR7dD5JM+zKu163IuflxU5pl2tIlbth5S6C1tvV2AT5ytmy7xj4qmoOor5TYacI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfEQ3nwF; arc=pass smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b68b4643so8005445e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782811824; cv=none;
        d=google.com; s=arc-20260327;
        b=Bpk/kHbCUhPy4elVWh/BpZnTrpQbjIrtEilyUkOLoRgycs6KnaC6ihYlw5uPzE73N9
         2/d/c+3rqGNjLKQro7Wn67IrmfmTmI6P8j/8bp9zVENVZ3dvQL6F4pAo1lf9N8wTba5G
         OviD4n9y7j6azIHnoUEImZ79kfkVwtEo+XF3Rn0Ho90kJudgg8kxeSxVBc/CwwigJE5e
         7sEcTG4kSrmNsx+cT+sbaId6Mj2L5cuFEVqkPtC2lm6VEfMe+RoKXFFwtlquGjHkb7y8
         DYL6btwHAEb3i8lEi/QTrXZr403FBld9coJ4TT6oBfdoYb4cUzl+CFlZTI1XzWkYsvQ2
         PKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CPlKKbRiy9vlf7EFixIkTpfQ8EHfHiHbdE+44m76mF0=;
        fh=0wJiDm04flVsOGlLZDTgb3rVelUbQM4Ne3/auMoD+Sw=;
        b=pmO7zYLuBpmTMvgSDWfrUr+YHgK4tO0GV/FrBwffTlpgHYfIdV5ip3jpDscUCxwFof
         nEmTT+xDbZ6y3rl8avRP3bH5Bp0aHAcZZrdA44dfLg7noRqEJR7r1LgMIRYCdnQ7eh26
         epQkQarU1CTEU8tbN69aLc+mzwOSuCgprO77+nO41UNBSxcaFLSlVxKr9L2fTLDcgLuH
         5GIxa3TBsA8Awh8YZAyExviDNmqExCaUwcvAmkS91sriH4Pg4m+MW4t6gehY59m4OZ3+
         2b6JzxJHykzFK8nLRscnie7Px6wFryNI74mkx6l92miPcjfgIGIRCn2uDJVJknQXqAFK
         SVaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782811824; x=1783416624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CPlKKbRiy9vlf7EFixIkTpfQ8EHfHiHbdE+44m76mF0=;
        b=PfEQ3nwFLe/cKjBGrFZsgT3Db3wUGpZ7w0D1aXrYyp5xgLMIr8BDDGtg/DUHCt3Gf1
         GLoXOpCoYgq74wkV715cYVA7lc0H0ntke9OP+Cjlhm7oQPLpfDykZhjfwmRfDqnWmFki
         EsXJDkvmypBvmlb02wFszwbRM0ajZCTbgugdJOE/Db1YAMSl48CS72aJQXhfyjW+Gesu
         EuiexcIVDbz8xPztWebE6tzdDeHJcAFENt2DSUHLuT39lluodt4EcUfRnZLOmdq3XMno
         L1YF6Nbu4USxUl1ZqtpYyGGN114PC82Kr1uVtCyrtuyt22bzlro0eWaSdJNtQ50/P3gI
         g2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811824; x=1783416624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPlKKbRiy9vlf7EFixIkTpfQ8EHfHiHbdE+44m76mF0=;
        b=RovkxBM+mj36y8tdivpxp4BpTlCA8n8EaSKAPNDHrQ6TFm1zornDVY9VtYrjaix7jI
         2d3Vr/oMReykcR7C+0aVRm+hKIwaXUtwqt7yhox96BcSUb0sIYHHgZ0lLYdqEKkRn/ub
         lb+DuxsYw0E3+ZmZbAxuKMlxvLCIJiOdDtMjT/isvppjoE16ZUZx206C/brHGs6feLyx
         ao3Wfv5CB6/uCCYBaQ8qCIfb8Bmj+sOaoKixtnXj8tZeFoA4XEPN2anEObfgbQHKIrle
         DkR2vA9mPJXtVYuIH1fUV/0cXgN9Fdaq9tx0S2Xq/LlnaOn0y3ZPZ75C1Jjue7LkaH7J
         /GBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pL89GboUHFk6FogzWgA8pc7JecDoF5vNq02hniEM2eqLDFgcIHxs0hio6uYfqaMsENpqMiwa2Od1TBDC4@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNjip+RQb8QL3GrI4itlrlXXoQqcEO77e7l7932meWlYscgdL
	sC4D+c0H3Ibi9zU2IBwPmjBM3mHJzGrXmzeayNKU8B1DR5B/w84b08ILSVjRHTgYz5WVrgYLMUK
	BqC39VFJb4xlbOuE8rbv1m9q835txN4D7vELbH7g=
X-Gm-Gg: AfdE7clqNhDYmCBoqkJP97GXBXrFmibu1G19kTo4s9Qh4yo0Ph4WonjHzq8cpxd9TLZ
	c6dawVOfT1ak5wL1Lkc0ttdtO5L+16fx//EyYMnrYFjAZ0C3lkJYjFfAVpivrIOFaUaea3taRDz
	qRCzNogTu0kY4derqIOH9Gu00ri7UbbpiX8AGDw/R6Pt3/uQsOxC4la5jB0WMf/i1RaJgP15xB3
	VxYvGqzde9Lm3lSCBhwHAqYY7aCNCb5ZQ7N38sL6fAvW7AujxWNIxfsJotAEIC/1rqg3+ZRCj01
	7ugjzqG5jbBw19DAejJ+8AbT1D5/
X-Received: by 2002:a05:600c:4594:b0:493:92c9:1e6d with SMTP id
 5b1f17b1804b1-493b82c306bmr46490285e9.33.1782811823717; Tue, 30 Jun 2026
 02:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com> <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
In-Reply-To: <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 17:28:53 +0800
X-Gm-Features: AVVi8Cf3qOWvzX8MNyg95s0g9VJ8p_Q9_tzCOemIotJY0CphIFp4XDgn5p20_Mg
Message-ID: <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-115348-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 157346E256B

On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> > DSI panel driver have been added for a while, so add the DT node to
> > enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> > describes the wrong, no impact after manual disabling these wrong
> > supplies.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
>
> [...]
>
> > +&mdss0_dsi0 {
> > +     /* real vdda is unknown */
> > +
>
> L3B: DSI core 1.2 V (both?)
> L6B: DSI0/1 PLL and core 0.9 V
>

Yes, that is what I saw in the DSDT, however, I can disable them
safely (hack the regulator driver to add a sysfs to handle these
regulators), the panel works well.

Best wishes,
Pengyu

> Konrad

