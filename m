Return-Path: <linux-arm-msm+bounces-97613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N37NgtWtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:23:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACA288B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D4BD31FF072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736953B777E;
	Fri, 13 Mar 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuBsEYIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AB3C9EE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773426116; cv=pass; b=VRwX6Ip9tOBOvOhn1KJKnvV60u8CRUHV4O8hdnUuQ7Pg9PoaDVlsmQQWJ/kwknxMiFYCjuYYrK3ij0unAxjV2nwZGOSjEX2eRGYOgsY3h1VH0aoyB2zqfbQWbjiYDdG3EQOMFHZ0Xhi8UrXiJRZDtr2l7Z83WWOIAko73yiE9zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773426116; c=relaxed/simple;
	bh=t3VIXYxJvScX8DcFkQw5mRjFHdDDtX7Yu3o+V3syG+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGMdsp0wae5exR9glbXabm9mkaKhXZff0siZYY+eX4TznCagXDoMKg8cMzAEiUWDvMSkOzCUlhyn9aBdVZomge9zXxnuTG/RXep8c6Mwnj5lmHe15AgjXPf0sZ6P4QCk7rAKy67nnpPYbJLJzkX5ok2Vx0YL7fvgqItn7ofopU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuBsEYIh; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a3225d59fso18493631fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773426112; cv=none;
        d=google.com; s=arc-20240605;
        b=S/Wy3xtnMzDBg3kCeGXCd3iuFRZO407GlegHUy3ObzFtIciUKjlzhUzrxc4dkHNQx0
         IeNVIy54iZAnsu8weeMHweFvdvwoR1X2QI/l2gCFl6asJzO/b1DU+Hn+srlNibhGplRf
         aOOhb9IioOUqoTMu1108vT+kV/sRBhcT5NnEHvkEoZuB/dp9TSk+iR/Y9JWQWEZvSPQZ
         CpDgGI4BWgVGpGs1lCRM3h92NiNiNwSwY2T2nhvXNWi1AhjQ3Qq8ZzvhzS7c9XimCu7t
         7/ZPIHMJWqNkYpZ3j9pPRQ3fZgu8UzfT+bTBZDALo5IKAf+YZJcghDhF/RSeaAMeu1Fl
         lzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhe6xthfcWah7P+HBBDo0nXAhJwmZMBl0Ad6yrU6lI0=;
        fh=QUqnHzU3ZalTMDuKbTnBcJ9NOC+dEY53cMwQDPyfXFE=;
        b=bMUyE8V7trIFDMiD1st+QZJ7+19BP7s7Qxw5731+1QAvrpUDn2EFm9xSe7prRLPepJ
         aIMBL4Y9Y1+qkkSpTOPt3PF9FkNy2bW0LMcPbflihZ31ay02PTsM2c5pxBtEpOxtjUAO
         klPZEVZg8AhSGE3po6d5maQZBCyvFn2ebUmOPOSsPwQl+IfWtU6+CxjqUiBy7bnmBv40
         cXfITMBdrXCpmE5W9Z3hwA5yMNmUF736teOB1wzHkTrQvIwShKecqp/ixlj8QVekcCaB
         41smVLHkaxyGHIKutALtKltU3rMzn2cf9PC8k5e7u0vvnEbfBXWCx2q8hHBRdj9XkPjP
         bl2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773426112; x=1774030912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhe6xthfcWah7P+HBBDo0nXAhJwmZMBl0Ad6yrU6lI0=;
        b=kuBsEYIhzwOt+//tvEB32yQLdIBelDbDJ9Ut3dH3wa/SNez92ZouTY2kdc2IBi0Hjw
         ev4HSO2roUzPgsRegmlYPSiY0UJ+qq7/5sMQvjqezdVhrjG+gap1+LGJ6IISm+pMUN3l
         FUeIQETYd9KLfnLfqh8buNYd0vSNf5YLFM+EpfPL3bsT1NRCZ7qjWwfW90WJg8E/Hxnt
         s7xreGEUd7gqQ+NM+FU7PXRixbj0DqOnraqNhP/HjOI7d62ToWo7d0Pvc3w0hfDEFQ1e
         i6bNYF5pK0/BWUL/QyYXgWR7x8EgKD2BTMmShTO+7VMs8T+TFDSM/tRqqnIfOA8uzQva
         vrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773426112; x=1774030912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhe6xthfcWah7P+HBBDo0nXAhJwmZMBl0Ad6yrU6lI0=;
        b=aYRvH0Bo2oeHdO8674VgZTRDo+W6Wq2Jb5NDiuv+iA6CEINE2zBTWEs/Tr6tiFchlz
         LoPvjzWVTIhStPkzyiv1I9uci/MTCkL6nYy8m5nmx+U3N+eJy4qMItar+xINGd3sy7zy
         UiPqD8tVP/Ybl+qxBVb+vs87hyiEDAjGkE4IxHkFRrfDu4W8C/6KFrcpgyL6G9FDatw+
         Qd/8pG4ik9OzMvDYIMRq6c6d+htUOSLxkfCsBiXh8T5oLHcOQQ6nh6g5AZsuioPnkh59
         ZX+oHNYTzcIT2N3ZhNinFIYnHQg6wKdWATCx1Tonm68kzUoigwcK8f5nmSsnsiXdk8U4
         3g2w==
