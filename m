Return-Path: <linux-arm-msm+bounces-51068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89DA5D050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 21:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CED87A6C77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBF222F169;
	Tue, 11 Mar 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNWQIyCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884E25CC6B;
	Tue, 11 Mar 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741723424; cv=none; b=RmOYtK8LjMftOlNRyRlRFC/Ta6v3YxCnf+4blPfYQ217OCA+MRP3VeqDRshDlwoULRcXGMJoqQVd9jHfOQoG+hSs3q2FjjL15XrJg1T5Bwufp2sOVnHhIMJOmUKU6fp8RNqvf1zeQWbsdxD2KC5mY1/ngZZqk3g65GNJXOUdCZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741723424; c=relaxed/simple;
	bh=/Y1uKhocepPEVr4gRndRQFJfp4PlO9xpVDQBkK0VWtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvH9pQcfNegcnIE0EFehoLqHyu5rwXjppPc3ihxDsSvTuwEv2o6JO8MUXm5xcmmA+riRoUdaJR8sjEpVgeHaawPmH68xP8lCXjLP3TKV6bxabusJsRYJOiBuT+v0knOBipmd9mAirgWDjRxRrFfvkzQo0QgmON2oqIi7HCzGhhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNWQIyCS; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso47356825ab.0;
        Tue, 11 Mar 2025 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741723421; x=1742328221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW523EAS3Rk6Z2Gf4pN5+J61D3es3lTSy0uI9oNxP9Q=;
        b=SNWQIyCSjqPx8dCgqabzxh+CoawTNkIF2jSmU564pdpmCepWoxNjvMOMA3VgphLXUv
         8qUdlP1O75MLGv9T8jx5gQRvGUuwQ91ub1POjxLblVLMDItOA4B71TAtGrPnJ/s6FMpj
         DfKsLG9PNCKpa3DM0bgkSCUx6YcXpFZUTWO/LePyPoqCRroRNF5wfm433kJ8mpQyYI3Z
         iRPZ5oiBsqZO/19jDPdFAUsustT8n4Z4vuCxkcsH75F/90+7QwTcyoK+7D55lzgcq3iI
         Yl7xeTGT00PvHDNm8BT0KXvFWBk0ViNMg6exQWedhzAN92MASeI+x6uhUlyDFQjDTP8E
         3jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723421; x=1742328221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW523EAS3Rk6Z2Gf4pN5+J61D3es3lTSy0uI9oNxP9Q=;
        b=op6rUpLdC0AiL79IBUIcIPgjuvbmmamP6SUKN7qHDHk99jU/dI+YLJ7bnWh4FtWamq
         o3kkLnzOw2DDwOsygIZDb8Ouek7ipekodrd2MY1Be9x45/GP6enXs8ypEHxnWeYe1BE+
         5yhFyQrITjF0VRDdUSR+SRpX7rLFWtE4/pA5+qpYBzkuub7CS/XsGcqgUNXjtrnDoMJI
         UDqmPWC0soLOk5iMXD6IH5JWrlrcyz7tQ5H74GRGizdAk0n136kZ6F3ceHLPKZHiReTu
         nYxB5fS8JvngS80SOB9U2p+j84GjnBzzHvcMTdt3kKxbGgDCpdQCJJfHtgC14fPHIQee
         Xx2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJhwH3YWke2Pt8VZASbCCwk/fojT5Fc2Tq4yYE7cXAVyQPFbuuQef1fF8kM/KOkiXSMiSmSG8rzxRHgTtp@vger.kernel.org, AJvYcCWf2aWYlYm7DLp0GKgjsNQCbaidwGw7PS2dvIwAP6Yx4GEeZfnNQavRqed9LLaX74p4yNZJpAbkSlDblgMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5V/Y3tKLmdONpVomZSD4iQtB2/jzO/SZyqJwGVXmnOhQ1Qtp
	dQorStnmRwDIJTQppZaPxWMLK7DneRPj6YmWDKOICTpC2wMgWbN3m3CD8f+EUoehkK/oN2RW9Wu
	/sO0DlefDI/Badm1rPXKUBmre+Wg=
X-Gm-Gg: ASbGncs4KgnhHNV9M0JMlhD/G5tXyU2UuQeUBdPgpsNZomapYg7owmsR1ja5ee7gxBz
	TnclCZnn86IaPRVt2efBJ3dDAmaY+BcDK7kNs2hWkyKMIv/wGoLDQG+solaZzpRPdiireSvgvAb
	pLvniFcs2eeOhQFtrKZvR/oBQrdYzFvT3iWgba3KSd8027YgUOraaoLiaS
X-Google-Smtp-Source: AGHT+IFYEIdqAXj57O99Zh2iip2gE6hYr3XolthP5tdHAJes3eWs+x8BQxcINUUI2peKOTGt7uFekvG8SKVQk3DUgs8=
X-Received: by 2002:a05:6e02:174a:b0:3d3:e296:1c1c with SMTP id
 e9e14a558f8ab-3d468921f95mr51075145ab.9.1741723421512; Tue, 11 Mar 2025
 13:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org> <20250311175528.GA5216@willie-the-truck>
In-Reply-To: <20250311175528.GA5216@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Mar 2025 13:03:29 -0700
X-Gm-Features: AQ5f1JrHvI_RF7xvW5BrP_PBmrcW3VTWeSbeCSaeqxqwJS9gRSEMDCWlVX4sKfA
Message-ID: <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, Bibek Kumar Patro <quic_bibekkum@quicinc.com>, 
	catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 10:55=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > This patch series consist of six parts and covers the following:
> > >
> > > 1. Provide option to re-enable context caching to retain prefetcher
> > >    settings during reset and runtime suspend.
> > >
> > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > >    pointer to qcom_smmu_match_data avoiding replication of multiple
> > >    members from same.
> > >
> > > [...]
> >
> > Applied to iommu (arm/smmu/updates), thanks!
> >
> > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
> >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single po=
inter
> >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> >       https://git.kernel.org/iommu/c/9fe18d825a58
> > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> >       https://git.kernel.org/iommu/c/3e35c3e725de
>
> Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> linux-next yet. Is there something under review, or should I revert this
> for now?

It is WIP, part of a larger patchset adding sparse binding support in
drm/msm.  Please do not revert.

BR,
-R

