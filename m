Return-Path: <linux-arm-msm+bounces-103983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Cd/CIra52kBBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:14:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148E43F555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC3B9305D6D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 20:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106973DD501;
	Tue, 21 Apr 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jTtZPxWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82583DD51F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802062; cv=pass; b=rtKnwCQz84YKS5PHx8iukq35aYnTCVzjq/Ve4WVKJTsRZmUvIh0czrrqQQ20UtGNBzrCIg1NbrFBQ0C8KNIZE317kdgf2PKR96xLTfME8rE0BXq/1ALy0r9z+5rSCfMFlnrkMIFWsHi31R/RIgfo7apavGubDi7fXY5OR4xpbQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802062; c=relaxed/simple;
	bh=823S5uz3tJJObpEPcWmvau0aO2vpfGG9Vl1N5EZDQ8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZuv1OHsYkDkbrx+yffixTNEyNDecnYteVKidNcb0Fqyd/rrZLsGRimnbjNCI3bV2PM6fjSM6rRwyfJtYD0xMM1cIbB9MGUzAflf+3yNJy1HTvNCRSTXZiTCg0P90j/ge+9NUJcGSMCvf8fY5auogMwRYpSrl52BVKBRCt4hAZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jTtZPxWf; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 477F53F7DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776802057;
	bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jTtZPxWfYjY141+IDtq+x2elUki2C/c35h6/SWT+VrUAE+C4eda9RrhXXguPYVqf9
	 +wdvN+lwVIJB0hbrNfem2zm6gtCM91XN4mwGfD1kzqXoZmJ5eFkaqLUj30bfAa6hr0
	 bDDiuG4hyibJUGJ8NoeTR379gtuz7HWiksZSq2lbCymEKDQKKzVLaokN9rRwNDq6lz
	 kdxSkmJkCD50LqS7y6kWofsRraF10nF7bSMjbYkPC98h7pIme3kx8lerrvWLoHr/Z/
	 UOsh9KRxX4+TO/n7sqN1+bzw4WOwcZtJIRUOtjZDLIoUKSgQAQi7GJV6CASR7c9hjD
	 3d0W3iEFMJjXmQXQdadS/I6kyoy4k9XUkOF2MSjdOVLgCaqOZ15n3inCuRmCLA65Mv
	 9FCrLJMR1Wq61slqqHRhhPbKi2dDyG/QWF/5G4O6SQpMsiyuC+OHiJqLHiuPHc0h51
	 7uf5khACDp2/qMcp9f0sLiO2mF8WddD7l+Py8RyUsC3OO1+5//NqJuya6tNjon2wei
	 SFjhbwTtltdo4ahVRgDVSjSoOLwtzlNBNQPqxQXss0Fj1ITch876TmGYPKyfKHX8hw
	 kuLyC9yy5Y81cdKLtgJfhHdk6sGU/l7WHvVjj7qTNdNq8G3SFzVHmhhxlzTq6At8tw
	 bXsyHjMfgA+phDktt6OHJS9c=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ba70cda6755so152278166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776802057; cv=none;
        d=google.com; s=arc-20240605;
        b=iK/hwJ5RCdh/Mzmzj3RvC5srhxOMB7JaHWuzNBlDNQq7dCS+3z4Vb+xpwmxN8+dcVs
         +igRWoYhHgFrxYC3KAJ99ZrLTm1LpD/6w9LfCLfvs0EMpnpuuaMwc8rF7h/6WbuNakJd
         L7fU1DLcN0wALH6tN8BsVRLUNKxIM1BuT3yzVz+pDP6/fDHGFcj3euducMB2I+cRR9Wz
         caHaN8vTt7KZPGoxBe5kI8JQK+mvBstI/LSVneKDD+7w05o7t3cEA7HrznmW24U3Jifd
         hn0QnrBSv890weRbu3oynqA3ub1ssHrUqksE6uaEVNeR4BL5dTF2BJBNjSLYNy1lOdOQ
         moDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
        fh=xtZljNSgBXo/iSuaSBPjaS8+OKeqNCDsEn1u+iJLMwg=;
        b=VbYWomKpt74OTUh4uc2rRQ2uZa4olk4NSiFgzmOXL4ITJulSxTnsC8ftEUesI8CiYM
         xteERsrxqchYqv6k3yuEJELwDBeNFJdwhHkFN87FVFxqmUQN/U2g9PnOyoDElfQ/Wx1G
         FEv7ycHYg3/O8i4a/vQkOF0fg1ENH+xifqZySxqWCQtiUPoUs4GlwC2VdaB9tIsIEkJ6
         hi7NHRwhweNFF+lu4ObTtiVqRqDU6FCftlJzd7B8zkqBENOUDffL7lK/yT56fZodd39V
         MRMDGJo2Q9gSl1IA10DlRuxieLtfBVidQxJJs0YX2qYcV/5ywhagYkeBTxnaRIoFZHH1
         84Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802057; x=1777406857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SgynumTsm4DxtjJgRso0TliW7nAI7gZng0e1H8jdSFI=;
        b=ZWev+Eo3UFQms1xeCNkroIzpmmzayKpJAzHR2t7pD73Pnuk2KKKuv6iyhu7iHhqgxX
         eY3Zm1sOXkLvjfuIv550PNrdClEEIJwclTYMpeOvyL5ECtuPFaoYH1S2Mp0Dq7bhiIcY
         vhw3hkLalEgqWqa/97rA1Jj3XG8EyFJa9gntQvLZEvpOEUK13EWctlJvsno10WjBtQcz
         smY0NMZkG0XW0/qGnIltWubzQ319yo9Zu3uTcjqo//gUKll/1F8+CM99ObeR9rcfllE1
         eSk9z9qX41yoY57PgkVuRN9xq5IXQxJ48awHe2O90HEIrKpekXyRSLLlEZSg98Lo+j6N
         9L7g==
