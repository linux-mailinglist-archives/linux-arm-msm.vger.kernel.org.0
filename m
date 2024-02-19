Return-Path: <linux-arm-msm+bounces-11682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD685A3DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A44B1C21710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F782EB1C;
	Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMvYHo/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C912C195
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347212; cv=none; b=C22VmQHXlOwk6++Qe8r1c39XKHaMFG5hPnTWYEN3jVyGnHRfjYFRx7KjaWPGLKb+w16RvwnmlNaI11cjXq2N1E1ZUksjeANf+nEoGnN3YO3OGrOf32UIIZ2hzLaz0BJig0aoBzb3CerHFiIe97EWoFc2KshyMIU9MdrISFHW7FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347212; c=relaxed/simple;
	bh=HzXC9QPB6X5VVLQLHf9254CrLgb+WKDpEJOP2Siw+/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnNEGEVlJr1cS6yzkzlOdA4+KTsBoUvqykrPuM5X7GhCOlC+b4HTBybN4i4b6W0fW6v34Q6G3BdUDhQXOjtQFSPCzOzphWyQXVUng1Z0FD0zSzpIQ27zI6She4NbVnW7AoUiFmK+CboINQGWik0pcktUVaSVpk0OYZ6g0lzzUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMvYHo/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59758C43394
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347212;
	bh=HzXC9QPB6X5VVLQLHf9254CrLgb+WKDpEJOP2Siw+/s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OMvYHo/VamZR/fXbW2saES9P8XCxR+8lpbQNCeThd9RvxbQjUYpjaKBk4a1wZBOBj
	 zrMSbTyTC90BKNsNAcY5b2mXHMBHJLyI6rRCa0vw7pCdE5GYpTTbiUKukqo915k0bO
	 zCYHI2wrFacboeVXP7n0kwDie4+1xP8YDqSpsnX1FKdlmsvTvN1Spxb3juG3ksthDY
	 jiloMfPqRXTsjRrQSJ9+2j+sECHl80LIedu0Y4T+hTA3x11y86puxpg0zmaV7GzHEX
	 iaHWCjKjjnY5zMsuNZab3FK+hs1CPMWdWlJlx9EesdUbxbtPMJOkHvLPl9mIwPaBcc
	 hoyrPNroieFaQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607f8482b88so26991807b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:53:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnLdLmhWgnSvBg27T0KyAzuAmt1UwTb2sV4Rg9bQn0k1y4YXn2JnDe2YE0iYf3IVDCaszrrOffvjdNhQ1yU6hnavI/UMiJS59Xs4fxJA==
X-Gm-Message-State: AOJu0Yxyx0I9tvO0u0SttGRBGGgQZwgImfs28z3i4P1/8ca4rBgDyjLt
	DFSbUjIE1BefyCG6AWSGvZdZyZkABwrs6uGmC6RyeFTySUU3Oqpf0BK9NqAxsLJ5XR5K/AS7Hf7
	L3oan7i7RlyZhTkWJOZ0vfrpxDnI=
X-Google-Smtp-Source: AGHT+IFcE37YZQoWW38HX8DQqn8iE4l3mZ5+Ox4g6bihcBI8qv8fh3P/pVlY113Bj9sXr+H1g5uvpTD/bmMTFC7hN8E=
X-Received: by 2002:a81:b614:0:b0:607:f4b9:11aa with SMTP id
 u20-20020a81b614000000b00607f4b911aamr9788920ywh.21.1708347211526; Mon, 19
 Feb 2024 04:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
In-Reply-To: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:53:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5_jLiKKngz_fiebkTgkQ1gfPwttgVpZipCTENwq9U+yA@mail.gmail.com>
Message-ID: <CA+5PVA5_jLiKKngz_fiebkTgkQ1gfPwttgVpZipCTENwq9U+yA@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 venus firmware update
To: Nathan Hebert <nhebert@chromium.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:42=E2=80=AFPM Nathan Hebert <nhebert@chromium.org>=
 wrote:
>
> The following changes since commit b4b04a5cbcbb0f67d0d63fa66aa68f32b9dc5f=
a7:
>
>   Merge branch 'amd-staging' into 'main' (2024-02-03 04:45:27 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/nathan-google/linux-firmware.git sc7180_vp9_decoder_=
fix

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/149

josh

>
> for you to fetch changes up to 52ac76144aa006c284e509cbb02772c9264bfd15:
>
>   qcom: update venus firmware file for v5.4 (2024-02-07 11:15:07 -0800)
>
> ----------------------------------------------------------------
> Nathan Hebert (1):
>       qcom: update venus firmware file for v5.4
>
>  WHENCE                   |   2 +-
>  qcom/venus-5.4/venus.mbn | Bin 921236 -> 922240 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

