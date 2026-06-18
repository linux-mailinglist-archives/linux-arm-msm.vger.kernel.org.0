Return-Path: <linux-arm-msm+bounces-113688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djaPGP91M2rCCAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B669D83B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j+CWu1Zw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113688-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113688-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33483300BDA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 04:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D1E344DAE;
	Thu, 18 Jun 2026 04:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E62D0C7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:37:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757435; cv=pass; b=qj9FIOyYZDfvKo/cGTrt2yG19xL44w4xv/dm9yvuBkg0wn9Pge3nUjKPdVDFbaAn6fUl48plEEIHBzsNoNsBgT5WtekACiLJRLELM8MRnTftoW/J3Gvv2sYOevS8B7N8TdrWDsnqmz/sLTC6vBT9yLxdxJchf3vhc2e5yQ/VoYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757435; c=relaxed/simple;
	bh=fNKzdOfM8BUwuXluXqTbqFsyDrrdPbAv/VHJTlP/dlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9phqBPSnQQiiStI5xhp18YUwLjLEO5HRVk+RpfTLFPXEkQwkObh52bM880CjF9EpzJhl6nPBA0qzj2eJYQIUVtqOFH0q89E3YjJzH5Hpqj9swFzgh1nw+eWPoPvkuuvV6V+97ED0sW+05vTj56VcGq6mszRwfmgWGMuP0KyyQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+CWu1Zw; arc=pass smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3967738c801so5255261fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781757433; cv=none;
        d=google.com; s=arc-20240605;
        b=lFV6bVcLLvtIx0QiNgLsTASDgL8NJzVUoAxLSvEi1tOhxvFyomhrE06nBZB3DIOv42
         pGeVvqGiqvdSt2LS+iUoDRGNO3pem8hEgxUl5ELMZM4GvE8HzuVelEtKXMUA+1bcMiWg
         /kUGadY25QwGIkuPyfVVnGK0NPSp9AyX/rSnPv0brPmnF3NY1uJux6izEm3dg8KV46mP
         89U4NluPXGdmWK6mf24/95XGL9sPyTl6ZrSYoWRoG04b+u+xk4pM+oysKDzyFGwsmWsM
         SwvdDWj8EStNc8X4Mvi0S7MZwho/OocjAYRnWil/JLcdp4VNpyHrV6/S+7F0pxPb9XFx
         rTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        fh=RKEbtB4uyhCOUdHwAJXZuH/FjTxVtEfN3sso92AhLUI=;
        b=LtqXdIGQ1qzcQZKlS4BE+mbZJM16c+SbqDELV244h+pvAHduOcNlmLeZMlSdl6U8oV
         8T0Wx+QNFFHTdFG/b52nz6ff/T1PV9F8/zhtMJYVY/qbj7vbUWhyBNwkhvgMX+SogjP9
         TIYYCq7ajVpA2E6v5woFrlzWMf3yiLsGmvwbR9Dz9aZC998uzio+8yz/A/Oc65IJRoEV
         17zzZFd7eA/skC7LLDEQ0zvmOlLcbPrngSVm74CiyCiEDenkQZIqXT7p7ZKE/UbYMmNb
         QPiZPHjG2QaVS/G3FE5ZIi5mUh6lFKyWcYp42Y7usY7k+4BAr3JNgkRC9mU5smZAixjR
         w3Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781757433; x=1782362233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        b=j+CWu1ZwG8XBw3gGO9jYoGQEgHu16gPm9xpEY+jOb9mYdiDS2I1th9Ld1vkoOrZWS6
         F0fHKKoCjG4+fFfF+ru5joJGDpR6sFiGGLYqxjFrz0k3AzwiNQw4vt5KWzpid1Sm13v8
         SyizRwIIUKXYAUIkqpArCP9/hUNaHbkMkOxK6OB1Q5l+4/6z+tVODXt1MmRGrBArALg9
         UVLx9wiF5JkgdU1scRjRL4ty7LyWExPn4rzAbLPtxs9bL2kNmNvP0YrpVAnSXGjlBilM
         YdKJdGzZxNlNagvSbTl+wAtaT4yUx7mTnU1cLwdSdD60fEPhzJzj6p+HfbYDO93MGWO3
         Frtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781757433; x=1782362233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        b=Iz3CQggcbq9UTUSo7ua+24q/yw6h/ujn8WnBWlrNUBr2dHj9+0Ep+9GZVgyjQlZkb0
         ftoz/aHlkVwfyMYZ/0BCUVufWAgMt3Mg0IhfrzfTyWIBpE4oNThe7BKSquDE3yuXT6nt
         eWemrSAGmjwNJRD4qLGQVlstD7lTg4FIuGDUsJBLjT41yPkMrw38tbAGTswDFesz1Rnf
         Hcdr2qUcgX5Z0zi3YZaZjc4LrYaDsrHH2BUHwsEX8JczcHdM/IOs4L1J4YnoiK+G0a5v
         zzZaooyMbSI2Z8rLNksMJsoEvp/+XFb7geKaCTBKchksbGbxahsmjz+lFSLK2MkP9XqI
         55dg==
