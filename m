Return-Path: <linux-arm-msm+bounces-75340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC850BA4F4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 21:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DBD1C20FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 19:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1E72798E8;
	Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQSPF1xB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B73202976
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758914454; cv=none; b=lWK9eQoRAq2LXCvBw/p7L4/LnLgfDzbtFCL/6Hg69+vCJPKcgYk+f+HT7WIKeifHW8PV/WQiNdmoaC6JalPLFWkWHf1TQaKpzytlmNRLH4yrVFGbHYWRuAxNQHwRa5U6y50ucXxLC7gwyacZmxy91Mo8UCHmsTUAe/oZA9iiNx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758914454; c=relaxed/simple;
	bh=7N5d3Dzn0BqHEAQopLp1FnVDhZ7Z9IfM3JDchDGwd7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VATmF1mbxR2vOZskS9fAhenNeZL2KnR0koJar7ic4Ka2xJkgjo7gk/uehUsl+IBObq9NgFp1fhhFEba2HW9XHs4a9ckBuzBV8IXMdT5qXls3XcMqHiGfgY7FQMolIzj3QQ0B2ZlKQPXPiBWPnefwiGFoAYaoKdTV6IXOl4ZJue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQSPF1xB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382DCC4AF0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758914454;
	bh=7N5d3Dzn0BqHEAQopLp1FnVDhZ7Z9IfM3JDchDGwd7o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZQSPF1xBgM96I2MWM0dcn8wjqduyQcKbFFS968j39f0uPa3raUpCmI6jgj2Lw/0fp
	 Z+QG+AORHoXiC2Tda84eXJomW3In78K3nHsa952sTosHu0Cn1lhZBIuRQMxu3YWuyG
	 5CcxooN+FidyexO6fvRoPQ8jqnyennIqWNQhAbp5v6gIL7rDQ3LQXt0bQ7lT2LGlGF
	 2uhGQhrk7QuL7+VdDhQy8YS8Y39kmhVqdAyvj7s6vpTGlADfAotIFSWNUDeM0fucOB
	 TyFMUzq3W3pg9/VjQSvKMFmWOeRAPzNSy4ktFGNby+lbCLu0NpqTb+H7xQ1bLoi/nV
	 KYYr3c54ORIxA==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63605f6f64eso1850240d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 12:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgstJvDprGNm4BGvRTW+ycnCQ9+FLpLpA9Kj9zLpjKOXqcxXylgGeLlJGxEKFam43nhIZN07tTaXByfgLs@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQ3d9DLwMCDApZYYqbs6DNkoCZyzWxkYV9H2ozB7afowr2mQk
	2eY/Se41Zi7ioSEQrrDrM5OuU4RwuJY8NOOr11Kz7ISVvMyGFLn4fQSuLoKzgyFcsK8OxdPq+oc
	4ATakl3uCg+BAKNJEBcxk54ShaxgmSxQ=
X-Google-Smtp-Source: AGHT+IES1raCxxFINJQr+dmtQ9LgFVrs8IhuqhlDaCX3NyY/+k68dtZjbkgtpMQiAG5OyOqdO2Yyt7upU4mGvVz7Ic0=
X-Received: by 2002:a05:690e:144c:b0:635:4ecd:75a0 with SMTP id
 956f58d0204a3-6361a89a815mr7552466d50.46.1758914453395; Fri, 26 Sep 2025
 12:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
In-Reply-To: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Sep 2025 15:20:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4X7i2rQV=QHLC-K-_pjNUp=LaRJY0tspBYXSvpoV9STA@mail.gmail.com>
X-Gm-Features: AS18NWAoUXnaqRXQfeU4OiGKI_n-1x0a1TmuD0a4qrZj3f9RWUzb0lk6u9nGURM
Message-ID: <CA+5PVA4X7i2rQV=QHLC-K-_pjNUp=LaRJY0tspBYXSvpoV9STA@mail.gmail.com>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 1:49=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> The following changes since commit 1269106c61a34b8f65d045c8045df880083bd3=
b1:
>
>    Merge branch 'amd-staging' into 'main' (2025-09-24 13:46:33 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_4

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/704

josh

>
> for you to fetch changes up to 19c12c41c84187a9fa1df1b58bb6f72a181ba620:
>
>    qcom: Update aic100 firmware files (2025-09-25 11:38:38 -0600)
>
> ----------------------------------------------------------------
> Jeff Hugo (1):
>        qcom: Update aic100 firmware files
>
>   qcom/aic100/fw1.bin  | Bin 2135752 -> 2180920 bytes
>   qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
>   qcom/aic100/fw2.bin  | Bin 783512 -> 812184 bytes
>   qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
>   qcom/aic100/fw9.bin  | Bin 762704 -> 787280 bytes
>   qcom/aic100/sbl.bin  | Bin 1048576 -> 1048576 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)

