Return-Path: <linux-arm-msm+bounces-43911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B756BA00D88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DD83A47B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0B1FC109;
	Fri,  3 Jan 2025 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSi1kgYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58C1FCFD9;
	Fri,  3 Jan 2025 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928218; cv=none; b=bu53uEAcj2l+b+7jYTNohENEjtO4l5tzFgetofY6dXxWgvhPrYzTXiNZX0u8cZWkWVL34I/24ORVgVeR/k3rklNQJkEAv5+o5MXAGfe6IVOvEO6TM8xZHI4qtQCbVUiN3RBMIn9ugaBWBW3e3kwzOV8Pl6qPSrLiGnOKxY/P/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928218; c=relaxed/simple;
	bh=8ZRxQBwY6b/olGpKehwm6xum2J+FNJPoX+p5VhHODY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6injreCamAirkI6deYXcArw9Q/ndIMotAxZpFXBbahXR+wqF8SkbXxAZ3/kcqQMjpyZxaNcKVMt29lS3Ak3gmbJ2hieqLaBbbGIcb5c8qe3xaJvCRxTrwMmQ+KY/JYmrHl2VMYGwdSUB6MBlOToeK3PATeeuhVcD8qaN0usag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSi1kgYq; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a8160382d4so39626705ab.0;
        Fri, 03 Jan 2025 10:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735928216; x=1736533016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn5PAch7XdWTWHNIRarY/0lUl5EQINJyEEFjNVV3NLk=;
        b=CSi1kgYqVeS0dh0z5X9cY0rUDd8X6w1eyCw3uqHFVwkuKJk9DmYk18ZqdZl263nSoC
         wdAB/JAaRUEzdbnnbenGAsvMkYmehAz5GqfWuMR7caVBGk9VmPaxs8bOI+WPvw0r+Pac
         MFvppVWXjdB2TbebGpC9pXbGZXfQTVM1MmGsBRf898q9T8TRL/fkWV8VxHI5CaX6aOMv
         tEI0YPDT0nehNu9/ySGzPIxdmfHh4ZCfPz550agpUem1ii/3R4zR+XYUjFmiduEv0uDK
         +cVYId3Z9d7D5+MdEm2ivTkaIgS5yhJE7bY49dqToKtJm1ojI8QH+FC66FdNJqB+lo+l
         fLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735928216; x=1736533016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn5PAch7XdWTWHNIRarY/0lUl5EQINJyEEFjNVV3NLk=;
        b=UWv0xGwJRVMHiLqF8RtDLUAnzZpNxQPM7PO/Ms1uaneLVbZ/U2QAuy76po6zvax1VK
         nHilRh0+Kqi5OIGREdaL0i7XeEEqWEoDkB5lc+gh+h9iX9QWPYAI3CQFtMz6tJDbChXZ
         C6ms6Z6uwbIiJ7mNegbnnPN5hXCZdQPmGVtz4pxsTwq8ZibaBfU96NiRtdDbAiwRiuo2
         i0a7Z6z1yQPKrq223GNkGeMx3wKZKS3Rlid9GVr5v1On183b03KYiSwW3bIa8tDxb2Wa
         pMudNTrvTCUob1FdgZ2ivHYZUGYGzgQmjZk32sbl3uWgX5r02g+cDzEWjqJQkTsrFKgh
         mXhA==
X-Forwarded-Encrypted: i=1; AJvYcCVSpS7SMHQvZObWTbRGC0sNYBuTPE4WHNpvTgCamsZVwkt/7+4+P0e25zBcnF1xvjGqRXrohi6PkiI09WsL@vger.kernel.org, AJvYcCVxu7FA4q0cbEmeeUWiV6J8PmxXZI55J+85RfdtoUDFz9UIRqN31CMwZKh50a88WL0Vh7p9t26Dpjes1qIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHU8UmPC3OgY7D2kW2bfqtYDceWDsyBwvuzJwmI1ALwbBu3KC
	Dlcj1kvQ9UdcHvDpgzm7CQ3k/IjrLli5ZOvc9enRsGi5/ROPl29uQOV9Zm3qb8hpKS0TFd96Nqx
	6sn1NtMMnUDyTC+ThbZkL8eAuYwg=
X-Gm-Gg: ASbGnctkAn8TrIWmGBx9KXO6o0GGDwxsqF1fNmleuedkye/EezripboUX/EUmoCesew
	fWJQTEuWfaRch8crk9+XTuf7uk8ejaDYngaIbkZ6QVn1awQWIzuAMfl6e1SL4rD0SdX8N
X-Google-Smtp-Source: AGHT+IFkvWah3qxhzEMeR0lXa3avHR/olEfCKY9qWp0cniyQbDoTluhhzT5PfOFVB94chXa1QUUdUshg5EOLFdZeUdA=
X-Received: by 2002:a05:6e02:194a:b0:3a7:7124:bd2b with SMTP id
 e9e14a558f8ab-3c2d514f8e4mr434511105ab.15.1735928215590; Fri, 03 Jan 2025
 10:16:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com> <20250103153716.GE3816@willie-the-truck>
In-Reply-To: <20250103153716.GE3816@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2025 10:16:43 -0800
Message-ID: <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robin.murphy@arm.com, joro@8bytes.org, 
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 7:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> (please don't top-post...)
>
> On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> > On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > > This patch series consist of six parts and covers the following:
> > >
> > > 1. Provide option to re-enable context caching to retain prefetcher
> > >     settings during reset and runtime suspend.
> > >
> > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > >     pointer to qcom_smmu_match_data avoiding replication of multiple
> > >     members from same.
> > >
> > > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface=
.
> > >
> > > 4. Introduce intital set of driver changes to implement ACTLR registe=
r
> > >     for custom prefetcher settings in Qualcomm SoCs.
> > >
> > > 5. Add ACTLR data and support for qcom_smmu_500.
> > >
> > > Changes in v18 from v17_RESEND:
> > >   - 1/5 : No changes
> > >   - 2/5 : No changes - reviewed-by tags collected
> > >   - 3/5 : Addition of
> > >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> > >     around register access of PRR related private interfaces
> > >     as discussed in v17_RESEND.
> > >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> > >   Link to v17_RESEND:
> > >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@=
quicinc.com/
> >
> > Thought to follow up on this thread to highlight the latest version (v1=
8) of
> > this series, in case it was missed during the vacation period.
>
>
> I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
> the previous version.

You mean 3/5?  The latest (v18) lgtm, a-b

