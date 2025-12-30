Return-Path: <linux-arm-msm+bounces-86988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52978CE9F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E65A3022A89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F1F261B6D;
	Tue, 30 Dec 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsmPg4QA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540F238C2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105161; cv=none; b=WonyPqYKbvjwCe/NY9O2zOUzHGiVpXJ+f8qFzvNximnCc829u9+7CqZ9w/TiECbLd+cys/GnfmmEX3UuTDzJEdDPCbhSgWkWafyKixceMBF8rTR2y5eDH81HcvscmIadu87/j3WW925GuUkkFmu1bJzAhgLxEHodZVzVRaceE+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105161; c=relaxed/simple;
	bh=PtJu53mXyEr0NB/wszovXNAt4ZNlbhv3lN3d5iHaor0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiYSPLloszx9TvaUqVihT1axtZGC/Drv2qDLO3CGd68D4A4+ZIhCPOoO1O3Vp5P2OCquXezWEGYMB7NJexyPRCc4L+F/m6RfR69Lf9KB+zBS+2oPoKBhR7oL+nRw8NDxIZkC6x2wL8S1mjwrb3lq0erpbHzm0o+2mqHaHtCChYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsmPg4QA; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fc174ada4so59684727b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767105158; x=1767709958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSkwRLVE9VrSjR+5xR92dNYRiZIVMosiuZNfExME9q0=;
        b=rsmPg4QAUN1IjzZWMjJbkoyt6LIQzpPeciOWZGygjhMyXo/4ZAqSJ9FK6Qg8DLfX4f
         YzNYRlMlfTIVzCx+m/iIQt7qRqjcxdKBMbOx9JjTP8Jbhfh8LxeIxazAKjUDxcxZF5/r
         7wgCcuFLn1UGFLrrl9GcoaFb4QHefyTNxY4ieqyTJh5umeZrGn2EjFFWuEk6sSoecPQ3
         OXphOM49Y9zOOuOI/beBwdNo+1A5eLe/L8lrSbY56ReMDjlHjPeFq1S+jyHWhxKEhZ7S
         lHJ76jRg6jd1rmVBf8hrVhAXYXHR5aROTndrCnCCUAGXNJdvXO7iNZUaWRSriEeueSWi
         Lovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105158; x=1767709958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSkwRLVE9VrSjR+5xR92dNYRiZIVMosiuZNfExME9q0=;
        b=UnbRyNPAm/l3KhDQt4dikfNvtqu7dGP1gwmFZ409Sm34Dy5F3nP6JOxxTayvFC8qYC
         TxN+OVO4KQ6/5yrvkMjLy9GEfuhHi3WlgYB7EW5kKd9WGhuYjK3x5FhUwpNdn4B+qR3S
         CEseETjkRGldJxqvZfiPUeAI1EIrfCXffEqYJ7FvTIYxWMoAHqrt1lI9MWySqm+YaoA6
         GgUsR4J175LlKGusqacbiHdrosFd3IR/jpPRaxKH8ZZtTq4dBEOHM0lw17A7kDt+FXvT
         RAfbaxYq5hpqbcZ8YqUw7genbMgCPs56HeFepRuguJITwUi8uEWOuXRKhdA/TrYXVX+F
         c76Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR76TupYjP5bHXryHmhwZlOorStVBRnz+oeW3GvEzpYIhUnL1nT3PLUySfAhIx9Bna7dg5YNZy61+eYVTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9JmmADEVLZTGMDPebKpDBYb8mYdYSQDX5M9RXrC5G/SZGPsg
	E/dF7xRH6Sh0xlh1a+SsLFkOjRte7LbWosqcVqLHWcy5LCxpoe6vrUm2THkT/pPJ6meqkAvOALy
	wXaBZ514shWo/g4zHots0CAmvXlwqTWirZTj/HxFQTg==
X-Gm-Gg: AY/fxX45JQAoaJ3UaeBJhHidkvTCtlTHizMv+a8E/wLxu5Xs0mgTPYmJ8uaoVnYdqtA
	E4XsCck4kDiWIOousafyL4ClNG2qBDORH1r2rCyR7HT1QLbL9Q9Elkfc+OybTkilbUp/VLf769u
	RkLevvJujYNMHA+OuA6R2D88flmQmkBwpn0SftEihGD7eYpQkcVmbOXs/qymGhi+Vsl0wMUJjzH
	H1/w++VJZG5MuS5wNLFubEQCUJ/M20RmuHwEneFSHUlppzJYcATtBxRZ9WNGGb1qfInT+yCLIbN
X-Google-Smtp-Source: AGHT+IHR18VvsLs1nl1FI/8Mizrat+UAk6qQegi51DyfihMb2zEmH8+U+TFvduNyE9VI1PkTzsqEJR/Kv2BRtdYEd1A=
X-Received: by 2002:a05:690c:4906:b0:786:8a25:9967 with SMTP id
 00721157ae682-78fb4055f74mr328748247b3.50.1767105158254; Tue, 30 Dec 2025
 06:32:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 30 Dec 2025 22:32:26 +0800
X-Gm-Features: AQt7F2pder1aDAXyO4fWmBxO47QfPmM7UldDpCc1-yoDXdXmkNxifwGcHw_nm4g
Message-ID: <CABymUCPi6e0NUKcmf6ArY1qtMj29BU91kzyb31_RHqXNffxoCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Abel Vesa <abel.vesa@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=BA=94 18:39=E5=86=99=E9=81=93=EF=BC=9A
>
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
>
> At least on Hamoa based devices, there are IOMMU faults:
>
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0x0=
0000000, fsynr=3D0x3d0023, cbfrsynra=3D0x1c00, cb=3D13
> arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x1c0=
0
> arm-smmu 15000000.iommu: FSYNR0 =3D 003d0023 [S1CBNDX=3D61 PNU PLVL=3D3]
>
> While on some of these devices, there are also all sorts of artifacts on =
eDP.

Hi Abel,

Could you help check what's the pipe topology of your eDP case? I need
to reproduce the issue.
Or could you help share the content of
/sys/kernel/debug/dri/ae01000.display-controller/state?
Thanks!

Regards,
Jun

