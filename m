Return-Path: <linux-arm-msm+bounces-92607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGUlCgacjGmPrgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:11:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39423125743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D3E83002D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2196928B3E7;
	Wed, 11 Feb 2026 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEZuJJJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A88A24397A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822654; cv=pass; b=dS5f2/WAjORSsUEmiXEj/tm43TbRY4WDEYUwvbjNtQHwnmSot3UwehsSGh3cHzonm1KqjZbuPm3Hl+yhDYBstSjkJHqiJcSbY4W9YvpNcG8nAVla0EX/yPsrAyqf37j1zC3nKbHgoNT5zCGYnUSiMIlrQQ+XvY4lHuTrirFFYc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822654; c=relaxed/simple;
	bh=v/NwpDEXW8URIUkY/z1L+Djst6hDNgQKVjJgFla+dKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbZa/xBzFhNI7Qhpowy7NsAcEBeMPQPLD6uIfK7Rvq8wpqbQs2W9vKgmH6cU7eJuUeTTchEjuiZ+9KKPzQHYl8kMw+l0wQS5fIVoNIS+wZdbVBNL/AZxpeu9R1pLYpG1dZ9BdSxzBfNaO0qHVaM/PwxEO14JRJUVj0fBrMDmuGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEZuJJJg; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e62834439so421012e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 07:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770822651; cv=none;
        d=google.com; s=arc-20240605;
        b=QHL1WliTP4IzBjLXjJ+oEY8TrMZJnXojeEuORDuhdFA59NRw88L5JLO35ir6vQEATM
         0fJlSyZnsy/2HAZEeiYkFL22aRItL+wr/t2do/JC7K0iZNXVO4pVMhhpkKuVfFxYfz/b
         48g6mK9HpYnfx1F7f0JYBWnKsrv5zBfgdSM7uwdmm+YE2dK8AbX5q4yL5M6f6AqUX245
         jyoUK/mZ+ShsTEfdNJ2/8kI7geG3cP6MCPlIiZecdf5juUIqf2cTBWMMGof5ipc6Whui
         uHD4aWYICqy+fFcJ5wExa2PKeb2u1fGnTMebfw7XKuU02UuMzo+GFL1RgGaYj755es49
         SIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vw7dFvllbuuNMOgLuFdxxq2dkkTEMXjhDuYA+EZxDJE=;
        fh=80Rxf04eTLEboS07mdte3x0osqsJWh+Uw0eV+tts/qE=;
        b=W6Y4WFPk344KZfjvDvBBHHejkiMbOrMKD7yZUZAsOdIQ9SUTavRmr3SggLrvU95KcV
         KcB05krFIuduIkhofSgIByefUxGNmRPp+w7Vi0pbXeNKhDvlkrz1B38pTEsOngAG4eAQ
         ac6dy8QiwChu0Js3G5lWxqu4Xq92Pf0JEXEj/PdJw6XoM+So1IQi12JiaEtaQRh+Noei
         u383mSnqFKuua1E8fPA8iL5UWfHu/Agp5ossJ0d/+/6Z6uYjbwgrhZ8TU4ipuHQ8ab6S
         VldX5KH/OOWONwlETxJ8LprGtcwAQB5SskXsG8+sa/UgNFIN8L9AfOOjhbjaArFeq4dU
         mOzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770822651; x=1771427451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw7dFvllbuuNMOgLuFdxxq2dkkTEMXjhDuYA+EZxDJE=;
        b=MEZuJJJgOxSb1Tlsom2FafI60uNFlMxKCM5uXhFiFGP8U+fzbeB3JUaME+558e34L3
         pyKt6IKs5ucem3FrvvVSs2Hz5yTn2dgCntHXyEyhFlCNIjPllTWoNco8gY+fh4IE+dyy
         xA2dp2tDZiwTrTj5FbBVLHvHlXLPW0BldnojyfSFIOBN27sDPk3u8ZvFhE+3Dsjhi5lv
         FdyldCES6uxz5fL1A7h8pljpU0P/4JQg0z5Ee49Vbibpis5pPCaHpYEL5KhK7jKnGTUy
         EpNSHOIgDo0NDf3NB6NJiFoOP/3UJ4dU9LiiVNNjVi8WbEk/LnWkyLol5/xYiJk/ERyQ
         88Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822651; x=1771427451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw7dFvllbuuNMOgLuFdxxq2dkkTEMXjhDuYA+EZxDJE=;
        b=TadvRDIvfFMCTQgJWQbQ8QSgLRgjVjii351FeyLVD8XIkz86GY5rAQbGHHcQgMIBU8
         ECU2IETMuiOe4z3amBxjl8sL2UF4/rPWaF6C+rLiA4Rxn8+sP7AWLtWxEHzdM546qtNg
         kkeGjIAhur5N21vA97fus1tVGbK9f07KWghFJCMRypttUmaBhidlp9iq/jDZMqu2C0MK
         dPoa1w6L6OPAw3QFGeFHxvqnLcJKOnPVi02OtwG6XDzhY7wWpbYGpdpq+W8TDyaXN8e5
         dAMGAqYvx+Uo57KxME6VsYp4JbNrzT32WRebrOhG7h+MEYzZtY6em6ho2yJR3CB/C1nl
         W8XA==
