Return-Path: <linux-arm-msm+bounces-115356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IYf7LtCVQ2rbcgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE566E2A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:09:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AfHkWQ+4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115356-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115356-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 391A13003636
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E5C3EB813;
	Tue, 30 Jun 2026 10:08:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F0345736
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:08:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814103; cv=pass; b=lqcNG2ovSHlbfFtxoc/ZAGzVAdM0H4Je4l5eZaqCq2V/UmR1WCOKLi/pt17l079N+5w1/bYx/Lb1tDSLav3v8PvuFio0NNNuuOcqikrXZqzNU728Pc9FYpkEjyy4rOWwUhNjclNaZb+wa3iQiJL6qqFQbMzYlaOiR3tE8pU8H4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814103; c=relaxed/simple;
	bh=ImIp7ff7R+p3kOeF0z4nxDiC1ZOiuu9W7gXy3BE6q5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQG57RDOLr9McZ4GUWibpvGz3YQ0ier7/gln/CURtjPkV0e9muz6hOhGyeTRxZbJK4MGUUHABUNoFUzj6rBHfM3XWdZtOprWuaz8QLVad8uL9ENXiJPKJ0TyEPeMuiQ4Q5iO5273CfJddgbfQXrSDQ8SRmfF9HYgVx9f5QCL20I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfHkWQ+4; arc=pass smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so26441045e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782814101; cv=none;
        d=google.com; s=arc-20260327;
        b=JrqHLbptrLOWyUKxPtubf6pSABHWnzku3z+3PkhF6C0tKEAxdOZ8LVF5ejBTILYNjr
         DfigoOeIx2jB+kIn/hi7RN3WI4gkQ0+7UiyoXPYlW+hy7srBN+smgYR/vqkrFetHgoZe
         q3M7y0/HjhORV/Vow2iMi9sdMu7xOcvCJX4QGuMbQi+M20IHWQlzB/3Sq1Wi2MeBMeuy
         lvoKyjdqE6wI+ykAbMqZXOJ9uEiUeJ/UTVV3NiPDdjLeG9HpQzNA+3YNsRsAYBl9bS+V
         BERfJ2epM+xJqYyjMXc/9Qf1qp0PPCf2Hn8Z16bgAGk1G3rJ2q8KpxyiVqQPh4I6/6Uk
         sLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        fh=Q2el+r/bxgT33n6eTYG1RhuKwYOdV9Ds+3ovEOzcqp8=;
        b=Jf96EC05iaCxe4uUpSdDXAPqiGFlgagcKdys3ve1uwPjJMbwPF1dX2Zq38P3DXRb1M
         xeiTatXlwo6DUf/Jc0BMJfS4/8C6M3CLHR8mNGTKerkzE8C2sJA95BWOw3XuHWWneDUv
         cSgU8fuuposuCkut+M0nqP1Q7VAv9Qq00mrolJTMn3goR44aQW4qqbCAoEJs8ulv6ucG
         2GiadVcnNm4+JuD2KMks4d8hFhCqP69ZOiNlgtAUQAn9Fr9sVWcZqrnAZcCslIvXiovn
         nHHzbSAumvayYiTGdpt0aW3C/L+2INExPg5lg5WYDEWhVExKww7v72eIwxK1ibWmmPG2
         HReQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782814101; x=1783418901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        b=AfHkWQ+4+dOgoqkmHcQUprrHPh+aL1fDXBe5mbKlRaLrc9EC15+p4PYgkyNs/hG0zA
         mtqDT9ikZBrEN1hiGrrsl2kVrMk59Gu42IbhF8Ojkj7jwo+obtLOBwJ+dA+0b2/Cfznn
         orVTdYe/jz7f8ZdB9zvR9+U6lbxAIrgeSHZWmoi4vJ4VLRZ5/R0iuladv/Z0/xUZz6OL
         gChPiAPkSp+SBGxwfiQkcYpABBVXCsGoxoMRZ95CxEAl5KbdtmUo/lDdMYy7JGpf3xK8
         +qX+wsF5atgBHUDODLGWRSwD9UvVpQdEFwbVDR3fmQsunkZpmvEqyLoEbGVcDAQmF6tB
         dQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814101; x=1783418901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        b=GX2xgnz6OtyuLOX4HWX6o7yHLWT7TnpAa8usfJlsUaYJ9cP9MYygtEDIZzABoc0ASt
         EuYw/wwnfbQpeU+I+eAG9iPHuKlzr0ojXxxApQBXmSTqopIF9L8vThZ9kKHuK6gAiIgn
         qNBf1NHsc1SFbdPGXu9MVskU7kWXMJPG43bcfW/4J/YNNrF/4r+zJTx7F5Izs1kqVyU6
         hN83CEq+kPR9B3/nZmp+iNInGf0p+l5HUP6KQc8SAcmhWgmhqooDHMR5jvixhlMohDA9
         0b/rVP5US6n7+h3WAG8QmhQ0zbSrO6IyauMruPKTT4mlPV02tE5oeD7PnoettRam45gs
         4DNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Qmp0cCkz/QtBxxn/40El2/2Izs9uDhQEMzD3Tg8Vlfg+WM4gZwoPi7R+BMorKGly0TeQBQfy3q8isL+K+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw5qU1NRS05FLZAiKyPAEVK8Rjl4VojUlNCDlIuhPaBMZRCEnq
	nIQ+NIODqWd8P3WQjhdUFVjrLI0pBQQOW/kIK/Bvb1z4RQP2V2HbPor2pDhCPYMhuoYb78EXimm
	3Lx/gQOPOw+0o14mvjmsy8L0lDUqGHw0=
