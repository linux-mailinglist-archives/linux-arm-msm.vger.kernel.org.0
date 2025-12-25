Return-Path: <linux-arm-msm+bounces-86607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40837CDD402
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 04:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C229A301698B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 03:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97802405E7;
	Thu, 25 Dec 2025 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZApuj0II"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C485723C503
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766633404; cv=none; b=QymxiBxWGNJpfe6AvOq1nwDHNa3vOzAV2Ngk9/ynlc+bKJwDWiamr1CiPz8mYS26ihgU7ideNpCDi03JC6oo9eOf6prOCZgABT8YbeKL9IuvhH2GNNwKsOSfUhEPSkHYcpjv+jCWF7xN5odZh65GTXrltxU/WpSU6jfJG56c4HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766633404; c=relaxed/simple;
	bh=+M4Xl5LlW/5cOFoJEgYjGKQ51NyfYD2j03QdAf0qM90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAayRrOb/gMBw1HoVhC1Ias2y1xMl+R+/5DLiALfGdbQnMJfAzIdPc5bLmQG0L7DvF3NrcJM6je+dHf7M42JTn7gv1c/DmRNqCxZ506OH6ospQvOcdQOdktP5OpoUM4CVjfPUjP+ZflT6FnO309EIIGqdok1wAF6CJGVCUoowlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZApuj0II; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F18C2BC86
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766633404;
	bh=+M4Xl5LlW/5cOFoJEgYjGKQ51NyfYD2j03QdAf0qM90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZApuj0IIBU06s0fy8NfS/jwEyP3KlO80634xCKmarJTJWbWnigvvQQcLSOiwuoAjc
	 gQtaYSbRtEIGHDpca1GEkxS8arcxHWXM06uV7/1tFHsiPwydgz4tZdsTf1FMcAwjpq
	 r/m/cKXocPfxcs+ocMIKfeXRFl+pGjsNcpZLvoenFCC4pRPc3Ofqr2lMpmp3yqSQxu
	 nLh9Bm9PnspVftEN7DVl0VV1F7SblUU6BdcaJeUKCce+8ctfJ7/1DLyDZZgjevSio6
	 Z/GhVtcPtm91iytQBgtRyp0t5rk3+TbIdtj2VLT+vE2iDKXxsZXWPT5/VxDF+oSOEQ
	 lzRDnsywT4qnw==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4eda6a8cc12so68408651cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 19:30:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEUjHzMSiFZo/NBdr7VDDQkloEEEViGlEMb7QBiOFWPinvMBd/N1u1SsdhhsCWiNR6z6SOk+bgaUvzgSUn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8sJUNK2ioBJiP35gM9NFRtiZm45sPoC6qX6Xaz2DPCDEfYId
	99pQYilEVFEhhuof924LYc+AyckiTLv0CV3ZIzeo9dj9DSJDxrfoXtqViHzET7gUt8dMKyIwn5J
	xNDcc6zQ/6EdUBg09CFyZC1OEtp6vwptEsg3vyRM/mA==
X-Google-Smtp-Source: AGHT+IGxLqnkcNHf5Q5DLHzalcVXaTcMLxekVZzq2lyhhciKKLVeIQgpes8SJ++NinmZx0dWLx40HsuVKR1s+lvLsEU=
X-Received: by 2002:a05:622a:4818:b0:4f1:ddeb:c4c with SMTP id
 d75a77b69052e-4f4abcf3d08mr282589731cf.21.1766633403195; Wed, 24 Dec 2025
 19:30:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
In-Reply-To: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
From: Shawn Guo <shawnguo@kernel.org>
Date: Thu, 25 Dec 2025 11:29:51 +0800
X-Gmail-Original-Message-ID: <CAAQ0ZWT=s2BdobfkKuBAhw5H761ZH7uCH70i_UOR+wJ6cjSZJA@mail.gmail.com>
X-Gm-Features: AQt7F2rw8xBeloSC-lgZctKG6bHraSNNiKqYskQJHA16hYsoDpE3YGsT3BC1l9Y
Message-ID: <CAAQ0ZWT=s2BdobfkKuBAhw5H761ZH7uCH70i_UOR+wJ6cjSZJA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
To: jens.glathe@oldschoolsolutions.biz, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
	Jos Dehaes <jos.dehaes@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 12:35=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> comparing with CRD and other dts for a more complete support of the 7X
> only retimers, gpios, regulators, dp outputs
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Jos Dehaes <jos.dehaes@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch adds the required nodes to support DP Altmode on all three typ=
e-c
> ports. The definition is derived from the CRD. Since they are all marked =
40Gbps,
> I assume there are 3 PS8830 retimers.
> This modification is now for ~8 weeks in my tree with little to no compla=
ints. I
> don't have access to a Yoga Slim 7X, however many people on #aarch64-lapt=
ops do
> and some are using this patch.
> ---
> Changes in v2:
> - removed changes not relevant to retimers and dp altmode (thanks Johan)
> - Link to v1: https://lore.kernel.org/r/20250417-slim7x-retimer-v1-1-5813=
a7835903@oldschoolsolutions.biz
> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 476 +++++++++++++++=
+++++-
>  1 file changed, 470 insertions(+), 6 deletions(-)

Hi,

I'm running a Slim7x China variant (Yoga Air 14s) with Debian 13.
While the Debian stock 6.12 kernel works fine to bring up the display
(AMOLED eDP panel), newer kernels like 6.18 loses display during boot.
I can do either of the following to get the display back to work.

- Enable PS883X driver (Yes, CONFIG_TYPEC_MUX_PS883X is missing from
Debian config [1])

OR

- Revert commit 299038d82418 ("arm64: dts: qcom:
x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support")

My understanding is that a PS883X driver is required only for external
DP support.  Why would the driver missing impact/break the internal
panel support?  Do you guys have any insight on this?  Thanks!

Shawn

[1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/1760