X-Forwarded-Encrypted: i=1; AJvYcCVBGPo70l/sRmqJ243Tg106H6hrzUVQDe//g51zGFI/InASNWxifRcZNn5sTpEemN3Ohbz+kkPqFqyOUV0S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51bvbD1R2esZUO2QsIenNOQQYTrR7DU33AgiQmQJGAHNrWSt8
	kZynxz+GaD4tYvcIgMmDdNCr+5+elhj01yN9yLJGyAZ8pwuBqRAfR7Gl2ThXr8JqNerWGV9S0A2
	Y29YsCgOxpp8oJqeIyKlj/laI6FnWoME=
X-Gm-Gg: AZuq6aJ2d3pl7SD9CjptPby+B7zVmSl06wGmi/qFKEWJGwQyZauIkuzpPreWYRNA/uY
	IUJfMI4Kq2YfM6dqbmB/6MBSJ1YpDal14fnI2bBH0En2ATymkEERtUeBxhV36DwiFdb6TmU53OK
	N1s9ANm7XgTxLrtB1VFKIMljj5DiJ+AFjPBAVphu1mntBAu/O36cbryJzx4hoChzBBFbHyQRENF
	LOQjA6dfhfBMTjDGzjyG2/bz6VlOu+rTywHgy7JoacOPh9T5HNwuLtaH5cVjbJXKDrlpYR20dDH
	KF0zRVpH+YCezycddix7C0ZBzu2eUecTSkgzu5t/CsZmwrZwDKOY0+CYTTANUkv/jICCIA==
X-Received: by 2002:a05:6512:32d4:b0:59e:3c74:82e8 with SMTP id
 2adb3069b0e04-59e5e06da05mr942628e87.31.1770822650516; Wed, 11 Feb 2026
 07:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
 <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org> <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
 <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
In-Reply-To: <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Feb 2026 09:10:39 -0600
X-Gm-Features: AZwV_QgyFC3eowlmQ2KswyEQEpd8ePKe-ZXnUB3wzPTUgo-q4RyYCGflCKouI5A
Message-ID: <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92607-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39423125743
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 1:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/02/2026 16:10, Aaron Kling wrote:
> > On Sun, Feb 8, 2026 at 3:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 08/02/2026 02:16, Aaron Kling via B4 Relay wrote:
> >>> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> >>>
> >>> ABL requires certain things in the base dtb to apply a dtbo. Namely:
> >>>
> >>> * A label named qcom_tzlog must exist, but doesn't have to contain an=
y
> >>>   specific properties
> >>> * The timer node must have a label named arch_timer
> >>>
> >>> This aligns the sm8550 soc dtsi with those requirements. Without thes=
e
> >>> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> >>> the bootloader menu.
> >>>
> >>
> >> Incomplete DCO chain.
> >>
> >>> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>> With a current mainline sm8550 base dtb, ABL will fail to apply any d=
tbo
> >>> and fail back to the bootloader menu. There are two changes needed:
> >>
> >> Since when? We were testing SM8550 (me on QRD) all the time and there
> >> was no problem.
> >>
> >> You need to provide details which hardware needs it, if this is about =
to
> >> expected, but honestly, we don't add such nodes/labels for downstream
> >> bootloader. Qualcomm should fix the bootloder instead.
> >
> > This discussion has been ongoing in a couple places. It is needed on
> > all semi-recent recent qcom socs. See this chain [0] on my sm8550
>
>
> Explanation must be in this commit, not in other places.
>
> > questions thread and the previous revision of this series [1]. This
> > has been a known issue for a while, see this comment [2] on the gunyah
> > watchdog series, which is what the series was based on.
>
> But that [2] still speaks about overlay. You are suppose to boot
> standard kernel with typical setup - concatenated DTB.
>
> If you want some other ways, like choosing overlays by ABL or whatever
> else, you need to fix ABL.
>
> You want to use some custom boot way of ABL, but it's broken... yet it
> is no reason to add these properties. What if I want to boot DTJUNK
> files via my custom ABJUNK - can I add such things to upstream? No.
>
> You cannot add properties to support custom boot of ABL if that boot is
> broken.

My use case here is an open source Android rom. I would like to think
that android would be a supported use case. Not necessarily a driving
force for decisions, but at least supported. And I'm using the
standard boot image v4 setup with dtb on vendor_boot and dtbo's on the
dedicated partition. This isn't some weird and wacko setup, it's what
the vast majority of devices this soc is used in are designed for.

Also, the vast majority of devices can't replace the bootloader. This
isn't an option, the devices are fused. The qrd and hdk are not
available to consumers. There are a handful of qcs8550 devices like
what I'm using that are unfused and thus are able to replace abl, but
I would prefer not not add that extra step for users to install my
project. Plus, I am trying to not just make changes that only affect
my devices, when they could be generic and benefit all devices using
the soc.

Aaron

