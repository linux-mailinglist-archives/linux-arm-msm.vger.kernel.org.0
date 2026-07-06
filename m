Return-Path: <linux-arm-msm+bounces-117027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id azWlFjMOTGoXfgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAF71560C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MB8JW6s9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E94203010634
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 20:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8DE3E00AE;
	Mon,  6 Jul 2026 20:21:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22923DE439
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 20:20:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369260; cv=pass; b=YpMrO+K/wAirOPvO50WFVeuRtyQvt5L4olYxPDd6Pg3slewS7EJMFMzJuVKl4EX/T8ihb7nUF2CDxH+b0Lq3RNoa3kgUVpDBO7wlfSiAAcT37d2RfC31X1Z5BeI6eZj6vQDi9OPQaayxrvOtJ6LjqJTb5hLW8FnwORAhGg4x5r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369260; c=relaxed/simple;
	bh=eS5TkT7qd2I3BCx0MUnneGkbGVAZPGy5EUGW/yI4tzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCiKSqoHgTPHiHG5r5FCVy31rFVwbrZMy+BC9J0tIoU0eYBw8OinRFGBeWA7K7dSpAeUQIC2codboEaPlvF/bpSp5DApSPGI5WLTBtpSQl+ZQ3OOuI9eUaUvj29+Am3IM6CAwaX8l6nifo6pTOhpgNxOUJ3dlS9PaCO+ZB052Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MB8JW6s9; arc=pass smtp.client-ip=74.125.224.47
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664c4a04081so2929602d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783369257; cv=none;
        d=google.com; s=arc-20260327;
        b=AfUFbn8uQksDeHCAGSNtkl/BL2WxLYiAG3l3JF+MHCbvp6MJm2/kzKZIGhwUQYL+oN
         7EpkBWDTiuohmkmRkU89pTdQRth7uwuKaF36PczzhZhzs3iYws80Dt+8XauoeyS+fTOF
         mXTfPC0GU0lZk/88xURp0Q2LqvV61GmAAH6iHtOKpIJrEC95IQ6lnI70sds8G2Iv1dph
         Rp3pd+44jxKmIRYP8ck3jjy36rICJKJFB0YG4trXgHbYFZReMgwQjEMN/t2Y4B42sAcq
         28vvgj2YLMaiotOGT300Vb47Mslfd67RYocNz7rR3sSSJHvWl8rF18bNPB7+BcVKQwd4
         5jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        fh=rDTr9WcnzL6U8Z6ZxekTwqHEz8jT90Rlq6DpecqRr2Y=;
        b=k7HLUnRRZRL6bmoreMUadfhD8Pi2OFlIfpmNVQaG9j5EEeYHoVrcUP2SXllRImsMUv
         xpzXrCKSirB5fxob9z1I6S62tmneFy9txpThULhxh0wt03QKq4dHQMjUCir2EYySIglS
         r26BzIjXKC0hjgA0SXHW7aKxebfLKkVVBsIm0IYgkF3sJiQB53JfdrXJmgN1WY/8fuPm
         25UuITtFJLt9BGIeAOoROvshRCqBud6yb5SnWZywUWL4drRKLtceAuPdrpH1sHaVidsD
         riUETz0oxbo1hcEmknlBInYLUFgpWjUgBOMgBPwCLzuxb60XD7m5KVNkVqi7E0uEaDAG
         VFzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783369257; x=1783974057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        b=MB8JW6s9Vw91lgS8qh0RvF1i2nBMPDJL8VfsROO8llRuRlF0GUSPcsfo2qBmm8F5oS
         OxUrVgEzgzE8npYry8i+qPRM75QrPsL4dc2S/P7kl2TYipfQGemA3m9RPHdpQg4JDte+
         ADqNx+MD92QCJ7t5/Nci0EvHNn1sB8L07GC6k+JcO+BXGSmHycLVau3qQP8H2wpQ2SnB
         ZGMqtM98afpX7EUJ93LjY0fudNInztuGeIi9RWX6HyMgdayRMbwlnBAi4EuPGcx/7rB3
         Pg3Cc0+nNRit2iClxtM1f6GQZjo73BrRsk9L1nIu0ZOXOdDyX49LD8RkMjm/2HwOQqnz
         2oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369257; x=1783974057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        b=VuUnwbR0cNG8Tb4WQ9yrAk36/CZL7vnfTyEU/hyWnNEhfD4n5tb2yaymrA73XDIENZ
         oEP9pIRjcFn+Nnx1u2/NlMdJ4smZfjMpOVzvi5eCsO08Ijo1v6WE7DCoPdEESfFwn/Nw
         8Kg897TdLaQlz4dGi2BQJzIie/X2yjVQ1NvMkmZls98ajPVGu/ilLN9kUeIiqngUun0U
         CkCyfXirTduGoXM/3YNHLoKYZe68D7pF6THtC0tD1L8YG41/3+TsWq3SDijsUAqzHf0I
         HyS/kaStyQRj3/RRkALCMz3r+OiMk2jyhsO0a1ELBI/66FWONRQyYvC658yPytK/wpvp
         e3yg==
