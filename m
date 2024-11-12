Return-Path: <linux-arm-msm+bounces-37611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8569C58B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2933B4186E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFE615665D;
	Tue, 12 Nov 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2z7IMrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED108139D05
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415768; cv=none; b=bHVp2KyXSF55TyyMlpo8E0aGnmFUpsFanLVQsGKW7R26f9kBhlJpulZxQx7hr91xrU0qGsDqQ+FrSi5WlcVdGZ1sL7bGtLHfRGu7dc18zi+VbfZ+iiroGkpqX3G88Hoob3C7qRTPCgwvOuzOE+TFfbVS5HzyGo5U0OoUS9xEiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415768; c=relaxed/simple;
	bh=2rIzoBw5oD7imtjsESdKqglYtQ4orZji6Qn5I+oBWJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFq+/tm1dNm58uzC9aD0bZ1b7/GaoR4/BsPbCZF7fNX3YDkBaqQX14G90iEpjdHgF0QzmVR5siS1VYputK2vz1n5QasY9nZUEq2kzwrCeStoqmKmkY4nOJ1OKtvgADDBQ3kVS+rXA+OCXjMHSQ7BxpMjE4IfX26Iny6ZCXh0xHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2z7IMrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A050C4CED6
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731415767;
	bh=2rIzoBw5oD7imtjsESdKqglYtQ4orZji6Qn5I+oBWJk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Z2z7IMrJupKSiLDmXJRnnCqpG7a+piKuYR6vQCJgfNVCQxJ4y9ad+0OWJdnJ3nkMJ
	 ozznbWkJuE5agisWQYc22X6BeIJfr8HkNu4TzV7bIkWzLEw9Sxx+xVxyBFP1bOvHiK
	 XB3Clf5PjVI9iovzkNHWoqCW3IVMc+kNp3SHKgiLvdJtJSlkywk3Bn+m8LyneZf1tG
	 eoUz5UZ6ZlZFcX9E58FOgt0/D/iFDABoB6BhmS0A+3k5JGrnSKtIXMNclj92wHpnui
	 z9vyOJ10VA3XaABfEUIg0Prz/O8T04AHDXKATcoyZs/JzRAGzlzONHfQTTcytDTsi+
	 uF7LE/c/5qJPA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e33c65d104so46605307b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 04:49:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGpd64vyeJUzOSrD+Afh8KfDezAdpC8XsY9hHAWLTblHDi6p9OFef6Il6q4vsAl0XBA6jwAaVEf3HOV288@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50efsBXZGD1GUjIAsUZQeZZL4JvV188SbqJd5zxAV3CTVdgrQ
	DEGLwRHRinP9ERvpM3b1bFW6WLPe9u47RUuJKHdF+csmag006PulgB1McYoDneejNQjjexC7T+j
	S5kZBTFqUucBrE36dyl0wkvAa6qU=
X-Google-Smtp-Source: AGHT+IEPfMvPIjQkSsy7ykDMHa8W0AhVEzi693X/F/36Z2BH8yy0hj0ON8rMYg2Ar7AYwgJeVu83V1dyrd13iJdE578=
X-Received: by 2002:a81:a9c3:0:b0:6eb:3f6:bc20 with SMTP id
 00721157ae682-6eb03f6c8ddmr50221607b3.41.1731415766767; Tue, 12 Nov 2024
 04:49:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9282f078-6e81-1854-8b8f-fc8ced869ad4@quicinc.com>
In-Reply-To: <9282f078-6e81-1854-8b8f-fc8ced869ad4@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 12 Nov 2024 07:49:15 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7ojDSS2gpfrCPpi3_7edjErWn4jykTvb9jesW0Je2EFA@mail.gmail.com>
Message-ID: <CA+5PVA7ojDSS2gpfrCPpi3_7edjErWn4jykTvb9jesW0Je2EFA@mail.gmail.com>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 10:58=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.c=
om> wrote:
>
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3=
fe:
>
>    Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/quic-jhugo/linux-firmware aic100_1_18_2_0

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/368

josh

>
> for you to fetch changes up to af7f6e4f72a11e8b2604ec476a1fea087b33d27b:
>
>    qcom: Update aic100 firmware files (2024-11-11 20:47:16 -0700)
>
> ----------------------------------------------------------------
> Jeffrey Hugo (1):
>        qcom: Update aic100 firmware files
>
>   qcom/aic100/fw1.bin  | Bin 1571360 -> 2135752 bytes
>   qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
>   qcom/aic100/fw2.bin  | Bin 771016 -> 783512 bytes
>   qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
>   qcom/aic100/fw9.bin  | Bin 750416 -> 762704 bytes
>   qcom/aic100/sbl.bin  | Bin 805808 -> 1048576 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)