X-Forwarded-Encrypted: i=1; AJvYcCWaTgLROmmAZWi02aoGNb/TSLPRSZX6m7tBpFR7k2/Oo5n7avsLIodODSw3OgM9ZhAtIPtmZQ4sFKzUjOWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CNX8iCK1k3bHI/MEuRPWgVBF5j7N2EM1rkTJJPXf9b5h6M7R
	PrRUxhle/GN5AoQ4O4GH3t5ysTaf9kBXMJIMlAseq3KYZILIHeKmw9cqUhITHqk+0T4c1xfEe9x
	u3vXEMXkr5f0qYold28h3YmSIVWqGyuy4LojK
X-Gm-Gg: ATEYQzy7E3oKKlZ8Iv+Vg3EJmCb2QoLeIGbyRJ1a52WX5RZExRzNyzkfwNI4X5blCsN
	XIlrC4W+8k7VR6y3NYWdFwPao9N0Q6Sw/iUhzdxwxpRIg5d1rhMSjvbhHLWczTOSIDopoijEc4T
	2vUlsTvRYbpovs2ZK+hztlFaK8g5TWaKrqDz9CwjMIpbsqyMFFyB3JhKmR7LzfX3yNkaLG1A1Wr
	Gl7S4or5YHyAStXGBIQ6lgYMZ4UlNALAsTTU4/qlBUQ7R8pMIhEeHH0sCqqD/NveZNZDVdBSW/C
	BKOYT3BdMV2fbt2m3VhdOLTnvtbdLPAEYZvsYU24jeLjq5+divLo1y98O3KRs43I0fba
X-Received: by 2002:a05:651c:506:b0:38a:4dd3:6a0c with SMTP id
 38308e7fff4ca-38a8973de99mr15657101fa.20.1773426111648; Fri, 13 Mar 2026
 11:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
 <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
 <20260313-urban-prawn-of-success-cff01f@quoll> <CALHNRZ8iBqGGRDKhDNOasfyf8TY43ne1N82irkuzDZfWUuV5sg@mail.gmail.com>
 <wzle4bdmemfknhflwhxikq7rk7x3ao3z474bhsr5zdkvtp67cc@jddzjpzwlfrc>
In-Reply-To: <wzle4bdmemfknhflwhxikq7rk7x3ao3z474bhsr5zdkvtp67cc@jddzjpzwlfrc>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 13 Mar 2026 13:21:39 -0500
X-Gm-Features: AaiRm52nuUYqsufIb2LwpbE8xJSHAc15-enL1mOre2K3hsBoRUxu8TsvMhHFtCM
Message-ID: <CALHNRZ8_Lzn=mr89dezkC6hVwgxh9kYmg8ntLf5RDuNydc9VLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97613-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sobir.in:email,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51ACA288B41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:48=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Mar 13, 2026 at 12:34:21PM -0500, Aaron Kling wrote:
> > On Fri, Mar 13, 2026 at 3:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On Fri, Mar 13, 2026 at 05:19:27AM +0200, Dmitry Baryshkov wrote:
> > > > On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> > > > > On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.=
cool> wrote:
> > > > > >
> > > > > > On 3/11/26 2:44 PM, Aaron Kling wrote:
> > > > > >
> > > > > > > From: Teguh Sobirin <teguh@sobir.in>
> > > > > > >
> > > > > > > This adds a base dtb of everything common between the AYN QCS=
8550
> > > > > > > devices. It is intended to be extended by device specific ove=
rlays.
> > > > > > >
> > > > > > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > > > > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > ---
> > > > > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > > > > >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +=
+++++++++++++++++++
> > >
> > > Common is not a board, NAK. This could only be DTSI if you provide so=
me
> > > sort of HARDWARE arguments explaining the common parts of schematics =
or
> > > hardware design.
> > >
> >
> > > Not enough. We do not add compatibles not representing actual hardwar=
e,
> > > just to streamline boot image handling.
> > >
> > > Plus this code is not even truly correct.
> > >
> > > We do not write DTS to fulfill broken Android boot process.
> >
> > I have been trying rather hard to find a reasonable compromise between
> > mainline requirements and a normal Android use case, something I can
> > actually ship to normal users. This seemed fairly reasonable to me,
> > since it can generate standalone dtb's transparently. But if my use
> > case can never meet submission requirements, then why am I even here,
> > getting shamed for working on Android? If I have to fork the
> > device-tree anyways to fit my requirements, then there's no reason for
> > me to put the time and effort in to submitting something I can't use.
> > I'd be better off just keeping everything out of tree as googles
> > kernel-platform supports. And never look at mainline qcom again.
>
> Well... It's a tough argument. Getting your DTs into mainline would help
> occasional users that would like to run something else than Android
> (PmOS or some other distro). Also it ensures that you can run Android
> even when Google (Qualcomm) EOL the current SM8550 msm-something tree.

Oh, I'm not working on the downstream kernel either way. The question
is whether device support gets mainlined or if I keep all support out
of tree and only update when Google forks the ack from a new lts.

> Speaking about the boot process. I remember that historically it was
> possible to pass several DTBs in the the Android boot image. Is it no
> longer the case? Is there any way to identify the boards (I think
> historical code was using qcom,board-id for that)? Then you would be
> able to squash all your DTBs in a single boot image.

That functionality is still there, the concatenated dtb slot in the
vendor_boot image. Unfortunately for this context, the odm did not
change those ids per hardware variant. I think they just left them at
the hdk or qrd default that came with the bsp. I do have to jump some
software hoops to slot in the correct dtbo to the dtbo partition
during inline updates because of this, but it's not terrible. And
that's not something I can reasonably do for the vendor_boot image. To
my knowledge, there is no way for the bootloader to tell these devices
apart and any attempt to do so would require a custom abl build,
probably per variant, which would then desync the boot firmware from
the official OS, plus make first install more difficult for users,
both of which I'm trying not to do.

Aaron

