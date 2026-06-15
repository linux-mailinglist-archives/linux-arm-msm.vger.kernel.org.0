Return-Path: <linux-arm-msm+bounces-113069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGemNyx/L2r5BQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:27:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5568341A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:27:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qC3ybLm5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113069-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113069-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C581830071E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 04:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469DD303C97;
	Mon, 15 Jun 2026 04:26:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104941991CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:26:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781497616; cv=pass; b=rSMhsEHoc02+Iopj+jfjDAlPFG5VzurU9VoYWYDoSANJjQSNcrP2yh716gaslZ6eR4rHzd8bGnrttAJ7HExZy0fXWocbAkPYTZIQWJGyqUWWMPjsBzhDDB6nmtT7HHnA0PVv5VTzh0CKfUjdflyuCWn8ivBjZJWBQj9l2yIIsvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781497616; c=relaxed/simple;
	bh=Vl7IPQ+oCx/xUtiuiJtRzdKDCC/Kdl8GVNHYD3aF2bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDIdVVwCw4wp5Lw2LXMDLoHOwRUZTLZ4x53Kt/5e14f8b5ZnvHw8y8RFEEeNuq+AjF6IghiSyCptJBhOrPq0oJKZaoI1jvfnNlxpAwk9+UnGUDOox0RpZsS5xe9MHRpADp1mvRhi33oWFZXI6VGHyZBhXp4H7SXX0JkPUTNSlpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qC3ybLm5; arc=pass smtp.client-ip=209.85.217.45
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6cf48482ddeso717860137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781497614; cv=none;
        d=google.com; s=arc-20240605;
        b=L2ZdjtTOKOeC3SJmNieKF23AD1KeummwNIw4kZvtF8wDMG6V3gsxQ6EZJXUynjlcb0
         WtNRXFRApSzV506BZRj+jhCoeLYsOSURxQyOK+UOJixziVw9oqLxRppfOMLiDNhxZ3Mp
         PrsdQZAlb4fbwGMp7tNACStghvu+D+I5hNfcJ4fMIjMrCgKqvPnnW4ZffcCOPqgS+ewN
         M6jP8PFzWi5PoGTUyTm8DCiIdNJZAPB4CYgurfkK2lcqMu5DAE5QumATGP+Dat0B8N+4
         xdNGSooINFO/35gaLRrCC20CA4x3998MrJN70QzLY5ugTaThEEV7wWRboryoulpOZ7IL
         jujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        fh=cyzejrhiHrPlphCVfA7UrP1ONzPgjai99rXom2sTp7M=;
        b=H77kcFdD1zCclFG2pYIPFkqcu7k58e8VTvdurNi+nQur2KpCNzKDEKa7F/XPjSrGjB
         +j3W2T2eg12gt9SwjQUe+BEnozrkrm8ah1bYgRogoD0g+FLbGAENfQggSssEm0id5l1q
         MZIu+WSdrHxsLhytHdY0X6PiBTLGK1urzqfAL80o8/sh/vO1vQNK/sYqYiOIIJnJhwIm
         doKuhjOWAVhNeRZ0XrM9zx35T1vZRBGHWRVDGfhAssdQGbejgtIMLLvM3fMLcOfgEVsi
         +xyGC9OmG0K8iE+vqBAfmVAihYRjrZ9mv2GWJZO+O8Md0lz5UVD2RZ61u0CgFu64YaCX
         sR2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781497614; x=1782102414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        b=qC3ybLm5F9PrOi2nun2df7gsPh4hVQgUPEPCavKwEhWrlCeL7Fs8BscaqRwbT5EkU5
         MWpX9zxgKKMlDqXSpCoOoMcfdtOlM2/5olkBy4/SY9ksxZK+pJFygMAlDH5rcjKZUzgu
         js724BmjARXi3QayLC+4gqvwv7tFrsTcDQZFGqfyh0F3sb32TmE0abJJHa8/RGrPrY/h
         ooGV/QwxiJahi8luqhWot/2aNIolx2IlWQ7iIr0IjRdd96OLnygAXF1TgzYAt7wmWYei
         rxjKNcmsKzXLggXO5CxKFIy762v7VloyuOKmLZrnHZNcGNRM53OzLg8wQQ3/dkAwE/hU
         BdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781497614; x=1782102414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Sf4+BSkjB0x/G1yuxp+2PybN4TRsjxfdrHzeKxLys=;
        b=B7KGaQPpxO2t+fH0iuv4qxb1EwzBYn2oYrnhWGAFrloXlQfQ1o+mJw8zgm3brKYpO4
         f20584B8WUq/f1pyWlZLu2gofWyeLDfR9s8caY2F2VrLV7ZiRMU2Y1ZBuJLvZWMwTMR+
         BgQuTU8GDshKFqeZfYX4Nl/K4W2/px4EO6xVkkzBmrSCoyg54fWK5EOpONHu8AcZ4/BE
         Ab598SsFJ6v9pvSFQlU9V8/EbeHeaQnsSfWTio8XTmvtkQjS6B2iJDnBbPrjdGF4U+OM
         C3p2osLsPtMhONqxNiGqssGTRMBAyiIx2Oer0dh+/XwapwUrkGuX//M45bApINLya6Qi
         AdHw==
