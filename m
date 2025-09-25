Return-Path: <linux-arm-msm+bounces-75123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68916B9F900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC8D387DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D5323B638;
	Thu, 25 Sep 2025 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdHcgEAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110B2264AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806786; cv=none; b=mKb0os4SACOMt80P7PpgV0C3p2+pn9AjrjLvU0PPxwk8K0oCVbuAywvQA+2tN+MYhlYOdIHCJxcde/AF9JlS/7X2PioTI3ObUvuVwr+rhQgftazX42cwykGz75uDZFtTvob1vdoaH0juaZSuxicaSN65gZtFyFreJIJsk0CG7+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806786; c=relaxed/simple;
	bh=88NOcHfKKYsahqEmL02itR928NeSctZtHmwIpVJ3FDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuRD420HJLXzGK0TobmvG07vVFtAvpAq9rnGRJSzEhU708FOW6XSpFNEDszYQLOamB3tpO5hxOHJ142PfcRdBJO201pCHVJDsIgzDEt59nb4JLZoN1Oe06mkiAOBtl9ZoAnPemkC5fAbMy/jnW9mur3l1Zs85UcHmD23jrgrgHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdHcgEAk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783BEC4CEF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806786;
	bh=88NOcHfKKYsahqEmL02itR928NeSctZtHmwIpVJ3FDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdHcgEAkEJmAs8eXzAlIYBsUMYr2nTi2cPGvx5tGG+kuNQDcVuc5Vz9PDvGKcqTgl
	 Gqm7iVCTjUuBN/66+fdLoCOmTNW7EFIF8HGcmLB4qm+Lk2sh7r9kHbNz7I0aQ+ZFTd
	 TeMOzsLF70DJvYhEHUl04xwt9l1sGuBxIJQp/toiCF4i9C3oTceUWyjRL9NbNZiGR7
	 9m7SbxoKAYBBfpsVvNBBXr7TSHDImrT2gYZo1S6DOPvVFoTKBsQMVDpI1FTx+IYFHC
	 U7TwW51+R2iJ0n0xCSxrx+Lh06whkrcL/EZOF5OpHPn2+4CmXGz1sjhEEHq2A3litn
	 +mFVYG69AYuXQ==
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso697783a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsNIzl79DWqxsbNwh7ttfzu39WJkqWbix18wQsqtExJEMOjRt8kXmBFiNwOjeyc+Xo0etW95fT1w7BUMS2@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTS12/N4YwgiQNs83IF7VSd47AZXjsGfJkaQiYWHySh9FNjND
	Ie2H6KL73H/A00MTJ8R/bP8djWgNBYhUeo2/BF1wsHI0dBkEm06jnu+lZvrrJs/yfQReffgrUfm
	XXfQQXah/3SSRdeo+T9n21gcX4+ftDos=
X-Google-Smtp-Source: AGHT+IGsOMxlyxZ7mhUSjQt6C0Lc1FSkqDaXyZq/j5oElV/4P1h/YQwBHEjH7ZyXECfZVJr/eB5uTZx0o877OHXZ14o=
X-Received: by 2002:a17:902:e890:b0:24c:a269:b6d5 with SMTP id
 d9443c01a7336-27ed493e891mr36124545ad.0.1758806786057; Thu, 25 Sep 2025
 06:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com> <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:26:13 +0900
X-Gmail-Original-Message-ID: <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
X-Gm-Features: AS18NWDBrwXfUaWFEPV9rWtwVaLLmke2vezdq5SVvr5UMJmIr9OvdeTS1SZ8EMc
Message-ID: <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 09:18, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> Add support for audio on the Kaanapali MTP platform by introducing device
> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
> microphone for capture, and sound card routing. The WCD9395 codec is add
> to supply MIC-BIAS, for enabling onboard microphone capture.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>

Audio is not a separate feature from USB. It's simply incomplete
picture which is wrong for case of submitting everything at once.
Either you release early, release often (which I asked you many
times), or you submit complete work.

You don't understand how your own SoC is organized and create fake
split and inflated patch count just, as someone admitted, to have LWN
stats.

This work is incomplete, so please start organizing patches per
logical features, not per your patch count and company KPI
.
NAK, incomplete patch and previously communicated as non working