X-Forwarded-Encrypted: i=1; AFNElJ8OZHMWcrhfCN5ew88cE7UjtdUN7K6MwUJ3gO/B8SqeQbj2VK3bmqFy+rio9TXjjl+nF7wBWka5OQEMgMi2@vger.kernel.org
X-Gm-Message-State: AOJu0YzSugsSBv6IzRYqNDty/IYI94ITc/INjUacIFRC43kh+pQ1RCq+
	EVgU0GwMi6GK2x/bdX3q27FFX0DtC/av3ftfCum+QLntJxgs0BgRjwyiCyPHoiQr1Xilc0XIo8I
	x4JXM0lY4MruxDY4dorpHzLd2iMxHB64=
X-Gm-Gg: AfdE7ckjIlsw2FDwPQPI5VNKpobVWKpm+EU03sZd6y9fhQW5fwmTers7cRPxP4a4mGS
	JIcFFzOmTl+ugpz7uIMnOEqWZkPEjQu+5+ckrn6XG6OeIftDL320Q6dI1IvBEybvN/E1cCbhMGx
	HmMa+NG+zXpZQ6MfGaW/0deLXTAc0jX4Bk/LpGXWoEovFCUdSKlBmIWvG/cIvPJLa0L+WcEn4+Y
	XD0DbP+lskomLicPnwGQJYeQTEwj8BYYr5HuPlSdnHEK60QGiA9xJRyTv/GJqo72A+JBju+LJWg
	zbjFgjrfmjJ+S9Lud+2RRyRqjSLTObl+fTRMD396/nMsa2N5M3Pn9MFV/A==
X-Received: by 2002:a05:6512:4010:b0:5ad:4cb8:ab2 with SMTP id
 2adb3069b0e04-5ad4cb80be5mr945320e87.47.1781757432406; Wed, 17 Jun 2026
 21:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com> <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
In-Reply-To: <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 17 Jun 2026 23:37:01 -0500
X-Gm-Features: AVVi8CfLcHy6h4cUnEnXnRiHZIgRkJuFH9_NAvLKc9bSZyqWBDaTfGLYN5pf0x0
Message-ID: <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-113688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B59B669D83B

On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> > permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
> > by aggregating bandwidth requests of all CPU core with reference to the
> > current OPP they are configured in by the hardware.
> >
> > The effect is proper caches & DDR frequency scaling when CPU cores
> > change frequency.
> >
> > The OPP tables were built using the downstream memlat ddr & llcc tables
> > for each cluster types with the actual cpufreq LUT tables from running =
a
> > CQ8725S device.
> >
> > Also add the interconnect entry for each cpu, with 2 different paths:
> > - CPU to Last Level Cache Controller (LLCC)
> > - Last Level Cache Controller (LLCC) to DDR
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidth=
s
> > ---
>
> [...]
>
> > +     cpu6_opp_table: opp-table-cpu6 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-1017600000 {
> > +                     opp-hz =3D /bits/ 64 <1017600000>;
> > +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4)>;
>
> I think this should be * 4 in both cases since the interconnect driver
> ignores the channel count for a node in peak voting. We may have a bug
> in all other DTs here.

If this is confirmed, I can update this patch. I based the
calculations on my sm8550 copy of this change, which in turn was based
on the sm8650 change. If this is wrong, that means one piece is
scaling 4x too quickly? Making it a power consumption issue, not a
performance issue.

> BTW, are there no lower OPPs for the fast cores?

Not on cq8725s at least. These lists came from an AYN Odin 3 with that
soc. I don't have any sm8750 proper devices to see if that's any
different.

Aaron