X-Gm-Gg: AfdE7ckCq98dVusCr0zyXTHqFjuciNeRqlaVhPBi+L4S/NMxv1SsJpKrkdkRCaJ3oOD
	LbOkhkEXr+vppNVsT5FYRxUfL9LcaZF2S3ZMv3vPAzjADEJH/alJZlRRuJewiTwLWLs7T6lI4HV
	VHjr9Mawy4FK3byjsX2PxsInKTf1cZaPTXqpnIeqeO0Ys4fYsSlsgHHXTbgd1Hi6MJTGdZeJ9m8
	/vjq25j1WFVAK7biIbDMUMfc+5ngpByzL5UoMmFVSfKwlHdul91mFyyOATd09yQeK41fk52xCHH
	a6B+dHkVa3+V8UYulOQcoYt1RJVUUWwsB4p5S7k=
X-Received: by 2002:a05:600c:4991:b0:493:b730:8d78 with SMTP id
 5b1f17b1804b1-493b82c324bmr28731885e9.31.1782814100704; Tue, 30 Jun 2026
 03:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com> <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
In-Reply-To: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:06:50 +0800
X-Gm-Features: AVVi8CeXY2XXtKzC05jw7mqBTSZCDFNAWUTECad4JJzZvuIX-tBM3NerKDQFx-Y
Message-ID: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115356-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DE566E2A54

On Tue, Jun 30, 2026 at 5:52=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> > On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
> > <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>
> >> Hi Pengyu,
> >>
> >> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> >>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> >>>> driver to fallback to FIFO mode by default. However, these platforms
> >>>> also support GSI mode, which is highly preferred for certain
> >>>> peripherals like SPI touchscreens to improve performance.
> >>>>
> >>>> Introduce the "qcom,force-gsi-mode" device property to hint and forc=
e
> >>>> the controller into GSI mode during initialization.
> >> Why to force ? You can directly configure in GSI mode. Note there are
> >> some configuration done prior to Linux bootup too.
> >
> > Sorry, I don't get it. how? I know there may be a qupfw, but it is
> > impossible for a normal user like me to generate one with GSI
> > preferred.
> >
> If firmware doesn't program in GSI, you can't have this working in GSI
> mode, its going to fail (and work with fallback). if it's programmed in
> GSI, anyway this will run in GSI mode. So why to add extra things
> without any usage ?
>

What I can confirm is that fifo is not disabled on my device, and gsi
is definitely enabled (under windows, check the register
SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
works well.

Best wishes,
Pengyu

> > Best wishes,
> > Pengyu
> >
> >>>
> >>> Ideally, this should be decided by the SPI controller based on the
> >>> requirements. Another option would be to prefer GSI for all transfers=
 if
> >>> it is available, ignoring the FIFO even if it is not disabled.
> >>>
> >> Yes, it should be decided in advance and configured accordingly for GS=
I
> >> vs non GSI mode. Because there would be limited set of GSI pipes, whic=
h
> >> will actually make must have GSI mode device run with FIFO mode.
> >>
> >> Why don't you decide prior and configure for GSI mode ? We don't need =
to
> >> change the current logic of deciding FIFO vs GSI.
> >>>>
> >>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>> ---
> >>>>    drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>>>    1 file changed, 7 insertions(+)
> >>>>
> >>>
> >>
>