X-Forwarded-Encrypted: i=1; AFNElJ9D/0L9jwbtdd/p1CtZVc0Zce3yiplbvtgr2Wo6c/URglsWLpm9QulT8YoNrt8DDnmL69uWcsus0jc9+35B@vger.kernel.org
X-Gm-Message-State: AOJu0YwCc9VRIoSTqmJeLFHQ57oONhv9GRZzeKGwjgduw2iOOZiQO281
	o/ovesu+2NjJifsMTl4XHRMrC5qpCDwlyIt6ITqiDWOd43S96hkcmmKzrqXumV6FXfU0/ULjvHA
	zOH7iQ+MFVmTP+ekObAkT6cBtNtYqzFo=
X-Gm-Gg: Acq92OGFBwz7C5W7VshljRP6yZfCF5scv+W/QiKV0ALvVzV0uEBJI4s8J+yWvlbt1Cx
	Eru2JaNG8Qch/Y6YYeivAq1TzITACk+qD/A4o+edJse5VJLbYLw1sbSVzvv5HFTdoAXV3FnPzpN
	nwewx/LULNwQFnoc0km66X7gJ4Sk2XJ/jjkVdLVIwjCtG9uUzz/Borb3cNrPV347pfVEte+ouqT
	oA/9xL58Ghpu5xwK3Nmg9+aeoSEqL/vXArq7hgcaYQrkdKYvbLv8Dl3ZPDY0zkVwTmLd8TM3njd
	6nVls27FrY0EshnW1mN+ywdn9UDr2rO4H+mGiqM=
X-Received: by 2002:a05:6102:3ec2:b0:650:9174:f3 with SMTP id
 ada2fe7eead31-71e88b5d470mr7178683137.12.1781497613922; Sun, 14 Jun 2026
 21:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
In-Reply-To: <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 15 Jun 2026 12:25:32 +0800
X-Gm-Features: AVVi8CeDmjxY205ZovrS3y0Uc7ZTFkv5R1e4COHN-snpVF8Qqejv_b1FwKnYlgU
Message-ID: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113069-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DA5568341A

On Mon, Jun 15, 2026 at 5:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> > Some devices (such as gaokun3) do not disable FIFO mode, causing the
> > driver to fallback to FIFO mode by default. However, these platforms
> > also support GSI mode, which is highly preferred for certain
> > peripherals like SPI touchscreens to improve performance.
> >
> > Introduce the "qcom,force-gsi-mode" device property to hint and force
> > the controller into GSI mode during initialization.
>
> Ideally, this should be decided by the SPI controller based on the
> requirements. Another option would be to prefer GSI for all transfers if
> it is available, ignoring the FIFO even if it is not disabled.
>

I have read reviews. Can we check if the compatible
"qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
presented, then we enable GSI mode.

Best wishes,
Pengyu

> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/spi/spi-geni-qcom.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
> --
> With best wishes
> Dmitry

