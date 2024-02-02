Return-Path: <linux-arm-msm+bounces-9543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB9847054
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 13:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A5D8B22232
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 12:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F956145357;
	Fri,  2 Feb 2024 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfLV55OP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86C7E76C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706877039; cv=none; b=QBqV4vhusAc8zr0WDp9Bu/RQVnlDb8ohw9iD9FstSydVslF0KLZr+jlCo4p500uk+k/hwqCDosZ5Nn8zBWRNLs4tFpmlkde/+guuI8VIehuMdPYFs6euUtoTBx6xrCN+iApI0MmCWFkABjfJ0X/Kv0FJyEHv/jEGTrrH5T+LVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706877039; c=relaxed/simple;
	bh=n/8t2hkry3zhXtB7QBzdYb2sWAf/LHBGKqsFB6lD/2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLoYIb2ueTHV7J+fZzrtx3d5iL/IIUNVlfva42lHpkZAVqfo2VjqEaKRIzgkqfBrihhQWoU96XeYwUwEzgs15vcB1GEBHGwrDSiKb3KZiR1Nww/ycUIpSzLZXXvaAXo5BX4PSTz3GmopL/4atQwl5blCk56IN5XoSmBT/ITBjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfLV55OP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6428FC43390
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877038;
	bh=n/8t2hkry3zhXtB7QBzdYb2sWAf/LHBGKqsFB6lD/2o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HfLV55OPyUQWEwYbMVfUUSt/4Wc/IYMpKtZyFPdPq54zLu+uoZVfZxLW+rd0uScSY
	 7sir7695iJEjEgbcXEiLhSPvwTAJvdR4N9eK04og6bOQdQ0mzJEcE9X3+8OriOqRm6
	 zkPsKmaURRZNVgZO8jr5G2CrNAmj0fJOBGS3p7TKj6R/F4wehSIareM0i3g9shpFsH
	 PmW1V4FgWQB2dnv1FXLs8m+0fMNZrK7mBNN6I9zJPLns2rbRcDxKRDHswKhRktrCs0
	 qKa5pGQfyXbVUBMuzOaU8D/PArGENRH/EDDoBnalR80zlkQeRzj6G0ZFIZADP5iBty
	 KwRSiKPobIlug==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6e4a55a71so1193652276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 04:30:38 -0800 (PST)
X-Gm-Message-State: AOJu0Yz068Q0/MVhSXvZNeRWG5LUOHkjofyGYworsNG8DG/tAX9FWNVu
	N1RxbBa44eqSYQ4kxIs8s8vAcds2DD4ieI1AQFt7GbcKJBlIep0LHsmD0Sa65G+OTz+MhuBspaq
	SaqDpEwjnAqZPgMF3qn4jWYKqf7s=
X-Google-Smtp-Source: AGHT+IE/R/6fbfF/iZFpG1E19S9PMCx7mKmQvc7REgzVg8Py6ryrbabI9jRUisLrv2UjZe/Mr7NlpRZeoUFFYODNeO4=
X-Received: by 2002:a25:698b:0:b0:dc6:b974:68cb with SMTP id
 e133-20020a25698b000000b00dc6b97468cbmr5420828ybc.31.1706877037562; Fri, 02
 Feb 2024 04:30:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
In-Reply-To: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:30:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7zNt4hrpDe=HimSqyqnTMZO5_Mzh7hBuD9MBx14DHRTA@mail.gmail.com>
Message-ID: <CA+5PVA7zNt4hrpDe=HimSqyqnTMZO5_Mzh7hBuD9MBx14DHRTA@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 HDK platform
To: neil.armstrong@linaro.org
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 4:37=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456=
e7:
>
>    Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55=
:30 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-hd=
k-audio-fw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/139

josh

>
> for you to fetch changes up to 3be2e165e5299f0162003d4c5eaa2832da4c30bc:
>
>    qcom: Add Audio firmware for SM8550 HDK (2024-01-30 17:36:03 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        qcom: Add Audio firmware for SM8550 HDK
>
>   WHENCE                          |   1 +
>   qcom/sm8550/SM8550-HDK-tplg.bin | Bin 0 -> 24296 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/sm8550/SM8550-HDK-tplg.bin

