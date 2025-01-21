Return-Path: <linux-arm-msm+bounces-45745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF7A1875B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 22:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65B2188A0F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 21:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDDB1B4233;
	Tue, 21 Jan 2025 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKi3ecmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3FF1B6D15
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737495194; cv=none; b=shLGqkBbr6JdcVwt0XyrypQKGrtW2Pi4uRXdSaFGQvmXKwlDAFaASYrQrfwg1uznVSPNkAyIvFMsuPFXC2Q0xPDaprZkfrsPPU7bENJL8IOUwf69nEQpElY/aoot9pJNacu8KkLhFDhhdTacrycI9eTNpelRYaUW0AVbHZM2JRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737495194; c=relaxed/simple;
	bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHQFI4tzmQ9w7Qq7zePx83qqJaCVKVJTvwh/3JQ/Bvnn7Kguabu5frhsqW0GnDLyWqupqqCZEF4hgiRRHxQwZtiUw4dNFtSzauSoPWeUgXJGeV9mQuOIXRfnPSbhfm8GvqsvaNGYJXk8V2Ao0dshFKmyDiTUJkedYMm0GslqhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKi3ecmz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee4b72d4d8so1267645a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 13:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737495192; x=1738099992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
        b=XKi3ecmz+MB28mpAeBqWyZ7VXqh+wF/Cazu4X3A2UMv1NWPBz8kXKSQAapa6WiZvta
         EeW5sCiXL9UAflCM2Uo61+2Qfip1AULYsa6efUeuLOE8AVaC/MMT5Si3/74l5W6pE2qa
         0Ru0m3sH5EVUHaSUD2/rXVYk31Y7pdSDAfgxXc836v/3ihHjBe2Iayc860VW2VrBmhcz
         xswfpwD8+ys9d5yLy9qKTIl+8sQ/+119sP+EBH4Pvz1gEBv1Dx9PS8Js9zxmCSUp+nND
         j/RU2s7dBA9z+qDQpt35eFZTGTUQXpMRKnB5KWPUTjFvbO8mAiQbwHX2tIYojDroTf9H
         4z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737495192; x=1738099992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
        b=cMbOe+yh4xHS6l/mZ9CSEvCVA7+zu+BBuy8LptqqlXPT0SUULHzWflai17yWKMtUzv
         mbgNdXQz5BbAR5wC5NnpDdM5ufFQJcFhm3Ef7haOaZ+fsBj9eZyWJCdUqf9TIkBfkTs9
         bjMf+GZtRCNQmGmfgOSqAG6/zmGeuFTestzRqIoDbP1vhP6e2X2dNzuOjZP70TkXs6K/
         gR6OXlcaO3PpIq6a8tkvudHN7O6ShE1Xak4h5RYed3g3PIp5qk14jwVdK6sYcCnqinNd
         AbQ+uefdunMz1loqqPKI+wh57j0uIPCIVDOQnKFOeruLyskjYDP2mb7LiTJjICehpF86
         9w5g==
X-Forwarded-Encrypted: i=1; AJvYcCXTASn8FgmiIUfTFoHzpB77bFVr3TJVhgN3RMlJqjMQJSfBYI/yBk43e4+ap1tyMxAZmKiglFQbDhyfKo8b@vger.kernel.org
X-Gm-Message-State: AOJu0YxojVct0nut3+PhxnDPLQ+Cp6a4QNWEb+Y3KRDjc2pnpl9CWKwI
	plfhSCYnukI0AueOrJAeBnvZ8JHNsavegCpCg1DtHdrPXnJfppsfZd5QmllgcrjfspKwh1c/v68
	csuN4Q+UUMmSBLCmPi09UMVQxBWA=
X-Gm-Gg: ASbGnctEf9JpZGvXWS6bb82R3/SMIWhwPxDyrwEUboJ6Ewpkx7WZj07WIdGXJ/r4VQA
	86BuVliyZD2UUSUv9gcShsc3aA4eVQz7rTEeHCQqRWce8ilsCJGA=
X-Google-Smtp-Source: AGHT+IEcjzdGu7qYqGn5N4xEYIBOsyWiwpCUBMJHTPuLbHn2zBtCvYF5lxRNHxNZ86fRxljxMK5FHYvAnIcG7/4OKIA=
X-Received: by 2002:a05:6a00:2e14:b0:725:e499:5b9d with SMTP id
 d2e1a72fcca58-72f6ab9b6f0mr666087b3a.3.1737495191872; Tue, 21 Jan 2025
 13:33:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
 <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com> <20250121210818.GS674319@ziepe.ca>
In-Reply-To: <20250121210818.GS674319@ziepe.ca>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 21 Jan 2025 16:33:01 -0500
X-Gm-Features: AbW1kvb6ejz0Edpb-LSeUnSnuaoYq5_MYqcriJkrf00pfJrPDWvH4y-7_JTCMIM
Message-ID: <CACu1E7EgYzsU1AJfi7MJ9QjX8mypPw0mxcCkX-H59hSaDFnd5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: Temporarily disable stall-on-fault after
 a page fault
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 4:08=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jan 20, 2025 at 10:46:47AM -0500, Connor Abbott wrote:
>
> > To work around these problem, disable stall-on-fault as soon as we get =
a
> > page fault until a cooldown period after pagefaults stop. This allows
> > the GMU some guaranteed time to continue working. We also keep it
> > disabled so long as the current devcoredump hasn't been deleted, becaus=
e
> > in that case we likely won't capture another one if there's a fault.
>
> I don't have any particular interest here, but I'm surprised to read
> this paragraph, maybe you could explain this some more in the commit
> message?
>
> I would think terminating transactions and returning a failure to the
> GPU would be fatal to the GPU operating model when the entire point of
> stall and fault handling is to make OS paging transparent to the GPU??
>
> What happens on the GPU side when it gets this spurious failure?
>
> Jason

It's touched on in an earlier commit, but OS paging is not (yet?)
transparent to the GPU, and we aren't using stall-on-fault for that.
Instead we're (ab)using it to stall the GPU while we capture a
devcoredump with the state of the GPU when it first faults. Stalling
prevents the GPU from moving onto another job while we capture the
devcoredump. We only keep one devcoredump at a time, so we don't care
about subsequent faults until it's read and deleted by userspace. This
idea is taken directly from downstream, which I suspect is why the old
Qualcomm MMU used before MMU-500 violates spec and terminates
subsequent transactions after the first one stalls - it's helping
downstream implement devcoredump without this workaround.

I can add some of that context to the commit message.

Connor

