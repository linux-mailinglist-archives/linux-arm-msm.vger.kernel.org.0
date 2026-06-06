Return-Path: <linux-arm-msm+bounces-111534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oMqUIfKAJGo+7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:20:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A864E38B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C35oyBcP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B065F302FB7E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 20:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CED3C13E5;
	Sat,  6 Jun 2026 20:19:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F63BCD14
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 20:19:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777160; cv=pass; b=AuEqlK5Ea3KVzfC8/8n3YZl+9jGsBdtDkJUn0RPbhXb4qyrHNU49/LqrEvucREmYn/sSTQjKRzVrpOkYqpNnfkVvvEKWKB6eRygQlIOnPRicjvx5PL6Cm7yVOzVTSFux9VnixRWfgTDjH4WO57jDYrdqERxI5g1MKnX2+fSAD40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777160; c=relaxed/simple;
	bh=lDy5Fx3Rby1fSWJ7lIA4/br6UrnBOMa4Q9GB4CkOFNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7m6TRS828auSjLRVtIKdvizPhINJxa1zOwDnp25wVigUSC2UXNY1TbiqQECqn7EAWjzFYFbJY4I5oDUKpyi7yA1FrAxr4EMfslz/ASjD9wuI1FKZ3lxgTmt/fDkGVFS2zqs3jpIBUlQMEB4pKhTu5u+PPsF1zJ+ddfuHuihqWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C35oyBcP; arc=pass smtp.client-ip=209.85.167.49
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so3521500e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 13:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780777157; cv=none;
        d=google.com; s=arc-20240605;
        b=TObnS/qynuGoEccpAxPiZxBJ0IDX5Emwtq9+02n6vAc89D8UFe7ZV+w/JrwxfWFJBl
         akSgahBOeYBHAG8Mdss8GJiajGyw7LNzbCJVtLo4n34O09a3pWQZsa7Ut0aL5NeMxM6P
         6YeVt6WqAsThWsaWjDNCQngItz91pWopryM05uQeK1TrCcdK0LBZ26nV+flaD9lJgvto
         PaUIU9SVL6YVBqkDeFexcjXmaINFb6zIJ7ANx4hhYasmv9IHzCT7403OakAm9m9pQ8jd
         o/LYtXL1KQC7tS0kTsjOYwWiWFUVB5IdaT0VhamhS/FvCHvpU63Eo3AvpiA0qXP8+O1e
         ZIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        fh=fpxz9mAmh8Zv4ebIBOFzSkHYGWaiBf870w4oPpbvMTc=;
        b=dwcdW1HjDiD70Vg+8WX0nNokBOo7zq5kIrKVcIADo7LDy/dAlXfSQBWUj+hb4kJa7D
         FI+4Up3AB7RZ02bXzi+d3AUQYzY8AsrRjHoM7Ed3I+Ya7gMxkqofd4r9+OstRdw6/jpj
         sYolv/suXUdkKg+TGcaV3+WgNCQ3N13PS97AwhZJ4CDXuD5TDIxyL8WdD2Z4QF07Aoph
         qWIATYgMw1E9nKjDu4a+Rf547oDYmUBP+vmqFXVI5rK95xwOC3hZXFe22mii4xQMCMGI
         H9HkOdphnwwIsWcDDhFpGDZc4pZoHfprkmxHK6VLUHesp3spNTE1R1rf1z+8BCRE851k
         O3vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780777157; x=1781381957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        b=C35oyBcPDqcxfGoJ09aStWl6C/Iqd1LfmQMTWY1SHsPPgeYDA0GEjSu5nDpKCwlzTl
         n1a43fcBCJy9oUq19KQ+fOAhzPhG9+c4kqkW7o0/DPyAVrRvwCGTElZrLUkA4Y/o2/II
         tWfrHSHpzPeYx5vVroJXndjZolGRQwknYjHYxNK2OVpI2cvCLs2WKwHOkrT0qftPJKHb
         7a04Q5L0xvDqyGdHXvEGHagDDmRnRnJfBYatYwwcjzx3hce/pMGPLzJpWHaB+sE4p7fh
         +iYy6GMEd05BO4acwVytnEQFoDhytaLYOiicVqQOiNJYZXK+tVOX2IzDbbjhB5Il8y3p
         FgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780777157; x=1781381957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGurdML8GWvZXdlmgMS8yljqvF4FwClaRGE3W1u9kBQ=;
        b=ZwAXy0GW/NRzuWyvitPLEUejQNkzlthQipzEnGBTOqHasqW5twlLt6+Zik8BdOnrEt
         8IP/qgsl0v/XxtM14wHG6btGd19ioLujCjxiYe1ID7ogPwQEC0siz4YiBDmixFvpmR/+
         HVpNePSWi3+6BEoaUXFjKcgf9GHy7MzVWzydfOnqeTOek0raghi/f9Pn8XWmC4JwV1Em
         W5FibFlT9l0WHctWoEXP7NmM5uw2iZsFBaGfIGf7Ivk47MTBhzcBBZOKMew7jE45Bxg0
         hghInCV7bCWb2nLpdECEe0rAdi3qi5jZkoruwk2dIluEf2V5dgntLABZgqqYY150uz28
         lxIg==