X-Forwarded-Encrypted: i=1; AFNElJ+wHFZMUR8YGv2MOk1KcOxHcMhjVKA+pMKL0V/T2syq49ZHf2kygqd/+8dwwxkJ4uP4bZnV1Daw9FHqVDD0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2USl+kPRM4agzzu4F6g26tGzTeE7zV82YAJKoUQlFUE3WwIk
	rUk/1gpsWD5pOIAxEqWSAJ0sFgtjvXTb1EH3PhkuXj+vLlF9hmL6gdYxsGO9owWkOuhmFXeQYBu
	7jVqo4O91L+4PQXstzdC8+HUkYqoEWvs0nFGWh86ThL9yC+nQWB3l2vAtlyp19Ai3pNjp7jxQ2z
	Cshbv8q6RwJnNMa76iLf2Xudk2Fg83WKbxxVC58annQ3VAQHijpbDhFSBXUw==
X-Gm-Gg: AeBDievYNFFm+oqpcNLBiBdprEywtVVktExl8mkIn6DiPqhCC8e1lIE/jZ9rEAjt8tc
	2H/iF/8aQXmEXUhn1oSAl/E6cXF/Gz8CrwyLAI2Nb32yUQOVda64AHbLqtlNYjolu3fCLXRlfmK
	gn0SeTiinlRzNbWHto2Ntss6aRiRNkZJ7wqGPWH7q9Hl39eNK3tdSEkmu/xjgfGBE5alk6AUfvu
	iQfssWdr+dpwMd6CXzP/9mfqRDCHB0Zxzo3vHIC9twByCDwgA==
X-Received: by 2002:a17:907:160d:b0:ba9:2223:93a9 with SMTP id a640c23a62f3a-ba9222393e3mr365453666b.33.1776802056794;
        Tue, 21 Apr 2026 13:07:36 -0700 (PDT)
X-Received: by 2002:a17:907:160d:b0:ba9:2223:93a9 with SMTP id
 a640c23a62f3a-ba9222393e3mr365451666b.33.1776802056350; Tue, 21 Apr 2026
 13:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com> <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
In-Reply-To: <abcab457-a8e3-47e2-b5b8-f073bb741c1d@sirena.org.uk>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Tue, 21 Apr 2026 22:07:25 +0200
X-Gm-Features: AQROBzASU_KTNYayV4ZF9fPgCjdd-0NvGfl1zXPAI4_UHIVGmRoYed66n7wTKOE
Message-ID: <CAARv3RQjL1JGnUnC4oBkGKNi+C0G5_Pr0anDCrwm24Pdj-E6iQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	TAGGED_FROM(0.00)[bounces-103983-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8148E43F555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 6:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Apr 21, 2026 at 02:07:58PM +0200, Tobias Heider wrote:
> > Limit the digital gain and PA volumes to a combined -3 dB in the machin=
e
> > driver to reduce the risk of speaker damage until we have active speake=
r
> > protection in place (or higher safe levels have been established).
>
> > +             snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
> > +             snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
>
> Do these actually match?  The hamoa WSA devices look like they've got
> sound-name-prefix specified so the actual controls will have WSA and
> WSA2 prefixes but snd_soc_limit_volume() uses snd_soc_card_get_kcontrol()
> which just does a snd_ctl_find_id_mixer(), that doesn't understand
> prefixes.
>
> Probably something in that chain of operations should log an error since
> typos really aren't going to be discoverable here...

I think you might be right but I am not too experienced with alsa so I coul=
d use
some help to figure out if what I'm doing makes sense.

I ran `amixer -c0 controls` and that actually shows the prefixed names
as you said.
`amixer -c0 cget name=3D"WSA WSA_RX0 Digital Volume"` also confirms that th=
ey are
still listing max=3D124, so it looks like it indeed didn't work.

From what I understand the correct fix would be listing all four as in:
snd_soc_limit_volume(card, "WSA WSA_RX0 Digital", 81);
snd_soc_limit_volume(card, "WSA WSA_RX1 Digital", 81);
snd_soc_limit_volume(card, "WSA2 WSA_RX0 Digital", 81);
snd_soc_limit_volume(card, "WSA2 WSA_RX1 Digital", 81);

Does that sound correct?

I'll run a few tests and send a fixed version once I have verified
that works and amixer
prints the correct max limit.

