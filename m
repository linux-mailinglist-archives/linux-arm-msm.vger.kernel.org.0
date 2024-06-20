Return-Path: <linux-arm-msm+bounces-23411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B3910DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CF0628137D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 16:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69701B3732;
	Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uI+t2g5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23241B3721
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902512; cv=none; b=h+lxrSjR60wx0G6LUwpal8E65uGwrYvGJ2/BPdcRLSusF/QUA0a21pjXpc/EROVCemdhZf/wMtsapBAP2i028+XJeWO6eiG5srCYwcQ10SyKzZluSI0Hj4txqXlk5BOzamWUA+NDdqTCMo/T4wtgFJmIK5b+nGGmjxHrhqZQ4Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902512; c=relaxed/simple;
	bh=DEnJDlxI7ouq96kG4nCeuDwbggk9NVBb52c1U9fIEjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8rBAEV4QCeiIIue+pSD19tCbObysvRyoblWCq4UgDnrVU8wOUxUg2zQCBQUYeNuuc0TfMnw5LapN4oQIR6703cy7pB2U7iaFfuetIK9QK6rcVHyxsc9Rss1ooqMWJB0S6uV+QwvhG0kLuOklzZbYUUBHiRLXaszHx19yqvdJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uI+t2g5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2701DC4AF0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902512;
	bh=DEnJDlxI7ouq96kG4nCeuDwbggk9NVBb52c1U9fIEjU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uI+t2g5l1BFfPdesTtSIFTPaMgfMR6HezZqGoxJ/ovjrLyDXBVjSTS0clU6o7eGit
	 5nLIMJVDtfvuZYwHNjC2LBlyvMo5oUiwrJ1SnAfnSX0n44eCynfcYOem8ycmEgFxQA
	 GWcc++mkLrhv4uXqfXtKbn9+ehgNMps642mw+Wzza7ebmO1tLKhIxoZD5B4gSwHv4N
	 dXtNetBP71s3d5Wodek/EAnTZT2jY6h+buy4pPr0z86iyXOigTs6AHmfMb4iyw9IFd
	 TsuqQG6DL0KCg/vhkAgp98Jj3MbZbuVDpVMVhrNNjyfrHun0qyN5jBk+fOTYafZawT
	 DDYEDqQuS3pHw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-63bdb089ffdso9503207b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 09:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRx3ONJ1s3NdVra/2OT0b+GDVt6tDXVe63Kf8jISsh+2otfakpgzv5UBHaPtpurVPmNYi+8EIsNNj1KvJCw03d4qW1M4daTZ28xVi93w==
X-Gm-Message-State: AOJu0YxewItNVa39hQtbeRTpPSPb3tmyNld5gd6Mhq+c8VaBVDwUp6ou
	ZDcBj+AgwEJLGrKyKBQJxxa2DxI2/FdShL24g6sV6nFnKnzfDhHM/oA2cM9sgScVNv8IFzQRMCS
	2NUO9pIUiSSUi6uXVvYN0J6eXxsc=
X-Google-Smtp-Source: AGHT+IEcr3aOuT1qTMt+LOxl8yiBethc9VJtr9f8RnE9QvExWNaQ0rHzl1p3jcDr9H7hGczigEfcRpCwz/UvJ5GjRhg=
X-Received: by 2002:a05:690c:988:b0:63b:c3ed:f171 with SMTP id
 00721157ae682-63bc3edf56fmr39145767b3.35.1718902511249; Thu, 20 Jun 2024
 09:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1c0d33f8-6cd7-e7f1-b130-09b6279cd4bd@quicinc.com>
In-Reply-To: <1c0d33f8-6cd7-e7f1-b130-09b6279cd4bd@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Jun 2024 12:54:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA72zBGVp7CFR1T6irDzKvzh1axmL=RCuLiGe-EQJy6exw@mail.gmail.com>
Message-ID: <CA+5PVA72zBGVp7CFR1T6irDzKvzh1axmL=RCuLiGe-EQJy6exw@mail.gmail.com>
Subject: Re: [PULL]: Add firmware for Qualcomm AIC100
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:06=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.c=
om> wrote:
>
> The following changes since commit a34a7ad5014c2b833c6a2c0f89357f98a0bdda=
b0:
>
>    Merge branch 'upstream' into 'main' (2024-06-18 11:34:55 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/quic-jhugo/linux-firmware aic100_1_15_4_0

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/234

josh

>
> for you to fetch changes up to 335a6a3769201aca271c7265b43a092b4a616aa0:
>
>    qcom: Add AIC100 firmware files (2024-06-20 09:48:59 -0600)
>
> ----------------------------------------------------------------
> Jeffrey Hugo (1):
>        qcom: Add AIC100 firmware files
>
>   WHENCE               |  12 ++++++++++++
>   qcom/aic100/fw1.bin  | Bin 0 -> 1571360 bytes
>   qcom/aic100/fw10.bin | Bin 0 -> 249439 bytes
>   qcom/aic100/fw2.bin  | Bin 0 -> 771016 bytes
>   qcom/aic100/fw5.bin  | Bin 0 -> 24576 bytes
>   qcom/aic100/fw9.bin  | Bin 0 -> 750416 bytes
>   qcom/aic100/sbl.bin  | Bin 0 -> 805808 bytes
>   7 files changed, 12 insertions(+)
>   create mode 100644 qcom/aic100/fw1.bin
>   create mode 100644 qcom/aic100/fw10.bin
>   create mode 100644 qcom/aic100/fw2.bin
>   create mode 100644 qcom/aic100/fw5.bin
>   create mode 100644 qcom/aic100/fw9.bin
>   create mode 100644 qcom/aic100/sbl.bin