X-Forwarded-Encrypted: i=1; AFNElJ+5Xs6gs7NOAwwY+U0bwjn8UfU0LU18PPeeLeYdRJj4Fyq8piaJAY7A/b7Nq9BHJ0nPhtwZm17LipNpySkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8MRV1CP0OEC3m624ehmM8V7pAjnJDUCwxv4Ega77G6rER4dJ
	ZpWpVIkwJJHLydDOgC35aOrEytDwAh08FAGPZGqouT7bTkcAdC4ePIS8zDnr6/hk+1fPQbAoFI7
	diQ3eAssCWQ6VLOXpaUqAVDB0zGd/Ms0=
X-Gm-Gg: Acq92OGz3jUG2n4fDD6amCx/lzVzfLVm4qT4gR/3ezaKx+1TbPtmrdv6uRoED4zCiOv
	r+oZ/poUCVmvFKVwAr0WGa9YnLEjxSXhuY6+ww+bhwnG3udYhd26uuAV7WvGdr6t1rORmwQLhG/
	if6JkMmjIzOGOuOlTv+HJlCASybtUBmVhriVK4En5GtOnIIQHvO8RDOw4v/WL0AueESTTKtMfDg
	pnlLny5uepXusp9oBKvGXq6vq229zYl1ZYlQYcvcp/7EZler60ACBYlfn6qGw3mQ+s/tVrTb6ZD
	jmmruc0WW5ZTIp5a4eow2HmopVUT6YEgZ5KDqgOgHgDAdUsn4HTHu549Vw1rsyEtqnER0nEFtkD
	EUFw=
X-Received: by 2002:a05:6512:2c08:b0:5aa:5f5c:9546 with SMTP id
 2adb3069b0e04-5aa8865e0d7mr2001911e87.2.1780777156648; Sat, 06 Jun 2026
 13:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com> <0b3a7b64-252e-4d86-8561-c5f16808054c@kernel.org>
In-Reply-To: <0b3a7b64-252e-4d86-8561-c5f16808054c@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 6 Jun 2026 15:19:05 -0500
X-Gm-Features: AVVi8Cc_0vJoW1FDGpU8mt-gGFKN8aCl4VyZlNXYdZhDMJ4eEjw8Fs-nciAfZBc
Message-ID: <CALHNRZ_2gC_WBQiz+4gTZOypvyCtwv6j4MnN6qJ1KoBZ=0LA5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Add CQ8725S SoC ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111534-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 099A864E38B

On Sat, Jun 6, 2026 at 2:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/06/2026 23:49, Aaron Kling via B4 Relay wrote:
> > Add the ID for the CQ8725S which is a variant of SM8750.
> >
> > ---
> > Teguh Sobirin (2):
> >       dt-bindings: arm: qcom,ids: Add SoC ID for CQ8725S
> >       soc: qcom: socinfo: Add CQ8725S SoC ID
>
> Where is DTS using this? Or anything? We do not add SoC IDs alone, it's
> pointless for a DT platform.

The cq8725s device I am working on is the AYN Odin 3. The kernel dt is
not ready for submission at this time. I am trying to get all the
prerequisites submitted early though, to make the later submissions
smoother. And other id's in exactly the same situation as this one,
such as sm7750 [0], were recently reviewed by you and merged. What
makes this any different?

In response to the palaka comments, I will change all of those
references to sm8750 in a new revision.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260412-sm7550-id-v1-0-958a673ff=
791@pm.me/