X-Forwarded-Encrypted: i=1; AHgh+RoBReV74LPle+IwHEKUjlk101b8xxO7HrlyIaj34PGP1xJh02WIbCtwhENA+PMZTk+mOl8qV3jI2G8TSiBE@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaGQYgv8c1nSpGXiEGfMLMMWO26Z0CeZG0vi4qVq5hbAU6v4N
	qnkTnA/z0u4etRi96LgpvkviHvHuqprfv8BXWMtRfrjubtJY0+g6JKfJ7j+lONtg0DAfomJer3l
	E/7jDKWi84QPA/HLM26uJlzDDFsK6y1I=
X-Gm-Gg: AfdE7clof4JgjhnAYzN8QNZTscg7SB1jV3DMcD3hPvj/wknYBW3K/U76L7v47G/AB4a
	IJRupgpmFMKTKt+1/tBkHCMLU2j58v98tUWdE5+xGLLVo2b2+YLFqjHvDtgZRcykyIT0V7VZo1B
	IB8haCN8locDw66cfYc/uvV9IjeNbM7tCX93jPx30OALTfCwGc5Sle+zY779ayiRW5K+8hs4V2N
	Z64gIHlAR37bkfoXRZF3ZFihUN5ZXL+IT7hK0LgU1u1eu8Wj3e1h1yXB34Mz9rAWR1K5MD+k1zq
	JwDnfbKA4Oaa+dfxa0rKNhI8LR3fEd29cIs7mdHfGTWkULv5Ey4uKoLIwO8=
X-Received: by 2002:a05:690e:4806:b0:667:84e0:d9e0 with SMTP id
 956f58d0204a3-66784e0db45mr432516d50.16.1783369256776; Mon, 06 Jul 2026
 13:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
 <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com> <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
In-Reply-To: <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jul 2026 16:20:45 -0400
X-Gm-Features: AVVi8CcybGfiD02-Luzbn1df7ykWAKEIqVJMVtGzaJ6UGd0Ku3B0xQXNIrsUQbk
Message-ID: <CABBYNZLLDMU1agbQJfL4T4GOTinkRyM76NDqiVHk_4+9KFohQA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117027-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,outlook.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AAAF71560C

Hi George,

On Mon, Jul 6, 2026 at 4:04=E2=80=AFPM George Moussalem
<george.moussalem@outlook.com> wrote:
>
> Hi Luis,
>
> On 7/6/26 22:36, Luiz Augusto von Dentz wrote:
> > Hi George,
> >
> > On Mon, Jul 6, 2026 at 1:27=E2=80=AFPM George Moussalem via B4 Relay
> > <devnull+george.moussalem.outlook.com@kernel.org> wrote:
> >>
> >> From: George Moussalem <george.moussalem@outlook.com>
> >>
> >> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
> >>
> >> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> >> ---
> >>  MAINTAINERS | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 0b9d7c8276ac..60f7251d1a16 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -22289,6 +22289,13 @@ S:     Maintained
> >>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regu=
lator.yaml
> >>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
> >>
> >> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
> >> +M:     George Moussalem <george.moussalem@outlook.com>
> >
> > Do you work for Qualcomm or have access to their specs?
>
> No, I don't work for Qualcomm and don't have access to their specs either=
.
>
> I'm purely contributing in the capacity of a volunteer.

I appreciate the initiative, but we still need ACKs from Qualcomm for
code directly related to their hardware design. This is especially
true nowadays, as people seem confident enough to send code changes
done by an AI agent for hardware they don't have so they are never
tested.

> >
> >> +L:     linux-bluetooth@vger.kernel.org
> >> +S:     Maintained
> >> +F:     Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-b=
t.yaml
> >> +F:     drivers/bluetooth/btqcomipc.c
> >> +
> >>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> >>  M:     Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>  M:     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>
> >> --
> >> 2.53.0
> >>
> >>
> >
> >
> Best regards,
> George
>


--=20
Luiz Augusto von Dentz

